"""Extract the original indexed PICT; no image resizing or replacement artwork."""
from pathlib import Path
import struct,zlib,json,shutil
root=Path(__file__).resolve().parent.parent;out=root/'native/Resources'
b=(root/'analysis/resources/PICT_128.bin').read_bytes()
assert struct.unpack_from('>H',b,0x34)[0]==0x98
p=0x36;v=struct.unpack_from('>HhhhhHHIIIHHHHIII',b,p);p+=46
rowbytes=v[0]&0x3fff;top,left,bottom,right=v[1:5];w=right-left;h=bottom-top
seed,flags,n=struct.unpack_from('>IHH',b,p);p+=8
colors={}
for i in range(n+1):
 idx,r,g,blue=struct.unpack_from('>4H',b,p);p+=8;colors[i if flags&0x8000 else idx]=(r,g,blue)
source=struct.unpack_from('>4h',b,p);dest=struct.unpack_from('>4h',b,p+8);mode=struct.unpack_from('>H',b,p+16)[0];p+=18
assert source==dest==(0,0,200,320) and mode==0
pixels=bytearray()
for y in range(h):
 if rowbytes>250:count=struct.unpack_from('>H',b,p)[0];p+=2
 else:count=b[p];p+=1
 packed=b[p:p+count];p+=count;q=0;row=bytearray()
 while q<len(packed):
  flag=packed[q];q+=1
  if flag<=127:row+=packed[q:q+flag+1];q+=flag+1
  elif flag>=129:row+=bytes([packed[q]])*(257-flag);q+=1
 assert len(row)==rowbytes
 pixels+=row[:w]
# Standard Color QuickDraw palette: white is 0, black is 255.
levels=[65535,52428,39321,26214,13107,0]
palette=[(r,g,blue) for r in levels for g in levels for blue in levels][:-1]
ramps=[61166,56797,48059,43690,34952,30583,21845,17476,8738,4369]
palette+=[(x,0,0) for x in ramps]+[(0,x,0) for x in ramps]+[(0,0,x) for x in ramps]+[(x,x,x) for x in ramps]+[(0,0,0)]
assert len(palette)==256
mapping={i:min(range(256),key=lambda j:sum((colors[i][k]-palette[j][k])**2 for k in range(3))) for i in colors}
(out/'logo.indexed').write_bytes(bytes(mapping[i] for i in pixels))
(out/'logo.source.indexed').write_bytes(pixels)
(out/'logo.source.palette').write_bytes(b''.join(struct.pack('>3H',*colors[i]) for i in range(n+1)))
(out/'system.palette').write_bytes(b''.join(struct.pack('>3H',*c) for c in palette))
# Lossless PNG of source colors for inspection.
def chunk(t,d):return struct.pack('>I',len(d))+t+d+struct.pack('>I',zlib.crc32(t+d)&0xffffffff)
raw=b''.join(b'\0'+b''.join(bytes(c>>8 for c in colors[i]) for i in pixels[y*w:(y+1)*w]) for y in range(h))
png=b'\x89PNG\r\n\x1a\n'+chunk(b'IHDR',struct.pack('>IIBBBBB',w,h,8,2,0,0,0))+chunk(b'IDAT',zlib.compress(raw))+chunk(b'IEND',b'')
(root/'analysis/logo.png').write_bytes(png)
shutil.copyfile(root/'analysis/resources/MADH_128.bin',out/'blitz.madh')
(out/'assets.json').write_text(json.dumps({'logoWidth':w,'logoHeight':h,'sourcePaletteColors':n+1,'sourceTransferMode':mode,'musicBytes':43962},indent=2))
print('Extracted',w,h,'PICT with',n+1,'colors; MADH preserved byte for byte')

# Original Finder icon, with the original ICN# mask and integer-only scaling.
icon=(root/'analysis/resources/icl8_128.bin').read_bytes()
mask=(root/'analysis/resources/ICN__128.bin').read_bytes()[128:]
icns=[]
for size,kind in [(32,b'icp5'),(64,b'icp6'),(128,b'ic07'),(256,b'ic08'),(512,b'ic09'),(1024,b'ic10')]:
 scale=size//32;scan=[]
 for y in range(size):
  row=bytearray()
  for x in range(size):
   i=(y//scale)*32+x//scale
   row.extend(bytes(v>>8 for v in palette[icon[i]]));row.append(255 if mask[i//8]&(1<<(7-i%8)) else 0)
  scan.append(b'\0'+row)
 png=b'\x89PNG\r\n\x1a\n'+chunk(b'IHDR',struct.pack('>IIBBBBB',size,size,8,6,0,0,0))+chunk(b'IDAT',zlib.compress(b''.join(scan)))+chunk(b'IEND',b'')
 icns.append(kind+struct.pack('>I',8+len(png))+png)
body=b''.join(icns);(out/'Blitz.icns').write_bytes(b'icns'+struct.pack('>I',8+len(body))+body)
