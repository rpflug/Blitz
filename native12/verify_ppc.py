"""Independent check: execute recovered PPC table/pixel instructions against native output.
This is a restricted instruction interpreter for these routines, not a Macintosh emulator.
The MathLib imports use host libm, so historical MathLib transcendental rounding remains unverified.
"""
from pathlib import Path
import sys,struct,math,re,json
from capstone import Cs,CS_ARCH_PPC,CS_MODE_32,CS_MODE_BIG_ENDIAN
root=Path(__file__).resolve().parent.parent
code=(root/'analysis-1.2/section_0.bin').read_bytes();md=Cs(CS_ARCH_PPC,CS_MODE_32|CS_MODE_BIG_ENDIAN)
ops={x.address:(x.mnemonic,x.op_str) for x in md.disasm(code,0)}
# Decode each word so embedded metadata does not stop the decoder.
ops={}
for p in range(0,len(code),4):
 x=list(md.disasm(code[p:p+4],p,count=1))
 if x:ops[p]=(x[0].mnemonic,x[0].op_str)
D=0x20000000;S=0x30000000;FB=0x40000000
regions={D:bytearray((root/'analysis-1.2/section_1.bin').read_bytes())+bytearray(6566),S:bytearray(4096),FB:bytearray(1024*768*2)}
r=[0]*32;f=[0.0]*32;cr=0;lr=0;carry=0
r[1]=S+2048;r[2]=D;r[30]=D+0x192c;r[31]=D+0x1bac
r[24]=512;r[23]=384

def read(a,n):
 for base,v in regions.items():
  if base<=a and a+n<=base+len(v):return bytes(v[a-base:a-base+n])
 raise ValueError(('read',hex(a),n))
def write(a,v):
 for base,data in regions.items():
  if base<=a and a+len(v)<=base+len(data):data[a-base:a-base+len(v)]=v;return
 raise ValueError(('write',hex(a),v))
def uint(v):return v&0xffffffff
def signed(v):return (v&0x7fffffff)-(v&0x80000000)
def reg(s):return r[int(s[1:])] if s.startswith('r') else int(s,0)
def setr(s,v):r[int(s[1:])]=uint(v)
def addr(s):
 m=re.fullmatch(r'(-?(?:0x[0-9a-f]+|\d+))\(r(\d+)\)',s);assert m,s
 return uint(int(m[1],0)+(r[int(m[2])] if int(m[2]) else 0))
def sf(v):return struct.unpack('>f',struct.pack('>f',v))[0]
def run(start,end):
 global cr,lr,carry
 pc=start;count=0
 while pc!=end:
  count+=1;assert count<1500000
  m,o=ops[pc];a=[v.strip() for v in o.split(',')];nxt=pc+4;dot=m.endswith('.');m=m.rstrip('.')
  if m=='li':setr(a[0],reg(a[1]))
  elif m=='lis':setr(a[0],reg(a[1])<<16)
  elif m=='mr':setr(a[0],reg(a[1]))
  elif m=='addi':setr(a[0],(reg(a[1]) if a[1]!='r0' else 0)+reg(a[2]))
  elif m=='add':setr(a[0],reg(a[1])+reg(a[2]))
  elif m=='subfic':setr(a[0],reg(a[2])-reg(a[1]))
  elif m=='subf':setr(a[0],reg(a[2])-reg(a[1]))
  elif m in ('mullw','mulli'):setr(a[0],reg(a[1])*reg(a[2]))
  elif m=='divw':setr(a[0],int(signed(reg(a[1]))/signed(reg(a[2]))))
  elif m=='xoris':setr(a[0],reg(a[1])^(reg(a[2])<<16))
  elif m=='clrlwi':setr(a[0],reg(a[1])&(0xffffffff>>reg(a[2])))
  elif m=='slwi':setr(a[0],reg(a[1])<<reg(a[2]))
  elif m=='extsh':setr(a[0],struct.unpack('>h',struct.pack('>H',reg(a[1])&65535))[0])
  elif m in ('cmpwi','cmpw','cmplwi','cmplw'):
   v,w=reg(a[-2]),reg(a[-1]);v,w=(uint(v),uint(w)) if m.startswith('cmpl') else (signed(uint(v)),signed(uint(w)));cr=(v>w)-(v<w)
  elif m in ('lwz','lha','lbz'):
   n={'lwz':4,'lha':2,'lbz':1}[m];setr(a[0],int.from_bytes(read(addr(a[1]),n),'big',signed=m=='lha'))
  elif m in ('lhax','lhzx'):
   setr(a[0],int.from_bytes(read(uint((reg(a[1]) if a[1]!='r0' else 0)+reg(a[2])),2),'big',signed=m=='lhax'))
  elif m=='lwzx':setr(a[0],int.from_bytes(read(uint((reg(a[1]) if a[1]!='r0' else 0)+reg(a[2])),4),'big'))
  elif m=='stw':write(addr(a[1]),reg(a[0]).to_bytes(4,'big'))
  elif m=='stwx':write(uint((reg(a[1]) if a[1]!='r0' else 0)+reg(a[2])),reg(a[0]).to_bytes(4,'big'))
  elif m=='sth':write(addr(a[1]),(reg(a[0])&65535).to_bytes(2,'big'))
  elif m=='sthx':write(uint((reg(a[1]) if a[1]!='r0' else 0)+reg(a[2])),(reg(a[0])&65535).to_bytes(2,'big'))
  elif m=='stb':write(addr(a[1]),bytes([reg(a[0])&255]))
  elif m in ('lfs','lfd'):f[int(a[0][1:])]=struct.unpack('>f' if m=='lfs' else '>d',read(addr(a[1]),4 if m=='lfs' else 8))[0]
  elif m=='stfd':
   v=f[int(a[0][1:])];write(addr(a[1]),struct.pack('>II',0,uint(v[1])) if isinstance(v,tuple) else struct.pack('>d',v))
  elif m=='fmr':f[int(a[0][1:])]=f[int(a[1][1:])]
  elif m in ('fsubs','fmuls','fmul','fdiv'):
   v,w=f[int(a[1][1:])],f[int(a[2][1:])];z=v-w if m=='fsubs' else v/w if m=='fdiv' else v*w;f[int(a[0][1:])]=sf(z) if m.endswith('s') else z
  elif m=='fctiwz':f[int(a[0][1:])]=('int',math.trunc(f[int(a[1][1:])]))
  elif m=='bl':
   target=reg(a[0]);lr=pc+4
   if target in (0xf5ac,0xf5c4):
    write(r[1]+0x14,D.to_bytes(4,'big'));f[1]=(math.cos if target==0xf5ac else math.sin)(f[1])
   elif target in (0xf14,0xf6c):nxt=target
   else:raise ValueError(('call',hex(target)))
  elif m=='blr':nxt=lr
  elif m in ('bltlr','bgelr'):
   if (cr<0 if m=='bltlr' else cr>=0):nxt=lr
  elif m=='b':nxt=reg(a[0])
  elif m in ('beq','bne','blt','bge','ble','bgt'):
   if {'beq':cr==0,'bne':cr!=0,'blt':cr<0,'bge':cr>=0,'ble':cr<=0,'bgt':cr>0}[m]:nxt=reg(a[-1])
  elif m=='nop':pass
  else:raise ValueError((hex(pc),m,o))
  if dot:
   v=signed(reg(a[0]));cr=(v>0)-(v<0)
  pc=nxt
 return count

