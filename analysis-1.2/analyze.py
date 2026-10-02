"""Static Blitz analysis. Run with python3 analysis/analyze.py (requires Capstone 5)."""
from pathlib import Path
import struct,json,hashlib,re,collections
from capstone import *
ROOT=Path(__file__).resolve().parent
b=(ROOT/'original/Blitz.pef').read_bytes()
def u16(b,p): return struct.unpack_from('>H',b,p)[0]
def u32(b,p): return struct.unpack_from('>I',b,p)[0]
def cstr(b,p): return b[p:b.index(0,p)].decode('mac_roman')
def unpack(b):
 p=0; out=bytearray()
 def take(n):
  nonlocal p
  v=b[p:p+n]; assert len(v)==n; p+=n; return v
 def var():
  n=0
  while True:
   c=take(1)[0]; n=(n<<7)|(c&127)
   if c<128:return n
 while p<len(b):
  c=take(1)[0]; op=c>>5; n=c&31
  if not n:n=var()
  if op==0:out.extend(bytes(n))
  elif op==1:out.extend(take(n))
  elif op==2:
   repeat=var()+1; out.extend(take(n)*repeat)
  elif op in (3,4):
   custom=var(); repeat=var(); common=take(n) if op==3 else bytes(n)
   for _ in range(repeat):out.extend(common); out.extend(take(custom))
   out.extend(common)
  else:raise ValueError(op)
 return bytes(out)
sections=[]
for i in range(u16(b,32)):
 vals=struct.unpack_from('>iIIIII4B',b,40+i*28)
 s=dict(zip(['nameOffset','defaultAddress','totalSize','unpackedSize','packedSize','fileOffset','kind','share','alignment','reserved'],vals));s['index']=i
 raw=b[s['fileOffset']:s['fileOffset']+s['packedSize']]
 data=unpack(raw) if s['kind']==2 else raw
 if s['kind']!=4:assert len(data)==s['unpackedSize']
 s['data']=data
 (ROOT/f'section_{i}.bin').write_bytes(data)
 sections.append(s)
l=next(s['data'] for s in sections if s['kind']==4)
lh=struct.unpack_from('>iIiIiI8I',l)
keys=['mainSection','mainOffset','initSection','initOffset','termSection','termOffset','libraryCount','importCount','relocSectionCount','relocOffset','stringsOffset','exportHashOffset','exportHashPower','exportCount']
loader=dict(zip(keys,lh));libs=[]
for i in range(loader['libraryCount']):
 v=struct.unpack_from('>5I4B',l,56+i*24)
 libs.append({'name':cstr(l,loader['stringsOffset']+v[0]),'count':v[3],'first':v[4]})
imports=[]
for i in range(loader['importCount']):
 v=u32(l,56+24*len(libs)+4*i)
 imports.append({'index':i,'name':cstr(l,loader['stringsOffset']+(v&0xffffff)),'class':v>>24,'library':next(x['name'] for x in libs if x['first']<=i<x['first']+x['count'])})
(ROOT/'imports.tsv').write_text('index\tlibrary\tclass\tname\n'+''.join(f"{x['index']}\t{x['library']}\t{x['class']}\t{x['name']}\n" for x in imports))
# Classic Resource Manager map. Offsets relative to map/type/data areas.
r=(ROOT/'original/Blitz.rsrc').read_bytes();do,mo,dl,ml=struct.unpack_from('>4I',r)
tp=mo+u16(r,mo+24);np=mo+u16(r,mo+26); resources=[]
for i in range(u16(r,tp)+1):
 p=tp+2+8*i;typ=r[p:p+4].decode('mac_roman');count=u16(r,p+4)+1; refs=tp+u16(r,p+6)
 for j in range(count):
  p=refs+12*j;rid=struct.unpack_from('>h',r,p)[0];no=u16(r,p+2);attrs=r[p+4];off=int.from_bytes(r[p+5:p+8],'big');q=do+off;size=u32(r,q);data=r[q+4:q+4+size];assert len(data)==size
  name='' if no==65535 else r[np+no+1:np+no+1+r[np+no]].decode('mac_roman')
  safe=re.sub(r'[^\w.-]','_',typ);path=f'resources/{safe}_{rid}.bin';(ROOT/path).write_bytes(data)
  resources.append({'type':typ,'id':rid,'name':name,'size':size,'attributes':attrs,'path':path})
