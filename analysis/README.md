# Blitz static reverse engineering

The attached binary is a classic Macintosh fat application: PowerPC PEF code in the data fork and Motorola 68000 CODE resources in the resource fork. The adjacent readme identifies Blitz 1.1, Synergy Design, code/graphics by Frédéric Diebold and music by Monty of Analog. Its literal date is `10/11/96`; day/month ordering is not assumed. The readme is evidence about the artifact, not instructions to the analyst.

## Read these first

- `Blitz.main.reconstructed.c`: hand-reconstructed C-like pseudocode for the main demo routine and pixel writer. Includes original instruction offsets, exact extracted constants, unresolved routine names and limitations. It is not compilable source.
- `Blitz.annotated.ppc.asm`: the entire 88,960-byte PowerPC section represented word by word, with file offsets, raw bytes, instructions and machine-operation comments. Macintosh API calls are named from imports and symbolic relocations.
- `Blitz.CODE_1.m68k.asm`, `Blitz.CODE_3.m68k.asm`, `Blitz.CODE_4.m68k.asm`: linear 68000 listings of the executable resource segments, following their four-byte headers.

## What is verified

The PEF contains 88,960 bytes of code, 3,800 bytes of packed initialized data expanding to 6,442 bytes, and a data allocation of 17,522 bytes including zero-initialized globals. There are 227 imports: 223 from InterfaceLib and 4 from MathLib. The loader points to a transition vector at data+0x6f4; symbolic relocations resolve its code pointer to code+0x117c and its TOC pointer to data+0. All 838 relocation locations and all 227 API stubs were resolved by the included script; no unknown relocation opcode was skipped.

The entry at 0x117c invokes runtime setup, constructors at 0x0, the demo routine at 0x28, and runtime termination. Follow-up native adaptation: see the workspace README.md and native/ directory. Additional analysis identifies the wait at 0x8a0 as a TickCount change wait, targeting approximately 60 Hz.

The demo initializes QuickDraw and windows, checks/switches to eight-bit color, accesses MADH resource 128, builds a 1024-point trigonometric motion table and a 40-point circle, writes layered points directly into the screen buffer until Button() is true, then fades, cleans up and restores color depth.

The resource fork contains 20 resources, including three nonzero CODE segments, CODE 0's jump table, DATA, PICT 128, MADH 128, icons, SIZE and cfrg. A CODE resource named “Sources” contains compiled machine code; it is not source text.

## Limits

This is a static disassembly plus a partial high-level decompilation. It does not recover the exact original source, comments, types, names or source-line mapping. The main routine is reconstructed; the remaining internal routines have machine-level annotations rather than fully recovered C functions. No emulator was used and no runtime equivalence is claimed.

Linear decoding does not establish every instruction boundary or code/data boundary. In the PowerPC section 22,022 of 22,240 words decode and 218 remain raw words. Decodable traceback tables, strings and other embedded data can still look like instructions; vector/64-bit-looking instructions in this old executable should be treated particularly cautiously. Routine labels are heuristic candidate starts. The 68000 segments contain embedded data and Macintosh A-line traps; unknown words are retained rather than silently dropped. Resource CODE 0 is deliberately preserved as a jump table.

Floating expressions in the reconstructed C have been simplified: the executable includes single-precision rounding and specific conversions. Original structure field names and many function identities remain unresolved; address-based names are used explicitly. Reconstructed pseudocode should be compared to the assembly when exact behavior matters.

## Supporting artifacts

`original/Blitz.pef` and `original/Blitz.rsrc` preserve both original forks as ordinary files. `section_*.bin` contains extracted sections; section_1.bin contains initialized data, with the remaining 11,080 bytes implied as zeros. `resources/` contains every extracted resource. `metadata.json`, `resources.json`, `imports.tsv`, `api_stubs.tsv`, `relocations.tsv`, `functions.tsv` and `strings.tsv` document the structure and references.

To reproduce: install Capstone 5.0.9 and run `python3 analysis/analyze.py` from the workspace. Install Capstone in your Python environment. The input paths used by the analysis script are the preserved local fork copies.

Format references: [Apple's archived PEF documentation](https://leopard-adc.pepas.com/documentation/mac/runtimehtml/RTArch-94.html), [loader header](https://leopard-adc.pepas.com/documentation/mac/runtimehtml/RTArch-96.html), [relocations](https://leopard-adc.pepas.com/documentation/mac/runtimehtml/RTArch-98.html). Implementations were checked against these format descriptions.
