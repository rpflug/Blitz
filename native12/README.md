# Blitz 1.2 for modern macOS

An independent preservation and tribute to the original Blitz 1.2 Macintosh intro, in honor of **Frédéric Diebold / Synergy** (original code and graphics, GMS library) and **Monty / Analog** (original music). Original documentation and attribution, with historical contact details omitted, are preserved in analysis-1.2/original/Blitz-Readme.txt. No endorsement by the original makers is implied. See ../NOTICE.md for asset provenance and rights.

Requires macOS 13 or later, with Metal, on Apple Silicon or Intel. Download the Blitz 1.2 ZIP from the v1.2.0 GitHub release, unzip, and open Blitz 1.2.app. The binary is ad-hoc signed and not notarized.

## Controls

The same controls as 1.1: Space pauses, R replays with music, period steps a frame, Command-minus/equal adjusts animation speed, Command-0 restores 60 fps, Command-M mutes, Command-F enters fullscreen, Command-S saves PNG, Escape/click fades out, Command-Q quits.

The Display menu adds **Command-2: 16-bit grayscale** and **Command-1: 8-bit white points**. The original bundled Blitz.cfg contains `16` and selects the default mode. Changing modes in the menu keeps the current animation frame and music position. Mode changes are session-only.

## Recovered 1.2 behavior

This is a separate renderer, recovered from the supplied 1.2 PowerPC code. It uses the same 1024 × 768 framebuffer as the 1.1 adaptation, retaining integer division, point order, clipping and nearest-neighbor presentation.

- Pi is `3.141592653`, as stored in 1.2 (1.1 uses `3.141592654`).
- The 1024 motion entries and 40 circle entries are stored as signed 16-bit coordinates.
- Horizontal motion follows `30000*cos(pi*i/64)*cos(pi*i/128)` in the original evaluation order. Vertical motion uses amplitude **4000**, rather than 1.1's 6500, with the original floating-point intermediate rounding.
- Each frame draws from signed-frame-counter modulo 3 through layer **62**, rather than 1.1's layer 99.
- The RGB555 ramp assigns paired shades: 31,31,29,29,…,1,1. Only the first 32 entries are initialized; entries 32 through 63 stay zero, as in the original executable. The later black points and their overwrite order are retained.
- Original 8-bit mode draws white points on black. Original 16-bit mode uses the recovered ramp on black.
- The original main loop waits for a tick, draws the current points, immediately erases those same points, then increments its signed counter. The recovered mode-specific erase arithmetic is retained. Modern presentation holds the drawn result until the next update, erasing the previous points before drawing again.
- The original signed 16-bit frame counter wraps at 32768. Negative remainder lookup reproduces the neighboring original data words (including `0xff00` at ramp index -1), rather than reading outside native memory.
- TickCount wait at 0xe3c establishes the approximately 60 Hz animation cadence.

The MADH soundtrack, PICT logo and Finder icons in 1.2 are byte-identical to 1.1, verified against both extracted resource forks. The same pinned PlayerPRO core and original 30/70 panning are reused. No soundtrack substitution or added effects are used.

## Fidelity limits

The independent restricted PowerPC interpreter checks recovered motion/circle/ramp words and mode-specific framebuffer bytes. It substitutes host libm for historical MathLib; this is not full Macintosh emulation. The original direct-VRAM draw/erase sequence can flicker with hardware-dependent scanout; Metal presents complete frames and does not reproduce that within-tick scanout. Historical audio mixer equivalence remains unproven. In 16-bit mode the PICT's original colors are quantized to RGB555; exact Color QuickDraw rounding is not captured. Original fades operate through hardware gamma tables; modern RGB scaling approximates their visible effect, and original hardware timing remains unverified. Desktop fading is confined to the app.

## Build and verify

```sh
./native12/build.sh
python3 -m pip install capstone==5.0.9
./native12/test.sh
open 'build12/Blitz 1.2.app'
```

Build requires Xcode command-line tools and Python 3. Capstone is needed only for verification/analysis. The build is offline and reuses the vendored PlayerPRO subset. The original 1.1 app and source remain available alongside 1.2.