r[2]=D;r[25]=D+0xc22;r[24]=D+0xb9a
count=run(0x1b4,0x21c)
r[25]=D+0xc22;r[23]=D+0xccc;r[22]=D+0xc2c
count+=run(0x464,0x688)
expected=read(D+0xccc,4096)+read(D+0xc2c,160)+read(D+0xb9a,128)
native=(root/'build12/tables.bin').read_bytes()
assert native==expected,'1.2 tables mismatch'
write(D+0xc1e,struct.pack('>h',512));write(D+0xc1c,struct.pack('>h',384))
write(D+0x207c+0x56,struct.pack('>4h',0,0,768,1024))
write(D+0x1cdc,FB.to_bytes(4,'big'))
frames=[0,1,2,60,256,1023,1024,32767,32768,32769,65535,65536]
for mode in (8,16):
 write(D+0x1ce0,(1024*(mode//8)).to_bytes(4,'big'))
 draw=(0x854,0x94c) if mode==8 else (0xa8c,0xb8c)
 erase=(0x970,0xa68) if mode==8 else (0xbb0,0xca8)
 regions[FB][:]=bytes([255 if mode==8 else 0])*len(regions[FB])
 previous=None
 for frame in frames:
  if previous is not None:
   write(D+0xc1a,struct.pack('>H',previous&65535));run(*erase)
  write(D+0xc1a,struct.pack('>H',frame&65535));run(*draw)
  expected=read(FB,1024*768*(mode//8))
  native=(root/f'build12/frame-{frame}-{mode}.bin').read_bytes()
  assert expected==native,f'Frame {frame} mode {mode} differs: '+str(next((i for i,(a,b) in enumerate(zip(expected,native)) if a!=b),None))
  previous=frame
 # Consecutive erase/draw test, rather than only isolated samples.
 regions[FB][:]=bytes([255 if mode==8 else 0])*len(regions[FB])
 for frame in range(121):
  if frame:
   write(D+0xc1a,struct.pack('>H',frame-1));run(*erase)
  write(D+0xc1a,struct.pack('>H',frame));run(*draw)
 assert read(FB,1024*768*(mode//8))==(root/f'build12/frame-120-{mode}.bin').read_bytes()
result={'version':'1.2','motionEntriesMatched':1024,'circleEntriesMatched':40,'rampWordsMatched':64,'originalPPCInstructionsExecutedForTables':count,'framebufferModesMatched':[8,16],'pixelExactFramesMatched':frames,'consecutiveFramesPerMode':121,'referenceLimit':'Restricted PPC interpreter with host libm, not historical audio or hardware gamma reference.'}
(root/'build12/ppc-verification.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
