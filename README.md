# Blitz for modern macOS — 1.1 and 1.2

A native adaptation of **Blitz 1.1**, the 1996 Macintosh demoscene intro by **Synergy Design**. This project is made **in honor of the original program and its makers**, preserving its motion, pixel graphics, logo, icon and original music for modern Macs.

## Choose a version

| Port | Download | Behavior and build instructions |
|---|---|---|
| Blitz 1.1 | [v1.1.0 release](https://github.com/rpflug/Blitz/releases/tag/v1.1.0) | The 256-color adaptation documented below |
| Blitz 1.2 | [v1.2.0 release](https://github.com/rpflug/Blitz/releases/tag/v1.2.0) | [1.2 documentation](native12/README.md): 16-bit grayscale and 8-bit modes, recovered 1.2 motion and layer count |

Both apps preserve the original music, logo and icon and run at 1024 × 768 by default. The 1.2 port starts in the supplied configuration’s 16-bit mode; Command-1 selects 8-bit white points and Command-2 restores grayscale. Both versions support Apple Silicon and Intel Macs.

## Original makers and tribute

- **Frédéric Diebold / Synergy Design** — original code and graphics, including the Graphic Motion System (GMS) library.
- **Monty of Analog** — original music.
- **Synergy Design** — the original Blitz intro and GMS, credited © 1996 in the accompanying readme.
- **Antoine Rosset**, and subsequent PlayerPRO contributors — the tracker playback software used by this adaptation.

The original readme describes Blitz as a “little FAT” intro coded in two days and expresses enthusiasm for PowerMac demomaking. This adaptation celebrates that work and the Macintosh demo scene. It is an independent preservation and tribute project; no affiliation with or endorsement by the original makers is claimed.

Credits are transcribed from the [original Blitz readme](analysis/original/Blitz-Readme.txt), preserved here as UTF-8 with its original wording. Its date is recorded verbatim as `10/11/96`. The historical greetings name Edyx / Ellipsoid, Purple Motion / Future Crew, Cafein members and Toal’NKor / RealTech.

The adaptation was reconstructed from the original Macintosh executable and its resource fork. Original artwork, music and program authorship remain with their creators. See [NOTICE.md](NOTICE.md) for provenance and licensing distinctions. Blitz 1.2’s original documentation is also retained in [analysis-1.2](analysis-1.2/README.md), with historical contact details omitted from its public readme copy.

## Running Blitz 1.1

Download the app from [GitHub Releases](https://github.com/rpflug/Blitz/releases/tag/v1.1.0), unzip it, and open **Blitz.app**. When building from source, open **build/Blitz.app**. The app includes the original MADH track, original PICT logo and original Finder icon. It requires macOS 13 or later and supports both Apple Silicon and Intel Macs with Metal.

## Controls

- **Space**: pause/resume animation and music.
- **R**: replay the logo and music from the beginning.
- **Click / Escape**: finish with the palette and music fade.
- **.**: pause and advance one animation frame.
- **⌘− / ⌘=**: slow down / speed up animation in 0.10× steps.
- **⌘0**: restore the original tick cadence (60 frames per second).
- **⌘M**: mute/unmute while the tracker keeps advancing.
- **⌘F**: full screen.
- **⌘S**: export the current 1024 × 768 frame as PNG.
- **⌘Q**: quit.

The Playback menu contains the same actions and displays the current speed. The window title displays the animation frame. Timing controls change the animation cadence without changing music pitch or tempo. Speed currently resets to 1.00× when the app launches.

## Preserved behavior (Blitz 1.1)

The software framebuffer uses the original setup’s **1024 × 768** dimensions. The motion table, 40-point circle, layer order, integer division, 16-bit clipping and direct byte pixel writes follow the PowerPC instructions. The original pi constant is preserved. Single-precision intermediates and double-precision calculations are kept in their original order; compiler floating-point contraction is disabled. Metal presents the framebuffer with nearest-neighbor sampling and integer scaling whenever the window is large enough. Resize and full screen do not alter the simulation dimensions.

The original frame loop calls a TickCount wait routine at code+0x8a0. This establishes a roughly 60 Hz cadence, correcting the earlier assumption that the loop was entirely CPU-speed dependent. Modern scheduling uses a monotonic clock and a fixed-step accumulator.

The 320 × 200 PICT is decoded directly from the resource. Its source colors and indices are retained, and a second indexed copy is mapped to the classic default Color QuickDraw palette using nearest color lookup. Fades reproduce the original routine's unusual per-byte ColorTable scaling. The host desktop itself is not faded; only the app framebuffer is affected.

The original 43,962-byte MADH track is bundled unchanged. PlayerPRO's MADH decoder recovers four channels, twelve patterns, fifteen order entries and five samples totaling 8,630 bytes. A native AVAudioSourceNode receives 44.1 kHz stereo PCM from the tracker mixer. No MIDI synthesizer, replacement song or prerecorded soundtrack is used. The classic driver's alternating 30/70 panning is applied; this particular module has no panning effects. Exit volume falls by three units per channel per fade step, matching the main routine's four channel-volume decrements. OS audio resampling may occur when the output device uses a different rate.

## Accuracy and validation (Blitz 1.1)

`native/verify_ppc.py` independently executes the recovered PowerPC instructions for the table generation and frame/pixel routines. All 1024 motion entries, all 40 circle entries and all pixels in frames 0, 1, 60, 256 and 1023 match the native renderer exactly. The test executes 77,582 original instructions for table generation. This restricted interpreter substitutes host libm for the old MathLib; it is not a full classic Mac emulator.

Audio tests verify pause silence, sample-identical replay initialization, safe fade rendering and more than four minutes of tracker playback including song looping. Native UI checks cover launch, Metal rendering, pause, frame stepping, speed change and exit fade. The app is ad-hoc signed, and the final signature and both CPU architectures are checked.

**Historical 1:1 equivalence is not yet proven.** Remaining comparison points are the original MathLib's transcendental rounding, the historical PlayerPRO mixer versus this source revision, exact hardware-dependent logo fade duration, and Color QuickDraw palette mapping versus the nearest-color mapping used here. We have no captured original audio/frame reference yet. The default palette assumes the original Mac used its standard 8-bit color table. No visual or audio embellishments are added.

## Build and test

With Xcode command-line tools and Python 3:

```sh
./native/build.sh
./native/test.sh
open build/Blitz.app
```

The app build needs no network, Swift packages, Python packages or installed PlayerPRO application. The independent PowerPC verification additionally needs Capstone 5; install it with `python3 -m pip install capstone==5.0.9` in your Python environment. Tests write snapshots and reports under `build/`.

- `native/App.m`: AppKit window, Metal presentation, AVAudioEngine and controls.
- `native/BlitzCore.c`: recovered pixel algorithm and palette handling.
- `native/Music.c`: original MADH decoder and native audio bridge.
- `native/Resources/`: extracted original assets and palette files.
- `third_party/PlayerPRO/`: pinned source subset and upstream provenance/license.
- `analysis/`: fork extraction, disassembly and reconstruction evidence.

PlayerPRO's original author released its code to the public domain; the accompanying upstream license is preserved. The supplied Blitz artwork/music retain their original authorship. The app is ad-hoc signed for local use and has not been notarized.
