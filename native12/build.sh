#!/bin/zsh
set -euo pipefail
cd "${0:A:h}/.."
python3 native/extract_assets.py
python3 native/build_playerpro.py
mkdir -p build12/'Blitz 1.2.app'/Contents/MacOS build12/'Blitz 1.2.app'/Contents/Resources
xcrun clang -arch arm64 -arch x86_64 -c -O2 -mmacosx-version-min=13.0 -std=gnu11 -fno-blocks -U__APPLE__ -D__UNIX__ -D__ELF__ -DBUILDINGPPRO -Ithird_party/PlayerPRO/MADDriver.source -Ibuild/include -Wno-multichar native/Music.c -o build/playerpro/Music.o
xcrun clang -arch arm64 -arch x86_64 -c -O2 -mmacosx-version-min=13.0 -ffp-contract=off native12/BlitzCore.c -o build12/BlitzCore.o
xcrun clang -arch arm64 -arch x86_64 -O2 -fobjc-arc -DBLITZ12 -mmacosx-version-min=13.0 native/App.m build12/BlitzCore.o build/playerpro/*.o -framework Cocoa -framework Metal -framework MetalKit -framework AVFoundation -framework QuartzCore -o build12/'Blitz 1.2.app'/Contents/MacOS/Blitz
cp native/Resources/* build12/'Blitz 1.2.app'/Contents/Resources/
cp README.md NOTICE.md build12/'Blitz 1.2.app'/Contents/Resources/
cp native12/README.md build12/'Blitz 1.2.app'/Contents/Resources/Blitz-1.2-Port.md
cp analysis-1.2/original/Blitz-Readme.txt analysis-1.2/original/Blitz.cfg build12/'Blitz 1.2.app'/Contents/Resources/
cp third_party/PlayerPRO/LICENSE.txt build12/'Blitz 1.2.app'/Contents/Resources/PlayerPRO-LICENSE.txt
cat > build12/'Blitz 1.2.app'/Contents/Info.plist <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleExecutable</key><string>Blitz</string>
<key>CFBundleIdentifier</key><string>org.synergydesign.blitz.native12</string>
<key>CFBundleIconFile</key><string>Blitz.icns</string>
<key>CFBundleName</key><string>Blitz 1.2</string>
<key>CFBundleDisplayName</key><string>Blitz 1.2</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleShortVersionString</key><string>1.2.0</string>
<key>CFBundleVersion</key><string>1</string>
<key>LSMinimumSystemVersion</key><string>13.0</string>
<key>NSHighResolutionCapable</key><true/>
<key>NSSupportsAutomaticGraphicsSwitching</key><true/>
</dict></plist>
PLIST
codesign --force --sign - build12/'Blitz 1.2.app'
print "Built $PWD/build12/Blitz 1.2.app"
