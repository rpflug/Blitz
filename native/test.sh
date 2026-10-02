#!/bin/zsh
set -euo pipefail
cd "${0:A:h}/.."
xcrun clang -O2 -ffp-contract=off native/BlitzCore.c native/core_check.c -o build/core_check
build/core_check native/Resources build
python3 native/verify_ppc.py
xcrun clang native/music_regression.c build/playerpro/*.o -o build/music_regression
build/music_regression native/Resources/blitz.madh
objects=(build/playerpro/*.o)
objects=(${objects:#build/playerpro/Music.o})
xcrun clang -O2 -std=gnu11 -fno-blocks -U__APPLE__ -D__UNIX__ -D__ELF__ -DBUILDINGPPRO -Ithird_party/PlayerPRO/MADDriver.source -Ibuild/include -Wno-multichar native/music_inspect.c $objects -o build/music_inspect
build/music_inspect native/Resources/blitz.madh
codesign --verify --deep --strict build/Blitz.app
lipo -info build/Blitz.app/Contents/MacOS/Blitz