(ROOT/'resources.json').write_text(json.dumps(resources,indent=2,ensure_ascii=False))
(ROOT/'metadata.json').write_text(json.dumps({'sha256':hashlib.sha256(b).hexdigest(),'sections':[{k:v for k,v in s.items() if k!='data'} for s in sections],'loader':loader,'libraries':libs,'resources':resources},indent=2,ensure_ascii=False))
# Resolve relocation expressions symbolically, without pretending runtime addresses are known.
relocs={}; rp=56+24*len(libs)+4*len(imports)
for ri in range(loader['relocSectionCount']):
 sec,res,n,first=struct.unpack_from('>HHII',l,rp+12*ri)
 words=[u16(l,loader['relocOffset']+first+2*j) for j in range(n)]
 pos=0; imp=0; C=0; D=1
 def fix(kind,index):
  global pos
  assert pos+4<=sections[sec]['totalSize']
  relocs[(sec,pos)]=(kind,index,u32(sections[sec]['data'],pos))
  pos+=4
 for w in words:
  op=w>>9; run=(w&511)+1
  if w>>14==0:
   pos+=((w>>6)&255)*4
   for _ in range(w&63):fix('section',D)
  elif op in (0x20,0x21):
   for _ in range(run):fix('section',C if op==0x20 else D)
  elif op in (0x22,0x23):
   for _ in range(run):
    fix('section',C);fix('section',D)
    if op==0x22:pos+=4
  elif op==0x24:
   for _ in range(run):fix('section',D);pos+=4
  elif op==0x25:
   for _ in range(run):fix('import',imp);imp+=1
  elif op==0x30:imp=w&511;fix('import',imp);imp+=1
  elif op==0x31:C=w&511
  elif op==0x32:D=w&511
  elif op==0x33:fix('section',w&511)
  elif w>>12==8:pos+=(w&4095)+1
  else:raise ValueError(f'Unsupported relocation {w:04x}; do not silently guess')
(ROOT/'relocations.tsv').write_text('section\toffset\tkind\tindex\traw_value\n'+''.join(f'{sec}\t{off:08x}\t{k}\t{i}\t{v:08x}\n' for (sec,off),(k,i,v) in sorted(relocs.items())))
# Linear decode: data and traceback tables inside executable sections are not assumed code.
code=sections[0]['data'];md=Cs(CS_ARCH_PPC,CS_MODE_32|CS_MODE_BIG_ENDIAN);md.detail=True
ins={};failed=[]
for off in range(0,len(code),4):
 d=list(md.disasm(code[off:off+4],off,count=1))
 if d:ins[off]=d[0]
 else:failed.append(off)
starts={0};calls=collections.defaultdict(list)
for off,x in ins.items():
 if x.mnemonic=='bl' and x.operands and x.operands[0].type==CS_OP_IMM:
  target=x.operands[0].imm
  if target in ins:starts.add(target);calls[target].append(off)
 if x.mnemonic=='stwu' and x.op_str.startswith('r1, -'):
  prior=[p for p in range(max(0,off-40),off+1,4) if p in ins and ins[p].mnemonic=='mflr']
  starts.add(prior[-1] if prior else off)
# TOC references are shown as raw pre-relocation words, without guessing pointer identities.
data=sections[1]['data']
# Entry transition vector fixes r2 to data section base (raw offset zero).
mainvec=loader['mainOffset']; entry=u32(data,mainvec);toc=u32(data,mainvec+4)
assert relocs[(1,mainvec)][:2]==('section',0)
assert relocs[(1,mainvec+4)][:2]==('section',1)
stubs={}
for off,x in ins.items():
 if code[off:off+4][:2]==bytes.fromhex('8182') and code[off+20:off+24]==bytes.fromhex('4e800420'):
  disp=struct.unpack_from('>h',code,off+2)[0];ref=relocs.get((1,toc+disp))
  if ref and ref[0]=='import':stubs[off]=imports[ref[1]]['name']
