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
00000066 | 2b49d3a8                 | move.l       a1, -$2c58(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000006a | 224d                     | movea.l      a5, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
0000006c | 4eba0218                 | jsr          $286(pc)                            ; call subroutine; push return address
00000070 | 226dd3a8                 | movea.l      -$2c58(a5), a1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000074 | 4eba0210                 | jsr          $286(pc)                            ; call subroutine; push return address
00000078 | a9a3                     | dc.w         $a9a3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000007a | 4eba0296                 | jsr          $312(pc)                            ; call subroutine; push return address
0000007e | 422dd3ad                 | clr.b        -$2c53(a5)                          ; bit/integer operation; flags depend on variant
00000082 | 303ca89f                 | move.w       #$a89f, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000086 | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000088 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000008a | 303ca198                 | move.w       #$a198, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000008e | a346                     | dc.w         $a346                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000090 | b1df                     | cmpa.l       (a7)+, a0                           ; compare operands; set condition flags
00000092 | 670a                     | beq.b        $9e                                 ; branch according to condition flags (bra unconditional, bsr call)
00000094 | 1b7c0001d3ad             | move.b       #$1, -$2c53(a5)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000009a | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000009c | a198                     | dc.w         $a198                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000009e | 303ca9f0                 | move.w       #$a9f0, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000000a2 | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000000a4 | 2b48d3a4                 | move.l       a0, -$2c5c(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
000000a8 | 303ca9f1                 | move.w       #$a9f1, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000000ac | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000000ae | 2b48d3a0                 | move.l       a0, -$2c60(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
000000b2 | 303ca9f4                 | move.w       #$a9f4, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000000b6 | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000000b8 | 2b48d39c                 | move.l       a0, -$2c64(a5)                      ; copy source to destination (Motorola operand order); flags depend on variant
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
000000e0 | 4eb900000640             | jsr          $640.l                              ; call subroutine; push return address
000000e6 | 487a0022                 | pea.l        $10a(pc)                            ; machine operation; verify instruction and data boundaries
000000ea | 4a2dffff                 | tst.b        -$1(a5)                             ; machine operation; verify instruction and data boundaries
000000ee | 6702                     | beq.b        $f2                                 ; branch according to condition flags (bra unconditional, bsr call)
000000f0 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000000f2 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000000f4 | 4eb900000642             | jsr          $642.l                              ; call subroutine; push return address
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
00000294 | 2f2dd3a8                 | move.l       -$2c58(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
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
000002c2 | 2f2dd3a8                 | move.l       -$2c58(a5), -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
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
000002f4 | 206dd3a4                 | movea.l      -$2c5c(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000002f8 | 4a6f000c                 | tst.w        $c(a7)                              ; machine operation; verify instruction and data boundaries
000002fc | 6604                     | bne.b        $302                                ; branch according to condition flags (bra unconditional, bsr call)
000002fe | 206dd3a0                 | movea.l      -$2c60(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000302 | 2f48000a                 | move.l       a0, $a(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000306 | 4cdf2100                 | movem.l      (a7)+, a0/a5                        ; copy source to destination (Motorola operand order); flags depend on variant
0000030a | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000030c | 4e75                     | rts                                              ; return: pop return address from stack
0000030e | 00000000                 | ori.b        #$0, d0                             ; bit/integer operation; flags depend on variant
00000312 | 41fafffa                 | lea.l        $30e(pc), a0                        ; machine operation; verify instruction and data boundaries
00000316 | 208d                     | move.l       a5, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000318 | 4e75                     | rts                                              ; return: pop return address from stack
0000031a | 43f900000546             | lea.l        $546.l, a1                          ; machine operation; verify instruction and data boundaries
00000320 | c0fc0010                 | mulu.w       #$10, d0                            ; arithmetic operation; flags depend on variant
00000324 | 238808f0                 | move.l       a0, -$10(a1, d0.l)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000328 | 4e75                     | rts                                              ; return: pop return address from stack
0000032a | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000032e | 4ebaffb4                 | jsr          $2e4(pc)                            ; call subroutine; push return address
00000332 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000334 | 48e7e0e0                 | movem.l      d0-d2/a0-a2, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000338 | 55af0018                 | subq.l       #$2, $18(a7)                        ; arithmetic operation; flags depend on variant
0000033c | 246f0018                 | movea.l      $18(a7), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
00000340 | 202dd3ae                 | move.l       -$2c52(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
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
00000366 | 202dd3ba                 | move.l       -$2c46(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
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
000003c8 | 4a2dd3ad                 | tst.b        -$2c53(a5)                          ; machine operation; verify instruction and data boundaries
000003cc | 6704                     | beq.b        $3d2                                ; branch according to condition flags (bra unconditional, bsr call)
000003ce | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000003d0 | a198                     | dc.w         $a198                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000003d2 | 202dd3b2                 | move.l       -$2c4e(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
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
00000468 | 4a2dd3ad                 | tst.b        -$2c53(a5)                          ; machine operation; verify instruction and data boundaries
0000046c | 6704                     | beq.b        $472                                ; branch according to condition flags (bra unconditional, bsr call)
0000046e | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000470 | a198                     | dc.w         $a198                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000472 | 202dd3b6                 | move.l       -$2c4a(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
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
00000492 | 206dd39c                 | movea.l      -$2c64(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000496 | a647                     | dc.w         $a647                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000498 | 303ca9f0                 | move.w       #$a9f0, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000049c | 206dd3a4                 | movea.l      -$2c5c(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000004a0 | a647                     | dc.w         $a647                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000004a2 | 303ca9f1                 | move.w       #$a9f1, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000004a6 | 206dd3a0                 | movea.l      -$2c60(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000004aa | a647                     | dc.w         $a647                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000004ac | 4e75                     | rts                                              ; return: pop return address from stack
000004ae | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000004b0 | 6014                     | bra.b        $4c6                                ; branch according to condition flags (bra unconditional, bsr call)
000004b2 | 2b52d3be                 | move.l       (a2), -$2c42(a5)                    ; copy source to destination (Motorola operand order); flags depend on variant
000004b6 | 3f3cffff                 | move.w       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000004ba | 2f2a0008                 | move.l       $8(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000004be | 206a0004                 | movea.l      $4(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000004c2 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
000004c4 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
000004c6 | 246dd3be                 | movea.l      -$2c42(a5), a2                      ; copy source to destination (Motorola operand order); flags depend on variant
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
00000562 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000564 | 6c0c                     | bge.b        $572                                ; branch according to condition flags (bra unconditional, bsr call)
00000566 | 4480                     | neg.l        d0                                  ; machine operation; verify instruction and data boundaries
00000568 | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
0000056a | 6c10                     | bge.b        $57c                                ; branch according to condition flags (bra unconditional, bsr call)
0000056c | 4481                     | neg.l        d1                                  ; machine operation; verify instruction and data boundaries
0000056e | 4efaff94                 | jmp          $504(pc)                            ; machine operation; verify instruction and data boundaries
00000572 | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
00000574 | 6d04                     | blt.b        $57a                                ; branch according to condition flags (bra unconditional, bsr call)
00000576 | 4efaff8c                 | jmp          $504(pc)                            ; machine operation; verify instruction and data boundaries
0000057a | 4481                     | neg.l        d1                                  ; machine operation; verify instruction and data boundaries
0000057c | 4ebaff86                 | jsr          $504(pc)                            ; call subroutine; push return address
00000580 | 4480                     | neg.l        d0                                  ; machine operation; verify instruction and data boundaries
00000582 | 4e75                     | rts                                              ; return: pop return address from stack
00000584 | 48e73000                 | movem.l      d2-d3, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000588 | 7402                     | moveq        #$2, d2                             ; copy source to destination (Motorola operand order); flags depend on variant
0000058a | 4efb2200                 | jmp          $58c(pc,d2.w * 2)                   ; machine operation; verify instruction and data boundaries
0000058e | 600c                     | bra.b        $59c                                ; branch according to condition flags (bra unconditional, bsr call)
00000590 | 4c41                     | dc.w         $4c41                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000592 | 00012001                 | ori.b        #$1, d1                             ; bit/integer operation; flags depend on variant
00000596 | 4cdf000c                 | movem.l      (a7)+, d2-d3                        ; copy source to destination (Motorola operand order); flags depend on variant
0000059a | 4e75                     | rts                                              ; return: pop return address from stack
0000059c | 2401                     | move.l       d1, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000059e | 4242                     | clr.w        d2                                  ; bit/integer operation; flags depend on variant
000005a0 | 4842                     | swap         d2                                  ; bit/integer operation; flags depend on variant
000005a2 | 661c                     | bne.b        $5c0                                ; branch according to condition flags (bra unconditional, bsr call)
000005a4 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000005a6 | 4240                     | clr.w        d0                                  ; bit/integer operation; flags depend on variant
000005a8 | 4840                     | swap         d0                                  ; bit/integer operation; flags depend on variant
000005aa | 6706                     | beq.b        $5b2                                ; branch according to condition flags (bra unconditional, bsr call)
000005ac | 80c1                     | divu.w       d1, d0                              ; arithmetic operation; flags depend on variant
000005ae | 3400                     | move.w       d0, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
000005b0 | 4842                     | swap         d2                                  ; bit/integer operation; flags depend on variant
000005b2 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000005b4 | 80c1                     | divu.w       d1, d0                              ; arithmetic operation; flags depend on variant
000005b6 | 4240                     | clr.w        d0                                  ; bit/integer operation; flags depend on variant
000005b8 | 4840                     | swap         d0                                  ; bit/integer operation; flags depend on variant
000005ba | 4cdf000c                 | movem.l      (a7)+, d2-d3                        ; copy source to destination (Motorola operand order); flags depend on variant
000005be | 4e75                     | rts                                              ; return: pop return address from stack
000005c0 | 3400                     | move.w       d0, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
000005c2 | 4240                     | clr.w        d0                                  ; bit/integer operation; flags depend on variant
000005c4 | 4840                     | swap         d0                                  ; bit/integer operation; flags depend on variant
000005c6 | 4842                     | swap         d2                                  ; bit/integer operation; flags depend on variant
000005c8 | 2601                     | move.l       d1, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000005ca | 720f                     | moveq        #$f, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
000005cc | d482                     | add.l        d2, d2                              ; arithmetic operation; flags depend on variant
000005ce | d180                     | addx.l       d0, d0                              ; arithmetic operation; flags depend on variant
000005d0 | b083                     | cmp.l        d3, d0                              ; compare operands; set condition flags
000005d2 | 6502                     | bcs.b        $5d6                                ; branch according to condition flags (bra unconditional, bsr call)
000005d4 | 9083                     | sub.l        d3, d0                              ; arithmetic operation; flags depend on variant
000005d6 | 51c9fff4                 | dbra         d1, $5cc                            ; machine operation; verify instruction and data boundaries
000005da | 4cdf000c                 | movem.l      (a7)+, d2-d3                        ; copy source to destination (Motorola operand order); flags depend on variant
000005de | 4e75                     | rts                                              ; return: pop return address from stack
000005e0 | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
000005e2 | 6c02                     | bge.b        $5e6                                ; branch according to condition flags (bra unconditional, bsr call)
000005e4 | 4481                     | neg.l        d1                                  ; machine operation; verify instruction and data boundaries
000005e6 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
000005e8 | 6d04                     | blt.b        $5ee                                ; branch according to condition flags (bra unconditional, bsr call)
000005ea | 4efaff98                 | jmp          $584(pc)                            ; machine operation; verify instruction and data boundaries
000005ee | 4480                     | neg.l        d0                                  ; machine operation; verify instruction and data boundaries
000005f0 | 4ebaff92                 | jsr          $584(pc)                            ; call subroutine; push return address
000005f4 | 4480                     | neg.l        d0                                  ; machine operation; verify instruction and data boundaries
000005f6 | 4e75                     | rts                                              ; return: pop return address from stack
000005f8 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000005fa | 2248                     | movea.l      a0, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
000005fc | d2d8                     | adda.w       (a0)+, a1                           ; arithmetic operation; flags depend on variant
000005fe | b058                     | cmp.w        (a0)+, d0                           ; compare operands; set condition flags
00000600 | 6c02                     | bge.b        $604                                ; branch according to condition flags (bra unconditional, bsr call)
00000602 | 4ed1                     | jmp          (a1)                                ; machine operation; verify instruction and data boundaries
00000604 | b058                     | cmp.w        (a0)+, d0                           ; compare operands; set condition flags
00000606 | 6f02                     | ble.b        $60a                                ; branch according to condition flags (bra unconditional, bsr call)
00000608 | 4ed1                     | jmp          (a1)                                ; machine operation; verify instruction and data boundaries
0000060a | 3218                     | move.w       (a0)+, d1                           ; copy source to destination (Motorola operand order); flags depend on variant
0000060c | b058                     | cmp.w        (a0)+, d0                           ; compare operands; set condition flags
0000060e | 6604                     | bne.b        $614                                ; branch according to condition flags (bra unconditional, bsr call)
00000610 | d0d0                     | adda.w       (a0), a0                            ; arithmetic operation; flags depend on variant
00000612 | 4ed0                     | jmp          (a0)                                ; machine operation; verify instruction and data boundaries
00000614 | 5448                     | addq.w       #$2, a0                             ; arithmetic operation; flags depend on variant
00000616 | 51c9fff4                 | dbra         d1, $60c                            ; machine operation; verify instruction and data boundaries
0000061a | 4ed1                     | jmp          (a1)                                ; machine operation; verify instruction and data boundaries
0000061c | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000061e | 2248                     | movea.l      a0, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000620 | d2d8                     | adda.w       (a0)+, a1                           ; arithmetic operation; flags depend on variant
00000622 | b098                     | cmp.l        (a0)+, d0                           ; compare operands; set condition flags
00000624 | 6c02                     | bge.b        $628                                ; branch according to condition flags (bra unconditional, bsr call)
00000626 | 4ed1                     | jmp          (a1)                                ; machine operation; verify instruction and data boundaries
00000628 | b098                     | cmp.l        (a0)+, d0                           ; compare operands; set condition flags
0000062a | 6f02                     | ble.b        $62e                                ; branch according to condition flags (bra unconditional, bsr call)
0000062c | 4ed1                     | jmp          (a1)                                ; machine operation; verify instruction and data boundaries
0000062e | 3218                     | move.w       (a0)+, d1                           ; copy source to destination (Motorola operand order); flags depend on variant
00000630 | b098                     | cmp.l        (a0)+, d0                           ; compare operands; set condition flags
00000632 | 6604                     | bne.b        $638                                ; branch according to condition flags (bra unconditional, bsr call)
00000634 | d0d0                     | adda.w       (a0), a0                            ; arithmetic operation; flags depend on variant
00000636 | 4ed0                     | jmp          (a0)                                ; machine operation; verify instruction and data boundaries
00000638 | 5448                     | addq.w       #$2, a0                             ; arithmetic operation; flags depend on variant
0000063a | 51c9fff4                 | dbra         d1, $630                            ; machine operation; verify instruction and data boundaries
0000063e | 4ed1                     | jmp          (a1)                                ; machine operation; verify instruction and data boundaries
00000640 | 4e75                     | rts                                              ; return: pop return address from stack
00000642 | 4e56ff50                 | link.w       a6, #$ff50                          ; establish stack frame
00000646 | 48e71f38                 | movem.l      d3-d7/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000064a | 7800                     | moveq        #$0, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
0000064c | 486dd48c                 | pea.l        -$2b74(a5)                          ; machine operation; verify instruction and data boundaries
00000650 | a86e                     | dc.w         $a86e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000652 | a912                     | dc.w         $a912                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000654 | 2f3c0000ffff             | move.l       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000065a | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000065c | a032                     | dc.w         $a032                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000065e | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000662 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000664 | 0000074c                 | ori.b        #$4c, d0                            ; bit/integer operation; flags depend on variant
00000668 | 206df718                 | movea.l      -$8e8(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
0000066c | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000066e | 3c280020                 | move.w       $20(a0), d6                         ; copy source to destination (Motorola operand order); flags depend on variant
00000672 | 3e06                     | move.w       d6, d7                              ; copy source to destination (Motorola operand order); flags depend on variant
00000674 | 0c460008                 | cmpi.w       #$8, d6                             ; compare operands; set condition flags
00000678 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000067a | 673a                     | beq.b        $6b6                                ; branch according to condition flags (bra unconditional, bsr call)
0000067c | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000067e | 2f2df71c                 | move.l       -$8e4(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000682 | 48780008                 | pea.l        $8.w                                ; machine operation; verify instruction and data boundaries
00000686 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00000688 | 303c0a14                 | move.w       #$a14, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000068c | aaa2                     | dc.w         $aaa2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000068e | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000690 | 6720                     | beq.b        $6b2                                ; branch according to condition flags (bra unconditional, bsr call)
00000692 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000694 | 2f2df71c                 | move.l       -$8e4(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000698 | 48780008                 | pea.l        $8.w                                ; machine operation; verify instruction and data boundaries
0000069c | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
0000069e | 303c0a13                 | move.w       #$a13, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000006a2 | aaa2                     | dc.w         $aaa2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000006a4 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000006a6 | 206df718                 | movea.l      -$8e8(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
000006aa | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000006ac | 3c280020                 | move.w       $20(a0), d6                         ; copy source to destination (Motorola operand order); flags depend on variant
000006b0 | 6004                     | bra.b        $6b6                                ; branch according to condition flags (bra unconditional, bsr call)
000006b2 | 600006f4                 | bra.w        $da8                                ; branch according to condition flags (bra unconditional, bsr call)
000006b6 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000006ba | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000006bc | 000006f4                 | ori.b        #$f4, d0                            ; bit/integer operation; flags depend on variant
000006c0 | 486df931                 | pea.l        -$6cf(a5)                           ; machine operation; verify instruction and data boundaries
000006c4 | 4eb900000090             | jsr          $90.l                               ; call subroutine; push return address
000006ca | 486effe0                 | pea.l        -$20(a6)                            ; machine operation; verify instruction and data boundaries
000006ce | 4eb900000078             | jsr          $78.l                               ; call subroutine; push return address
000006d4 | 1d7c0001fff0             | move.b       #$1, -$10(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
000006da | 7032                     | moveq        #$32, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000006dc | 2d40fff2                 | move.l       d0, -$e(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
000006e0 | 486effe0                 | pea.l        -$20(a6)                            ; machine operation; verify instruction and data boundaries
000006e4 | 4eb900000080             | jsr          $80.l                               ; call subroutine; push return address
000006ea | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000006ec | 4fef000e                 | lea.l        $e(a7), a7                          ; machine operation; verify instruction and data boundaries
000006f0 | 6706                     | beq.b        $6f8                                ; branch according to condition flags (bra unconditional, bsr call)
000006f2 | 486df932                 | pea.l        -$6ce(a5)                           ; machine operation; verify instruction and data boundaries
000006f6 | abff                     | dc.w         $abff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000006f8 | 3f3c0080                 | move.w       #$80, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
000006fc | 2f3c4d414448             | move.l       #$4d414448, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000702 | 4eb9000000a0             | jsr          $a0.l                               ; call subroutine; push return address
00000708 | 302dd41a                 | move.w       -$2be6(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000070c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000070e | 322dd41e                 | move.w       -$2be2(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000712 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000714 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000716 | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000718 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000071a | 00000002                 | ori.b        #$2, d0                             ; bit/integer operation; flags depend on variant
0000071e | 2841                     | movea.l      d1, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000720 | 302dd418                 | move.w       -$2be8(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000724 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000726 | 322dd41c                 | move.w       -$2be4(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
0000072a | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000072c | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
0000072e | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000730 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000732 | 00000002                 | ori.b        #$2, d0                             ; bit/integer operation; flags depend on variant
00000736 | 2d41ffbe                 | move.l       d1, -$42(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000073a | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000073c | 000007dc                 | ori.b        #$dc, d0                            ; bit/integer operation; flags depend on variant
00000740 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00000742 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00000744 | 671a                     | beq.b        $760                                ; branch according to condition flags (bra unconditional, bsr call)
00000746 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000748 | 000008ac                 | ori.b        #$ac, d0                            ; bit/integer operation; flags depend on variant
0000074c | 7664                     | moveq        #$64, d3                            ; copy source to destination (Motorola operand order); flags depend on variant
0000074e | 600c                     | bra.b        $75c                                ; branch according to condition flags (bra unconditional, bsr call)
00000750 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000752 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000754 | 000009c2                 | ori.b        #$c2, d0                            ; bit/integer operation; flags depend on variant
00000758 | 5b83                     | subq.l       #$5, d3                             ; arithmetic operation; flags depend on variant
0000075a | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000075c | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
0000075e | 6cf0                     | bge.b        $750                                ; branch according to condition flags (bra unconditional, bsr call)
00000760 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00000764 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00000766 | 302dd41a                 | move.w       -$2be6(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000076a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000076c | 322dd41e                 | move.w       -$2be2(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000770 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000772 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000774 | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000776 | 302dd418                 | move.w       -$2be8(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000077a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000077c | 322dd41c                 | move.w       -$2be4(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000780 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000782 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000784 | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000786 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000788 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000078a | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000078c | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00000790 | 486df931                 | pea.l        -$6cf(a5)                           ; machine operation; verify instruction and data boundaries
00000794 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000798 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
0000079a | 4878ffff                 | pea.l        $ffff.w                             ; machine operation; verify instruction and data boundaries
0000079e | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
000007a0 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000007a2 | aa45                     | dc.w         $aa45                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007a4 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000007a6 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000007a8 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000007aa | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007ac | 00000664                 | ori.b        #$64, d0                            ; bit/integer operation; flags depend on variant
000007b0 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000007b2 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007b4 | 48780021                 | pea.l        $21.w                               ; machine operation; verify instruction and data boundaries
000007b8 | a862                     | dc.w         $a862                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007ba | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000007be | a8a2                     | dc.w         $a8a2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007c0 | a852                     | dc.w         $a852                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007c2 | 302dd418                 | move.w       -$2be8(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000007c6 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000007c8 | 322dd41c                 | move.w       -$2be4(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
000007cc | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000007ce | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
000007d0 | 0681ffffff38             | addi.l       #$ffffff38, d1                      ; arithmetic operation; flags depend on variant
000007d6 | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007d8 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000007da | 00000002                 | ori.b        #$2, d0                             ; bit/integer operation; flags depend on variant
000007de | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000007e0 | 302dd41a                 | move.w       -$2be6(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000007e4 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000007e6 | 322dd41e                 | move.w       -$2be2(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
000007ea | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000007ec | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
000007ee | 0681fffffec0             | addi.l       #$fffffec0, d1                      ; arithmetic operation; flags depend on variant
000007f4 | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000007f6 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000007f8 | 00000002                 | ori.b        #$2, d0                             ; bit/integer operation; flags depend on variant
000007fc | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000007fe | 3f3c0080                 | move.w       #$80, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000802 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00000804 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000806 | 000006b2                 | ori.b        #$b2, d0                            ; bit/integer operation; flags depend on variant
0000080a | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
0000080c | 4fef000e                 | lea.l        $e(a7), a7                          ; machine operation; verify instruction and data boundaries
00000810 | 600c                     | bra.b        $81e                                ; branch according to condition flags (bra unconditional, bsr call)
00000812 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000814 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000816 | 00000900                 | ori.b        #$0, d0                             ; bit/integer operation; flags depend on variant
0000081a | 5a83                     | addq.l       #$5, d3                             ; arithmetic operation; flags depend on variant
0000081c | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000081e | 7064                     | moveq        #$64, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000820 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00000822 | 6fee                     | ble.b        $812                                ; branch according to condition flags (bra unconditional, bsr call)
00000824 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000826 | 600002a8                 | bra.w        $ad0                                ; branch according to condition flags (bra unconditional, bsr call)
0000082a | 2d43ff50                 | move.l       d3, -$b0(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000082e | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
00000832 | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
00000836 | 3f3c280e                 | move.w       #$280e, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000083a | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000083c | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
00000840 | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
00000844 | 3f3c1010                 | move.w       #$1010, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000848 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000084a | 2d7c40008000ff5a         | move.l       #$40008000, -$a6(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000852 | 42aeff5e                 | clr.l        -$a2(a6)                            ; bit/integer operation; flags depend on variant
00000856 | 426eff62                 | clr.w        -$9e(a6)                            ; bit/integer operation; flags depend on variant
0000085a | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
0000085e | 486eff5a                 | pea.l        -$a6(a6)                            ; machine operation; verify instruction and data boundaries
00000862 | 3f3c1004                 | move.w       #$1004, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000866 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000868 | 2d7c4000c90fff64         | move.l       #$4000c90f, -$9c(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000870 | 2d7cdaa2922aff68         | move.l       #$daa2922a, -$98(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000878 | 3d7c7e48ff6c             | move.w       #$7e48, -$94(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
0000087e | 486eff5a                 | pea.l        -$a6(a6)                            ; machine operation; verify instruction and data boundaries
00000882 | 486eff64                 | pea.l        -$9c(a6)                            ; machine operation; verify instruction and data boundaries
00000886 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000088a | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000088c | 2d6eff64ffd6             | move.l       -$9c(a6), -$2a(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000892 | 2d6eff68ffda             | move.l       -$98(a6), -$26(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000898 | 3d6eff6cffde             | move.w       -$94(a6), -$22(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000089e | 2d7c40078000ff64         | move.l       #$40078000, -$9c(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000008a6 | 42aeff68                 | clr.l        -$98(a6)                            ; bit/integer operation; flags depend on variant
000008aa | 426eff6c                 | clr.w        -$94(a6)                            ; bit/integer operation; flags depend on variant
000008ae | 2d6effd6ff5a             | move.l       -$2a(a6), -$a6(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000008b4 | 2d6effdaff5e             | move.l       -$26(a6), -$a2(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000008ba | 3d6effdeff62             | move.w       -$22(a6), -$9e(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000008c0 | 486eff64                 | pea.l        -$9c(a6)                            ; machine operation; verify instruction and data boundaries
000008c4 | 486eff5a                 | pea.l        -$a6(a6)                            ; machine operation; verify instruction and data boundaries
000008c8 | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000008cc | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000008ce | 2f2eff60                 | move.l       -$a0(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000008d2 | 2f2eff5c                 | move.l       -$a4(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000008d6 | 3f2eff5a                 | move.w       -$a6(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000008da | 486effaa                 | pea.l        -$56(a6)                            ; machine operation; verify instruction and data boundaries
000008de | 4eb900000048             | jsr          $48.l                               ; call subroutine; push return address
000008e4 | 2d7c40068000ff50         | move.l       #$40068000, -$b0(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000008ec | 42aeff54                 | clr.l        -$ac(a6)                            ; bit/integer operation; flags depend on variant
000008f0 | 426eff58                 | clr.w        -$a8(a6)                            ; bit/integer operation; flags depend on variant
000008f4 | 2d6effd6ff6e             | move.l       -$2a(a6), -$92(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000008fa | 2d6effdaff72             | move.l       -$26(a6), -$8e(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000900 | 3d6effdeff76             | move.w       -$22(a6), -$8a(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000906 | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
0000090a | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
0000090e | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000912 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000914 | 2f2eff74                 | move.l       -$8c(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000918 | 2f2eff70                 | move.l       -$90(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000091c | 3f2eff6e                 | move.w       -$92(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000920 | 486effb4                 | pea.l        -$4c(a6)                            ; machine operation; verify instruction and data boundaries
00000924 | 4eb900000048             | jsr          $48.l                               ; call subroutine; push return address
0000092a | 2d7c400dea60ff78         | move.l       #$400dea60, -$88(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000932 | 42aeff7c                 | clr.l        -$84(a6)                            ; bit/integer operation; flags depend on variant
00000936 | 426eff80                 | clr.w        -$80(a6)                            ; bit/integer operation; flags depend on variant
0000093a | 486effb4                 | pea.l        -$4c(a6)                            ; machine operation; verify instruction and data boundaries
0000093e | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000942 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000946 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000948 | 486effaa                 | pea.l        -$56(a6)                            ; machine operation; verify instruction and data boundaries
0000094c | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000950 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000954 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000956 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
0000095a | 3f3c0016                 | move.w       #$16, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000095e | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000960 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000964 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000968 | 3f3c2810                 | move.w       #$2810, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000096c | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000096e | 41edd710                 | lea.l        -$28f0(a5), a0                      ; machine operation; verify instruction and data boundaries
00000972 | 21aeff783e00             | move.l       -$88(a6), (a0, d3.l * 8)            ; copy source to destination (Motorola operand order); flags depend on variant
00000978 | 2d43ff78                 | move.l       d3, -$88(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000097c | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000980 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000984 | 3f3c280e                 | move.w       #$280e, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000988 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000098a | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
0000098e | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000992 | 3f3c1010                 | move.w       #$1010, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000996 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000998 | 2d7c40008000ff6e         | move.l       #$40008000, -$92(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000009a0 | 42aeff72                 | clr.l        -$8e(a6)                            ; bit/integer operation; flags depend on variant
000009a4 | 426eff76                 | clr.w        -$8a(a6)                            ; bit/integer operation; flags depend on variant
000009a8 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
000009ac | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
000009b0 | 3f3c1004                 | move.w       #$1004, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000009b4 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000009b6 | 2d7c4000c90fff64         | move.l       #$4000c90f, -$9c(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000009be | 2d7cdaa2922aff68         | move.l       #$daa2922a, -$98(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000009c6 | 3d7c7e48ff6c             | move.w       #$7e48, -$94(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
000009cc | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
000009d0 | 486eff64                 | pea.l        -$9c(a6)                            ; machine operation; verify instruction and data boundaries
000009d4 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000009d8 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000009da | 2d6eff64ffcc             | move.l       -$9c(a6), -$34(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000009e0 | 2d6eff68ffd0             | move.l       -$98(a6), -$30(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000009e6 | 3d6eff6cffd4             | move.w       -$94(a6), -$2c(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000009ec | 2d7c40058000ff78         | move.l       #$40058000, -$88(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
000009f4 | 42aeff7c                 | clr.l        -$84(a6)                            ; bit/integer operation; flags depend on variant
000009f8 | 426eff80                 | clr.w        -$80(a6)                            ; bit/integer operation; flags depend on variant
000009fc | 2d7c400a8000ff6e         | move.l       #$400a8000, -$92(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000a04 | 42aeff72                 | clr.l        -$8e(a6)                            ; bit/integer operation; flags depend on variant
00000a08 | 426eff76                 | clr.w        -$8a(a6)                            ; bit/integer operation; flags depend on variant
00000a0c | 2d6effccff64             | move.l       -$34(a6), -$9c(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000a12 | 2d6effd0ff68             | move.l       -$30(a6), -$98(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000a18 | 3d6effd4ff6c             | move.w       -$2c(a6), -$94(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000a1e | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
00000a22 | 486eff64                 | pea.l        -$9c(a6)                            ; machine operation; verify instruction and data boundaries
00000a26 | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000a2a | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a2c | 2f2eff6a                 | move.l       -$96(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000a30 | 2f2eff66                 | move.l       -$9a(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000a34 | 3f2eff64                 | move.w       -$9c(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000a38 | 486eff96                 | pea.l        -$6a(a6)                            ; machine operation; verify instruction and data boundaries
00000a3c | 4eb900000048             | jsr          $48.l                               ; call subroutine; push return address
00000a42 | 2d6effccff5a             | move.l       -$34(a6), -$a6(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000a48 | 2d6effd0ff5e             | move.l       -$30(a6), -$a2(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000a4e | 3d6effd4ff62             | move.w       -$2c(a6), -$9e(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000a54 | 486eff96                 | pea.l        -$6a(a6)                            ; machine operation; verify instruction and data boundaries
00000a58 | 486eff5a                 | pea.l        -$a6(a6)                            ; machine operation; verify instruction and data boundaries
00000a5c | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000a60 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a62 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000a66 | 486eff5a                 | pea.l        -$a6(a6)                            ; machine operation; verify instruction and data boundaries
00000a6a | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000a6e | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a70 | 4fef000e                 | lea.l        $e(a7), a7                          ; machine operation; verify instruction and data boundaries
00000a74 | 2f2eff60                 | move.l       -$a0(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000a78 | 2f2eff5c                 | move.l       -$a4(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000a7c | 3f2eff5a                 | move.w       -$a6(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000a80 | 486effa0                 | pea.l        -$60(a6)                            ; machine operation; verify instruction and data boundaries
00000a84 | 4eb900000050             | jsr          $50.l                               ; call subroutine; push return address
00000a8a | 2d7c400bcb20ff50         | move.l       #$400bcb20, -$b0(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000a92 | 42aeff54                 | clr.l        -$ac(a6)                            ; bit/integer operation; flags depend on variant
00000a96 | 426eff58                 | clr.w        -$a8(a6)                            ; bit/integer operation; flags depend on variant
00000a9a | 486effa0                 | pea.l        -$60(a6)                            ; machine operation; verify instruction and data boundaries
00000a9e | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
00000aa2 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000aa6 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000aa8 | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
00000aac | 3f3c0016                 | move.w       #$16, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000ab0 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ab2 | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
00000ab6 | 486eff50                 | pea.l        -$b0(a6)                            ; machine operation; verify instruction and data boundaries
00000aba | 3f3c2810                 | move.w       #$2810, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000abe | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ac0 | 41edd710                 | lea.l        -$28f0(a5), a0                      ; machine operation; verify instruction and data boundaries
00000ac4 | 21aeff503e04             | move.l       -$b0(a6), $4(a0, d3.l)              ; copy source to destination (Motorola operand order); flags depend on variant
00000aca | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000acc | 4fef002a                 | lea.l        $2a(a7), a7                         ; machine operation; verify instruction and data boundaries
00000ad0 | 0c8300000400             | cmpi.l       #$400, d3                           ; compare operands; set condition flags
00000ad6 | 6d00fd52                 | blt.w        $82a                                ; branch according to condition flags (bra unconditional, bsr call)
00000ada | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000adc | 60000146                 | bra.w        $c24                                ; branch according to condition flags (bra unconditional, bsr call)
00000ae0 | 2d7c4004a000ff78         | move.l       #$4004a000, -$88(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000ae8 | 42aeff7c                 | clr.l        -$84(a6)                            ; bit/integer operation; flags depend on variant
00000aec | 426eff80                 | clr.w        -$80(a6)                            ; bit/integer operation; flags depend on variant
00000af0 | 2d43ff6e                 | move.l       d3, -$92(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000af4 | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
00000af8 | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
00000afc | 3f3c280e                 | move.w       #$280e, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000b00 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b02 | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
00000b06 | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
00000b0a | 3f3c1010                 | move.w       #$1010, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000b0e | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b10 | 2d7c40008000ff64         | move.l       #$40008000, -$9c(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000b18 | 42aeff68                 | clr.l        -$98(a6)                            ; bit/integer operation; flags depend on variant
00000b1c | 426eff6c                 | clr.w        -$94(a6)                            ; bit/integer operation; flags depend on variant
00000b20 | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
00000b24 | 486eff64                 | pea.l        -$9c(a6)                            ; machine operation; verify instruction and data boundaries
00000b28 | 3f3c1004                 | move.w       #$1004, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000b2c | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b2e | 2d7c4000c90fff5a         | move.l       #$4000c90f, -$a6(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000b36 | 2d7cdaa2922aff5e         | move.l       #$daa2922a, -$a2(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000b3e | 3d7c7e48ff62             | move.w       #$7e48, -$9e(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000b44 | 486eff64                 | pea.l        -$9c(a6)                            ; machine operation; verify instruction and data boundaries
00000b48 | 486eff5a                 | pea.l        -$a6(a6)                            ; machine operation; verify instruction and data boundaries
00000b4c | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000b50 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b52 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000b56 | 486eff5a                 | pea.l        -$a6(a6)                            ; machine operation; verify instruction and data boundaries
00000b5a | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000b5e | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b60 | 2d6eff5affc2             | move.l       -$a6(a6), -$3e(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000b66 | 2d6eff5effc6             | move.l       -$a2(a6), -$3a(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000b6c | 3d6eff62ffca             | move.w       -$9e(a6), -$36(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000b72 | 2f2effc8                 | move.l       -$38(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000b76 | 2f2effc4                 | move.l       -$3c(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000b7a | 3f2effc2                 | move.w       -$3e(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000b7e | 486eff8c                 | pea.l        -$74(a6)                            ; machine operation; verify instruction and data boundaries
00000b82 | 4eb900000048             | jsr          $48.l                               ; call subroutine; push return address
00000b88 | 2d7c400b9c40ff78         | move.l       #$400b9c40, -$88(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000b90 | 42aeff7c                 | clr.l        -$84(a6)                            ; bit/integer operation; flags depend on variant
00000b94 | 426eff80                 | clr.w        -$80(a6)                            ; bit/integer operation; flags depend on variant
00000b98 | 486eff8c                 | pea.l        -$74(a6)                            ; machine operation; verify instruction and data boundaries
00000b9c | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000ba0 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000ba4 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ba6 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000baa | 3f3c0016                 | move.w       #$16, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000bae | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000bb0 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000bb4 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000bb8 | 3f3c2810                 | move.w       #$2810, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000bbc | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000bbe | 41edd490                 | lea.l        -$2b70(a5), a0                      ; machine operation; verify instruction and data boundaries
00000bc2 | 21aeff783e00             | move.l       -$88(a6), (a0, d3.l * 8)            ; copy source to destination (Motorola operand order); flags depend on variant
00000bc8 | 2f2effc8                 | move.l       -$38(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000bcc | 2f2effc4                 | move.l       -$3c(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000bd0 | 3f2effc2                 | move.w       -$3e(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000bd4 | 486eff82                 | pea.l        -$7e(a6)                            ; machine operation; verify instruction and data boundaries
00000bd8 | 4eb900000050             | jsr          $50.l                               ; call subroutine; push return address
00000bde | 2d7c400b9c40ff78         | move.l       #$400b9c40, -$88(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00000be6 | 42aeff7c                 | clr.l        -$84(a6)                            ; bit/integer operation; flags depend on variant
00000bea | 426eff80                 | clr.w        -$80(a6)                            ; bit/integer operation; flags depend on variant
00000bee | 486eff82                 | pea.l        -$7e(a6)                            ; machine operation; verify instruction and data boundaries
00000bf2 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000bf6 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000bfa | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000bfc | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000c00 | 3f3c0016                 | move.w       #$16, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000c04 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c06 | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000c0a | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
00000c0e | 3f3c2810                 | move.w       #$2810, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000c12 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c14 | 41edd490                 | lea.l        -$2b70(a5), a0                      ; machine operation; verify instruction and data boundaries
00000c18 | 21aeff783e04             | move.l       -$88(a6), $4(a0, d3.l)              ; copy source to destination (Motorola operand order); flags depend on variant
00000c1e | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000c20 | 4fef001c                 | lea.l        $1c(a7), a7                         ; machine operation; verify instruction and data boundaries
00000c24 | 7028                     | moveq        #$28, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000c26 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00000c28 | 6d00feb6                 | blt.w        $ae0                                ; branch according to condition flags (bra unconditional, bsr call)
00000c2c | 48780021                 | pea.l        $21.w                               ; machine operation; verify instruction and data boundaries
00000c30 | a862                     | dc.w         $a862                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c32 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00000c36 | a8a2                     | dc.w         $a8a2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c38 | 4eb9000000a8             | jsr          $a8.l                               ; call subroutine; push return address
00000c3e | 206d090c                 | movea.l      $90c(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c42 | 117c00013250             | move.b       #$1, $3250(a0)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000c48 | 600000b8                 | bra.w        $d02                                ; branch according to condition flags (bra unconditional, bsr call)
00000c4c | 48780021                 | pea.l        $21.w                               ; machine operation; verify instruction and data boundaries
00000c50 | a862                     | dc.w         $a862                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c52 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c54 | 00000246                 | ori.b        #$46, d0                            ; bit/integer operation; flags depend on variant
00000c58 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00000c5c | a8a2                     | dc.w         $a8a2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c5e | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c60 | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c62 | 08010000                 | btst.b       #$0, d1                             ; branch according to condition flags (bra unconditional, bsr call)
00000c66 | 00032601                 | ori.b        #$1, d3                             ; bit/integer operation; flags depend on variant
00000c6a | 6000008c                 | bra.w        $cf8                                ; branch according to condition flags (bra unconditional, bsr call)
00000c6e | 7a00                     | moveq        #$0, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
00000c70 | 607c                     | bra.b        $cee                                ; branch according to condition flags (bra unconditional, bsr call)
00000c72 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c74 | d083                     | add.l        d3, d0                              ; arithmetic operation; flags depend on variant
00000c76 | 0280000003ff             | andi.l       #$3ff, d0                           ; bit/integer operation; flags depend on variant
00000c7c | e788                     | lsl.l        #$3, d0                             ; bit/integer operation; flags depend on variant
00000c7e | 2640                     | movea.l      d0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c80 | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
00000c82 | 7003                     | moveq        #$3, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000c84 | 4c03                     | dc.w         $4c03                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c86 | 0800                     | .word ; undecoded bytes / possible Macintosh A-line trap
00000c88 | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000c8a | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000c8c | 41edd710                 | lea.l        -$28f0(a5), a0                      ; machine operation; verify instruction and data boundaries
00000c90 | 2204                     | move.l       d4, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c92 | 0281000003ff             | andi.l       #$3ff, d1                           ; bit/integer operation; flags depend on variant
00000c98 | 2248                     | movea.l      a0, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c9a | 2430b804                 | move.l       $4(a0, a3.l), d2                    ; copy source to destination (Motorola operand order); flags depend on variant
00000c9e | 94b11e04                 | sub.l        $4(a1, d1.l), d2                    ; arithmetic operation; flags depend on variant
00000ca2 | 41edd490                 | lea.l        -$2b70(a5), a0                      ; machine operation; verify instruction and data boundaries
00000ca6 | d4b05e04                 | add.l        $4(a0, d5.l), d2                    ; arithmetic operation; flags depend on variant
00000caa | 4c40                     | dc.w         $4c40                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000cac | 2802                     | move.l       d2, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000cae | d4aeffbe                 | add.l        -$42(a6), d2                        ; arithmetic operation; flags depend on variant
00000cb2 | 3f02                     | move.w       d2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000cb4 | 7003                     | moveq        #$3, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000cb6 | 4c03                     | dc.w         $4c03                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000cb8 | 0800                     | .word ; undecoded bytes / possible Macintosh A-line trap
00000cba | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000cbc | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000cbe | 41edd710                 | lea.l        -$28f0(a5), a0                      ; machine operation; verify instruction and data boundaries
00000cc2 | 2204                     | move.l       d4, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000cc4 | 0281000003ff             | andi.l       #$3ff, d1                           ; bit/integer operation; flags depend on variant
00000cca | 2248                     | movea.l      a0, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000ccc | 2430b800                 | move.l       (a0, a3.l), d2                      ; copy source to destination (Motorola operand order); flags depend on variant
00000cd0 | 94b11e00                 | sub.l        (a1, d1.l * 8), d2                  ; arithmetic operation; flags depend on variant
00000cd4 | 41edd490                 | lea.l        -$2b70(a5), a0                      ; machine operation; verify instruction and data boundaries
00000cd8 | d4b05e00                 | add.l        (a0, d5.l * 8), d2                  ; arithmetic operation; flags depend on variant
00000cdc | 4c40                     | dc.w         $4c40                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000cde | 2802                     | move.l       d2, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000ce0 | d48c                     | add.l        a4, d2                              ; arithmetic operation; flags depend on variant
00000ce2 | 3f02                     | move.w       d2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000ce4 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ce6 | 0000060e                 | ori.b        #$e, d0                             ; bit/integer operation; flags depend on variant
00000cea | 5285                     | addq.l       #$1, d5                             ; arithmetic operation; flags depend on variant
00000cec | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00000cee | 7028                     | moveq        #$28, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000cf0 | ba80                     | cmp.l        d0, d5                              ; compare operands; set condition flags
00000cf2 | 6d00ff7e                 | blt.w        $c72                                ; branch according to condition flags (bra unconditional, bsr call)
00000cf6 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000cf8 | 7064                     | moveq        #$64, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000cfa | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00000cfc | 6d00ff70                 | blt.w        $c6e                                ; branch according to condition flags (bra unconditional, bsr call)
00000d00 | 5284                     | addq.l       #$1, d4                             ; arithmetic operation; flags depend on variant
00000d02 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000d04 | a974                     | dc.w         $a974                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d06 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d08 | 6700ff42                 | beq.w        $c4c                                ; branch according to condition flags (bra unconditional, bsr call)
00000d0c | 7664                     | moveq        #$64, d3                            ; copy source to destination (Motorola operand order); flags depend on variant
00000d0e | 602c                     | bra.b        $d3c                                ; branch according to condition flags (bra unconditional, bsr call)
00000d10 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d12 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d14 | 00000402                 | ori.b        #$2, d0                             ; bit/integer operation; flags depend on variant
00000d18 | 206d090c                 | movea.l      $90c(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d1c | 57a83148                 | subq.l       #$3, $3148(a0)                      ; arithmetic operation; flags depend on variant
00000d20 | 206d090c                 | movea.l      $90c(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d24 | 57a8314c                 | subq.l       #$3, $314c(a0)                      ; arithmetic operation; flags depend on variant
00000d28 | 206d090c                 | movea.l      $90c(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d2c | 57a83150                 | subq.l       #$3, $3150(a0)                      ; arithmetic operation; flags depend on variant
00000d30 | 206d090c                 | movea.l      $90c(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d34 | 57a83154                 | subq.l       #$3, $3154(a0)                      ; arithmetic operation; flags depend on variant
00000d38 | 5b83                     | subq.l       #$5, d3                             ; arithmetic operation; flags depend on variant
00000d3a | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000d3c | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00000d3e | 6cd0                     | bge.b        $d10                                ; branch according to condition flags (bra unconditional, bsr call)
00000d40 | 4eb9000000b0             | jsr          $b0.l                               ; call subroutine; push return address
00000d46 | 206d090c                 | movea.l      $90c(a5), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d4a | 42283250                 | clr.b        $3250(a0)                           ; bit/integer operation; flags depend on variant
00000d4e | 4eb900000088             | jsr          $88.l                               ; call subroutine; push return address
00000d54 | 4eb900000098             | jsr          $98.l                               ; call subroutine; push return address
00000d5a | a853                     | dc.w         $a853                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d5c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d5e | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d60 | 000000e4                 | ori.b        #$e4, d0                            ; bit/integer operation; flags depend on variant
00000d64 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d66 | a914                     | dc.w         $a914                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d68 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000d6a | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000d6c | 600c                     | bra.b        $d7a                                ; branch according to condition flags (bra unconditional, bsr call)
00000d6e | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d70 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d72 | 000003a4                 | ori.b        #$a4, d0                            ; bit/integer operation; flags depend on variant
00000d76 | 5a83                     | addq.l       #$5, d3                             ; arithmetic operation; flags depend on variant
00000d78 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000d7a | 7064                     | moveq        #$64, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000d7c | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00000d7e | 6fee                     | ble.b        $d6e                                ; branch according to condition flags (bra unconditional, bsr call)
00000d80 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d82 | 00000444                 | ori.b        #$44, d0                            ; bit/integer operation; flags depend on variant
00000d86 | be46                     | cmp.w        d6, d7                              ; compare operands; set condition flags
00000d88 | 6712                     | beq.b        $d9c                                ; branch according to condition flags (bra unconditional, bsr call)
00000d8a | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000d8c | 2f2df71c                 | move.l       -$8e4(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000d90 | 3f07                     | move.w       d7, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d92 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00000d94 | 303c0a13                 | move.w       #$a13, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d98 | aaa2                     | dc.w         $aaa2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d9a | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000d9c | 2f3c0000ffff             | move.l       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000da2 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000da4 | a032                     | dc.w         $a032                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000da6 | a9f4                     | dc.w         $a9f4                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000da8 | 4cdf1cf8                 | movem.l      (a7)+, d3-d7/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
00000dac | 4e5e                     | unlk         a6                                  ; restore stack frame
00000dae | 4e75                     | rts                                              ; return: pop return address from stack
00000db0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000db4 | 1b6e0008f733             | move.b       $8(a6), -$8cd(a5)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000dba | 302dd41a                 | move.w       -$2be6(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000dbe | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000dc0 | 322dd41e                 | move.w       -$2be2(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000dc4 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000dc6 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000dc8 | 3b41f730                 | move.w       d1, -$8d0(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000dcc | 302dd418                 | move.w       -$2be8(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000dd0 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000dd2 | 322dd41c                 | move.w       -$2be4(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00000dd6 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000dd8 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000dda | 3b41f72e                 | move.w       d1, -$8d2(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000dde | 206dd48c                 | movea.l      -$2b74(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000de2 | 3b680006f72c             | move.w       $6(a0), -$8d4(a5)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000de8 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000dea | aa32                     | dc.w         $aa32                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000dec | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000dee | 2b48f71c                 | move.l       a0, -$8e4(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000df2 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000df4 | 2b680016f718             | move.l       $16(a0), -$8e8(a5)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000dfa | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000dfc | aa2a                     | dc.w         $aa2a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000dfe | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000e00 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000e02 | 20680016                 | movea.l      $16(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e06 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000e08 | 2b50f728                 | move.l       (a0), -$8d8(a5)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000e0c | 4e5e                     | unlk         a6                                  ; restore stack frame
00000e0e | 4e75                     | rts                                              ; return: pop return address from stack
00000e10 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000e14 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000e16 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00000e1a | 4aadf720                 | tst.l        -$8e0(a5)                           ; machine operation; verify instruction and data boundaries
00000e1e | 661e                     | bne.b        $e3e                                ; branch according to condition flags (bra unconditional, bsr call)
00000e20 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000e22 | a8d8                     | dc.w         $a8d8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e24 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000e26 | 2b48f720                 | move.l       a0, -$8e0(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000e2a | 2f2a0018                 | move.l       $18(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e2e | 2f2df720                 | move.l       -$8e0(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e32 | a8dc                     | dc.w         $a8dc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e34 | 2f2a0018                 | move.l       $18(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e38 | 486a0010                 | pea.l        $10(a2)                             ; machine operation; verify instruction and data boundaries
00000e3c | a8df                     | dc.w         $a8df                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e3e | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
00000e40 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000e42 | 4e75                     | rts                                              ; return: pop return address from stack
00000e44 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000e48 | 4aadf720                 | tst.l        -$8e0(a5)                           ; machine operation; verify instruction and data boundaries
00000e4c | 6748                     | beq.b        $e96                                ; branch according to condition flags (bra unconditional, bsr call)
00000e4e | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000e50 | a8d8                     | dc.w         $a8d8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e52 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000e54 | 2b48f724                 | move.l       a0, -$8dc(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000e58 | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000e5c | 2f280018                 | move.l       $18(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e60 | 2f2df720                 | move.l       -$8e0(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e64 | 2f2df724                 | move.l       -$8dc(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e68 | a8e6                     | dc.w         $a8e6                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e6a | 48780021                 | pea.l        $21.w                               ; machine operation; verify instruction and data boundaries
00000e6e | a862                     | dc.w         $a862                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e70 | 2f2df724                 | move.l       -$8dc(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e74 | a8d3                     | dc.w         $a8d3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e76 | 2f2df724                 | move.l       -$8dc(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e7a | a8d9                     | dc.w         $a8d9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e7c | 2f2df720                 | move.l       -$8e0(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e80 | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000e84 | 2f280018                 | move.l       $18(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000e88 | a8dc                     | dc.w         $a8dc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e8a | 2f2df720                 | move.l       -$8e0(a5), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e8e | a8d9                     | dc.w         $a8d9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e90 | 42adf720                 | clr.l        -$8e0(a5)                           ; bit/integer operation; flags depend on variant
00000e94 | a937                     | dc.w         $a937                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e96 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000e98 | 4e75                     | rts                                              ; return: pop return address from stack
00000e9a | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00000e9e | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000ea0 | a975                     | dc.w         $a975                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ea2 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000ea4 | 2d40fffc                 | move.l       d0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000ea8 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000eaa | a975                     | dc.w         $a975                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000eac | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000eae | b0aefffc                 | cmp.l        -$4(a6), d0                         ; compare operands; set condition flags
00000eb2 | 67f4                     | beq.b        $ea8                                ; branch according to condition flags (bra unconditional, bsr call)
00000eb4 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000eb6 | 4e75                     | rts                                              ; return: pop return address from stack
00000eb8 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000ebc | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000ebe | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00000ec2 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000ec4 | 2f3c50494354             | move.l       #$50494354, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000eca | 3f2e000c                 | move.w       $c(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000ece | a9a0                     | dc.w         $a9a0                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ed0 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000ed2 | 2488                     | move.l       a0, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000ed4 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000ed6 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000ed8 | 256800020004             | move.l       $2(a0), $4(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000ede | 256800060008             | move.l       $6(a0), $8(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000ee4 | 486a0004                 | pea.l        $4(a2)                              ; machine operation; verify instruction and data boundaries
00000ee8 | 302e000e                 | move.w       $e(a6), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000eec | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000eee | 322a0006                 | move.w       $6(a2), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
00000ef2 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000ef4 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000ef6 | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000ef8 | 302e0010                 | move.w       $10(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000efc | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000efe | 322a0004                 | move.w       $4(a2), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f02 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000f04 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000f06 | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f08 | a8a8                     | dc.w         $a8a8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000f0a | 2f12                     | move.l       (a2), -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f0c | 486a0004                 | pea.l        $4(a2)                              ; machine operation; verify instruction and data boundaries
00000f10 | a8f6                     | dc.w         $a8f6                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000f12 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f14 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000f16 | 4e75                     | rts                                              ; return: pop return address from stack
00000f18 | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00000f1c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f1e | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000f20 | 3f3ca89f                 | move.w       #$a89f, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000f24 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f28 | 4eb900000060             | jsr          $60.l                               ; call subroutine; push return address
00000f2e | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f30 | 2d48fffc                 | move.l       a0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f34 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000f36 | 3f3caa29                 | move.w       #$aa29, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000f3a | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f3e | 4eb900000060             | jsr          $60.l                               ; call subroutine; push return address
00000f44 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f46 | b1eefffc                 | cmpa.l       -$4(a6), a0                         ; compare operands; set condition flags
00000f4a | 6604                     | bne.b        $f50                                ; branch according to condition flags (bra unconditional, bsr call)
00000f4c | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000f4e | 603c                     | bra.b        $f8c                                ; branch according to condition flags (bra unconditional, bsr call)
00000f50 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000f52 | aa29                     | dc.w         $aa29                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000f54 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f56 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f58 | 602a                     | bra.b        $f84                                ; branch according to condition flags (bra unconditional, bsr call)
00000f5a | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000f5c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f5e | 3f3c000d                 | move.w       #$d, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f62 | aa2c                     | dc.w         $aa2c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000f64 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f66 | 6712                     | beq.b        $f7a                                ; branch according to condition flags (bra unconditional, bsr call)
00000f68 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000f6a | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f6c | 3f3c000e                 | move.w       #$e, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f70 | aa2c                     | dc.w         $aa2c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000f72 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f74 | 6704                     | beq.b        $f7a                                ; branch according to condition flags (bra unconditional, bsr call)
00000f76 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000f78 | 6012                     | bra.b        $f8c                                ; branch according to condition flags (bra unconditional, bsr call)
00000f7a | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000f7c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f7e | aa2b                     | dc.w         $aa2b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000f80 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f82 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f84 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f86 | 66d2                     | bne.b        $f5a                                ; branch according to condition flags (bra unconditional, bsr call)
00000f88 | 103c00ff                 | move.b       #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000f8c | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f8e | 4e5e                     | unlk         a6                                  ; restore stack frame
00000f90 | 4e75                     | rts                                              ; return: pop return address from stack
00000f92 | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00000f96 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000f98 | 3f3ca89f                 | move.w       #$a89f, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000f9c | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000fa0 | 4eb900000060             | jsr          $60.l                               ; call subroutine; push return address
00000fa6 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fa8 | 2d48fffc                 | move.l       a0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000fac | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000fae | 3f3caa29                 | move.w       #$aa29, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000fb2 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000fb6 | 4eb900000060             | jsr          $60.l                               ; call subroutine; push return address
00000fbc | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fbe | b1eefffc                 | cmpa.l       -$4(a6), a0                         ; compare operands; set condition flags
00000fc2 | 6604                     | bne.b        $fc8                                ; branch according to condition flags (bra unconditional, bsr call)
00000fc4 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000fc6 | 6028                     | bra.b        $ff0                                ; branch according to condition flags (bra unconditional, bsr call)
00000fc8 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000fca | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000fce | 3f3c000d                 | move.w       #$d, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000fd2 | aa2c                     | dc.w         $aa2c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000fd4 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fd6 | 6714                     | beq.b        $fec                                ; branch according to condition flags (bra unconditional, bsr call)
00000fd8 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000fda | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000fde | 3f3c000e                 | move.w       #$e, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000fe2 | aa2c                     | dc.w         $aa2c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000fe4 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fe6 | 6704                     | beq.b        $fec                                ; branch according to condition flags (bra unconditional, bsr call)
00000fe8 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000fea | 6004                     | bra.b        $ff0                                ; branch according to condition flags (bra unconditional, bsr call)
00000fec | 103c00ff                 | move.b       #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000ff0 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000ff2 | 4e75                     | rts                                              ; return: pop return address from stack
00000ff4 | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00000ff8 | 48e71030                 | movem.l      d3/a2-a3, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000ffc | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000ffe | 0cad46414445f714         | cmpi.l       #$46414445, -$8ec(a5)               ; compare operands; set condition flags
00001006 | 6606                     | bne.b        $100e                               ; branch according to condition flags (bra unconditional, bsr call)
00001008 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000100a | 60000102                 | bra.w        $110e                               ; branch according to condition flags (bra unconditional, bsr call)
0000100e | 42adf710                 | clr.l        -$8f0(a5)                           ; bit/integer operation; flags depend on variant
00001012 | 2b7c46414445f714         | move.l       #$46414445, -$8ec(a5)               ; copy source to destination (Motorola operand order); flags depend on variant
0000101a | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000101c | aa29                     | dc.w         $aa29                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000101e | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001020 | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001022 | 600000e2                 | bra.w        $1106                               ; branch according to condition flags (bra unconditional, bsr call)
00001026 | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
0000102a | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000102c | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000102e | 000001e2                 | ori.b        #$e2, d0                            ; bit/integer operation; flags depend on variant
00001032 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001034 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00001036 | 6706                     | beq.b        $103e                               ; branch according to condition flags (bra unconditional, bsr call)
00001038 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000103a | 600000d2                 | bra.w        $110e                               ; branch according to condition flags (bra unconditional, bsr call)
0000103e | 7014                     | moveq        #$14, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001040 | a122                     | dc.w         $a122                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001042 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00001044 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001046 | 660e                     | bne.b        $1056                               ; branch according to condition flags (bra unconditional, bsr call)
00001048 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000104a | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000104e | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001050 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001052 | 600000ba                 | bra.w        $110e                               ; branch according to condition flags (bra unconditional, bsr call)
00001056 | 206efffc                 | movea.l      -$4(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000105a | 2248                     | movea.l      a0, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
0000105c | 30290006                 | move.w       $6(a1), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001060 | c1e80008                 | muls.w       $8(a0), d0                          ; arithmetic operation; flags depend on variant
00001064 | 3228000a                 | move.w       $a(a0), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
00001068 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000106a | 4c00                     | dc.w         $4c00                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000106c | 1800                     | move.b       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000106e | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001070 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00001072 | 00000008                 | ori.b        #$8, d0                             ; bit/integer operation; flags depend on variant
00001076 | 30280004                 | move.w       $4(a0), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000107a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000107c | 740e                     | moveq        #$e, d2                             ; copy source to destination (Motorola operand order); flags depend on variant
0000107e | d082                     | add.l        d2, d0                              ; arithmetic operation; flags depend on variant
00001080 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00001082 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001084 | 3080                     | move.w       d0, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
00001086 | 206efffc                 | movea.l      -$4(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000108a | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000108c | 336800040002             | move.w       $4(a0), $2(a1)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001092 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001094 | 214b000c                 | move.l       a3, $c(a0)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001098 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000109a | 3250                     | movea.w      (a0), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000109c | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000109e | a122                     | dc.w         $a122                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010a0 | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000010a2 | 23480004                 | move.l       a0, $4(a1)                          ; copy source to destination (Motorola operand order); flags depend on variant
000010a6 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000010a8 | 4aa80004                 | tst.l        $4(a0)                              ; machine operation; verify instruction and data boundaries
000010ac | 660c                     | bne.b        $10ba                               ; branch according to condition flags (bra unconditional, bsr call)
000010ae | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000010b0 | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000010b4 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000010b6 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000010b8 | 6054                     | bra.b        $110e                               ; branch according to condition flags (bra unconditional, bsr call)
000010ba | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000010bc | 3250                     | movea.w      (a0), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000010be | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000010c0 | a122                     | dc.w         $a122                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010c2 | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000010c4 | 23480008                 | move.l       a0, $8(a1)                          ; copy source to destination (Motorola operand order); flags depend on variant
000010c8 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000010ca | 4aa80008                 | tst.l        $8(a0)                              ; machine operation; verify instruction and data boundaries
000010ce | 660c                     | bne.b        $10dc                               ; branch according to condition flags (bra unconditional, bsr call)
000010d0 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000010d2 | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000010d6 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000010d8 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000010da | 6032                     | bra.b        $110e                               ; branch according to condition flags (bra unconditional, bsr call)
000010dc | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000010de | 3250                     | movea.w      (a0), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000010e0 | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000010e2 | 206efffc                 | movea.l      -$4(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
000010e6 | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000010e8 | 22690004                 | movea.l      $4(a1), a1                          ; copy source to destination (Motorola operand order); flags depend on variant
000010ec | 2251                     | movea.l      (a1), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000010ee | a02e                     | dc.w         $a02e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010f0 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000010f2 | 216df7100010             | move.l       -$8f0(a5), $10(a0)                  ; copy source to destination (Motorola operand order); flags depend on variant
000010f8 | 2b4af710                 | move.l       a2, -$8f0(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
000010fc | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000010fe | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001100 | aa2b                     | dc.w         $aa2b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001102 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001104 | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001106 | 200b                     | move.l       a3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001108 | 6600ff1c                 | bne.w        $1026                               ; branch according to condition flags (bra unconditional, bsr call)
0000110c | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000110e | 4cdf0c08                 | movem.l      (a7)+, d3/a2-a3                     ; copy source to destination (Motorola operand order); flags depend on variant
00001112 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001114 | 4e75                     | rts                                              ; return: pop return address from stack
00001116 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000111a | 48e71c38                 | movem.l      d3-d5/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000111e | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00001120 | 0cad46414445f714         | cmpi.l       #$46414445, -$8ec(a5)               ; compare operands; set condition flags
00001128 | 6706                     | beq.b        $1130                               ; branch according to condition flags (bra unconditional, bsr call)
0000112a | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000112c | 60000090                 | bra.w        $11be                               ; branch according to condition flags (bra unconditional, bsr call)
00001130 | 246df710                 | movea.l      -$8f0(a5), a2                       ; copy source to destination (Motorola operand order); flags depend on variant
00001134 | 60000080                 | bra.w        $11b6                               ; branch according to condition flags (bra unconditional, bsr call)
00001138 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000113a | 3250                     | movea.w      (a0), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000113c | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000113e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001140 | 20680004                 | movea.l      $4(a0), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001144 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001146 | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001148 | 22690008                 | movea.l      $8(a1), a1                          ; copy source to destination (Motorola operand order); flags depend on variant
0000114c | 2251                     | movea.l      (a1), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000114e | a02e                     | dc.w         $a02e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001150 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001152 | 20680008                 | movea.l      $8(a0), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001156 | 2650                     | movea.l      (a0), a3                            ; copy source to destination (Motorola operand order); flags depend on variant
00001158 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000115a | 284b                     | movea.l      a3, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000115c | 508c                     | addq.l       #$8, a4                             ; arithmetic operation; flags depend on variant
0000115e | 588c                     | addq.l       #$4, a4                             ; arithmetic operation; flags depend on variant
00001160 | d8e80002                 | adda.w       $2(a0), a4                          ; arithmetic operation; flags depend on variant
00001164 | 3a2b0006                 | move.w       $6(a3), d5                          ; copy source to destination (Motorola operand order); flags depend on variant
00001168 | cbeb0008                 | muls.w       $8(a3), d5                          ; arithmetic operation; flags depend on variant
0000116c | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
0000116e | 6020                     | bra.b        $1190                               ; branch according to condition flags (bra unconditional, bsr call)
00001170 | 7800                     | moveq        #$0, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00001172 | 18343800                 | move.b       (a4, d3.l), d4                      ; copy source to destination (Motorola operand order); flags depend on variant
00001176 | 302e0008                 | move.w       $8(a6), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000117a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000117c | 4c04                     | dc.w         $4c04                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000117e | 0800                     | .word ; undecoded bytes / possible Macintosh A-line trap
00001180 | 4c7c                     | dc.w         $4c7c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001182 | 08000000                 | btst.b       #$0, d0                             ; branch according to condition flags (bra unconditional, bsr call)
00001186 | 00642800                 | ori.w        #$2800, -(a4)                       ; bit/integer operation; flags depend on variant
0000118a | 19843800                 | move.b       d4, (a4, d3.l)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000118e | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00001190 | b685                     | cmp.l        d5, d3                              ; compare operands; set condition flags
00001192 | 6ddc                     | blt.b        $1170                               ; branch according to condition flags (bra unconditional, bsr call)
00001194 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001196 | 2f280008                 | move.l       $8(a0), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000119a | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000119c | 2f28000c                 | move.l       $c(a0), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000011a0 | 61ff                     | dc.w         $61ff                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000011a2 | 000000ca                 | ori.b        #$ca, d0                            ; bit/integer operation; flags depend on variant
000011a6 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000011a8 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
000011aa | 6704                     | beq.b        $11b0                               ; branch according to condition flags (bra unconditional, bsr call)
000011ac | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000011ae | 600e                     | bra.b        $11be                               ; branch according to condition flags (bra unconditional, bsr call)
000011b0 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000011b2 | 24680010                 | movea.l      $10(a0), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
000011b6 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000011b8 | 6600ff7e                 | bne.w        $1138                               ; branch according to condition flags (bra unconditional, bsr call)
000011bc | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000011be | 4cdf1c38                 | movem.l      (a7)+, d3-d5/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
000011c2 | 4e5e                     | unlk         a6                                  ; restore stack frame
000011c4 | 4e75                     | rts                                              ; return: pop return address from stack
000011c6 | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
000011ca | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000011cc | 0cad46414445f714         | cmpi.l       #$46414445, -$8ec(a5)               ; compare operands; set condition flags
000011d4 | 6704                     | beq.b        $11da                               ; branch according to condition flags (bra unconditional, bsr call)
000011d6 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000011d8 | 6030                     | bra.b        $120a                               ; branch according to condition flags (bra unconditional, bsr call)
000011da | 246df710                 | movea.l      -$8f0(a5), a2                       ; copy source to destination (Motorola operand order); flags depend on variant
000011de | 6020                     | bra.b        $1200                               ; branch according to condition flags (bra unconditional, bsr call)
000011e0 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000011e2 | 2d680010fffc             | move.l       $10(a0), -$4(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
000011e8 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000011ea | 20680004                 | movea.l      $4(a0), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000011ee | a023                     | dc.w         $a023                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000011f0 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000011f2 | 20680008                 | movea.l      $8(a0), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000011f6 | a023                     | dc.w         $a023                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000011f8 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000011fa | a023                     | dc.w         $a023                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000011fc | 246efffc                 | movea.l      -$4(a6), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
00001200 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001202 | 66dc                     | bne.b        $11e0                               ; branch according to condition flags (bra unconditional, bsr call)
00001204 | 42adf714                 | clr.l        -$8ec(a5)                           ; bit/integer operation; flags depend on variant
00001208 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000120a | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
0000120c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000120e | 4e75                     | rts                                              ; return: pop return address from stack
00001210 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001214 | 48e71038                 | movem.l      d3/a2-a4, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001218 | 286e0008                 | movea.l      $8(a6), a4                          ; copy source to destination (Motorola operand order); flags depend on variant
0000121c | 266e000c                 | movea.l      $c(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00001220 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00001222 | 4293                     | clr.l        (a3)                                ; bit/integer operation; flags depend on variant
00001224 | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001226 | 4ebafd6a                 | jsr          $f92(pc)                            ; call subroutine; push return address
0000122a | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
0000122c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000122e | 6604                     | bne.b        $1234                               ; branch according to condition flags (bra unconditional, bsr call)
00001230 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001232 | 6030                     | bra.b        $1264                               ; branch according to condition flags (bra unconditional, bsr call)
00001234 | 7032                     | moveq        #$32, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001236 | a31e                     | dc.w         $a31e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001238 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000123a | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000123c | 660a                     | bne.b        $1248                               ; branch according to condition flags (bra unconditional, bsr call)
0000123e | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001240 | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001244 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001246 | 601c                     | bra.b        $1264                               ; branch according to condition flags (bra unconditional, bsr call)
00001248 | 357c0008001a             | move.w       #$8, $1a(a2)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000124e | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001250 | 35500018                 | move.w       (a0), $18(a2)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001254 | 254b001c                 | move.l       a3, $1c(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00001258 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000125a | a005                     | dc.w         $a005                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000125c | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000125e | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001260 | a01f                     | dc.w         $a01f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001262 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001264 | 4cdf1c08                 | movem.l      (a7)+, d3/a2-a4                     ; copy source to destination (Motorola operand order); flags depend on variant
00001268 | 4e5e                     | unlk         a6                                  ; restore stack frame
0000126a | 4e75                     | rts                                              ; return: pop return address from stack
0000126c | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001270 | 48e71838                 | movem.l      d3-d4/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00001274 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00001278 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
0000127a | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000127c | 4ebafd14                 | jsr          $f92(pc)                            ; call subroutine; push return address
00001280 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00001282 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001284 | 6604                     | bne.b        $128a                               ; branch according to condition flags (bra unconditional, bsr call)
00001286 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001288 | 6062                     | bra.b        $12ec                               ; branch according to condition flags (bra unconditional, bsr call)
0000128a | 7032                     | moveq        #$32, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000128c | a31e                     | dc.w         $a31e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000128e | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00001290 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001292 | 660a                     | bne.b        $129e                               ; branch according to condition flags (bra unconditional, bsr call)
00001294 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001296 | 3eb80220                 | move.w       $220.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000129a | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000129c | 604e                     | bra.b        $12ec                               ; branch according to condition flags (bra unconditional, bsr call)
0000129e | 357c0004001a             | move.w       #$4, $1a(a2)                        ; copy source to destination (Motorola operand order); flags depend on variant
000012a4 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000012a6 | 35500018                 | move.w       (a0), $18(a2)                       ; copy source to destination (Motorola operand order); flags depend on variant
000012aa | 256e000c001c             | move.l       $c(a6), $1c(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
000012b0 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000012b2 | a004                     | dc.w         $a004                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000012b4 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000012b6 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
000012b8 | 662c                     | bne.b        $12e6                               ; branch according to condition flags (bra unconditional, bsr call)
000012ba | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000012bc | aa32                     | dc.w         $aa32                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000012be | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000012c0 | 2808                     | move.l       a0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000012c2 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000012c4 | aa31                     | dc.w         $aa31                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000012c6 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000012c8 | 20680016                 | movea.l      $16(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
000012cc | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000012ce | 2868002a                 | movea.l      $2a(a0), a4                         ; copy source to destination (Motorola operand order); flags depend on variant
000012d2 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000012d4 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000012d6 | 3f280006                 | move.w       $6(a0), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000012da | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000012dc | 48680008                 | pea.l        $8(a0)                              ; machine operation; verify instruction and data boundaries
000012e0 | aa3f                     | dc.w         $aa3f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000012e2 | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000012e4 | aa31                     | dc.w         $aa31                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000012e6 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000012e8 | a01f                     | dc.w         $a01f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000012ea | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000012ec | 4cdf1c18                 | movem.l      (a7)+, d3-d4/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
000012f0 | 4e5e                     | unlk         a6                                  ; restore stack frame
000012f2 | 4e75                     | rts                                              ; return: pop return address from stack
000012f4 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000012f8 | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000012fa | 382e0008                 | move.w       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
000012fe | 342e000a                 | move.w       $a(a6), d2                          ; copy source to destination (Motorola operand order); flags depend on variant
00001302 | 4a44                     | tst.w        d4                                  ; machine operation; verify instruction and data boundaries
00001304 | 6d42                     | blt.b        $1348                               ; branch according to condition flags (bra unconditional, bsr call)
00001306 | 302dd41a                 | move.w       -$2be6(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000130a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000130c | 322dd41e                 | move.w       -$2be2(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00001310 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001312 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00001314 | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001316 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001318 | b081                     | cmp.l        d1, d0                              ; compare operands; set condition flags
0000131a | 6c2c                     | bge.b        $1348                               ; branch according to condition flags (bra unconditional, bsr call)
0000131c | 4a42                     | tst.w        d2                                  ; machine operation; verify instruction and data boundaries
0000131e | 6d28                     | blt.b        $1348                               ; branch according to condition flags (bra unconditional, bsr call)
00001320 | 302dd418                 | move.w       -$2be8(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00001324 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001326 | 322dd41c                 | move.w       -$2be4(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
0000132a | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000132c | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
0000132e | 3002                     | move.w       d2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001330 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001332 | b081                     | cmp.l        d1, d0                              ; compare operands; set condition flags
00001334 | 6c12                     | bge.b        $1348                               ; branch according to condition flags (bra unconditional, bsr call)
00001336 | 3002                     | move.w       d2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001338 | c1edf72c                 | muls.w       -$8d4(a5), d0                       ; arithmetic operation; flags depend on variant
0000133c | 206df728                 | movea.l      -$8d8(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00001340 | d1c0                     | adda.l       d0, a0                              ; arithmetic operation; flags depend on variant
00001342 | d0c4                     | adda.w       d4, a0                              ; arithmetic operation; flags depend on variant
00001344 | 10ae000c                 | move.b       $c(a6), (a0)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001348 | 281f                     | move.l       (a7)+, d4                           ; copy source to destination (Motorola operand order); flags depend on variant
0000134a | 4e5e                     | unlk         a6                                  ; restore stack frame
0000134c | 4e75                     | rts                                              ; return: pop return address from stack
