from pathlib import Path
import subprocess
root=Path(__file__).resolve().parent.parent
src=root/'third_party/PlayerPRO/MADDriver.source'
out=root/'build/playerpro';out.mkdir(parents=True,exist_ok=True)
include=root/'build/include';include.mkdir(parents=True,exist_ok=True)
link=include/'PlayerPROCore'
if not link.exists():link.symlink_to('../../third_party/PlayerPRO/MADDriver.source',target_is_directory=True)
files=['DelayOutPut.c','Effects.c','MainDriver.c','FileUtils.c','Interrupt.c','MADDriver.c','MyDebugStr.c','OutPut8.c','realft.c','TickRemover.c','stub-VSTPlugIn.c','MIDI-Hardware-Stub.c','Lin-PlugImport.c']
for f in files:
 input_file=src/f
 if f=='Interrupt.c':
  patched=input_file.read_text().replace('temp = (temp * pannValue) / (MAX_PANNING*256L);', '/* Blitz driver initializes alternating tracks to 30/70 percent (PPC 0x1f00..0x1f2c). This track has no panning effects. */\n\t\tint panPercent = (ch->TrackID & 1) ? 70 : 30;\n\t\ttemp = (temp * (whichChannel == 1 ? 100 - panPercent : panPercent)) / 100;')
  input_file=out/'Interrupt.blitz.c';input_file.write_text(patched)
 if f=='MainDriver.c':
  patched=input_file.read_text().replace('short *shortPtr = (short*)dataCopy;', 'shortPtr = (short*)dataCopy;')
  input_file=out/'MainDriver.portable.c';input_file.write_text(patched)
 cmd=['xcrun','clang','-c','-arch','arm64','-arch','x86_64','-O2','-mmacosx-version-min=13.0','-std=gnu11','-fno-blocks','-U__APPLE__','-D__UNIX__','-D__ELF__','-DBUILDINGPPRO','-DMADCFReadStreamType=2','-I'+str(src),'-I'+str(root/'build/include'),'-Wno-multichar','-Wno-deprecated-declarations',str(input_file),'-o',str(out/(f+'.o'))]
 p=subprocess.run(cmd,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 if p.returncode:
  print(f,p.stdout);raise SystemExit(p.returncode)
print('Compiled PlayerPRO core')