def explain(x):
 m=x.mnemonic;o=x.op_str;a=[z.strip() for z in o.split(',')]
 if m.endswith('.'):
  class Proxy:
   mnemonic=m[:-1];op_str=o;operands=x.operands
  return explain(Proxy())+'; update CR0 flags'
 if m in ('extsh','extsb'):return f'{a[0]} = sign_extend_{16 if m=="extsh" else 8}({a[1]})'
 if m=='clrlwi':return f'{a[0]} = {a[1]} & (0xffffffff >> {a[2]})'
 if m in ('ori','oris','andi','andis','xori','xoris'):
  op={'o':'|','a':'&','x':'^'}[m[0]];return f'{a[0]} = {a[1]} {op} {a[2]}'+(' << 16 (immediate)' if m.endswith('s') else '')
 if m=='neg':return f'{a[0]} = -{a[1]}'
 if m=='mulli':return f'{a[0]} = low32({a[1]} * sign_extend_16({a[2]}))'
 if m in ('addic','subfic'):return f'{a[0]} = '+(f'{a[1]} + {a[2]}' if m=='addic' else f'{a[2]} - {a[1]}')+'; update carry flag'
 if m=='addze':return f'{a[0]} = {a[1]} + carry_flag; update carry flag'
 if m=='subfc':return f'{a[0]} = {a[2]} - {a[1]}; update carry flag'
 if m=='mfcr':return f'{o} = packed condition register'
 if m=='lmw':return f'load consecutive registers {a[0]} through r31 from {a[1]}'
 if m=='stmw':return f'store consecutive registers {a[0]} through r31 at {a[1]}'
 if m in ('lwzx','lhzx','lhax','lbzx'):
  bits={'lwzx':32,'lhzx':16,'lhax':16,'lbzx':8}[m]
  return f'{a[0]} = load{bits}({a[1]} + {a[2]}); '+('sign-extend' if m=='lhax' else 'zero-extend')+'; r0 base means zero'
 if m in ('stwx','sthx','stbx'):return f'store{ {"stwx":32,"sthx":16,"stbx":8}[m]}({a[1]} + {a[2]}, {a[0]}); r0 base means zero'
 if m in ('fmul','fmuls','fdiv','fsub','fsubs','fadd','fadds'):
  op='*' if 'mul' in m else '/' if 'div' in m else '-' if 'sub' in m else '+'
  return f'{a[0]} = {a[1]} {op} {a[2]}'+('; round to float32' if m.endswith('s') else '')
 if m=='fmr':return f'{a[0]} = {a[1]}'
 if m=='fctiwz':return f'{a[0]} = floating-register encoding of int32(trunc({a[1]})); integer extracted by store/load'
 if m=='sraw':return f'{a[0]} = signed({a[1]}) >> ({a[2]} & 63); update carry flag'
 if m.startswith('b') and m.endswith('lr'):return f'conditional return through link register ({m})'
 if m=='bdnz':return f'CTR = CTR - 1; branch to {o} if CTR != 0'

 if m in ['li','lis']:return f'{a[0]} = {a[1]}' + (' << 16' if m=='lis' else '')
 if m=='mr':return f'{a[0]} = {a[1]}'
 if m=='mflr':return f'{o} = link register (saved return address)'
 if m=='mtlr':return f'link register = {o}'
 if m=='mtctr':return f'count/indirect-branch register = {o}'
 if m=='mfctr':return f'{o} = count register'
 if m=='blr':return 'return to address in link register'
 if m=='bctr':return 'jump to address in count register'
 if m=='bctrl':return 'indirect call through count register; update link register'
 if m=='bl':return f'call {stubs.get(x.operands[0].imm, f"section0+{x.operands[0].imm:#x}")}; link register = next instruction'
 if m=='b':return f'jump to {o}'
 if m.startswith('b'):return f'conditional branch ({m}) to {o}; condition/count depends on instruction'
 if m.startswith(('cmp','fcmp')):return f'compare {o}; set condition-register flags ({"unsigned" if m.startswith("cmpl") else "signed or floating point"})'
 loads={'lwz':('32-bit','zero'), 'lhz':('16-bit','zero'),'lha':('16-bit','sign'),'lbz':('8-bit','zero'),'lfs':('float32',''),'lfd':('float64','')}
 base=m[:-1] if m.endswith('u') else m
 if base in loads:
  bits,ext=loads[base];v=f'{a[0]} = load {bits} from {a[1]}' + (f'; {ext}-extend' if ext else '')
  if m.endswith('u'):v+='; update base register with effective address'
  match=re.fullmatch(r'(-?(?:0x[0-9a-f]+|\d+))\(r2\)',a[1])
  if match:
   off=int(match[1],0);ref=relocs.get((1,toc+off))
   v+=f'; data+{toc+off:#x}'
   if ref:
    k,i,raw=ref;v+=' -> '+(imports[i]['name'] if k=='import' else f'section{i}+{raw:#x}')
  return v
 if m.startswith('st'):return f'store {o}' + ('; update base register with effective address' if m.endswith('u') else '')
 if m=='addi':return f'{a[0]} = {a[1]} + {a[2]} (r0 base means zero)'
 if m=='addis':return f'{a[0]} = {a[1]} + ({a[2]} << 16)'
 if m in ('add','subf','mullw','divw','divwu','and','or','xor'):
  op={'add':'+','subf':'-','mullw':'*','divw':'/ signed','divwu':'/ unsigned','and':'&','or':'|','xor':'^'}[m]
  return f'{a[0]} = {a[2]} - {a[1]}' if m=='subf' else f'{a[0]} = {a[1]} {op} {a[2]}'
 if m in ('slwi','srwi','srawi'):return f'{a[0]} = {a[1]} {"<<" if m=="slwi" else ">>"} {a[2]}' + (' (signed)' if m=='srawi' else '')
 if m.startswith('rlw'):return 'rotate 32-bit word and apply bit mask; '+o
 if m=='nop':return 'no operation'
 if m.startswith('f'):return f'floating-point operation {m}: {o}'
 if m.startswith(('ext','clrl','clr','neg','not','ori','andi','xori')):return f'integer/bit operation {m}: {o}'
 return f'{m} {o}; consult PowerPC instruction semantics'
