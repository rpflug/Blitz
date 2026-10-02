# Blitz 1.2 reconstruction evidence

This directory preserves the data and resource forks of the supplied original Blitz 1.2 executable, its `16` configuration, extracted resources, resolved imports, relocations and annotated PowerPC/68K disassembly. The original file is unchanged. The public readme transcription preserves the original credits and version notes but omits historical contact details.

Original code and graphics: Fred / Frédéric Diebold, credited as Synergy in 1.2. Original music: Monty / Analog. This adaptation is made in honor of the original program and its makers; no endorsement is implied. See ../NOTICE.md and ../native12/README.md.

The original 1.2 readme records `06/01/96` verbatim. Version resources identify 1.2 and “by Frederic Diebold”.

## Recovered entry and graphics

PowerPC entry transition vector: data+0x42c → code+0x1780, TOC offset zero. Main intro: code+0x28. Mode selection reads the first two configuration bytes and chooses 16-bit only for `16`; other successfully read content selects 8-bit. Gamma behavior depends on the classic hardware. The modern default configuration is retained in the app bundle.

- 0x1c0–0x218: RGB555 ramp initialization (32 words populated, 32 zero words retained).
- 0x464–0x688: signed-short motion and circle table generation.
- 0x844: 8-bit draw; 0x960: 8-bit erase.
- 0xa7c: 16-bit draw; 0xba0: 16-bit erase.
- 0xf14: unsigned 8-bit coordinate clipping; 0xf6c: signed 16-bit mode clipping (full coordinates, not narrowing).
- 0xe3c: TickCount wait.
- 0x6b8–0x6e0: wait, draw, erase, increment signed-short counter. The original VRAM scanout is not reconstructed by the modern Metal presentation.
- 0x2514–0x2538: alternating 30/70 channel panning initialization.

The 1.2 PICT, MADH, icl8 and ICN# resources match the preserved 1.1 resources byte for byte. They can safely share the extracted modern app assets and music bridge.

The restricted interpreter in native12/verify_ppc.py independently checks all 1024 motion entries, 40 circle entries, 64 grayscale words, 12 selected frames in each mode (including signed-counter rollover), and 121 consecutive frames per mode. Native and interpreted framebuffer bytes match. Host libm substitutes historical MathLib; there is no original audio capture or gamma/scanout reference.

To regenerate the listings, install Capstone 5 and run `python3 analysis-1.2/analyze.py`. To build and verify the native app, follow native12/README.md.
