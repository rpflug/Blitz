#!/bin/zsh
set -euo pipefail
cd "${0:A:h}/.."
xcrun clang -O2 -ffp-contract=off native12/BlitzCore.c native12/core_check.c -o build12/core_check
build12/core_check native/Resources build12
python3 native12/verify_ppc.py
xcrun clang native/music_regression.c build/playerpro/*.o -o build12/music_regression
build12/music_regression native/Resources/blitz.madh
python3 - <<'PY'
from pathlib import Path
for name in ['MADH_128.bin','PICT_128.bin','icl8_128.bin','ICN__128.bin']:
    assert (Path('analysis/resources')/name).read_bytes()==(Path('analysis-1.2/resources')/name).read_bytes(),name
print('Original 1.1/1.2 music, logo and icon resources match byte for byte')
PY
codesign --verify --deep --strict build12/'Blitz 1.2.app'
lipo -info build12/'Blitz 1.2.app'/Contents/MacOS/Blitz