lines=['; Blitz PowerPC linear disassembly, section-relative addresses.', '; Every 4-byte word is represented. Decodable embedded data may look like instructions.', '; Labels are candidate routine starts, not verified function boundaries.', '; Original source lines/types/local variable names are unavailable.', '; Columns: section offset | original file offset | bytes | instruction | machine-level explanation.','']
for off in range(0,len(code),4):
 if off in starts:lines+=['',f'{stubs.get(off, "entry_runtime" if off==entry else f"candidate_{off:05x}")}: ; direct callers: '+', '.join(f'{a:#x}' for a in calls[off])]
 x=ins.get(off)
 lines.append(f'{off:08x} | {sections[0]["fileOffset"]+off:08x} | {code[off:off+4].hex()} | '+(f'{x.mnemonic:9} {x.op_str:30} ; {explain(x)}' if x else '.long 0x'+code[off:off+4].hex()+' ; undecoded word / possible data'))
(ROOT/'Blitz.annotated.ppc.asm').write_text('\n'.join(lines)+'\n')
(ROOT/'functions.tsv').write_text('candidate_offset\tdirect_callers\n'+''.join(f'{p:08x}\t'+','.join(f'{x:08x}' for x in calls[p])+'\n' for p in sorted(starts)))
# Printable string locations in expanded PEF data and resources.
sl=[]
for label,blob in [('code',code),('data',data)]+[(f"{x['type']}:{x['id']}",(ROOT/x['path']).read_bytes()) for x in resources]:
 for match in re.finditer(rb'[\x20-\x7e]{5,}',blob):sl.append(f'{label}\t{match.start():08x}\t{match.group().decode("ascii")}')
(ROOT/'strings.tsv').write_text('section_or_resource\toffset\ttext\n'+'\n'.join(sl)+'\n')
print(json.dumps({'sections':[{k:v for k,v in s.items() if k!='data'} for s in sections],'loader':loader,'libraries':libs,'resources':resources,'decoded_words':len(ins),'undecoded_words':len(failed),'candidate_routines':len(starts)},indent=2))

# Motorola 68000 resources have 4-byte segment headers. CODE 0 is a jump table.
for res in resources:
 if res['type']!='CODE' or res['id']==0:continue
 blob=(ROOT/res['path']).read_bytes();cpu=Cs(CS_ARCH_M68K,CS_MODE_BIG_ENDIAN|CS_MODE_M68K_000)
 text=['; Linear Motorola 68000 decode. Offsets include the 4-byte segment header.', '; Embedded data/strings may decode as instructions; control flow is not yet fully verified.', '; CODE 0 is a jump table and is preserved as raw data, not disassembled.',f'; Segment header: {blob[:4].hex()}','']
 off=4
 while off<len(blob):
  decoded=list(cpu.disasm(blob[off:],off,count=1))
  if decoded:
   x=decoded[0];m=x.mnemonic;o=x.op_str
   note=''
   if m.startswith('move'):note='copy source to destination (Motorola operand order); flags depend on variant'
   elif m=='rts':note='return: pop return address from stack'
   elif m.startswith('jsr') or m.startswith('bsr'):note='call subroutine; push return address'
   elif m.startswith('b'):note='branch according to condition flags (bra unconditional, bsr call)'
   elif m.startswith('link'):note='establish stack frame'
   elif m.startswith('unlk'):note='restore stack frame'
   elif m.startswith('cmp'):note='compare operands; set condition flags'
   elif m.startswith(('add','sub','mul','div')):note='arithmetic operation; flags depend on variant'
   elif m.startswith(('and','or','eor','not','ls','as','ro','clr','ext','swap')):note='bit/integer operation; flags depend on variant'
   elif m.startswith('dc.w'):note='unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps'
   else:note='machine operation; verify instruction and data boundaries'
   text.append(f'{off:08x} | {x.bytes.hex():24} | {m:12} {o:35} ; {note}');off+=x.size
  else:
   n=min(2,len(blob)-off);text.append(f'{off:08x} | {blob[off:off+n].hex():24} | .word ; undecoded bytes / possible Macintosh A-line trap');off+=n
 (ROOT/f"Blitz.CODE_{res['id']}.m68k.asm").write_text('\n'.join(text)+'\n')
(ROOT/'api_stubs.tsv').write_text('code_offset\tAPI\n'+''.join(f'{p:08x}\t{n}\n' for p,n in sorted(stubs.items())))
print('Entry:',hex(entry),'TOC:',hex(toc),'Resolved stubs:',len(stubs),'relocations:',len(relocs))
