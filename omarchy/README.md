# Blitz for Omarchy

This Rust application ports both recovered versions of Blitz to Linux. It keeps the 1024 × 768 software framebuffer, the original 1.1 and 1.2 motion tables, pixel ordering, fades, supplied MADH music, logo, and the 1.2 8-bit and 16-bit display modes. The rendering loop, SDL2 window, controls, and PNG writer are Rust. The existing PlayerPRO C decoder and mixer remain linked so the original MADH audio is decoded and played by the same code as the macOS ports.

The same source also builds as a self-contained Windows x64 executable. The Windows build links SDL2 and zlib statically and uses the native Windows save-file dialog.

## Build and run

On Omarchy, install the Rust toolchain, C compiler, SDL2 and Zenity if they are missing:

```sh
sudo pacman -S rust base-devel sdl2 zenity
```

From the repository root:

```sh
cargo run --release --manifest-path omarchy/Cargo.toml
```

Blitz 1.2 starts by default. Run `cargo run --release --manifest-path omarchy/Cargo.toml -- --1.1` for Blitz 1.1. The build has no Rust crate dependencies and embeds the original graphics and audio resources in the executable. Runtime system libraries are SDL2 and zlib.

The Windows executable is built by [the Windows release workflow](../.github/workflows/windows-release.yml), which also checks that it does not need SDL2, zlib, GCC, or winpthread runtime DLLs.

## Controls

Space pauses or resumes; `R` restarts; `.` advances a single frame; Escape or a click starts the original fade; Ctrl/Super plus `-` or `=` changes animation speed; Ctrl/Super+0 restores 60 fps; Ctrl/Super+M mutes; Ctrl/Super+F toggles fullscreen; Ctrl/Super+S opens the PNG save dialog; Ctrl/Super+Q quits. In Blitz 1.2, Ctrl/Super+1 selects 8-bit white points and Ctrl/Super+2 selects 16-bit grayscale.

The renderer keeps the original frame size and uses nearest-neighbor scaling. It fits the 4:3 image into the window and uses integer scaling when the available size permits. The app does not fade the desktop.

## Fidelity checks

`cargo test --manifest-path omarchy/Cargo.toml` compares Rust motion table bytes and rendered pixels against both existing C cores. The 1.2 checks include mode switching, point erasure, and signed-counter wrap. `native/music_regression.c` checks PlayerPRO pause, deterministic replay, and fade behavior.
