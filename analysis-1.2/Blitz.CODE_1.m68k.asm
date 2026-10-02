; Linear Motorola 68000 decode. Offsets include the 4-byte segment header.
; Embedded data/strings may decode as instructions; control flow is not yet fully verified.
; CODE 0 is a jump table and is preserved as raw data, not disassembled.
; Segment header: 00000001

00000004 | 9dce                     | suba.l       a6, a6                              ; arithmetic operation; flags depend on variant
00000006 | 598f                     | subq.l       #$4, a7                             ; arithmetic operation; flags depend on variant
00000008 | 2f3c434f4445             | move.l       #$434f4445, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
0000000e | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00000010 | a9a0                     | dc.w         $a9a0                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000012 | 2017                     | move.l       (a7), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000014 | 670000f2                 | beq.w        $108                                ; branch according to condition flags (bra unconditional, bsr call)
00000018 | 2040                     | movea.l      d0, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000001a | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000001c | 2e18                     | move.l       (a0)+, d7                           ; copy source to destination (Motorola operand order); flags depend on variant
0000001e | 2c10                     | move.l       (a0), d6                            ; copy source to destination (Motorola operand order); flags depend on variant
00000020 | a9a3                     | dc.w         $a9a3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000022 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000024 | 204d                     | movea.l      a5, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000026 | 91c6                     | suba.l       d6, a0                              ; arithmetic operation; flags depend on variant
00000028 | 6002                     | bra.b        $2c                                 ; branch according to condition flags (bra unconditional, bsr call)
0000002a | 10c0                     | move.b       d0, (a0)+                           ; copy source to destination (Motorola operand order); flags depend on variant
0000002c | b1cd                     | cmpa.l       a5, a0                              ; compare operands; set condition flags
0000002e | 6dfa                     | blt.b        $2a                                 ; branch according to condition flags (bra unconditional, bsr call)
00000030 | 41ed0028                 | lea.l        $28(a5), a0                         ; machine operation; verify instruction and data boundaries
00000034 | 43f57800                 | lea.l        (a5, d7.l), a1                      ; machine operation; verify instruction and data boundaries
00000038 | 6002                     | bra.b        $3c                                 ; branch according to condition flags (bra unconditional, bsr call)
0000003a | 10c0                     | move.b       d0, (a0)+                           ; copy source to destination (Motorola operand order); flags depend on variant
0000003c | b1c9                     | cmpa.l       a1, a0                              ; compare operands; set condition flags
0000003e | 6dfa                     | blt.b        $3a                                 ; branch according to condition flags (bra unconditional, bsr call)
00000040 | 598f                     | subq.l       #$4, a7                             ; arithmetic operation; flags depend on variant
00000042 | 2f3c44415441             | move.l       #$44415441, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000048 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
0000004a | a9a0                     | dc.w         $a9a0                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000004c | 2057                     | movea.l      (a7), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000004e | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000050 | 670000b6                 | beq.w        $108                                ; branch according to condition flags (bra unconditional, bsr call)
00000054 | 2f0d                     | move.l       a5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000056 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000058 | 48680004                 | pea.l        $4(a0)                              ; machine operation; verify instruction and data boundaries
0000005c | 4eba00b0                 | jsr          $10e(pc)                            ; call subroutine; push return address
00000060 | 508f                     | addq.l       #$8, a7                             ; arithmetic operation; flags depend on variant
00000062 | 43faff9c                 | lea.l        $0(pc), a1                          ; machine operation; verify instruction and data boundaries
00000066 | 2b49ea30                 | move.l       a1, -$15d0(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000006a | 224d                     | movea.l      a5, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
0000006c | 4eba0218                 | jsr          $286(pc)                            ; call subroutine; push return address
00000070 | 226dea30                 | movea.l      -$15d0(a5), a1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000074 | 4eba0210                 | jsr          $286(pc)                            ; call subroutine; push return address
00000078 | a9a3                     | dc.w         $a9a3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000007a | 4eba0296                 | jsr          $312(pc)                            ; call subroutine; push return address
0000007e | 422dea35                 | clr.b        -$15cb(a5)                          ; bit/integer operation; flags depend on variant
00000082 | 303ca89f                 | move.w       #$a89f, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000086 | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000088 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000008a | 303ca198                 | move.w       #$a198, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000008e | a346                     | dc.w         $a346                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000090 | b1df                     | cmpa.l       (a7)+, a0                           ; compare operands; set condition flags
00000092 | 670a                     | beq.b        $9e                                 ; branch according to condition flags (bra unconditional, bsr call)
00000094 | 1b7c0001ea35             | move.b       #$1, -$15cb(a5)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000009a | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000009c | a198                     | dc.w         $a198                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000009e | 303ca9f0                 | move.w       #$a9f0, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000000a2 | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000000a4 | 2b48ea2c                 | move.l       a0, -$15d4(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
000000a8 | 303ca9f1                 | move.w       #$a9f1, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000000ac | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000000ae | 2b48ea28                 | move.l       a0, -$15d8(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
000000b2 | 303ca9f4                 | move.w       #$a9f4, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000000b6 | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000000b8 | 2b48ea24                 | move.l       a0, -$15dc(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
000000bc | 303ca9f0                 | move.w       #$a9f0, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000000c0 | 41fa0268                 | lea.l        $32a(pc), a0                        ; machine operation; verify instruction and data boundaries
000000c4 | a647                     | dc.w         $a647                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000000c6 | 303ca9f1                 | move.w       #$a9f1, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000000ca | 41fa0324                 | lea.l        $3f0(pc), a0                        ; machine operation; verify instruction and data boundaries
000000ce | a647                     | dc.w         $a647                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000000d0 | 303ca9f4                 | move.w       #$a9f4, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000000d4 | 41fa002e                 | lea.l        $104(pc), a0                        ; machine operation; verify instruction and data boundaries
000000d8 | a647                     | dc.w         $a647                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000000da | 4eb900000488             | jsr          $488.l                              ; call subroutine; push return address
000000e0 | 4eb900000562             | jsr          $562.l                              ; call subroutine; push return address
000000e6 | 487a0022                 | pea.l        $10a(pc)                            ; machine operation; verify instruction and data boundaries
000000ea | 4a2dffff                 | tst.b        -$1(a5)                             ; machine operation; verify instruction and data boundaries
000000ee | 6702                     | beq.b        $f2                                 ; branch according to condition flags (bra unconditional, bsr call)
000000f0 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000000f2 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000000f4 | 4eb900000564             | jsr          $564.l                              ; call subroutine; push return address
000000fa | 5c8f                     | addq.l       #$6, a7                             ; arithmetic operation; flags depend on variant
000000fc | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000000fe | 4eb900000028             | jsr          $28.l                               ; call subroutine; push return address
00000104 | 4eba0384                 | jsr          $48a(pc)                            ; call subroutine; push return address
00000108 | a9f4                     | dc.w         $a9f4                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000010a | 00000000                 | ori.b        #$0, d0                             ; bit/integer operation; flags depend on variant
0000010e | 48e71c30                 | movem.l      d3-d5/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000112 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000114 | 266f001c                 | movea.l      $1c(a7), a3                         ; copy source to destination (Motorola operand order); flags depend on variant
00000118 | 7800                     | moveq        #$0, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
0000011a | 600000e4                 | bra.w        $200                                ; branch according to condition flags (bra unconditional, bsr call)
0000011e | 1e9b                     | move.b       (a3)+, (a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000120 | 1f5b0001                 | move.b       (a3)+, $1(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000124 | 1f5b0002                 | move.b       (a3)+, $2(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000128 | 1f5b0003                 | move.b       (a3)+, $3(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000012c | 246f0020                 | movea.l      $20(a7), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
00000130 | d5d7                     | adda.l       (a7), a2                            ; arithmetic operation; flags depend on variant
00000132 | 161b                     | move.b       (a3)+, d3                           ; copy source to destination (Motorola operand order); flags depend on variant
00000134 | 4883                     | ext.w        d3                                  ; bit/integer operation; flags depend on variant
00000136 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000138 | 02400080                 | andi.w       #$80, d0                            ; bit/integer operation; flags depend on variant
0000013c | 670e                     | beq.b        $14c                                ; branch according to condition flags (bra unconditional, bsr call)
0000013e | 0243007f                 | andi.w       #$7f, d3                            ; bit/integer operation; flags depend on variant
00000142 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
00000144 | 5343                     | subq.w       #$1, d3                             ; arithmetic operation; flags depend on variant
00000146 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00000148 | 6cf8                     | bge.b        $142                                ; branch according to condition flags (bra unconditional, bsr call)
0000014a | 60e6                     | bra.b        $132                                ; branch according to condition flags (bra unconditional, bsr call)
0000014c | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000014e | 02400040                 | andi.w       #$40, d0                            ; bit/integer operation; flags depend on variant
00000152 | 670e                     | beq.b        $162                                ; branch according to condition flags (bra unconditional, bsr call)
00000154 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000156 | 0240003f                 | andi.w       #$3f, d0                            ; bit/integer operation; flags depend on variant
0000015a | 5240                     | addq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
0000015c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000015e | d5c0                     | adda.l       d0, a2                              ; arithmetic operation; flags depend on variant
00000160 | 60d0                     | bra.b        $132                                ; branch according to condition flags (bra unconditional, bsr call)
00000162 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000164 | 02400020                 | andi.w       #$20, d0                            ; bit/integer operation; flags depend on variant
00000168 | 670a                     | beq.b        $174                                ; branch according to condition flags (bra unconditional, bsr call)
0000016a | 0243001f                 | andi.w       #$1f, d3                            ; bit/integer operation; flags depend on variant
0000016e | 5243                     | addq.w       #$1, d3                             ; arithmetic operation; flags depend on variant
00000170 | 1a1b                     | move.b       (a3)+, d5                           ; copy source to destination (Motorola operand order); flags depend on variant
00000172 | 600e                     | bra.b        $182                                ; branch according to condition flags (bra unconditional, bsr call)
00000174 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000176 | 02400010                 | andi.w       #$10, d0                            ; bit/integer operation; flags depend on variant
0000017a | 6710                     | beq.b        $18c                                ; branch according to condition flags (bra unconditional, bsr call)
0000017c | 0243000f                 | andi.w       #$f, d3                             ; bit/integer operation; flags depend on variant
00000180 | 7aff                     | moveq        #$ff, d5                            ; copy source to destination (Motorola operand order); flags depend on variant
00000182 | 14c5                     | move.b       d5, (a2)+                           ; copy source to destination (Motorola operand order); flags depend on variant
00000184 | 5343                     | subq.w       #$1, d3                             ; arithmetic operation; flags depend on variant
00000186 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00000188 | 6cf8                     | bge.b        $182                                ; branch according to condition flags (bra unconditional, bsr call)
0000018a | 60a6                     | bra.b        $132                                ; branch according to condition flags (bra unconditional, bsr call)
0000018c | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000018e | 0c400004                 | cmpi.w       #$4, d0                             ; compare operands; set condition flags
00000192 | 6264                     | bhi.b        $1f8                                ; branch according to condition flags (bra unconditional, bsr call)
00000194 | d040                     | add.w        d0, d0                              ; arithmetic operation; flags depend on variant
00000196 | 303b0006                 | move.w       $19e(pc, d0.w), d0                  ; copy source to destination (Motorola operand order); flags depend on variant
0000019a | 4efb0002                 | jmp          $19e(pc, d0.w)                      ; machine operation; verify instruction and data boundaries
0000019e | 0060000a                 | ori.w        #$a, -(a0)                          ; bit/integer operation; flags depend on variant
000001a2 | 001c002c                 | ori.b        #$2c, (a4)+                         ; bit/integer operation; flags depend on variant
000001a6 | 0042588a                 | ori.w        #$588a, d2                          ; bit/integer operation; flags depend on variant
000001aa | 14fcffff                 | move.b       #$ff, (a2)+                         ; copy source to destination (Motorola operand order); flags depend on variant
000001ae | 14fcffff                 | move.b       #$ff, (a2)+                         ; copy source to destination (Motorola operand order); flags depend on variant
000001b2 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001b4 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001b6 | 6000ff7a                 | bra.w        $132                                ; branch according to condition flags (bra unconditional, bsr call)
000001ba | 588a                     | addq.l       #$4, a2                             ; arithmetic operation; flags depend on variant
000001bc | 14fcffff                 | move.b       #$ff, (a2)+                         ; copy source to destination (Motorola operand order); flags depend on variant
000001c0 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001c2 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001c4 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001c6 | 6000ff6a                 | bra.w        $132                                ; branch according to condition flags (bra unconditional, bsr call)
000001ca | 14fcffa9                 | move.b       #$a9, (a2)+                         ; copy source to destination (Motorola operand order); flags depend on variant
000001ce | 14fcfff0                 | move.b       #$f0, (a2)+                         ; copy source to destination (Motorola operand order); flags depend on variant
000001d2 | 548a                     | addq.l       #$2, a2                             ; arithmetic operation; flags depend on variant
000001d4 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001d6 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001d8 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
000001da | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001dc | 6000ff54                 | bra.w        $132                                ; branch according to condition flags (bra unconditional, bsr call)
000001e0 | 14fcffa9                 | move.b       #$a9, (a2)+                         ; copy source to destination (Motorola operand order); flags depend on variant
000001e4 | 14fcfff0                 | move.b       #$f0, (a2)+                         ; copy source to destination (Motorola operand order); flags depend on variant
000001e8 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
000001ea | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001ec | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001ee | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001f0 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
000001f2 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000001f4 | 6000ff3c                 | bra.w        $132                                ; branch according to condition flags (bra unconditional, bsr call)
000001f8 | 3f3c000f                 | move.w       #$f, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000001fc | a9c9                     | dc.w         $a9c9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000001fe | 5244                     | addq.w       #$1, d4                             ; arithmetic operation; flags depend on variant
00000200 | 0c440003                 | cmpi.w       #$3, d4                             ; compare operands; set condition flags
00000204 | 6d00ff18                 | blt.w        $11e                                ; branch according to condition flags (bra unconditional, bsr call)
00000208 | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000020a | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000020c | 4cdf0c38                 | movem.l      (a7)+, d3-d5/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
00000210 | 4e75                     | rts                                              ; return: pop return address from stack
00000212 | 2f05                     | move.l       d5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000214 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000216 | 226f000c                 | movea.l      $c(a7), a1                          ; copy source to destination (Motorola operand order); flags depend on variant
0000021a | 1e99                     | move.b       (a1)+, (a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000021c | 1f590001                 | move.b       (a1)+, $1(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000220 | 1f590002                 | move.b       (a1)+, $2(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000224 | 1f590003                 | move.b       (a1)+, $3(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000228 | 2a17                     | move.l       (a7), d5                            ; copy source to destination (Motorola operand order); flags depend on variant
0000022a | 7400                     | moveq        #$0, d2                             ; copy source to destination (Motorola operand order); flags depend on variant
0000022c | 604c                     | bra.b        $27a                                ; branch according to condition flags (bra unconditional, bsr call)
0000022e | 1219                     | move.b       (a1)+, d1                           ; copy source to destination (Motorola operand order); flags depend on variant
00000230 | 1001                     | move.b       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000232 | 02400080                 | andi.w       #$80, d0                            ; bit/integer operation; flags depend on variant
00000236 | 670c                     | beq.b        $244                                ; branch according to condition flags (bra unconditional, bsr call)
00000238 | d201                     | add.b        d1, d1                              ; arithmetic operation; flags depend on variant
0000023a | 1001                     | move.b       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000023c | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
0000023e | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000240 | d480                     | add.l        d0, d2                              ; arithmetic operation; flags depend on variant
00000242 | 6028                     | bra.b        $26c                                ; branch according to condition flags (bra unconditional, bsr call)
00000244 | 1e81                     | move.b       d1, (a7)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000246 | 1f590001                 | move.b       (a1)+, $1(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000024a | 1001                     | move.b       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000024c | 02400040                 | andi.w       #$40, d0                            ; bit/integer operation; flags depend on variant
00000250 | 670c                     | beq.b        $25e                                ; branch according to condition flags (bra unconditional, bsr call)
00000252 | 3017                     | move.w       (a7), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000254 | e548                     | lsl.w        #$2, d0                             ; bit/integer operation; flags depend on variant
00000256 | e240                     | asr.w        #$1, d0                             ; bit/integer operation; flags depend on variant
00000258 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000025a | d480                     | add.l        d0, d2                              ; arithmetic operation; flags depend on variant
0000025c | 600e                     | bra.b        $26c                                ; branch according to condition flags (bra unconditional, bsr call)
0000025e | 1f590002                 | move.b       (a1)+, $2(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000262 | 1f590003                 | move.b       (a1)+, $3(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000266 | 2417                     | move.l       (a7), d2                            ; copy source to destination (Motorola operand order); flags depend on variant
00000268 | e58a                     | lsl.l        #$2, d2                             ; bit/integer operation; flags depend on variant
0000026a | e282                     | asr.l        #$1, d2                             ; bit/integer operation; flags depend on variant
0000026c | 206f0010                 | movea.l      $10(a7), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000270 | 202f0014                 | move.l       $14(a7), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000274 | d1b02800                 | add.l        d0, (a0, d2.l)                      ; arithmetic operation; flags depend on variant
00000278 | 5385                     | subq.l       #$1, d5                             ; arithmetic operation; flags depend on variant
0000027a | 4a85                     | tst.l        d5                                  ; machine operation; verify instruction and data boundaries
0000027c | 6eb0                     | bgt.b        $22e                                ; branch according to condition flags (bra unconditional, bsr call)
0000027e | 2049                     | movea.l      a1, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000280 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000282 | 2a1f                     | move.l       (a7)+, d5                           ; copy source to destination (Motorola operand order); flags depend on variant
00000284 | 4e75                     | rts                                              ; return: pop return address from stack
00000286 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000288 | 2449                     | movea.l      a1, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000028a | 2f0d                     | move.l       a5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000028c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000028e | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000290 | 4ebaff80                 | jsr          $212(pc)                            ; call subroutine; push return address
00000294 | 2f2dea30                 | move.l       -$15d0(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000298 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000029a | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000029c | 4ebaff74                 | jsr          $212(pc)                            ; call subroutine; push return address
000002a0 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002a2 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002a4 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002a6 | 4ebaff6a                 | jsr          $212(pc)                            ; call subroutine; push return address
000002aa | 4fef0024                 | lea.l        $24(a7), a7                         ; machine operation; verify instruction and data boundaries
000002ae | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
000002b0 | 4e75                     | rts                                              ; return: pop return address from stack
000002b2 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002b4 | 2449                     | movea.l      a1, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000002b6 | 2f0d                     | move.l       a5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002b8 | 4497                     | neg.l        (a7)                                ; machine operation; verify instruction and data boundaries
000002ba | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002bc | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002be | 4ebaff52                 | jsr          $212(pc)                            ; call subroutine; push return address
000002c2 | 2f2dea30                 | move.l       -$15d0(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000002c6 | 4497                     | neg.l        (a7)                                ; machine operation; verify instruction and data boundaries
000002c8 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002ca | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002cc | 4ebaff44                 | jsr          $212(pc)                            ; call subroutine; push return address
000002d0 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002d2 | 4497                     | neg.l        (a7)                                ; machine operation; verify instruction and data boundaries
000002d4 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002d6 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002d8 | 4ebaff38                 | jsr          $212(pc)                            ; call subroutine; push return address
000002dc | 4fef0024                 | lea.l        $24(a7), a7                         ; machine operation; verify instruction and data boundaries
000002e0 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
000002e2 | 4e75                     | rts                                              ; return: pop return address from stack
000002e4 | bbfa0028                 | cmpa.l       $30e(pc), a5                        ; compare operands; set condition flags
000002e8 | 6602                     | bne.b        $2ec                                ; branch according to condition flags (bra unconditional, bsr call)
000002ea | 4e75                     | rts                                              ; return: pop return address from stack
000002ec | 48e70084                 | movem.l      a0/a5, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000002f0 | 2a7a001c                 | movea.l      $30e(pc), a5                        ; copy source to destination (Motorola operand order); flags depend on variant
000002f4 | 206dea2c                 | movea.l      -$15d4(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000002f8 | 4a6f000c                 | tst.w        $c(a7)                              ; machine operation; verify instruction and data boundaries
000002fc | 6604                     | bne.b        $302                                ; branch according to condition flags (bra unconditional, bsr call)
000002fe | 206dea28                 | movea.l      -$15d8(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000302 | 2f48000a                 | move.l       a0, $a(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000306 | 4cdf2100                 | movem.l      (a7)+, a0/a5                        ; copy source to destination (Motorola operand order); flags depend on variant
0000030a | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000030c | 4e75                     | rts                                              ; return: pop return address from stack
0000030e | 00000000                 | ori.b        #$0, d0                             ; bit/integer operation; flags depend on variant
00000312 | 41fafffa                 | lea.l        $30e(pc), a0                        ; machine operation; verify instruction and data boundaries
00000316 | 208d                     | move.l       a5, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000318 | 4e75                     | rts                                              ; return: pop return address from stack
0000031a | 43f9000001fe             | lea.l        $1fe.l, a1                          ; machine operation; verify instruction and data boundaries
00000320 | c0fc0010                 | mulu.w       #$10, d0                            ; arithmetic operation; flags depend on variant
00000324 | 238808f0                 | move.l       a0, -$10(a1, d0.l)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000328 | 4e75                     | rts                                              ; return: pop return address from stack
0000032a | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000032e | 4ebaffb4                 | jsr          $2e4(pc)                            ; call subroutine; push return address
00000332 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000334 | 48e7e0e0                 | movem.l      d0-d2/a0-a2, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000338 | 55af0018                 | subq.l       #$2, $18(a7)                        ; arithmetic operation; flags depend on variant
0000033c | 246f0018                 | movea.l      $18(a7), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
00000340 | 202dea36                 | move.l       -$15ca(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000344 | 670a                     | beq.b        $350                                ; branch according to condition flags (bra unconditional, bsr call)
00000346 | 2040                     | movea.l      d0, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000348 | 3f2a0006                 | move.w       $6(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000034c | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
0000034e | 548f                     | addq.l       #$2, a7                             ; arithmetic operation; flags depend on variant
00000350 | 50f80a5e                 | st.b         $a5e.w                              ; machine operation; verify instruction and data boundaries
00000354 | 598f                     | subq.l       #$4, a7                             ; arithmetic operation; flags depend on variant
00000356 | 2f3c434f4445             | move.l       #$434f4445, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
0000035c | 3f2a0006                 | move.w       $6(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000360 | a9a0                     | dc.w         $a9a0                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000362 | 2017                     | move.l       (a7), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000364 | 6616                     | bne.b        $37c                                ; branch according to condition flags (bra unconditional, bsr call)
00000366 | 202dea42                 | move.l       -$15be(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000036a | 6604                     | bne.b        $370                                ; branch according to condition flags (bra unconditional, bsr call)
0000036c | 700f                     | moveq        #$f, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000036e | a9c9                     | dc.w         $a9c9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000370 | 2040                     | movea.l      d0, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000372 | 3f2a0006                 | move.w       $6(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000376 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00000378 | 548f                     | addq.l       #$2, a7                             ; arithmetic operation; flags depend on variant
0000037a | 60da                     | bra.b        $356                                ; branch according to condition flags (bra unconditional, bsr call)
0000037c | 4a380bb2                 | tst.b        $bb2.w                              ; machine operation; verify instruction and data boundaries
00000380 | 6704                     | beq.b        $386                                ; branch according to condition flags (bra unconditional, bsr call)
00000382 | 2040                     | movea.l      d0, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000384 | a064                     | dc.w         $a064                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000386 | 2057                     | movea.l      (a7), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000388 | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000038a | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000038c | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000038e | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000390 | a055                     | dc.w         $a055                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000392 | 2040                     | movea.l      d0, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000394 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000396 | 302a0006                 | move.w       $6(a2), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000039a | 4ebaff7e                 | jsr          $31a(pc)                            ; call subroutine; push return address
0000039e | 2248                     | movea.l      a0, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
000003a0 | d1e80008                 | adda.l       $8(a0), a0                          ; arithmetic operation; flags depend on variant
000003a4 | 4ebafee0                 | jsr          $286(pc)                            ; call subroutine; push return address
000003a8 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000003aa | 224d                     | movea.l      a5, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
000003ac | d3e80004                 | adda.l       $4(a0), a1                          ; arithmetic operation; flags depend on variant
000003b0 | 30280002                 | move.w       $2(a0), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000003b4 | 2208                     | move.l       a0, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
000003b6 | 600c                     | bra.b        $3c4                                ; branch according to condition flags (bra unconditional, bsr call)
000003b8 | 337c4ef90000             | move.w       #$4ef9, $0(a1)                      ; copy source to destination (Motorola operand order); flags depend on variant
000003be | d3a90002                 | add.l        d1, $2(a1)                          ; arithmetic operation; flags depend on variant
000003c2 | 5089                     | addq.l       #$8, a1                             ; arithmetic operation; flags depend on variant
000003c4 | 51c8fff2                 | dbra         d0, $3b8                            ; machine operation; verify instruction and data boundaries
000003c8 | 4a2dea35                 | tst.b        -$15cb(a5)                          ; machine operation; verify instruction and data boundaries
000003cc | 6704                     | beq.b        $3d2                                ; branch according to condition flags (bra unconditional, bsr call)
000003ce | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000003d0 | a198                     | dc.w         $a198                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000003d2 | 202dea3a                 | move.l       -$15c6(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000003d6 | 670a                     | beq.b        $3e2                                ; branch according to condition flags (bra unconditional, bsr call)
000003d8 | 2040                     | movea.l      d0, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000003da | 3f2a0006                 | move.w       $6(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000003de | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
000003e0 | 548f                     | addq.l       #$2, a7                             ; arithmetic operation; flags depend on variant
000003e2 | 4cdf0707                 | movem.l      (a7)+, d0-d2/a0-a2                  ; copy source to destination (Motorola operand order); flags depend on variant
000003e6 | 4a38012d                 | tst.b        $12d.w                              ; machine operation; verify instruction and data boundaries
000003ea | 6702                     | beq.b        $3ee                                ; branch according to condition flags (bra unconditional, bsr call)
000003ec | a9ff                     | dc.w         $a9ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000003ee | 4e75                     | rts                                              ; return: pop return address from stack
000003f0 | 3f3c0000                 | move.w       #$0, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000003f4 | 4ebafeee                 | jsr          $2e4(pc)                            ; call subroutine; push return address
000003f8 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000003fa | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000003fc | 246f0008                 | movea.l      $8(a7), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00000400 | 0c6a4ef90000             | cmpi.w       #$4ef9, $0(a2)                      ; compare operands; set condition flags
00000406 | 667a                     | bne.b        $482                                ; branch according to condition flags (bra unconditional, bsr call)
00000408 | 0c6a00020006             | cmpi.w       #$2, $6(a2)                         ; compare operands; set condition flags
0000040e | 6d72                     | blt.b        $482                                ; branch according to condition flags (bra unconditional, bsr call)
00000410 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
00000412 | 302a0006                 | move.w       $6(a2), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000416 | 4ebaff02                 | jsr          $31a(pc)                            ; call subroutine; push return address
0000041a | 598f                     | subq.l       #$4, a7                             ; arithmetic operation; flags depend on variant
0000041c | 2f3c434f4445             | move.l       #$434f4445, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000422 | 3f2a0006                 | move.w       $6(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000426 | a9a0                     | dc.w         $a9a0                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000428 | 2017                     | move.l       (a7), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000042a | 6604                     | bne.b        $430                                ; branch according to condition flags (bra unconditional, bsr call)
0000042c | 588f                     | addq.l       #$4, a7                             ; arithmetic operation; flags depend on variant
0000042e | 6052                     | bra.b        $482                                ; branch according to condition flags (bra unconditional, bsr call)
00000430 | 2040                     | movea.l      d0, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000432 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000434 | 2248                     | movea.l      a0, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000436 | d1e80008                 | adda.l       $8(a0), a0                          ; arithmetic operation; flags depend on variant
0000043a | 4ebafe76                 | jsr          $2b2(pc)                            ; call subroutine; push return address
0000043e | 2057                     | movea.l      (a7), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000440 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000442 | 224d                     | movea.l      a5, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000444 | d3e80004                 | adda.l       $4(a0), a1                          ; arithmetic operation; flags depend on variant
00000448 | 30280002                 | move.w       $2(a0), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000044c | 2208                     | move.l       a0, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
0000044e | 600c                     | bra.b        $45c                                ; branch according to condition flags (bra unconditional, bsr call)
00000450 | 337ca9f00000             | move.w       #$a9f0, $0(a1)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000456 | 93a90002                 | sub.l        d1, $2(a1)                          ; arithmetic operation; flags depend on variant
0000045a | 5089                     | addq.l       #$8, a1                             ; arithmetic operation; flags depend on variant
0000045c | 51c8fff2                 | dbra         d0, $450                            ; machine operation; verify instruction and data boundaries
00000460 | 2057                     | movea.l      (a7), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000462 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000464 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000466 | a049                     | dc.w         $a049                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000468 | 4a2dea35                 | tst.b        -$15cb(a5)                          ; machine operation; verify instruction and data boundaries
0000046c | 6704                     | beq.b        $472                                ; branch according to condition flags (bra unconditional, bsr call)
0000046e | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000470 | a198                     | dc.w         $a198                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000472 | 202dea3e                 | move.l       -$15c2(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000476 | 670a                     | beq.b        $482                                ; branch according to condition flags (bra unconditional, bsr call)
00000478 | 2040                     | movea.l      d0, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000047a | 3f2a0006                 | move.w       $6(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000047e | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00000480 | 548f                     | addq.l       #$2, a7                             ; arithmetic operation; flags depend on variant
00000482 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
00000484 | 2e9f                     | move.l       (a7)+, (a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000486 | 4e75                     | rts                                              ; return: pop return address from stack
00000488 | 4e75                     | rts                                              ; return: pop return address from stack
0000048a | 2a780904                 | movea.l      $904.w, a5                          ; copy source to destination (Motorola operand order); flags depend on variant
0000048e | 303ca9f4                 | move.w       #$a9f4, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000492 | 206dea24                 | movea.l      -$15dc(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000496 | a647                     | dc.w         $a647                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000498 | 303ca9f0                 | move.w       #$a9f0, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000049c | 206dea2c                 | movea.l      -$15d4(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000004a0 | a647                     | dc.w         $a647                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000004a2 | 303ca9f1                 | move.w       #$a9f1, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000004a6 | 206dea28                 | movea.l      -$15d8(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000004aa | a647                     | dc.w         $a647                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000004ac | 4e75                     | rts                                              ; return: pop return address from stack
000004ae | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000004b0 | 6014                     | bra.b        $4c6                                ; branch according to condition flags (bra unconditional, bsr call)
000004b2 | 2b52ea46                 | move.l       (a2), -$15ba(a5)                    ; copy source to destination (Motorola operand order); flags depend on variant
000004b6 | 3f3cffff                 | move.w       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000004ba | 2f2a0008                 | move.l       $8(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000004be | 206a0004                 | movea.l      $4(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000004c2 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
000004c4 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
000004c6 | 246dea46                 | movea.l      -$15ba(a5), a2                      ; copy source to destination (Motorola operand order); flags depend on variant
000004ca | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000004cc | 66e4                     | bne.b        $4b2                                ; branch according to condition flags (bra unconditional, bsr call)
000004ce | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
000004d0 | 4e75                     | rts                                              ; return: pop return address from stack
000004d2 | 48e73000                 | movem.l      d2-d3, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000004d6 | 7402                     | moveq        #$2, d2                             ; copy source to destination (Motorola operand order); flags depend on variant
000004d8 | 4efb2200                 | jmp          $4da(pc,d2.w * 2)                   ; machine operation; verify instruction and data boundaries
000004dc | 600a                     | bra.b        $4e8                                ; branch according to condition flags (bra unconditional, bsr call)
000004de | 4c01                     | dc.w         $4c01                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000004e0 | 00004cdf                 | ori.b        #$df, d0                            ; bit/integer operation; flags depend on variant
000004e4 | 000c                     | .word ; undecoded bytes / possible Macintosh A-line trap
000004e6 | 4e75                     | rts                                              ; return: pop return address from stack
000004e8 | 2400                     | move.l       d0, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
000004ea | 4842                     | swap         d2                                  ; bit/integer operation; flags depend on variant
000004ec | c4c1                     | mulu.w       d1, d2                              ; arithmetic operation; flags depend on variant
000004ee | 2601                     | move.l       d1, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000004f0 | 4843                     | swap         d3                                  ; bit/integer operation; flags depend on variant
000004f2 | c6c0                     | mulu.w       d0, d3                              ; arithmetic operation; flags depend on variant
000004f4 | d443                     | add.w        d3, d2                              ; arithmetic operation; flags depend on variant
000004f6 | 4842                     | swap         d2                                  ; bit/integer operation; flags depend on variant
000004f8 | 4242                     | clr.w        d2                                  ; bit/integer operation; flags depend on variant
000004fa | c0c1                     | mulu.w       d1, d0                              ; arithmetic operation; flags depend on variant
000004fc | d082                     | add.l        d2, d0                              ; arithmetic operation; flags depend on variant
000004fe | 4cdf000c                 | movem.l      (a7)+, d2-d3                        ; copy source to destination (Motorola operand order); flags depend on variant
00000502 | 4e75                     | rts                                              ; return: pop return address from stack
00000504 | 48e73000                 | movem.l      d2-d3, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000508 | 7402                     | moveq        #$2, d2                             ; copy source to destination (Motorola operand order); flags depend on variant
0000050a | 4efb2200                 | jmp          $50c(pc,d2.w * 2)                   ; machine operation; verify instruction and data boundaries
0000050e | 600a                     | bra.b        $51a                                ; branch according to condition flags (bra unconditional, bsr call)
00000510 | 4c41                     | dc.w         $4c41                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000512 | 00004cdf                 | ori.b        #$df, d0                            ; bit/integer operation; flags depend on variant
00000516 | 000c                     | .word ; undecoded bytes / possible Macintosh A-line trap
00000518 | 4e75                     | rts                                              ; return: pop return address from stack
0000051a | 2401                     | move.l       d1, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000051c | 4242                     | clr.w        d2                                  ; bit/integer operation; flags depend on variant
0000051e | 4842                     | swap         d2                                  ; bit/integer operation; flags depend on variant
00000520 | 661c                     | bne.b        $53e                                ; branch according to condition flags (bra unconditional, bsr call)
00000522 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000524 | 4240                     | clr.w        d0                                  ; bit/integer operation; flags depend on variant
00000526 | 4840                     | swap         d0                                  ; bit/integer operation; flags depend on variant
00000528 | 6706                     | beq.b        $530                                ; branch according to condition flags (bra unconditional, bsr call)
0000052a | 80c1                     | divu.w       d1, d0                              ; arithmetic operation; flags depend on variant
0000052c | 3400                     | move.w       d0, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000052e | 4842                     | swap         d2                                  ; bit/integer operation; flags depend on variant
00000530 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000532 | 80c1                     | divu.w       d1, d0                              ; arithmetic operation; flags depend on variant
00000534 | 3400                     | move.w       d0, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
00000536 | 2002                     | move.l       d2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000538 | 4cdf000c                 | movem.l      (a7)+, d2-d3                        ; copy source to destination (Motorola operand order); flags depend on variant
0000053c | 4e75                     | rts                                              ; return: pop return address from stack
0000053e | 3400                     | move.w       d0, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
00000540 | 4240                     | clr.w        d0                                  ; bit/integer operation; flags depend on variant
00000542 | 4840                     | swap         d0                                  ; bit/integer operation; flags depend on variant
00000544 | 4842                     | swap         d2                                  ; bit/integer operation; flags depend on variant
00000546 | 2601                     | move.l       d1, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000548 | 720f                     | moveq        #$f, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
0000054a | d482                     | add.l        d2, d2                              ; arithmetic operation; flags depend on variant
0000054c | d180                     | addx.l       d0, d0                              ; arithmetic operation; flags depend on variant
0000054e | b083                     | cmp.l        d3, d0                              ; compare operands; set condition flags
00000550 | 6504                     | bcs.b        $556                                ; branch according to condition flags (bra unconditional, bsr call)
00000552 | 9083                     | sub.l        d3, d0                              ; arithmetic operation; flags depend on variant
00000554 | 5202                     | addq.b       #$1, d2                             ; arithmetic operation; flags depend on variant
00000556 | 51c9fff2                 | dbra         d1, $54a                            ; machine operation; verify instruction and data boundaries
0000055a | 2002                     | move.l       d2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000055c | 4cdf000c                 | movem.l      (a7)+, d2-d3                        ; copy source to destination (Motorola operand order); flags depend on variant
00000560 | 4e75                     | rts                                              ; return: pop return address from stack
00000562 | 4e75                     | rts                                              ; return: pop return address from stack
00000564 | 4e56ff4e                 | link.w       a6, #$ff4e                          ; establish stack frame
00000568 | 48e71e20                 | movem.l      d3-d6/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000056c | 486deb14                 | pea.l        -$14ec(a5)                          ; machine operation; verify instruction and data boundaries
00000570 | a86e                     | dc.w         $a86e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000572 | a912                     | dc.w         $a912                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000574 | a930                     | dc.w         $a930                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000576 | a850                     | dc.w         $a850                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000578 | a063                     | dc.w         $a063                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000057a | 2f3c0000ffff             | move.l       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000580 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000582 | a032                     | dc.w         $a032                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000584 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000586 | aa32                     | dc.w         $aa32                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000588 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000058a | 2b48eba2                 | move.l       a0, -$145e(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000058e | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000590 | 2b680016eba6             | move.l       $16(a0), -$145a(a5)                 ; copy source to destination (Motorola operand order); flags depend on variant
00000596 | 486dfdfa                 | pea.l        -$206(a5)                           ; machine operation; verify instruction and data boundaries
0000059a | 486dfdf0                 | pea.l        -$210(a5)                           ; machine operation; verify instruction and data boundaries
0000059e | 4eb900000040             | jsr          $40.l                               ; call subroutine; push return address
000005a4 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000005a6 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000005a8 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
000005aa | 6700083a                 | beq.w        $de6                                ; branch according to condition flags (bra unconditional, bsr call)
000005ae | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000005b0 | 48780002                 | pea.l        $2.w                                ; machine operation; verify instruction and data boundaries
000005b4 | 48780001                 | pea.l        $1.w                                ; machine operation; verify instruction and data boundaries
000005b8 | 486effba                 | pea.l        -$46(a6)                            ; machine operation; verify instruction and data boundaries
000005bc | 4eb900000048             | jsr          $48.l                               ; call subroutine; push return address
000005c2 | 0c2e0031ffba             | cmpi.b       #$31, -$46(a6)                      ; compare operands; set condition flags
000005c8 | 4fef0010                 | lea.l        $10(a7), a7                         ; machine operation; verify instruction and data boundaries
000005cc | 660c                     | bne.b        $5da                                ; branch according to condition flags (bra unconditional, bsr call)
000005ce | 0c2e0036ffbb             | cmpi.b       #$36, -$45(a6)                      ; compare operands; set condition flags
000005d4 | 6604                     | bne.b        $5da                                ; branch according to condition flags (bra unconditional, bsr call)
000005d6 | 7802                     | moveq        #$2, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
000005d8 | 6002                     | bra.b        $5dc                                ; branch according to condition flags (bra unconditional, bsr call)
000005da | 7801                     | moveq        #$1, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
000005dc | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000005de | 4eb900000038             | jsr          $38.l                               ; call subroutine; push return address
000005e4 | 1004                     | move.b       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000005e6 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
000005e8 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000005ea | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000005ec | 00000b96                 | ori.b        #$96, d0                            ; bit/integer operation; flags depend on variant
000005f0 | 206deba6                 | movea.l      -$145a(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000005f4 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000005f6 | 36280020                 | move.w       $20(a0), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
000005fa | 3a03                     | move.w       d3, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
000005fc | 1004                     | move.b       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000005fe | 49c0                     | dc.w         $49c0                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000600 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00000602 | 5580                     | subq.l       #$2, d0                             ; arithmetic operation; flags depend on variant
00000604 | 6704                     | beq.b        $60a                                ; branch according to condition flags (bra unconditional, bsr call)
00000606 | 600000b2                 | bra.w        $6ba                                ; branch according to condition flags (bra unconditional, bsr call)
0000060a | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000060c | 2f2deba2                 | move.l       -$145e(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000610 | 48780010                 | pea.l        $10.w                               ; machine operation; verify instruction and data boundaries
00000614 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00000616 | 303c0a14                 | move.w       #$a14, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000061a | aaa2                     | dc.w         $aaa2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000061c | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000061e | 67000096                 | beq.w        $6b6                                ; branch according to condition flags (bra unconditional, bsr call)
00000622 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000624 | 2f2deba2                 | move.l       -$145e(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000628 | 48780010                 | pea.l        $10.w                               ; machine operation; verify instruction and data boundaries
0000062c | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
0000062e | 303c0a13                 | move.w       #$a13, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000632 | aaa2                     | dc.w         $aaa2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000634 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000636 | 206deba6                 | movea.l      -$145a(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000063a | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000063c | 36280020                 | move.w       $20(a0), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00000640 | 3f3c0002                 | move.w       #$2, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000644 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000646 | 00000b3c                 | ori.b        #$3c, d0                            ; bit/integer operation; flags depend on variant
0000064a | 41f900000fb4             | lea.l        $fb4.l, a0                          ; machine operation; verify instruction and data boundaries
00000650 | 2b48fc4e                 | move.l       a0, -$3b2(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000654 | 41f9000010a0             | lea.l        $10a0.l, a0                         ; machine operation; verify instruction and data boundaries
0000065a | 2b48fc4a                 | move.l       a0, -$3b6(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000065e | 426deba0                 | clr.w        -$1460(a5)                          ; bit/integer operation; flags depend on variant
00000662 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000664 | 6046                     | bra.b        $6ac                                ; branch according to condition flags (bra unconditional, bsr call)
00000666 | 3c2deba0                 | move.w       -$1460(a5), d6                      ; copy source to destination (Motorola operand order); flags depend on variant
0000066a | 48c6                     | ext.l        d6                                  ; bit/integer operation; flags depend on variant
0000066c | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
0000066e | e3ae                     | lsl.l        d1, d6                              ; bit/integer operation; flags depend on variant
00000670 | 322deba0                 | move.w       -$1460(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000674 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000676 | eb89                     | lsl.l        #$5, d1                             ; bit/integer operation; flags depend on variant
00000678 | 342deba0                 | move.w       -$1460(a5), d2                      ; copy source to destination (Motorola operand order); flags depend on variant
0000067c | 48c2                     | ext.l        d2                                  ; bit/integer operation; flags depend on variant
0000067e | 2d46ff4e                 | move.l       d6, -$b2(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000682 | 2c3c00007fff             | move.l       #$7fff, d6                          ; copy source to destination (Motorola operand order); flags depend on variant
00000688 | 9c82                     | sub.l        d2, d6                              ; arithmetic operation; flags depend on variant
0000068a | 9c81                     | sub.l        d1, d6                              ; arithmetic operation; flags depend on variant
0000068c | 9caeff4e                 | sub.l        -$b2(a6), d6                        ; arithmetic operation; flags depend on variant
00000690 | 41edeb18                 | lea.l        -$14e8(a5), a0                      ; machine operation; verify instruction and data boundaries
00000694 | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000698 | 31860200                 | move.w       d6, (a0, d0.w * 2)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000069c | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000006a0 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000006a2 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000006a4 | 31860a00                 | move.w       d6, (a0, d0.l * 2)                  ; copy source to destination (Motorola operand order); flags depend on variant
000006a8 | 546deba0                 | addq.w       #$2, -$1460(a5)                     ; arithmetic operation; flags depend on variant
000006ac | 0c6d0020eba0             | cmpi.w       #$20, -$1460(a5)                    ; compare operands; set condition flags
000006b2 | 6db2                     | blt.b        $666                                ; branch according to condition flags (bra unconditional, bsr call)
000006b4 | 605e                     | bra.b        $714                                ; branch according to condition flags (bra unconditional, bsr call)
000006b6 | 6000072e                 | bra.w        $de6                                ; branch according to condition flags (bra unconditional, bsr call)
000006ba | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000006bc | 2f2deba2                 | move.l       -$145e(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000006c0 | 48780008                 | pea.l        $8.w                                ; machine operation; verify instruction and data boundaries
000006c4 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000006c6 | 303c0a14                 | move.w       #$a14, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000006ca | aaa2                     | dc.w         $aaa2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000006cc | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000006ce | 6740                     | beq.b        $710                                ; branch according to condition flags (bra unconditional, bsr call)
000006d0 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000006d2 | 2f2deba2                 | move.l       -$145e(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000006d6 | 48780008                 | pea.l        $8.w                                ; machine operation; verify instruction and data boundaries
000006da | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000006dc | 303c0a13                 | move.w       #$a13, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000006e0 | aaa2                     | dc.w         $aaa2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000006e2 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000006e4 | 206deba6                 | movea.l      -$145a(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000006e8 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000006ea | 36280020                 | move.w       $20(a0), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
000006ee | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000006f2 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000006f4 | 00000a8e                 | ori.b        #$8e, d0                            ; bit/integer operation; flags depend on variant
000006f8 | 41f900000dee             | lea.l        $dee.l, a0                          ; machine operation; verify instruction and data boundaries
000006fe | 2b48fc4e                 | move.l       a0, -$3b2(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000702 | 41f900000ed0             | lea.l        $ed0.l, a0                          ; machine operation; verify instruction and data boundaries
00000708 | 2b48fc4a                 | move.l       a0, -$3b6(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000070c | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000070e | 6004                     | bra.b        $714                                ; branch according to condition flags (bra unconditional, bsr call)
00000710 | 600006d4                 | bra.w        $de6                                ; branch according to condition flags (bra unconditional, bsr call)
00000714 | 486dfdfd                 | pea.l        -$203(a5)                           ; machine operation; verify instruction and data boundaries
00000718 | 4eb900000098             | jsr          $98.l                               ; call subroutine; push return address
0000071e | 486effa2                 | pea.l        -$5e(a6)                            ; machine operation; verify instruction and data boundaries
00000722 | 4eb900000080             | jsr          $80.l                               ; call subroutine; push return address
00000728 | 486effa2                 | pea.l        -$5e(a6)                            ; machine operation; verify instruction and data boundaries
0000072c | 4eb900000088             | jsr          $88.l                               ; call subroutine; push return address
00000732 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000734 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000738 | 6706                     | beq.b        $740                                ; branch according to condition flags (bra unconditional, bsr call)
0000073a | 486dfdfe                 | pea.l        -$202(a5)                           ; machine operation; verify instruction and data boundaries
0000073e | abff                     | dc.w         $abff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000740 | 3f3c0080                 | move.w       #$80, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000744 | 2f3c4d414448             | move.l       #$4d414448, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
0000074a | 4eb9000000a8             | jsr          $a8.l                               ; call subroutine; push return address
00000750 | 302deaa2                 | move.w       -$155e(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000754 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000756 | 322deaa6                 | move.w       -$155a(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
0000075a | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000075c | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
0000075e | 2001                     | move.l       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000760 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00000762 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00000764 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00000766 | ee88                     | lsr.l        #$7, d0                             ; bit/integer operation; flags depend on variant
00000768 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
0000076a | e280                     | asr.l        #$1, d0                             ; bit/integer operation; flags depend on variant
0000076c | 3b40eb9c                 | move.w       d0, -$1464(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000770 | 302deaa0                 | move.w       -$1560(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000774 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000776 | 322deaa4                 | move.w       -$155c(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
0000077a | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000077c | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
0000077e | 2001                     | move.l       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000780 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00000782 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00000784 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00000786 | ee88                     | lsr.l        #$7, d0                             ; bit/integer operation; flags depend on variant
00000788 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
0000078a | e280                     | asr.l        #$1, d0                             ; bit/integer operation; flags depend on variant
0000078c | 3b40eb9a                 | move.w       d0, -$1466(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000790 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000792 | 00000bec                 | ori.b        #$ec, d0                            ; bit/integer operation; flags depend on variant
00000796 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00000798 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
0000079a | 6724                     | beq.b        $7c0                                ; branch according to condition flags (bra unconditional, bsr call)
0000079c | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000079e | 00000cbc                 | ori.b        #$bc, d0                            ; bit/integer operation; flags depend on variant
000007a2 | 3b7c0064eba0             | move.w       #$64, -$1460(a5)                    ; copy source to destination (Motorola operand order); flags depend on variant
000007a8 | 6010                     | bra.b        $7ba                                ; branch according to condition flags (bra unconditional, bsr call)
000007aa | 3f2deba0                 | move.w       -$1460(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000007ae | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007b0 | 00000dd4                 | ori.b        #$d4, d0                            ; bit/integer operation; flags depend on variant
000007b4 | 5b6deba0                 | subq.w       #$5, -$1460(a5)                     ; arithmetic operation; flags depend on variant
000007b8 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000007ba | 4a6deba0                 | tst.w        -$1460(a5)                          ; machine operation; verify instruction and data boundaries
000007be | 6cea                     | bge.b        $7aa                                ; branch according to condition flags (bra unconditional, bsr call)
000007c0 | 486effbc                 | pea.l        -$44(a6)                            ; machine operation; verify instruction and data boundaries
000007c4 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000007c6 | 302deaa2                 | move.w       -$155e(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000007ca | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000007cc | 322deaa6                 | move.w       -$155a(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
000007d0 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000007d2 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
000007d4 | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000007d6 | 302deaa0                 | move.w       -$1560(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000007da | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000007dc | 322deaa4                 | move.w       -$155c(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
000007e0 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000007e2 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
000007e4 | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000007e6 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007e8 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000007ea | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000007ec | 486effbc                 | pea.l        -$44(a6)                            ; machine operation; verify instruction and data boundaries
000007f0 | 486dfdfd                 | pea.l        -$203(a5)                           ; machine operation; verify instruction and data boundaries
000007f4 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000007f8 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000007fa | 4878ffff                 | pea.l        $ffff.w                             ; machine operation; verify instruction and data boundaries
000007fe | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
00000800 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00000802 | aa45                     | dc.w         $aa45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000804 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000806 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00000808 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000080a | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000080c | 000009ba                 | ori.b        #$ba, d0                            ; bit/integer operation; flags depend on variant
00000810 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000812 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000814 | 48780021                 | pea.l        $21.w                               ; machine operation; verify instruction and data boundaries
00000818 | a862                     | dc.w         $a862                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000081a | 486effbc                 | pea.l        -$44(a6)                            ; machine operation; verify instruction and data boundaries
0000081e | a8a2                     | dc.w         $a8a2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000820 | a852                     | dc.w         $a852                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000822 | 302deaa0                 | move.w       -$1560(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000826 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000828 | 322deaa4                 | move.w       -$155c(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
0000082c | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000082e | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000830 | 0681ffffff38             | addi.l       #$ffffff38, d1                      ; arithmetic operation; flags depend on variant
00000836 | 2001                     | move.l       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000838 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
0000083a | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
0000083c | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
0000083e | ee88                     | lsr.l        #$7, d0                             ; bit/integer operation; flags depend on variant
00000840 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000842 | e280                     | asr.l        #$1, d0                             ; bit/integer operation; flags depend on variant
00000844 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000846 | 302deaa2                 | move.w       -$155e(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000084a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000084c | 322deaa6                 | move.w       -$155a(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000850 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000852 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000854 | 0681fffffec0             | addi.l       #$fffffec0, d1                      ; arithmetic operation; flags depend on variant
0000085a | 2001                     | move.l       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000085c | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
0000085e | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00000860 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00000862 | ee88                     | lsr.l        #$7, d0                             ; bit/integer operation; flags depend on variant
00000864 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000866 | e280                     | asr.l        #$1, d0                             ; bit/integer operation; flags depend on variant
00000868 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000086a | 3f3c0080                 | move.w       #$80, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000086e | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00000870 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000872 | 000009fc                 | ori.b        #$fc, d0                            ; bit/integer operation; flags depend on variant
00000876 | 426deba0                 | clr.w        -$1460(a5)                          ; bit/integer operation; flags depend on variant
0000087a | 4fef000e                 | lea.l        $e(a7), a7                          ; machine operation; verify instruction and data boundaries
0000087e | 6010                     | bra.b        $890                                ; branch according to condition flags (bra unconditional, bsr call)
00000880 | 3f2deba0                 | move.w       -$1460(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000884 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000886 | 00000cfe                 | ori.b        #$fe, d0                            ; bit/integer operation; flags depend on variant
0000088a | 5a6deba0                 | addq.w       #$5, -$1460(a5)                     ; arithmetic operation; flags depend on variant
0000088e | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000890 | 0c6d0064eba0             | cmpi.w       #$64, -$1460(a5)                    ; compare operands; set condition flags
00000896 | 6fe8                     | ble.b        $880                                ; branch according to condition flags (bra unconditional, bsr call)
00000898 | 426deba0                 | clr.w        -$1460(a5)                          ; bit/integer operation; flags depend on variant
0000089c | 600002b8                 | bra.w        $b56                                ; branch according to condition flags (bra unconditional, bsr call)
000008a0 | 2d7c40068000ff52         | move.l       #$40068000, -$ae(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000008a8 | 42aeff56                 | clr.l        -$aa(a6)                            ; bit/integer operation; flags depend on variant
000008ac | 426eff5a                 | clr.w        -$a6(a6)                            ; bit/integer operation; flags depend on variant
000008b0 | 3d6deba0ff5c             | move.w       -$1460(a5), -$a4(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000008b6 | 486eff5c                 | pea.l        -$a4(a6)                            ; machine operation; verify instruction and data boundaries
000008ba | 486eff5c                 | pea.l        -$a4(a6)                            ; machine operation; verify instruction and data boundaries
000008be | 3f3c200e                 | move.w       #$200e, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000008c2 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000008c4 | 486eff5c                 | pea.l        -$a4(a6)                            ; machine operation; verify instruction and data boundaries
000008c8 | 486eff5c                 | pea.l        -$a4(a6)                            ; machine operation; verify instruction and data boundaries
000008cc | 3f3c1010                 | move.w       #$1010, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000008d0 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000008d2 | 2d7c4000c90fff66         | move.l       #$4000c90f, -$9a(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000008da | 2d7cdaa17f49ff6a         | move.l       #$daa17f49, -$96(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000008e2 | 3d7cbfc5ff6e             | move.w       #$bfc5, -$92(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
000008e8 | 486eff5c                 | pea.l        -$a4(a6)                            ; machine operation; verify instruction and data boundaries
000008ec | 486eff66                 | pea.l        -$9a(a6)                            ; machine operation; verify instruction and data boundaries
000008f0 | 3f3c1004                 | move.w       #$1004, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000008f4 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000008f6 | 486eff52                 | pea.l        -$ae(a6)                            ; machine operation; verify instruction and data boundaries
000008fa | 486eff66                 | pea.l        -$9a(a6)                            ; machine operation; verify instruction and data boundaries
000008fe | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000902 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000904 | 2f2eff6c                 | move.l       -$94(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000908 | 2f2eff68                 | move.l       -$98(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000090c | 3f2eff66                 | move.w       -$9a(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000910 | 486effec                 | pea.l        -$14(a6)                            ; machine operation; verify instruction and data boundaries
00000914 | 4eb900000050             | jsr          $50.l                               ; call subroutine; push return address
0000091a | 2d7c40058000ff70         | move.l       #$40058000, -$90(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000922 | 42aeff74                 | clr.l        -$8c(a6)                            ; bit/integer operation; flags depend on variant
00000926 | 426eff78                 | clr.w        -$88(a6)                            ; bit/integer operation; flags depend on variant
0000092a | 3d6deba0ff7a             | move.w       -$1460(a5), -$86(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000930 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000934 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000938 | 3f3c200e                 | move.w       #$200e, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000093c | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000093e | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000942 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000946 | 3f3c1010                 | move.w       #$1010, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000094a | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000094c | 2d7c4000c90fff84         | move.l       #$4000c90f, -$7c(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000954 | 2d7cdaa17f49ff88         | move.l       #$daa17f49, -$78(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
0000095c | 3d7cbfc5ff8c             | move.w       #$bfc5, -$74(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000962 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000966 | 486eff84                 | pea.l        -$7c(a6)                            ; machine operation; verify instruction and data boundaries
0000096a | 3f3c1004                 | move.w       #$1004, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000096e | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000970 | 486eff70                 | pea.l        -$90(a6)                            ; machine operation; verify instruction and data boundaries
00000974 | 486eff84                 | pea.l        -$7c(a6)                            ; machine operation; verify instruction and data boundaries
00000978 | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000097c | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000097e | 2f2eff8a                 | move.l       -$76(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000982 | 2f2eff86                 | move.l       -$7a(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000986 | 3f2eff84                 | move.w       -$7c(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000098a | 486efff6                 | pea.l        -$a(a6)                             ; machine operation; verify instruction and data boundaries
0000098e | 4eb900000050             | jsr          $50.l                               ; call subroutine; push return address
00000994 | 2d7c400dea60ff8e         | move.l       #$400dea60, -$72(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
0000099c | 42aeff92                 | clr.l        -$6e(a6)                            ; bit/integer operation; flags depend on variant
000009a0 | 426eff96                 | clr.w        -$6a(a6)                            ; bit/integer operation; flags depend on variant
000009a4 | 486efff6                 | pea.l        -$a(a6)                             ; machine operation; verify instruction and data boundaries
000009a8 | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
000009ac | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000009b0 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000009b2 | 486effec                 | pea.l        -$14(a6)                            ; machine operation; verify instruction and data boundaries
000009b6 | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
000009ba | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000009be | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000009c0 | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
000009c4 | 3f3c0016                 | move.w       #$16, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
000009c8 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000009ca | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
000009ce | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
000009d2 | 3f3c2810                 | move.w       #$2810, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000009d6 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000009d8 | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
000009dc | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000009e0 | 31aeff900400             | move.w       -$70(a6), (a0, d0.w * 4)            ; copy source to destination (Motorola operand order); flags depend on variant
000009e6 | 2d7c40058000ff8e         | move.l       #$40058000, -$72(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000009ee | 42aeff92                 | clr.l        -$6e(a6)                            ; bit/integer operation; flags depend on variant
000009f2 | 426eff96                 | clr.w        -$6a(a6)                            ; bit/integer operation; flags depend on variant
000009f6 | 2d7c40098000ff84         | move.l       #$40098000, -$7c(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000009fe | 42aeff88                 | clr.l        -$78(a6)                            ; bit/integer operation; flags depend on variant
00000a02 | 426eff8c                 | clr.w        -$74(a6)                            ; bit/integer operation; flags depend on variant
00000a06 | 3d6deba0ff7a             | move.w       -$1460(a5), -$86(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000a0c | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000a10 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000a14 | 3f3c200e                 | move.w       #$200e, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000a18 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a1a | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000a1e | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000a22 | 3f3c1010                 | move.w       #$1010, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000a26 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a28 | 2d7c4000c90fff70         | move.l       #$4000c90f, -$90(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000a30 | 2d7cdaa17f49ff74         | move.l       #$daa17f49, -$8c(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000a38 | 3d7cbfc5ff78             | move.w       #$bfc5, -$88(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000a3e | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000a42 | 486eff70                 | pea.l        -$90(a6)                            ; machine operation; verify instruction and data boundaries
00000a46 | 3f3c1004                 | move.w       #$1004, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000a4a | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a4c | 486eff84                 | pea.l        -$7c(a6)                            ; machine operation; verify instruction and data boundaries
00000a50 | 486eff70                 | pea.l        -$90(a6)                            ; machine operation; verify instruction and data boundaries
00000a54 | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000a58 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a5a | 2f2eff76                 | move.l       -$8a(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000a5e | 2f2eff72                 | move.l       -$8e(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000a62 | 3f2eff70                 | move.w       -$90(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000a66 | 486effd8                 | pea.l        -$28(a6)                            ; machine operation; verify instruction and data boundaries
00000a6a | 4eb900000050             | jsr          $50.l                               ; call subroutine; push return address
00000a70 | 3d6deba0ff66             | move.w       -$1460(a5), -$9a(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000a76 | 486eff66                 | pea.l        -$9a(a6)                            ; machine operation; verify instruction and data boundaries
00000a7a | 486eff66                 | pea.l        -$9a(a6)                            ; machine operation; verify instruction and data boundaries
00000a7e | 3f3c200e                 | move.w       #$200e, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000a82 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a84 | 486eff66                 | pea.l        -$9a(a6)                            ; machine operation; verify instruction and data boundaries
00000a88 | 486eff66                 | pea.l        -$9a(a6)                            ; machine operation; verify instruction and data boundaries
00000a8c | 3f3c1010                 | move.w       #$1010, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000a90 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a92 | 2d7c40008000ff5c         | move.l       #$40008000, -$a4(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000a9a | 42aeff60                 | clr.l        -$a0(a6)                            ; bit/integer operation; flags depend on variant
00000a9e | 426eff64                 | clr.w        -$9c(a6)                            ; bit/integer operation; flags depend on variant
00000aa2 | 486eff66                 | pea.l        -$9a(a6)                            ; machine operation; verify instruction and data boundaries
00000aa6 | 486eff5c                 | pea.l        -$a4(a6)                            ; machine operation; verify instruction and data boundaries
00000aaa | 3f3c1004                 | move.w       #$1004, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000aae | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ab0 | 2d7c4000c90fff52         | move.l       #$4000c90f, -$ae(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000ab8 | 2d7cdaa17f49ff56         | move.l       #$daa17f49, -$aa(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000ac0 | 3d7cbfc5ff5a             | move.w       #$bfc5, -$a6(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000ac6 | 486eff5c                 | pea.l        -$a4(a6)                            ; machine operation; verify instruction and data boundaries
00000aca | 486eff52                 | pea.l        -$ae(a6)                            ; machine operation; verify instruction and data boundaries
00000ace | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000ad2 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ad4 | 486effd8                 | pea.l        -$28(a6)                            ; machine operation; verify instruction and data boundaries
00000ad8 | 486eff52                 | pea.l        -$ae(a6)                            ; machine operation; verify instruction and data boundaries
00000adc | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000ae0 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ae2 | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000ae6 | 486eff52                 | pea.l        -$ae(a6)                            ; machine operation; verify instruction and data boundaries
00000aea | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000aee | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000af0 | 4fef000e                 | lea.l        $e(a7), a7                          ; machine operation; verify instruction and data boundaries
00000af4 | 2f2eff58                 | move.l       -$a8(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000af8 | 2f2eff54                 | move.l       -$ac(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000afc | 3f2eff52                 | move.w       -$ae(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000b00 | 486effe2                 | pea.l        -$1e(a6)                            ; machine operation; verify instruction and data boundaries
00000b04 | 4eb900000058             | jsr          $58.l                               ; call subroutine; push return address
00000b0a | 2d7c400afa00ff98         | move.l       #$400afa00, -$68(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000b12 | 42aeff9c                 | clr.l        -$64(a6)                            ; bit/integer operation; flags depend on variant
00000b16 | 426effa0                 | clr.w        -$60(a6)                            ; bit/integer operation; flags depend on variant
00000b1a | 486effe2                 | pea.l        -$1e(a6)                            ; machine operation; verify instruction and data boundaries
00000b1e | 486eff98                 | pea.l        -$68(a6)                            ; machine operation; verify instruction and data boundaries
00000b22 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000b26 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b28 | 486eff98                 | pea.l        -$68(a6)                            ; machine operation; verify instruction and data boundaries
00000b2c | 3f3c0016                 | move.w       #$16, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000b30 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b32 | 486eff98                 | pea.l        -$68(a6)                            ; machine operation; verify instruction and data boundaries
00000b36 | 486eff98                 | pea.l        -$68(a6)                            ; machine operation; verify instruction and data boundaries
00000b3a | 3f3c2810                 | move.w       #$2810, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000b3e | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b40 | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
00000b44 | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000b48 | 31aeff9a0402             | move.w       -$66(a6), $2(a0, d0.w)              ; copy source to destination (Motorola operand order); flags depend on variant
00000b4e | 526deba0                 | addq.w       #$1, -$1460(a5)                     ; arithmetic operation; flags depend on variant
00000b52 | 4fef002a                 | lea.l        $2a(a7), a7                         ; machine operation; verify instruction and data boundaries
00000b56 | 0c6d0400eba0             | cmpi.w       #$400, -$1460(a5)                   ; compare operands; set condition flags
00000b5c | 6d00fd42                 | blt.w        $8a0                                ; branch according to condition flags (bra unconditional, bsr call)
00000b60 | 426deba0                 | clr.w        -$1460(a5)                          ; bit/integer operation; flags depend on variant
00000b64 | 60000186                 | bra.w        $cec                                ; branch according to condition flags (bra unconditional, bsr call)
00000b68 | 2d7c4003a000ff98         | move.l       #$4003a000, -$68(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000b70 | 42aeff9c                 | clr.l        -$64(a6)                            ; bit/integer operation; flags depend on variant
00000b74 | 426effa0                 | clr.w        -$60(a6)                            ; bit/integer operation; flags depend on variant
00000b78 | 3d6deba0ff8e             | move.w       -$1460(a5), -$72(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000b7e | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000b82 | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000b86 | 3f3c200e                 | move.w       #$200e, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000b8a | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b8c | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000b90 | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000b94 | 3f3c1010                 | move.w       #$1010, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000b98 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b9a | 2d7c4000c90fff84         | move.l       #$4000c90f, -$7c(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000ba2 | 2d7cdaa17f49ff88         | move.l       #$daa17f49, -$78(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000baa | 3d7cbfc5ff8c             | move.w       #$bfc5, -$74(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000bb0 | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000bb4 | 486eff84                 | pea.l        -$7c(a6)                            ; machine operation; verify instruction and data boundaries
00000bb8 | 3f3c1004                 | move.w       #$1004, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000bbc | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000bbe | 486eff98                 | pea.l        -$68(a6)                            ; machine operation; verify instruction and data boundaries
00000bc2 | 486eff84                 | pea.l        -$7c(a6)                            ; machine operation; verify instruction and data boundaries
00000bc6 | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000bca | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000bcc | 2f2eff8a                 | move.l       -$76(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000bd0 | 2f2eff86                 | move.l       -$7a(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000bd4 | 3f2eff84                 | move.w       -$7c(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000bd8 | 486effce                 | pea.l        -$32(a6)                            ; machine operation; verify instruction and data boundaries
00000bdc | 4eb900000050             | jsr          $50.l                               ; call subroutine; push return address
00000be2 | 2d7c400b9c40ff7a         | move.l       #$400b9c40, -$86(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000bea | 42aeff7e                 | clr.l        -$82(a6)                            ; bit/integer operation; flags depend on variant
00000bee | 426eff82                 | clr.w        -$7e(a6)                            ; bit/integer operation; flags depend on variant
00000bf2 | 486effce                 | pea.l        -$32(a6)                            ; machine operation; verify instruction and data boundaries
00000bf6 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000bfa | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000bfe | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c00 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000c04 | 3f3c0016                 | move.w       #$16, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000c08 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c0a | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000c0e | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000c12 | 3f3c2810                 | move.w       #$2810, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000c16 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c18 | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
00000c1c | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000c20 | 31aeff7c0400             | move.w       -$84(a6), (a0, d0.w * 4)            ; copy source to destination (Motorola operand order); flags depend on variant
00000c26 | 2d7c4003a000ff98         | move.l       #$4003a000, -$68(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000c2e | 42aeff9c                 | clr.l        -$64(a6)                            ; bit/integer operation; flags depend on variant
00000c32 | 426effa0                 | clr.w        -$60(a6)                            ; bit/integer operation; flags depend on variant
00000c36 | 3d6deba0ff8e             | move.w       -$1460(a5), -$72(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000c3c | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000c40 | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000c44 | 3f3c200e                 | move.w       #$200e, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000c48 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c4a | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000c4e | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000c52 | 3f3c1010                 | move.w       #$1010, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000c56 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c58 | 2d7c4000c90fff84         | move.l       #$4000c90f, -$7c(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000c60 | 2d7cdaa17f49ff88         | move.l       #$daa17f49, -$78(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000c68 | 3d7cbfc5ff8c             | move.w       #$bfc5, -$74(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000c6e | 486eff8e                 | pea.l        -$72(a6)                            ; machine operation; verify instruction and data boundaries
00000c72 | 486eff84                 | pea.l        -$7c(a6)                            ; machine operation; verify instruction and data boundaries
00000c76 | 3f3c1004                 | move.w       #$1004, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000c7a | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c7c | 486eff98                 | pea.l        -$68(a6)                            ; machine operation; verify instruction and data boundaries
00000c80 | 486eff84                 | pea.l        -$7c(a6)                            ; machine operation; verify instruction and data boundaries
00000c84 | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000c88 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c8a | 2f2eff8a                 | move.l       -$76(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000c8e | 2f2eff86                 | move.l       -$7a(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000c92 | 3f2eff84                 | move.w       -$7c(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000c96 | 486effc4                 | pea.l        -$3c(a6)                            ; machine operation; verify instruction and data boundaries
00000c9a | 4eb900000058             | jsr          $58.l                               ; call subroutine; push return address
00000ca0 | 2d7c400b9c40ff7a         | move.l       #$400b9c40, -$86(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000ca8 | 42aeff7e                 | clr.l        -$82(a6)                            ; bit/integer operation; flags depend on variant
00000cac | 426eff82                 | clr.w        -$7e(a6)                            ; bit/integer operation; flags depend on variant
00000cb0 | 486effc4                 | pea.l        -$3c(a6)                            ; machine operation; verify instruction and data boundaries
00000cb4 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000cb8 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000cbc | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000cbe | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000cc2 | 3f3c0016                 | move.w       #$16, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000cc6 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000cc8 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000ccc | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00000cd0 | 3f3c2810                 | move.w       #$2810, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000cd4 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000cd6 | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
00000cda | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000cde | 31aeff7c0402             | move.w       -$84(a6), $2(a0, d0.w)              ; copy source to destination (Motorola operand order); flags depend on variant
00000ce4 | 526deba0                 | addq.w       #$1, -$1460(a5)                     ; arithmetic operation; flags depend on variant
00000ce8 | 4fef001c                 | lea.l        $1c(a7), a7                         ; machine operation; verify instruction and data boundaries
00000cec | 0c6d0028eba0             | cmpi.w       #$28, -$1460(a5)                    ; compare operands; set condition flags
00000cf2 | 6d00fe74                 | blt.w        $b68                                ; branch according to condition flags (bra unconditional, bsr call)
00000cf6 | 48780021                 | pea.l        $21.w                               ; machine operation; verify instruction and data boundaries
00000cfa | a862                     | dc.w         $a862                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000cfc | 486effbc                 | pea.l        -$44(a6)                            ; machine operation; verify instruction and data boundaries
00000d00 | a8a2                     | dc.w         $a8a2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d02 | 4eb9000000b0             | jsr          $b0.l                               ; call subroutine; push return address
00000d08 | 206d03d6                 | movea.l      $3d6(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d0c | 117c00013250             | move.b       #$1, $3250(a0)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000d12 | 6016                     | bra.b        $d2a                                ; branch according to condition flags (bra unconditional, bsr call)
00000d14 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d16 | 0000053a                 | ori.b        #$3a, d0                            ; bit/integer operation; flags depend on variant
00000d1a | 206dfc4e                 | movea.l      -$3b2(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000d1e | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00000d20 | 206dfc4a                 | movea.l      -$3b6(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000d24 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00000d26 | 526deb98                 | addq.w       #$1, -$1468(a5)                     ; arithmetic operation; flags depend on variant
00000d2a | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000d2c | a974                     | dc.w         $a974                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d2e | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d30 | 67e2                     | beq.b        $d14                                ; branch according to condition flags (bra unconditional, bsr call)
00000d32 | 206dfc4e                 | movea.l      -$3b2(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000d36 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00000d38 | 3b7c0064eba0             | move.w       #$64, -$1460(a5)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000d3e | 6030                     | bra.b        $d70                                ; branch according to condition flags (bra unconditional, bsr call)
00000d40 | 3f2deba0                 | move.w       -$1460(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000d44 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d46 | 0000083e                 | ori.b        #$3e, d0                            ; bit/integer operation; flags depend on variant
00000d4a | 206d03d6                 | movea.l      $3d6(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d4e | 57a83148                 | subq.l       #$3, $3148(a0)                      ; arithmetic operation; flags depend on variant
00000d52 | 206d03d6                 | movea.l      $3d6(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d56 | 57a8314c                 | subq.l       #$3, $314c(a0)                      ; arithmetic operation; flags depend on variant
00000d5a | 206d03d6                 | movea.l      $3d6(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d5e | 57a83150                 | subq.l       #$3, $3150(a0)                      ; arithmetic operation; flags depend on variant
00000d62 | 206d03d6                 | movea.l      $3d6(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d66 | 57a83154                 | subq.l       #$3, $3154(a0)                      ; arithmetic operation; flags depend on variant
00000d6a | 5b6deba0                 | subq.w       #$5, -$1460(a5)                     ; arithmetic operation; flags depend on variant
00000d6e | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000d70 | 4a6deba0                 | tst.w        -$1460(a5)                          ; machine operation; verify instruction and data boundaries
00000d74 | 6cca                     | bge.b        $d40                                ; branch according to condition flags (bra unconditional, bsr call)
00000d76 | 4eb9000000b8             | jsr          $b8.l                               ; call subroutine; push return address
00000d7c | 206d03d6                 | movea.l      $3d6(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d80 | 42283250                 | clr.b        $3250(a0)                           ; bit/integer operation; flags depend on variant
00000d84 | 4eb900000090             | jsr          $90.l                               ; call subroutine; push return address
00000d8a | 4eb9000000a0             | jsr          $a0.l                               ; call subroutine; push return address
00000d90 | a853                     | dc.w         $a853                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d92 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d94 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d96 | 00000464                 | ori.b        #$64, d0                            ; bit/integer operation; flags depend on variant
00000d9a | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d9c | a914                     | dc.w         $a914                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d9e | 426deba0                 | clr.w        -$1460(a5)                          ; bit/integer operation; flags depend on variant
00000da2 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000da4 | 6010                     | bra.b        $db6                                ; branch according to condition flags (bra unconditional, bsr call)
00000da6 | 3f2deba0                 | move.w       -$1460(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000daa | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000dac | 000007d8                 | ori.b        #$d8, d0                            ; bit/integer operation; flags depend on variant
00000db0 | 5a6deba0                 | addq.w       #$5, -$1460(a5)                     ; arithmetic operation; flags depend on variant
00000db4 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000db6 | 0c6d0064eba0             | cmpi.w       #$64, -$1460(a5)                    ; compare operands; set condition flags
00000dbc | 6fe8                     | ble.b        $da6                                ; branch according to condition flags (bra unconditional, bsr call)
00000dbe | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000dc0 | 00000872                 | ori.b        #$72, d0                            ; bit/integer operation; flags depend on variant
00000dc4 | ba43                     | cmp.w        d3, d5                              ; compare operands; set condition flags
00000dc6 | 6712                     | beq.b        $dda                                ; branch according to condition flags (bra unconditional, bsr call)
00000dc8 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000dca | 2f2deba2                 | move.l       -$145e(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000dce | 3f05                     | move.w       d5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000dd0 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00000dd2 | 303c0a13                 | move.w       #$a13, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000dd6 | aaa2                     | dc.w         $aaa2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000dd8 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000dda | 2f3c0000ffff             | move.l       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000de0 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000de2 | a032                     | dc.w         $a032                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000de4 | a9f4                     | dc.w         $a9f4                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000de6 | 4cdf0478                 | movem.l      (a7)+, d3-d6/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00000dea | 4e5e                     | unlk         a6                                  ; restore stack frame
00000dec | 4e75                     | rts                                              ; return: pop return address from stack
00000dee | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000df2 | 48e71e00                 | movem.l      d3-d6, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000df6 | 302deb98                 | move.w       -$1468(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000dfa | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000dfc | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000dfe | 08010000                 | btst.b       #$0, d1                             ; branch according to condition flags (bra unconditional, bsr call)
00000e02 | 00033b41                 | ori.b        #$41, d3                            ; bit/integer operation; flags depend on variant
00000e06 | eba0                     | asl.l        d5, d0                              ; bit/integer operation; flags depend on variant
00000e08 | 600000b4                 | bra.w        $ebe                                ; branch according to condition flags (bra unconditional, bsr call)
00000e0c | 426deb9e                 | clr.w        -$1462(a5)                          ; bit/integer operation; flags depend on variant
00000e10 | 6000009e                 | bra.w        $eb0                                ; branch according to condition flags (bra unconditional, bsr call)
00000e14 | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e18 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000e1a | 362deb98                 | move.w       -$1468(a5), d3                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e1e | 48c3                     | ext.l        d3                                  ; bit/integer operation; flags depend on variant
00000e20 | d680                     | add.l        d0, d3                              ; arithmetic operation; flags depend on variant
00000e22 | 0283000003ff             | andi.l       #$3ff, d3                           ; bit/integer operation; flags depend on variant
00000e28 | e58b                     | lsl.l        #$2, d3                             ; bit/integer operation; flags depend on variant
00000e2a | 382deb98                 | move.w       -$1468(a5), d4                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e2e | 0284000003ff             | andi.l       #$3ff, d4                           ; bit/integer operation; flags depend on variant
00000e34 | e58c                     | lsl.l        #$2, d4                             ; bit/integer operation; flags depend on variant
00000e36 | 7a03                     | moveq        #$3, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
00000e38 | cbedeba0                 | muls.w       -$1460(a5), d5                      ; arithmetic operation; flags depend on variant
00000e3c | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000e3e | da81                     | add.l        d1, d5                              ; arithmetic operation; flags depend on variant
00000e40 | 306deb9e                 | movea.w      -$1462(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e44 | 2c08                     | move.l       a0, d6                              ; copy source to destination (Motorola operand order); flags depend on variant
00000e46 | e58e                     | lsl.l        #$2, d6                             ; bit/integer operation; flags depend on variant
00000e48 | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
00000e4a | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
00000e4e | 30303802                 | move.w       $2(a0, d3.l), d0                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e52 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000e54 | 32304802                 | move.w       $2(a0, d4.l), d1                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e58 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000e5a | 9081                     | sub.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000e5c | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
00000e60 | 32306802                 | move.w       $2(a0, d6.l), d1                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e64 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000e66 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000e68 | 4c45                     | dc.w         $4c45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e6a | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000e6c | 302deb9a                 | move.w       -$1466(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e70 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000e72 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000e74 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000e76 | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
00000e7a | 30303800                 | move.w       (a0, d3.l), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e7e | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000e80 | 32304800                 | move.w       (a0, d4.l), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e84 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000e86 | 9081                     | sub.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000e88 | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
00000e8c | 32306800                 | move.w       (a0, d6.l), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e90 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000e92 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000e94 | 4c45                     | dc.w         $4c45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e96 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000e98 | 302deb9c                 | move.w       -$1464(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e9c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000e9e | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000ea0 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000ea2 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ea4 | 0000042a                 | ori.b        #$2a, d0                            ; bit/integer operation; flags depend on variant
00000ea8 | 526deb9e                 | addq.w       #$1, -$1462(a5)                     ; arithmetic operation; flags depend on variant
00000eac | 4fef000a                 | lea.l        $a(a7), a7                          ; machine operation; verify instruction and data boundaries
00000eb0 | 0c6d0028eb9e             | cmpi.w       #$28, -$1462(a5)                    ; compare operands; set condition flags
00000eb6 | 6d00ff5c                 | blt.w        $e14                                ; branch according to condition flags (bra unconditional, bsr call)
00000eba | 526deba0                 | addq.w       #$1, -$1460(a5)                     ; arithmetic operation; flags depend on variant
00000ebe | 0c6d003feba0             | cmpi.w       #$3f, -$1460(a5)                    ; compare operands; set condition flags
00000ec4 | 6d00ff46                 | blt.w        $e0c                                ; branch according to condition flags (bra unconditional, bsr call)
00000ec8 | 4cdf0078                 | movem.l      (a7)+, d3-d6                        ; copy source to destination (Motorola operand order); flags depend on variant
00000ecc | 4e5e                     | unlk         a6                                  ; restore stack frame
00000ece | 4e75                     | rts                                              ; return: pop return address from stack
00000ed0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000ed4 | 48e71e00                 | movem.l      d3-d6, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000ed8 | 302deb98                 | move.w       -$1468(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000edc | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000ede | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ee0 | 08010000                 | btst.b       #$0, d1                             ; branch according to condition flags (bra unconditional, bsr call)
00000ee4 | 00033b41                 | ori.b        #$41, d3                            ; bit/integer operation; flags depend on variant
00000ee8 | eba0                     | asl.l        d5, d0                              ; bit/integer operation; flags depend on variant
00000eea | 600000b6                 | bra.w        $fa2                                ; branch according to condition flags (bra unconditional, bsr call)
00000eee | 426deb9e                 | clr.w        -$1462(a5)                          ; bit/integer operation; flags depend on variant
00000ef2 | 600000a0                 | bra.w        $f94                                ; branch according to condition flags (bra unconditional, bsr call)
00000ef6 | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000efa | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000efc | 362deb98                 | move.w       -$1468(a5), d3                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f00 | 48c3                     | ext.l        d3                                  ; bit/integer operation; flags depend on variant
00000f02 | d680                     | add.l        d0, d3                              ; arithmetic operation; flags depend on variant
00000f04 | 0283000003ff             | andi.l       #$3ff, d3                           ; bit/integer operation; flags depend on variant
00000f0a | e58b                     | lsl.l        #$2, d3                             ; bit/integer operation; flags depend on variant
00000f0c | 382deb98                 | move.w       -$1468(a5), d4                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f10 | 0284000003ff             | andi.l       #$3ff, d4                           ; bit/integer operation; flags depend on variant
00000f16 | e58c                     | lsl.l        #$2, d4                             ; bit/integer operation; flags depend on variant
00000f18 | 7a03                     | moveq        #$3, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
00000f1a | cbedeba0                 | muls.w       -$1460(a5), d5                      ; arithmetic operation; flags depend on variant
00000f1e | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000f20 | da81                     | add.l        d1, d5                              ; arithmetic operation; flags depend on variant
00000f22 | 306deb9e                 | movea.w      -$1462(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f26 | 2c08                     | move.l       a0, d6                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f28 | e58e                     | lsl.l        #$2, d6                             ; bit/integer operation; flags depend on variant
00000f2a | 1f3c00ff                 | move.b       #$ff, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f2e | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
00000f32 | 30303802                 | move.w       $2(a0, d3.l), d0                    ; copy source to destination (Motorola operand order); flags depend on variant
00000f36 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000f38 | 32304802                 | move.w       $2(a0, d4.l), d1                    ; copy source to destination (Motorola operand order); flags depend on variant
00000f3c | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000f3e | 9081                     | sub.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000f40 | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
00000f44 | 32306802                 | move.w       $2(a0, d6.l), d1                    ; copy source to destination (Motorola operand order); flags depend on variant
00000f48 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000f4a | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000f4c | 4c45                     | dc.w         $4c45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000f4e | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f50 | 302deb9a                 | move.w       -$1466(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f54 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000f56 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000f58 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f5a | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
00000f5e | 30303800                 | move.w       (a0, d3.l), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f62 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000f64 | 32304800                 | move.w       (a0, d4.l), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f68 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000f6a | 9081                     | sub.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000f6c | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
00000f70 | 32306800                 | move.w       (a0, d6.l), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f74 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000f76 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000f78 | 4c45                     | dc.w         $4c45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000f7a | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f7c | 302deb9c                 | move.w       -$1464(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f80 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000f82 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000f84 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f86 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000f88 | 00000346                 | ori.b        #$46, d0                            ; bit/integer operation; flags depend on variant
00000f8c | 526deb9e                 | addq.w       #$1, -$1462(a5)                     ; arithmetic operation; flags depend on variant
00000f90 | 4fef000a                 | lea.l        $a(a7), a7                          ; machine operation; verify instruction and data boundaries
00000f94 | 0c6d0028eb9e             | cmpi.w       #$28, -$1462(a5)                    ; compare operands; set condition flags
00000f9a | 6d00ff5a                 | blt.w        $ef6                                ; branch according to condition flags (bra unconditional, bsr call)
00000f9e | 526deba0                 | addq.w       #$1, -$1460(a5)                     ; arithmetic operation; flags depend on variant
00000fa2 | 0c6d003feba0             | cmpi.w       #$3f, -$1460(a5)                    ; compare operands; set condition flags
00000fa8 | 6d00ff44                 | blt.w        $eee                                ; branch according to condition flags (bra unconditional, bsr call)
00000fac | 4cdf0078                 | movem.l      (a7)+, d3-d6                        ; copy source to destination (Motorola operand order); flags depend on variant
00000fb0 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000fb2 | 4e75                     | rts                                              ; return: pop return address from stack
00000fb4 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000fb8 | 48e71e00                 | movem.l      d3-d6, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000fbc | 302deb98                 | move.w       -$1468(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000fc0 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000fc2 | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000fc4 | 08010000                 | btst.b       #$0, d1                             ; branch according to condition flags (bra unconditional, bsr call)
00000fc8 | 00033b41                 | ori.b        #$41, d3                            ; bit/integer operation; flags depend on variant
00000fcc | eba0                     | asl.l        d5, d0                              ; bit/integer operation; flags depend on variant
00000fce | 600000be                 | bra.w        $108e                               ; branch according to condition flags (bra unconditional, bsr call)
00000fd2 | 426deb9e                 | clr.w        -$1462(a5)                          ; bit/integer operation; flags depend on variant
00000fd6 | 600000a8                 | bra.w        $1080                               ; branch according to condition flags (bra unconditional, bsr call)
00000fda | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000fde | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000fe0 | 362deb98                 | move.w       -$1468(a5), d3                      ; copy source to destination (Motorola operand order); flags depend on variant
00000fe4 | 48c3                     | ext.l        d3                                  ; bit/integer operation; flags depend on variant
00000fe6 | d680                     | add.l        d0, d3                              ; arithmetic operation; flags depend on variant
00000fe8 | 0283000003ff             | andi.l       #$3ff, d3                           ; bit/integer operation; flags depend on variant
00000fee | e58b                     | lsl.l        #$2, d3                             ; bit/integer operation; flags depend on variant
00000ff0 | 382deb98                 | move.w       -$1468(a5), d4                      ; copy source to destination (Motorola operand order); flags depend on variant
00000ff4 | 0284000003ff             | andi.l       #$3ff, d4                           ; bit/integer operation; flags depend on variant
00000ffa | e58c                     | lsl.l        #$2, d4                             ; bit/integer operation; flags depend on variant
00000ffc | 7a03                     | moveq        #$3, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
00000ffe | cbedeba0                 | muls.w       -$1460(a5), d5                      ; arithmetic operation; flags depend on variant
00001002 | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00001004 | da81                     | add.l        d1, d5                              ; arithmetic operation; flags depend on variant
00001006 | 306deb9e                 | movea.w      -$1462(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000100a | 2c08                     | move.l       a0, d6                              ; copy source to destination (Motorola operand order); flags depend on variant
0000100c | e58e                     | lsl.l        #$2, d6                             ; bit/integer operation; flags depend on variant
0000100e | 41edeb18                 | lea.l        -$14e8(a5), a0                      ; machine operation; verify instruction and data boundaries
00001012 | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00001016 | 3f300200                 | move.w       (a0, d0.w * 2), -(a7)               ; copy source to destination (Motorola operand order); flags depend on variant
0000101a | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
0000101e | 30303802                 | move.w       $2(a0, d3.l), d0                    ; copy source to destination (Motorola operand order); flags depend on variant
00001022 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001024 | 32304802                 | move.w       $2(a0, d4.l), d1                    ; copy source to destination (Motorola operand order); flags depend on variant
00001028 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000102a | 9081                     | sub.l        d1, d0                              ; arithmetic operation; flags depend on variant
0000102c | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
00001030 | 32306802                 | move.w       $2(a0, d6.l), d1                    ; copy source to destination (Motorola operand order); flags depend on variant
00001034 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001036 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00001038 | 4c45                     | dc.w         $4c45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000103a | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000103c | 302deb9a                 | move.w       -$1466(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00001040 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001042 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00001044 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001046 | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
0000104a | 30303800                 | move.w       (a0, d3.l), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000104e | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001050 | 32304800                 | move.w       (a0, d4.l), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00001054 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001056 | 9081                     | sub.l        d1, d0                              ; arithmetic operation; flags depend on variant
00001058 | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
0000105c | 32306800                 | move.w       (a0, d6.l), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00001060 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001062 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00001064 | 4c45                     | dc.w         $4c45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001066 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00001068 | 302deb9c                 | move.w       -$1464(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000106c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000106e | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00001070 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001072 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001074 | 000002ac                 | ori.b        #$ac, d0                            ; bit/integer operation; flags depend on variant
00001078 | 526deb9e                 | addq.w       #$1, -$1462(a5)                     ; arithmetic operation; flags depend on variant
0000107c | 4fef000a                 | lea.l        $a(a7), a7                          ; machine operation; verify instruction and data boundaries
00001080 | 0c6d0028eb9e             | cmpi.w       #$28, -$1462(a5)                    ; compare operands; set condition flags
00001086 | 6d00ff52                 | blt.w        $fda                                ; branch according to condition flags (bra unconditional, bsr call)
0000108a | 526deba0                 | addq.w       #$1, -$1460(a5)                     ; arithmetic operation; flags depend on variant
0000108e | 0c6d003feba0             | cmpi.w       #$3f, -$1460(a5)                    ; compare operands; set condition flags
00001094 | 6d00ff3c                 | blt.w        $fd2                                ; branch according to condition flags (bra unconditional, bsr call)
00001098 | 4cdf0078                 | movem.l      (a7)+, d3-d6                        ; copy source to destination (Motorola operand order); flags depend on variant
0000109c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000109e | 4e75                     | rts                                              ; return: pop return address from stack
000010a0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000010a4 | 48e71e00                 | movem.l      d3-d6, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000010a8 | 302deb98                 | move.w       -$1468(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000010ac | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000010ae | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010b0 | 08010000                 | btst.b       #$0, d1                             ; branch according to condition flags (bra unconditional, bsr call)
000010b4 | 00033b41                 | ori.b        #$41, d3                            ; bit/integer operation; flags depend on variant
000010b8 | eba0                     | asl.l        d5, d0                              ; bit/integer operation; flags depend on variant
000010ba | 600000b4                 | bra.w        $1170                               ; branch according to condition flags (bra unconditional, bsr call)
000010be | 426deb9e                 | clr.w        -$1462(a5)                          ; bit/integer operation; flags depend on variant
000010c2 | 6000009e                 | bra.w        $1162                               ; branch according to condition flags (bra unconditional, bsr call)
000010c6 | 302deba0                 | move.w       -$1460(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000010ca | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000010cc | 362deb98                 | move.w       -$1468(a5), d3                      ; copy source to destination (Motorola operand order); flags depend on variant
000010d0 | 48c3                     | ext.l        d3                                  ; bit/integer operation; flags depend on variant
000010d2 | d680                     | add.l        d0, d3                              ; arithmetic operation; flags depend on variant
000010d4 | 0283000003ff             | andi.l       #$3ff, d3                           ; bit/integer operation; flags depend on variant
000010da | e58b                     | lsl.l        #$2, d3                             ; bit/integer operation; flags depend on variant
000010dc | 382deb98                 | move.w       -$1468(a5), d4                      ; copy source to destination (Motorola operand order); flags depend on variant
000010e0 | 0284000003ff             | andi.l       #$3ff, d4                           ; bit/integer operation; flags depend on variant
000010e6 | e58c                     | lsl.l        #$2, d4                             ; bit/integer operation; flags depend on variant
000010e8 | 7a03                     | moveq        #$3, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
000010ea | cbedeba0                 | muls.w       -$1460(a5), d5                      ; arithmetic operation; flags depend on variant
000010ee | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
000010f0 | da81                     | add.l        d1, d5                              ; arithmetic operation; flags depend on variant
000010f2 | 306deb9e                 | movea.w      -$1462(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000010f6 | 2c08                     | move.l       a0, d6                              ; copy source to destination (Motorola operand order); flags depend on variant
000010f8 | e58e                     | lsl.l        #$2, d6                             ; bit/integer operation; flags depend on variant
000010fa | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000010fc | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
00001100 | 30303802                 | move.w       $2(a0, d3.l), d0                    ; copy source to destination (Motorola operand order); flags depend on variant
00001104 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001106 | 32304802                 | move.w       $2(a0, d4.l), d1                    ; copy source to destination (Motorola operand order); flags depend on variant
0000110a | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000110c | 9081                     | sub.l        d1, d0                              ; arithmetic operation; flags depend on variant
0000110e | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
00001112 | 32306802                 | move.w       $2(a0, d6.l), d1                    ; copy source to destination (Motorola operand order); flags depend on variant
00001116 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001118 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
0000111a | 4c45                     | dc.w         $4c45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000111c | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000111e | 302deb9a                 | move.w       -$1466(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00001122 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001124 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00001126 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001128 | 41edec4a                 | lea.l        -$13b6(a5), a0                      ; machine operation; verify instruction and data boundaries
0000112c | 30303800                 | move.w       (a0, d3.l), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00001130 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001132 | 32304800                 | move.w       (a0, d4.l), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00001136 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001138 | 9081                     | sub.l        d1, d0                              ; arithmetic operation; flags depend on variant
0000113a | 41edebaa                 | lea.l        -$1456(a5), a0                      ; machine operation; verify instruction and data boundaries
0000113e | 32306800                 | move.w       (a0, d6.l), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00001142 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001144 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00001146 | 4c45                     | dc.w         $4c45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001148 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000114a | 302deb9c                 | move.w       -$1464(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000114e | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001150 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00001152 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001154 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001156 | 000001ca                 | ori.b        #$ca, d0                            ; bit/integer operation; flags depend on variant
0000115a | 526deb9e                 | addq.w       #$1, -$1462(a5)                     ; arithmetic operation; flags depend on variant
0000115e | 4fef000a                 | lea.l        $a(a7), a7                          ; machine operation; verify instruction and data boundaries
00001162 | 0c6d0028eb9e             | cmpi.w       #$28, -$1462(a5)                    ; compare operands; set condition flags
00001168 | 6d00ff5c                 | blt.w        $10c6                               ; branch according to condition flags (bra unconditional, bsr call)
0000116c | 526deba0                 | addq.w       #$1, -$1460(a5)                     ; arithmetic operation; flags depend on variant
00001170 | 0c6d003feba0             | cmpi.w       #$3f, -$1460(a5)                    ; compare operands; set condition flags
00001176 | 6d00ff46                 | blt.w        $10be                               ; branch according to condition flags (bra unconditional, bsr call)
0000117a | 4cdf0078                 | movem.l      (a7)+, d3-d6                        ; copy source to destination (Motorola operand order); flags depend on variant
0000117e | 4e5e                     | unlk         a6                                  ; restore stack frame
00001180 | 4e75                     | rts                                              ; return: pop return address from stack
00001182 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001186 | 3b6e0008fc6a             | move.w       $8(a6), -$396(a5)                   ; copy source to destination (Motorola operand order); flags depend on variant
0000118c | 302deaa2                 | move.w       -$155e(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00001190 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001192 | 322deaa6                 | move.w       -$155a(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00001196 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001198 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
0000119a | 2b41fc66                 | move.l       d1, -$39a(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000119e | 302deaa0                 | move.w       -$1560(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000011a2 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000011a4 | 322deaa4                 | move.w       -$155c(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
000011a8 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000011aa | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
000011ac | 2b41fc62                 | move.l       d1, -$39e(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
000011b0 | 206deb14                 | movea.l      -$14ec(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000011b4 | 32680006                 | movea.w      $6(a0), a1                          ; copy source to destination (Motorola operand order); flags depend on variant
000011b8 | 2b49fc5e                 | move.l       a1, -$3a2(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
000011bc | 2b680002fc5a             | move.l       $2(a0), -$3a6(a5)                   ; copy source to destination (Motorola operand order); flags depend on variant
000011c2 | 4e5e                     | unlk         a6                                  ; restore stack frame
000011c4 | 4e75                     | rts                                              ; return: pop return address from stack
000011c6 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000011ca | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000011cc | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
000011d0 | 4aadfc52                 | tst.l        -$3ae(a5)                           ; machine operation; verify instruction and data boundaries
000011d4 | 661e                     | bne.b        $11f4                               ; branch according to condition flags (bra unconditional, bsr call)
000011d6 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000011d8 | a8d8                     | dc.w         $a8d8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000011da | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000011dc | 2b48fc52                 | move.l       a0, -$3ae(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
000011e0 | 2f2a0018                 | move.l       $18(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000011e4 | 2f2dfc52                 | move.l       -$3ae(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
000011e8 | a8dc                     | dc.w         $a8dc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000011ea | 2f2a0018                 | move.l       $18(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000011ee | 486a0010                 | pea.l        $10(a2)                             ; machine operation; verify instruction and data boundaries
000011f2 | a8df                     | dc.w         $a8df                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000011f4 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
000011f6 | 4e5e                     | unlk         a6                                  ; restore stack frame
000011f8 | 4e75                     | rts                                              ; return: pop return address from stack
000011fa | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000011fe | 4aadfc52                 | tst.l        -$3ae(a5)                           ; machine operation; verify instruction and data boundaries
00001202 | 6748                     | beq.b        $124c                               ; branch according to condition flags (bra unconditional, bsr call)
00001204 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001206 | a8d8                     | dc.w         $a8d8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001208 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000120a | 2b48fc56                 | move.l       a0, -$3aa(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000120e | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001212 | 2f280018                 | move.l       $18(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001216 | 2f2dfc52                 | move.l       -$3ae(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
0000121a | 2f2dfc56                 | move.l       -$3aa(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
0000121e | a8e6                     | dc.w         $a8e6                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001220 | 48780021                 | pea.l        $21.w                               ; machine operation; verify instruction and data boundaries
00001224 | a862                     | dc.w         $a862                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001226 | 2f2dfc56                 | move.l       -$3aa(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
0000122a | a8d3                     | dc.w         $a8d3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000122c | 2f2dfc56                 | move.l       -$3aa(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00001230 | a8d9                     | dc.w         $a8d9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001232 | 2f2dfc52                 | move.l       -$3ae(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00001236 | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000123a | 2f280018                 | move.l       $18(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000123e | a8dc                     | dc.w         $a8dc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001240 | 2f2dfc52                 | move.l       -$3ae(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00001244 | a8d9                     | dc.w         $a8d9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001246 | 42adfc52                 | clr.l        -$3ae(a5)                           ; bit/integer operation; flags depend on variant
0000124a | a937                     | dc.w         $a937                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000124c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000124e | 4e75                     | rts                                              ; return: pop return address from stack
00001250 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001254 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001256 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001258 | a975                     | dc.w         $a975                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000125a | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000125c | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000125e | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001260 | a975                     | dc.w         $a975                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001262 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001264 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00001266 | 67f6                     | beq.b        $125e                               ; branch according to condition flags (bra unconditional, bsr call)
00001268 | 261f                     | move.l       (a7)+, d3                           ; copy source to destination (Motorola operand order); flags depend on variant
0000126a | 4e5e                     | unlk         a6                                  ; restore stack frame
0000126c | 4e75                     | rts                                              ; return: pop return address from stack
0000126e | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001272 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001274 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00001278 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000127a | 2f3c50494354             | move.l       #$50494354, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00001280 | 3f2e000c                 | move.w       $c(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001284 | a9a0                     | dc.w         $a9a0                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001286 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001288 | 2488                     | move.l       a0, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
0000128a | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000128c | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000128e | 256800020004             | move.l       $2(a0), $4(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001294 | 256800060008             | move.l       $6(a0), $8(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000129a | 486a0004                 | pea.l        $4(a2)                              ; machine operation; verify instruction and data boundaries
0000129e | 302e000e                 | move.w       $e(a6), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000012a2 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000012a4 | 322a0006                 | move.w       $6(a2), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
000012a8 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000012aa | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
000012ac | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000012ae | 302e0010                 | move.w       $10(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000012b2 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000012b4 | 322a0004                 | move.w       $4(a2), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
000012b8 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000012ba | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
000012bc | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000012be | a8a8                     | dc.w         $a8a8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000012c0 | 2f12                     | move.l       (a2), -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
000012c2 | 486a0004                 | pea.l        $4(a2)                              ; machine operation; verify instruction and data boundaries
000012c6 | a8f6                     | dc.w         $a8f6                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000012c8 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
000012ca | 4e5e                     | unlk         a6                                  ; restore stack frame
000012cc | 4e75                     | rts                                              ; return: pop return address from stack
000012ce | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000012d2 | 48e70c00                 | movem.l      d4-d5, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000012d6 | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
000012da | 242e000c                 | move.l       $c(a6), d2                          ; copy source to destination (Motorola operand order); flags depend on variant
000012de | 1a2e0010                 | move.b       $10(a6), d5                         ; copy source to destination (Motorola operand order); flags depend on variant
000012e2 | 302deaa2                 | move.w       -$155e(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000012e6 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000012e8 | 322deaa6                 | move.w       -$155a(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
000012ec | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000012ee | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
000012f0 | b881                     | cmp.l        d1, d4                              ; compare operands; set condition flags
000012f2 | 6424                     | bcc.b        $1318                               ; branch according to condition flags (bra unconditional, bsr call)
000012f4 | 302deaa0                 | move.w       -$1560(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000012f8 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000012fa | 322deaa4                 | move.w       -$155c(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
000012fe | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001300 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00001302 | b481                     | cmp.l        d1, d2                              ; compare operands; set condition flags
00001304 | 6412                     | bcc.b        $1318                               ; branch according to condition flags (bra unconditional, bsr call)
00001306 | 2002                     | move.l       d2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001308 | 4c2d                     | dc.w         $4c2d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000130a | 0000fc5e                 | ori.b        #$5e, d0                            ; bit/integer operation; flags depend on variant
0000130e | 206dfc5a                 | movea.l      -$3a6(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00001312 | d1c0                     | adda.l       d0, a0                              ; arithmetic operation; flags depend on variant
00001314 | d1c4                     | adda.l       d4, a0                              ; arithmetic operation; flags depend on variant
00001316 | 1085                     | move.b       d5, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
00001318 | 4cdf0030                 | movem.l      (a7)+, d4-d5                        ; copy source to destination (Motorola operand order); flags depend on variant
0000131c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000131e | 4e75                     | rts                                              ; return: pop return address from stack
00001320 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001324 | 48e70c00                 | movem.l      d4-d5, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001328 | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
0000132c | 242e000c                 | move.l       $c(a6), d2                          ; copy source to destination (Motorola operand order); flags depend on variant
00001330 | 3a2e0010                 | move.w       $10(a6), d5                         ; copy source to destination (Motorola operand order); flags depend on variant
00001334 | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
00001336 | 6d3e                     | blt.b        $1376                               ; branch according to condition flags (bra unconditional, bsr call)
00001338 | 302deaa2                 | move.w       -$155e(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000133c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000133e | 322deaa6                 | move.w       -$155a(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00001342 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001344 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00001346 | b881                     | cmp.l        d1, d4                              ; compare operands; set condition flags
00001348 | 6c2c                     | bge.b        $1376                               ; branch according to condition flags (bra unconditional, bsr call)
0000134a | 4a82                     | tst.l        d2                                  ; machine operation; verify instruction and data boundaries
0000134c | 6d28                     | blt.b        $1376                               ; branch according to condition flags (bra unconditional, bsr call)
0000134e | 302deaa0                 | move.w       -$1560(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00001352 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001354 | 322deaa4                 | move.w       -$155c(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00001358 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000135a | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
0000135c | b481                     | cmp.l        d1, d2                              ; compare operands; set condition flags
0000135e | 6c16                     | bge.b        $1376                               ; branch according to condition flags (bra unconditional, bsr call)
00001360 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001362 | d080                     | add.l        d0, d0                              ; arithmetic operation; flags depend on variant
00001364 | 2202                     | move.l       d2, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00001366 | 4c2d                     | dc.w         $4c2d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001368 | 1800                     | move.b       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000136a | fc5e                     | dc.w         $fc5e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000136c | 206dfc5a                 | movea.l      -$3a6(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00001370 | d1c1                     | adda.l       d1, a0                              ; arithmetic operation; flags depend on variant
00001372 | d1c0                     | adda.l       d0, a0                              ; arithmetic operation; flags depend on variant
00001374 | 3085                     | move.w       d5, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
00001376 | 4cdf0030                 | movem.l      (a7)+, d4-d5                        ; copy source to destination (Motorola operand order); flags depend on variant
0000137a | 4e5e                     | unlk         a6                                  ; restore stack frame
0000137c | 4e75                     | rts                                              ; return: pop return address from stack
0000137e | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00001382 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001384 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001386 | 3f3ca89f                 | move.w       #$a89f, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000138a | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000138e | 4eb900000068             | jsr          $68.l                               ; call subroutine; push return address
00001394 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001396 | 2d48fffc                 | move.l       a0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000139a | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000139c | 3f3caa29                 | move.w       #$aa29, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000013a0 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000013a4 | 4eb900000068             | jsr          $68.l                               ; call subroutine; push return address
000013aa | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000013ac | b1eefffc                 | cmpa.l       -$4(a6), a0                         ; compare operands; set condition flags
000013b0 | 6604                     | bne.b        $13b6                               ; branch according to condition flags (bra unconditional, bsr call)
000013b2 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000013b4 | 603c                     | bra.b        $13f2                               ; branch according to condition flags (bra unconditional, bsr call)
000013b6 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000013b8 | aa29                     | dc.w         $aa29                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000013ba | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000013bc | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000013be | 602a                     | bra.b        $13ea                               ; branch according to condition flags (bra unconditional, bsr call)
000013c0 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000013c2 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000013c4 | 3f3c000d                 | move.w       #$d, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000013c8 | aa2c                     | dc.w         $aa2c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000013ca | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000013cc | 6712                     | beq.b        $13e0                               ; branch according to condition flags (bra unconditional, bsr call)
000013ce | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000013d0 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000013d2 | 3f3c000e                 | move.w       #$e, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000013d6 | aa2c                     | dc.w         $aa2c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000013d8 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000013da | 6704                     | beq.b        $13e0                               ; branch according to condition flags (bra unconditional, bsr call)
000013dc | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000013de | 6012                     | bra.b        $13f2                               ; branch according to condition flags (bra unconditional, bsr call)
000013e0 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000013e2 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000013e4 | aa2b                     | dc.w         $aa2b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000013e6 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000013e8 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000013ea | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000013ec | 66d2                     | bne.b        $13c0                               ; branch according to condition flags (bra unconditional, bsr call)
000013ee | 103c00ff                 | move.b       #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000013f2 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
000013f4 | 4e5e                     | unlk         a6                                  ; restore stack frame
000013f6 | 4e75                     | rts                                              ; return: pop return address from stack
000013f8 | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
000013fc | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000013fe | 3f3ca89f                 | move.w       #$a89f, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001402 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001406 | 4eb900000068             | jsr          $68.l                               ; call subroutine; push return address
0000140c | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000140e | 2d48fffc                 | move.l       a0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00001412 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001414 | 3f3caa29                 | move.w       #$aa29, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001418 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000141c | 4eb900000068             | jsr          $68.l                               ; call subroutine; push return address
00001422 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001424 | b1eefffc                 | cmpa.l       -$4(a6), a0                         ; compare operands; set condition flags
00001428 | 6604                     | bne.b        $142e                               ; branch according to condition flags (bra unconditional, bsr call)
0000142a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000142c | 6028                     | bra.b        $1456                               ; branch according to condition flags (bra unconditional, bsr call)
0000142e | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001430 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001434 | 3f3c000d                 | move.w       #$d, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001438 | aa2c                     | dc.w         $aa2c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000143a | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000143c | 6714                     | beq.b        $1452                               ; branch according to condition flags (bra unconditional, bsr call)
0000143e | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001440 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001444 | 3f3c000e                 | move.w       #$e, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001448 | aa2c                     | dc.w         $aa2c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000144a | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000144c | 6704                     | beq.b        $1452                               ; branch according to condition flags (bra unconditional, bsr call)
0000144e | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001450 | 6004                     | bra.b        $1456                               ; branch according to condition flags (bra unconditional, bsr call)
00001452 | 103c00ff                 | move.b       #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001456 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001458 | 4e75                     | rts                                              ; return: pop return address from stack
0000145a | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
0000145e | 48e71030                 | movem.l      d3/a2-a3, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001462 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00001464 | 0cad46414445fc70         | cmpi.l       #$46414445, -$390(a5)               ; compare operands; set condition flags
0000146c | 6606                     | bne.b        $1474                               ; branch according to condition flags (bra unconditional, bsr call)
0000146e | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001470 | 6000010a                 | bra.w        $157c                               ; branch according to condition flags (bra unconditional, bsr call)
00001474 | 42adfc6c                 | clr.l        -$394(a5)                           ; bit/integer operation; flags depend on variant
00001478 | 2b7c46414445fc70         | move.l       #$46414445, -$390(a5)               ; copy source to destination (Motorola operand order); flags depend on variant
00001480 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001482 | aa29                     | dc.w         $aa29                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001484 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001486 | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001488 | 600000ea                 | bra.w        $1574                               ; branch according to condition flags (bra unconditional, bsr call)
0000148c | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
00001490 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001492 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001494 | 000001e8                 | ori.b        #$e8, d0                            ; bit/integer operation; flags depend on variant
00001498 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000149a | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
0000149c | 6706                     | beq.b        $14a4                               ; branch according to condition flags (bra unconditional, bsr call)
0000149e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000014a0 | 600000da                 | bra.w        $157c                               ; branch according to condition flags (bra unconditional, bsr call)
000014a4 | 7014                     | moveq        #$14, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000014a6 | a122                     | dc.w         $a122                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000014a8 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000014aa | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000014ac | 660e                     | bne.b        $14bc                               ; branch according to condition flags (bra unconditional, bsr call)
000014ae | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000014b0 | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000014b4 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000014b6 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000014b8 | 600000c2                 | bra.w        $157c                               ; branch according to condition flags (bra unconditional, bsr call)
000014bc | 206efffc                 | movea.l      -$4(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
000014c0 | 2248                     | movea.l      a0, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
000014c2 | 30290006                 | move.w       $6(a1), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000014c6 | c1e80008                 | muls.w       $8(a0), d0                          ; arithmetic operation; flags depend on variant
000014ca | 3228000a                 | move.w       $a(a0), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
000014ce | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000014d0 | 4c00                     | dc.w         $4c00                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000014d2 | 1800                     | move.b       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000014d4 | 2001                     | move.l       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000014d6 | e480                     | asr.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000014d8 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
000014da | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
000014dc | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
000014de | ea88                     | lsr.l        #$5, d0                             ; bit/integer operation; flags depend on variant
000014e0 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
000014e2 | e680                     | asr.l        #$3, d0                             ; bit/integer operation; flags depend on variant
000014e4 | 32280004                 | move.w       $4(a0), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
000014e8 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000014ea | 740e                     | moveq        #$e, d2                             ; copy source to destination (Motorola operand order); flags depend on variant
000014ec | d282                     | add.l        d2, d1                              ; arithmetic operation; flags depend on variant
000014ee | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
000014f0 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000014f2 | 3081                     | move.w       d1, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
000014f4 | 206efffc                 | movea.l      -$4(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
000014f8 | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000014fa | 336800040002             | move.w       $4(a0), $2(a1)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001500 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001502 | 214b000c                 | move.l       a3, $c(a0)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001506 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001508 | 3250                     | movea.w      (a0), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000150a | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000150c | a122                     | dc.w         $a122                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000150e | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001510 | 23480004                 | move.l       a0, $4(a1)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001514 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001516 | 4aa80004                 | tst.l        $4(a0)                              ; machine operation; verify instruction and data boundaries
0000151a | 660c                     | bne.b        $1528                               ; branch according to condition flags (bra unconditional, bsr call)
0000151c | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000151e | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001522 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001524 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001526 | 6054                     | bra.b        $157c                               ; branch according to condition flags (bra unconditional, bsr call)
00001528 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000152a | 3250                     | movea.w      (a0), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000152c | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000152e | a122                     | dc.w         $a122                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001530 | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001532 | 23480008                 | move.l       a0, $8(a1)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001536 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001538 | 4aa80008                 | tst.l        $8(a0)                              ; machine operation; verify instruction and data boundaries
0000153c | 660c                     | bne.b        $154a                               ; branch according to condition flags (bra unconditional, bsr call)
0000153e | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001540 | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001544 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001546 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001548 | 6032                     | bra.b        $157c                               ; branch according to condition flags (bra unconditional, bsr call)
0000154a | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000154c | 3250                     | movea.w      (a0), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000154e | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001550 | 206efffc                 | movea.l      -$4(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001554 | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001556 | 22690004                 | movea.l      $4(a1), a1                          ; copy source to destination (Motorola operand order); flags depend on variant
0000155a | 2251                     | movea.l      (a1), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000155c | a02e                     | dc.w         $a02e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000155e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001560 | 216dfc6c0010             | move.l       -$394(a5), $10(a0)                  ; copy source to destination (Motorola operand order); flags depend on variant
00001566 | 2b4afc6c                 | move.l       a2, -$394(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000156a | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000156c | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000156e | aa2b                     | dc.w         $aa2b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001570 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001572 | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001574 | 200b                     | move.l       a3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001576 | 6600ff14                 | bne.w        $148c                               ; branch according to condition flags (bra unconditional, bsr call)
0000157a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000157c | 4cdf0c08                 | movem.l      (a7)+, d3/a2-a3                     ; copy source to destination (Motorola operand order); flags depend on variant
00001580 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001582 | 4e75                     | rts                                              ; return: pop return address from stack
00001584 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001588 | 48e71e38                 | movem.l      d3-d6/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000158c | 3c2e0008                 | move.w       $8(a6), d6                          ; copy source to destination (Motorola operand order); flags depend on variant
00001590 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00001592 | 0cad46414445fc70         | cmpi.l       #$46414445, -$390(a5)               ; compare operands; set condition flags
0000159a | 6706                     | beq.b        $15a2                               ; branch according to condition flags (bra unconditional, bsr call)
0000159c | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000159e | 6000008a                 | bra.w        $162a                               ; branch according to condition flags (bra unconditional, bsr call)
000015a2 | 266dfc6c                 | movea.l      -$394(a5), a3                       ; copy source to destination (Motorola operand order); flags depend on variant
000015a6 | 607c                     | bra.b        $1624                               ; branch according to condition flags (bra unconditional, bsr call)
000015a8 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000015aa | 3250                     | movea.w      (a0), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000015ac | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000015ae | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000015b0 | 20680004                 | movea.l      $4(a0), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000015b4 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000015b6 | 2253                     | movea.l      (a3), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000015b8 | 22690008                 | movea.l      $8(a1), a1                          ; copy source to destination (Motorola operand order); flags depend on variant
000015bc | 2251                     | movea.l      (a1), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000015be | a02e                     | dc.w         $a02e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000015c0 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000015c2 | 20680008                 | movea.l      $8(a0), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000015c6 | 2850                     | movea.l      (a0), a4                            ; copy source to destination (Motorola operand order); flags depend on variant
000015c8 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000015ca | 244c                     | movea.l      a4, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000015cc | 508a                     | addq.l       #$8, a2                             ; arithmetic operation; flags depend on variant
000015ce | 588a                     | addq.l       #$4, a2                             ; arithmetic operation; flags depend on variant
000015d0 | d4e80002                 | adda.w       $2(a0), a2                          ; arithmetic operation; flags depend on variant
000015d4 | 3a2c0006                 | move.w       $6(a4), d5                          ; copy source to destination (Motorola operand order); flags depend on variant
000015d8 | cbec0008                 | muls.w       $8(a4), d5                          ; arithmetic operation; flags depend on variant
000015dc | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000015de | 601e                     | bra.b        $15fe                               ; branch according to condition flags (bra unconditional, bsr call)
000015e0 | 7800                     | moveq        #$0, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
000015e2 | 18323800                 | move.b       (a2, d3.l), d4                      ; copy source to destination (Motorola operand order); flags depend on variant
000015e6 | 3006                     | move.w       d6, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000015e8 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000015ea | 4c04                     | dc.w         $4c04                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000015ec | 0800                     | .word ; undecoded bytes / possible Macintosh A-line trap
000015ee | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000015f0 | 08000000                 | btst.b       #$0, d0                             ; branch according to condition flags (bra unconditional, bsr call)
000015f4 | 00642800                 | ori.w        #$2800, -(a4)                       ; bit/integer operation; flags depend on variant
000015f8 | 15843800                 | move.b       d4, (a2, d3.l)                      ; copy source to destination (Motorola operand order); flags depend on variant
000015fc | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
000015fe | b685                     | cmp.l        d5, d3                              ; compare operands; set condition flags
00001600 | 6dde                     | blt.b        $15e0                               ; branch according to condition flags (bra unconditional, bsr call)
00001602 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001604 | 2f280008                 | move.l       $8(a0), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001608 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000160a | 2f28000c                 | move.l       $c(a0), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000160e | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001610 | 000000c8                 | ori.b        #$c8, d0                            ; bit/integer operation; flags depend on variant
00001614 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001616 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00001618 | 6704                     | beq.b        $161e                               ; branch according to condition flags (bra unconditional, bsr call)
0000161a | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000161c | 600c                     | bra.b        $162a                               ; branch according to condition flags (bra unconditional, bsr call)
0000161e | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001620 | 26680010                 | movea.l      $10(a0), a3                         ; copy source to destination (Motorola operand order); flags depend on variant
00001624 | 200b                     | move.l       a3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001626 | 6680                     | bne.b        $15a8                               ; branch according to condition flags (bra unconditional, bsr call)
00001628 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000162a | 4cdf1c78                 | movem.l      (a7)+, d3-d6/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
0000162e | 4e5e                     | unlk         a6                                  ; restore stack frame
00001630 | 4e75                     | rts                                              ; return: pop return address from stack
00001632 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001636 | 48e70030                 | movem.l      a2-a3, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000163a | 0cad46414445fc70         | cmpi.l       #$46414445, -$390(a5)               ; compare operands; set condition flags
00001642 | 6704                     | beq.b        $1648                               ; branch according to condition flags (bra unconditional, bsr call)
00001644 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001646 | 602c                     | bra.b        $1674                               ; branch according to condition flags (bra unconditional, bsr call)
00001648 | 246dfc6c                 | movea.l      -$394(a5), a2                       ; copy source to destination (Motorola operand order); flags depend on variant
0000164c | 601c                     | bra.b        $166a                               ; branch according to condition flags (bra unconditional, bsr call)
0000164e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001650 | 26680010                 | movea.l      $10(a0), a3                         ; copy source to destination (Motorola operand order); flags depend on variant
00001654 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001656 | 20680004                 | movea.l      $4(a0), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000165a | a023                     | dc.w         $a023                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000165c | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000165e | 20680008                 | movea.l      $8(a0), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001662 | a023                     | dc.w         $a023                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001664 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001666 | a023                     | dc.w         $a023                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001668 | 244b                     | movea.l      a3, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000166a | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000166c | 66e0                     | bne.b        $164e                               ; branch according to condition flags (bra unconditional, bsr call)
0000166e | 42adfc70                 | clr.l        -$390(a5)                           ; bit/integer operation; flags depend on variant
00001672 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001674 | 4cdf0c00                 | movem.l      (a7)+, a2-a3                        ; copy source to destination (Motorola operand order); flags depend on variant
00001678 | 4e5e                     | unlk         a6                                  ; restore stack frame
0000167a | 4e75                     | rts                                              ; return: pop return address from stack
0000167c | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001680 | 48e71038                 | movem.l      d3/a2-a4, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001684 | 286e0008                 | movea.l      $8(a6), a4                          ; copy source to destination (Motorola operand order); flags depend on variant
00001688 | 266e000c                 | movea.l      $c(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
0000168c | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
0000168e | 4293                     | clr.l        (a3)                                ; bit/integer operation; flags depend on variant
00001690 | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001692 | 4ebafd64                 | jsr          $13f8(pc)                           ; call subroutine; push return address
00001696 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00001698 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000169a | 6604                     | bne.b        $16a0                               ; branch according to condition flags (bra unconditional, bsr call)
0000169c | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000169e | 6030                     | bra.b        $16d0                               ; branch according to condition flags (bra unconditional, bsr call)
000016a0 | 7032                     | moveq        #$32, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000016a2 | a31e                     | dc.w         $a31e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000016a4 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000016a6 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000016a8 | 660a                     | bne.b        $16b4                               ; branch according to condition flags (bra unconditional, bsr call)
000016aa | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000016ac | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000016b0 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000016b2 | 601c                     | bra.b        $16d0                               ; branch according to condition flags (bra unconditional, bsr call)
000016b4 | 357c0008001a             | move.w       #$8, $1a(a2)                        ; copy source to destination (Motorola operand order); flags depend on variant
000016ba | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000016bc | 35500018                 | move.w       (a0), $18(a2)                       ; copy source to destination (Motorola operand order); flags depend on variant
000016c0 | 254b001c                 | move.l       a3, $1c(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000016c4 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000016c6 | a005                     | dc.w         $a005                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000016c8 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000016ca | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000016cc | a01f                     | dc.w         $a01f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000016ce | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000016d0 | 4cdf1c08                 | movem.l      (a7)+, d3/a2-a4                     ; copy source to destination (Motorola operand order); flags depend on variant
000016d4 | 4e5e                     | unlk         a6                                  ; restore stack frame
000016d6 | 4e75                     | rts                                              ; return: pop return address from stack
000016d8 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000016dc | 48e71838                 | movem.l      d3-d4/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
000016e0 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
000016e4 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000016e6 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000016e8 | 4ebafd0e                 | jsr          $13f8(pc)                           ; call subroutine; push return address
000016ec | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
000016ee | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000016f0 | 6604                     | bne.b        $16f6                               ; branch according to condition flags (bra unconditional, bsr call)
000016f2 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000016f4 | 6062                     | bra.b        $1758                               ; branch according to condition flags (bra unconditional, bsr call)
000016f6 | 7032                     | moveq        #$32, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000016f8 | a31e                     | dc.w         $a31e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000016fa | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000016fc | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000016fe | 660a                     | bne.b        $170a                               ; branch according to condition flags (bra unconditional, bsr call)
00001700 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001702 | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001706 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001708 | 604e                     | bra.b        $1758                               ; branch according to condition flags (bra unconditional, bsr call)
0000170a | 357c0004001a             | move.w       #$4, $1a(a2)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001710 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001712 | 35500018                 | move.w       (a0), $18(a2)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001716 | 256e000c001c             | move.l       $c(a6), $1c(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000171c | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000171e | a004                     | dc.w         $a004                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001720 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001722 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00001724 | 662c                     | bne.b        $1752                               ; branch according to condition flags (bra unconditional, bsr call)
00001726 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001728 | aa32                     | dc.w         $aa32                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000172a | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000172c | 2808                     | move.l       a0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000172e | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001730 | aa31                     | dc.w         $aa31                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001732 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001734 | 20680016                 | movea.l      $16(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001738 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000173a | 2868002a                 | movea.l      $2a(a0), a4                         ; copy source to destination (Motorola operand order); flags depend on variant
0000173e | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00001740 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001742 | 3f280006                 | move.w       $6(a0), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001746 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001748 | 48680008                 | pea.l        $8(a0)                              ; machine operation; verify instruction and data boundaries
0000174c | aa3f                     | dc.w         $aa3f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000174e | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001750 | aa31                     | dc.w         $aa31                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001752 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001754 | a01f                     | dc.w         $a01f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001756 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001758 | 4cdf1c18                 | movem.l      (a7)+, d3-d4/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
0000175c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000175e | 4e75                     | rts                                              ; return: pop return address from stack
