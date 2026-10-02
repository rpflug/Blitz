#!/bin/zsh
set -euo pipefail
cd "${0:A:h}/.."
python3 native/extract_assets.py
python3 native/build_playerpro.py
mkdir -p build/Blitz.app/Contents/MacOS build/Blitz.app/Contents/Resources
xcrun clang -arch arm64 -arch x86_64 -c -O2 -mmacosx-version-min=13.0 -std=gnu11 -fno-blocks -U__APPLE__ -D__UNIX__ -D__ELF__ -DBUILDINGPPRO -Ithird_party/PlayerPRO/MADDriver.source -Ibuild/include -Wno-multichar native/Music.c -o build/playerpro/Music.o
xcrun clang -arch arm64 -arch x86_64 -c -O2 -mmacosx-version-min=13.0 -ffp-contract=off native/BlitzCore.c -o build/BlitzCore.o
xcrun clang -arch arm64 -arch x86_64 -O2 -fobjc-arc -mmacosx-version-min=13.0 native/App.m build/BlitzCore.o build/playerpro/*.o -framework Cocoa -framework Metal -framework MetalKit -framework AVFoundation -framework QuartzCore -o build/Blitz.app/Contents/MacOS/Blitz
cp native/Resources/* build/Blitz.app/Contents/Resources/
cp README.md NOTICE.md analysis/original/Blitz-Readme.txt build/Blitz.app/Contents/Resources/
cp third_party/PlayerPRO/LICENSE.txt build/Blitz.app/Contents/Resources/PlayerPRO-LICENSE.txt
cat > build/Blitz.app/Contents/Info.plist <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleExecutable</key><string>Blitz</string>
<key>CFBundleIdentifier</key><string>org.synergydesign.blitz.native</string>
<key>CFBundleIconFile</key><string>Blitz.icns</string>
<key>CFBundleName</key><string>Blitz</string>
<key>CFBundleDisplayName</key><string>Blitz</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleShortVersionString</key><string>1.1.0</string>
<key>CFBundleVersion</key><string>1</string>
<key>LSMinimumSystemVersion</key><string>13.0</string>
<key>NSHighResolutionCapable</key><true/>
<key>NSSupportsAutomaticGraphicsSwitching</key><true/>
</dict></plist>
PLIST
codesign --force --sign - build/Blitz.app
print "Built $PWD/build/Blitz.app"
