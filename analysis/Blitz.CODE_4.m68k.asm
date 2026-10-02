; Linear Motorola 68000 decode. Offsets include the 4-byte segment header.
; Embedded data/strings may decode as instructions; control flow is not yet fully verified.
; CODE 0 is a jump table and is preserved as raw data, not disassembled.
; Segment header: 00280006

00000004 | 00000028                 | ori.b        #$28, d0                            ; bit/integer operation; flags depend on variant
00000008 | 00004aa0                 | ori.b        #$a0, d0                            ; bit/integer operation; flags depend on variant
0000000c | 4aadf93c                 | tst.l        -$6c4(a5)                           ; machine operation; verify instruction and data boundaries
00000010 | 6604                     | bne.b        $16                                 ; branch according to condition flags (bra unconditional, bsr call)
00000012 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000014 | 4e75                     | rts                                              ; return: pop return address from stack
00000016 | 53adf93c                 | subq.l       #$1, -$6c4(a5)                      ; arithmetic operation; flags depend on variant
0000001a | 202df93c                 | move.l       -$6c4(a5), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
0000001e | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
00000020 | 41edf734                 | lea.l        -$8cc(a5), a0                       ; machine operation; verify instruction and data boundaries
00000024 | 21af00040800             | move.l       $4(a7), (a0, d0.l)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000002a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000002c | 4e75                     | rts                                              ; return: pop return address from stack
0000002e | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000032 | 4aadf7bc                 | tst.l        -$844(a5)                           ; machine operation; verify instruction and data boundaries
00000036 | 661e                     | bne.b        $56                                 ; branch according to condition flags (bra unconditional, bsr call)
00000038 | 6014                     | bra.b        $4e                                 ; branch according to condition flags (bra unconditional, bsr call)
0000003a | 202df938                 | move.l       -$6c8(a5), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
0000003e | 52adf938                 | addq.l       #$1, -$6c8(a5)                      ; arithmetic operation; flags depend on variant
00000042 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
00000044 | 41edf7c0                 | lea.l        -$840(a5), a0                       ; machine operation; verify instruction and data boundaries
00000048 | 20700800                 | movea.l      (a0, d0.l), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000004c | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
0000004e | 7022                     | moveq        #$22, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000050 | b0adf938                 | cmp.l        -$6c8(a5), d0                       ; compare operands; set condition flags
00000054 | 62e4                     | bhi.b        $3a                                 ; branch according to condition flags (bra unconditional, bsr call)
00000056 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000005a | 4eb900000064             | jsr          $64.l                               ; call subroutine; push return address
00000060 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000062 | 4e75                     | rts                                              ; return: pop return address from stack
00000064 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000068 | 4eb9000004ae             | jsr          $4ae.l                              ; call subroutine; push return address
0000006e | 6014                     | bra.b        $84                                 ; branch according to condition flags (bra unconditional, bsr call)
00000070 | 202df93c                 | move.l       -$6c4(a5), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000074 | 52adf93c                 | addq.l       #$1, -$6c4(a5)                      ; arithmetic operation; flags depend on variant
00000078 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
0000007a | 41edf734                 | lea.l        -$8cc(a5), a0                       ; machine operation; verify instruction and data boundaries
0000007e | 20700800                 | movea.l      (a0, d0.l), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000082 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00000084 | 7022                     | moveq        #$22, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000086 | b0adf93c                 | cmp.l        -$6c4(a5), d0                       ; compare operands; set condition flags
0000008a | 62e4                     | bhi.b        $70                                 ; branch according to condition flags (bra unconditional, bsr call)
0000008c | 4eb9000027c0             | jsr          $27c0.l                             ; call subroutine; push return address
00000092 | a9f4                     | dc.w         $a9f4                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000094 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000096 | 4e75                     | rts                                              ; return: pop return address from stack
00000098 | 4e56fff6                 | link.w       a6, #$fff6                          ; establish stack frame
0000009c | 48e71020                 | movem.l      d3/a2, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000000a0 | 262e0008                 | move.l       $8(a6), d3                          ; copy source to destination (Motorola operand order); flags depend on variant
000000a4 | 48780001                 | pea.l        $1.w                                ; machine operation; verify instruction and data boundaries
000000a8 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000000aa | 4eb9000001ac             | jsr          $1ac.l                              ; call subroutine; push return address
000000b0 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000000b2 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000000b4 | b5c0                     | cmpa.l       d0, a2                              ; compare operands; set condition flags
000000b6 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
000000b8 | 6606                     | bne.b        $c0                                 ; branch according to condition flags (bra unconditional, bsr call)
000000ba | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000000bc | 600000e6                 | bra.w        $1a4                                ; branch according to condition flags (bra unconditional, bsr call)
000000c0 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000000c2 | b5c0                     | cmpa.l       d0, a2                              ; compare operands; set condition flags
000000c4 | 670000dc                 | beq.w        $1a2                                ; branch according to condition flags (bra unconditional, bsr call)
000000c8 | b4fc0000                 | cmpa.w       #$0, a2                             ; compare operands; set condition flags
000000cc | 6716                     | beq.b        $e4                                 ; branch according to condition flags (bra unconditional, bsr call)
000000ce | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000000d0 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000000d2 | 4eb9000001ac             | jsr          $1ac.l                              ; call subroutine; push return address
000000d8 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000000da | 4e92                     | jsr          (a2)                                ; call subroutine; push return address
000000dc | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
000000e0 | 600000c0                 | bra.w        $1a2                                ; branch according to condition flags (bra unconditional, bsr call)
000000e4 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000000e6 | 4eb90000061c             | jsr          $61c.l                              ; call subroutine; push return address
000000ec | 00540000                 | ori.w        #$0, (a4)                           ; bit/integer operation; flags depend on variant
000000f0 | 00020000                 | ori.b        #$0, d2                             ; bit/integer operation; flags depend on variant
000000f4 | 000f                     | .word ; undecoded bytes / possible Macintosh A-line trap
000000f6 | 00050000                 | ori.b        #$0, d5                             ; bit/integer operation; flags depend on variant
000000fa | 00020032                 | ori.b        #$32, d2                            ; bit/integer operation; flags depend on variant
000000fe | 00000004                 | ori.b        #$4, d0                             ; bit/integer operation; flags depend on variant
00000102 | 00260000                 | ori.b        #$0, -(a6)                          ; bit/integer operation; flags depend on variant
00000106 | 00060014                 | ori.b        #$14, d6                            ; bit/integer operation; flags depend on variant
0000010a | 00000008                 | ori.b        #$8, d0                             ; bit/integer operation; flags depend on variant
0000010e | 00140000                 | ori.b        #$0, (a4)                           ; bit/integer operation; flags depend on variant
00000112 | 000b                     | .word ; undecoded bytes / possible Macintosh A-line trap
00000114 | 00200000                 | ori.b        #$0, -(a0)                          ; bit/integer operation; flags depend on variant
00000118 | 000f                     | .word ; undecoded bytes / possible Macintosh A-line trap
0000011a | 002045ed                 | ori.b        #$ed, -(a0)                         ; bit/integer operation; flags depend on variant
0000011e | fd48                     | dc.w         $fd48                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000120 | 6058                     | bra.b        $17a                                ; branch according to condition flags (bra unconditional, bsr call)
00000122 | 45edfd4f                 | lea.l        -$2b1(a5), a2                       ; machine operation; verify instruction and data boundaries
00000126 | 6052                     | bra.b        $17a                                ; branch according to condition flags (bra unconditional, bsr call)
00000128 | 45edfd60                 | lea.l        -$2a0(a5), a2                       ; machine operation; verify instruction and data boundaries
0000012c | 604c                     | bra.b        $17a                                ; branch according to condition flags (bra unconditional, bsr call)
0000012e | 45edfd78                 | lea.l        -$288(a5), a2                       ; machine operation; verify instruction and data boundaries
00000132 | 6046                     | bra.b        $17a                                ; branch according to condition flags (bra unconditional, bsr call)
00000134 | 45edfd85                 | lea.l        -$27b(a5), a2                       ; machine operation; verify instruction and data boundaries
00000138 | 6040                     | bra.b        $17a                                ; branch according to condition flags (bra unconditional, bsr call)
0000013a | 45edfd9c                 | lea.l        -$264(a5), a2                       ; machine operation; verify instruction and data boundaries
0000013e | 603a                     | bra.b        $17a                                ; branch according to condition flags (bra unconditional, bsr call)
00000140 | 41eefff6                 | lea.l        -$a(a6), a0                         ; machine operation; verify instruction and data boundaries
00000144 | 5088                     | addq.l       #$8, a0                             ; arithmetic operation; flags depend on variant
00000146 | 5288                     | addq.l       #$1, a0                             ; arithmetic operation; flags depend on variant
00000148 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000014a | 4210                     | clr.b        (a0)                                ; bit/integer operation; flags depend on variant
0000014c | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000014e | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000150 | 4eb9000005e0             | jsr          $5e0.l                              ; call subroutine; push return address
00000156 | 7230                     | moveq        #$30, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000158 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
0000015a | 1500                     | move.b       d0, -(a2)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000015c | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000015e | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000160 | 4eb900000562             | jsr          $562.l                              ; call subroutine; push return address
00000166 | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000168 | 66e2                     | bne.b        $14c                                ; branch according to condition flags (bra unconditional, bsr call)
0000016a | 486dfe3a                 | pea.l        -$1c6(a5)                           ; machine operation; verify instruction and data boundaries
0000016e | 486dfdb0                 | pea.l        -$250(a5)                           ; machine operation; verify instruction and data boundaries
00000172 | 4eb9000003fe             | jsr          $3fe.l                              ; call subroutine; push return address
00000178 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
0000017a | 486dfe3a                 | pea.l        -$1c6(a5)                           ; machine operation; verify instruction and data boundaries
0000017e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000180 | 4eb9000003fe             | jsr          $3fe.l                              ; call subroutine; push return address
00000186 | 486dfe3a                 | pea.l        -$1c6(a5)                           ; machine operation; verify instruction and data boundaries
0000018a | 486dfdb9                 | pea.l        -$247(a5)                           ; machine operation; verify instruction and data boundaries
0000018e | 4eb9000003fe             | jsr          $3fe.l                              ; call subroutine; push return address
00000194 | 48780001                 | pea.l        $1.w                                ; machine operation; verify instruction and data boundaries
00000198 | 4eb90000002e             | jsr          $2e.l                               ; call subroutine; push return address
0000019e | 4fef0014                 | lea.l        $14(a7), a7                         ; machine operation; verify instruction and data boundaries
000001a2 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000001a4 | 4cdf0408                 | movem.l      (a7)+, d3/a2                        ; copy source to destination (Motorola operand order); flags depend on variant
000001a8 | 4e5e                     | unlk         a6                                  ; restore stack frame
000001aa | 4e75                     | rts                                              ; return: pop return address from stack
000001ac | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000001ae | 222f0008                 | move.l       $8(a7), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
000001b2 | 266f000c                 | movea.l      $c(a7), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
000001b6 | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
000001b8 | 6f0c                     | ble.b        $1c6                                ; branch according to condition flags (bra unconditional, bsr call)
000001ba | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000001bc | b280                     | cmp.l        d0, d1                              ; compare operands; set condition flags
000001be | 6c06                     | bge.b        $1c6                                ; branch according to condition flags (bra unconditional, bsr call)
000001c0 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000001c2 | b7c0                     | cmpa.l       d0, a3                              ; compare operands; set condition flags
000001c4 | 660a                     | bne.b        $1d0                                ; branch according to condition flags (bra unconditional, bsr call)
000001c6 | 207cffffffff             | movea.l      #$ffffffff, a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000001cc | 265f                     | movea.l      (a7)+, a3                           ; copy source to destination (Motorola operand order); flags depend on variant
000001ce | 4e75                     | rts                                              ; return: pop return address from stack
000001d0 | 2001                     | move.l       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001d2 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000001d4 | 41edf84c                 | lea.l        -$7b4(a5), a0                       ; machine operation; verify instruction and data boundaries
000001d8 | 22700800                 | movea.l      (a0, d0.l), a1                      ; copy source to destination (Motorola operand order); flags depend on variant
000001dc | 2001                     | move.l       d1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001de | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000001e0 | 218b0800                 | move.l       a3, (a0, d0.l)                      ; copy source to destination (Motorola operand order); flags depend on variant
000001e4 | 2049                     | movea.l      a1, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001e6 | 265f                     | movea.l      (a7)+, a3                           ; copy source to destination (Motorola operand order); flags depend on variant
000001e8 | 4e75                     | rts                                              ; return: pop return address from stack
000001ea | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000001ee | 48e71020                 | movem.l      d3/a2, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000001f2 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000001f4 | 601c                     | bra.b        $212                                ; branch according to condition flags (bra unconditional, bsr call)
000001f6 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001f8 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000001fa | 41edfe72                 | lea.l        -$18e(a5), a0                       ; machine operation; verify instruction and data boundaries
000001fe | 24700800                 | movea.l      (a0, d0.l), a2                      ; copy source to destination (Motorola operand order); flags depend on variant
00000202 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000204 | 670a                     | beq.b        $210                                ; branch according to condition flags (bra unconditional, bsr call)
00000206 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000208 | 4eb900000242             | jsr          $242.l                              ; call subroutine; push return address
0000020e | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000210 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000212 | 7040                     | moveq        #$40, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000214 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00000216 | 65de                     | bcs.b        $1f6                                ; branch according to condition flags (bra unconditional, bsr call)
00000218 | 4cdf0408                 | movem.l      (a7)+, d3/a2                        ; copy source to destination (Motorola operand order); flags depend on variant
0000021c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000021e | 4e75                     | rts                                              ; return: pop return address from stack
00000220 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000224 | 4aadf8cc                 | tst.l        -$734(a5)                           ; machine operation; verify instruction and data boundaries
00000228 | 6614                     | bne.b        $23e                                ; branch according to condition flags (bra unconditional, bsr call)
0000022a | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000022c | 2b40f8cc                 | move.l       d0, -$734(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000230 | 487900000030             | pea.l        $30.l                               ; machine operation; verify instruction and data boundaries
00000236 | 4eb90000000c             | jsr          $c.l                                ; call subroutine; push return address
0000023c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000023e | 4e5e                     | unlk         a6                                  ; restore stack frame
00000240 | 4e75                     | rts                                              ; return: pop return address from stack
00000242 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000246 | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000024a | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
0000024e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000250 | 4eb900000342             | jsr          $342.l                              ; call subroutine; push return address
00000256 | 2800                     | move.l       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000258 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000025a | 7240                     | moveq        #$40, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000025c | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
0000025e | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000260 | 670c                     | beq.b        $26e                                ; branch according to condition flags (bra unconditional, bsr call)
00000262 | 2f2a0004                 | move.l       $4(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000266 | 4eb90000143a             | jsr          $143a.l                             ; call subroutine; push return address
0000026c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000026e | 42aa0004                 | clr.l        $4(a2)                              ; bit/integer operation; flags depend on variant
00000272 | 4a6a0002                 | tst.w        $2(a2)                              ; machine operation; verify instruction and data boundaries
00000276 | 6d16                     | blt.b        $28e                                ; branch according to condition flags (bra unconditional, bsr call)
00000278 | 302a0002                 | move.w       $2(a2), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000027c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000027e | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000280 | 4eb9000018fe             | jsr          $18fe.l                             ; call subroutine; push return address
00000286 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000288 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000028a | 6702                     | beq.b        $28e                                ; branch according to condition flags (bra unconditional, bsr call)
0000028c | 78ff                     | moveq        #$ff, d4                            ; copy source to destination (Motorola operand order); flags depend on variant
0000028e | 4aaa0030                 | tst.l        $30(a2)                             ; machine operation; verify instruction and data boundaries
00000292 | 6722                     | beq.b        $2b6                                ; branch according to condition flags (bra unconditional, bsr call)
00000294 | 2f2a0030                 | move.l       $30(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000298 | 4eb9000004e0             | jsr          $4e0.l                              ; call subroutine; push return address
0000029e | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
000002a0 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000002a2 | 6702                     | beq.b        $2a6                                ; branch according to condition flags (bra unconditional, bsr call)
000002a4 | 78ff                     | moveq        #$ff, d4                            ; copy source to destination (Motorola operand order); flags depend on variant
000002a6 | 2f2a0030                 | move.l       $30(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000002aa | 4eb90000143a             | jsr          $143a.l                             ; call subroutine; push return address
000002b0 | 42aa0030                 | clr.l        $30(a2)                             ; bit/integer operation; flags depend on variant
000002b4 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000002b6 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000002b8 | 028000000080             | andi.l       #$80, d0                            ; bit/integer operation; flags depend on variant
000002be | 6730                     | beq.b        $2f0                                ; branch according to condition flags (bra unconditional, bsr call)
000002c0 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000002c2 | 601a                     | bra.b        $2de                                ; branch according to condition flags (bra unconditional, bsr call)
000002c4 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000002c6 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000002c8 | 41edfe72                 | lea.l        -$18e(a5), a0                       ; machine operation; verify instruction and data boundaries
000002cc | b5f00800                 | cmpa.l       (a0, d0.l), a2                      ; compare operands; set condition flags
000002d0 | 660a                     | bne.b        $2dc                                ; branch according to condition flags (bra unconditional, bsr call)
000002d2 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000002d4 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000002d6 | 42b00800                 | clr.l        (a0, d0.l)                          ; bit/integer operation; flags depend on variant
000002da | 6008                     | bra.b        $2e4                                ; branch according to condition flags (bra unconditional, bsr call)
000002dc | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
000002de | 7040                     | moveq        #$40, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000002e0 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
000002e2 | 65e0                     | bcs.b        $2c4                                ; branch according to condition flags (bra unconditional, bsr call)
000002e4 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000002e6 | 4eb90000143a             | jsr          $143a.l                             ; call subroutine; push return address
000002ec | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000002ee | 6048                     | bra.b        $338                                ; branch according to condition flags (bra unconditional, bsr call)
000002f0 | 4252                     | clr.w        (a2)                                ; bit/integer operation; flags depend on variant
000002f2 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000002f4 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000002f8 | 2548000c                 | move.l       a0, $c(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000002fc | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000002fe | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
00000302 | 25480010                 | move.l       a0, $10(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000306 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000308 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
0000030c | 25480026                 | move.l       a0, $26(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000310 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000312 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
00000316 | 25480014                 | move.l       a0, $14(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000031a | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000031c | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
00000320 | 2548002a                 | move.l       a0, $2a(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000324 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000326 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
0000032a | 25480018                 | move.l       a0, $18(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000032e | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000330 | 41e80022                 | lea.l        $22(a0), a0                         ; machine operation; verify instruction and data boundaries
00000334 | 2548001c                 | move.l       a0, $1c(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000338 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000033a | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
0000033e | 4e5e                     | unlk         a6                                  ; restore stack frame
00000340 | 4e75                     | rts                                              ; return: pop return address from stack
00000342 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000346 | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000034a | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
0000034e | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000350 | 6632                     | bne.b        $384                                ; branch according to condition flags (bra unconditional, bsr call)
00000352 | 7800                     | moveq        #$0, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00000354 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000356 | 6022                     | bra.b        $37a                                ; branch according to condition flags (bra unconditional, bsr call)
00000358 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000035a | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
0000035c | 41edfe72                 | lea.l        -$18e(a5), a0                       ; machine operation; verify instruction and data boundaries
00000360 | 26700800                 | movea.l      (a0, d0.l), a3                      ; copy source to destination (Motorola operand order); flags depend on variant
00000364 | 200b                     | move.l       a3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000366 | 6710                     | beq.b        $378                                ; branch according to condition flags (bra unconditional, bsr call)
00000368 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000036a | 4eb900000342             | jsr          $342.l                              ; call subroutine; push return address
00000370 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000372 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000374 | 6c02                     | bge.b        $378                                ; branch according to condition flags (bra unconditional, bsr call)
00000376 | 78ff                     | moveq        #$ff, d4                            ; copy source to destination (Motorola operand order); flags depend on variant
00000378 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
0000037a | 7040                     | moveq        #$40, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000037c | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
0000037e | 6dd8                     | blt.b        $358                                ; branch according to condition flags (bra unconditional, bsr call)
00000380 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000382 | 6072                     | bra.b        $3f6                                ; branch according to condition flags (bra unconditional, bsr call)
00000384 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000386 | 028000002000             | andi.l       #$2000, d0                          ; bit/integer operation; flags depend on variant
0000038c | 6604                     | bne.b        $392                                ; branch according to condition flags (bra unconditional, bsr call)
0000038e | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000390 | 6064                     | bra.b        $3f6                                ; branch according to condition flags (bra unconditional, bsr call)
00000392 | 266a0004                 | movea.l      $4(a2), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000396 | 6038                     | bra.b        $3d0                                ; branch according to condition flags (bra unconditional, bsr call)
00000398 | 206a000c                 | movea.l      $c(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000039c | 91cb                     | suba.l       a3, a0                              ; arithmetic operation; flags depend on variant
0000039e | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000003a0 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000003a2 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000003a4 | 4eb900001be0             | jsr          $1be0.l                             ; call subroutine; push return address
000003aa | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000003ac | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
000003ae | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
000003b2 | 6e1a                     | bgt.b        $3ce                                ; branch according to condition flags (bra unconditional, bsr call)
000003b4 | 256a0004000c             | move.l       $4(a2), $c(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
000003ba | 256a00040014             | move.l       $4(a2), $14(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
000003c0 | 256a0004002a             | move.l       $4(a2), $2a(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
000003c6 | 00520200                 | ori.w        #$200, (a2)                         ; bit/integer operation; flags depend on variant
000003ca | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000003cc | 6028                     | bra.b        $3f6                                ; branch according to condition flags (bra unconditional, bsr call)
000003ce | d7c3                     | adda.l       d3, a3                              ; arithmetic operation; flags depend on variant
000003d0 | b7ea000c                 | cmpa.l       $c(a2), a3                          ; compare operands; set condition flags
000003d4 | 65c2                     | bcs.b        $398                                ; branch according to condition flags (bra unconditional, bsr call)
000003d6 | 256a0004000c             | move.l       $4(a2), $c(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
000003dc | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000003de | 028000004000             | andi.l       #$4000, d0                          ; bit/integer operation; flags depend on variant
000003e4 | 6708                     | beq.b        $3ee                                ; branch according to condition flags (bra unconditional, bsr call)
000003e6 | 256a00080014             | move.l       $8(a2), $14(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
000003ec | 6006                     | bra.b        $3f4                                ; branch according to condition flags (bra unconditional, bsr call)
000003ee | 256a0008002a             | move.l       $8(a2), $2a(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
000003f4 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000003f6 | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
000003fa | 4e5e                     | unlk         a6                                  ; restore stack frame
000003fc | 4e75                     | rts                                              ; return: pop return address from stack
000003fe | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000402 | 48e71838                 | movem.l      d3-d4/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000406 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
0000040a | 246e000c                 | movea.l      $c(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
0000040e | 6000009e                 | bra.w        $4ae                                ; branch according to condition flags (bra unconditional, bsr call)
00000412 | 206a000c                 | movea.l      $c(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000416 | b1ea0014                 | cmpa.l       $14(a2), a0                         ; compare operands; set condition flags
0000041a | 6514                     | bcs.b        $430                                ; branch according to condition flags (bra unconditional, bsr call)
0000041c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000041e | 4eb900000556             | jsr          $556.l                              ; call subroutine; push return address
00000424 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000426 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000428 | 6c06                     | bge.b        $430                                ; branch according to condition flags (bra unconditional, bsr call)
0000042a | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000042c | 600000aa                 | bra.w        $4d8                                ; branch according to condition flags (bra unconditional, bsr call)
00000430 | 08120002                 | btst.b       #$2, (a2)                           ; branch according to condition flags (bra unconditional, bsr call)
00000434 | 6604                     | bne.b        $43a                                ; branch according to condition flags (bra unconditional, bsr call)
00000436 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
00000438 | 600e                     | bra.b        $448                                ; branch according to condition flags (bra unconditional, bsr call)
0000043a | 4878000a                 | pea.l        $a.w                                ; machine operation; verify instruction and data boundaries
0000043e | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000440 | 4eb9000018d8             | jsr          $18d8.l                             ; call subroutine; push return address
00000446 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00000448 | 2848                     | movea.l      a0, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000044a | 200c                     | move.l       a4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000044c | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
0000044e | 660c                     | bne.b        $45c                                ; branch according to condition flags (bra unconditional, bsr call)
00000450 | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000452 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000454 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000456 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00000458 | 66fa                     | bne.b        $454                                ; branch according to condition flags (bra unconditional, bsr call)
0000045a | 6008                     | bra.b        $464                                ; branch according to condition flags (bra unconditional, bsr call)
0000045c | 204c                     | movea.l      a4, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000045e | 91cb                     | suba.l       a3, a0                              ; arithmetic operation; flags depend on variant
00000460 | 5288                     | addq.l       #$1, a0                             ; arithmetic operation; flags depend on variant
00000462 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000464 | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000466 | 206a0014                 | movea.l      $14(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000046a | 91ea000c                 | suba.l       $c(a2), a0                          ; arithmetic operation; flags depend on variant
0000046e | 2808                     | move.l       a0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000470 | b883                     | cmp.l        d3, d4                              ; compare operands; set condition flags
00000472 | 6404                     | bcc.b        $478                                ; branch according to condition flags (bra unconditional, bsr call)
00000474 | 99cc                     | suba.l       a4, a4                              ; arithmetic operation; flags depend on variant
00000476 | 2604                     | move.l       d4, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000478 | 206a000c                 | movea.l      $c(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000047c | 224b                     | movea.l      a3, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
0000047e | 2203                     | move.l       d3, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000480 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000482 | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
00000484 | 6706                     | beq.b        $48c                                ; branch according to condition flags (bra unconditional, bsr call)
00000486 | 10d9                     | move.b       (a1)+, (a0)+                        ; copy source to destination (Motorola operand order); flags depend on variant
00000488 | 5381                     | subq.l       #$1, d1                             ; arithmetic operation; flags depend on variant
0000048a | 66fa                     | bne.b        $486                                ; branch according to condition flags (bra unconditional, bsr call)
0000048c | d7c3                     | adda.l       d3, a3                              ; arithmetic operation; flags depend on variant
0000048e | d7aa000c                 | add.l        d3, $c(a2)                          ; arithmetic operation; flags depend on variant
00000492 | 200c                     | move.l       a4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000494 | 6718                     | beq.b        $4ae                                ; branch according to condition flags (bra unconditional, bsr call)
00000496 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000498 | 4eb900000342             | jsr          $342.l                              ; call subroutine; push return address
0000049e | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
000004a0 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000004a2 | 670a                     | beq.b        $4ae                                ; branch according to condition flags (bra unconditional, bsr call)
000004a4 | 256a00040014             | move.l       $4(a2), $14(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
000004aa | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000004ac | 602a                     | bra.b        $4d8                                ; branch according to condition flags (bra unconditional, bsr call)
000004ae | 4a13                     | tst.b        (a3)                                ; machine operation; verify instruction and data boundaries
000004b0 | 6600ff60                 | bne.w        $412                                ; branch according to condition flags (bra unconditional, bsr call)
000004b4 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000004b6 | 028000000800             | andi.l       #$800, d0                           ; bit/integer operation; flags depend on variant
000004bc | 6718                     | beq.b        $4d6                                ; branch according to condition flags (bra unconditional, bsr call)
000004be | 256a00040014             | move.l       $4(a2), $14(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
000004c4 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000004c6 | 4eb900000342             | jsr          $342.l                              ; call subroutine; push return address
000004cc | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
000004ce | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000004d0 | 6704                     | beq.b        $4d6                                ; branch according to condition flags (bra unconditional, bsr call)
000004d2 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000004d4 | 6002                     | bra.b        $4d8                                ; branch according to condition flags (bra unconditional, bsr call)
000004d6 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000004d8 | 4cdf1c18                 | movem.l      (a7)+, d3-d4/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
000004dc | 4e5e                     | unlk         a6                                  ; restore stack frame
000004de | 4e75                     | rts                                              ; return: pop return address from stack
000004e0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000004e4 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000004e8 | 4eb900001a92             | jsr          $1a92.l                             ; call subroutine; push return address
000004ee | 4e5e                     | unlk         a6                                  ; restore stack frame
000004f0 | 4e75                     | rts                                              ; return: pop return address from stack
000004f2 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000004f6 | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000004fa | 226e000c                 | movea.l      $c(a6), a1                          ; copy source to destination (Motorola operand order); flags depend on variant
000004fe | 222e0010                 | move.l       $10(a6), d1                         ; copy source to destination (Motorola operand order); flags depend on variant
00000502 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000504 | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
00000506 | 6706                     | beq.b        $50e                                ; branch according to condition flags (bra unconditional, bsr call)
00000508 | 10d9                     | move.b       (a1)+, (a0)+                        ; copy source to destination (Motorola operand order); flags depend on variant
0000050a | 5381                     | subq.l       #$1, d1                             ; arithmetic operation; flags depend on variant
0000050c | 66fa                     | bne.b        $508                                ; branch according to condition flags (bra unconditional, bsr call)
0000050e | 2040                     | movea.l      d0, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000510 | d1ee0010                 | adda.l       $10(a6), a0                         ; arithmetic operation; flags depend on variant
00000514 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000516 | 4e75                     | rts                                              ; return: pop return address from stack
00000518 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000051c | 48e71030                 | movem.l      d3/a2-a3, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000520 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000524 | 45ee000c                 | lea.l        $c(a6), a2                          ; machine operation; verify instruction and data boundaries
00000528 | 588a                     | addq.l       #$4, a2                             ; arithmetic operation; flags depend on variant
0000052a | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000052c | 2f2e000c                 | move.l       $c(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000530 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000532 | 487900000038             | pea.l        $38.l                               ; machine operation; verify instruction and data boundaries
00000538 | 4eb900000aae             | jsr          $aae.l                              ; call subroutine; push return address
0000053e | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000540 | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00000542 | 4fef0010                 | lea.l        $10(a7), a7                         ; machine operation; verify instruction and data boundaries
00000546 | 6d04                     | blt.b        $54c                                ; branch according to condition flags (bra unconditional, bsr call)
00000548 | 42333800                 | clr.b        (a3, d3.l)                          ; bit/integer operation; flags depend on variant
0000054c | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000054e | 4cdf0c08                 | movem.l      (a7)+, d3/a2-a3                     ; copy source to destination (Motorola operand order); flags depend on variant
00000552 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000554 | 4e75                     | rts                                              ; return: pop return address from stack
00000556 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000055a | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000055c | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00000560 | 206a000c                 | movea.l      $c(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000564 | b1ea0014                 | cmpa.l       $14(a2), a0                         ; compare operands; set condition flags
00000568 | 6406                     | bcc.b        $570                                ; branch according to condition flags (bra unconditional, bsr call)
0000056a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000056c | 600000bc                 | bra.w        $62a                                ; branch according to condition flags (bra unconditional, bsr call)
00000570 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000572 | 028000006000             | andi.l       #$6000, d0                          ; bit/integer operation; flags depend on variant
00000578 | 0c8000006000             | cmpi.l       #$6000, d0                          ; compare operands; set condition flags
0000057e | 660e                     | bne.b        $58e                                ; branch according to condition flags (bra unconditional, bsr call)
00000580 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000582 | 4eb900000342             | jsr          $342.l                              ; call subroutine; push return address
00000588 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000058a | 6000009e                 | bra.w        $62a                                ; branch according to condition flags (bra unconditional, bsr call)
0000058e | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000590 | 028000009002             | andi.l       #$9002, d0                          ; bit/integer operation; flags depend on variant
00000596 | 5580                     | subq.l       #$2, d0                             ; arithmetic operation; flags depend on variant
00000598 | 671a                     | beq.b        $5b4                                ; branch according to condition flags (bra unconditional, bsr call)
0000059a | 08120007                 | btst.b       #$7, (a2)                           ; branch according to condition flags (bra unconditional, bsr call)
0000059e | 6608                     | bne.b        $5a8                                ; branch according to condition flags (bra unconditional, bsr call)
000005a0 | 203c00004200             | move.l       #$4200, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000005a6 | 6006                     | bra.b        $5ae                                ; branch according to condition flags (bra unconditional, bsr call)
000005a8 | 203c00000200             | move.l       #$200, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000005ae | 8152                     | or.w         d0, (a2)                            ; bit/integer operation; flags depend on variant
000005b0 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000005b2 | 6076                     | bra.b        $62a                                ; branch according to condition flags (bra unconditional, bsr call)
000005b4 | 4aaa0004                 | tst.l        $4(a2)                              ; machine operation; verify instruction and data boundaries
000005b8 | 6652                     | bne.b        $60c                                ; branch according to condition flags (bra unconditional, bsr call)
000005ba | 48781000                 | pea.l        $1000.w                             ; machine operation; verify instruction and data boundaries
000005be | 4eb9000015cc             | jsr          $15cc.l                             ; call subroutine; push return address
000005c4 | 25480004                 | move.l       a0, $4(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000005c8 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000005ca | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000005cc | 661c                     | bne.b        $5ea                                ; branch according to condition flags (bra unconditional, bsr call)
000005ce | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000005d0 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000005d4 | 25480004                 | move.l       a0, $4(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000005d8 | 206a0004                 | movea.l      $4(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000005dc | 5288                     | addq.l       #$1, a0                             ; arithmetic operation; flags depend on variant
000005de | 25480008                 | move.l       a0, $8(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000005e2 | 4eb900000220             | jsr          $220.l                              ; call subroutine; push return address
000005e8 | 6022                     | bra.b        $60c                                ; branch according to condition flags (bra unconditional, bsr call)
000005ea | 00520040                 | ori.w        #$40, (a2)                          ; bit/integer operation; flags depend on variant
000005ee | 206a0004                 | movea.l      $4(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000005f2 | 41e81000                 | lea.l        $1000(a0), a0                       ; machine operation; verify instruction and data boundaries
000005f6 | 25480008                 | move.l       a0, $8(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000005fa | 256a00040026             | move.l       $4(a2), $26(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000600 | 256a0004002a             | move.l       $4(a2), $2a(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000606 | 4eb900000220             | jsr          $220.l                              ; call subroutine; push return address
0000060c | 256a0004000c             | move.l       $4(a2), $c(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000612 | 256a00040010             | move.l       $4(a2), $10(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000618 | 256a00080014             | move.l       $8(a2), $14(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000061e | 00526000                 | ori.w        #$6000, (a2)                        ; bit/integer operation; flags depend on variant
00000622 | 4eb900000220             | jsr          $220.l                              ; call subroutine; push return address
00000628 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000062a | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
0000062c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000062e | 4e75                     | rts                                              ; return: pop return address from stack
00000630 | 4e56fed8                 | link.w       a6, #$fed8                          ; establish stack frame
00000634 | 48e71f38                 | movem.l      d3-d7/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000638 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
0000063c | 182e000c                 | move.b       $c(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
00000640 | 2d52fed8                 | move.l       (a2), -$128(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000644 | 2d6a0004fedc             | move.l       $4(a2), -$124(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
0000064a | 3d6a0008fee0             | move.w       $8(a2), -$120(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000650 | 266a0012                 | movea.l      $12(a2), a3                         ; copy source to destination (Motorola operand order); flags depend on variant
00000654 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000656 | 7c00                     | moveq        #$0, d6                             ; copy source to destination (Motorola operand order); flags depend on variant
00000658 | 4aaa002e                 | tst.l        $2e(a2)                             ; machine operation; verify instruction and data boundaries
0000065c | 6c08                     | bge.b        $666                                ; branch according to condition flags (bra unconditional, bsr call)
0000065e | 7006                     | moveq        #$6, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000660 | 2540002e                 | move.l       d0, $2e(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000664 | 6018                     | bra.b        $67e                                ; branch according to condition flags (bra unconditional, bsr call)
00000666 | 4aaa002e                 | tst.l        $2e(a2)                             ; machine operation; verify instruction and data boundaries
0000066a | 6612                     | bne.b        $67e                                ; branch according to condition flags (bra unconditional, bsr call)
0000066c | 0c040067                 | cmpi.b       #$67, d4                            ; compare operands; set condition flags
00000670 | 6706                     | beq.b        $678                                ; branch according to condition flags (bra unconditional, bsr call)
00000672 | 0c040047                 | cmpi.b       #$47, d4                            ; compare operands; set condition flags
00000676 | 6606                     | bne.b        $67e                                ; branch according to condition flags (bra unconditional, bsr call)
00000678 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000067a | 2540002e                 | move.l       d0, $2e(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000067e | 7013                     | moveq        #$13, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000680 | b0aa002e                 | cmp.l        $2e(a2), d0                         ; compare operands; set condition flags
00000684 | 6c06                     | bge.b        $68c                                ; branch according to condition flags (bra unconditional, bsr call)
00000686 | 7013                     | moveq        #$13, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000688 | 2540002e                 | move.l       d0, $2e(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000068c | 3d6a0030fefe             | move.w       $30(a2), -$102(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000692 | 1004                     | move.b       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000694 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00000696 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000698 | 4eb90000061c             | jsr          $61c.l                              ; call subroutine; push return address
0000069e | 003a                     | .word ; undecoded bytes / possible Macintosh A-line trap
000006a0 | 00000045                 | ori.b        #$45, d0                            ; bit/integer operation; flags depend on variant
000006a4 | 00000067                 | ori.b        #$67, d0                            ; bit/integer operation; flags depend on variant
000006a8 | 00040000                 | ori.b        #$0, d4                             ; bit/integer operation; flags depend on variant
000006ac | 0045001a                 | ori.w        #$1a, d5                            ; bit/integer operation; flags depend on variant
000006b0 | 00000047                 | ori.b        #$47, d0                            ; bit/integer operation; flags depend on variant
000006b4 | 00180000                 | ori.b        #$0, (a0)+                          ; bit/integer operation; flags depend on variant
000006b8 | 0065000e                 | ori.w        #$e, -(a5)                          ; bit/integer operation; flags depend on variant
000006bc | 00000066                 | ori.b        #$66, d0                            ; bit/integer operation; flags depend on variant
000006c0 | 00120000                 | ori.b        #$0, (a2)                           ; bit/integer operation; flags depend on variant
000006c4 | 00670006                 | ori.w        #$6, -(a7)                          ; bit/integer operation; flags depend on variant
000006c8 | 526efefe                 | addq.w       #$1, -$102(a6)                      ; arithmetic operation; flags depend on variant
000006cc | 422efefc                 | clr.b        -$104(a6)                           ; bit/integer operation; flags depend on variant
000006d0 | 6006                     | bra.b        $6d8                                ; branch according to condition flags (bra unconditional, bsr call)
000006d2 | 1d7c0001fefc             | move.b       #$1, -$104(a6)                      ; copy source to destination (Motorola operand order); flags depend on variant
000006d8 | 486efee2                 | pea.l        -$11e(a6)                           ; machine operation; verify instruction and data boundaries
000006dc | 2f2efede                 | move.l       -$122(a6), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
000006e0 | 2f2efeda                 | move.l       -$126(a6), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
000006e4 | 3f2efed8                 | move.w       -$128(a6), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
000006e8 | 486efefc                 | pea.l        -$104(a6)                           ; machine operation; verify instruction and data boundaries
000006ec | 4eb900004a54             | jsr          $4a54.l                             ; call subroutine; push return address
000006f2 | 422efee2                 | clr.b        -$11e(a6)                           ; bit/integer operation; flags depend on variant
000006f6 | 486eff01                 | pea.l        -$ff(a6)                            ; machine operation; verify instruction and data boundaries
000006fa | 486efee2                 | pea.l        -$11e(a6)                           ; machine operation; verify instruction and data boundaries
000006fe | 486efefc                 | pea.l        -$104(a6)                           ; machine operation; verify instruction and data boundaries
00000702 | 4eb900004a80             | jsr          $4a80.l                             ; call subroutine; push return address
00000708 | 41eeff01                 | lea.l        -$ff(a6), a0                        ; machine operation; verify instruction and data boundaries
0000070c | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000070e | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000710 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00000712 | 66fa                     | bne.b        $70e                                ; branch according to condition flags (bra unconditional, bsr call)
00000714 | 1d40ff00                 | move.b       d0, -$100(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000718 | 0c040067                 | cmpi.b       #$67, d4                            ; compare operands; set condition flags
0000071c | 4fef001e                 | lea.l        $1e(a7), a7                         ; machine operation; verify instruction and data boundaries
00000720 | 6708                     | beq.b        $72a                                ; branch according to condition flags (bra unconditional, bsr call)
00000722 | 0c040047                 | cmpi.b       #$47, d4                            ; compare operands; set condition flags
00000726 | 660000b4                 | bne.w        $7dc                                ; branch according to condition flags (bra unconditional, bsr call)
0000072a | 7a00                     | moveq        #$0, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
0000072c | 7e01                     | moveq        #$1, d7                             ; copy source to destination (Motorola operand order); flags depend on variant
0000072e | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000730 | 102eff00                 | move.b       -$100(a6), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000734 | 49eeff00                 | lea.l        -$100(a6), a4                       ; machine operation; verify instruction and data boundaries
00000738 | d8c0                     | adda.w       d0, a4                              ; arithmetic operation; flags depend on variant
0000073a | 6024                     | bra.b        $760                                ; branch according to condition flags (bra unconditional, bsr call)
0000073c | 1014                     | move.b       (a4), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000073e | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00000740 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000742 | 72d0                     | moveq        #$d0, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000744 | d081                     | add.l        d1, d0                              ; arithmetic operation; flags depend on variant
00000746 | 2207                     | move.l       d7, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000748 | 4eb9000004d2             | jsr          $4d2.l                              ; call subroutine; push return address
0000074e | d085                     | add.l        d5, d0                              ; arithmetic operation; flags depend on variant
00000750 | da80                     | add.l        d0, d5                              ; arithmetic operation; flags depend on variant
00000752 | 538c                     | subq.l       #$1, a4                             ; arithmetic operation; flags depend on variant
00000754 | 2007                     | move.l       d7, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000756 | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000758 | 4eb9000004d2             | jsr          $4d2.l                              ; call subroutine; push return address
0000075e | 2e00                     | move.l       d0, d7                              ; copy source to destination (Motorola operand order); flags depend on variant
00000760 | 0c140065                 | cmpi.b       #$65, (a4)                          ; compare operands; set condition flags
00000764 | 670c                     | beq.b        $772                                ; branch according to condition flags (bra unconditional, bsr call)
00000766 | 0c14002b                 | cmpi.b       #$2b, (a4)                          ; compare operands; set condition flags
0000076a | 6706                     | beq.b        $772                                ; branch according to condition flags (bra unconditional, bsr call)
0000076c | 0c14002d                 | cmpi.b       #$2d, (a4)                          ; compare operands; set condition flags
00000770 | 66ca                     | bne.b        $73c                                ; branch according to condition flags (bra unconditional, bsr call)
00000772 | 0c14002d                 | cmpi.b       #$2d, (a4)                          ; compare operands; set condition flags
00000776 | 6602                     | bne.b        $77a                                ; branch according to condition flags (bra unconditional, bsr call)
00000778 | 4485                     | neg.l        d5                                  ; machine operation; verify instruction and data boundaries
0000077a | 70fc                     | moveq        #$fc, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000077c | ba80                     | cmp.l        d0, d5                              ; compare operands; set condition flags
0000077e | 6d5c                     | blt.b        $7dc                                ; branch according to condition flags (bra unconditional, bsr call)
00000780 | baaa002e                 | cmp.l        $2e(a2), d5                         ; compare operands; set condition flags
00000784 | 6c56                     | bge.b        $7dc                                ; branch according to condition flags (bra unconditional, bsr call)
00000786 | 1d7c0001fefc             | move.b       #$1, -$104(a6)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000078c | 202a002e                 | move.l       $2e(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000790 | 9085                     | sub.l        d5, d0                              ; arithmetic operation; flags depend on variant
00000792 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000794 | 3d40fefe                 | move.w       d0, -$102(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000798 | 486efee2                 | pea.l        -$11e(a6)                           ; machine operation; verify instruction and data boundaries
0000079c | 2f2efede                 | move.l       -$122(a6), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
000007a0 | 2f2efeda                 | move.l       -$126(a6), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
000007a4 | 3f2efed8                 | move.w       -$128(a6), -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
000007a8 | 486efefc                 | pea.l        -$104(a6)                           ; machine operation; verify instruction and data boundaries
000007ac | 4eb900004a54             | jsr          $4a54.l                             ; call subroutine; push return address
000007b2 | 422efee2                 | clr.b        -$11e(a6)                           ; bit/integer operation; flags depend on variant
000007b6 | 486eff01                 | pea.l        -$ff(a6)                            ; machine operation; verify instruction and data boundaries
000007ba | 486efee2                 | pea.l        -$11e(a6)                           ; machine operation; verify instruction and data boundaries
000007be | 486efefc                 | pea.l        -$104(a6)                           ; machine operation; verify instruction and data boundaries
000007c2 | 4eb900004a80             | jsr          $4a80.l                             ; call subroutine; push return address
000007c8 | 41eeff01                 | lea.l        -$ff(a6), a0                        ; machine operation; verify instruction and data boundaries
000007cc | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000007ce | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000007d0 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
000007d2 | 66fa                     | bne.b        $7ce                                ; branch according to condition flags (bra unconditional, bsr call)
000007d4 | 1d40ff00                 | move.b       d0, -$100(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
000007d8 | 4fef001e                 | lea.l        $1e(a7), a7                         ; machine operation; verify instruction and data boundaries
000007dc | 0c2e0020ff01             | cmpi.b       #$20, -$ff(a6)                      ; compare operands; set condition flags
000007e2 | 57c0                     | seq.b        d0                                  ; machine operation; verify instruction and data boundaries
000007e4 | 4400                     | neg.b        d0                                  ; machine operation; verify instruction and data boundaries
000007e6 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
000007e8 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000007ea | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000007ec | 2a00                     | move.l       d0, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
000007ee | 6000009c                 | bra.w        $88c                                ; branch according to condition flags (bra unconditional, bsr call)
000007f2 | 41eeff00                 | lea.l        -$100(a6), a0                       ; machine operation; verify instruction and data boundaries
000007f6 | 0c3000655800             | cmpi.b       #$65, (a0, d5.l)                    ; compare operands; set condition flags
000007fc | 6714                     | beq.b        $812                                ; branch according to condition flags (bra unconditional, bsr call)
000007fe | 0c30002e5800             | cmpi.b       #$2e, (a0, d5.l)                    ; compare operands; set condition flags
00000804 | 6602                     | bne.b        $808                                ; branch according to condition flags (bra unconditional, bsr call)
00000806 | 7c01                     | moveq        #$1, d6                             ; copy source to destination (Motorola operand order); flags depend on variant
00000808 | 41eeff00                 | lea.l        -$100(a6), a0                       ; machine operation; verify instruction and data boundaries
0000080c | 16f05800                 | move.b       (a0, d5.l), (a3)+                   ; copy source to destination (Motorola operand order); flags depend on variant
00000810 | 6076                     | bra.b        $888                                ; branch according to condition flags (bra unconditional, bsr call)
00000812 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000816 | 7208                     | moveq        #$8, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000818 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
0000081a | 6626                     | bne.b        $842                                ; branch according to condition flags (bra unconditional, bsr call)
0000081c | 0c040047                 | cmpi.b       #$47, d4                            ; compare operands; set condition flags
00000820 | 670c                     | beq.b        $82e                                ; branch according to condition flags (bra unconditional, bsr call)
00000822 | 0c040067                 | cmpi.b       #$67, d4                            ; compare operands; set condition flags
00000826 | 661a                     | bne.b        $842                                ; branch according to condition flags (bra unconditional, bsr call)
00000828 | 6004                     | bra.b        $82e                                ; branch according to condition flags (bra unconditional, bsr call)
0000082a | 538b                     | subq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
0000082c | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
0000082e | 0c2b0030ffff             | cmpi.b       #$30, -$1(a3)                       ; compare operands; set condition flags
00000834 | 67f4                     | beq.b        $82a                                ; branch according to condition flags (bra unconditional, bsr call)
00000836 | 0c2b002effff             | cmpi.b       #$2e, -$1(a3)                       ; compare operands; set condition flags
0000083c | 6604                     | bne.b        $842                                ; branch according to condition flags (bra unconditional, bsr call)
0000083e | 538b                     | subq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
00000840 | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000842 | 4aaa002e                 | tst.l        $2e(a2)                             ; machine operation; verify instruction and data boundaries
00000846 | 6610                     | bne.b        $858                                ; branch according to condition flags (bra unconditional, bsr call)
00000848 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000084c | 7208                     | moveq        #$8, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
0000084e | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000850 | 6706                     | beq.b        $858                                ; branch according to condition flags (bra unconditional, bsr call)
00000852 | 16fc002e                 | move.b       #$2e, (a3)+                         ; copy source to destination (Motorola operand order); flags depend on variant
00000856 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000858 | 0c040047                 | cmpi.b       #$47, d4                            ; compare operands; set condition flags
0000085c | 670a                     | beq.b        $868                                ; branch according to condition flags (bra unconditional, bsr call)
0000085e | 0c040045                 | cmpi.b       #$45, d4                            ; compare operands; set condition flags
00000862 | 6704                     | beq.b        $868                                ; branch according to condition flags (bra unconditional, bsr call)
00000864 | 7065                     | moveq        #$65, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000866 | 6002                     | bra.b        $86a                                ; branch according to condition flags (bra unconditional, bsr call)
00000868 | 7045                     | moveq        #$45, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000086a | 16c0                     | move.b       d0, (a3)+                           ; copy source to destination (Motorola operand order); flags depend on variant
0000086c | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000086e | 102eff00                 | move.b       -$100(a6), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000872 | 9085                     | sub.l        d5, d0                              ; arithmetic operation; flags depend on variant
00000874 | 5580                     | subq.l       #$2, d0                             ; arithmetic operation; flags depend on variant
00000876 | 6610                     | bne.b        $888                                ; branch according to condition flags (bra unconditional, bsr call)
00000878 | 5285                     | addq.l       #$1, d5                             ; arithmetic operation; flags depend on variant
0000087a | 41eeff00                 | lea.l        -$100(a6), a0                       ; machine operation; verify instruction and data boundaries
0000087e | 16f05800                 | move.b       (a0, d5.l), (a3)+                   ; copy source to destination (Motorola operand order); flags depend on variant
00000882 | 16fc0030                 | move.b       #$30, (a3)+                         ; copy source to destination (Motorola operand order); flags depend on variant
00000886 | 5483                     | addq.l       #$2, d3                             ; arithmetic operation; flags depend on variant
00000888 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
0000088a | 5285                     | addq.l       #$1, d5                             ; arithmetic operation; flags depend on variant
0000088c | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000088e | 102eff00                 | move.b       -$100(a6), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000892 | ba80                     | cmp.l        d0, d5                              ; compare operands; set condition flags
00000894 | 6f00ff5c                 | ble.w        $7f2                                ; branch according to condition flags (bra unconditional, bsr call)
00000898 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000089c | 7208                     | moveq        #$8, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
0000089e | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
000008a0 | 6648                     | bne.b        $8ea                                ; branch according to condition flags (bra unconditional, bsr call)
000008a2 | 0c040047                 | cmpi.b       #$47, d4                            ; compare operands; set condition flags
000008a6 | 6706                     | beq.b        $8ae                                ; branch according to condition flags (bra unconditional, bsr call)
000008a8 | 0c040067                 | cmpi.b       #$67, d4                            ; compare operands; set condition flags
000008ac | 663c                     | bne.b        $8ea                                ; branch according to condition flags (bra unconditional, bsr call)
000008ae | 0c2e0001fefc             | cmpi.b       #$1, -$104(a6)                      ; compare operands; set condition flags
000008b4 | 6634                     | bne.b        $8ea                                ; branch according to condition flags (bra unconditional, bsr call)
000008b6 | 4a86                     | tst.l        d6                                  ; machine operation; verify instruction and data boundaries
000008b8 | 6730                     | beq.b        $8ea                                ; branch according to condition flags (bra unconditional, bsr call)
000008ba | 0c2b002effff             | cmpi.b       #$2e, -$1(a3)                       ; compare operands; set condition flags
000008c0 | 6606                     | bne.b        $8c8                                ; branch according to condition flags (bra unconditional, bsr call)
000008c2 | 538b                     | subq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
000008c4 | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
000008c6 | 6022                     | bra.b        $8ea                                ; branch according to condition flags (bra unconditional, bsr call)
000008c8 | 0c2b0030ffff             | cmpi.b       #$30, -$1(a3)                       ; compare operands; set condition flags
000008ce | 661a                     | bne.b        $8ea                                ; branch according to condition flags (bra unconditional, bsr call)
000008d0 | 6004                     | bra.b        $8d6                                ; branch according to condition flags (bra unconditional, bsr call)
000008d2 | 538b                     | subq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
000008d4 | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
000008d6 | 0c2b0030ffff             | cmpi.b       #$30, -$1(a3)                       ; compare operands; set condition flags
000008dc | 67f4                     | beq.b        $8d2                                ; branch according to condition flags (bra unconditional, bsr call)
000008de | 0c2b002effff             | cmpi.b       #$2e, -$1(a3)                       ; compare operands; set condition flags
000008e4 | 6604                     | bne.b        $8ea                                ; branch according to condition flags (bra unconditional, bsr call)
000008e6 | 538b                     | subq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
000008e8 | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
000008ea | 4aaa002e                 | tst.l        $2e(a2)                             ; machine operation; verify instruction and data boundaries
000008ee | 6708                     | beq.b        $8f8                                ; branch according to condition flags (bra unconditional, bsr call)
000008f0 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000008f2 | b0aa002e                 | cmp.l        $2e(a2), d0                         ; compare operands; set condition flags
000008f6 | 661c                     | bne.b        $914                                ; branch according to condition flags (bra unconditional, bsr call)
000008f8 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000008fc | 7208                     | moveq        #$8, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
000008fe | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000900 | 6712                     | beq.b        $914                                ; branch according to condition flags (bra unconditional, bsr call)
00000902 | 0c2e0001fefc             | cmpi.b       #$1, -$104(a6)                      ; compare operands; set condition flags
00000908 | 660a                     | bne.b        $914                                ; branch according to condition flags (bra unconditional, bsr call)
0000090a | 4a86                     | tst.l        d6                                  ; machine operation; verify instruction and data boundaries
0000090c | 6606                     | bne.b        $914                                ; branch according to condition flags (bra unconditional, bsr call)
0000090e | 16fc002e                 | move.b       #$2e, (a3)+                         ; copy source to destination (Motorola operand order); flags depend on variant
00000912 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000914 | 2543001e                 | move.l       d3, $1e(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000918 | 206a0012                 | movea.l      $12(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000091c | 42303800                 | clr.b        (a0, d3.l)                          ; bit/integer operation; flags depend on variant
00000920 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000924 | 7214                     | moveq        #$14, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000926 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000928 | 7210                     | moveq        #$10, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000092a | b081                     | cmp.l        d1, d0                              ; compare operands; set condition flags
0000092c | 6618                     | bne.b        $946                                ; branch according to condition flags (bra unconditional, bsr call)
0000092e | 202a0036                 | move.l       $36(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000932 | 9083                     | sub.l        d3, d0                              ; arithmetic operation; flags depend on variant
00000934 | 90aa0016                 | sub.l        $16(a2), d0                         ; arithmetic operation; flags depend on variant
00000938 | 2540001a                 | move.l       d0, $1a(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000093c | 4aaa001a                 | tst.l        $1a(a2)                             ; machine operation; verify instruction and data boundaries
00000940 | 6c04                     | bge.b        $946                                ; branch according to condition flags (bra unconditional, bsr call)
00000942 | 42aa001a                 | clr.l        $1a(a2)                             ; bit/integer operation; flags depend on variant
00000946 | 4cdf1cf8                 | movem.l      (a7)+, d3-d7/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
0000094a | 4e5e                     | unlk         a6                                  ; restore stack frame
0000094c | 4e75                     | rts                                              ; return: pop return address from stack
0000094e | 4e56ffd8                 | link.w       a6, #$ffd8                          ; establish stack frame
00000952 | 48e71e30                 | movem.l      d3-d6/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000956 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
0000095a | 1c2e000c                 | move.b       $c(a6), d6                          ; copy source to destination (Motorola operand order); flags depend on variant
0000095e | 0c060058                 | cmpi.b       #$58, d6                            ; compare operands; set condition flags
00000962 | 6706                     | beq.b        $96a                                ; branch according to condition flags (bra unconditional, bsr call)
00000964 | 41edff72                 | lea.l        -$8e(a5), a0                        ; machine operation; verify instruction and data boundaries
00000968 | 6004                     | bra.b        $96e                                ; branch according to condition flags (bra unconditional, bsr call)
0000096a | 41edff84                 | lea.l        -$7c(a5), a0                        ; machine operation; verify instruction and data boundaries
0000096e | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000970 | 0c06006f                 | cmpi.b       #$6f, d6                            ; compare operands; set condition flags
00000974 | 6714                     | beq.b        $98a                                ; branch according to condition flags (bra unconditional, bsr call)
00000976 | 0c060078                 | cmpi.b       #$78, d6                            ; compare operands; set condition flags
0000097a | 6706                     | beq.b        $982                                ; branch according to condition flags (bra unconditional, bsr call)
0000097c | 0c060058                 | cmpi.b       #$58, d6                            ; compare operands; set condition flags
00000980 | 6604                     | bne.b        $986                                ; branch according to condition flags (bra unconditional, bsr call)
00000982 | 7010                     | moveq        #$10, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000984 | 6002                     | bra.b        $988                                ; branch according to condition flags (bra unconditional, bsr call)
00000986 | 700a                     | moveq        #$a, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000988 | 6002                     | bra.b        $98c                                ; branch according to condition flags (bra unconditional, bsr call)
0000098a | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000098c | 2800                     | move.l       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000098e | 7618                     | moveq        #$18, d3                            ; copy source to destination (Motorola operand order); flags depend on variant
00000990 | 2a12                     | move.l       (a2), d5                            ; copy source to destination (Motorola operand order); flags depend on variant
00000992 | 0c060064                 | cmpi.b       #$64, d6                            ; compare operands; set condition flags
00000996 | 6706                     | beq.b        $99e                                ; branch according to condition flags (bra unconditional, bsr call)
00000998 | 0c060069                 | cmpi.b       #$69, d6                            ; compare operands; set condition flags
0000099c | 6606                     | bne.b        $9a4                                ; branch according to condition flags (bra unconditional, bsr call)
0000099e | 4a92                     | tst.l        (a2)                                ; machine operation; verify instruction and data boundaries
000009a0 | 6c02                     | bge.b        $9a4                                ; branch according to condition flags (bra unconditional, bsr call)
000009a2 | 4485                     | neg.l        d5                                  ; machine operation; verify instruction and data boundaries
000009a4 | 4a85                     | tst.l        d5                                  ; machine operation; verify instruction and data boundaries
000009a6 | 660c                     | bne.b        $9b4                                ; branch according to condition flags (bra unconditional, bsr call)
000009a8 | 4aaa002e                 | tst.l        $2e(a2)                             ; machine operation; verify instruction and data boundaries
000009ac | 6606                     | bne.b        $9b4                                ; branch according to condition flags (bra unconditional, bsr call)
000009ae | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000009b0 | b880                     | cmp.l        d0, d4                              ; compare operands; set condition flags
000009b2 | 6616                     | bne.b        $9ca                                ; branch according to condition flags (bra unconditional, bsr call)
000009b4 | 2005                     | move.l       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000009b6 | 2204                     | move.l       d4, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
000009b8 | 4eb900000584             | jsr          $584.l                              ; call subroutine; push return address
000009be | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
000009c0 | 41eeffe8                 | lea.l        -$18(a6), a0                        ; machine operation; verify instruction and data boundaries
000009c4 | 11b308003800             | move.b       (a3, d0.l), (a0, d3.l)              ; copy source to destination (Motorola operand order); flags depend on variant
000009ca | 2005                     | move.l       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000009cc | 2204                     | move.l       d4, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
000009ce | 4eb900000504             | jsr          $504.l                              ; call subroutine; push return address
000009d4 | 2480                     | move.l       d0, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
000009d6 | 6032                     | bra.b        $a0a                                ; branch according to condition flags (bra unconditional, bsr call)
000009d8 | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000009da | 2f12                     | move.l       (a2), -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
000009dc | 486effd8                 | pea.l        -$28(a6)                            ; machine operation; verify instruction and data boundaries
000009e0 | 4eb9000014ea             | jsr          $14ea.l                             ; call subroutine; push return address
000009e6 | 2d6effd8ffe0             | move.l       -$28(a6), -$20(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000009ec | 2d6effdcffe4             | move.l       -$24(a6), -$1c(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000009f2 | 24aeffe0                 | move.l       -$20(a6), (a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
000009f6 | 202effe4                 | move.l       -$1c(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
000009fa | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
000009fc | 41eeffe8                 | lea.l        -$18(a6), a0                        ; machine operation; verify instruction and data boundaries
00000a00 | 11b308003800             | move.b       (a3, d0.l), (a0, d3.l)              ; copy source to destination (Motorola operand order); flags depend on variant
00000a06 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000a0a | 4a92                     | tst.l        (a2)                                ; machine operation; verify instruction and data boundaries
00000a0c | 6f04                     | ble.b        $a12                                ; branch according to condition flags (bra unconditional, bsr call)
00000a0e | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00000a10 | 6ec6                     | bgt.b        $9d8                                ; branch according to condition flags (bra unconditional, bsr call)
00000a12 | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000a14 | b880                     | cmp.l        d0, d4                              ; compare operands; set condition flags
00000a16 | 661e                     | bne.b        $a36                                ; branch according to condition flags (bra unconditional, bsr call)
00000a18 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000a1c | 7208                     | moveq        #$8, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000a1e | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000a20 | 6714                     | beq.b        $a36                                ; branch according to condition flags (bra unconditional, bsr call)
00000a22 | 41eeffe8                 | lea.l        -$18(a6), a0                        ; machine operation; verify instruction and data boundaries
00000a26 | 0c3000303800             | cmpi.b       #$30, (a0, d3.l)                    ; compare operands; set condition flags
00000a2c | 6708                     | beq.b        $a36                                ; branch according to condition flags (bra unconditional, bsr call)
00000a2e | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000a30 | 11bc00303800             | move.b       #$30, (a0, d3.l)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000a36 | 7018                     | moveq        #$18, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000a38 | 9083                     | sub.l        d3, d0                              ; arithmetic operation; flags depend on variant
00000a3a | 2540001e                 | move.l       d0, $1e(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000a3e | 206a0012                 | movea.l      $12(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000a42 | 43eeffe8                 | lea.l        -$18(a6), a1                        ; machine operation; verify instruction and data boundaries
00000a46 | 43f13800                 | lea.l        (a1, d3.l), a1                      ; machine operation; verify instruction and data boundaries
00000a4a | 222a001e                 | move.l       $1e(a2), d1                         ; copy source to destination (Motorola operand order); flags depend on variant
00000a4e | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000a50 | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
00000a52 | 6706                     | beq.b        $a5a                                ; branch according to condition flags (bra unconditional, bsr call)
00000a54 | 10d9                     | move.b       (a1)+, (a0)+                        ; copy source to destination (Motorola operand order); flags depend on variant
00000a56 | 5381                     | subq.l       #$1, d1                             ; arithmetic operation; flags depend on variant
00000a58 | 66fa                     | bne.b        $a54                                ; branch according to condition flags (bra unconditional, bsr call)
00000a5a | 202a001e                 | move.l       $1e(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000a5e | b0aa002e                 | cmp.l        $2e(a2), d0                         ; compare operands; set condition flags
00000a62 | 6c14                     | bge.b        $a78                                ; branch according to condition flags (bra unconditional, bsr call)
00000a64 | 202a002e                 | move.l       $2e(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000a68 | 90aa001e                 | sub.l        $1e(a2), d0                         ; arithmetic operation; flags depend on variant
00000a6c | 2540001a                 | move.l       d0, $1a(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000a70 | 026affef003a             | andi.w       #$ffef, $3a(a2)                     ; bit/integer operation; flags depend on variant
00000a76 | 602e                     | bra.b        $aa6                                ; branch according to condition flags (bra unconditional, bsr call)
00000a78 | 4aaa002e                 | tst.l        $2e(a2)                             ; machine operation; verify instruction and data boundaries
00000a7c | 6c28                     | bge.b        $aa6                                ; branch according to condition flags (bra unconditional, bsr call)
00000a7e | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000a82 | 7214                     | moveq        #$14, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000a84 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000a86 | 7210                     | moveq        #$10, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000a88 | b081                     | cmp.l        d1, d0                              ; compare operands; set condition flags
00000a8a | 661a                     | bne.b        $aa6                                ; branch according to condition flags (bra unconditional, bsr call)
00000a8c | 202a0036                 | move.l       $36(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000a90 | 90aa0016                 | sub.l        $16(a2), d0                         ; arithmetic operation; flags depend on variant
00000a94 | 90aa001a                 | sub.l        $1a(a2), d0                         ; arithmetic operation; flags depend on variant
00000a98 | 90aa001e                 | sub.l        $1e(a2), d0                         ; arithmetic operation; flags depend on variant
00000a9c | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000a9e | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000aa0 | 6f04                     | ble.b        $aa6                                ; branch according to condition flags (bra unconditional, bsr call)
00000aa2 | 2543001a                 | move.l       d3, $1a(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000aa6 | 4cdf0c78                 | movem.l      (a7)+, d3-d6/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
00000aaa | 4e5e                     | unlk         a6                                  ; restore stack frame
00000aac | 4e75                     | rts                                              ; return: pop return address from stack
00000aae | 4e56ff82                 | link.w       a6, #$ff82                          ; establish stack frame
00000ab2 | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000ab6 | 246e0010                 | movea.l      $10(a6), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
00000aba | 3d6df920ffbe             | move.w       -$6e0(a5), -$42(a6)                 ; copy source to destination (Motorola operand order); flags depend on variant
00000ac0 | 2d6e0008ffcc             | move.l       $8(a6), -$34(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000ac6 | 2d6e000cffd0             | move.l       $c(a6), -$30(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000acc | 42aefff4                 | clr.l        -$c(a6)                             ; bit/integer operation; flags depend on variant
00000ad0 | 422effc1                 | clr.b        -$3f(a6)                            ; bit/integer operation; flags depend on variant
00000ad4 | 486effbe                 | pea.l        -$42(a6)                            ; machine operation; verify instruction and data boundaries
00000ad8 | 2f3c7fffffff             | move.l       #$7fffffff, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000ade | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000ae0 | 486effc1                 | pea.l        -$3f(a6)                            ; machine operation; verify instruction and data boundaries
00000ae4 | 4eb90000166e             | jsr          $166e.l                             ; call subroutine; push return address
00000aea | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000aec | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000aee | 4fef0010                 | lea.l        $10(a7), a7                         ; machine operation; verify instruction and data boundaries
00000af2 | 6e0c                     | bgt.b        $b00                                ; branch according to condition flags (bra unconditional, bsr call)
00000af4 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000af6 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000af8 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000afa | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00000afc | 66fa                     | bne.b        $af8                                ; branch according to condition flags (bra unconditional, bsr call)
00000afe | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b00 | 0c2e0025ffc1             | cmpi.b       #$25, -$3f(a6)                      ; compare operands; set condition flags
00000b06 | 6704                     | beq.b        $b0c                                ; branch according to condition flags (bra unconditional, bsr call)
00000b08 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b0a | 6004                     | bra.b        $b10                                ; branch according to condition flags (bra unconditional, bsr call)
00000b0c | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b0e | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000b10 | 2800                     | move.l       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b12 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000b14 | 6f24                     | ble.b        $b3a                                ; branch according to condition flags (bra unconditional, bsr call)
00000b16 | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000b18 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000b1a | 2f2effd0                 | move.l       -$30(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000b1e | 206effcc                 | movea.l      -$34(a6), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000b22 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00000b24 | 2d48ffd0                 | move.l       a0, -$30(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000b28 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b2a | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000b2e | 6606                     | bne.b        $b36                                ; branch according to condition flags (bra unconditional, bsr call)
00000b30 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000b32 | 600001a2                 | bra.w        $cd6                                ; branch according to condition flags (bra unconditional, bsr call)
00000b36 | d9aefff4                 | add.l        d4, -$c(a6)                         ; arithmetic operation; flags depend on variant
00000b3a | d5c3                     | adda.l       d3, a2                              ; arithmetic operation; flags depend on variant
00000b3c | 0c2e0025ffc1             | cmpi.b       #$25, -$3f(a6)                      ; compare operands; set condition flags
00000b42 | 670e                     | beq.b        $b52                                ; branch according to condition flags (bra unconditional, bsr call)
00000b44 | 4a2effc1                 | tst.b        -$3f(a6)                            ; machine operation; verify instruction and data boundaries
00000b48 | 6686                     | bne.b        $ad0                                ; branch according to condition flags (bra unconditional, bsr call)
00000b4a | 202efff4                 | move.l       -$c(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000b4e | 60000186                 | bra.w        $cd6                                ; branch according to condition flags (bra unconditional, bsr call)
00000b52 | 42aeffec                 | clr.l        -$14(a6)                            ; bit/integer operation; flags depend on variant
00000b56 | 42aeffe8                 | clr.l        -$18(a6)                            ; bit/integer operation; flags depend on variant
00000b5a | 42aeffe4                 | clr.l        -$1c(a6)                            ; bit/integer operation; flags depend on variant
00000b5e | 42aeffe0                 | clr.l        -$20(a6)                            ; bit/integer operation; flags depend on variant
00000b62 | 42aeffdc                 | clr.l        -$24(a6)                            ; bit/integer operation; flags depend on variant
00000b66 | 42aeffd8                 | clr.l        -$28(a6)                            ; bit/integer operation; flags depend on variant
00000b6a | 426efffc                 | clr.w        -$4(a6)                             ; bit/integer operation; flags depend on variant
00000b6e | 601a                     | bra.b        $b8a                                ; branch according to condition flags (bra unconditional, bsr call)
00000b70 | 41edff96                 | lea.l        -$6a(a5), a0                        ; machine operation; verify instruction and data boundaries
00000b74 | 224b                     | movea.l      a3, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b76 | 93c8                     | suba.l       a0, a1                              ; arithmetic operation; flags depend on variant
00000b78 | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b7a | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
00000b7c | 41edff9c                 | lea.l        -$64(a5), a0                        ; machine operation; verify instruction and data boundaries
00000b80 | 20300800                 | move.l       (a0, d0.l), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000b84 | 816efffc                 | or.w         d0, -$4(a6)                         ; bit/integer operation; flags depend on variant
00000b88 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00000b8a | 1012                     | move.b       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000b8c | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00000b8e | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000b90 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000b92 | 486dff96                 | pea.l        -$6a(a5)                            ; machine operation; verify instruction and data boundaries
00000b96 | 4eb9000018d8             | jsr          $18d8.l                             ; call subroutine; push return address
00000b9c | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b9e | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000ba0 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00000ba2 | 66cc                     | bne.b        $b70                                ; branch according to condition flags (bra unconditional, bsr call)
00000ba4 | 0c12002a                 | cmpi.b       #$2a, (a2)                          ; compare operands; set condition flags
00000ba8 | 6628                     | bne.b        $bd2                                ; branch according to condition flags (bra unconditional, bsr call)
00000baa | 58ae0014                 | addq.l       #$4, $14(a6)                        ; arithmetic operation; flags depend on variant
00000bae | 206e0014                 | movea.l      $14(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000bb2 | 2d68fffcfff8             | move.l       -$4(a0), -$8(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000bb8 | 4aaefff8                 | tst.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00000bbc | 6c10                     | bge.b        $bce                                ; branch according to condition flags (bra unconditional, bsr call)
00000bbe | 202efff8                 | move.l       -$8(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000bc2 | 4480                     | neg.l        d0                                  ; machine operation; verify instruction and data boundaries
00000bc4 | 2d40fff8                 | move.l       d0, -$8(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000bc8 | 006e0004fffc             | ori.w        #$4, -$4(a6)                        ; bit/integer operation; flags depend on variant
00000bce | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00000bd0 | 6040                     | bra.b        $c12                                ; branch according to condition flags (bra unconditional, bsr call)
00000bd2 | 42aefff8                 | clr.l        -$8(a6)                             ; bit/integer operation; flags depend on variant
00000bd6 | 6028                     | bra.b        $c00                                ; branch according to condition flags (bra unconditional, bsr call)
00000bd8 | 0cae7ffffffffff8         | cmpi.l       #$7fffffff, -$8(a6)                 ; compare operands; set condition flags
00000be0 | 6c1c                     | bge.b        $bfe                                ; branch according to condition flags (bra unconditional, bsr call)
00000be2 | 202efff8                 | move.l       -$8(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000be6 | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000be8 | 4eb9000004d2             | jsr          $4d2.l                              ; call subroutine; push return address
00000bee | 1212                     | move.b       (a2), d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000bf0 | 4881                     | ext.w        d1                                  ; bit/integer operation; flags depend on variant
00000bf2 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000bf4 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000bf6 | 70d0                     | moveq        #$d0, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000bf8 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000bfa | 2d41fff8                 | move.l       d1, -$8(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000bfe | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00000c00 | 1012                     | move.b       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000c02 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00000c04 | 206dfac0                 | movea.l      -$540(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000c08 | 10300000                 | move.b       (a0, d0.w), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000c0c | 7220                     | moveq        #$20, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000c0e | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000c10 | 66c6                     | bne.b        $bd8                                ; branch according to condition flags (bra unconditional, bsr call)
00000c12 | 0c12002e                 | cmpi.b       #$2e, (a2)                          ; compare operands; set condition flags
00000c16 | 6708                     | beq.b        $c20                                ; branch according to condition flags (bra unconditional, bsr call)
00000c18 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000c1a | 2d40fff0                 | move.l       d0, -$10(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c1e | 605a                     | bra.b        $c7a                                ; branch according to condition flags (bra unconditional, bsr call)
00000c20 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00000c22 | 0c12002a                 | cmpi.b       #$2a, (a2)                          ; compare operands; set condition flags
00000c26 | 6612                     | bne.b        $c3a                                ; branch according to condition flags (bra unconditional, bsr call)
00000c28 | 58ae0014                 | addq.l       #$4, $14(a6)                        ; arithmetic operation; flags depend on variant
00000c2c | 206e0014                 | movea.l      $14(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000c30 | 2d68fffcfff0             | move.l       -$4(a0), -$10(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000c36 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00000c38 | 6040                     | bra.b        $c7a                                ; branch according to condition flags (bra unconditional, bsr call)
00000c3a | 42aefff0                 | clr.l        -$10(a6)                            ; bit/integer operation; flags depend on variant
00000c3e | 6028                     | bra.b        $c68                                ; branch according to condition flags (bra unconditional, bsr call)
00000c40 | 0cae7ffffffffff0         | cmpi.l       #$7fffffff, -$10(a6)                ; compare operands; set condition flags
00000c48 | 6c1c                     | bge.b        $c66                                ; branch according to condition flags (bra unconditional, bsr call)
00000c4a | 202efff0                 | move.l       -$10(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c4e | 720a                     | moveq        #$a, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000c50 | 4eb9000004d2             | jsr          $4d2.l                              ; call subroutine; push return address
00000c56 | 1212                     | move.b       (a2), d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000c58 | 4881                     | ext.w        d1                                  ; bit/integer operation; flags depend on variant
00000c5a | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00000c5c | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000c5e | 70d0                     | moveq        #$d0, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000c60 | d280                     | add.l        d0, d1                              ; arithmetic operation; flags depend on variant
00000c62 | 2d41fff0                 | move.l       d1, -$10(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c66 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00000c68 | 1012                     | move.b       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000c6a | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00000c6c | 206dfac0                 | movea.l      -$540(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000c70 | 10300000                 | move.b       (a0, d0.w), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000c74 | 7220                     | moveq        #$20, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000c76 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000c78 | 66c6                     | bne.b        $c40                                ; branch according to condition flags (bra unconditional, bsr call)
00000c7a | 1012                     | move.b       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000c7c | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00000c7e | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000c80 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000c82 | 486dffb4                 | pea.l        -$4c(a5)                            ; machine operation; verify instruction and data boundaries
00000c86 | 4eb9000018d8             | jsr          $18d8.l                             ; call subroutine; push return address
00000c8c | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c8e | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000c90 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00000c92 | 6604                     | bne.b        $c98                                ; branch according to condition flags (bra unconditional, bsr call)
00000c94 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000c96 | 6006                     | bra.b        $c9e                                ; branch according to condition flags (bra unconditional, bsr call)
00000c98 | 101a                     | move.b       (a2)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000c9a | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00000c9c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000c9e | 1d40fffe                 | move.b       d0, -$2(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000ca2 | 486eff82                 | pea.l        -$7e(a6)                            ; machine operation; verify instruction and data boundaries
00000ca6 | 1f1a                     | move.b       (a2)+, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000ca8 | 486e0014                 | pea.l        $14(a6)                             ; machine operation; verify instruction and data boundaries
00000cac | 486effc2                 | pea.l        -$3e(a6)                            ; machine operation; verify instruction and data boundaries
00000cb0 | 4eb900000cde             | jsr          $cde.l                              ; call subroutine; push return address
00000cb6 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000cb8 | 4fef000e                 | lea.l        $e(a7), a7                          ; machine operation; verify instruction and data boundaries
00000cbc | 6616                     | bne.b        $cd4                                ; branch according to condition flags (bra unconditional, bsr call)
00000cbe | 486eff82                 | pea.l        -$7e(a6)                            ; machine operation; verify instruction and data boundaries
00000cc2 | 486effc2                 | pea.l        -$3e(a6)                            ; machine operation; verify instruction and data boundaries
00000cc6 | 4eb9000011e0             | jsr          $11e0.l                             ; call subroutine; push return address
00000ccc | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000cce | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00000cd0 | 6c00fdfe                 | bge.w        $ad0                                ; branch according to condition flags (bra unconditional, bsr call)
00000cd4 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000cd6 | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
00000cda | 4e5e                     | unlk         a6                                  ; restore stack frame
00000cdc | 4e75                     | rts                                              ; return: pop return address from stack
00000cde | 4e56ffea                 | link.w       a6, #$ffea                          ; establish stack frame
00000ce2 | 48e71838                 | movem.l      d3-d4/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000ce6 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00000cea | 286e000c                 | movea.l      $c(a6), a4                          ; copy source to destination (Motorola operand order); flags depend on variant
00000cee | 162e0010                 | move.b       $10(a6), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00000cf2 | 266e0012                 | movea.l      $12(a6), a3                         ; copy source to destination (Motorola operand order); flags depend on variant
00000cf6 | 1003                     | move.b       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000cf8 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00000cfa | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000cfc | 4eb90000061c             | jsr          $61c.l                              ; call subroutine; push return address
00000d02 | 03ac0000                 | bclr.b       d1, $0(a4)                          ; branch according to condition flags (bra unconditional, bsr call)
00000d06 | 00250000                 | ori.b        #$0, -(a5)                          ; bit/integer operation; flags depend on variant
00000d0a | 0078000f0000             | ori.w        #$f, $0.w                           ; bit/integer operation; flags depend on variant
00000d10 | 0025038c                 | ori.b        #$8c, -(a5)                         ; bit/integer operation; flags depend on variant
00000d14 | 00000045                 | ori.b        #$45, d0                            ; bit/integer operation; flags depend on variant
00000d18 | 01b20000                 | bclr.b       d0, (a2, d0.w)                      ; branch according to condition flags (bra unconditional, bsr call)
00000d1c | 004701ac                 | ori.w        #$1ac, d7                           ; bit/integer operation; flags depend on variant
00000d20 | 00000058                 | ori.b        #$58, d0                            ; bit/integer operation; flags depend on variant
00000d24 | 0122                     | btst.l       d0, -(a2)                           ; branch according to condition flags (bra unconditional, bsr call)
00000d26 | 00000063                 | ori.b        #$63, d0                            ; bit/integer operation; flags depend on variant
00000d2a | 00440000                 | ori.w        #$0, d4                             ; bit/integer operation; flags depend on variant
00000d2e | 0064008c                 | ori.w        #$8c, -(a4)                         ; bit/integer operation; flags depend on variant
00000d32 | 00000065                 | ori.b        #$65, d0                            ; bit/integer operation; flags depend on variant
00000d36 | 0194                     | bclr.b       d0, (a4)                            ; branch according to condition flags (bra unconditional, bsr call)
00000d38 | 00000066                 | ori.b        #$66, d0                            ; bit/integer operation; flags depend on variant
00000d3c | 018e0000                 | movep.w      d0, $0(a6)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000d40 | 00670188                 | ori.w        #$188, -(a7)                        ; bit/integer operation; flags depend on variant
00000d44 | 00000069                 | ori.b        #$69, d0                            ; bit/integer operation; flags depend on variant
00000d48 | 00740000006e             | ori.w        #$0, $6e(a4, d0.w)                  ; bit/integer operation; flags depend on variant
00000d4e | 023a                     | .word ; undecoded bytes / possible Macintosh A-line trap
00000d50 | 0000006f                 | ori.b        #$6f, d0                            ; bit/integer operation; flags depend on variant
00000d54 | 00f2                     | dc.w         $f2                                 ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d56 | 00000070                 | ori.b        #$70, d0                            ; bit/integer operation; flags depend on variant
00000d5a | 026e00000073             | andi.w       #$0, $73(a6)                        ; bit/integer operation; flags depend on variant
00000d60 | 028c                     | .word ; undecoded bytes / possible Macintosh A-line trap
00000d62 | 00000075                 | ori.b        #$75, d0                            ; bit/integer operation; flags depend on variant
00000d66 | 00e0                     | .word ; undecoded bytes / possible Macintosh A-line trap
00000d68 | 00000078                 | ori.b        #$78, d0                            ; bit/integer operation; flags depend on variant
00000d6c | 00da                     | .word ; undecoded bytes / possible Macintosh A-line trap
00000d6e | 0c2a006c003c             | cmpi.b       #$6c, $3c(a2)                       ; compare operands; set condition flags
00000d74 | 6716                     | beq.b        $d8c                                ; branch according to condition flags (bra unconditional, bsr call)
00000d76 | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000d78 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000d7a | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000d7e | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
00000d82 | 17a8ffff0800             | move.b       -$1(a0), (a3, d0.l)                 ; copy source to destination (Motorola operand order); flags depend on variant
00000d88 | 6000033e                 | bra.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00000d8c | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000d8e | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000d90 | 2628fffc                 | move.l       -$4(a0), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00000d94 | 1d43fffe                 | move.b       d3, -$2(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000d98 | 422effff                 | clr.b        -$1(a6)                             ; bit/integer operation; flags depend on variant
00000d9c | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000d9e | 2540002e                 | move.l       d0, $2e(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000da2 | 486efffe                 | pea.l        -$2(a6)                             ; machine operation; verify instruction and data boundaries
00000da6 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000da8 | 4eb9000010d2             | jsr          $10d2.l                             ; call subroutine; push return address
00000dae | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000db0 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00000db2 | 6c000314                 | bge.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00000db6 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000db8 | 60000310                 | bra.w        $10ca                               ; branch according to condition flags (bra unconditional, bsr call)
00000dbc | 0c2a006c003c             | cmpi.b       #$6c, $3c(a2)                       ; compare operands; set condition flags
00000dc2 | 670a                     | beq.b        $dce                                ; branch according to condition flags (bra unconditional, bsr call)
00000dc4 | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000dc6 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000dc8 | 2028fffc                 | move.l       -$4(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000dcc | 6008                     | bra.b        $dd6                                ; branch according to condition flags (bra unconditional, bsr call)
00000dce | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000dd0 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000dd2 | 2028fffc                 | move.l       -$4(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000dd6 | 2480                     | move.l       d0, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000dd8 | 0c2a0068003c             | cmpi.b       #$68, $3c(a2)                       ; compare operands; set condition flags
00000dde | 6606                     | bne.b        $de6                                ; branch according to condition flags (bra unconditional, bsr call)
00000de0 | 306a0002                 | movea.w      $2(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000de4 | 2488                     | move.l       a0, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000de6 | 4a92                     | tst.l        (a2)                                ; machine operation; verify instruction and data boundaries
00000de8 | 6c10                     | bge.b        $dfa                                ; branch according to condition flags (bra unconditional, bsr call)
00000dea | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000dee | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
00000df2 | 17bc002d0800             | move.b       #$2d, (a3, d0.l)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000df8 | 6032                     | bra.b        $e2c                                ; branch according to condition flags (bra unconditional, bsr call)
00000dfa | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000dfe | 7202                     | moveq        #$2, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000e00 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000e02 | 6710                     | beq.b        $e14                                ; branch according to condition flags (bra unconditional, bsr call)
00000e04 | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e08 | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
00000e0c | 17bc002b0800             | move.b       #$2b, (a3, d0.l)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e12 | 6018                     | bra.b        $e2c                                ; branch according to condition flags (bra unconditional, bsr call)
00000e14 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e18 | 7201                     | moveq        #$1, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000e1a | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000e1c | 670e                     | beq.b        $e2c                                ; branch according to condition flags (bra unconditional, bsr call)
00000e1e | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e22 | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
00000e26 | 17bc00200800             | move.b       #$20, (a3, d0.l)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000e2c | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000e2e | d1ea0016                 | adda.l       $16(a2), a0                         ; arithmetic operation; flags depend on variant
00000e32 | 25480012                 | move.l       a0, $12(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e36 | 1f03                     | move.b       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000e38 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000e3a | 4eb90000094e             | jsr          $94e.l                              ; call subroutine; push return address
00000e40 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00000e42 | 60000284                 | bra.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00000e46 | 0c2a006c003c             | cmpi.b       #$6c, $3c(a2)                       ; compare operands; set condition flags
00000e4c | 670a                     | beq.b        $e58                                ; branch according to condition flags (bra unconditional, bsr call)
00000e4e | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000e50 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000e52 | 2028fffc                 | move.l       -$4(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e56 | 6008                     | bra.b        $e60                                ; branch according to condition flags (bra unconditional, bsr call)
00000e58 | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000e5a | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000e5c | 2028fffc                 | move.l       -$4(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e60 | 2480                     | move.l       d0, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000e62 | 0c2a0068003c             | cmpi.b       #$68, $3c(a2)                       ; compare operands; set condition flags
00000e68 | 660a                     | bne.b        $e74                                ; branch according to condition flags (bra unconditional, bsr call)
00000e6a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000e6c | 302a0002                 | move.w       $2(a2), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000e70 | 2480                     | move.l       d0, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000e72 | 6008                     | bra.b        $e7c                                ; branch according to condition flags (bra unconditional, bsr call)
00000e74 | 4a2a003c                 | tst.b        $3c(a2)                             ; machine operation; verify instruction and data boundaries
00000e78 | 6602                     | bne.b        $e7c                                ; branch according to condition flags (bra unconditional, bsr call)
00000e7a | 2492                     | move.l       (a2), (a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000e7c | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e80 | 7208                     | moveq        #$8, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000e82 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000e84 | 672a                     | beq.b        $eb0                                ; branch according to condition flags (bra unconditional, bsr call)
00000e86 | 4a92                     | tst.l        (a2)                                ; machine operation; verify instruction and data boundaries
00000e88 | 6726                     | beq.b        $eb0                                ; branch according to condition flags (bra unconditional, bsr call)
00000e8a | 0c030078                 | cmpi.b       #$78, d3                            ; compare operands; set condition flags
00000e8e | 6706                     | beq.b        $e96                                ; branch according to condition flags (bra unconditional, bsr call)
00000e90 | 0c030058                 | cmpi.b       #$58, d3                            ; compare operands; set condition flags
00000e94 | 661a                     | bne.b        $eb0                                ; branch according to condition flags (bra unconditional, bsr call)
00000e96 | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e9a | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
00000e9e | 17bc00300800             | move.b       #$30, (a3, d0.l)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000ea4 | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000ea8 | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
00000eac | 17830800                 | move.b       d3, (a3, d0.l)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000eb0 | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000eb2 | d1ea0016                 | adda.l       $16(a2), a0                         ; arithmetic operation; flags depend on variant
00000eb6 | 25480012                 | move.l       a0, $12(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000eba | 1f03                     | move.b       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000ebc | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000ebe | 4eb90000094e             | jsr          $94e.l                              ; call subroutine; push return address
00000ec4 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00000ec6 | 60000200                 | bra.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00000eca | 0c2a004c003c             | cmpi.b       #$4c, $3c(a2)                       ; compare operands; set condition flags
00000ed0 | 672c                     | beq.b        $efe                                ; branch according to condition flags (bra unconditional, bsr call)
00000ed2 | 700a                     | moveq        #$a, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000ed4 | d194                     | add.l        d0, (a4)                            ; arithmetic operation; flags depend on variant
00000ed6 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000ed8 | 2d68fff6fff4             | move.l       -$a(a0), -$c(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000ede | 2d68fffafff8             | move.l       -$6(a0), -$8(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000ee4 | 3d68fffefffc             | move.w       -$2(a0), -$4(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000eea | 2d6efff4ffea             | move.l       -$c(a6), -$16(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000ef0 | 2d6efff8ffee             | move.l       -$8(a6), -$12(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000ef6 | 3d6efffcfff2             | move.w       -$4(a6), -$e(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000efc | 6018                     | bra.b        $f16                                ; branch according to condition flags (bra unconditional, bsr call)
00000efe | 700a                     | moveq        #$a, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000f00 | d194                     | add.l        d0, (a4)                            ; arithmetic operation; flags depend on variant
00000f02 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000f04 | 2d68fff6ffea             | move.l       -$a(a0), -$16(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000f0a | 2d68fffaffee             | move.l       -$6(a0), -$12(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000f10 | 3d68fffefff2             | move.w       -$2(a0), -$e(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000f16 | 24aeffea                 | move.l       -$16(a6), (a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f1a | 256effee0004             | move.l       -$12(a6), $4(a2)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000f20 | 356efff20008             | move.w       -$e(a6), $8(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000f26 | 08120007                 | btst.b       #$7, (a2)                           ; branch according to condition flags (bra unconditional, bsr call)
00000f2a | 6710                     | beq.b        $f3c                                ; branch according to condition flags (bra unconditional, bsr call)
00000f2c | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f30 | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
00000f34 | 17bc002d0800             | move.b       #$2d, (a3, d0.l)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000f3a | 6032                     | bra.b        $f6e                                ; branch according to condition flags (bra unconditional, bsr call)
00000f3c | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f40 | 7202                     | moveq        #$2, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000f42 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000f44 | 6710                     | beq.b        $f56                                ; branch according to condition flags (bra unconditional, bsr call)
00000f46 | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f4a | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
00000f4e | 17bc002b0800             | move.b       #$2b, (a3, d0.l)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000f54 | 6018                     | bra.b        $f6e                                ; branch according to condition flags (bra unconditional, bsr call)
00000f56 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f5a | 7201                     | moveq        #$1, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000f5c | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000f5e | 670e                     | beq.b        $f6e                                ; branch according to condition flags (bra unconditional, bsr call)
00000f60 | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f64 | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
00000f68 | 17bc00200800             | move.b       #$20, (a3, d0.l)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000f6e | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f70 | d1ea0016                 | adda.l       $16(a2), a0                         ; arithmetic operation; flags depend on variant
00000f74 | 25480012                 | move.l       a0, $12(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f78 | 1f03                     | move.b       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f7a | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f7c | 4eb900000630             | jsr          $630.l                              ; call subroutine; push return address
00000f82 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00000f84 | 60000142                 | bra.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00000f88 | 0c2a0068003c             | cmpi.b       #$68, $3c(a2)                       ; compare operands; set condition flags
00000f8e | 6610                     | bne.b        $fa0                                ; branch according to condition flags (bra unconditional, bsr call)
00000f90 | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000f92 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000f94 | 2068fffc                 | movea.l      -$4(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f98 | 30aa0034                 | move.w       $34(a2), (a0)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000f9c | 6000012a                 | bra.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00000fa0 | 0c2a006c003c             | cmpi.b       #$6c, $3c(a2)                       ; compare operands; set condition flags
00000fa6 | 6710                     | beq.b        $fb8                                ; branch according to condition flags (bra unconditional, bsr call)
00000fa8 | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000faa | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000fac | 2068fffc                 | movea.l      -$4(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000fb0 | 20aa0032                 | move.l       $32(a2), (a0)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000fb4 | 60000112                 | bra.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00000fb8 | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000fba | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000fbc | 2068fffc                 | movea.l      -$4(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000fc0 | 20aa0032                 | move.l       $32(a2), (a0)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000fc4 | 60000102                 | bra.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00000fc8 | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000fca | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000fcc | 24a8fffc                 | move.l       -$4(a0), (a2)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000fd0 | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000fd2 | d1ea0016                 | adda.l       $16(a2), a0                         ; arithmetic operation; flags depend on variant
00000fd6 | 25480012                 | move.l       a0, $12(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000fda | 1f3c0078                 | move.b       #$78, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000fde | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fe0 | 4eb90000094e             | jsr          $94e.l                              ; call subroutine; push return address
00000fe6 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00000fe8 | 600000de                 | bra.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00000fec | 0c2a006c003c             | cmpi.b       #$6c, $3c(a2)                       ; compare operands; set condition flags
00000ff2 | 67000090                 | beq.w        $1084                               ; branch according to condition flags (bra unconditional, bsr call)
00000ff6 | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00000ff8 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000ffa | 2568fffc0012             | move.l       -$4(a0), $12(a2)                    ; copy source to destination (Motorola operand order); flags depend on variant
00001000 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001004 | 7208                     | moveq        #$8, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00001006 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00001008 | 6738                     | beq.b        $1042                               ; branch according to condition flags (bra unconditional, bsr call)
0000100a | 4aaa002e                 | tst.l        $2e(a2)                             ; machine operation; verify instruction and data boundaries
0000100e | 6d1e                     | blt.b        $102e                               ; branch according to condition flags (bra unconditional, bsr call)
00001010 | 206a0012                 | movea.l      $12(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001014 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001016 | 1010                     | move.b       (a0), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001018 | b0aa002e                 | cmp.l        $2e(a2), d0                         ; compare operands; set condition flags
0000101c | 6d06                     | blt.b        $1024                               ; branch according to condition flags (bra unconditional, bsr call)
0000101e | 202a002e                 | move.l       $2e(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001022 | 6008                     | bra.b        $102c                               ; branch according to condition flags (bra unconditional, bsr call)
00001024 | 206a0012                 | movea.l      $12(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001028 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000102a | 1010                     | move.b       (a0), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000102c | 6008                     | bra.b        $1036                               ; branch according to condition flags (bra unconditional, bsr call)
0000102e | 206a0012                 | movea.l      $12(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001032 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001034 | 1010                     | move.b       (a0), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001036 | 2540001e                 | move.l       d0, $1e(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000103a | 52aa0012                 | addq.l       #$1, $12(a2)                        ; arithmetic operation; flags depend on variant
0000103e | 60000088                 | bra.w        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00001042 | 4aaa002e                 | tst.l        $2e(a2)                             ; machine operation; verify instruction and data boundaries
00001046 | 6d2a                     | blt.b        $1072                               ; branch according to condition flags (bra unconditional, bsr call)
00001048 | 2f2a002e                 | move.l       $2e(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000104c | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000104e | 2f2a0012                 | move.l       $12(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001052 | 4eb900001894             | jsr          $1894.l                             ; call subroutine; push return address
00001058 | 2808                     | move.l       a0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000105a | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000105c | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00001060 | 6606                     | bne.b        $1068                               ; branch according to condition flags (bra unconditional, bsr call)
00001062 | 202a002e                 | move.l       $2e(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001066 | 6008                     | bra.b        $1070                               ; branch according to condition flags (bra unconditional, bsr call)
00001068 | 2044                     | movea.l      d4, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000106a | 91ea0012                 | suba.l       $12(a2), a0                         ; arithmetic operation; flags depend on variant
0000106e | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001070 | 600c                     | bra.b        $107e                               ; branch according to condition flags (bra unconditional, bsr call)
00001072 | 206a0012                 | movea.l      $12(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001076 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001078 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
0000107a | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
0000107c | 66fa                     | bne.b        $1078                               ; branch according to condition flags (bra unconditional, bsr call)
0000107e | 2540001e                 | move.l       d0, $1e(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
00001082 | 6044                     | bra.b        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
00001084 | 5894                     | addq.l       #$4, (a4)                           ; arithmetic operation; flags depend on variant
00001086 | 2054                     | movea.l      (a4), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001088 | 2f28fffc                 | move.l       -$4(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000108c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000108e | 4eb9000010d2             | jsr          $10d2.l                             ; call subroutine; push return address
00001094 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00001096 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00001098 | 6c2e                     | bge.b        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
0000109a | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000109c | 602c                     | bra.b        $10ca                               ; branch according to condition flags (bra unconditional, bsr call)
0000109e | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000010a2 | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
000010a6 | 17bc00250800             | move.b       #$25, (a3, d0.l)                    ; copy source to destination (Motorola operand order); flags depend on variant
000010ac | 601a                     | bra.b        $10c8                               ; branch according to condition flags (bra unconditional, bsr call)
000010ae | 4a03                     | tst.b        d3                                  ; machine operation; verify instruction and data boundaries
000010b0 | 6604                     | bne.b        $10b6                               ; branch according to condition flags (bra unconditional, bsr call)
000010b2 | 7025                     | moveq        #$25, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000010b4 | 6006                     | bra.b        $10bc                               ; branch according to condition flags (bra unconditional, bsr call)
000010b6 | 1003                     | move.b       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000010b8 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
000010ba | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000010bc | 222a0016                 | move.l       $16(a2), d1                         ; copy source to destination (Motorola operand order); flags depend on variant
000010c0 | 52aa0016                 | addq.l       #$1, $16(a2)                        ; arithmetic operation; flags depend on variant
000010c4 | 17801800                 | move.b       d0, (a3, d1.l)                      ; copy source to destination (Motorola operand order); flags depend on variant
000010c8 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000010ca | 4cdf1c18                 | movem.l      (a7)+, d3-d4/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
000010ce | 4e5e                     | unlk         a6                                  ; restore stack frame
000010d0 | 4e75                     | rts                                              ; return: pop return address from stack
000010d2 | 4e56ffb6                 | link.w       a6, #$ffb6                          ; establish stack frame
000010d6 | 48e71e38                 | movem.l      d3-d6/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
000010da | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
000010de | 286e000c                 | movea.l      $c(a6), a4                          ; copy source to destination (Motorola operand order); flags depend on variant
000010e2 | 4aaa002e                 | tst.l        $2e(a2)                             ; machine operation; verify instruction and data boundaries
000010e6 | 6d06                     | blt.b        $10ee                               ; branch according to condition flags (bra unconditional, bsr call)
000010e8 | 202a002e                 | move.l       $2e(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000010ec | 6006                     | bra.b        $10f4                               ; branch according to condition flags (bra unconditional, bsr call)
000010ee | 203c7fffffff             | move.l       #$7fffffff, d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000010f4 | 2a00                     | move.l       d0, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
000010f6 | 182dfcc6                 | move.b       -$33a(a5), d4                       ; copy source to destination (Motorola operand order); flags depend on variant
000010fa | 4884                     | ext.w        d4                                  ; bit/integer operation; flags depend on variant
000010fc | 48c4                     | ext.l        d4                                  ; bit/integer operation; flags depend on variant
000010fe | d8aa0036                 | add.l        $36(a2), d4                         ; arithmetic operation; flags depend on variant
00001102 | 3d6df922ffb6             | move.w       -$6de(a5), -$4a(a6)                 ; copy source to destination (Motorola operand order); flags depend on variant
00001108 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000110c | 7204                     | moveq        #$4, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
0000110e | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00001110 | 6606                     | bne.b        $1118                               ; branch according to condition flags (bra unconditional, bsr call)
00001112 | 7040                     | moveq        #$40, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001114 | b880                     | cmp.l        d0, d4                              ; compare operands; set condition flags
00001116 | 6208                     | bhi.b        $1120                               ; branch according to condition flags (bra unconditional, bsr call)
00001118 | 47eeffc0                 | lea.l        -$40(a6), a3                        ; machine operation; verify instruction and data boundaries
0000111c | 7840                     | moveq        #$40, d4                            ; copy source to destination (Motorola operand order); flags depend on variant
0000111e | 6016                     | bra.b        $1136                               ; branch according to condition flags (bra unconditional, bsr call)
00001120 | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001122 | 4eb9000015cc             | jsr          $15cc.l                             ; call subroutine; push return address
00001128 | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000112a | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000112c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000112e | 6606                     | bne.b        $1136                               ; branch according to condition flags (bra unconditional, bsr call)
00001130 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001132 | 600000a4                 | bra.w        $11d8                               ; branch according to condition flags (bra unconditional, bsr call)
00001136 | 7c00                     | moveq        #$0, d6                             ; copy source to destination (Motorola operand order); flags depend on variant
00001138 | 6072                     | bra.b        $11ac                               ; branch according to condition flags (bra unconditional, bsr call)
0000113a | 486effb6                 | pea.l        -$4a(a6)                            ; machine operation; verify instruction and data boundaries
0000113e | 1f14                     | move.b       (a4), -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00001140 | 486effb8                 | pea.l        -$48(a6)                            ; machine operation; verify instruction and data boundaries
00001144 | 4eb900001778             | jsr          $1778.l                             ; call subroutine; push return address
0000114a | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000114c | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
0000114e | 4fef000a                 | lea.l        $a(a7), a7                          ; machine operation; verify instruction and data boundaries
00001152 | 6e04                     | bgt.b        $1158                               ; branch according to condition flags (bra unconditional, bsr call)
00001154 | 7cff                     | moveq        #$ff, d6                            ; copy source to destination (Motorola operand order); flags depend on variant
00001156 | 6058                     | bra.b        $11b0                               ; branch according to condition flags (bra unconditional, bsr call)
00001158 | 4a14                     | tst.b        (a4)                                ; machine operation; verify instruction and data boundaries
0000115a | 6704                     | beq.b        $1160                               ; branch according to condition flags (bra unconditional, bsr call)
0000115c | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000115e | 6004                     | bra.b        $1164                               ; branch according to condition flags (bra unconditional, bsr call)
00001160 | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00001162 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001164 | ba80                     | cmp.l        d0, d5                              ; compare operands; set condition flags
00001166 | 6d48                     | blt.b        $11b0                               ; branch according to condition flags (bra unconditional, bsr call)
00001168 | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000116c | d083                     | add.l        d3, d0                              ; arithmetic operation; flags depend on variant
0000116e | b880                     | cmp.l        d0, d4                              ; compare operands; set condition flags
00001170 | 6414                     | bcc.b        $1186                               ; branch according to condition flags (bra unconditional, bsr call)
00001172 | 42aa0036                 | clr.l        $36(a2)                             ; bit/integer operation; flags depend on variant
00001176 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001178 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000117a | 4eb9000011e0             | jsr          $11e0.l                             ; call subroutine; push return address
00001180 | 42aa0016                 | clr.l        $16(a2)                             ; bit/integer operation; flags depend on variant
00001184 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00001186 | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000118a | 41f30800                 | lea.l        (a3, d0.l), a0                      ; machine operation; verify instruction and data boundaries
0000118e | 43eeffb8                 | lea.l        -$48(a6), a1                        ; machine operation; verify instruction and data boundaries
00001192 | 2203                     | move.l       d3, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00001194 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001196 | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
00001198 | 6706                     | beq.b        $11a0                               ; branch according to condition flags (bra unconditional, bsr call)
0000119a | 10d9                     | move.b       (a1)+, (a0)+                        ; copy source to destination (Motorola operand order); flags depend on variant
0000119c | 5381                     | subq.l       #$1, d1                             ; arithmetic operation; flags depend on variant
0000119e | 66fa                     | bne.b        $119a                               ; branch according to condition flags (bra unconditional, bsr call)
000011a0 | d7aa0016                 | add.l        d3, $16(a2)                         ; arithmetic operation; flags depend on variant
000011a4 | 4a14                     | tst.b        (a4)                                ; machine operation; verify instruction and data boundaries
000011a6 | 6708                     | beq.b        $11b0                               ; branch according to condition flags (bra unconditional, bsr call)
000011a8 | 528c                     | addq.l       #$1, a4                             ; arithmetic operation; flags depend on variant
000011aa | 9a83                     | sub.l        d3, d5                              ; arithmetic operation; flags depend on variant
000011ac | 4a85                     | tst.l        d5                                  ; machine operation; verify instruction and data boundaries
000011ae | 6e8a                     | bgt.b        $113a                               ; branch according to condition flags (bra unconditional, bsr call)
000011b0 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000011b2 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000011b4 | 4eb9000011e0             | jsr          $11e0.l                             ; call subroutine; push return address
000011ba | 42aa0036                 | clr.l        $36(a2)                             ; bit/integer operation; flags depend on variant
000011be | 42aa0016                 | clr.l        $16(a2)                             ; bit/integer operation; flags depend on variant
000011c2 | 41eeffc0                 | lea.l        -$40(a6), a0                        ; machine operation; verify instruction and data boundaries
000011c6 | b7c8                     | cmpa.l       a0, a3                              ; compare operands; set condition flags
000011c8 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
000011ca | 670a                     | beq.b        $11d6                               ; branch according to condition flags (bra unconditional, bsr call)
000011cc | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000011ce | 4eb90000143a             | jsr          $143a.l                             ; call subroutine; push return address
000011d4 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000011d6 | 2006                     | move.l       d6, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000011d8 | 4cdf1c78                 | movem.l      (a7)+, d3-d6/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
000011dc | 4e5e                     | unlk         a6                                  ; restore stack frame
000011de | 4e75                     | rts                                              ; return: pop return address from stack
000011e0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000011e4 | 48e71c20                 | movem.l      d3-d5/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000011e8 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
000011ec | 262a0036                 | move.l       $36(a2), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
000011f0 | 96aa0016                 | sub.l        $16(a2), d3                         ; arithmetic operation; flags depend on variant
000011f4 | 96aa001a                 | sub.l        $1a(a2), d3                         ; arithmetic operation; flags depend on variant
000011f8 | 96aa001e                 | sub.l        $1e(a2), d3                         ; arithmetic operation; flags depend on variant
000011fc | 96aa0022                 | sub.l        $22(a2), d3                         ; arithmetic operation; flags depend on variant
00001200 | 96aa0026                 | sub.l        $26(a2), d3                         ; arithmetic operation; flags depend on variant
00001204 | 96aa002a                 | sub.l        $2a(a2), d3                         ; arithmetic operation; flags depend on variant
00001208 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000120c | 7204                     | moveq        #$4, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
0000120e | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00001210 | 6648                     | bne.b        $125a                               ; branch according to condition flags (bra unconditional, bsr call)
00001212 | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00001214 | 6f44                     | ble.b        $125a                               ; branch according to condition flags (bra unconditional, bsr call)
00001216 | 2a03                     | move.l       d3, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
00001218 | 603c                     | bra.b        $1256                               ; branch according to condition flags (bra unconditional, bsr call)
0000121a | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000121c | ba80                     | cmp.l        d0, d5                              ; compare operands; set condition flags
0000121e | 6204                     | bhi.b        $1224                               ; branch according to condition flags (bra unconditional, bsr call)
00001220 | 2005                     | move.l       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001222 | 6002                     | bra.b        $1226                               ; branch according to condition flags (bra unconditional, bsr call)
00001224 | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001226 | 2800                     | move.l       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00001228 | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
0000122a | 6f28                     | ble.b        $1254                               ; branch according to condition flags (bra unconditional, bsr call)
0000122c | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000122e | 486dffb8                 | pea.l        -$48(a5)                            ; machine operation; verify instruction and data boundaries
00001232 | 2f2a000e                 | move.l       $e(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001236 | 206a000a                 | movea.l      $a(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000123a | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
0000123c | 2548000e                 | move.l       a0, $e(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001240 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001242 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00001246 | 6706                     | beq.b        $124e                               ; branch according to condition flags (bra unconditional, bsr call)
00001248 | d9aa0032                 | add.l        d4, $32(a2)                         ; arithmetic operation; flags depend on variant
0000124c | 6006                     | bra.b        $1254                               ; branch according to condition flags (bra unconditional, bsr call)
0000124e | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001250 | 600001e0                 | bra.w        $1432                               ; branch according to condition flags (bra unconditional, bsr call)
00001254 | 9a84                     | sub.l        d4, d5                              ; arithmetic operation; flags depend on variant
00001256 | 4a85                     | tst.l        d5                                  ; machine operation; verify instruction and data boundaries
00001258 | 6ec0                     | bgt.b        $121a                               ; branch according to condition flags (bra unconditional, bsr call)
0000125a | 4aaa0016                 | tst.l        $16(a2)                             ; machine operation; verify instruction and data boundaries
0000125e | 6f2e                     | ble.b        $128e                               ; branch according to condition flags (bra unconditional, bsr call)
00001260 | 2f2a0016                 | move.l       $16(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001264 | 2f2e000c                 | move.l       $c(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001268 | 2f2a000e                 | move.l       $e(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000126c | 206a000a                 | movea.l      $a(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001270 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00001272 | 2548000e                 | move.l       a0, $e(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001276 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001278 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
0000127c | 670a                     | beq.b        $1288                               ; branch according to condition flags (bra unconditional, bsr call)
0000127e | 202a0016                 | move.l       $16(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001282 | d1aa0032                 | add.l        d0, $32(a2)                         ; arithmetic operation; flags depend on variant
00001286 | 6006                     | bra.b        $128e                               ; branch according to condition flags (bra unconditional, bsr call)
00001288 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000128a | 600001a6                 | bra.w        $1432                               ; branch according to condition flags (bra unconditional, bsr call)
0000128e | 4aaa001a                 | tst.l        $1a(a2)                             ; machine operation; verify instruction and data boundaries
00001292 | 6f46                     | ble.b        $12da                               ; branch according to condition flags (bra unconditional, bsr call)
00001294 | 2a2a001a                 | move.l       $1a(a2), d5                         ; copy source to destination (Motorola operand order); flags depend on variant
00001298 | 603c                     | bra.b        $12d6                               ; branch according to condition flags (bra unconditional, bsr call)
0000129a | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000129c | ba80                     | cmp.l        d0, d5                              ; compare operands; set condition flags
0000129e | 6204                     | bhi.b        $12a4                               ; branch according to condition flags (bra unconditional, bsr call)
000012a0 | 2005                     | move.l       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000012a2 | 6002                     | bra.b        $12a6                               ; branch according to condition flags (bra unconditional, bsr call)
000012a4 | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000012a6 | 2800                     | move.l       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000012a8 | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
000012aa | 6f28                     | ble.b        $12d4                               ; branch according to condition flags (bra unconditional, bsr call)
000012ac | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000012ae | 486dffda                 | pea.l        -$26(a5)                            ; machine operation; verify instruction and data boundaries
000012b2 | 2f2a000e                 | move.l       $e(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000012b6 | 206a000a                 | movea.l      $a(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000012ba | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
000012bc | 2548000e                 | move.l       a0, $e(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000012c0 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000012c2 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
000012c6 | 6706                     | beq.b        $12ce                               ; branch according to condition flags (bra unconditional, bsr call)
000012c8 | d9aa0032                 | add.l        d4, $32(a2)                         ; arithmetic operation; flags depend on variant
000012cc | 6006                     | bra.b        $12d4                               ; branch according to condition flags (bra unconditional, bsr call)
000012ce | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000012d0 | 60000160                 | bra.w        $1432                               ; branch according to condition flags (bra unconditional, bsr call)
000012d4 | 9a84                     | sub.l        d4, d5                              ; arithmetic operation; flags depend on variant
000012d6 | 4a85                     | tst.l        d5                                  ; machine operation; verify instruction and data boundaries
000012d8 | 6ec0                     | bgt.b        $129a                               ; branch according to condition flags (bra unconditional, bsr call)
000012da | 4aaa001e                 | tst.l        $1e(a2)                             ; machine operation; verify instruction and data boundaries
000012de | 6f2e                     | ble.b        $130e                               ; branch according to condition flags (bra unconditional, bsr call)
000012e0 | 2f2a001e                 | move.l       $1e(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000012e4 | 2f2a0012                 | move.l       $12(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000012e8 | 2f2a000e                 | move.l       $e(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000012ec | 206a000a                 | movea.l      $a(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000012f0 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
000012f2 | 2548000e                 | move.l       a0, $e(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000012f6 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000012f8 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
000012fc | 670a                     | beq.b        $1308                               ; branch according to condition flags (bra unconditional, bsr call)
000012fe | 202a001e                 | move.l       $1e(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001302 | d1aa0032                 | add.l        d0, $32(a2)                         ; arithmetic operation; flags depend on variant
00001306 | 6006                     | bra.b        $130e                               ; branch according to condition flags (bra unconditional, bsr call)
00001308 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000130a | 60000126                 | bra.w        $1432                               ; branch according to condition flags (bra unconditional, bsr call)
0000130e | 4aaa0022                 | tst.l        $22(a2)                             ; machine operation; verify instruction and data boundaries
00001312 | 6f46                     | ble.b        $135a                               ; branch according to condition flags (bra unconditional, bsr call)
00001314 | 2a2a0022                 | move.l       $22(a2), d5                         ; copy source to destination (Motorola operand order); flags depend on variant
00001318 | 603c                     | bra.b        $1356                               ; branch according to condition flags (bra unconditional, bsr call)
0000131a | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000131c | ba80                     | cmp.l        d0, d5                              ; compare operands; set condition flags
0000131e | 6204                     | bhi.b        $1324                               ; branch according to condition flags (bra unconditional, bsr call)
00001320 | 2005                     | move.l       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001322 | 6002                     | bra.b        $1326                               ; branch according to condition flags (bra unconditional, bsr call)
00001324 | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001326 | 2800                     | move.l       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00001328 | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
0000132a | 6f28                     | ble.b        $1354                               ; branch according to condition flags (bra unconditional, bsr call)
0000132c | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000132e | 486dffda                 | pea.l        -$26(a5)                            ; machine operation; verify instruction and data boundaries
00001332 | 2f2a000e                 | move.l       $e(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001336 | 206a000a                 | movea.l      $a(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000133a | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
0000133c | 2548000e                 | move.l       a0, $e(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001340 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001342 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00001346 | 6706                     | beq.b        $134e                               ; branch according to condition flags (bra unconditional, bsr call)
00001348 | d9aa0032                 | add.l        d4, $32(a2)                         ; arithmetic operation; flags depend on variant
0000134c | 6006                     | bra.b        $1354                               ; branch according to condition flags (bra unconditional, bsr call)
0000134e | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001350 | 600000e0                 | bra.w        $1432                               ; branch according to condition flags (bra unconditional, bsr call)
00001354 | 9a84                     | sub.l        d4, d5                              ; arithmetic operation; flags depend on variant
00001356 | 4a85                     | tst.l        d5                                  ; machine operation; verify instruction and data boundaries
00001358 | 6ec0                     | bgt.b        $131a                               ; branch according to condition flags (bra unconditional, bsr call)
0000135a | 4aaa0026                 | tst.l        $26(a2)                             ; machine operation; verify instruction and data boundaries
0000135e | 6f36                     | ble.b        $1396                               ; branch according to condition flags (bra unconditional, bsr call)
00001360 | 2f2a0026                 | move.l       $26(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001364 | 206a0012                 | movea.l      $12(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001368 | 202a001e                 | move.l       $1e(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000136c | 48700800                 | pea.l        (a0, d0.l)                          ; machine operation; verify instruction and data boundaries
00001370 | 2f2a000e                 | move.l       $e(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001374 | 206a000a                 | movea.l      $a(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001378 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
0000137a | 2548000e                 | move.l       a0, $e(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000137e | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001380 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00001384 | 670a                     | beq.b        $1390                               ; branch according to condition flags (bra unconditional, bsr call)
00001386 | 202a0026                 | move.l       $26(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000138a | d1aa0032                 | add.l        d0, $32(a2)                         ; arithmetic operation; flags depend on variant
0000138e | 6006                     | bra.b        $1396                               ; branch according to condition flags (bra unconditional, bsr call)
00001390 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001392 | 6000009e                 | bra.w        $1432                               ; branch according to condition flags (bra unconditional, bsr call)
00001396 | 4aaa002a                 | tst.l        $2a(a2)                             ; machine operation; verify instruction and data boundaries
0000139a | 6f44                     | ble.b        $13e0                               ; branch according to condition flags (bra unconditional, bsr call)
0000139c | 2a2a002a                 | move.l       $2a(a2), d5                         ; copy source to destination (Motorola operand order); flags depend on variant
000013a0 | 603a                     | bra.b        $13dc                               ; branch according to condition flags (bra unconditional, bsr call)
000013a2 | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000013a4 | ba80                     | cmp.l        d0, d5                              ; compare operands; set condition flags
000013a6 | 6204                     | bhi.b        $13ac                               ; branch according to condition flags (bra unconditional, bsr call)
000013a8 | 2005                     | move.l       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000013aa | 6002                     | bra.b        $13ae                               ; branch according to condition flags (bra unconditional, bsr call)
000013ac | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000013ae | 2800                     | move.l       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000013b0 | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
000013b2 | 6f26                     | ble.b        $13da                               ; branch according to condition flags (bra unconditional, bsr call)
000013b4 | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000013b6 | 486dffda                 | pea.l        -$26(a5)                            ; machine operation; verify instruction and data boundaries
000013ba | 2f2a000e                 | move.l       $e(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000013be | 206a000a                 | movea.l      $a(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000013c2 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
000013c4 | 2548000e                 | move.l       a0, $e(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000013c8 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000013ca | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
000013ce | 6706                     | beq.b        $13d6                               ; branch according to condition flags (bra unconditional, bsr call)
000013d0 | d9aa0032                 | add.l        d4, $32(a2)                         ; arithmetic operation; flags depend on variant
000013d4 | 6004                     | bra.b        $13da                               ; branch according to condition flags (bra unconditional, bsr call)
000013d6 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000013d8 | 6058                     | bra.b        $1432                               ; branch according to condition flags (bra unconditional, bsr call)
000013da | 9a84                     | sub.l        d4, d5                              ; arithmetic operation; flags depend on variant
000013dc | 4a85                     | tst.l        d5                                  ; machine operation; verify instruction and data boundaries
000013de | 6ec2                     | bgt.b        $13a2                               ; branch according to condition flags (bra unconditional, bsr call)
000013e0 | 302a003a                 | move.w       $3a(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000013e4 | 7204                     | moveq        #$4, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
000013e6 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
000013e8 | 6746                     | beq.b        $1430                               ; branch according to condition flags (bra unconditional, bsr call)
000013ea | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
000013ec | 6f42                     | ble.b        $1430                               ; branch according to condition flags (bra unconditional, bsr call)
000013ee | 2803                     | move.l       d3, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000013f0 | 603a                     | bra.b        $142c                               ; branch according to condition flags (bra unconditional, bsr call)
000013f2 | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000013f4 | b880                     | cmp.l        d0, d4                              ; compare operands; set condition flags
000013f6 | 6204                     | bhi.b        $13fc                               ; branch according to condition flags (bra unconditional, bsr call)
000013f8 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000013fa | 6002                     | bra.b        $13fe                               ; branch according to condition flags (bra unconditional, bsr call)
000013fc | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000013fe | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001400 | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00001402 | 6f26                     | ble.b        $142a                               ; branch according to condition flags (bra unconditional, bsr call)
00001404 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001406 | 486dffb8                 | pea.l        -$48(a5)                            ; machine operation; verify instruction and data boundaries
0000140a | 2f2a000e                 | move.l       $e(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000140e | 206a000a                 | movea.l      $a(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001412 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00001414 | 2548000e                 | move.l       a0, $e(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001418 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000141a | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
0000141e | 6706                     | beq.b        $1426                               ; branch according to condition flags (bra unconditional, bsr call)
00001420 | d7aa0032                 | add.l        d3, $32(a2)                         ; arithmetic operation; flags depend on variant
00001424 | 6004                     | bra.b        $142a                               ; branch according to condition flags (bra unconditional, bsr call)
00001426 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001428 | 6008                     | bra.b        $1432                               ; branch according to condition flags (bra unconditional, bsr call)
0000142a | 9883                     | sub.l        d3, d4                              ; arithmetic operation; flags depend on variant
0000142c | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
0000142e | 6ec2                     | bgt.b        $13f2                               ; branch according to condition flags (bra unconditional, bsr call)
00001430 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001432 | 4cdf0438                 | movem.l      (a7)+, d3-d5/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00001436 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001438 | 4e75                     | rts                                              ; return: pop return address from stack
0000143a | 48e70018                 | movem.l      a3-a4, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000143e | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001440 | 266f0010                 | movea.l      $10(a7), a3                         ; copy source to destination (Motorola operand order); flags depend on variant
00001444 | 200b                     | move.l       a3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001446 | 6700009a                 | beq.w        $14e2                               ; branch according to condition flags (bra unconditional, bsr call)
0000144a | 224b                     | movea.l      a3, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
0000144c | 5989                     | subq.l       #$4, a1                             ; arithmetic operation; flags depend on variant
0000144e | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001450 | b091                     | cmp.l        (a1), d0                            ; compare operands; set condition flags
00001452 | 6206                     | bhi.b        $145a                               ; branch according to condition flags (bra unconditional, bsr call)
00001454 | 7003                     | moveq        #$3, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001456 | c091                     | and.l        (a1), d0                            ; bit/integer operation; flags depend on variant
00001458 | 6704                     | beq.b        $145e                               ; branch according to condition flags (bra unconditional, bsr call)
0000145a | 60000086                 | bra.w        $14e2                               ; branch according to condition flags (bra unconditional, bsr call)
0000145e | 2e91                     | move.l       (a1), (a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001460 | 4aadf928                 | tst.l        -$6d8(a5)                           ; machine operation; verify instruction and data boundaries
00001464 | 6706                     | beq.b        $146c                               ; branch according to condition flags (bra unconditional, bsr call)
00001466 | b3edf928                 | cmpa.l       -$6d8(a5), a1                       ; compare operands; set condition flags
0000146a | 640c                     | bcc.b        $1478                               ; branch according to condition flags (bra unconditional, bsr call)
0000146c | 236df9280004             | move.l       -$6d8(a5), $4(a1)                   ; copy source to destination (Motorola operand order); flags depend on variant
00001472 | 2b49f928                 | move.l       a1, -$6d8(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001476 | 6044                     | bra.b        $14bc                               ; branch according to condition flags (bra unconditional, bsr call)
00001478 | 266df928                 | movea.l      -$6d8(a5), a3                       ; copy source to destination (Motorola operand order); flags depend on variant
0000147c | 6004                     | bra.b        $1482                               ; branch according to condition flags (bra unconditional, bsr call)
0000147e | 266b0004                 | movea.l      $4(a3), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00001482 | 4aab0004                 | tst.l        $4(a3)                              ; machine operation; verify instruction and data boundaries
00001486 | 6706                     | beq.b        $148e                               ; branch according to condition flags (bra unconditional, bsr call)
00001488 | b3eb0004                 | cmpa.l       $4(a3), a1                          ; compare operands; set condition flags
0000148c | 62f0                     | bhi.b        $147e                               ; branch according to condition flags (bra unconditional, bsr call)
0000148e | 284b                     | movea.l      a3, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
00001490 | d9d3                     | adda.l       (a3), a4                            ; arithmetic operation; flags depend on variant
00001492 | b3cc                     | cmpa.l       a4, a1                              ; compare operands; set condition flags
00001494 | 654c                     | bcs.b        $14e2                               ; branch according to condition flags (bra unconditional, bsr call)
00001496 | b9c9                     | cmpa.l       a1, a4                              ; compare operands; set condition flags
00001498 | 6608                     | bne.b        $14a2                               ; branch according to condition flags (bra unconditional, bsr call)
0000149a | 2011                     | move.l       (a1), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000149c | d193                     | add.l        d0, (a3)                            ; arithmetic operation; flags depend on variant
0000149e | 224b                     | movea.l      a3, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
000014a0 | 601a                     | bra.b        $14bc                               ; branch according to condition flags (bra unconditional, bsr call)
000014a2 | 4aab0004                 | tst.l        $4(a3)                              ; machine operation; verify instruction and data boundaries
000014a6 | 670a                     | beq.b        $14b2                               ; branch according to condition flags (bra unconditional, bsr call)
000014a8 | 2049                     | movea.l      a1, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000014aa | d1d1                     | adda.l       (a1), a0                            ; arithmetic operation; flags depend on variant
000014ac | b1eb0004                 | cmpa.l       $4(a3), a0                          ; compare operands; set condition flags
000014b0 | 6230                     | bhi.b        $14e2                               ; branch according to condition flags (bra unconditional, bsr call)
000014b2 | 236b00040004             | move.l       $4(a3), $4(a1)                      ; copy source to destination (Motorola operand order); flags depend on variant
000014b8 | 27490004                 | move.l       a1, $4(a3)                          ; copy source to destination (Motorola operand order); flags depend on variant
000014bc | 4aa90004                 | tst.l        $4(a1)                              ; machine operation; verify instruction and data boundaries
000014c0 | 6720                     | beq.b        $14e2                               ; branch according to condition flags (bra unconditional, bsr call)
000014c2 | 2049                     | movea.l      a1, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000014c4 | d1d1                     | adda.l       (a1), a0                            ; arithmetic operation; flags depend on variant
000014c6 | b1e90004                 | cmpa.l       $4(a1), a0                          ; compare operands; set condition flags
000014ca | 6616                     | bne.b        $14e2                               ; branch according to condition flags (bra unconditional, bsr call)
000014cc | 42adf924                 | clr.l        -$6dc(a5)                           ; bit/integer operation; flags depend on variant
000014d0 | 20690004                 | movea.l      $4(a1), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000014d4 | 2010                     | move.l       (a0), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000014d6 | d191                     | add.l        d0, (a1)                            ; arithmetic operation; flags depend on variant
000014d8 | 20690004                 | movea.l      $4(a1), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000014dc | 236800040004             | move.l       $4(a0), $4(a1)                      ; copy source to destination (Motorola operand order); flags depend on variant
000014e2 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000014e4 | 4cdf1800                 | movem.l      (a7)+, a3-a4                        ; copy source to destination (Motorola operand order); flags depend on variant
000014e8 | 4e75                     | rts                                              ; return: pop return address from stack
000014ea | 514f                     | subq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
000014ec | 202f0010                 | move.l       $10(a7), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000014f0 | 222f0014                 | move.l       $14(a7), d1                         ; copy source to destination (Motorola operand order); flags depend on variant
000014f4 | 4eb900000562             | jsr          $562.l                              ; call subroutine; push return address
000014fa | 2e80                     | move.l       d0, (a7)                            ; copy source to destination (Motorola operand order); flags depend on variant
000014fc | 202f0014                 | move.l       $14(a7), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001500 | 2217                     | move.l       (a7), d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001502 | 4eb9000004d2             | jsr          $4d2.l                              ; call subroutine; push return address
00001508 | 222f0010                 | move.l       $10(a7), d1                         ; copy source to destination (Motorola operand order); flags depend on variant
0000150c | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
0000150e | 2f410004                 | move.l       d1, $4(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001512 | 206f000c                 | movea.l      $c(a7), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001516 | 2097                     | move.l       (a7), (a0)                          ; copy source to destination (Motorola operand order); flags depend on variant
00001518 | 216f00040004             | move.l       $4(a7), $4(a0)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000151e | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00001520 | 4e75                     | rts                                              ; return: pop return address from stack
00001522 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001526 | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000152a | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
0000152e | 246df924                 | movea.l      -$6dc(a5), a2                       ; copy source to destination (Motorola operand order); flags depend on variant
00001532 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001534 | 662e                     | bne.b        $1564                               ; branch according to condition flags (bra unconditional, bsr call)
00001536 | 45edf924                 | lea.l        -$6dc(a5), a2                       ; machine operation; verify instruction and data boundaries
0000153a | 588a                     | addq.l       #$4, a2                             ; arithmetic operation; flags depend on variant
0000153c | 6010                     | bra.b        $154e                               ; branch according to condition flags (bra unconditional, bsr call)
0000153e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001540 | b890                     | cmp.l        (a0), d4                            ; compare operands; set condition flags
00001542 | 6204                     | bhi.b        $1548                               ; branch according to condition flags (bra unconditional, bsr call)
00001544 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001546 | 607c                     | bra.b        $15c4                               ; branch according to condition flags (bra unconditional, bsr call)
00001548 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000154a | 5888                     | addq.l       #$4, a0                             ; arithmetic operation; flags depend on variant
0000154c | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000154e | 4a92                     | tst.l        (a2)                                ; machine operation; verify instruction and data boundaries
00001550 | 66ec                     | bne.b        $153e                               ; branch according to condition flags (bra unconditional, bsr call)
00001552 | 6036                     | bra.b        $158a                               ; branch according to condition flags (bra unconditional, bsr call)
00001554 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001556 | b890                     | cmp.l        (a0), d4                            ; compare operands; set condition flags
00001558 | 6204                     | bhi.b        $155e                               ; branch according to condition flags (bra unconditional, bsr call)
0000155a | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000155c | 6066                     | bra.b        $15c4                               ; branch according to condition flags (bra unconditional, bsr call)
0000155e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001560 | 5888                     | addq.l       #$4, a0                             ; arithmetic operation; flags depend on variant
00001562 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00001564 | 4a92                     | tst.l        (a2)                                ; machine operation; verify instruction and data boundaries
00001566 | 66ec                     | bne.b        $1554                               ; branch according to condition flags (bra unconditional, bsr call)
00001568 | 206df924                 | movea.l      -$6dc(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
0000156c | 2650                     | movea.l      (a0), a3                            ; copy source to destination (Motorola operand order); flags depend on variant
0000156e | 45edf924                 | lea.l        -$6dc(a5), a2                       ; machine operation; verify instruction and data boundaries
00001572 | 588a                     | addq.l       #$4, a2                             ; arithmetic operation; flags depend on variant
00001574 | 6010                     | bra.b        $1586                               ; branch according to condition flags (bra unconditional, bsr call)
00001576 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001578 | b890                     | cmp.l        (a0), d4                            ; compare operands; set condition flags
0000157a | 6204                     | bhi.b        $1580                               ; branch according to condition flags (bra unconditional, bsr call)
0000157c | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000157e | 6044                     | bra.b        $15c4                               ; branch according to condition flags (bra unconditional, bsr call)
00001580 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001582 | 5888                     | addq.l       #$4, a0                             ; arithmetic operation; flags depend on variant
00001584 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00001586 | b7d2                     | cmpa.l       (a2), a3                            ; compare operands; set condition flags
00001588 | 66ec                     | bne.b        $1576                               ; branch according to condition flags (bra unconditional, bsr call)
0000158a | 263c00008000             | move.l       #$8000, d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00001590 | b684                     | cmp.l        d4, d3                              ; compare operands; set condition flags
00001592 | 6402                     | bcc.b        $1596                               ; branch according to condition flags (bra unconditional, bsr call)
00001594 | 2604                     | move.l       d4, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001596 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001598 | 4eb900001644             | jsr          $1644.l                             ; call subroutine; push return address
0000159e | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
000015a0 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000015a2 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000015a4 | 660c                     | bne.b        $15b2                               ; branch according to condition flags (bra unconditional, bsr call)
000015a6 | b684                     | cmp.l        d4, d3                              ; compare operands; set condition flags
000015a8 | 6604                     | bne.b        $15ae                               ; branch according to condition flags (bra unconditional, bsr call)
000015aa | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
000015ac | 6016                     | bra.b        $15c4                               ; branch according to condition flags (bra unconditional, bsr call)
000015ae | e28b                     | lsr.l        #$1, d3                             ; bit/integer operation; flags depend on variant
000015b0 | 60de                     | bra.b        $1590                               ; branch according to condition flags (bra unconditional, bsr call)
000015b2 | 2683                     | move.l       d3, (a3)                            ; copy source to destination (Motorola operand order); flags depend on variant
000015b4 | 486b0004                 | pea.l        $4(a3)                              ; machine operation; verify instruction and data boundaries
000015b8 | 4eb90000143a             | jsr          $143a.l                             ; call subroutine; push return address
000015be | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000015c0 | 6000ff6c                 | bra.w        $152e                               ; branch according to condition flags (bra unconditional, bsr call)
000015c4 | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
000015c8 | 4e5e                     | unlk         a6                                  ; restore stack frame
000015ca | 4e75                     | rts                                              ; return: pop return address from stack
000015cc | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000015d0 | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
000015d4 | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
000015d8 | 70fc                     | moveq        #$fc, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000015da | 2604                     | move.l       d4, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000015dc | 5e83                     | addq.l       #$7, d3                             ; arithmetic operation; flags depend on variant
000015de | c680                     | and.l        d0, d3                              ; bit/integer operation; flags depend on variant
000015e0 | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
000015e2 | 6604                     | bne.b        $15e8                               ; branch according to condition flags (bra unconditional, bsr call)
000015e4 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
000015e6 | 6054                     | bra.b        $163c                               ; branch according to condition flags (bra unconditional, bsr call)
000015e8 | b684                     | cmp.l        d4, d3                              ; compare operands; set condition flags
000015ea | 6204                     | bhi.b        $15f0                               ; branch according to condition flags (bra unconditional, bsr call)
000015ec | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
000015ee | 604c                     | bra.b        $163c                               ; branch according to condition flags (bra unconditional, bsr call)
000015f0 | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000015f2 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
000015f4 | 6402                     | bcc.b        $15f8                               ; branch according to condition flags (bra unconditional, bsr call)
000015f6 | 7608                     | moveq        #$8, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000015f8 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000015fa | 4eb900001522             | jsr          $1522.l                             ; call subroutine; push return address
00001600 | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001602 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001604 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001606 | 6604                     | bne.b        $160c                               ; branch according to condition flags (bra unconditional, bsr call)
00001608 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
0000160a | 6030                     | bra.b        $163c                               ; branch according to condition flags (bra unconditional, bsr call)
0000160c | 2453                     | movea.l      (a3), a2                            ; copy source to destination (Motorola operand order); flags depend on variant
0000160e | 2012                     | move.l       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001610 | 5180                     | subq.l       #$8, d0                             ; arithmetic operation; flags depend on variant
00001612 | b083                     | cmp.l        d3, d0                              ; compare operands; set condition flags
00001614 | 6406                     | bcc.b        $161c                               ; branch according to condition flags (bra unconditional, bsr call)
00001616 | 26aa0004                 | move.l       $4(a2), (a3)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000161a | 6018                     | bra.b        $1634                               ; branch according to condition flags (bra unconditional, bsr call)
0000161c | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000161e | d1c3                     | adda.l       d3, a0                              ; arithmetic operation; flags depend on variant
00001620 | 2688                     | move.l       a0, (a3)                            ; copy source to destination (Motorola operand order); flags depend on variant
00001622 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001624 | 216a00040004             | move.l       $4(a2), $4(a0)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000162a | 2012                     | move.l       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000162c | 9083                     | sub.l        d3, d0                              ; arithmetic operation; flags depend on variant
0000162e | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001630 | 2080                     | move.l       d0, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
00001632 | 2483                     | move.l       d3, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
00001634 | 2b4bf924                 | move.l       a3, -$6dc(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001638 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000163a | 5888                     | addq.l       #$4, a0                             ; arithmetic operation; flags depend on variant
0000163c | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
00001640 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001642 | 4e75                     | rts                                              ; return: pop return address from stack
00001644 | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00001648 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000164a | 262e0008                 | move.l       $8(a6), d3                          ; copy source to destination (Motorola operand order); flags depend on variant
0000164e | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00001650 | 6714                     | beq.b        $1666                               ; branch according to condition flags (bra unconditional, bsr call)
00001652 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001654 | a11e                     | dc.w         $a11e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001656 | 2d48fffc                 | move.l       a0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000165a | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000165c | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
0000165e | 6706                     | beq.b        $1666                               ; branch according to condition flags (bra unconditional, bsr call)
00001660 | 206efffc                 | movea.l      -$4(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001664 | 6002                     | bra.b        $1668                               ; branch according to condition flags (bra unconditional, bsr call)
00001666 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
00001668 | 261f                     | move.l       (a7)+, d3                           ; copy source to destination (Motorola operand order); flags depend on variant
0000166a | 4e5e                     | unlk         a6                                  ; restore stack frame
0000166c | 4e75                     | rts                                              ; return: pop return address from stack
0000166e | 48e70f18                 | movem.l      d4-d7/a3-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00001672 | 286f0020                 | movea.l      $20(a7), a4                         ; copy source to destination (Motorola operand order); flags depend on variant
00001676 | 226f0028                 | movea.l      $28(a7), a1                         ; copy source to destination (Motorola operand order); flags depend on variant
0000167a | 200c                     | move.l       a4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000167c | 6614                     | bne.b        $1692                               ; branch according to condition flags (bra unconditional, bsr call)
0000167e | 32adf92c                 | move.w       -$6d4(a5), (a1)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001682 | 206dfcc8                 | movea.l      -$338(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00001686 | 3010                     | move.w       (a0), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001688 | 028000000f00             | andi.l       #$f00, d0                           ; bit/integer operation; flags depend on variant
0000168e | 600000e2                 | bra.w        $1772                               ; branch according to condition flags (bra unconditional, bsr call)
00001692 | 1a290001                 | move.b       $1(a1), d5                          ; copy source to destination (Motorola operand order); flags depend on variant
00001696 | 7c00                     | moveq        #$0, d6                             ; copy source to destination (Motorola operand order); flags depend on variant
00001698 | 264c                     | movea.l      a4, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000169a | 1411                     | move.b       (a1), d2                            ; copy source to destination (Motorola operand order); flags depend on variant
0000169c | 4aaf0024                 | tst.l        $24(a7)                             ; machine operation; verify instruction and data boundaries
000016a0 | 660c                     | bne.b        $16ae                               ; branch according to condition flags (bra unconditional, bsr call)
000016a2 | 1282                     | move.b       d2, (a1)                            ; copy source to destination (Motorola operand order); flags depend on variant
000016a4 | 13450001                 | move.b       d5, $1(a1)                          ; copy source to destination (Motorola operand order); flags depend on variant
000016a8 | 70fe                     | moveq        #$fe, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000016aa | 600000c6                 | bra.w        $1772                               ; branch according to condition flags (bra unconditional, bsr call)
000016ae | 0c050010                 | cmpi.b       #$10, d5                            ; compare operands; set condition flags
000016b2 | 6c2a                     | bge.b        $16de                               ; branch according to condition flags (bra unconditional, bsr call)
000016b4 | 1005                     | move.b       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000016b6 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
000016b8 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000016ba | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000016bc | 41edfcc8                 | lea.l        -$338(a5), a0                       ; machine operation; verify instruction and data boundaries
000016c0 | 2e300800                 | move.l       (a0, d0.l), d7                      ; copy source to destination (Motorola operand order); flags depend on variant
000016c4 | 6718                     | beq.b        $16de                               ; branch according to condition flags (bra unconditional, bsr call)
000016c6 | 5286                     | addq.l       #$1, d6                             ; arithmetic operation; flags depend on variant
000016c8 | 0c8600000ff0             | cmpi.l       #$ff0, d6                           ; compare operands; set condition flags
000016ce | 640e                     | bcc.b        $16de                               ; branch according to condition flags (bra unconditional, bsr call)
000016d0 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000016d2 | 1013                     | move.b       (a3), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000016d4 | d080                     | add.l        d0, d0                              ; arithmetic operation; flags depend on variant
000016d6 | 2047                     | movea.l      d7, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000016d8 | 38300800                 | move.w       (a0, d0.l), d4                      ; copy source to destination (Motorola operand order); flags depend on variant
000016dc | 660c                     | bne.b        $16ea                               ; branch according to condition flags (bra unconditional, bsr call)
000016de | 7024                     | moveq        #$24, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000016e0 | 2b40f848                 | move.l       d0, -$7b8(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
000016e4 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000016e6 | 6000008a                 | bra.w        $1772                               ; branch according to condition flags (bra unconditional, bsr call)
000016ea | 3a04                     | move.w       d4, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
000016ec | 028500000f00             | andi.l       #$f00, d5                           ; bit/integer operation; flags depend on variant
000016f2 | e085                     | asr.l        #$8, d5                             ; bit/integer operation; flags depend on variant
000016f4 | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000016f6 | 028000008000             | andi.l       #$8000, d0                          ; bit/integer operation; flags depend on variant
000016fc | 6718                     | beq.b        $1716                               ; branch according to condition flags (bra unconditional, bsr call)
000016fe | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001700 | 0280000000ff             | andi.l       #$ff, d0                            ; bit/integer operation; flags depend on variant
00001706 | 1202                     | move.b       d2, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00001708 | 4881                     | ext.w        d1                                  ; bit/integer operation; flags depend on variant
0000170a | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000170c | 0281ffffff00             | andi.l       #$ffffff00, d1                      ; bit/integer operation; flags depend on variant
00001712 | 8280                     | or.l         d0, d1                              ; bit/integer operation; flags depend on variant
00001714 | 1401                     | move.b       d1, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
00001716 | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001718 | 028000001000             | andi.l       #$1000, d0                          ; bit/integer operation; flags depend on variant
0000171e | 6718                     | beq.b        $1738                               ; branch according to condition flags (bra unconditional, bsr call)
00001720 | 1002                     | move.b       d2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001722 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00001724 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001726 | 0280000000ff             | andi.l       #$ff, d0                            ; bit/integer operation; flags depend on variant
0000172c | 1202                     | move.b       d2, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
0000172e | 4881                     | ext.w        d1                                  ; bit/integer operation; flags depend on variant
00001730 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001732 | e189                     | lsl.l        #$8, d1                             ; bit/integer operation; flags depend on variant
00001734 | 8280                     | or.l         d0, d1                              ; bit/integer operation; flags depend on variant
00001736 | 1401                     | move.b       d1, d2                              ; copy source to destination (Motorola operand order); flags depend on variant
00001738 | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000173a | 028000004000             | andi.l       #$4000, d0                          ; bit/integer operation; flags depend on variant
00001740 | 670c                     | beq.b        $174e                               ; branch according to condition flags (bra unconditional, bsr call)
00001742 | 4a13                     | tst.b        (a3)                                ; machine operation; verify instruction and data boundaries
00001744 | 6708                     | beq.b        $174e                               ; branch according to condition flags (bra unconditional, bsr call)
00001746 | 528b                     | addq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
00001748 | 53af0024                 | subq.l       #$1, $24(a7)                        ; arithmetic operation; flags depend on variant
0000174c | 7c00                     | moveq        #$0, d6                             ; copy source to destination (Motorola operand order); flags depend on variant
0000174e | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001750 | 028000002000             | andi.l       #$2000, d0                          ; bit/integer operation; flags depend on variant
00001756 | 6700ff44                 | beq.w        $169c                               ; branch according to condition flags (bra unconditional, bsr call)
0000175a | 4aaf001c                 | tst.l        $1c(a7)                             ; machine operation; verify instruction and data boundaries
0000175e | 6706                     | beq.b        $1766                               ; branch according to condition flags (bra unconditional, bsr call)
00001760 | 206f001c                 | movea.l      $1c(a7), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001764 | 1082                     | move.b       d2, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
00001766 | 1282                     | move.b       d2, (a1)                            ; copy source to destination (Motorola operand order); flags depend on variant
00001768 | 13450001                 | move.b       d5, $1(a1)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000176c | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000176e | 91cc                     | suba.l       a4, a0                              ; arithmetic operation; flags depend on variant
00001770 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001772 | 4cdf18f0                 | movem.l      (a7)+, d4-d7/a3-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
00001776 | 4e75                     | rts                                              ; return: pop return address from stack
00001778 | 48e71f38                 | movem.l      d3-d7/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000177c | 182f0028                 | move.b       $28(a7), d4                         ; copy source to destination (Motorola operand order); flags depend on variant
00001780 | 266f002a                 | movea.l      $2a(a7), a3                         ; copy source to destination (Motorola operand order); flags depend on variant
00001784 | 4aaf0024                 | tst.l        $24(a7)                             ; machine operation; verify instruction and data boundaries
00001788 | 6614                     | bne.b        $179e                               ; branch according to condition flags (bra unconditional, bsr call)
0000178a | 36adf92e                 | move.w       -$6d2(a5), (a3)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000178e | 206dfcc8                 | movea.l      -$338(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00001792 | 3010                     | move.w       (a0), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001794 | 028000000f00             | andi.l       #$f00, d0                           ; bit/integer operation; flags depend on variant
0000179a | 600000f2                 | bra.w        $188e                               ; branch according to condition flags (bra unconditional, bsr call)
0000179e | 1a2b0001                 | move.b       $1(a3), d5                          ; copy source to destination (Motorola operand order); flags depend on variant
000017a2 | 7e00                     | moveq        #$0, d7                             ; copy source to destination (Motorola operand order); flags depend on variant
000017a4 | 95ca                     | suba.l       a2, a2                              ; arithmetic operation; flags depend on variant
000017a6 | 7c00                     | moveq        #$0, d6                             ; copy source to destination (Motorola operand order); flags depend on variant
000017a8 | 0c050010                 | cmpi.b       #$10, d5                            ; compare operands; set condition flags
000017ac | 6c3c                     | bge.b        $17ea                               ; branch according to condition flags (bra unconditional, bsr call)
000017ae | 1005                     | move.b       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000017b0 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
000017b2 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000017b4 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000017b6 | 41edfd08                 | lea.l        -$2f8(a5), a0                       ; machine operation; verify instruction and data boundaries
000017ba | 28700800                 | movea.l      (a0, d0.l), a4                      ; copy source to destination (Motorola operand order); flags depend on variant
000017be | 200c                     | move.l       a4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000017c0 | 6728                     | beq.b        $17ea                               ; branch according to condition flags (bra unconditional, bsr call)
000017c2 | 102dfcc6                 | move.b       -$33a(a5), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
000017c6 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
000017c8 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000017ca | b086                     | cmp.l        d6, d0                              ; compare operands; set condition flags
000017cc | 6f1c                     | ble.b        $17ea                               ; branch according to condition flags (bra unconditional, bsr call)
000017ce | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
000017d0 | b4fc0ff0                 | cmpa.w       #$ff0, a2                           ; compare operands; set condition flags
000017d4 | 6414                     | bcc.b        $17ea                               ; branch according to condition flags (bra unconditional, bsr call)
000017d6 | 1004                     | move.b       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000017d8 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
000017da | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000017dc | 0280000000ff             | andi.l       #$ff, d0                            ; bit/integer operation; flags depend on variant
000017e2 | d080                     | add.l        d0, d0                              ; arithmetic operation; flags depend on variant
000017e4 | 36340800                 | move.w       (a4, d0.l), d3                      ; copy source to destination (Motorola operand order); flags depend on variant
000017e8 | 660c                     | bne.b        $17f6                               ; branch according to condition flags (bra unconditional, bsr call)
000017ea | 7024                     | moveq        #$24, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000017ec | 2b40f848                 | move.l       d0, -$7b8(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
000017f0 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000017f2 | 6000009a                 | bra.w        $188e                               ; branch according to condition flags (bra unconditional, bsr call)
000017f6 | 3a03                     | move.w       d3, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
000017f8 | 028500000f00             | andi.l       #$f00, d5                           ; bit/integer operation; flags depend on variant
000017fe | e085                     | asr.l        #$8, d5                             ; bit/integer operation; flags depend on variant
00001800 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001802 | 028000008000             | andi.l       #$8000, d0                          ; bit/integer operation; flags depend on variant
00001808 | 6718                     | beq.b        $1822                               ; branch according to condition flags (bra unconditional, bsr call)
0000180a | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000180c | 0280000000ff             | andi.l       #$ff, d0                            ; bit/integer operation; flags depend on variant
00001812 | 1204                     | move.b       d4, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00001814 | 4881                     | ext.w        d1                                  ; bit/integer operation; flags depend on variant
00001816 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00001818 | 0281ffffff00             | andi.l       #$ffffff00, d1                      ; bit/integer operation; flags depend on variant
0000181e | 8280                     | or.l         d0, d1                              ; bit/integer operation; flags depend on variant
00001820 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00001822 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001824 | 028000001000             | andi.l       #$1000, d0                          ; bit/integer operation; flags depend on variant
0000182a | 6718                     | beq.b        $1844                               ; branch according to condition flags (bra unconditional, bsr call)
0000182c | 1004                     | move.b       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000182e | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00001830 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001832 | 0280000000ff             | andi.l       #$ff, d0                            ; bit/integer operation; flags depend on variant
00001838 | 1204                     | move.b       d4, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
0000183a | 4881                     | ext.w        d1                                  ; bit/integer operation; flags depend on variant
0000183c | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000183e | e189                     | lsl.l        #$8, d1                             ; bit/integer operation; flags depend on variant
00001840 | 8280                     | or.l         d0, d1                              ; bit/integer operation; flags depend on variant
00001842 | 1801                     | move.b       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00001844 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001846 | 028000002000             | andi.l       #$2000, d0                          ; bit/integer operation; flags depend on variant
0000184c | 672a                     | beq.b        $1878                               ; branch according to condition flags (bra unconditional, bsr call)
0000184e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001850 | 0280000000ff             | andi.l       #$ff, d0                            ; bit/integer operation; flags depend on variant
00001856 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00001858 | 6608                     | bne.b        $1862                               ; branch according to condition flags (bra unconditional, bsr call)
0000185a | 1004                     | move.b       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000185c | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
0000185e | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001860 | 6004                     | bra.b        $1866                               ; branch according to condition flags (bra unconditional, bsr call)
00001862 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001864 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001866 | 2206                     | move.l       d6, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00001868 | 5286                     | addq.l       #$1, d6                             ; arithmetic operation; flags depend on variant
0000186a | 206f0024                 | movea.l      $24(a7), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000186e | 11801800                 | move.b       d0, (a0, d1.l)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001872 | 6602                     | bne.b        $1876                               ; branch according to condition flags (bra unconditional, bsr call)
00001874 | 7e01                     | moveq        #$1, d7                             ; copy source to destination (Motorola operand order); flags depend on variant
00001876 | 95ca                     | suba.l       a2, a2                              ; arithmetic operation; flags depend on variant
00001878 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000187a | 028000004000             | andi.l       #$4000, d0                          ; bit/integer operation; flags depend on variant
00001880 | 6606                     | bne.b        $1888                               ; branch according to condition flags (bra unconditional, bsr call)
00001882 | 4a87                     | tst.l        d7                                  ; machine operation; verify instruction and data boundaries
00001884 | 6700ff22                 | beq.w        $17a8                               ; branch according to condition flags (bra unconditional, bsr call)
00001888 | 17450001                 | move.b       d5, $1(a3)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000188c | 2006                     | move.l       d6, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000188e | 4cdf1cf8                 | movem.l      (a7)+, d3-d7/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
00001892 | 4e75                     | rts                                              ; return: pop return address from stack
00001894 | 222f000c                 | move.l       $c(a7), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
00001898 | 102f000b                 | move.b       $b(a7), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000189c | 206f0004                 | movea.l      $4(a7), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000018a0 | 600a                     | bra.b        $18ac                               ; branch according to condition flags (bra unconditional, bsr call)
000018a2 | b010                     | cmp.b        (a0), d0                            ; compare operands; set condition flags
000018a4 | 6602                     | bne.b        $18a8                               ; branch according to condition flags (bra unconditional, bsr call)
000018a6 | 4e75                     | rts                                              ; return: pop return address from stack
000018a8 | 5288                     | addq.l       #$1, a0                             ; arithmetic operation; flags depend on variant
000018aa | 5381                     | subq.l       #$1, d1                             ; arithmetic operation; flags depend on variant
000018ac | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
000018ae | 66f2                     | bne.b        $18a2                               ; branch according to condition flags (bra unconditional, bsr call)
000018b0 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
000018b2 | 4e75                     | rts                                              ; return: pop return address from stack
000018b4 | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000018b6 | 286f0008                 | movea.l      $8(a7), a4                          ; copy source to destination (Motorola operand order); flags depend on variant
000018ba | 226f000c                 | movea.l      $c(a7), a1                          ; copy source to destination (Motorola operand order); flags depend on variant
000018be | 204c                     | movea.l      a4, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000018c0 | 6002                     | bra.b        $18c4                               ; branch according to condition flags (bra unconditional, bsr call)
000018c2 | 5288                     | addq.l       #$1, a0                             ; arithmetic operation; flags depend on variant
000018c4 | 4a10                     | tst.b        (a0)                                ; machine operation; verify instruction and data boundaries
000018c6 | 66fa                     | bne.b        $18c2                               ; branch according to condition flags (bra unconditional, bsr call)
000018c8 | 6004                     | bra.b        $18ce                               ; branch according to condition flags (bra unconditional, bsr call)
000018ca | 5288                     | addq.l       #$1, a0                             ; arithmetic operation; flags depend on variant
000018cc | 5289                     | addq.l       #$1, a1                             ; arithmetic operation; flags depend on variant
000018ce | 1091                     | move.b       (a1), (a0)                          ; copy source to destination (Motorola operand order); flags depend on variant
000018d0 | 66f8                     | bne.b        $18ca                               ; branch according to condition flags (bra unconditional, bsr call)
000018d2 | 204c                     | movea.l      a4, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000018d4 | 285f                     | movea.l      (a7)+, a4                           ; copy source to destination (Motorola operand order); flags depend on variant
000018d6 | 4e75                     | rts                                              ; return: pop return address from stack
000018d8 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000018da | 206f0006                 | movea.l      $6(a7), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000018de | 1f6f000d0001             | move.b       $d(a7), $1(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000018e4 | 600c                     | bra.b        $18f2                               ; branch according to condition flags (bra unconditional, bsr call)
000018e6 | 4a10                     | tst.b        (a0)                                ; machine operation; verify instruction and data boundaries
000018e8 | 6606                     | bne.b        $18f0                               ; branch according to condition flags (bra unconditional, bsr call)
000018ea | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
000018ec | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000018ee | 4e75                     | rts                                              ; return: pop return address from stack
000018f0 | 5288                     | addq.l       #$1, a0                             ; arithmetic operation; flags depend on variant
000018f2 | 1010                     | move.b       (a0), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000018f4 | b02f0001                 | cmp.b        $1(a7), d0                          ; compare operands; set condition flags
000018f8 | 66ec                     | bne.b        $18e6                               ; branch according to condition flags (bra unconditional, bsr call)
000018fa | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000018fc | 4e75                     | rts                                              ; return: pop return address from stack
000018fe | 4e56ff48                 | link.w       a6, #$ff48                          ; establish stack frame
00001902 | 48e71800                 | movem.l      d3-d4, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001906 | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
0000190a | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
0000190c | 6d0a                     | blt.b        $1918                               ; branch according to condition flags (bra unconditional, bsr call)
0000190e | 7002                     | moveq        #$2, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001910 | b880                     | cmp.l        d0, d4                              ; compare operands; set condition flags
00001912 | 6e04                     | bgt.b        $1918                               ; branch according to condition flags (bra unconditional, bsr call)
00001914 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001916 | 605c                     | bra.b        $1974                               ; branch according to condition flags (bra unconditional, bsr call)
00001918 | 426eff64                 | clr.w        -$9c(a6)                            ; bit/integer operation; flags depend on variant
0000191c | 3d44ff60                 | move.w       d4, -$a0(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001920 | 42aeff5a                 | clr.l        -$a6(a6)                            ; bit/integer operation; flags depend on variant
00001924 | 41eeff48                 | lea.l        -$b8(a6), a0                        ; machine operation; verify instruction and data boundaries
00001928 | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000192a | a260                     | dc.w         $a260                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000192c | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000192e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001930 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001932 | 6628                     | bne.b        $195c                               ; branch according to condition flags (bra unconditional, bsr call)
00001934 | 3d6eff5eff9c             | move.w       -$a2(a6), -$64(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000193a | 3d44ff9e                 | move.w       d4, -$62(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000193e | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00001942 | a001                     | dc.w         $a001                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001944 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001946 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001948 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000194a | 6610                     | bne.b        $195c                               ; branch according to condition flags (bra unconditional, bsr call)
0000194c | 42aeff98                 | clr.l        -$68(a6)                            ; bit/integer operation; flags depend on variant
00001950 | 3d6eff5eff9c             | move.w       -$a2(a6), -$64(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00001956 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
0000195a | a013                     | dc.w         $a013                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000195c | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000195e | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001960 | 6708                     | beq.b        $196a                               ; branch according to condition flags (bra unconditional, bsr call)
00001962 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001964 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001966 | 2b40f848                 | move.l       d0, -$7b8(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000196a | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
0000196c | 6704                     | beq.b        $1972                               ; branch according to condition flags (bra unconditional, bsr call)
0000196e | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001970 | 6002                     | bra.b        $1974                               ; branch according to condition flags (bra unconditional, bsr call)
00001972 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001974 | 4cdf0018                 | movem.l      (a7)+, d3-d4                        ; copy source to destination (Motorola operand order); flags depend on variant
00001978 | 4e5e                     | unlk         a6                                  ; restore stack frame
0000197a | 4e75                     | rts                                              ; return: pop return address from stack
0000197c | 4e56ffce                 | link.w       a6, #$ffce                          ; establish stack frame
00001980 | 48e71e00                 | movem.l      d3-d6, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001984 | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
00001988 | 2a2e000c                 | move.l       $c(a6), d5                          ; copy source to destination (Motorola operand order); flags depend on variant
0000198c | 2c2e0010                 | move.l       $10(a6), d6                         ; copy source to destination (Motorola operand order); flags depend on variant
00001990 | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
00001992 | 6d0c                     | blt.b        $19a0                               ; branch according to condition flags (bra unconditional, bsr call)
00001994 | 7002                     | moveq        #$2, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001996 | b880                     | cmp.l        d0, d4                              ; compare operands; set condition flags
00001998 | 6e06                     | bgt.b        $19a0                               ; branch according to condition flags (bra unconditional, bsr call)
0000199a | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000199c | 600000ec                 | bra.w        $1a8a                               ; branch according to condition flags (bra unconditional, bsr call)
000019a0 | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000019a4 | 2d45fffc                 | move.l       d5, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
000019a8 | 2006                     | move.l       d6, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000019aa | 670a                     | beq.b        $19b6                               ; branch according to condition flags (bra unconditional, bsr call)
000019ac | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000019ae | 670e                     | beq.b        $19be                               ; branch according to condition flags (bra unconditional, bsr call)
000019b0 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000019b2 | 6712                     | beq.b        $19c6                               ; branch according to condition flags (bra unconditional, bsr call)
000019b4 | 6016                     | bra.b        $19cc                               ; branch according to condition flags (bra unconditional, bsr call)
000019b6 | 3d7c0001fffa             | move.w       #$1, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000019bc | 600e                     | bra.b        $19cc                               ; branch according to condition flags (bra unconditional, bsr call)
000019be | 3d7c0003fffa             | move.w       #$3, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000019c4 | 6006                     | bra.b        $19cc                               ; branch according to condition flags (bra unconditional, bsr call)
000019c6 | 3d7c0002fffa             | move.w       #$2, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000019cc | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
000019d0 | a044                     | dc.w         $a044                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000019d2 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000019d4 | 0c43ffd9                 | cmpi.w       #$ffd9, d3                          ; compare operands; set condition flags
000019d8 | 66000096                 | bne.w        $1a70                               ; branch according to condition flags (bra unconditional, bsr call)
000019dc | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000019e0 | 2006                     | move.l       d6, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000019e2 | 670a                     | beq.b        $19ee                               ; branch according to condition flags (bra unconditional, bsr call)
000019e4 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000019e6 | 670c                     | beq.b        $19f4                               ; branch according to condition flags (bra unconditional, bsr call)
000019e8 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000019ea | 6726                     | beq.b        $1a12                               ; branch according to condition flags (bra unconditional, bsr call)
000019ec | 6040                     | bra.b        $1a2e                               ; branch according to condition flags (bra unconditional, bsr call)
000019ee | 2d45ffea                 | move.l       d5, -$16(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000019f2 | 603a                     | bra.b        $1a2e                               ; branch according to condition flags (bra unconditional, bsr call)
000019f4 | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
000019f8 | a018                     | dc.w         $a018                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000019fa | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000019fc | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000019fe | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001a00 | 662c                     | bne.b        $1a2e                               ; branch according to condition flags (bra unconditional, bsr call)
00001a02 | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a06 | 202efffc                 | move.l       -$4(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001a0a | d085                     | add.l        d5, d0                              ; arithmetic operation; flags depend on variant
00001a0c | 2d40ffea                 | move.l       d0, -$16(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a10 | 601c                     | bra.b        $1a2e                               ; branch according to condition flags (bra unconditional, bsr call)
00001a12 | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00001a16 | a011                     | dc.w         $a011                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001a18 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001a1a | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001a1c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001a1e | 660e                     | bne.b        $1a2e                               ; branch according to condition flags (bra unconditional, bsr call)
00001a20 | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a24 | 206effea                 | movea.l      -$16(a6), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a28 | d1c5                     | adda.l       d5, a0                              ; arithmetic operation; flags depend on variant
00001a2a | 2d48ffea                 | move.l       a0, -$16(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a2e | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00001a32 | a012                     | dc.w         $a012                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001a34 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001a36 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001a38 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001a3a | 6634                     | bne.b        $1a70                               ; branch according to condition flags (bra unconditional, bsr call)
00001a3c | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a40 | 2d45fffc                 | move.l       d5, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00001a44 | 2006                     | move.l       d6, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001a46 | 670a                     | beq.b        $1a52                               ; branch according to condition flags (bra unconditional, bsr call)
00001a48 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00001a4a | 670e                     | beq.b        $1a5a                               ; branch according to condition flags (bra unconditional, bsr call)
00001a4c | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00001a4e | 6712                     | beq.b        $1a62                               ; branch according to condition flags (bra unconditional, bsr call)
00001a50 | 6016                     | bra.b        $1a68                               ; branch according to condition flags (bra unconditional, bsr call)
00001a52 | 3d7c0001fffa             | move.w       #$1, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a58 | 600e                     | bra.b        $1a68                               ; branch according to condition flags (bra unconditional, bsr call)
00001a5a | 3d7c0003fffa             | move.w       #$3, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a60 | 6006                     | bra.b        $1a68                               ; branch according to condition flags (bra unconditional, bsr call)
00001a62 | 3d7c0002fffa             | move.w       #$2, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a68 | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00001a6c | a044                     | dc.w         $a044                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001a6e | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001a70 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001a72 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001a74 | 6708                     | beq.b        $1a7e                               ; branch according to condition flags (bra unconditional, bsr call)
00001a76 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001a78 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001a7a | 2b40f848                 | move.l       d0, -$7b8(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001a7e | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00001a80 | 6704                     | beq.b        $1a86                               ; branch according to condition flags (bra unconditional, bsr call)
00001a82 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001a84 | 6004                     | bra.b        $1a8a                               ; branch according to condition flags (bra unconditional, bsr call)
00001a86 | 202efffc                 | move.l       -$4(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001a8a | 4cdf0078                 | movem.l      (a7)+, d3-d6                        ; copy source to destination (Motorola operand order); flags depend on variant
00001a8e | 4e5e                     | unlk         a6                                  ; restore stack frame
00001a90 | 4e75                     | rts                                              ; return: pop return address from stack
00001a92 | 4e56feb0                 | link.w       a6, #$feb0                          ; establish stack frame
00001a96 | 48e71030                 | movem.l      d3/a2-a3, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001a9a | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00001a9e | 45eeff00                 | lea.l        -$100(a6), a2                       ; machine operation; verify instruction and data boundaries
00001aa2 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00001aa4 | 6002                     | bra.b        $1aa8                               ; branch according to condition flags (bra unconditional, bsr call)
00001aa6 | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
00001aa8 | 4a13                     | tst.b        (a3)                                ; machine operation; verify instruction and data boundaries
00001aaa | 66fa                     | bne.b        $1aa6                               ; branch according to condition flags (bra unconditional, bsr call)
00001aac | 4212                     | clr.b        (a2)                                ; bit/integer operation; flags depend on variant
00001aae | 41eeff00                 | lea.l        -$100(a6), a0                       ; machine operation; verify instruction and data boundaries
00001ab2 | 224a                     | movea.l      a2, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00001ab4 | 93c8                     | suba.l       a0, a1                              ; arithmetic operation; flags depend on variant
00001ab6 | 5389                     | subq.l       #$1, a1                             ; arithmetic operation; flags depend on variant
00001ab8 | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001aba | 1d40ff00                 | move.b       d0, -$100(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001abe | 2d48fec2                 | move.l       a0, -$13e(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001ac2 | 426efec6                 | clr.w        -$13a(a6)                           ; bit/integer operation; flags depend on variant
00001ac6 | 422efeca                 | clr.b        -$136(a6)                           ; bit/integer operation; flags depend on variant
00001aca | 41eefeb0                 | lea.l        -$150(a6), a0                       ; machine operation; verify instruction and data boundaries
00001ace | a009                     | dc.w         $a009                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001ad0 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001ad2 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001ad4 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001ad6 | 6708                     | beq.b        $1ae0                               ; branch according to condition flags (bra unconditional, bsr call)
00001ad8 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001ada | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001adc | 2b40f848                 | move.l       d0, -$7b8(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001ae0 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00001ae2 | 6704                     | beq.b        $1ae8                               ; branch according to condition flags (bra unconditional, bsr call)
00001ae4 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001ae6 | 6002                     | bra.b        $1aea                               ; branch according to condition flags (bra unconditional, bsr call)
00001ae8 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001aea | 4cdf0c08                 | movem.l      (a7)+, d3/a2-a3                     ; copy source to destination (Motorola operand order); flags depend on variant
00001aee | 4e5e                     | unlk         a6                                  ; restore stack frame
00001af0 | 4e75                     | rts                                              ; return: pop return address from stack
00001af2 | 4e56ffce                 | link.w       a6, #$ffce                          ; establish stack frame
00001af6 | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001afa | 262e0008                 | move.l       $8(a6), d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00001afe | 246e000c                 | movea.l      $c(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00001b02 | 282e0010                 | move.l       $10(a6), d4                         ; copy source to destination (Motorola operand order); flags depend on variant
00001b06 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001b08 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00001b0a | 6706                     | beq.b        $1b12                               ; branch according to condition flags (bra unconditional, bsr call)
00001b0c | 7002                     | moveq        #$2, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001b0e | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00001b10 | 662c                     | bne.b        $1b3e                               ; branch according to condition flags (bra unconditional, bsr call)
00001b12 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001b14 | 4eb9000026fa             | jsr          $26fa.l                             ; call subroutine; push return address
00001b1a | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00001b1c | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001b1e | 661a                     | bne.b        $1b3a                               ; branch according to condition flags (bra unconditional, bsr call)
00001b20 | 486dfdca                 | pea.l        -$236(a5)                           ; machine operation; verify instruction and data boundaries
00001b24 | 4eb900000342             | jsr          $342.l                              ; call subroutine; push return address
00001b2a | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001b2c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001b2e | 4eb90000284e             | jsr          $284e.l                             ; call subroutine; push return address
00001b34 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00001b38 | 603e                     | bra.b        $1b78                               ; branch according to condition flags (bra unconditional, bsr call)
00001b3a | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001b3c | 603a                     | bra.b        $1b78                               ; branch according to condition flags (bra unconditional, bsr call)
00001b3e | 3d43ffe6                 | move.w       d3, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001b42 | 2d4affee                 | move.l       a2, -$12(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00001b46 | 2d44fff2                 | move.l       d4, -$e(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00001b4a | 426efffa                 | clr.w        -$6(a6)                             ; bit/integer operation; flags depend on variant
00001b4e | 42aefffc                 | clr.l        -$4(a6)                             ; bit/integer operation; flags depend on variant
00001b52 | 426effe4                 | clr.w        -$1c(a6)                            ; bit/integer operation; flags depend on variant
00001b56 | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00001b5a | a003                     | dc.w         $a003                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001b5c | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001b5e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001b60 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001b62 | 6708                     | beq.b        $1b6c                               ; branch according to condition flags (bra unconditional, bsr call)
00001b64 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001b66 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001b68 | 2b40f848                 | move.l       d0, -$7b8(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001b6c | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00001b6e | 6704                     | beq.b        $1b74                               ; branch according to condition flags (bra unconditional, bsr call)
00001b70 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001b72 | 6004                     | bra.b        $1b78                               ; branch according to condition flags (bra unconditional, bsr call)
00001b74 | 202efff6                 | move.l       -$a(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001b78 | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00001b7c | 4e5e                     | unlk         a6                                  ; restore stack frame
00001b7e | 4e75                     | rts                                              ; return: pop return address from stack
00001b80 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001b84 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001b88 | 4eb900000098             | jsr          $98.l                               ; call subroutine; push return address
00001b8e | 4e5e                     | unlk         a6                                  ; restore stack frame
00001b90 | 4e75                     | rts                                              ; return: pop return address from stack
00001b92 | 4e56fff8                 | link.w       a6, #$fff8                          ; establish stack frame
00001b96 | 422dfffc                 | clr.b        -$4(a5)                             ; bit/integer operation; flags depend on variant
00001b9a | 303ca89f                 | move.w       #$a89f, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001b9e | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001ba0 | 2d48fff8                 | move.l       a0, -$8(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00001ba4 | 303ca1ad                 | move.w       #$a1ad, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001ba8 | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001baa | b1eefff8                 | cmpa.l       -$8(a6), a0                         ; compare operands; set condition flags
00001bae | 672c                     | beq.b        $1bdc                               ; branch according to condition flags (bra unconditional, bsr call)
00001bb0 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001bb2 | 2f3c73797376             | move.l       #$73797376, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00001bb8 | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
00001bbc | 4eb900000058             | jsr          $58.l                               ; call subroutine; push return address
00001bc2 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001bc4 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001bc6 | 6614                     | bne.b        $1bdc                               ; branch according to condition flags (bra unconditional, bsr call)
00001bc8 | 0cae00000700fffc         | cmpi.l       #$700, -$4(a6)                      ; compare operands; set condition flags
00001bd0 | 5cc0                     | sge.b        d0                                  ; machine operation; verify instruction and data boundaries
00001bd2 | 4400                     | neg.b        d0                                  ; machine operation; verify instruction and data boundaries
00001bd4 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00001bd6 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001bd8 | 1b40fffc                 | move.b       d0, -$4(a5)                         ; copy source to destination (Motorola operand order); flags depend on variant
00001bdc | 4e5e                     | unlk         a6                                  ; restore stack frame
00001bde | 4e75                     | rts                                              ; return: pop return address from stack
00001be0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001be4 | 48e71838                 | movem.l      d3-d4/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00001be8 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00001bec | 286e000c                 | movea.l      $c(a6), a4                          ; copy source to destination (Motorola operand order); flags depend on variant
00001bf0 | 282e0010                 | move.l       $10(a6), d4                         ; copy source to destination (Motorola operand order); flags depend on variant
00001bf4 | 3013                     | move.w       (a3), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001bf6 | 7220                     | moveq        #$20, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001bf8 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00001bfa | 6626                     | bne.b        $1c22                               ; branch according to condition flags (bra unconditional, bsr call)
00001bfc | 2604                     | move.l       d4, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001bfe | 244c                     | movea.l      a4, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00001c00 | 6018                     | bra.b        $1c1a                               ; branch according to condition flags (bra unconditional, bsr call)
00001c02 | 0c12000a                 | cmpi.b       #$a, (a2)                           ; compare operands; set condition flags
00001c06 | 6606                     | bne.b        $1c0e                               ; branch according to condition flags (bra unconditional, bsr call)
00001c08 | 14bc000d                 | move.b       #$d, (a2)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001c0c | 600a                     | bra.b        $1c18                               ; branch according to condition flags (bra unconditional, bsr call)
00001c0e | 0c12000d                 | cmpi.b       #$d, (a2)                           ; compare operands; set condition flags
00001c12 | 6604                     | bne.b        $1c18                               ; branch according to condition flags (bra unconditional, bsr call)
00001c14 | 14bc000a                 | move.b       #$a, (a2)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001c18 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00001c1a | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001c1c | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00001c1e | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00001c20 | 66e0                     | bne.b        $1c02                               ; branch according to condition flags (bra unconditional, bsr call)
00001c22 | 3013                     | move.w       (a3), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001c24 | 7204                     | moveq        #$4, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00001c26 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00001c28 | 6720                     | beq.b        $1c4a                               ; branch according to condition flags (bra unconditional, bsr call)
00001c2a | 48780002                 | pea.l        $2.w                                ; machine operation; verify instruction and data boundaries
00001c2e | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00001c30 | 302b0002                 | move.w       $2(a3), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001c34 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001c36 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001c38 | 4eb90000197c             | jsr          $197c.l                             ; call subroutine; push return address
00001c3e | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00001c40 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00001c44 | 6604                     | bne.b        $1c4a                               ; branch according to condition flags (bra unconditional, bsr call)
00001c46 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001c48 | 6016                     | bra.b        $1c60                               ; branch according to condition flags (bra unconditional, bsr call)
00001c4a | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001c4c | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001c4e | 302b0002                 | move.w       $2(a3), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001c52 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00001c54 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001c56 | 4eb900001af2             | jsr          $1af2.l                             ; call subroutine; push return address
00001c5c | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00001c60 | 4cdf1c18                 | movem.l      (a7)+, d3-d4/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
00001c64 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001c66 | 4e75                     | rts                                              ; return: pop return address from stack
00001c68 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001c6c | 486dd48c                 | pea.l        -$2b74(a5)                          ; machine operation; verify instruction and data boundaries
00001c70 | a86e                     | dc.w         $a86e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c72 | a8fe                     | dc.w         $a8fe                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c74 | 2f3c0000ffff             | move.l       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001c7a | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001c7c | a032                     | dc.w         $a032                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c7e | a912                     | dc.w         $a912                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c80 | a930                     | dc.w         $a930                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c82 | a9cc                     | dc.w         $a9cc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c84 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00001c86 | a97b                     | dc.w         $a97b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c88 | a850                     | dc.w         $a850                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c8a | a063                     | dc.w         $a063                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c8c | a036                     | dc.w         $a036                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001c8e | 13fc0001000008f0         | move.b       #$1, $8f0.l                         ; copy source to destination (Motorola operand order); flags depend on variant
00001c96 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001c98 | 4e75                     | rts                                              ; return: pop return address from stack
00001c9a | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001c9e | 48e71038                 | movem.l      d3/a2-a4, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001ca2 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00001ca6 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001cac | b1f9000008fc             | cmpa.l       $8fc.l, a0                          ; compare operands; set condition flags
00001cb2 | 6724                     | beq.b        $1cd8                               ; branch according to condition flags (bra unconditional, bsr call)
00001cb4 | 2879000008fc             | movea.l      $8fc.l, a4                          ; copy source to destination (Motorola operand order); flags depend on variant
00001cba | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00001cbc | 538a                     | subq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00001cbe | 6014                     | bra.b        $1cd4                               ; branch according to condition flags (bra unconditional, bsr call)
00001cc0 | 0c12000d                 | cmpi.b       #$d, (a2)                           ; compare operands; set condition flags
00001cc4 | 660c                     | bne.b        $1cd2                               ; branch according to condition flags (bra unconditional, bsr call)
00001cc6 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001ccc | 91ca                     | suba.l       a2, a0                              ; arithmetic operation; flags depend on variant
00001cce | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001cd0 | 6062                     | bra.b        $1d34                               ; branch according to condition flags (bra unconditional, bsr call)
00001cd2 | 538a                     | subq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00001cd4 | b5cc                     | cmpa.l       a4, a2                              ; compare operands; set condition flags
00001cd6 | 62e8                     | bhi.b        $1cc0                               ; branch according to condition flags (bra unconditional, bsr call)
00001cd8 | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001cda | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001cdc | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001cde | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001ce2 | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001ce4 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001ce6 | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001cea | 2610                     | move.l       (a0), d3                            ; copy source to destination (Motorola operand order); flags depend on variant
00001cec | 2843                     | movea.l      d3, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
00001cee | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001cf0 | 2443                     | movea.l      d3, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00001cf2 | d4e80020                 | adda.w       $20(a0), a2                         ; arithmetic operation; flags depend on variant
00001cf6 | 6002                     | bra.b        $1cfa                               ; branch according to condition flags (bra unconditional, bsr call)
00001cf8 | 538a                     | subq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00001cfa | b5cc                     | cmpa.l       a4, a2                              ; compare operands; set condition flags
00001cfc | 6308                     | bls.b        $1d06                               ; branch according to condition flags (bra unconditional, bsr call)
00001cfe | 0c2a000dffff             | cmpi.b       #$d, -$1(a2)                        ; compare operands; set condition flags
00001d04 | 66f2                     | bne.b        $1cf8                               ; branch according to condition flags (bra unconditional, bsr call)
00001d06 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001d08 | 2253                     | movea.l      (a3), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001d0a | 2269003e                 | movea.l      $3e(a1), a1                         ; copy source to destination (Motorola operand order); flags depend on variant
00001d0e | 2251                     | movea.l      (a1), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001d10 | d2e80020                 | adda.w       $20(a0), a1                         ; arithmetic operation; flags depend on variant
00001d14 | 93ca                     | suba.l       a2, a1                              ; arithmetic operation; flags depend on variant
00001d16 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001d1c | d1c9                     | adda.l       a1, a0                              ; arithmetic operation; flags depend on variant
00001d1e | 91f9000008fc             | suba.l       $8fc.l, a0                          ; arithmetic operation; flags depend on variant
00001d24 | 2608                     | move.l       a0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001d26 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00001d28 | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001d2c | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001d2e | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001d30 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001d32 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001d34 | 4cdf1c08                 | movem.l      (a7)+, d3/a2-a4                     ; copy source to destination (Motorola operand order); flags depend on variant
00001d38 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001d3a | 4e75                     | rts                                              ; return: pop return address from stack
00001d3c | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00001d40 | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001d44 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00001d48 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001d4a | 2f2a000a                 | move.l       $a(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001d4e | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
00001d52 | a92c                     | dc.w         $a92c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001d54 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001d56 | 3800                     | move.w       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00001d58 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001d5c | 4eb900003824             | jsr          $3824.l                             ; call subroutine; push return address
00001d62 | 1600                     | move.b       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00001d64 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001d66 | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001d68 | 0c400005                 | cmpi.w       #$5, d0                             ; compare operands; set condition flags
00001d6c | 620000d2                 | bhi.w        $1e40                               ; branch according to condition flags (bra unconditional, bsr call)
00001d70 | d040                     | add.w        d0, d0                              ; arithmetic operation; flags depend on variant
00001d72 | 303b0006                 | move.w       $1d7a(pc, d0.w), d0                 ; copy source to destination (Motorola operand order); flags depend on variant
00001d76 | 4efb0002                 | jmp          $1d7a(pc, d0.w)                     ; machine operation; verify instruction and data boundaries
00001d7a | 00c6                     | .word ; undecoded bytes / possible Macintosh A-line trap
00001d7c | 000c                     | .word ; undecoded bytes / possible Macintosh A-line trap
00001d7e | 0036004a0096             | ori.b        #$4a, -$6a(a6, d0.w)                ; bit/integer operation; flags depend on variant
00001d84 | 00ae4a39000003ee         | ori.l        #$4a390000, $3ee(a6)                ; bit/integer operation; flags depend on variant
00001d8c | 670000b2                 | beq.w        $1e40                               ; branch according to condition flags (bra unconditional, bsr call)
00001d90 | 4eb900002dd0             | jsr          $2dd0.l                             ; call subroutine; push return address
00001d96 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001d98 | 2f2a000a                 | move.l       $a(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001d9c | a93d                     | dc.w         $a93d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001d9e | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001da0 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001da2 | 4eb900003298             | jsr          $3298.l                             ; call subroutine; push return address
00001da8 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001daa | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001dac | 60000094                 | bra.w        $1e42                               ; branch according to condition flags (bra unconditional, bsr call)
00001db0 | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
00001db6 | 67000088                 | beq.w        $1e40                               ; branch according to condition flags (bra unconditional, bsr call)
00001dba | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001dbc | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001dc0 | a9b3                     | dc.w         $a9b3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001dc2 | 607c                     | bra.b        $1e40                               ; branch according to condition flags (bra unconditional, bsr call)
00001dc4 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001dc6 | a924                     | dc.w         $a924                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001dc8 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001dca | b1eefffc                 | cmpa.l       -$4(a6), a0                         ; compare operands; set condition flags
00001dce | 6708                     | beq.b        $1dd8                               ; branch according to condition flags (bra unconditional, bsr call)
00001dd0 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001dd4 | a91f                     | dc.w         $a91f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001dd6 | 6068                     | bra.b        $1e40                               ; branch according to condition flags (bra unconditional, bsr call)
00001dd8 | 4a03                     | tst.b        d3                                  ; machine operation; verify instruction and data boundaries
00001dda | 6764                     | beq.b        $1e40                               ; branch according to condition flags (bra unconditional, bsr call)
00001ddc | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001de0 | a91f                     | dc.w         $a91f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001de2 | 0c390002000008ea         | cmpi.b       #$2, $8ea.l                         ; compare operands; set condition flags
00001dea | 6612                     | bne.b        $1dfe                               ; branch according to condition flags (bra unconditional, bsr call)
00001dec | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001dee | a973                     | dc.w         $a973                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001df0 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001df2 | 6718                     | beq.b        $1e0c                               ; branch according to condition flags (bra unconditional, bsr call)
00001df4 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001df6 | a977                     | dc.w         $a977                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001df8 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001dfa | 66f8                     | bne.b        $1df4                               ; branch according to condition flags (bra unconditional, bsr call)
00001dfc | 600e                     | bra.b        $1e0c                               ; branch according to condition flags (bra unconditional, bsr call)
00001dfe | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001e00 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001e04 | 4eb900003d96             | jsr          $3d96.l                             ; call subroutine; push return address
00001e0a | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00001e0c | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001e0e | 6032                     | bra.b        $1e42                               ; branch according to condition flags (bra unconditional, bsr call)
00001e10 | 4a03                     | tst.b        d3                                  ; machine operation; verify instruction and data boundaries
00001e12 | 672c                     | beq.b        $1e40                               ; branch according to condition flags (bra unconditional, bsr call)
00001e14 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001e18 | 2f2a000a                 | move.l       $a(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001e1c | 487900000402             | pea.l        $402.l                              ; machine operation; verify instruction and data boundaries
00001e22 | a925                     | dc.w         $a925                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001e24 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001e26 | 601a                     | bra.b        $1e42                               ; branch according to condition flags (bra unconditional, bsr call)
00001e28 | 4a03                     | tst.b        d3                                  ; machine operation; verify instruction and data boundaries
00001e2a | 6714                     | beq.b        $1e40                               ; branch according to condition flags (bra unconditional, bsr call)
00001e2c | 2f2a000a                 | move.l       $a(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001e30 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001e34 | 4eb900003c0a             | jsr          $3c0a.l                             ; call subroutine; push return address
00001e3a | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001e3c | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00001e3e | 6002                     | bra.b        $1e42                               ; branch according to condition flags (bra unconditional, bsr call)
00001e40 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001e42 | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00001e46 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001e48 | 4e75                     | rts                                              ; return: pop return address from stack
00001e4a | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001e4e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001e50 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00001e54 | 2f2a0002                 | move.l       $2(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001e58 | 4eb900003824             | jsr          $3824.l                             ; call subroutine; push return address
00001e5e | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00001e60 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001e62 | 676e                     | beq.b        $1ed2                               ; branch according to condition flags (bra unconditional, bsr call)
00001e64 | 0c520006                 | cmpi.w       #$6, (a2)                           ; compare operands; set condition flags
00001e68 | 660e                     | bne.b        $1e78                               ; branch according to condition flags (bra unconditional, bsr call)
00001e6a | 2f2a0002                 | move.l       $2(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001e6e | 4eb900003968             | jsr          $3968.l                             ; call subroutine; push return address
00001e74 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001e76 | 6056                     | bra.b        $1ece                               ; branch according to condition flags (bra unconditional, bsr call)
00001e78 | 302a000e                 | move.w       $e(a2), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001e7c | 02400001                 | andi.w       #$1, d0                             ; bit/integer operation; flags depend on variant
00001e80 | 671a                     | beq.b        $1e9c                               ; branch according to condition flags (bra unconditional, bsr call)
00001e82 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001e88 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001e8c | a9d8                     | dc.w         $a9d8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001e8e | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001e94 | 2f2800a0                 | move.l       $a0(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001e98 | a957                     | dc.w         $a957                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001e9a | 6018                     | bra.b        $1eb4                               ; branch according to condition flags (bra unconditional, bsr call)
00001e9c | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001ea2 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001ea6 | a9d9                     | dc.w         $a9d9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001ea8 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001eae | 2f2800a0                 | move.l       $a0(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001eb2 | a958                     | dc.w         $a958                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001eb4 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001eba | 4eb90000390e             | jsr          $390e.l                             ; call subroutine; push return address
00001ec0 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001ec6 | 4eb900003a82             | jsr          $3a82.l                             ; call subroutine; push return address
00001ecc | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00001ece | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001ed0 | 6002                     | bra.b        $1ed4                               ; branch according to condition flags (bra unconditional, bsr call)
00001ed2 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001ed4 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
00001ed6 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001ed8 | 4e75                     | rts                                              ; return: pop return address from stack
00001eda | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001ede | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001ee0 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00001ee2 | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001ee6 | 20280002                 | move.l       $2(a0), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001eea | 7218                     | moveq        #$18, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001eec | e2a8                     | lsr.l        d1, d0                              ; bit/integer operation; flags depend on variant
00001eee | 0280000000ff             | andi.l       #$ff, d0                            ; bit/integer operation; flags depend on variant
00001ef4 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00001ef6 | 6702                     | beq.b        $1efa                               ; branch according to condition flags (bra unconditional, bsr call)
00001ef8 | 605a                     | bra.b        $1f54                               ; branch according to condition flags (bra unconditional, bsr call)
00001efa | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001efc | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001f00 | c0a80002                 | and.l        $2(a0), d0                          ; bit/integer operation; flags depend on variant
00001f04 | 671a                     | beq.b        $1f20                               ; branch according to condition flags (bra unconditional, bsr call)
00001f06 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001f0c | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001f10 | a9d8                     | dc.w         $a9d8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001f12 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001f18 | 2f2800a0                 | move.l       $a0(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001f1c | a957                     | dc.w         $a957                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001f1e | 6018                     | bra.b        $1f38                               ; branch according to condition flags (bra unconditional, bsr call)
00001f20 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001f26 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001f2a | a9d9                     | dc.w         $a9d9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001f2c | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001f32 | 2f2800a0                 | move.l       $a0(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00001f36 | a958                     | dc.w         $a958                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001f38 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001f3e | 4eb90000390e             | jsr          $390e.l                             ; call subroutine; push return address
00001f44 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001f4a | 4eb900003a82             | jsr          $3a82.l                             ; call subroutine; push return address
00001f50 | 7601                     | moveq        #$1, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00001f52 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00001f54 | 1003                     | move.b       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00001f56 | 261f                     | move.l       (a7)+, d3                           ; copy source to destination (Motorola operand order); flags depend on variant
00001f58 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001f5a | 4e75                     | rts                                              ; return: pop return address from stack
00001f5c | 4e56ffec                 | link.w       a6, #$ffec                          ; establish stack frame
00001f60 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00001f62 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001f64 | a975                     | dc.w         $a975                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001f66 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001f68 | 90b9000008f2             | sub.l        $8f2.l, d0                          ; arithmetic operation; flags depend on variant
00001f6e | 721e                     | moveq        #$1e, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00001f70 | b081                     | cmp.l        d1, d0                              ; compare operands; set condition flags
00001f72 | 65000172                 | bcs.w        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
00001f76 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00001f78 | a975                     | dc.w         $a975                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001f7a | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001f7c | 23c0000008f2             | move.l       d0, $8f2.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00001f82 | 4a39000008e8             | tst.b        $8e8.l                              ; machine operation; verify instruction and data boundaries
00001f88 | 6714                     | beq.b        $1f9e                               ; branch according to condition flags (bra unconditional, bsr call)
00001f8a | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001f8c | 3f3cffff                 | move.w       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001f90 | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
00001f94 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00001f96 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00001f98 | a860                     | dc.w         $a860                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001f9a | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001f9c | 6010                     | bra.b        $1fae                               ; branch according to condition flags (bra unconditional, bsr call)
00001f9e | a9b4                     | dc.w         $a9b4                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001fa0 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00001fa2 | 3f3cffff                 | move.w       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001fa6 | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
00001faa | a970                     | dc.w         $a970                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001fac | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00001fae | 302efff0                 | move.w       -$10(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00001fb2 | 4eb9000005f8             | jsr          $5f8.l                              ; call subroutine; push return address
00001fb8 | 012e0000                 | btst.l       d0, $0(a6)                          ; branch according to condition flags (bra unconditional, bsr call)
00001fbc | 0017000a                 | ori.b        #$a, (a7)                           ; bit/integer operation; flags depend on variant
00001fc0 | 00000124                 | ori.b        #$24, d0                            ; bit/integer operation; flags depend on variant
00001fc4 | 000100a8                 | ori.b        #$a8, d1                            ; bit/integer operation; flags depend on variant
00001fc8 | 0002011c                 | ori.b        #$1c, d2                            ; bit/integer operation; flags depend on variant
00001fcc | 0003001e                 | ori.b        #$1e, d3                            ; bit/integer operation; flags depend on variant
00001fd0 | 00040114                 | ori.b        #$14, d4                            ; bit/integer operation; flags depend on variant
00001fd4 | 00050016                 | ori.b        #$16, d5                            ; bit/integer operation; flags depend on variant
00001fd8 | 000600a2                 | ori.b        #$a2, d6                            ; bit/integer operation; flags depend on variant
00001fdc | 000700e2                 | ori.b        #$e2, d7                            ; bit/integer operation; flags depend on variant
00001fe0 | 0008                     | .word ; undecoded bytes / possible Macintosh A-line trap
00001fe2 | 009a000f00a4             | ori.l        #$f00a4, (a2)+                      ; bit/integer operation; flags depend on variant
00001fe8 | 001700ae                 | ori.b        #$ae, (a7)                          ; bit/integer operation; flags depend on variant
00001fec | 302efffe                 | move.w       -$2(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001ff0 | 02400100                 | andi.w       #$100, d0                           ; bit/integer operation; flags depend on variant
00001ff4 | 6746                     | beq.b        $203c                               ; branch according to condition flags (bra unconditional, bsr call)
00001ff6 | 202efff2                 | move.l       -$e(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00001ffa | 0280000000ff             | andi.l       #$ff, d0                            ; bit/integer operation; flags depend on variant
00002000 | 722e                     | moveq        #$2e, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00002002 | b081                     | cmp.l        d1, d0                              ; compare operands; set condition flags
00002004 | 660c                     | bne.b        $2012                               ; branch according to condition flags (bra unconditional, bsr call)
00002006 | 48780002                 | pea.l        $2.w                                ; machine operation; verify instruction and data boundaries
0000200a | 4eb900001b80             | jsr          $1b80.l                             ; call subroutine; push return address
00002010 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002012 | 262efff2                 | move.l       -$e(a6), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00002016 | 0283000000ff             | andi.l       #$ff, d3                            ; bit/integer operation; flags depend on variant
0000201c | 7071                     | moveq        #$71, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000201e | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00002020 | 6706                     | beq.b        $2028                               ; branch according to condition flags (bra unconditional, bsr call)
00002022 | 7051                     | moveq        #$51, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002024 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00002026 | 6614                     | bne.b        $203c                               ; branch according to condition flags (bra unconditional, bsr call)
00002028 | 13fc0001000008e6         | move.b       #$1, $8e6.l                         ; copy source to destination (Motorola operand order); flags depend on variant
00002030 | 48780002                 | pea.l        $2.w                                ; machine operation; verify instruction and data boundaries
00002034 | 4eb900001b80             | jsr          $1b80.l                             ; call subroutine; push return address
0000203a | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000203c | 202efff2                 | move.l       -$e(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002040 | 0280000000ff             | andi.l       #$ff, d0                            ; bit/integer operation; flags depend on variant
00002046 | 5780                     | subq.l       #$3, d0                             ; arithmetic operation; flags depend on variant
00002048 | 6600009c                 | bne.w        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
0000204c | 202efff2                 | move.l       -$e(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002050 | 02800000ff00             | andi.l       #$ff00, d0                          ; bit/integer operation; flags depend on variant
00002056 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00002058 | 724c                     | moveq        #$4c, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000205a | b081                     | cmp.l        d1, d0                              ; compare operands; set condition flags
0000205c | 67000088                 | beq.w        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
00002060 | 48780002                 | pea.l        $2.w                                ; machine operation; verify instruction and data boundaries
00002064 | 4eb900001b80             | jsr          $1b80.l                             ; call subroutine; push return address
0000206a | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000206c | 6078                     | bra.b        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
0000206e | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
00002072 | 4eb900001d3c             | jsr          $1d3c.l                             ; call subroutine; push return address
00002078 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000207a | 606a                     | bra.b        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
0000207c | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
00002080 | 4eb900001e4a             | jsr          $1e4a.l                             ; call subroutine; push return address
00002086 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002088 | 605c                     | bra.b        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
0000208a | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
0000208e | 4eb900001eda             | jsr          $1eda.l                             ; call subroutine; push return address
00002094 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002096 | 604e                     | bra.b        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
00002098 | 0c39fffffffffffc         | cmpi.b       #$ff, $fffffffc.l                   ; compare operands; set condition flags
000020a0 | 6606                     | bne.b        $20a8                               ; branch according to condition flags (bra unconditional, bsr call)
000020a2 | 4eb900001b92             | jsr          $1b92.l                             ; call subroutine; push return address
000020a8 | 4a39fffffffc             | tst.b        $fffffffc.l                         ; machine operation; verify instruction and data boundaries
000020ae | 6736                     | beq.b        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
000020b0 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000020b2 | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
000020b6 | 303c021b                 | move.w       #$21b, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000020ba | a816                     | dc.w         $a816                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000020bc | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000020be | 6026                     | bra.b        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
000020c0 | 202efff2                 | move.l       -$e(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000020c4 | 7210                     | moveq        #$10, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
000020c6 | e2a0                     | asr.l        d1, d0                              ; bit/integer operation; flags depend on variant
000020c8 | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
000020ca | 671a                     | beq.b        $20e6                               ; branch according to condition flags (bra unconditional, bsr call)
000020cc | 2d790000041cffec         | move.l       $41c.l, -$14(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
000020d4 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000020d6 | 2f2effec                 | move.l       -$14(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000020da | 2f2efff2                 | move.l       -$e(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000020de | 4eb900000068             | jsr          $68.l                               ; call subroutine; push return address
000020e4 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000020e6 | 261f                     | move.l       (a7)+, d3                           ; copy source to destination (Motorola operand order); flags depend on variant
000020e8 | 4e5e                     | unlk         a6                                  ; restore stack frame
000020ea | 4e75                     | rts                                              ; return: pop return address from stack
000020ec | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000020f0 | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
000020f4 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000020fa | 2468009c                 | movea.l      $9c(a0), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
000020fe | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002100 | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002102 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002104 | 3628003c                 | move.w       $3c(a0), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00002108 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000210e | 91f9000008fc             | suba.l       $8fc.l, a0                          ; arithmetic operation; flags depend on variant
00002114 | 3243                     | movea.w      d3, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00002116 | 2809                     | move.l       a1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00002118 | d888                     | add.l        a0, d4                              ; arithmetic operation; flags depend on variant
0000211a | 0c8400007fff             | cmpi.l       #$7fff, d4                          ; compare operands; set condition flags
00002120 | 6f5a                     | ble.b        $217c                               ; branch according to condition flags (bra unconditional, bsr call)
00002122 | 2604                     | move.l       d4, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00002124 | 0683ffff8001             | addi.l       #$ffff8001, d3                      ; arithmetic operation; flags depend on variant
0000212a | 06431000                 | addi.w       #$1000, d3                          ; arithmetic operation; flags depend on variant
0000212e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002130 | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002134 | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002136 | 2652                     | movea.l      (a2), a3                            ; copy source to destination (Motorola operand order); flags depend on variant
00002138 | 266b003e                 | movea.l      $3e(a3), a3                         ; copy source to destination (Motorola operand order); flags depend on variant
0000213c | 2653                     | movea.l      (a3), a3                            ; copy source to destination (Motorola operand order); flags depend on variant
0000213e | d6c3                     | adda.w       d3, a3                              ; arithmetic operation; flags depend on variant
00002140 | 6002                     | bra.b        $2144                               ; branch according to condition flags (bra unconditional, bsr call)
00002142 | 528b                     | addq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
00002144 | 0c13000d                 | cmpi.b       #$d, (a3)                           ; compare operands; set condition flags
00002148 | 66f8                     | bne.b        $2142                               ; branch according to condition flags (bra unconditional, bsr call)
0000214a | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000214c | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002150 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002152 | d0c3                     | adda.w       d3, a0                              ; arithmetic operation; flags depend on variant
00002154 | 528b                     | addq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
00002156 | 224b                     | movea.l      a3, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00002158 | 93c8                     | suba.l       a0, a1                              ; arithmetic operation; flags depend on variant
0000215a | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000215c | d640                     | add.w        d0, d3                              ; arithmetic operation; flags depend on variant
0000215e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002160 | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002164 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002166 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002168 | 42680020                 | clr.w        $20(a0)                             ; bit/integer operation; flags depend on variant
0000216c | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000216e | 31430022                 | move.w       d3, $22(a0)                         ; copy source to destination (Motorola operand order); flags depend on variant
00002172 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002174 | a9d7                     | dc.w         $a9d7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002176 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002178 | 3628003c                 | move.w       $3c(a0), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
0000217c | 3043                     | movea.w      d3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000217e | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002180 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002182 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002184 | a9d1                     | dc.w         $a9d1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002186 | 2f39000008fc             | move.l       $8fc.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000218c | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002192 | 91f9000008fc             | suba.l       $8fc.l, a0                          ; arithmetic operation; flags depend on variant
00002198 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000219a | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000219c | a9de                     | dc.w         $a9de                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000219e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000021a0 | 3628003c                 | move.w       $3c(a0), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
000021a4 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000021aa | 117c000100a6             | move.b       #$1, $a6(a0)                        ; copy source to destination (Motorola operand order); flags depend on variant
000021b0 | 23f9000008fc00000904     | move.l       $8fc.l, $904.l                      ; copy source to destination (Motorola operand order); flags depend on variant
000021ba | 23f9000008fc00000900     | move.l       $8fc.l, $900.l                      ; copy source to destination (Motorola operand order); flags depend on variant
000021c4 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000021c6 | 23c000000908             | move.l       d0, $908.l                          ; copy source to destination (Motorola operand order); flags depend on variant
000021cc | 3043                     | movea.w      d3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000021ce | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000021d0 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000021d2 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000021d4 | a9d1                     | dc.w         $a9d1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000021d6 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000021d8 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000021da | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
000021e0 | 6708                     | beq.b        $21ea                               ; branch according to condition flags (bra unconditional, bsr call)
000021e2 | 4eb900001f5c             | jsr          $1f5c.l                             ; call subroutine; push return address
000021e8 | 6006                     | bra.b        $21f0                               ; branch according to condition flags (bra unconditional, bsr call)
000021ea | 4eb9000039be             | jsr          $39be.l                             ; call subroutine; push return address
000021f0 | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
000021f4 | 4e5e                     | unlk         a6                                  ; restore stack frame
000021f6 | 4e75                     | rts                                              ; return: pop return address from stack
000021f8 | 48e71800                 | movem.l      d3-d4, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000021fc | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000021fe | 7800                     | moveq        #$0, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00002200 | 102f000c                 | move.b       $c(a7), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002204 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00002206 | 4eb9000005f8             | jsr          $5f8.l                              ; call subroutine; push return address
0000220c | 007600410078             | ori.w        #$41, $78(a6, d0.w)                 ; bit/integer operation; flags depend on variant
00002212 | 000d                     | .word ; undecoded bytes / possible Macintosh A-line trap
00002214 | 00410066                 | ori.w        #$66, d1                            ; bit/integer operation; flags depend on variant
00002218 | 00430052                 | ori.w        #$52, d3                            ; bit/integer operation; flags depend on variant
0000221c | 00500036                 | ori.w        #$36, (a0)                          ; bit/integer operation; flags depend on variant
00002220 | 0051003a                 | ori.w        #$3a, (a1)                          ; bit/integer operation; flags depend on variant
00002224 | 00530026                 | ori.w        #$26, (a3)                          ; bit/integer operation; flags depend on variant
00002228 | 0056004a                 | ori.w        #$4a, (a6)                          ; bit/integer operation; flags depend on variant
0000222c | 00580036                 | ori.w        #$36, (a0)+                         ; bit/integer operation; flags depend on variant
00002230 | 0061004a                 | ori.w        #$4a, -(a1)                         ; bit/integer operation; flags depend on variant
00002234 | 00630036                 | ori.w        #$36, -(a3)                         ; bit/integer operation; flags depend on variant
00002238 | 0070001a0071             | ori.w        #$1a, $71(a0, d0.w)                 ; bit/integer operation; flags depend on variant
0000223e | 001e0073                 | ori.b        #$73, (a6)+                         ; bit/integer operation; flags depend on variant
00002242 | 000a                     | .word ; undecoded bytes / possible Macintosh A-line trap
00002244 | 0076002e0078             | ori.w        #$2e, $78(a6, d0.w)                 ; bit/integer operation; flags depend on variant
0000224a | 001a363c                 | ori.b        #$3c, (a2)+                         ; bit/integer operation; flags depend on variant
0000224e | 7d01                     | .word ; undecoded bytes / possible Macintosh A-line trap
00002250 | 7804                     | moveq        #$4, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00002252 | 602e                     | bra.b        $2282                               ; branch according to condition flags (bra unconditional, bsr call)
00002254 | 363c7d01                 | move.w       #$7d01, d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00002258 | 7807                     | moveq        #$7, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
0000225a | 6026                     | bra.b        $2282                               ; branch according to condition flags (bra unconditional, bsr call)
0000225c | 363c7d01                 | move.w       #$7d01, d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00002260 | 7809                     | moveq        #$9, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00002262 | 601e                     | bra.b        $2282                               ; branch according to condition flags (bra unconditional, bsr call)
00002264 | 363c7d02                 | move.w       #$7d02, d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00002268 | 7803                     | moveq        #$3, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
0000226a | 6016                     | bra.b        $2282                               ; branch according to condition flags (bra unconditional, bsr call)
0000226c | 363c7d02                 | move.w       #$7d02, d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00002270 | 7804                     | moveq        #$4, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00002272 | 600e                     | bra.b        $2282                               ; branch according to condition flags (bra unconditional, bsr call)
00002274 | 363c7d02                 | move.w       #$7d02, d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00002278 | 7805                     | moveq        #$5, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
0000227a | 6006                     | bra.b        $2282                               ; branch according to condition flags (bra unconditional, bsr call)
0000227c | 363c7d02                 | move.w       #$7d02, d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00002280 | 7808                     | moveq        #$8, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00002282 | 3044                     | movea.w      d4, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002284 | 3243                     | movea.w      d3, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00002286 | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002288 | 7210                     | moveq        #$10, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000228a | e3a8                     | lsl.l        d1, d0                              ; bit/integer operation; flags depend on variant
0000228c | 2208                     | move.l       a0, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
0000228e | 8081                     | or.l         d1, d0                              ; bit/integer operation; flags depend on variant
00002290 | 4cdf0018                 | movem.l      (a7)+, d3-d4                        ; copy source to destination (Motorola operand order); flags depend on variant
00002294 | 4e75                     | rts                                              ; return: pop return address from stack
00002296 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000229a | 206e000a                 | movea.l      $a(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000229e | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000022a0 | 30280020                 | move.w       $20(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000022a4 | b06e0008                 | cmp.w        $8(a6), d0                          ; compare operands; set condition flags
000022a8 | 6d10                     | blt.b        $22ba                               ; branch according to condition flags (bra unconditional, bsr call)
000022aa | 206e000a                 | movea.l      $a(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000022ae | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000022b0 | 30280022                 | move.w       $22(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000022b4 | b06e0008                 | cmp.w        $8(a6), d0                          ; compare operands; set condition flags
000022b8 | 6c0a                     | bge.b        $22c4                               ; branch according to condition flags (bra unconditional, bsr call)
000022ba | 3f3c000a                 | move.w       #$a, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000022be | a9c8                     | dc.w         $a9c8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000022c0 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000022c2 | 6002                     | bra.b        $22c6                               ; branch according to condition flags (bra unconditional, bsr call)
000022c4 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000022c6 | 4e5e                     | unlk         a6                                  ; restore stack frame
000022c8 | 4e75                     | rts                                              ; return: pop return address from stack
000022ca | 4e56ffe8                 | link.w       a6, #$ffe8                          ; establish stack frame
000022ce | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000022d2 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
000022d6 | 4a39000008ea             | tst.b        $8ea.l                              ; machine operation; verify instruction and data boundaries
000022dc | 6606                     | bne.b        $22e4                               ; branch according to condition flags (bra unconditional, bsr call)
000022de | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000022e0 | 60000348                 | bra.w        $262a                               ; branch according to condition flags (bra unconditional, bsr call)
000022e4 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000022e6 | 6710                     | beq.b        $22f8                               ; branch according to condition flags (bra unconditional, bsr call)
000022e8 | 41d2                     | lea.l        (a2), a0                            ; machine operation; verify instruction and data boundaries
000022ea | 43eefff0                 | lea.l        -$10(a6), a1                        ; machine operation; verify instruction and data boundaries
000022ee | 22d8                     | move.l       (a0)+, (a1)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000022f0 | 22d8                     | move.l       (a0)+, (a1)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000022f2 | 22d8                     | move.l       (a0)+, (a1)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000022f4 | 22d8                     | move.l       (a0)+, (a1)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000022f6 | 602c                     | bra.b        $2324                               ; branch according to condition flags (bra unconditional, bsr call)
000022f8 | 4a39000008e8             | tst.b        $8e8.l                              ; machine operation; verify instruction and data boundaries
000022fe | 6714                     | beq.b        $2314                               ; branch according to condition flags (bra unconditional, bsr call)
00002300 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00002302 | 3f3cffff                 | move.w       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002306 | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
0000230a | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000230c | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000230e | a860                     | dc.w         $a860                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002310 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002312 | 6010                     | bra.b        $2324                               ; branch according to condition flags (bra unconditional, bsr call)
00002314 | a9b4                     | dc.w         $a9b4                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002316 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00002318 | 3f3cffff                 | move.w       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000231c | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
00002320 | a970                     | dc.w         $a970                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002322 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002324 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002326 | a924                     | dc.w         $a924                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002328 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000232a | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000232c | 302efff0                 | move.w       -$10(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00002330 | 4eb9000005f8             | jsr          $5f8.l                              ; call subroutine; push return address
00002336 | 02f2                     | dc.w         $2f2                                ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002338 | 00000017                 | ori.b        #$17, d0                            ; bit/integer operation; flags depend on variant
0000233c | 000a                     | .word ; undecoded bytes / possible Macintosh A-line trap
0000233e | 0000002a                 | ori.b        #$2a, d0                            ; bit/integer operation; flags depend on variant
00002342 | 000100ae                 | ori.b        #$ae, d1                            ; bit/integer operation; flags depend on variant
00002346 | 000202e0                 | ori.b        #$e0, d2                            ; bit/integer operation; flags depend on variant
0000234a | 000300be                 | ori.b        #$be, d3                            ; bit/integer operation; flags depend on variant
0000234e | 000402d8                 | ori.b        #$d8, d4                            ; bit/integer operation; flags depend on variant
00002352 | 000500b6                 | ori.b        #$b6, d5                            ; bit/integer operation; flags depend on variant
00002356 | 0006025a                 | ori.b        #$5a, d6                            ; bit/integer operation; flags depend on variant
0000235a | 000702a6                 | ori.b        #$a6, d7                            ; bit/integer operation; flags depend on variant
0000235e | 0008                     | .word ; undecoded bytes / possible Macintosh A-line trap
00002360 | 0252000f                 | andi.w       #$f, (a2)                           ; bit/integer operation; flags depend on variant
00002364 | 02620017                 | andi.w       #$17, -(a2)                         ; bit/integer operation; flags depend on variant
00002368 | 02722f0a4eb9             | andi.w       #$2f0a, -$47(a2, d4.l)              ; bit/integer operation; flags depend on variant
0000236e | 00003824                 | ori.b        #$24, d0                            ; bit/integer operation; flags depend on variant
00002372 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00002374 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002376 | 6764                     | beq.b        $23dc                               ; branch according to condition flags (bra unconditional, bsr call)
00002378 | 486effec                 | pea.l        -$14(a6)                            ; machine operation; verify instruction and data boundaries
0000237c | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000237e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002380 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002382 | 486efffa                 | pea.l        -$6(a6)                             ; machine operation; verify instruction and data boundaries
00002386 | a871                     | dc.w         $a871                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002388 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000238a | 2f2efffa                 | move.l       -$6(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000238e | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002394 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002398 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000239a | 48680008                 | pea.l        $8(a0)                              ; machine operation; verify instruction and data boundaries
0000239e | a8ad                     | dc.w         $a8ad                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000023a0 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000023a2 | 6714                     | beq.b        $23b8                               ; branch according to condition flags (bra unconditional, bsr call)
000023a4 | 4ab9000008f8             | tst.l        $8f8.l                              ; machine operation; verify instruction and data boundaries
000023aa | 670c                     | beq.b        $23b8                               ; branch according to condition flags (bra unconditional, bsr call)
000023ac | 2079000008f8             | movea.l      $8f8.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000023b2 | 2f10                     | move.l       (a0), -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
000023b4 | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000023b6 | 6006                     | bra.b        $23be                               ; branch according to condition flags (bra unconditional, bsr call)
000023b8 | 486dd420                 | pea.l        -$2be0(a5)                          ; machine operation; verify instruction and data boundaries
000023bc | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000023be | 486efffa                 | pea.l        -$6(a6)                             ; machine operation; verify instruction and data boundaries
000023c2 | a870                     | dc.w         $a870                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000023c4 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000023ca | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000023ce | a9da                     | dc.w         $a9da                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000023d0 | 2f2effec                 | move.l       -$14(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000023d4 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000023d6 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000023d8 | 60000250                 | bra.w        $262a                               ; branch according to condition flags (bra unconditional, bsr call)
000023dc | 486dd420                 | pea.l        -$2be0(a5)                          ; machine operation; verify instruction and data boundaries
000023e0 | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000023e2 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000023e8 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000023ec | a9da                     | dc.w         $a9da                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000023ee | 60000238                 | bra.w        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
000023f2 | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
000023f6 | 4eb900001d3c             | jsr          $1d3c.l                             ; call subroutine; push return address
000023fc | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
000023fe | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002400 | 67000226                 | beq.w        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
00002404 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00002406 | 60000222                 | bra.w        $262a                               ; branch according to condition flags (bra unconditional, bsr call)
0000240a | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000240c | 4eb900003824             | jsr          $3824.l                             ; call subroutine; push return address
00002412 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00002414 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002416 | 67000210                 | beq.w        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
0000241a | 262efff2                 | move.l       -$e(a6), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
0000241e | 0283000000ff             | andi.l       #$ff, d3                            ; bit/integer operation; flags depend on variant
00002424 | 082e0000fffe             | btst.b       #$0, -$2(a6)                        ; branch according to condition flags (bra unconditional, bsr call)
0000242a | 675c                     | beq.b        $2488                               ; branch according to condition flags (bra unconditional, bsr call)
0000242c | 0c390004000008ea         | cmpi.b       #$4, $8ea.l                         ; compare operands; set condition flags
00002434 | 6712                     | beq.b        $2448                               ; branch according to condition flags (bra unconditional, bsr call)
00002436 | 0c03002e                 | cmpi.b       #$2e, d3                            ; compare operands; set condition flags
0000243a | 660c                     | bne.b        $2448                               ; branch according to condition flags (bra unconditional, bsr call)
0000243c | 48780002                 | pea.l        $2.w                                ; machine operation; verify instruction and data boundaries
00002440 | 4eb900001b80             | jsr          $1b80.l                             ; call subroutine; push return address
00002446 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002448 | 4a39000003ee             | tst.b        $3ee.l                              ; machine operation; verify instruction and data boundaries
0000244e | 6720                     | beq.b        $2470                               ; branch according to condition flags (bra unconditional, bsr call)
00002450 | 4eb900002dd0             | jsr          $2dd0.l                             ; call subroutine; push return address
00002456 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002458 | 1003                     | move.b       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000245a | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
0000245c | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000245e | a93e                     | dc.w         $a93e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002460 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002462 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002464 | 4eb900003298             | jsr          $3298.l                             ; call subroutine; push return address
0000246a | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000246c | 600001ba                 | bra.w        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
00002470 | 1f03                     | move.b       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002472 | 4eb9000021f8             | jsr          $21f8.l                             ; call subroutine; push return address
00002478 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000247a | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000247c | 4eb900003298             | jsr          $3298.l                             ; call subroutine; push return address
00002482 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002484 | 600001a2                 | bra.w        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
00002488 | 202efff2                 | move.l       -$e(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000248c | 02800000ff00             | andi.l       #$ff00, d0                          ; bit/integer operation; flags depend on variant
00002492 | e088                     | lsr.l        #$8, d0                             ; bit/integer operation; flags depend on variant
00002494 | 724c                     | moveq        #$4c, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00002496 | b081                     | cmp.l        d1, d0                              ; compare operands; set condition flags
00002498 | 6602                     | bne.b        $249c                               ; branch according to condition flags (bra unconditional, bsr call)
0000249a | 760d                     | moveq        #$d, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
0000249c | 0c390003000008ea         | cmpi.b       #$3, $8ea.l                         ; compare operands; set condition flags
000024a4 | 660000d8                 | bne.w        $257e                               ; branch according to condition flags (bra unconditional, bsr call)
000024a8 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000024ae | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
000024b2 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000024b4 | 3028003c                 | move.w       $3c(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000024b8 | 9079000008e4             | sub.w        $8e4.l, d0                          ; arithmetic operation; flags depend on variant
000024be | 5240                     | addq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
000024c0 | b079000008f6             | cmp.w        $8f6.l, d0                          ; compare operands; set condition flags
000024c6 | 6d0c                     | blt.b        $24d4                               ; branch according to condition flags (bra unconditional, bsr call)
000024c8 | 3f3c000a                 | move.w       #$a, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000024cc | a9c8                     | dc.w         $a9c8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000024ce | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000024d0 | 60000158                 | bra.w        $262a                               ; branch according to condition flags (bra unconditional, bsr call)
000024d4 | 1003                     | move.b       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000024d6 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
000024d8 | 4eb9000005f8             | jsr          $5f8.l                              ; call subroutine; push return address
000024de | 005c0003                 | ori.w        #$3, (a4)+                          ; bit/integer operation; flags depend on variant
000024e2 | 001a0004                 | ori.b        #$4, (a2)+                          ; bit/integer operation; flags depend on variant
000024e6 | 0003001e                 | ori.b        #$1e, d3                            ; bit/integer operation; flags depend on variant
000024ea | 0004000e                 | ori.b        #$e, d4                             ; bit/integer operation; flags depend on variant
000024ee | 0008                     | .word ; undecoded bytes / possible Macintosh A-line trap
000024f0 | 0024000d                 | ori.b        #$d, -(a4)                          ; bit/integer operation; flags depend on variant
000024f4 | 0008                     | .word ; undecoded bytes / possible Macintosh A-line trap
000024f6 | 001a0002                 | ori.b        #$2, (a2)+                          ; bit/integer operation; flags depend on variant
000024fa | 7603                     | moveq        #$3, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000024fc | 13fc0001000008ea         | move.b       #$1, $8ea.l                         ; copy source to destination (Motorola operand order); flags depend on variant
00002504 | 6034                     | bra.b        $253a                               ; branch according to condition flags (bra unconditional, bsr call)
00002506 | 48780002                 | pea.l        $2.w                                ; machine operation; verify instruction and data boundaries
0000250a | 4eb900001b80             | jsr          $1b80.l                             ; call subroutine; push return address
00002510 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002512 | 6026                     | bra.b        $253a                               ; branch according to condition flags (bra unconditional, bsr call)
00002514 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000251a | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000251e | 3039000008e4             | move.w       $8e4.l, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002524 | 5240                     | addq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00002526 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002528 | 4eb900002296             | jsr          $2296.l                             ; call subroutine; push return address
0000252e | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00002530 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00002532 | 6606                     | bne.b        $253a                               ; branch according to condition flags (bra unconditional, bsr call)
00002534 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00002536 | 600000f2                 | bra.w        $262a                               ; branch according to condition flags (bra unconditional, bsr call)
0000253a | 0c030020                 | cmpi.b       #$20, d3                            ; compare operands; set condition flags
0000253e | 6d3e                     | blt.b        $257e                               ; branch according to condition flags (bra unconditional, bsr call)
00002540 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002546 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000254a | 3f39000008e4             | move.w       $8e4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002550 | 4eb900002296             | jsr          $2296.l                             ; call subroutine; push return address
00002556 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00002558 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
0000255a | 6622                     | bne.b        $257e                               ; branch according to condition flags (bra unconditional, bsr call)
0000255c | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002562 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002566 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002568 | 3268003c                 | movea.w      $3c(a0), a1                         ; copy source to destination (Motorola operand order); flags depend on variant
0000256c | 2809                     | move.l       a1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000256e | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002570 | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002572 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002578 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000257c | a9d1                     | dc.w         $a9d1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000257e | 1003                     | move.b       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002580 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00002582 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002584 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000258a | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000258e | a9dc                     | dc.w         $a9dc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002590 | 4eb9000039be             | jsr          $39be.l                             ; call subroutine; push return address
00002596 | 0c03001c                 | cmpi.b       #$1c, d3                            ; compare operands; set condition flags
0000259a | 6d06                     | blt.b        $25a2                               ; branch according to condition flags (bra unconditional, bsr call)
0000259c | 0c03001f                 | cmpi.b       #$1f, d3                            ; compare operands; set condition flags
000025a0 | 6f0c                     | ble.b        $25ae                               ; branch according to condition flags (bra unconditional, bsr call)
000025a2 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000025a8 | 117c000100a6             | move.b       #$1, $a6(a0)                        ; copy source to destination (Motorola operand order); flags depend on variant
000025ae | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000025b0 | 6078                     | bra.b        $262a                               ; branch according to condition flags (bra unconditional, bsr call)
000025b2 | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
000025b6 | 4eb900001e4a             | jsr          $1e4a.l                             ; call subroutine; push return address
000025bc | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
000025be | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000025c0 | 6766                     | beq.b        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
000025c2 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000025c4 | 6064                     | bra.b        $262a                               ; branch according to condition flags (bra unconditional, bsr call)
000025c6 | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
000025ca | 4eb900001eda             | jsr          $1eda.l                             ; call subroutine; push return address
000025d0 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
000025d2 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000025d4 | 6752                     | beq.b        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
000025d6 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000025d8 | 6050                     | bra.b        $262a                               ; branch according to condition flags (bra unconditional, bsr call)
000025da | 0c39fffffffffffc         | cmpi.b       #$ff, $fffffffc.l                   ; compare operands; set condition flags
000025e2 | 6606                     | bne.b        $25ea                               ; branch according to condition flags (bra unconditional, bsr call)
000025e4 | 4eb900001b92             | jsr          $1b92.l                             ; call subroutine; push return address
000025ea | 4a39fffffffc             | tst.b        $fffffffc.l                         ; machine operation; verify instruction and data boundaries
000025f0 | 6736                     | beq.b        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
000025f2 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000025f4 | 486efff0                 | pea.l        -$10(a6)                            ; machine operation; verify instruction and data boundaries
000025f8 | 303c021b                 | move.w       #$21b, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000025fc | a816                     | dc.w         $a816                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000025fe | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002600 | 6026                     | bra.b        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
00002602 | 202efff2                 | move.l       -$e(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002606 | 7210                     | moveq        #$10, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00002608 | e2a0                     | asr.l        d1, d0                              ; bit/integer operation; flags depend on variant
0000260a | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
0000260c | 671a                     | beq.b        $2628                               ; branch according to condition flags (bra unconditional, bsr call)
0000260e | 2d7900000418ffe8         | move.l       $418.l, -$18(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00002616 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00002618 | 2f2effe8                 | move.l       -$18(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000261c | 2f2efff2                 | move.l       -$e(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00002620 | 4eb900000068             | jsr          $68.l                               ; call subroutine; push return address
00002626 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002628 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000262a | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
0000262e | 4e5e                     | unlk         a6                                  ; restore stack frame
00002630 | 4e75                     | rts                                              ; return: pop return address from stack
00002632 | 4e56fefe                 | link.w       a6, #$fefe                          ; establish stack frame
00002636 | 4ab9000008ec             | tst.l        $8ec.l                              ; machine operation; verify instruction and data boundaries
0000263c | 670000b6                 | beq.w        $26f4                               ; branch according to condition flags (bra unconditional, bsr call)
00002640 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002646 | 4a2800a6                 | tst.b        $a6(a0)                             ; machine operation; verify instruction and data boundaries
0000264a | 6762                     | beq.b        $26ae                               ; branch according to condition flags (bra unconditional, bsr call)
0000264c | 4a39000003f0             | tst.b        $3f0.l                              ; machine operation; verify instruction and data boundaries
00002652 | 675a                     | beq.b        $26ae                               ; branch according to condition flags (bra unconditional, bsr call)
00002654 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000265a | 486eff00                 | pea.l        -$100(a6)                           ; machine operation; verify instruction and data boundaries
0000265e | a919                     | dc.w         $a919                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002660 | 486dd420                 | pea.l        -$2be0(a5)                          ; machine operation; verify instruction and data boundaries
00002664 | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002666 | 486eff00                 | pea.l        -$100(a6)                           ; machine operation; verify instruction and data boundaries
0000266a | 4eb90000464a             | jsr          $464a.l                             ; call subroutine; push return address
00002670 | 3d40fefe                 | move.w       d0, -$102(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002674 | 302efefe                 | move.w       -$102(a6), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
00002678 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000267a | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
0000267c | 670a                     | beq.b        $2688                               ; branch according to condition flags (bra unconditional, bsr call)
0000267e | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00002680 | 672c                     | beq.b        $26ae                               ; branch according to condition flags (bra unconditional, bsr call)
00002682 | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00002684 | 671e                     | beq.b        $26a4                               ; branch according to condition flags (bra unconditional, bsr call)
00002686 | 6026                     | bra.b        $26ae                               ; branch according to condition flags (bra unconditional, bsr call)
00002688 | 4eb900002ef8             | jsr          $2ef8.l                             ; call subroutine; push return address
0000268e | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00002690 | 671c                     | beq.b        $26ae                               ; branch according to condition flags (bra unconditional, bsr call)
00002692 | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
00002698 | 6714                     | beq.b        $26ae                               ; branch according to condition flags (bra unconditional, bsr call)
0000269a | 4239000008e6             | clr.b        $8e6.l                              ; bit/integer operation; flags depend on variant
000026a0 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000026a2 | 6052                     | bra.b        $26f6                               ; branch according to condition flags (bra unconditional, bsr call)
000026a4 | 4239000008e6             | clr.b        $8e6.l                              ; bit/integer operation; flags depend on variant
000026aa | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000026ac | 6048                     | bra.b        $26f6                               ; branch according to condition flags (bra unconditional, bsr call)
000026ae | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000026b4 | a956                     | dc.w         $a956                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000026b6 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000026bc | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000026c0 | a9cd                     | dc.w         $a9cd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000026c2 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000026c8 | a92d                     | dc.w         $a92d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000026ca | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000026d0 | a01f                     | dc.w         $a01f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000026d2 | 42b9000008ec             | clr.l        $8ec.l                              ; bit/integer operation; flags depend on variant
000026d8 | 23f9000008fc00000904     | move.l       $8fc.l, $904.l                      ; copy source to destination (Motorola operand order); flags depend on variant
000026e2 | 23f9000008fc00000900     | move.l       $8fc.l, $900.l                      ; copy source to destination (Motorola operand order); flags depend on variant
000026ec | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000026ee | 23c000000908             | move.l       d0, $908.l                          ; copy source to destination (Motorola operand order); flags depend on variant
000026f4 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000026f6 | 4e5e                     | unlk         a6                                  ; restore stack frame
000026f8 | 4e75                     | rts                                              ; return: pop return address from stack
000026fa | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
000026fe | 4a39000008e6             | tst.b        $8e6.l                              ; machine operation; verify instruction and data boundaries
00002704 | 6608                     | bne.b        $270e                               ; branch according to condition flags (bra unconditional, bsr call)
00002706 | 4a39000008ea             | tst.b        $8ea.l                              ; machine operation; verify instruction and data boundaries
0000270c | 6706                     | beq.b        $2714                               ; branch according to condition flags (bra unconditional, bsr call)
0000270e | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00002710 | 600000aa                 | bra.w        $27bc                               ; branch according to condition flags (bra unconditional, bsr call)
00002714 | 4a39000003ec             | tst.b        $3ec.l                              ; machine operation; verify instruction and data boundaries
0000271a | 670e                     | beq.b        $272a                               ; branch according to condition flags (bra unconditional, bsr call)
0000271c | 4a39000008f0             | tst.b        $8f0.l                              ; machine operation; verify instruction and data boundaries
00002722 | 6606                     | bne.b        $272a                               ; branch according to condition flags (bra unconditional, bsr call)
00002724 | 4eb900001c68             | jsr          $1c68.l                             ; call subroutine; push return address
0000272a | 203c00000200             | move.l       #$200, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002730 | a11e                     | dc.w         $a11e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002732 | 23c8000008fc             | move.l       a0, $8fc.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002738 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000273a | 6604                     | bne.b        $2740                               ; branch according to condition flags (bra unconditional, bsr call)
0000273c | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000273e | 607c                     | bra.b        $27bc                               ; branch according to condition flags (bra unconditional, bsr call)
00002740 | 23c800000904             | move.l       a0, $904.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002746 | 23f9000008fc00000900     | move.l       $8fc.l, $900.l                      ; copy source to destination (Motorola operand order); flags depend on variant
00002750 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002752 | 23c000000908             | move.l       d0, $908.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002758 | 4a39000003ee             | tst.b        $3ee.l                              ; machine operation; verify instruction and data boundaries
0000275e | 6706                     | beq.b        $2766                               ; branch according to condition flags (bra unconditional, bsr call)
00002760 | 4eb900002d2e             | jsr          $2d2e.l                             ; call subroutine; push return address
00002766 | 4eb900003e9e             | jsr          $3e9e.l                             ; call subroutine; push return address
0000276c | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
0000276e | 674a                     | beq.b        $27ba                               ; branch according to condition flags (bra unconditional, bsr call)
00002770 | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
00002776 | 6608                     | bne.b        $2780                               ; branch according to condition flags (bra unconditional, bsr call)
00002778 | 13fc0001000003ef         | move.b       #$1, $3ef.l                         ; copy source to destination (Motorola operand order); flags depend on variant
00002780 | 13fc0001000008ea         | move.b       #$1, $8ea.l                         ; copy source to destination (Motorola operand order); flags depend on variant
00002788 | 303ca89f                 | move.w       #$a89f, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000278c | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000278e | 2d48fffc                 | move.l       a0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00002792 | 303ca860                 | move.w       #$a860, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002796 | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002798 | b1eefffc                 | cmpa.l       -$4(a6), a0                         ; compare operands; set condition flags
0000279c | 6708                     | beq.b        $27a6                               ; branch according to condition flags (bra unconditional, bsr call)
0000279e | 13fc0001000008e8         | move.b       #$1, $8e8.l                         ; copy source to destination (Motorola operand order); flags depend on variant
000027a6 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000027a8 | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000027ac | a9b9                     | dc.w         $a9b9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000027ae | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000027b0 | 23c8000008f8             | move.l       a0, $8f8.l                          ; copy source to destination (Motorola operand order); flags depend on variant
000027b6 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000027b8 | 6002                     | bra.b        $27bc                               ; branch according to condition flags (bra unconditional, bsr call)
000027ba | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000027bc | 4e5e                     | unlk         a6                                  ; restore stack frame
000027be | 4e75                     | rts                                              ; return: pop return address from stack
000027c0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000027c4 | 4a39000008ea             | tst.b        $8ea.l                              ; machine operation; verify instruction and data boundaries
000027ca | 6708                     | beq.b        $27d4                               ; branch according to condition flags (bra unconditional, bsr call)
000027cc | 4ab9000008ec             | tst.l        $8ec.l                              ; machine operation; verify instruction and data boundaries
000027d2 | 6602                     | bne.b        $27d6                               ; branch according to condition flags (bra unconditional, bsr call)
000027d4 | 6074                     | bra.b        $284a                               ; branch according to condition flags (bra unconditional, bsr call)
000027d6 | 4a79fffff7bc             | tst.w        $fffff7bc.l                         ; machine operation; verify instruction and data boundaries
000027dc | 670a                     | beq.b        $27e8                               ; branch according to condition flags (bra unconditional, bsr call)
000027de | 13fc0005000008ea         | move.b       #$5, $8ea.l                         ; copy source to destination (Motorola operand order); flags depend on variant
000027e6 | 6008                     | bra.b        $27f0                               ; branch according to condition flags (bra unconditional, bsr call)
000027e8 | 13fc0004000008ea         | move.b       #$4, $8ea.l                         ; copy source to destination (Motorola operand order); flags depend on variant
000027f0 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000027f6 | 4eb900003a82             | jsr          $3a82.l                             ; call subroutine; push return address
000027fc | 4279000008e4             | clr.w        $8e4.l                              ; bit/integer operation; flags depend on variant
00002802 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002808 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000280c | a9d8                     | dc.w         $a9d8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000280e | 4eb9000039be             | jsr          $39be.l                             ; call subroutine; push return address
00002814 | 4a39000003ef             | tst.b        $3ef.l                              ; machine operation; verify instruction and data boundaries
0000281a | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000281c | 6714                     | beq.b        $2832                               ; branch according to condition flags (bra unconditional, bsr call)
0000281e | 13fc0001000008e6         | move.b       #$1, $8e6.l                         ; copy source to destination (Motorola operand order); flags depend on variant
00002826 | 600a                     | bra.b        $2832                               ; branch according to condition flags (bra unconditional, bsr call)
00002828 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000282a | 4eb9000022ca             | jsr          $22ca.l                             ; call subroutine; push return address
00002830 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002832 | 4a39000008e6             | tst.b        $8e6.l                              ; machine operation; verify instruction and data boundaries
00002838 | 67ee                     | beq.b        $2828                               ; branch according to condition flags (bra unconditional, bsr call)
0000283a | 4eb900002632             | jsr          $2632.l                             ; call subroutine; push return address
00002840 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00002842 | 67e4                     | beq.b        $2828                               ; branch according to condition flags (bra unconditional, bsr call)
00002844 | 4239000008ea             | clr.b        $8ea.l                              ; bit/integer operation; flags depend on variant
0000284a | 4e5e                     | unlk         a6                                  ; restore stack frame
0000284c | 4e75                     | rts                                              ; return: pop return address from stack
0000284e | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00002852 | 48e71f20                 | movem.l      d3-d7/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00002856 | 2e2e000c                 | move.l       $c(a6), d7                          ; copy source to destination (Motorola operand order); flags depend on variant
0000285a | 4a39000008e6             | tst.b        $8e6.l                              ; machine operation; verify instruction and data boundaries
00002860 | 6706                     | beq.b        $2868                               ; branch according to condition flags (bra unconditional, bsr call)
00002862 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00002864 | 600003f2                 | bra.w        $2c58                               ; branch according to condition flags (bra unconditional, bsr call)
00002868 | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
0000286c | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000286e | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002874 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002876 | 13fc0002000008ea         | move.b       #$2, $8ea.l                         ; copy source to destination (Motorola operand order); flags depend on variant
0000287e | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002884 | 4eb900003a82             | jsr          $3a82.l                             ; call subroutine; push return address
0000288a | 2807                     | move.l       d7, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000288c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000288e | 6000039e                 | bra.w        $2c2e                               ; branch according to condition flags (bra unconditional, bsr call)
00002892 | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002896 | 52ae0008                 | addq.l       #$1, $8(a6)                         ; arithmetic operation; flags depend on variant
0000289a | 1610                     | move.b       (a0), d3                            ; copy source to destination (Motorola operand order); flags depend on variant
0000289c | 1003                     | move.b       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000289e | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
000028a0 | 5f40                     | subq.w       #$7, d0                             ; arithmetic operation; flags depend on variant
000028a2 | 0c400006                 | cmpi.w       #$6, d0                             ; compare operands; set condition flags
000028a6 | 620002f6                 | bhi.w        $2b9e                               ; branch according to condition flags (bra unconditional, bsr call)
000028aa | d040                     | add.w        d0, d0                              ; arithmetic operation; flags depend on variant
000028ac | 303b0006                 | move.w       $28b4(pc, d0.w), d0                 ; copy source to destination (Motorola operand order); flags depend on variant
000028b0 | 4efb0002                 | jmp          $28b4(pc, d0.w)                     ; machine operation; verify instruction and data boundaries
000028b4 | 02560260                 | andi.w       #$260, (a6)                         ; bit/integer operation; flags depend on variant
000028b8 | 009800340360             | ori.l        #$340360, (a0)+                     ; bit/integer operation; flags depend on variant
000028be | 01f4000e                 | bset.b       d0, $e(a4, d0.w)                    ; branch according to condition flags (bra unconditional, bsr call)
000028c2 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000028c8 | 10bc000d                 | move.b       #$d, (a0)                           ; copy source to destination (Motorola operand order); flags depend on variant
000028cc | 52b900000904             | addq.l       #$1, $904.l                         ; arithmetic operation; flags depend on variant
000028d2 | 23f90000090400000900     | move.l       $904.l, $900.l                      ; copy source to destination (Motorola operand order); flags depend on variant
000028dc | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000028de | 23c000000908             | move.l       d0, $908.l                          ; copy source to destination (Motorola operand order); flags depend on variant
000028e4 | 6000032e                 | bra.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
000028e8 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000028ee | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000028f2 | 4eb900001c9a             | jsr          $1c9a.l                             ; call subroutine; push return address
000028f8 | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000028fa | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002900 | 91f9000008fc             | suba.l       $8fc.l, a0                          ; arithmetic operation; flags depend on variant
00002906 | b688                     | cmp.l        a0, d3                              ; compare operands; set condition flags
00002908 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000290a | 6e12                     | bgt.b        $291e                               ; branch according to condition flags (bra unconditional, bsr call)
0000290c | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002912 | 91c3                     | suba.l       d3, a0                              ; arithmetic operation; flags depend on variant
00002914 | 23c800000900             | move.l       a0, $900.l                          ; copy source to destination (Motorola operand order); flags depend on variant
0000291a | 600002f8                 | bra.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
0000291e | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002924 | 91f9000008fc             | suba.l       $8fc.l, a0                          ; arithmetic operation; flags depend on variant
0000292a | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000292c | 9088                     | sub.l        a0, d0                              ; arithmetic operation; flags depend on variant
0000292e | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002934 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002938 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000293a | 3268003c                 | movea.w      $3c(a0), a1                         ; copy source to destination (Motorola operand order); flags depend on variant
0000293e | 2209                     | move.l       a1, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00002940 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
00002942 | 23c100000908             | move.l       d1, $908.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002948 | 600002ca                 | bra.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
0000294c | 4a79000003f2             | tst.w        $3f2.l                              ; machine operation; verify instruction and data boundaries
00002952 | 670000d6                 | beq.w        $2a2a                               ; branch according to condition flags (bra unconditional, bsr call)
00002956 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000295c | 91f9000008fc             | suba.l       $8fc.l, a0                          ; arithmetic operation; flags depend on variant
00002962 | 3279000003f2             | movea.w      $3f2.l, a1                          ; copy source to destination (Motorola operand order); flags depend on variant
00002968 | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000296a | d088                     | add.l        a0, d0                              ; arithmetic operation; flags depend on variant
0000296c | 0c8000000200             | cmpi.l       #$200, d0                           ; compare operands; set condition flags
00002972 | 6d06                     | blt.b        $297a                               ; branch according to condition flags (bra unconditional, bsr call)
00002974 | 4eb9000020ec             | jsr          $20ec.l                             ; call subroutine; push return address
0000297a | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002980 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00002984 | 4eb900001c9a             | jsr          $1c9a.l                             ; call subroutine; push return address
0000298a | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000298c | 3079000003f2             | movea.w      $3f2.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002992 | 2a08                     | move.l       a0, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
00002994 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002996 | 2205                     | move.l       d5, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00002998 | 4eb9000005e0             | jsr          $5e0.l                              ; call subroutine; push return address
0000299e | 2205                     | move.l       d5, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
000029a0 | 9280                     | sub.l        d0, d1                              ; arithmetic operation; flags depend on variant
000029a2 | 2c01                     | move.l       d1, d6                              ; copy source to destination (Motorola operand order); flags depend on variant
000029a4 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000029a6 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000029a8 | 6078                     | bra.b        $2a22                               ; branch according to condition flags (bra unconditional, bsr call)
000029aa | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000029ac | b0b900000908             | cmp.l        $908.l, d0                          ; compare operands; set condition flags
000029b2 | 6626                     | bne.b        $29da                               ; branch according to condition flags (bra unconditional, bsr call)
000029b4 | 207900000900             | movea.l      $900.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000029ba | 10bc0020                 | move.b       #$20, (a0)                          ; copy source to destination (Motorola operand order); flags depend on variant
000029be | 207900000900             | movea.l      $900.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000029c4 | b1f900000904             | cmpa.l       $904.l, a0                          ; compare operands; set condition flags
000029ca | 6606                     | bne.b        $29d2                               ; branch according to condition flags (bra unconditional, bsr call)
000029cc | 52b900000904             | addq.l       #$1, $904.l                         ; arithmetic operation; flags depend on variant
000029d2 | 52b900000900             | addq.l       #$1, $900.l                         ; arithmetic operation; flags depend on variant
000029d8 | 6046                     | bra.b        $2a20                               ; branch according to condition flags (bra unconditional, bsr call)
000029da | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000029e0 | 2468009c                 | movea.l      $9c(a0), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
000029e4 | 2f3900000908             | move.l       $908.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000029ea | 203900000908             | move.l       $908.l, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000029f0 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000029f2 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000029f4 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000029f6 | a9d1                     | dc.w         $a9d1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000029f8 | 3f3c0020                 | move.w       #$20, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
000029fc | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000029fe | a9dc                     | dc.w         $a9dc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002a00 | 52b900000908             | addq.l       #$1, $908.l                         ; arithmetic operation; flags depend on variant
00002a06 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002a08 | 3028003c                 | move.w       $3c(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002a0c | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00002a0e | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00002a10 | b0b900000908             | cmp.l        $908.l, d0                          ; compare operands; set condition flags
00002a16 | 6608                     | bne.b        $2a20                               ; branch according to condition flags (bra unconditional, bsr call)
00002a18 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002a1a | 23c000000908             | move.l       d0, $908.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002a20 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00002a22 | b686                     | cmp.l        d6, d3                              ; compare operands; set condition flags
00002a24 | 6d84                     | blt.b        $29aa                               ; branch according to condition flags (bra unconditional, bsr call)
00002a26 | 600001ec                 | bra.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002a2a | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002a2c | b0b900000908             | cmp.l        $908.l, d0                          ; compare operands; set condition flags
00002a32 | 6628                     | bne.b        $2a5c                               ; branch according to condition flags (bra unconditional, bsr call)
00002a34 | 207900000900             | movea.l      $900.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002a3a | 10bc0009                 | move.b       #$9, (a0)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002a3e | 207900000900             | movea.l      $900.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002a44 | b1f900000904             | cmpa.l       $904.l, a0                          ; compare operands; set condition flags
00002a4a | 6606                     | bne.b        $2a52                               ; branch according to condition flags (bra unconditional, bsr call)
00002a4c | 52b900000904             | addq.l       #$1, $904.l                         ; arithmetic operation; flags depend on variant
00002a52 | 52b900000900             | addq.l       #$1, $900.l                         ; arithmetic operation; flags depend on variant
00002a58 | 600001ba                 | bra.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002a5c | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002a62 | 2468009c                 | movea.l      $9c(a0), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
00002a66 | 2f3900000908             | move.l       $908.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002a6c | 203900000908             | move.l       $908.l, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002a72 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00002a74 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002a76 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002a78 | a9d1                     | dc.w         $a9d1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002a7a | 3f3c0009                 | move.w       #$9, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002a7e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002a80 | a9dc                     | dc.w         $a9dc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002a82 | 52b900000908             | addq.l       #$1, $908.l                         ; arithmetic operation; flags depend on variant
00002a88 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002a8a | 3028003c                 | move.w       $3c(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002a8e | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00002a90 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00002a92 | b0b900000908             | cmp.l        $908.l, d0                          ; compare operands; set condition flags
00002a98 | 6600017a                 | bne.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002a9c | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002a9e | 23c000000908             | move.l       d0, $908.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002aa4 | 6000016e                 | bra.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002aa8 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002aae | 91f9000008fc             | suba.l       $8fc.l, a0                          ; arithmetic operation; flags depend on variant
00002ab4 | 2279000008ec             | movea.l      $8ec.l, a1                          ; copy source to destination (Motorola operand order); flags depend on variant
00002aba | 302900a4                 | move.w       $a4(a1), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002abe | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00002ac0 | d088                     | add.l        a0, d0                              ; arithmetic operation; flags depend on variant
00002ac2 | 0c8000000200             | cmpi.l       #$200, d0                           ; compare operands; set condition flags
00002ac8 | 6d06                     | blt.b        $2ad0                               ; branch according to condition flags (bra unconditional, bsr call)
00002aca | 4eb9000020ec             | jsr          $20ec.l                             ; call subroutine; push return address
00002ad0 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002ad6 | 326800a4                 | movea.w      $a4(a0), a1                         ; copy source to destination (Motorola operand order); flags depend on variant
00002ada | 2609                     | move.l       a1, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00002adc | 6024                     | bra.b        $2b02                               ; branch according to condition flags (bra unconditional, bsr call)
00002ade | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002ae4 | 10bc000d                 | move.b       #$d, (a0)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002ae8 | 52b900000904             | addq.l       #$1, $904.l                         ; arithmetic operation; flags depend on variant
00002aee | 23f90000090400000900     | move.l       $904.l, $900.l                      ; copy source to destination (Motorola operand order); flags depend on variant
00002af8 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002afa | 23c000000908             | move.l       d0, $908.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b00 | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00002b02 | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00002b04 | 6ed8                     | bgt.b        $2ade                               ; branch according to condition flags (bra unconditional, bsr call)
00002b06 | 6000010c                 | bra.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002b0a | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b0e | a9c8                     | dc.w         $a9c8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002b10 | 60000102                 | bra.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002b14 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b1a | 91f9000008fc             | suba.l       $8fc.l, a0                          ; arithmetic operation; flags depend on variant
00002b20 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002b22 | 673e                     | beq.b        $2b62                               ; branch according to condition flags (bra unconditional, bsr call)
00002b24 | 207900000900             | movea.l      $900.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b2a | b1f900000904             | cmpa.l       $904.l, a0                          ; compare operands; set condition flags
00002b30 | 6720                     | beq.b        $2b52                               ; branch according to condition flags (bra unconditional, bsr call)
00002b32 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b38 | 91f900000900             | suba.l       $900.l, a0                          ; arithmetic operation; flags depend on variant
00002b3e | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002b40 | 207900000900             | movea.l      $900.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b46 | 227900000900             | movea.l      $900.l, a1                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b4c | 43e9ffff                 | lea.l        -$1(a1), a1                         ; machine operation; verify instruction and data boundaries
00002b50 | a22e                     | dc.w         $a22e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002b52 | 53b900000904             | subq.l       #$1, $904.l                         ; arithmetic operation; flags depend on variant
00002b58 | 53b900000900             | subq.l       #$1, $900.l                         ; arithmetic operation; flags depend on variant
00002b5e | 600000b4                 | bra.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002b62 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b68 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002b6c | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002b6e | 3628003c                 | move.w       $3c(a0), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00002b72 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00002b74 | 6f00009e                 | ble.w        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002b78 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002b7a | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00002b7c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00002b7e | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002b80 | 3043                     | movea.w      d3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002b82 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002b84 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b8a | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00002b8e | a9d1                     | dc.w         $a9d1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002b90 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002b96 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00002b9a | a9d7                     | dc.w         $a9d7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002b9c | 6076                     | bra.b        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002b9e | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002ba0 | b0b900000908             | cmp.l        $908.l, d0                          ; compare operands; set condition flags
00002ba6 | 6624                     | bne.b        $2bcc                               ; branch according to condition flags (bra unconditional, bsr call)
00002ba8 | 207900000900             | movea.l      $900.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002bae | 1083                     | move.b       d3, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
00002bb0 | 207900000900             | movea.l      $900.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002bb6 | b1f900000904             | cmpa.l       $904.l, a0                          ; compare operands; set condition flags
00002bbc | 6606                     | bne.b        $2bc4                               ; branch according to condition flags (bra unconditional, bsr call)
00002bbe | 52b900000904             | addq.l       #$1, $904.l                         ; arithmetic operation; flags depend on variant
00002bc4 | 52b900000900             | addq.l       #$1, $900.l                         ; arithmetic operation; flags depend on variant
00002bca | 6048                     | bra.b        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002bcc | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002bd2 | 2468009c                 | movea.l      $9c(a0), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
00002bd6 | 2f3900000908             | move.l       $908.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002bdc | 203900000908             | move.l       $908.l, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002be2 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00002be4 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002be6 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002be8 | a9d1                     | dc.w         $a9d1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002bea | 1003                     | move.b       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002bec | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00002bee | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002bf0 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002bf2 | a9dc                     | dc.w         $a9dc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002bf4 | 52b900000908             | addq.l       #$1, $908.l                         ; arithmetic operation; flags depend on variant
00002bfa | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002bfc | 3028003c                 | move.w       $3c(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002c00 | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00002c02 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00002c04 | b0b900000908             | cmp.l        $908.l, d0                          ; compare operands; set condition flags
00002c0a | 6608                     | bne.b        $2c14                               ; branch according to condition flags (bra unconditional, bsr call)
00002c0c | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002c0e | 23c000000908             | move.l       d0, $908.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002c14 | 207900000904             | movea.l      $904.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002c1a | 91f9000008fc             | suba.l       $8fc.l, a0                          ; arithmetic operation; flags depend on variant
00002c20 | b0fc0200                 | cmpa.w       #$200, a0                           ; compare operands; set condition flags
00002c24 | 6d06                     | blt.b        $2c2c                               ; branch according to condition flags (bra unconditional, bsr call)
00002c26 | 4eb9000020ec             | jsr          $20ec.l                             ; call subroutine; push return address
00002c2c | 5384                     | subq.l       #$1, d4                             ; arithmetic operation; flags depend on variant
00002c2e | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
00002c30 | 6e00fc60                 | bgt.w        $2892                               ; branch according to condition flags (bra unconditional, bsr call)
00002c34 | 4eb9000020ec             | jsr          $20ec.l                             ; call subroutine; push return address
00002c3a | 13fc0001000008ea         | move.b       #$1, $8ea.l                         ; copy source to destination (Motorola operand order); flags depend on variant
00002c42 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002c48 | 4eb900003a82             | jsr          $3a82.l                             ; call subroutine; push return address
00002c4e | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00002c52 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002c54 | 2007                     | move.l       d7, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002c56 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002c58 | 4cdf04f8                 | movem.l      (a7)+, d3-d7/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00002c5c | 4e5e                     | unlk         a6                                  ; restore stack frame
00002c5e | 4e75                     | rts                                              ; return: pop return address from stack
00002c60 | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00002c64 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002c66 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002c68 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00002c6a | 2f3c54455854             | move.l       #$54455854, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00002c70 | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
00002c74 | a9fd                     | dc.w         $a9fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002c76 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002c78 | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00002c7a | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00002c7c | 6c04                     | bge.b        $2c82                               ; branch according to condition flags (bra unconditional, bsr call)
00002c7e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002c80 | 6058                     | bra.b        $2cda                               ; branch according to condition flags (bra unconditional, bsr call)
00002c82 | 0c8300007d00             | cmpi.l       #$7d00, d3                          ; compare operands; set condition flags
00002c88 | 6f06                     | ble.b        $2c90                               ; branch according to condition flags (bra unconditional, bsr call)
00002c8a | 303cfe0b                 | move.w       #$fe0b, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002c8e | 604a                     | bra.b        $2cda                               ; branch according to condition flags (bra unconditional, bsr call)
00002c90 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002c92 | 2eb80ab4                 | move.l       $ab4.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002c96 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002c98 | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002c9a | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002c9c | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002c9e | 2eb80ab4                 | move.l       $ab4.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002ca2 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002ca4 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002ca6 | 2f3c54455854             | move.l       #$54455854, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00002cac | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
00002cb0 | a9fd                     | dc.w         $a9fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002cb2 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002cb4 | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00002cb6 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00002cb8 | 6c0e                     | bge.b        $2cc8                               ; branch according to condition flags (bra unconditional, bsr call)
00002cba | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002cbc | 2eb80ab4                 | move.l       $ab4.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002cc0 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002cc2 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002cc4 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00002cc6 | 6012                     | bra.b        $2cda                               ; branch according to condition flags (bra unconditional, bsr call)
00002cc8 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002cca | 2eb80ab4                 | move.l       $ab4.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002cce | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002cd0 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002cd2 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002cd4 | 31df0ab0                 | move.w       (a7)+, $ab0.w                       ; copy source to destination (Motorola operand order); flags depend on variant
00002cd8 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00002cda | 261f                     | move.l       (a7)+, d3                           ; copy source to destination (Motorola operand order); flags depend on variant
00002cdc | 4e5e                     | unlk         a6                                  ; restore stack frame
00002cde | 4e75                     | rts                                              ; return: pop return address from stack
00002ce0 | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00002ce4 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002ce6 | a9fc                     | dc.w         $a9fc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002ce8 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002cea | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002cec | 2eb80ab4                 | move.l       $ab4.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002cf0 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002cf2 | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002cf4 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002cf6 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00002cf8 | 3eb80ab0                 | move.w       $ab0.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002cfc | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002cfe | 7200                     | moveq        #$0, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00002d00 | 3200                     | move.w       d0, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00002d02 | 2f01                     | move.l       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002d04 | 2f3c54455854             | move.l       #$54455854, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00002d0a | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002d0c | 2eb80ab4                 | move.l       $ab4.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002d10 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002d12 | 2f10                     | move.l       (a0), -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00002d14 | a9fe                     | dc.w         $a9fe                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002d16 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002d18 | 2d40fffc                 | move.l       d0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00002d1c | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002d1e | 2eb80ab4                 | move.l       $ab4.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002d22 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002d24 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002d26 | 302efffe                 | move.w       -$2(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002d2a | 4e5e                     | unlk         a6                                  ; restore stack frame
00002d2c | 4e75                     | rts                                              ; return: pop return address from stack
00002d2e | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00002d32 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002d34 | 3f3c7d00                 | move.w       #$7d00, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002d38 | 4879000003ea             | pea.l        $3ea.l                              ; machine operation; verify instruction and data boundaries
00002d3e | a931                     | dc.w         $a931                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002d40 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002d42 | 23c8000008d8             | move.l       a0, $8d8.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002d48 | 2f39000008d8             | move.l       $8d8.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002d4e | 4879000003da             | pea.l        $3da.l                              ; machine operation; verify instruction and data boundaries
00002d54 | a933                     | dc.w         $a933                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002d56 | 2f39000008d8             | move.l       $8d8.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002d5c | 2f3c44525652             | move.l       #$44525652, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00002d62 | a94d                     | dc.w         $a94d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002d64 | 2f39000008d8             | move.l       $8d8.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002d6a | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00002d6c | a935                     | dc.w         $a935                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002d6e | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002d70 | 3f3c7d01                 | move.w       #$7d01, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002d74 | 4879000003d5             | pea.l        $3d5.l                              ; machine operation; verify instruction and data boundaries
00002d7a | a931                     | dc.w         $a931                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002d7c | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002d7e | 23c8000008dc             | move.l       a0, $8dc.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002d84 | 2f39000008dc             | move.l       $8dc.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002d8a | 487900000390             | pea.l        $390.l                              ; machine operation; verify instruction and data boundaries
00002d90 | a933                     | dc.w         $a933                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002d92 | 2f39000008dc             | move.l       $8dc.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002d98 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00002d9a | a935                     | dc.w         $a935                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002d9c | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002d9e | 3f3c7d02                 | move.w       #$7d02, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002da2 | 48790000038b             | pea.l        $38b.l                              ; machine operation; verify instruction and data boundaries
00002da8 | a931                     | dc.w         $a931                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002daa | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002dac | 23c8000008e0             | move.l       a0, $8e0.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00002db2 | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002db8 | 487900000352             | pea.l        $352.l                              ; machine operation; verify instruction and data boundaries
00002dbe | a933                     | dc.w         $a933                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002dc0 | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002dc6 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00002dc8 | a935                     | dc.w         $a935                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002dca | a937                     | dc.w         $a937                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002dcc | 4e5e                     | unlk         a6                                  ; restore stack frame
00002dce | 4e75                     | rts                                              ; return: pop return address from stack
00002dd0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00002dd4 | 48e70038                 | movem.l      a2-a4, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002dd8 | 2f39000008dc             | move.l       $8dc.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002dde | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002de2 | a93a                     | dc.w         $a93a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002de4 | 2f39000008dc             | move.l       $8dc.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002dea | 3f3c0007                 | move.w       #$7, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002dee | a93a                     | dc.w         $a93a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002df0 | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002df6 | 3f3c0003                 | move.w       #$3, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002dfa | a93a                     | dc.w         $a93a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002dfc | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002e02 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e06 | a93a                     | dc.w         $a93a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002e08 | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002e0e | 3f3c0005                 | move.w       #$5, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e12 | a93a                     | dc.w         $a93a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002e14 | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002e1a | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e1e | a93a                     | dc.w         $a93a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002e20 | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002e26 | 3f3c0008                 | move.w       #$8, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e2a | a93a                     | dc.w         $a93a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002e2c | 0c390002000008ea         | cmpi.b       #$2, $8ea.l                         ; compare operands; set condition flags
00002e34 | 670000ba                 | beq.w        $2ef0                               ; branch according to condition flags (bra unconditional, bsr call)
00002e38 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002e3a | a924                     | dc.w         $a924                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002e3c | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002e3e | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00002e40 | 4eb900003824             | jsr          $3824.l                             ; call subroutine; push return address
00002e46 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00002e48 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002e4a | 670000a4                 | beq.w        $2ef0                               ; branch according to condition flags (bra unconditional, bsr call)
00002e4e | 2f39000008dc             | move.l       $8dc.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002e54 | 3f3c0007                 | move.w       #$7, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e58 | a939                     | dc.w         $a939                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002e5a | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002e60 | 3f3c0005                 | move.w       #$5, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e64 | a939                     | dc.w         $a939                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002e66 | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002e6c | 3f3c0008                 | move.w       #$8, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e70 | a939                     | dc.w         $a939                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002e72 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e78 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002e7c | 2450                     | movea.l      (a0), a2                            ; copy source to destination (Motorola operand order); flags depend on variant
00002e7e | 302a0020                 | move.w       $20(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002e82 | b06a0022                 | cmp.w        $22(a2), d0                         ; compare operands; set condition flags
00002e86 | 670c                     | beq.b        $2e94                               ; branch according to condition flags (bra unconditional, bsr call)
00002e88 | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002e8e | 3f3c0003                 | move.w       #$3, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e92 | a939                     | dc.w         $a939                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002e94 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002e9a | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002e9e | 2650                     | movea.l      (a0), a3                            ; copy source to destination (Motorola operand order); flags depend on variant
00002ea0 | 302b0020                 | move.w       $20(a3), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002ea4 | b06b0022                 | cmp.w        $22(a3), d0                         ; compare operands; set condition flags
00002ea8 | 670c                     | beq.b        $2eb6                               ; branch according to condition flags (bra unconditional, bsr call)
00002eaa | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002eb0 | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002eb4 | a939                     | dc.w         $a939                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002eb6 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002ebc | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002ec0 | 2850                     | movea.l      (a0), a4                            ; copy source to destination (Motorola operand order); flags depend on variant
00002ec2 | 302c0020                 | move.w       $20(a4), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002ec6 | b06c0022                 | cmp.w        $22(a4), d0                         ; compare operands; set condition flags
00002eca | 670c                     | beq.b        $2ed8                               ; branch according to condition flags (bra unconditional, bsr call)
00002ecc | 2f39000008e0             | move.l       $8e0.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002ed2 | 3f3c0006                 | move.w       #$6, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002ed6 | a939                     | dc.w         $a939                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002ed8 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002ede | 4a2800a6                 | tst.b        $a6(a0)                             ; machine operation; verify instruction and data boundaries
00002ee2 | 670c                     | beq.b        $2ef0                               ; branch according to condition flags (bra unconditional, bsr call)
00002ee4 | 2f39000008dc             | move.l       $8dc.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002eea | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002eee | a939                     | dc.w         $a939                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002ef0 | 4cdf1c00                 | movem.l      (a7)+, a2-a4                        ; copy source to destination (Motorola operand order); flags depend on variant
00002ef4 | 4e5e                     | unlk         a6                                  ; restore stack frame
00002ef6 | 4e75                     | rts                                              ; return: pop return address from stack
00002ef8 | 4e56fe38                 | link.w       a6, #$fe38                          ; establish stack frame
00002efc | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00002f00 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002f06 | 2468009c                 | movea.l      $9c(a0), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
00002f0a | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002f0c | 3268003c                 | movea.w      $3c(a0), a1                         ; copy source to destination (Motorola operand order); flags depend on variant
00002f10 | 2809                     | move.l       a1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00002f12 | 2d790000034eff38         | move.l       $34e.l, -$c8(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00002f1a | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002f1c | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002f20 | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002f22 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002f28 | 4aa800aa                 | tst.l        $aa(a0)                             ; machine operation; verify instruction and data boundaries
00002f2c | 67000086                 | beq.w        $2fb4                               ; branch according to condition flags (bra unconditional, bsr call)
00002f30 | 42aeff92                 | clr.l        -$6e(a6)                            ; bit/integer operation; flags depend on variant
00002f34 | 41e800ae                 | lea.l        $ae(a0), a0                         ; machine operation; verify instruction and data boundaries
00002f38 | 2d48ff98                 | move.l       a0, -$68(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002f3c | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002f42 | 3d6800a8ff9c             | move.w       $a8(a0), -$64(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00002f48 | 1d7c0002ffa1             | move.b       #$2, -$5f(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002f4e | 2d6800aaffb6             | move.l       $aa(a0), -$4a(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00002f54 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00002f58 | 701a                     | moveq        #$1a, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002f5a | a260                     | dc.w         $a260                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002f5c | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00002f5e | 6654                     | bne.b        $2fb4                               ; branch according to condition flags (bra unconditional, bsr call)
00002f60 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002f62 | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00002f66 | 2d50ffa6                 | move.l       (a0), -$5a(a6)                      ; copy source to destination (Motorola operand order); flags depend on variant
00002f6a | 2d44ffaa                 | move.l       d4, -$56(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002f6e | 3d7c0001ffb2             | move.w       #$1, -$4e(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002f74 | 42aeffb4                 | clr.l        -$4c(a6)                            ; bit/integer operation; flags depend on variant
00002f78 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00002f7c | a003                     | dc.w         $a003                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002f7e | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00002f80 | 66000178                 | bne.w        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
00002f84 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00002f86 | 3268003c                 | movea.w      $3c(a0), a1                         ; copy source to destination (Motorola operand order); flags depend on variant
00002f8a | b3eeffae                 | cmpa.l       -$52(a6), a1                        ; compare operands; set condition flags
00002f8e | 6600016a                 | bne.w        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
00002f92 | 2d6effaeffa2             | move.l       -$52(a6), -$5e(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00002f98 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00002f9c | a012                     | dc.w         $a012                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002f9e | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00002fa0 | 66000158                 | bne.w        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
00002fa4 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00002fa8 | a001                     | dc.w         $a001                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002faa | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00002fac | 6600014c                 | bne.w        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
00002fb0 | 6000016c                 | bra.w        $311e                               ; branch according to condition flags (bra unconditional, bsr call)
00002fb4 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00002fba | 486efe38                 | pea.l        -$1c8(a6)                           ; machine operation; verify instruction and data boundaries
00002fbe | a919                     | dc.w         $a919                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002fc0 | 2f2eff38                 | move.l       -$c8(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00002fc4 | 48790000033a             | pea.l        $33a.l                              ; machine operation; verify instruction and data boundaries
00002fca | 486efe38                 | pea.l        -$1c8(a6)                           ; machine operation; verify instruction and data boundaries
00002fce | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00002fd0 | 486eff3c                 | pea.l        -$c4(a6)                            ; machine operation; verify instruction and data boundaries
00002fd4 | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00002fd8 | a9ea                     | dc.w         $a9ea                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00002fda | 4a2eff3c                 | tst.b        -$c4(a6)                            ; machine operation; verify instruction and data boundaries
00002fde | 6700013a                 | beq.w        $311a                               ; branch according to condition flags (bra unconditional, bsr call)
00002fe2 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002fe8 | 316eff4200a8             | move.w       -$be(a6), $a8(a0)                   ; copy source to destination (Motorola operand order); flags depend on variant
00002fee | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00002ff0 | 2eb80398                 | move.l       $398.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00002ff4 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00002ff6 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00002ffc | 214000aa                 | move.l       d0, $aa(a0)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003000 | 41eeff46                 | lea.l        -$ba(a6), a0                        ; machine operation; verify instruction and data boundaries
00003004 | 2279000008ec             | movea.l      $8ec.l, a1                          ; copy source to destination (Motorola operand order); flags depend on variant
0000300a | 43e900ae                 | lea.l        $ae(a1), a1                         ; machine operation; verify instruction and data boundaries
0000300e | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003010 | 102eff46                 | move.b       -$ba(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00003014 | 5240                     | addq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00003016 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00003018 | a02e                     | dc.w         $a02e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000301a | 42aeff92                 | clr.l        -$6e(a6)                            ; bit/integer operation; flags depend on variant
0000301e | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003024 | 41e800ae                 | lea.l        $ae(a0), a0                         ; machine operation; verify instruction and data boundaries
00003028 | 2d48ff98                 | move.l       a0, -$68(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000302c | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003032 | 3d6800a8ff9c             | move.w       $a8(a0), -$64(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00003038 | 422effa5                 | clr.b        -$5b(a6)                            ; bit/integer operation; flags depend on variant
0000303c | 2d6800aaffb6             | move.l       $aa(a0), -$4a(a6)                   ; copy source to destination (Motorola operand order); flags depend on variant
00003042 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00003046 | a208                     | dc.w         $a208                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003048 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000304a | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
0000304c | 6708                     | beq.b        $3056                               ; branch according to condition flags (bra unconditional, bsr call)
0000304e | 0c43ffd0                 | cmpi.w       #$ffd0, d3                          ; compare operands; set condition flags
00003052 | 660000a6                 | bne.w        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
00003056 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00003058 | 2eb8020c                 | move.l       $20c.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000305c | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000305e | 2d40ffce                 | move.l       d0, -$32(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003062 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00003064 | 2eb8020c                 | move.l       $20c.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003068 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000306a | 2d40ffd2                 | move.l       d0, -$2e(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000306e | 2d7c54455854ffa6         | move.l       #$54455854, -$5a(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
00003076 | 2d7c43574945ffaa         | move.l       #$43574945, -$56(a6)                ; copy source to destination (Motorola operand order); flags depend on variant
0000307e | 426effae                 | clr.w        -$52(a6)                            ; bit/integer operation; flags depend on variant
00003082 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00003086 | a20d                     | dc.w         $a20d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003088 | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
0000308a | 666e                     | bne.b        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
0000308c | 1d7c0002ffa1             | move.b       #$2, -$5f(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003092 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00003096 | 701a                     | moveq        #$1a, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003098 | a260                     | dc.w         $a260                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000309a | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
0000309c | 665c                     | bne.b        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
0000309e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000030a0 | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
000030a4 | 2d50ffa6                 | move.l       (a0), -$5a(a6)                      ; copy source to destination (Motorola operand order); flags depend on variant
000030a8 | 2d44ffaa                 | move.l       d4, -$56(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000030ac | 3d7c0001ffb2             | move.w       #$1, -$4e(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
000030b2 | 42aeffb4                 | clr.l        -$4c(a6)                            ; bit/integer operation; flags depend on variant
000030b6 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
000030ba | a003                     | dc.w         $a003                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000030bc | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
000030be | 663a                     | bne.b        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
000030c0 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000030c2 | 3268003c                 | movea.w      $3c(a0), a1                         ; copy source to destination (Motorola operand order); flags depend on variant
000030c6 | b3eeffae                 | cmpa.l       -$52(a6), a1                        ; compare operands; set condition flags
000030ca | 662e                     | bne.b        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
000030cc | 2d6effaeffa2             | move.l       -$52(a6), -$5e(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
000030d2 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
000030d6 | a012                     | dc.w         $a012                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000030d8 | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
000030da | 661e                     | bne.b        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
000030dc | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
000030e0 | a001                     | dc.w         $a001                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000030e2 | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
000030e4 | 6614                     | bne.b        $30fa                               ; branch according to condition flags (bra unconditional, bsr call)
000030e6 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000030ec | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000030f2 | 486800ae                 | pea.l        $ae(a0)                             ; machine operation; verify instruction and data boundaries
000030f6 | a91a                     | dc.w         $a91a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000030f8 | 6024                     | bra.b        $311e                               ; branch according to condition flags (bra unconditional, bsr call)
000030fa | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000030fc | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003100 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003102 | 486dd420                 | pea.l        -$2be0(a5)                          ; machine operation; verify instruction and data boundaries
00003106 | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003108 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000310e | 486800ae                 | pea.l        $ae(a0)                             ; machine operation; verify instruction and data boundaries
00003112 | 4eb900004404             | jsr          $4404.l                             ; call subroutine; push return address
00003118 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000311a | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000311c | 6014                     | bra.b        $3132                               ; branch according to condition flags (bra unconditional, bsr call)
0000311e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003120 | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003124 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003126 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000312c | 422800a6                 | clr.b        $a6(a0)                             ; bit/integer operation; flags depend on variant
00003130 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003132 | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00003136 | 4e5e                     | unlk         a6                                  ; restore stack frame
00003138 | 4e75                     | rts                                              ; return: pop return address from stack
0000313a | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000313e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003140 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003146 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000314a | 3f39000008e4             | move.w       $8e4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003150 | 4eb900002296             | jsr          $2296.l                             ; call subroutine; push return address
00003156 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00003158 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
0000315a | 673a                     | beq.b        $3196                               ; branch according to condition flags (bra unconditional, bsr call)
0000315c | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003162 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003166 | 2450                     | movea.l      (a0), a2                            ; copy source to destination (Motorola operand order); flags depend on variant
00003168 | 302a0020                 | move.w       $20(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000316c | b06a0022                 | cmp.w        $22(a2), d0                         ; compare operands; set condition flags
00003170 | 6724                     | beq.b        $3196                               ; branch according to condition flags (bra unconditional, bsr call)
00003172 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003178 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000317c | a9d6                     | dc.w         $a9d6                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000317e | 4eb900002ce0             | jsr          $2ce0.l                             ; call subroutine; push return address
00003184 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000318a | 117c000100a6             | move.b       #$1, $a6(a0)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003190 | 4eb9000039be             | jsr          $39be.l                             ; call subroutine; push return address
00003196 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
00003198 | 4e5e                     | unlk         a6                                  ; restore stack frame
0000319a | 4e75                     | rts                                              ; return: pop return address from stack
0000319c | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000031a0 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000031a2 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000031a8 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
000031ac | 2450                     | movea.l      (a0), a2                            ; copy source to destination (Motorola operand order); flags depend on variant
000031ae | 302a0020                 | move.w       $20(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000031b2 | b06a0022                 | cmp.w        $22(a2), d0                         ; compare operands; set condition flags
000031b6 | 6712                     | beq.b        $31ca                               ; branch according to condition flags (bra unconditional, bsr call)
000031b8 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000031be | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000031c2 | a9d5                     | dc.w         $a9d5                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000031c4 | 4eb900002ce0             | jsr          $2ce0.l                             ; call subroutine; push return address
000031ca | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
000031cc | 4e5e                     | unlk         a6                                  ; restore stack frame
000031ce | 4e75                     | rts                                              ; return: pop return address from stack
000031d0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000031d4 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000031da | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000031de | 3f39000008e4             | move.w       $8e4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000031e4 | 4eb900002296             | jsr          $2296.l                             ; call subroutine; push return address
000031ea | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
000031ec | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
000031ee | 6728                     | beq.b        $3218                               ; branch according to condition flags (bra unconditional, bsr call)
000031f0 | 4eb900002c60             | jsr          $2c60.l                             ; call subroutine; push return address
000031f6 | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
000031f8 | 661e                     | bne.b        $3218                               ; branch according to condition flags (bra unconditional, bsr call)
000031fa | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003200 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003204 | a9db                     | dc.w         $a9db                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003206 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000320c | 117c000100a6             | move.b       #$1, $a6(a0)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003212 | 4eb9000039be             | jsr          $39be.l                             ; call subroutine; push return address
00003218 | 4e5e                     | unlk         a6                                  ; restore stack frame
0000321a | 4e75                     | rts                                              ; return: pop return address from stack
0000321c | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00003220 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003222 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003228 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000322c | 3f39000008e4             | move.w       $8e4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003232 | 4eb900002296             | jsr          $2296.l                             ; call subroutine; push return address
00003238 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
0000323a | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
0000323c | 6734                     | beq.b        $3272                               ; branch according to condition flags (bra unconditional, bsr call)
0000323e | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003244 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003248 | 2450                     | movea.l      (a0), a2                            ; copy source to destination (Motorola operand order); flags depend on variant
0000324a | 302a0020                 | move.w       $20(a2), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000324e | b06a0022                 | cmp.w        $22(a2), d0                         ; compare operands; set condition flags
00003252 | 671e                     | beq.b        $3272                               ; branch according to condition flags (bra unconditional, bsr call)
00003254 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000325a | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000325e | a9d7                     | dc.w         $a9d7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003260 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003266 | 117c000100a6             | move.b       #$1, $a6(a0)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000326c | 4eb9000039be             | jsr          $39be.l                             ; call subroutine; push return address
00003272 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
00003274 | 4e5e                     | unlk         a6                                  ; restore stack frame
00003276 | 4e75                     | rts                                              ; return: pop return address from stack
00003278 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000327c | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000327e | 48787fff                 | pea.l        $7fff.w                             ; machine operation; verify instruction and data boundaries
00003282 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003288 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000328c | a9d1                     | dc.w         $a9d1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000328e | 4eb9000039be             | jsr          $39be.l                             ; call subroutine; push return address
00003294 | 4e5e                     | unlk         a6                                  ; restore stack frame
00003296 | 4e75                     | rts                                              ; return: pop return address from stack
00003298 | 4e56ff00                 | link.w       a6, #$ff00                          ; establish stack frame
0000329c | 48e71c00                 | movem.l      d3-d5, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000032a0 | 2a2e0008                 | move.l       $8(a6), d5                          ; copy source to destination (Motorola operand order); flags depend on variant
000032a4 | 2805                     | move.l       d5, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000032a6 | 7210                     | moveq        #$10, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
000032a8 | e2a4                     | asr.l        d1, d4                              ; bit/integer operation; flags depend on variant
000032aa | 3605                     | move.w       d5, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000032ac | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000032ae | a924                     | dc.w         $a924                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000032b0 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000032b2 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000032b4 | 4eb900003824             | jsr          $3824.l                             ; call subroutine; push return address
000032ba | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
000032bc | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000032be | 670000d8                 | beq.w        $3398                               ; branch according to condition flags (bra unconditional, bsr call)
000032c2 | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000032c4 | 04407d00                 | subi.w       #$7d00, d0                          ; arithmetic operation; flags depend on variant
000032c8 | 670c                     | beq.b        $32d6                               ; branch according to condition flags (bra unconditional, bsr call)
000032ca | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
000032cc | 6736                     | beq.b        $3304                               ; branch according to condition flags (bra unconditional, bsr call)
000032ce | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
000032d0 | 6770                     | beq.b        $3342                               ; branch according to condition flags (bra unconditional, bsr call)
000032d2 | 600000b8                 | bra.w        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
000032d6 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000032d8 | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
000032da | 6702                     | beq.b        $32de                               ; branch according to condition flags (bra unconditional, bsr call)
000032dc | 600a                     | bra.b        $32e8                               ; branch according to condition flags (bra unconditional, bsr call)
000032de | 4eb900004260             | jsr          $4260.l                             ; call subroutine; push return address
000032e4 | 600000a6                 | bra.w        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
000032e8 | 2f39000008d8             | move.l       $8d8.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000032ee | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000032f0 | 486eff00                 | pea.l        -$100(a6)                           ; machine operation; verify instruction and data boundaries
000032f4 | a946                     | dc.w         $a946                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000032f6 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000032f8 | 486eff00                 | pea.l        -$100(a6)                           ; machine operation; verify instruction and data boundaries
000032fc | a9b6                     | dc.w         $a9b6                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000032fe | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003300 | 6000008a                 | bra.w        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
00003304 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003306 | 5940                     | subq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
00003308 | 670e                     | beq.b        $3318                               ; branch according to condition flags (bra unconditional, bsr call)
0000330a | 5540                     | subq.w       #$2, d0                             ; arithmetic operation; flags depend on variant
0000330c | 6712                     | beq.b        $3320                               ; branch according to condition flags (bra unconditional, bsr call)
0000330e | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00003310 | 6716                     | beq.b        $3328                               ; branch according to condition flags (bra unconditional, bsr call)
00003312 | 5540                     | subq.w       #$2, d0                             ; arithmetic operation; flags depend on variant
00003314 | 671a                     | beq.b        $3330                               ; branch according to condition flags (bra unconditional, bsr call)
00003316 | 6074                     | bra.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
00003318 | 4eb900002ef8             | jsr          $2ef8.l                             ; call subroutine; push return address
0000331e | 606c                     | bra.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
00003320 | 4eb90000341c             | jsr          $341c.l                             ; call subroutine; push return address
00003326 | 6064                     | bra.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
00003328 | 4eb9000036a8             | jsr          $36a8.l                             ; call subroutine; push return address
0000332e | 605c                     | bra.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
00003330 | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
00003336 | 6754                     | beq.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
00003338 | 13fc0001000008e6         | move.b       #$1, $8e6.l                         ; copy source to destination (Motorola operand order); flags depend on variant
00003340 | 604a                     | bra.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
00003342 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003344 | 0c400008                 | cmpi.w       #$8, d0                             ; compare operands; set condition flags
00003348 | 6242                     | bhi.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
0000334a | d040                     | add.w        d0, d0                              ; arithmetic operation; flags depend on variant
0000334c | 303b0006                 | move.w       $3354(pc, d0.w), d0                 ; copy source to destination (Motorola operand order); flags depend on variant
00003350 | 4efb0002                 | jmp          $3354(pc, d0.w)                     ; machine operation; verify instruction and data boundaries
00003354 | 003800380038             | ori.b        #$38, $38.w                         ; bit/integer operation; flags depend on variant
0000335a | 0012001a                 | ori.b        #$1a, (a2)                          ; bit/integer operation; flags depend on variant
0000335e | 0022002a                 | ori.b        #$2a, -(a2)                         ; bit/integer operation; flags depend on variant
00003362 | 003800324eb9             | ori.b        #$32, $4eb9.w                       ; bit/integer operation; flags depend on variant
00003368 | 0000313a                 | ori.b        #$3a, d0                            ; bit/integer operation; flags depend on variant
0000336c | 601e                     | bra.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
0000336e | 4eb90000319c             | jsr          $319c.l                             ; call subroutine; push return address
00003374 | 6016                     | bra.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
00003376 | 4eb9000031d0             | jsr          $31d0.l                             ; call subroutine; push return address
0000337c | 600e                     | bra.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
0000337e | 4eb90000321c             | jsr          $321c.l                             ; call subroutine; push return address
00003384 | 6006                     | bra.b        $338c                               ; branch according to condition flags (bra unconditional, bsr call)
00003386 | 4eb900003278             | jsr          $3278.l                             ; call subroutine; push return address
0000338c | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
00003392 | 6704                     | beq.b        $3398                               ; branch according to condition flags (bra unconditional, bsr call)
00003394 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003396 | a938                     | dc.w         $a938                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003398 | 4cdf0038                 | movem.l      (a7)+, d3-d5                        ; copy source to destination (Motorola operand order); flags depend on variant
0000339c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000339e | 4e75                     | rts                                              ; return: pop return address from stack
000033a0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000033a4 | 4ab9000008d4             | tst.l        $8d4.l                              ; machine operation; verify instruction and data boundaries
000033aa | 6650                     | bne.b        $33fc                               ; branch according to condition flags (bra unconditional, bsr call)
000033ac | 2f3cc8000000             | move.l       #$c8000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000033b2 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000033b4 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000033b6 | 2f3cba000000             | move.l       #$ba000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000033bc | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000033be | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000033c0 | 6704                     | beq.b        $33c6                               ; branch according to condition flags (bra unconditional, bsr call)
000033c2 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000033c4 | 6052                     | bra.b        $3418                               ; branch according to condition flags (bra unconditional, bsr call)
000033c6 | 7078                     | moveq        #$78, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000033c8 | a122                     | dc.w         $a122                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000033ca | 23c8000008d4             | move.l       a0, $8d4.l                          ; copy source to destination (Motorola operand order); flags depend on variant
000033d0 | 4ab9000008d4             | tst.l        $8d4.l                              ; machine operation; verify instruction and data boundaries
000033d6 | 6728                     | beq.b        $3400                               ; branch according to condition flags (bra unconditional, bsr call)
000033d8 | 2f39000008d4             | move.l       $8d4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000033de | 2f3c20040480             | move.l       #$20040480, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000033e4 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000033e6 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000033e8 | 2f3cba000000             | move.l       #$ba000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000033ee | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000033f0 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000033f2 | 660c                     | bne.b        $3400                               ; branch according to condition flags (bra unconditional, bsr call)
000033f4 | 2f3cd0000000             | move.l       #$d0000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000033fa | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000033fc | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000033fe | 6018                     | bra.b        $3418                               ; branch according to condition flags (bra unconditional, bsr call)
00003400 | 2079000008d4             | movea.l      $8d4.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003406 | a023                     | dc.w         $a023                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003408 | 42b9000008d4             | clr.l        $8d4.l                              ; bit/integer operation; flags depend on variant
0000340e | 2f3cd0000000             | move.l       #$d0000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00003414 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003416 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003418 | 4e5e                     | unlk         a6                                  ; restore stack frame
0000341a | 4e75                     | rts                                              ; return: pop return address from stack
0000341c | 4e56fffe                 | link.w       a6, #$fffe                          ; establish stack frame
00003420 | 4eb9000033a0             | jsr          $33a0.l                             ; call subroutine; push return address
00003426 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00003428 | 6734                     | beq.b        $345e                               ; branch according to condition flags (bra unconditional, bsr call)
0000342a | 2f3cc8000000             | move.l       #$c8000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00003430 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003432 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003434 | 2f3cba000000             | move.l       #$ba000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
0000343a | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000343c | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000343e | 661e                     | bne.b        $345e                               ; branch according to condition flags (bra unconditional, bsr call)
00003440 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003442 | 2f39000008d4             | move.l       $8d4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003448 | 2f3c2a040484             | move.l       #$2a040484, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
0000344e | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003450 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003452 | 1d40ffff                 | move.b       d0, -$1(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003456 | 2f3cd0000000             | move.l       #$d0000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
0000345c | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000345e | 4e5e                     | unlk         a6                                  ; restore stack frame
00003460 | 4e75                     | rts                                              ; return: pop return address from stack
00003462 | 4e56fffe                 | link.w       a6, #$fffe                          ; establish stack frame
00003466 | 48e70038                 | movem.l      a2-a4, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000346a | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
0000346e | 264a                     | movea.l      a2, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00003470 | 284a                     | movea.l      a2, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
00003472 | d8ee000c                 | adda.w       $c(a6), a4                          ; arithmetic operation; flags depend on variant
00003476 | 6024                     | bra.b        $349c                               ; branch according to condition flags (bra unconditional, bsr call)
00003478 | 528b                     | addq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
0000347a | b7cc                     | cmpa.l       a4, a3                              ; compare operands; set condition flags
0000347c | 65fa                     | bcs.b        $3478                               ; branch according to condition flags (bra unconditional, bsr call)
0000347e | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003480 | 91ca                     | suba.l       a2, a0                              ; arithmetic operation; flags depend on variant
00003482 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003484 | 3d40fffe                 | move.w       d0, -$2(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003488 | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
0000348a | 6f0e                     | ble.b        $349a                               ; branch according to condition flags (bra unconditional, bsr call)
0000348c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000348e | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003490 | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003492 | 91ca                     | suba.l       a2, a0                              ; arithmetic operation; flags depend on variant
00003494 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003496 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003498 | a885                     | dc.w         $a885                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000349a | 244b                     | movea.l      a3, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000349c | b5cc                     | cmpa.l       a4, a2                              ; compare operands; set condition flags
0000349e | 65da                     | bcs.b        $347a                               ; branch according to condition flags (bra unconditional, bsr call)
000034a0 | 4cdf1c00                 | movem.l      (a7)+, a2-a4                        ; copy source to destination (Motorola operand order); flags depend on variant
000034a4 | 4e5e                     | unlk         a6                                  ; restore stack frame
000034a6 | 4e75                     | rts                                              ; return: pop return address from stack
000034a8 | 4e56ff68                 | link.w       a6, #$ff68                          ; establish stack frame
000034ac | 48e71f38                 | movem.l      d3-d7/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
000034b0 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
000034b4 | 2e2e000c                 | move.l       $c(a6), d7                          ; copy source to destination (Motorola operand order); flags depend on variant
000034b8 | 246e0010                 | movea.l      $10(a6), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
000034bc | 426eff68                 | clr.w        -$98(a6)                            ; bit/integer operation; flags depend on variant
000034c0 | 7a00                     | moveq        #$0, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
000034c2 | 7c00                     | moveq        #$0, d6                             ; copy source to destination (Motorola operand order); flags depend on variant
000034c4 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000034c6 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000034c8 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000034ca | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000034cc | 2f3c04000c00             | move.l       #$4000c00, -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
000034d2 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000034d4 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000034d6 | 2848                     | movea.l      a0, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
000034d8 | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000034da | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000034dc | 3f2e0014                 | move.w       $14(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000034e0 | a887                     | dc.w         $a887                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000034e2 | 3f2e0016                 | move.w       $16(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000034e6 | a88a                     | dc.w         $a88a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000034e8 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000034ea | a888                     | dc.w         $a888                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000034ec | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000034ee | 2d680008fff8             | move.l       $8(a0), -$8(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
000034f4 | 2d68000cfffc             | move.l       $c(a0), -$4(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
000034fa | 486effb0                 | pea.l        -$50(a6)                            ; machine operation; verify instruction and data boundaries
000034fe | a88b                     | dc.w         $a88b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003500 | 382effb6                 | move.w       -$4a(a6), d4                        ; copy source to destination (Motorola operand order); flags depend on variant
00003504 | d86effb0                 | add.w        -$50(a6), d4                        ; arithmetic operation; flags depend on variant
00003508 | d86effb2                 | add.w        -$4e(a6), d4                        ; arithmetic operation; flags depend on variant
0000350c | 302efffc                 | move.w       -$4(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003510 | 906efff8                 | sub.w        -$8(a6), d0                         ; arithmetic operation; flags depend on variant
00003514 | 04400028                 | subi.w       #$28, d0                            ; arithmetic operation; flags depend on variant
00003518 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000351a | 81c4                     | divs.w       d4, d0                              ; arithmetic operation; flags depend on variant
0000351c | 3d40ff6e                 | move.w       d0, -$92(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003520 | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003522 | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003524 | 2613                     | move.l       (a3), d3                            ; copy source to destination (Motorola operand order); flags depend on variant
00003526 | 2443                     | movea.l      d3, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00003528 | 6000015e                 | bra.w        $3688                               ; branch according to condition flags (bra unconditional, bsr call)
0000352c | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000352e | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00003530 | 2f3c10000808             | move.l       #$10000808, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00003536 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003538 | 5285                     | addq.l       #$1, d5                             ; arithmetic operation; flags depend on variant
0000353a | dc6eff6e                 | add.w        -$92(a6), d6                        ; arithmetic operation; flags depend on variant
0000353e | 41f9000002ee             | lea.l        $2ee.l, a0                          ; machine operation; verify instruction and data boundaries
00003544 | 43eeffb8                 | lea.l        -$48(a6), a1                        ; machine operation; verify instruction and data boundaries
00003548 | 700f                     | moveq        #$f, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000354a | 22d8                     | move.l       (a0)+, (a1)+                        ; copy source to destination (Motorola operand order); flags depend on variant
0000354c | 51c8fffc                 | dbra         d0, $354a                           ; machine operation; verify instruction and data boundaries
00003550 | 3f3c0003                 | move.w       #$3, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00003554 | a887                     | dc.w         $a887                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003556 | 3f3c0009                 | move.w       #$9, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000355a | a88a                     | dc.w         $a88a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000355c | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00003560 | a888                     | dc.w         $a888                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003562 | 7014                     | moveq        #$14, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003564 | d06efffa                 | add.w        -$6(a6), d0                         ; arithmetic operation; flags depend on variant
00003568 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000356a | 7009                     | moveq        #$9, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000356c | d06efff8                 | add.w        -$8(a6), d0                         ; arithmetic operation; flags depend on variant
00003570 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003572 | a893                     | dc.w         $a893                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003574 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000357a | 486eff70                 | pea.l        -$90(a6)                            ; machine operation; verify instruction and data boundaries
0000357e | a919                     | dc.w         $a919                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003580 | 486eff70                 | pea.l        -$90(a6)                            ; machine operation; verify instruction and data boundaries
00003584 | a884                     | dc.w         $a884                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003586 | 2f05                     | move.l       d5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003588 | 4879000002ea             | pea.l        $2ea.l                              ; machine operation; verify instruction and data boundaries
0000358e | 486eff70                 | pea.l        -$90(a6)                            ; machine operation; verify instruction and data boundaries
00003592 | 4eb900000518             | jsr          $518.l                              ; call subroutine; push return address
00003598 | 486eff70                 | pea.l        -$90(a6)                            ; machine operation; verify instruction and data boundaries
0000359c | 486effb8                 | pea.l        -$48(a6)                            ; machine operation; verify instruction and data boundaries
000035a0 | 4eb9000018b4             | jsr          $18b4.l                             ; call subroutine; push return address
000035a6 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000035a8 | 486effb8                 | pea.l        -$48(a6)                            ; machine operation; verify instruction and data boundaries
000035ac | a88c                     | dc.w         $a88c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000035ae | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000035b0 | 322efffe                 | move.w       -$2(a6), d1                         ; copy source to destination (Motorola operand order); flags depend on variant
000035b4 | 04410014                 | subi.w       #$14, d1                            ; arithmetic operation; flags depend on variant
000035b8 | 9240                     | sub.w        d0, d1                              ; arithmetic operation; flags depend on variant
000035ba | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000035bc | 7009                     | moveq        #$9, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000035be | d06efff8                 | add.w        -$8(a6), d0                         ; arithmetic operation; flags depend on variant
000035c2 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000035c4 | a893                     | dc.w         $a893                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000035c6 | 486effb8                 | pea.l        -$48(a6)                            ; machine operation; verify instruction and data boundaries
000035ca | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000035cc | 41eeffb8                 | lea.l        -$48(a6), a0                        ; machine operation; verify instruction and data boundaries
000035d0 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000035d2 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000035d4 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
000035d6 | 66fa                     | bne.b        $35d2                               ; branch according to condition flags (bra unconditional, bsr call)
000035d8 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000035da | a885                     | dc.w         $a885                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000035dc | 7014                     | moveq        #$14, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000035de | d06efffa                 | add.w        -$6(a6), d0                         ; arithmetic operation; flags depend on variant
000035e2 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000035e4 | 700f                     | moveq        #$f, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000035e6 | d06efff8                 | add.w        -$8(a6), d0                         ; arithmetic operation; flags depend on variant
000035ea | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000035ec | a893                     | dc.w         $a893                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000035ee | 70d8                     | moveq        #$d8, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000035f0 | d06efffe                 | add.w        -$2(a6), d0                         ; arithmetic operation; flags depend on variant
000035f4 | 906efffa                 | sub.w        -$6(a6), d0                         ; arithmetic operation; flags depend on variant
000035f8 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000035fa | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000035fc | a892                     | dc.w         $a892                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000035fe | 3f2e0014                 | move.w       $14(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003602 | a887                     | dc.w         $a887                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003604 | 3f2e0016                 | move.w       $16(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003608 | a88a                     | dc.w         $a88a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000360a | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
0000360c | a888                     | dc.w         $a888                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000360e | 7014                     | moveq        #$14, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003610 | d06efffa                 | add.w        -$6(a6), d0                         ; arithmetic operation; flags depend on variant
00003614 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003616 | 7014                     | moveq        #$14, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003618 | d06efff8                 | add.w        -$8(a6), d0                         ; arithmetic operation; flags depend on variant
0000361c | d044                     | add.w        d4, d0                              ; arithmetic operation; flags depend on variant
0000361e | 3d40ff6c                 | move.w       d0, -$94(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003622 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003624 | a893                     | dc.w         $a893                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003626 | 4fef0014                 | lea.l        $14(a7), a7                         ; machine operation; verify instruction and data boundaries
0000362a | 6040                     | bra.b        $366c                               ; branch according to condition flags (bra unconditional, bsr call)
0000362c | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000362e | d1c7                     | adda.l       d7, a0                              ; arithmetic operation; flags depend on variant
00003630 | b5c8                     | cmpa.l       a0, a2                              ; compare operands; set condition flags
00003632 | 6206                     | bhi.b        $363a                               ; branch according to condition flags (bra unconditional, bsr call)
00003634 | 0c1a000d                 | cmpi.b       #$d, (a2)+                          ; compare operands; set condition flags
00003638 | 66f2                     | bne.b        $362c                               ; branch according to condition flags (bra unconditional, bsr call)
0000363a | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000363c | 91c3                     | suba.l       d3, a0                              ; arithmetic operation; flags depend on variant
0000363e | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003640 | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00003642 | 3d40ff6a                 | move.w       d0, -$96(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003646 | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00003648 | 6f0e                     | ble.b        $3658                               ; branch according to condition flags (bra unconditional, bsr call)
0000364a | 3f2eff6a                 | move.w       -$96(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000364e | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003650 | 4eb900003462             | jsr          $3462.l                             ; call subroutine; push return address
00003656 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00003658 | 7014                     | moveq        #$14, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000365a | d06efffa                 | add.w        -$6(a6), d0                         ; arithmetic operation; flags depend on variant
0000365e | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003660 | d96eff6c                 | add.w        d4, -$94(a6)                        ; arithmetic operation; flags depend on variant
00003664 | 3f2eff6c                 | move.w       -$94(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003668 | a893                     | dc.w         $a893                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000366a | 260a                     | move.l       a2, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000366c | 526eff68                 | addq.w       #$1, -$98(a6)                       ; arithmetic operation; flags depend on variant
00003670 | bc6eff68                 | cmp.w        -$98(a6), d6                        ; compare operands; set condition flags
00003674 | 6708                     | beq.b        $367e                               ; branch according to condition flags (bra unconditional, bsr call)
00003676 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003678 | d1c7                     | adda.l       d7, a0                              ; arithmetic operation; flags depend on variant
0000367a | b5c8                     | cmpa.l       a0, a2                              ; compare operands; set condition flags
0000367c | 65ae                     | bcs.b        $362c                               ; branch according to condition flags (bra unconditional, bsr call)
0000367e | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003680 | 2f3c1800040c             | move.l       #$1800040c, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00003686 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003688 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000368a | d1c7                     | adda.l       d7, a0                              ; arithmetic operation; flags depend on variant
0000368c | b5c8                     | cmpa.l       a0, a2                              ; compare operands; set condition flags
0000368e | 6500fe9c                 | bcs.w        $352c                               ; branch according to condition flags (bra unconditional, bsr call)
00003692 | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003694 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003696 | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003698 | 2f3c08000484             | move.l       #$8000484, -(a7)                    ; copy source to destination (Motorola operand order); flags depend on variant
0000369e | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000036a0 | 4cdf1cf8                 | movem.l      (a7)+, d3-d7/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
000036a4 | 4e5e                     | unlk         a6                                  ; restore stack frame
000036a6 | 4e75                     | rts                                              ; return: pop return address from stack
000036a8 | 4e56ffe2                 | link.w       a6, #$ffe2                          ; establish stack frame
000036ac | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000036b0 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000036b6 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
000036ba | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000036bc | 3268003c                 | movea.w      $3c(a0), a1                         ; copy source to destination (Motorola operand order); flags depend on variant
000036c0 | 2809                     | move.l       a1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000036c2 | 2479000008ec             | movea.l      $8ec.l, a2                          ; copy source to destination (Motorola operand order); flags depend on variant
000036c8 | 4eb9000033a0             | jsr          $33a0.l                             ; call subroutine; push return address
000036ce | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
000036d0 | 670000c2                 | beq.w        $3794                               ; branch according to condition flags (bra unconditional, bsr call)
000036d4 | 2f3cc8000000             | move.l       #$c8000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000036da | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000036dc | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000036de | 2f3cba000000             | move.l       #$ba000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
000036e4 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000036e6 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000036e8 | 660000aa                 | bne.w        $3794                               ; branch according to condition flags (bra unconditional, bsr call)
000036ec | 486dd420                 | pea.l        -$2be0(a5)                          ; machine operation; verify instruction and data boundaries
000036f0 | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000036f2 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000036f4 | 2f39000008d4             | move.l       $8d4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000036fa | 2f3c32040488             | move.l       #$32040488, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00003700 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003702 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003704 | 67000086                 | beq.w        $378c                               ; branch according to condition flags (bra unconditional, bsr call)
00003708 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000370a | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000370e | a9b9                     | dc.w         $a9b9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003710 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003712 | 2f10                     | move.l       (a0), -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003714 | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003716 | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
0000371a | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000371c | 2079000008d4             | movea.l      $8d4.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003722 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003724 | 4a280044                 | tst.b        $44(a0)                             ; machine operation; verify instruction and data boundaries
00003728 | 6704                     | beq.b        $372e                               ; branch according to condition flags (bra unconditional, bsr call)
0000372a | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000372c | 600c                     | bra.b        $373a                               ; branch according to condition flags (bra unconditional, bsr call)
0000372e | 2079000008d4             | movea.l      $8d4.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003734 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003736 | 30280042                 | move.w       $42(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000373a | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000373c | 6044                     | bra.b        $3782                               ; branch according to condition flags (bra unconditional, bsr call)
0000373e | 3f2a004a                 | move.w       $4a(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003742 | 3f2a0044                 | move.w       $44(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003746 | 2f39000008d4             | move.l       $8d4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000374c | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000374e | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003754 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003758 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000375a | 2f28003e                 | move.l       $3e(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000375e | 4eb9000034a8             | jsr          $34a8.l                             ; call subroutine; push return address
00003764 | 2f39000008d4             | move.l       $8d4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000376a | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000376c | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000376e | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00003770 | 486effe2                 | pea.l        -$1e(a6)                            ; machine operation; verify instruction and data boundaries
00003774 | 2f3c60051480             | move.l       #$60051480, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
0000377a | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000377c | 5343                     | subq.w       #$1, d3                             ; arithmetic operation; flags depend on variant
0000377e | 4fef0010                 | lea.l        $10(a7), a7                         ; machine operation; verify instruction and data boundaries
00003782 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00003784 | 6eb8                     | bgt.b        $373e                               ; branch according to condition flags (bra unconditional, bsr call)
00003786 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000378a | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000378c | 2f3cd0000000             | move.l       #$d0000000, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00003792 | a8fd                     | dc.w         $a8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003794 | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00003798 | 4e5e                     | unlk         a6                                  ; restore stack frame
0000379a | 4e75                     | rts                                              ; return: pop return address from stack
0000379c | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
000037a0 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000037a4 | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000037a8 | a95d                     | dc.w         $a95d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000037aa | 207c00000003             | movea.l      #$3, a0                             ; copy source to destination (Motorola operand order); flags depend on variant
000037b0 | 43eefffc                 | lea.l        -$4(a6), a1                         ; machine operation; verify instruction and data boundaries
000037b4 | a03b                     | dc.w         $a03b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000037b6 | 2280                     | move.l       d0, (a1)                            ; copy source to destination (Motorola operand order); flags depend on variant
000037b8 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000037bc | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000037be | a95d                     | dc.w         $a95d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000037c0 | 4e5e                     | unlk         a6                                  ; restore stack frame
000037c2 | 4e75                     | rts                                              ; return: pop return address from stack
000037c4 | 4e56fff8                 | link.w       a6, #$fff8                          ; establish stack frame
000037c8 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000037ca | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
000037ce | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000037d0 | a029                     | dc.w         $a029                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000037d2 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000037d4 | 30280008                 | move.w       $8(a0), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000037d8 | 5940                     | subq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
000037da | 3d40fff8                 | move.w       d0, -$8(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
000037de | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000037e0 | 3028000a                 | move.w       $a(a0), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000037e4 | 5940                     | subq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
000037e6 | 3d40fffa                 | move.w       d0, -$6(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
000037ea | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000037ec | 3028000c                 | move.w       $c(a0), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000037f0 | 5840                     | addq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
000037f2 | 3d40fffc                 | move.w       d0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
000037f6 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000037f8 | 3028000e                 | move.w       $e(a0), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000037fc | 5840                     | addq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
000037fe | 3d40fffe                 | move.w       d0, -$2(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003802 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003804 | a02a                     | dc.w         $a02a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003806 | a89e                     | dc.w         $a89e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003808 | 2f3c00030003             | move.l       #$30003, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000380e | a89b                     | dc.w         $a89b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003810 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00003814 | 2f3c00100010             | move.l       #$100010, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000381a | a8b0                     | dc.w         $a8b0                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000381c | a89e                     | dc.w         $a89e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000381e | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
00003820 | 4e5e                     | unlk         a6                                  ; restore stack frame
00003822 | 4e75                     | rts                                              ; return: pop return address from stack
00003824 | 206f0004                 | movea.l      $4(a7), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003828 | b1f9000008ec             | cmpa.l       $8ec.l, a0                          ; compare operands; set condition flags
0000382e | 6704                     | beq.b        $3834                               ; branch according to condition flags (bra unconditional, bsr call)
00003830 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003832 | 6002                     | bra.b        $3836                               ; branch according to condition flags (bra unconditional, bsr call)
00003834 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003836 | 4e75                     | rts                                              ; return: pop return address from stack
00003838 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000383c | 48e71020                 | movem.l      d3/a2, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003840 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003846 | 2468009c                 | movea.l      $9c(a0), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
0000384a | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000384c | 2f2800a0                 | move.l       $a0(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003850 | a960                     | dc.w         $a960                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003852 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003854 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003856 | c1e80018                 | muls.w       $18(a0), d0                         ; arithmetic operation; flags depend on variant
0000385a | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000385c | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000385e | 32290008                 | move.w       $8(a1), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
00003862 | 9250                     | sub.w        (a0), d1                            ; arithmetic operation; flags depend on variant
00003864 | 9240                     | sub.w        d0, d1                              ; arithmetic operation; flags depend on variant
00003866 | 3601                     | move.w       d1, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00003868 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
0000386a | 6708                     | beq.b        $3874                               ; branch according to condition flags (bra unconditional, bsr call)
0000386c | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
0000386e | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003870 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003872 | a9dd                     | dc.w         $a9dd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003874 | 4cdf0408                 | movem.l      (a7)+, d3/a2                        ; copy source to destination (Motorola operand order); flags depend on variant
00003878 | 4e5e                     | unlk         a6                                  ; restore stack frame
0000387a | 4e75                     | rts                                              ; return: pop return address from stack
0000387c | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00003880 | 48e70038                 | movem.l      a2-a4, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003884 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00003888 | 246b009c                 | movea.l      $9c(a3), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
0000388c | 284b                     | movea.l      a3, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000388e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003890 | 216c00100008             | move.l       $10(a4), $8(a0)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003896 | 216c0014000c             | move.l       $14(a4), $c(a0)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000389c | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000389e | 04680010000e             | subi.w       #$10, $e(a0)                        ; arithmetic operation; flags depend on variant
000038a4 | 4a39000003f1             | tst.b        $3f1.l                              ; machine operation; verify instruction and data boundaries
000038aa | 670e                     | beq.b        $38ba                               ; branch according to condition flags (bra unconditional, bsr call)
000038ac | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000038ae | 30280018                 | move.w       $18(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000038b2 | 5840                     | addq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
000038b4 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000038b6 | d1680008                 | add.w        d0, $8(a0)                          ; arithmetic operation; flags depend on variant
000038ba | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000038bc | 48680008                 | pea.l        $8(a0)                              ; machine operation; verify instruction and data boundaries
000038c0 | 2f3c00040004             | move.l       #$40004, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000038c6 | a8a9                     | dc.w         $a8a9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000038c8 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000038ca | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000038cc | 30280018                 | move.w       $18(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000038d0 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000038d2 | 3228000c                 | move.w       $c(a0), d1                          ; copy source to destination (Motorola operand order); flags depend on variant
000038d6 | 92690008                 | sub.w        $8(a1), d1                          ; arithmetic operation; flags depend on variant
000038da | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000038dc | 83c0                     | divs.w       d0, d1                              ; arithmetic operation; flags depend on variant
000038de | 374100a4                 | move.w       d1, $a4(a3)                         ; copy source to destination (Motorola operand order); flags depend on variant
000038e2 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000038e4 | 30280018                 | move.w       $18(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000038e8 | c1eb00a4                 | muls.w       $a4(a3), d0                         ; arithmetic operation; flags depend on variant
000038ec | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000038ee | d0680008                 | add.w        $8(a0), d0                          ; arithmetic operation; flags depend on variant
000038f2 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000038f4 | 3140000c                 | move.w       d0, $c(a0)                          ; copy source to destination (Motorola operand order); flags depend on variant
000038f8 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000038fa | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000038fc | 3368000e0006             | move.w       $e(a0), $6(a1)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003902 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003904 | a9d0                     | dc.w         $a9d0                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003906 | 4cdf1c00                 | movem.l      (a7)+, a2-a4                        ; copy source to destination (Motorola operand order); flags depend on variant
0000390a | 4e5e                     | unlk         a6                                  ; restore stack frame
0000390c | 4e75                     | rts                                              ; return: pop return address from stack
0000390e | 4e56fff4                 | link.w       a6, #$fff4                          ; establish stack frame
00003912 | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003916 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
0000391a | 486efff4                 | pea.l        -$c(a6)                             ; machine operation; verify instruction and data boundaries
0000391e | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003920 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003922 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003924 | 362a0016                 | move.w       $16(a2), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00003928 | 966a0012                 | sub.w        $12(a2), d3                         ; arithmetic operation; flags depend on variant
0000392c | 382a0014                 | move.w       $14(a2), d4                         ; copy source to destination (Motorola operand order); flags depend on variant
00003930 | 986a0010                 | sub.w        $10(a2), d4                         ; arithmetic operation; flags depend on variant
00003934 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00003938 | 70f1                     | moveq        #$f1, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000393a | d043                     | add.w        d3, d0                              ; arithmetic operation; flags depend on variant
0000393c | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000393e | 3f3cffff                 | move.w       #$ffff, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003942 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003944 | 3f04                     | move.w       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003946 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003948 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
0000394c | a87b                     | dc.w         $a87b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000394e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003950 | a904                     | dc.w         $a904                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003952 | 487900000402             | pea.l        $402.l                              ; machine operation; verify instruction and data boundaries
00003958 | a87b                     | dc.w         $a87b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000395a | 2f2efff4                 | move.l       -$c(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000395e | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003960 | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00003964 | 4e5e                     | unlk         a6                                  ; restore stack frame
00003966 | 4e75                     | rts                                              ; return: pop return address from stack
00003968 | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
0000396c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000396e | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00003972 | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
00003976 | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003978 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000397a | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000397c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000397e | a922                     | dc.w         $a922                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003980 | 486a0010                 | pea.l        $10(a2)                             ; machine operation; verify instruction and data boundaries
00003984 | a8a3                     | dc.w         $a8a3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003986 | b5f9000008ec             | cmpa.l       $8ec.l, a2                          ; compare operands; set condition flags
0000398c | 6620                     | bne.b        $39ae                               ; branch according to condition flags (bra unconditional, bsr call)
0000398e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003990 | a969                     | dc.w         $a969                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003992 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003994 | 4eb90000390e             | jsr          $390e.l                             ; call subroutine; push return address
0000399a | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000399c | 4eb900003a82             | jsr          $3a82.l                             ; call subroutine; push return address
000039a2 | 486a0010                 | pea.l        $10(a2)                             ; machine operation; verify instruction and data boundaries
000039a6 | 2f2a009c                 | move.l       $9c(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000039aa | a9d3                     | dc.w         $a9d3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000039ac | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
000039ae | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000039b0 | a923                     | dc.w         $a923                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000039b2 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000039b6 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000039b8 | 245f                     | movea.l      (a7)+, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
000039ba | 4e5e                     | unlk         a6                                  ; restore stack frame
000039bc | 4e75                     | rts                                              ; return: pop return address from stack
000039be | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000039c2 | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000039c6 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000039cc | 2468009c                 | movea.l      $9c(a0), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
000039d0 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000039d2 | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000039d4 | 30280018                 | move.w       $18(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
000039d8 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000039da | 38280008                 | move.w       $8(a0), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
000039de | 9851                     | sub.w        (a1), d4                            ; arithmetic operation; flags depend on variant
000039e0 | 48c4                     | ext.l        d4                                  ; bit/integer operation; flags depend on variant
000039e2 | 89c0                     | divs.w       d0, d4                              ; arithmetic operation; flags depend on variant
000039e4 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000039ea | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
000039ec | 3629005e                 | move.w       $5e(a1), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
000039f0 | 966800a4                 | sub.w        $a4(a0), d3                         ; arithmetic operation; flags depend on variant
000039f4 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000039f6 | 4a68003c                 | tst.w        $3c(a0)                             ; machine operation; verify instruction and data boundaries
000039fa | 6f1a                     | ble.b        $3a16                               ; branch according to condition flags (bra unconditional, bsr call)
000039fc | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000039fe | 3028003c                 | move.w       $3c(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003a02 | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00003a04 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003a06 | 2068003e                 | movea.l      $3e(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003a0a | 2250                     | movea.l      (a0), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
00003a0c | 0c31000d0000             | cmpi.b       #$d, (a1, d0.w)                     ; compare operands; set condition flags
00003a12 | 6602                     | bne.b        $3a16                               ; branch according to condition flags (bra unconditional, bsr call)
00003a14 | 5243                     | addq.w       #$1, d3                             ; arithmetic operation; flags depend on variant
00003a16 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00003a18 | 6c02                     | bge.b        $3a1c                               ; branch according to condition flags (bra unconditional, bsr call)
00003a1a | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00003a1c | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003a22 | 2f2800a0                 | move.l       $a0(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003a26 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003a28 | a965                     | dc.w         $a965                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003a2a | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003a30 | 2f2800a0                 | move.l       $a0(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003a34 | 3f04                     | move.w       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003a36 | a963                     | dc.w         $a963                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003a38 | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00003a3c | 4e5e                     | unlk         a6                                  ; restore stack frame
00003a3e | 4e75                     | rts                                              ; return: pop return address from stack
00003a40 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00003a44 | 48e71c20                 | movem.l      d3-d5/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003a48 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00003a4c | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003a4e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003a50 | a960                     | dc.w         $a960                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003a52 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003a54 | 3a00                     | move.w       d0, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
00003a56 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003a58 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003a5a | a962                     | dc.w         $a962                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003a5c | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003a5e | 3800                     | move.w       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00003a60 | 3605                     | move.w       d5, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00003a62 | 966e000c                 | sub.w        $c(a6), d3                          ; arithmetic operation; flags depend on variant
00003a66 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00003a68 | 6c04                     | bge.b        $3a6e                               ; branch according to condition flags (bra unconditional, bsr call)
00003a6a | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00003a6c | 6006                     | bra.b        $3a74                               ; branch according to condition flags (bra unconditional, bsr call)
00003a6e | b644                     | cmp.w        d4, d3                              ; compare operands; set condition flags
00003a70 | 6f02                     | ble.b        $3a74                               ; branch according to condition flags (bra unconditional, bsr call)
00003a72 | 3604                     | move.w       d4, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00003a74 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003a76 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003a78 | a963                     | dc.w         $a963                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003a7a | 4cdf0438                 | movem.l      (a7)+, d3-d5/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00003a7e | 4e5e                     | unlk         a6                                  ; restore stack frame
00003a80 | 4e75                     | rts                                              ; return: pop return address from stack
00003a82 | 4e56fff4                 | link.w       a6, #$fff4                          ; establish stack frame
00003a86 | 48e71f38                 | movem.l      d3-d7/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00003a8a | 2e2e0008                 | move.l       $8(a6), d7                          ; copy source to destination (Motorola operand order); flags depend on variant
00003a8e | 45f9000002d6             | lea.l        $2d6.l, a2                          ; machine operation; verify instruction and data boundaries
00003a94 | 47f9000002d0             | lea.l        $2d0.l, a3                          ; machine operation; verify instruction and data boundaries
00003a9a | 49f9000002be             | lea.l        $2be.l, a4                          ; machine operation; verify instruction and data boundaries
00003aa0 | 41f9000002ae             | lea.l        $2ae.l, a0                          ; machine operation; verify instruction and data boundaries
00003aa6 | 2808                     | move.l       a0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00003aa8 | 41f900000292             | lea.l        $292.l, a0                          ; machine operation; verify instruction and data boundaries
00003aae | 2a08                     | move.l       a0, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
00003ab0 | 41f900000278             | lea.l        $278.l, a0                          ; machine operation; verify instruction and data boundaries
00003ab6 | 2c08                     | move.l       a0, d6                              ; copy source to destination (Motorola operand order); flags depend on variant
00003ab8 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003abe | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003ac2 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003ac4 | 36280018                 | move.w       $18(a0), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00003ac8 | 4a39000003f1             | tst.b        $3f1.l                              ; machine operation; verify instruction and data boundaries
00003ace | 67000132                 | beq.w        $3c02                               ; branch according to condition flags (bra unconditional, bsr call)
00003ad2 | 486efff4                 | pea.l        -$c(a6)                             ; machine operation; verify instruction and data boundaries
00003ad6 | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003ad8 | 2f07                     | move.l       d7, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003ada | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003adc | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00003ae0 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00003ae2 | 2047                     | movea.l      d7, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003ae4 | 70f1                     | moveq        #$f1, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003ae6 | d0680016                 | add.w        $16(a0), d0                         ; arithmetic operation; flags depend on variant
00003aea | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003aec | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003aee | 5640                     | addq.w       #$3, d0                             ; arithmetic operation; flags depend on variant
00003af0 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003af2 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003af4 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00003af8 | 4878ffff                 | pea.l        $ffff.w                             ; machine operation; verify instruction and data boundaries
00003afc | a8a9                     | dc.w         $a8a9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003afe | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00003b02 | a87b                     | dc.w         $a87b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b04 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00003b08 | 2f3c00010001             | move.l       #$10001, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003b0e | a8a9                     | dc.w         $a8a9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b10 | 3d7c0050fffa             | move.w       #$50, -$6(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003b16 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00003b1a | a8a3                     | dc.w         $a8a3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b1c | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003b1e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003b20 | 5640                     | addq.w       #$3, d0                             ; arithmetic operation; flags depend on variant
00003b22 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003b24 | a893                     | dc.w         $a893                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b26 | 2047                     | movea.l      d7, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003b28 | 70f1                     | moveq        #$f1, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003b2a | d0680016                 | add.w        $16(a0), d0                         ; arithmetic operation; flags depend on variant
00003b2e | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003b30 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003b32 | a892                     | dc.w         $a892                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b34 | 3f39000003fc             | move.w       $3fc.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003b3a | a887                     | dc.w         $a887                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b3c | 3f39000003fe             | move.w       $3fe.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003b42 | a88a                     | dc.w         $a88a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b44 | 3f3900000400             | move.w       $400.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003b4a | a888                     | dc.w         $a888                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b4c | 3f3c0004                 | move.w       #$4, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00003b50 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003b52 | a893                     | dc.w         $a893                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b54 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003b56 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003b58 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003b5a | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003b5c | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00003b5e | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00003b60 | 66fa                     | bne.b        $3b5c                               ; branch according to condition flags (bra unconditional, bsr call)
00003b62 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003b64 | a885                     | dc.w         $a885                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b66 | 3f3c0050                 | move.w       #$50, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003b6a | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003b6c | a893                     | dc.w         $a893                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003b6e | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003b70 | 1039000008ea             | move.b       $8ea.l, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003b76 | 0c400005                 | cmpi.w       #$5, d0                             ; compare operands; set condition flags
00003b7a | 6278                     | bhi.b        $3bf4                               ; branch according to condition flags (bra unconditional, bsr call)
00003b7c | d040                     | add.w        d0, d0                              ; arithmetic operation; flags depend on variant
00003b7e | 303b0006                 | move.w       $3b86(pc, d0.w), d0                 ; copy source to destination (Motorola operand order); flags depend on variant
00003b82 | 4efb0002                 | jmp          $3b86(pc, d0.w)                     ; machine operation; verify instruction and data boundaries
00003b86 | 006e000c0020             | ori.w        #$c, $20(a6)                        ; bit/integer operation; flags depend on variant
00003b8c | 00340048005c             | ori.b        #$48, $5c(a4, d0.w)                 ; bit/integer operation; flags depend on variant
00003b92 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003b94 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003b96 | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003b98 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003b9a | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00003b9c | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00003b9e | 66fa                     | bne.b        $3b9a                               ; branch according to condition flags (bra unconditional, bsr call)
00003ba0 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003ba2 | a885                     | dc.w         $a885                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003ba4 | 604e                     | bra.b        $3bf4                               ; branch according to condition flags (bra unconditional, bsr call)
00003ba6 | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003ba8 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003baa | 204c                     | movea.l      a4, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003bac | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003bae | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00003bb0 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00003bb2 | 66fa                     | bne.b        $3bae                               ; branch according to condition flags (bra unconditional, bsr call)
00003bb4 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003bb6 | a885                     | dc.w         $a885                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003bb8 | 603a                     | bra.b        $3bf4                               ; branch according to condition flags (bra unconditional, bsr call)
00003bba | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003bbc | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003bbe | 2044                     | movea.l      d4, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003bc0 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003bc2 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00003bc4 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00003bc6 | 66fa                     | bne.b        $3bc2                               ; branch according to condition flags (bra unconditional, bsr call)
00003bc8 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003bca | a885                     | dc.w         $a885                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003bcc | 6026                     | bra.b        $3bf4                               ; branch according to condition flags (bra unconditional, bsr call)
00003bce | 2f05                     | move.l       d5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003bd0 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003bd2 | 2045                     | movea.l      d5, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003bd4 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003bd6 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00003bd8 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00003bda | 66fa                     | bne.b        $3bd6                               ; branch according to condition flags (bra unconditional, bsr call)
00003bdc | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003bde | a885                     | dc.w         $a885                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003be0 | 6012                     | bra.b        $3bf4                               ; branch according to condition flags (bra unconditional, bsr call)
00003be2 | 2f06                     | move.l       d6, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003be4 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003be6 | 2046                     | movea.l      d6, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003be8 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003bea | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00003bec | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00003bee | 66fa                     | bne.b        $3bea                               ; branch according to condition flags (bra unconditional, bsr call)
00003bf0 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003bf2 | a885                     | dc.w         $a885                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003bf4 | 487900000402             | pea.l        $402.l                              ; machine operation; verify instruction and data boundaries
00003bfa | a87b                     | dc.w         $a87b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003bfc | 2f2efff4                 | move.l       -$c(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003c00 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003c02 | 4cdf1cf8                 | movem.l      (a7)+, d3-d7/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
00003c06 | 4e5e                     | unlk         a6                                  ; restore stack frame
00003c08 | 4e75                     | rts                                              ; return: pop return address from stack
00003c0a | 4e56fff2                 | link.w       a6, #$fff2                          ; establish stack frame
00003c0e | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003c12 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00003c16 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003c1c | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003c20 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003c22 | 38280018                 | move.w       $18(a0), d4                         ; copy source to destination (Motorola operand order); flags depend on variant
00003c26 | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
00003c2a | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003c2c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003c2e | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003c30 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00003c32 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003c34 | 2f2e000c                 | move.l       $c(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003c38 | 48790000040a             | pea.l        $40a.l                              ; machine operation; verify instruction and data boundaries
00003c3e | a92b                     | dc.w         $a92b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003c40 | 201f                     | move.l       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003c42 | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00003c44 | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00003c46 | 670000ce                 | beq.w        $3d16                               ; branch according to condition flags (bra unconditional, bsr call)
00003c4a | 486a0010                 | pea.l        $10(a2)                             ; machine operation; verify instruction and data boundaries
00003c4e | a8a3                     | dc.w         $a8a3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003c50 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003c52 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003c54 | 3f3c0030                 | move.w       #$30, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003c58 | a88d                     | dc.w         $a88d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003c5a | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003c5c | 3d40fff2                 | move.w       d0, -$e(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003c60 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003c62 | 3f3c0030                 | move.w       #$30, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003c66 | a88d                     | dc.w         $a88d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003c68 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003c6a | 72e8                     | moveq        #$e8, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00003c6c | d243                     | add.w        d3, d1                              ; arithmetic operation; flags depend on variant
00003c6e | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00003c70 | 83c0                     | divs.w       d0, d1                              ; arithmetic operation; flags depend on variant
00003c72 | c3eefff2                 | muls.w       -$e(a6), d1                         ; arithmetic operation; flags depend on variant
00003c76 | 06410018                 | addi.w       #$18, d1                            ; arithmetic operation; flags depend on variant
00003c7a | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003c7c | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003c7e | 7210                     | moveq        #$10, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00003c80 | e2a0                     | asr.l        d1, d0                              ; bit/integer operation; flags depend on variant
00003c82 | 5140                     | subq.w       #$8, d0                             ; arithmetic operation; flags depend on variant
00003c84 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00003c86 | 81c4                     | divs.w       d4, d0                              ; arithmetic operation; flags depend on variant
00003c88 | c1c4                     | muls.w       d4, d0                              ; arithmetic operation; flags depend on variant
00003c8a | 5040                     | addq.w       #$8, d0                             ; arithmetic operation; flags depend on variant
00003c8c | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003c8e | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
00003c90 | a91d                     | dc.w         $a91d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003c92 | 486a0010                 | pea.l        $10(a2)                             ; machine operation; verify instruction and data boundaries
00003c96 | a928                     | dc.w         $a928                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003c98 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003c9a | 4eb90000387c             | jsr          $387c.l                             ; call subroutine; push return address
00003ca0 | 362a0010                 | move.w       $10(a2), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00003ca4 | 5343                     | subq.w       #$1, d3                             ; arithmetic operation; flags depend on variant
00003ca6 | 4a39000003f1             | tst.b        $3f1.l                              ; machine operation; verify instruction and data boundaries
00003cac | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00003cae | 6706                     | beq.b        $3cb6                               ; branch according to condition flags (bra unconditional, bsr call)
00003cb0 | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003cb2 | 5840                     | addq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
00003cb4 | d640                     | add.w        d0, d3                              ; arithmetic operation; flags depend on variant
00003cb6 | 2f2a00a0                 | move.l       $a0(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003cba | 70f1                     | moveq        #$f1, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003cbc | d06a0016                 | add.w        $16(a2), d0                         ; arithmetic operation; flags depend on variant
00003cc0 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003cc2 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003cc4 | a959                     | dc.w         $a959                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003cc6 | 362a0014                 | move.w       $14(a2), d3                         ; copy source to destination (Motorola operand order); flags depend on variant
00003cca | 966a0010                 | sub.w        $10(a2), d3                         ; arithmetic operation; flags depend on variant
00003cce | 0643fff3                 | addi.w       #$fff3, d3                          ; arithmetic operation; flags depend on variant
00003cd2 | 4a39000003f1             | tst.b        $3f1.l                              ; machine operation; verify instruction and data boundaries
00003cd8 | 6706                     | beq.b        $3ce0                               ; branch according to condition flags (bra unconditional, bsr call)
00003cda | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003cdc | 5840                     | addq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
00003cde | 9640                     | sub.w        d0, d3                              ; arithmetic operation; flags depend on variant
00003ce0 | 2f2a00a0                 | move.l       $a0(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003ce4 | 3f3c0010                 | move.w       #$10, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003ce8 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003cea | a95c                     | dc.w         $a95c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003cec | 206a00a0                 | movea.l      $a0(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003cf0 | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003cf2 | 2d680008fff4             | move.l       $8(a0), -$c(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003cf8 | 2d68000cfff8             | move.l       $c(a0), -$8(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003cfe | 486efff4                 | pea.l        -$c(a6)                             ; machine operation; verify instruction and data boundaries
00003d02 | a92a                     | dc.w         $a92a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003d04 | 4eb9000039be             | jsr          $39be.l                             ; call subroutine; push return address
00003d0a | 4eb900003838             | jsr          $3838.l                             ; call subroutine; push return address
00003d10 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003d14 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003d16 | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00003d1a | 4e5e                     | unlk         a6                                  ; restore stack frame
00003d1c | 4e75                     | rts                                              ; return: pop return address from stack
00003d1e | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00003d22 | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003d26 | 382e0008                 | move.w       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
00003d2a | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003d30 | 2468009c                 | movea.l      $9c(a0), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
00003d34 | 4a44                     | tst.w        d4                                  ; machine operation; verify instruction and data boundaries
00003d36 | 6752                     | beq.b        $3d8a                               ; branch according to condition flags (bra unconditional, bsr call)
00003d38 | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003d3a | 04400014                 | subi.w       #$14, d0                            ; arithmetic operation; flags depend on variant
00003d3e | 670e                     | beq.b        $3d4e                               ; branch according to condition flags (bra unconditional, bsr call)
00003d40 | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00003d42 | 670a                     | beq.b        $3d4e                               ; branch according to condition flags (bra unconditional, bsr call)
00003d44 | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00003d46 | 670a                     | beq.b        $3d52                               ; branch according to condition flags (bra unconditional, bsr call)
00003d48 | 5340                     | subq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00003d4a | 6706                     | beq.b        $3d52                               ; branch according to condition flags (bra unconditional, bsr call)
00003d4c | 601a                     | bra.b        $3d68                               ; branch according to condition flags (bra unconditional, bsr call)
00003d4e | 7601                     | moveq        #$1, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00003d50 | 6016                     | bra.b        $3d68                               ; branch according to condition flags (bra unconditional, bsr call)
00003d52 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003d54 | 2252                     | movea.l      (a2), a1                            ; copy source to destination (Motorola operand order); flags depend on variant
00003d56 | 30280018                 | move.w       $18(a0), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003d5a | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003d5c | 3628000c                 | move.w       $c(a0), d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00003d60 | 96690008                 | sub.w        $8(a1), d3                          ; arithmetic operation; flags depend on variant
00003d64 | 48c3                     | ext.l        d3                                  ; bit/integer operation; flags depend on variant
00003d66 | 87c0                     | divs.w       d0, d3                              ; arithmetic operation; flags depend on variant
00003d68 | 0c440015                 | cmpi.w       #$15, d4                            ; compare operands; set condition flags
00003d6c | 6706                     | beq.b        $3d74                               ; branch according to condition flags (bra unconditional, bsr call)
00003d6e | 0c440017                 | cmpi.w       #$17, d4                            ; compare operands; set condition flags
00003d72 | 6602                     | bne.b        $3d76                               ; branch according to condition flags (bra unconditional, bsr call)
00003d74 | 4443                     | neg.w        d3                                  ; machine operation; verify instruction and data boundaries
00003d76 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003d78 | 2f2e000a                 | move.l       $a(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003d7c | 4eb900003a40             | jsr          $3a40.l                             ; call subroutine; push return address
00003d82 | 4eb900003838             | jsr          $3838.l                             ; call subroutine; push return address
00003d88 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00003d8a | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00003d8e | 4e5e                     | unlk         a6                                  ; restore stack frame
00003d90 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003d92 | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00003d94 | 4ed0                     | jmp          (a0)                                ; machine operation; verify instruction and data boundaries
00003d96 | 4e56fff8                 | link.w       a6, #$fff8                          ; establish stack frame
00003d9a | 48e71038                 | movem.l      d3/a2-a4, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003d9e | 286e0008                 | movea.l      $8(a6), a4                          ; copy source to destination (Motorola operand order); flags depend on variant
00003da2 | 246e000c                 | movea.l      $c(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00003da6 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00003daa | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003dac | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003dae | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003db0 | 486a000a                 | pea.l        $a(a2)                              ; machine operation; verify instruction and data boundaries
00003db4 | a871                     | dc.w         $a871                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003db6 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003db8 | 2f2a000a                 | move.l       $a(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003dbc | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003dbe | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
00003dc2 | a96c                     | dc.w         $a96c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003dc4 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003dc6 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00003dc8 | 66000092                 | bne.w        $3e5c                               ; branch according to condition flags (bra unconditional, bsr call)
00003dcc | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003dce | 2f2a000a                 | move.l       $a(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003dd2 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003dd8 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003ddc | 2050                     | movea.l      (a0), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003dde | 48680008                 | pea.l        $8(a0)                              ; machine operation; verify instruction and data boundaries
00003de2 | a8ad                     | dc.w         $a8ad                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003de4 | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003de6 | 670000a8                 | beq.w        $3e90                               ; branch according to condition flags (bra unconditional, bsr call)
00003dea | 2f2a000a                 | move.l       $a(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003dee | 302a000e                 | move.w       $e(a2), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003df2 | 02400200                 | andi.w       #$200, d0                           ; bit/integer operation; flags depend on variant
00003df6 | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00003df8 | 56c0                     | sne.b        d0                                  ; machine operation; verify instruction and data boundaries
00003dfa | 4400                     | neg.b        d0                                  ; machine operation; verify instruction and data boundaries
00003dfc | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00003dfe | 1f00                     | move.b       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003e00 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003e06 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003e0a | a9d4                     | dc.w         $a9d4                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003e0c | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003e12 | 2068009c                 | movea.l      $9c(a0), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003e16 | 2650                     | movea.l      (a0), a3                            ; copy source to destination (Motorola operand order); flags depend on variant
00003e18 | 302b0020                 | move.w       $20(a3), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00003e1c | b06b0022                 | cmp.w        $22(a3), d0                         ; compare operands; set condition flags
00003e20 | 6632                     | bne.b        $3e54                               ; branch according to condition flags (bra unconditional, bsr call)
00003e22 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003e28 | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003e2c | 3f39000008e4             | move.w       $8e4.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003e32 | 4eb900002296             | jsr          $2296.l                             ; call subroutine; push return address
00003e38 | 4a00                     | tst.b        d0                                  ; machine operation; verify instruction and data boundaries
00003e3a | 5c4f                     | addq.w       #$6, a7                             ; arithmetic operation; flags depend on variant
00003e3c | 6616                     | bne.b        $3e54                               ; branch according to condition flags (bra unconditional, bsr call)
00003e3e | 3079000008e4             | movea.w      $8e4.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003e44 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003e46 | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003e48 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00003e4e | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003e52 | a9d1                     | dc.w         $a9d1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003e54 | 4eb9000039be             | jsr          $39be.l                             ; call subroutine; push return address
00003e5a | 6034                     | bra.b        $3e90                               ; branch according to condition flags (bra unconditional, bsr call)
00003e5c | 0c430081                 | cmpi.w       #$81, d3                            ; compare operands; set condition flags
00003e60 | 6618                     | bne.b        $3e7a                               ; branch according to condition flags (bra unconditional, bsr call)
00003e62 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003e64 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003e68 | 2f2a000a                 | move.l       $a(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003e6c | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00003e6e | a968                     | dc.w         $a968                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003e70 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003e72 | 4eb900003838             | jsr          $3838.l                             ; call subroutine; push return address
00003e78 | 6016                     | bra.b        $3e90                               ; branch according to condition flags (bra unconditional, bsr call)
00003e7a | 47f900000040             | lea.l        $40.l, a3                           ; machine operation; verify instruction and data boundaries
00003e80 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003e82 | 2f2efffc                 | move.l       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003e86 | 2f2a000a                 | move.l       $a(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003e8a | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00003e8c | a968                     | dc.w         $a968                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003e8e | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003e90 | 2f2efff8                 | move.l       -$8(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00003e94 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003e96 | 4cdf1c08                 | movem.l      (a7)+, d3/a2-a4                     ; copy source to destination (Motorola operand order); flags depend on variant
00003e9a | 4e5e                     | unlk         a6                                  ; restore stack frame
00003e9c | 4e75                     | rts                                              ; return: pop return address from stack
00003e9e | 4e56ff66                 | link.w       a6, #$ff66                          ; establish stack frame
00003ea2 | 48e71c20                 | movem.l      d3-d5/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003ea6 | 2d7900000270fff8         | move.l       $270.l, -$8(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003eae | 2d7900000274fffc         | move.l       $274.l, -$4(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00003eb6 | 41f90000088e             | lea.l        $88e.l, a0                          ; machine operation; verify instruction and data boundaries
00003ebc | 43eeffb8                 | lea.l        -$48(a6), a1                        ; machine operation; verify instruction and data boundaries
00003ec0 | 700f                     | moveq        #$f, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003ec2 | 22d8                     | move.l       (a0)+, (a1)+                        ; copy source to destination (Motorola operand order); flags depend on variant
00003ec4 | 51c8fffc                 | dbra         d0, $3ec2                           ; machine operation; verify instruction and data boundaries
00003ec8 | 486eff68                 | pea.l        -$98(a6)                            ; machine operation; verify instruction and data boundaries
00003ecc | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003ece | 0c39fffffffffffc         | cmpi.b       #$ff, $fffffffc.l                   ; compare operands; set condition flags
00003ed6 | 6606                     | bne.b        $3ede                               ; branch according to condition flags (bra unconditional, bsr call)
00003ed8 | 4eb900001b92             | jsr          $1b92.l                             ; call subroutine; push return address
00003ede | 4a39fffffffc             | tst.b        $fffffffc.l                         ; machine operation; verify instruction and data boundaries
00003ee4 | 6738                     | beq.b        $3f1e                               ; branch according to condition flags (bra unconditional, bsr call)
00003ee6 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003ee8 | 486eff6c                 | pea.l        -$94(a6)                            ; machine operation; verify instruction and data boundaries
00003eec | 3f3c0037                 | move.w       #$37, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003ef0 | a88f                     | dc.w         $a88f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003ef2 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003ef4 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00003ef6 | 41eeffb8                 | lea.l        -$48(a6), a0                        ; machine operation; verify instruction and data boundaries
00003efa | 2d48ff78                 | move.l       a0, -$88(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003efe | 703c                     | moveq        #$3c, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003f00 | 2d40ff74                 | move.l       d0, -$8c(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00003f04 | 42aeffac                 | clr.l        -$54(a6)                            ; bit/integer operation; flags depend on variant
00003f08 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00003f0a | 486eff6c                 | pea.l        -$94(a6)                            ; machine operation; verify instruction and data boundaries
00003f0e | 486eff74                 | pea.l        -$8c(a6)                            ; machine operation; verify instruction and data boundaries
00003f12 | 3f3c003a                 | move.w       #$3a, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00003f16 | a88f                     | dc.w         $a88f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003f18 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003f1a | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00003f1c | 6016                     | bra.b        $3f34                               ; branch according to condition flags (bra unconditional, bsr call)
00003f1e | 247c00000910             | movea.l      #$910, a2                           ; copy source to destination (Motorola operand order); flags depend on variant
00003f24 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003f26 | 43eeffb8                 | lea.l        -$48(a6), a1                        ; machine operation; verify instruction and data boundaries
00003f2a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003f2c | 1012                     | move.b       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003f2e | 5240                     | addq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00003f30 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00003f32 | a02e                     | dc.w         $a02e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003f34 | 4a2effb8                 | tst.b        -$48(a6)                            ; machine operation; verify instruction and data boundaries
00003f38 | 674e                     | beq.b        $3f88                               ; branch according to condition flags (bra unconditional, bsr call)
00003f3a | 0c2e003bffb8             | cmpi.b       #$3b, -$48(a6)                      ; compare operands; set condition flags
00003f40 | 6254                     | bhi.b        $3f96                               ; branch according to condition flags (bra unconditional, bsr call)
00003f42 | 522effb8                 | addq.b       #$1, -$48(a6)                       ; arithmetic operation; flags depend on variant
00003f46 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003f48 | 102effb8                 | move.b       -$48(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00003f4c | 41eeffb8                 | lea.l        -$48(a6), a0                        ; machine operation; verify instruction and data boundaries
00003f50 | 11bc002e0000             | move.b       #$2e, (a0, d0.w)                    ; copy source to destination (Motorola operand order); flags depend on variant
00003f56 | 522effb8                 | addq.b       #$1, -$48(a6)                       ; arithmetic operation; flags depend on variant
00003f5a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003f5c | 102effb8                 | move.b       -$48(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00003f60 | 11bc006f0000             | move.b       #$6f, (a0, d0.w)                    ; copy source to destination (Motorola operand order); flags depend on variant
00003f66 | 522effb8                 | addq.b       #$1, -$48(a6)                       ; arithmetic operation; flags depend on variant
00003f6a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003f6c | 102effb8                 | move.b       -$48(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00003f70 | 11bc00750000             | move.b       #$75, (a0, d0.w)                    ; copy source to destination (Motorola operand order); flags depend on variant
00003f76 | 522effb8                 | addq.b       #$1, -$48(a6)                       ; arithmetic operation; flags depend on variant
00003f7a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003f7c | 102effb8                 | move.b       -$48(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00003f80 | 11bc00740000             | move.b       #$74, (a0, d0.w)                    ; copy source to destination (Motorola operand order); flags depend on variant
00003f86 | 600e                     | bra.b        $3f96                               ; branch according to condition flags (bra unconditional, bsr call)
00003f88 | 41f90000025f             | lea.l        $25f.l, a0                          ; machine operation; verify instruction and data boundaries
00003f8e | 43eeffb8                 | lea.l        -$48(a6), a1                        ; machine operation; verify instruction and data boundaries
00003f92 | 7011                     | moveq        #$11, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003f94 | a02e                     | dc.w         $a02e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003f96 | 203c000000ee             | move.l       #$ee, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00003f9c | a11e                     | dc.w         $a11e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003f9e | 23c8000008ec             | move.l       a0, $8ec.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00003fa4 | 4ab9000008ec             | tst.l        $8ec.l                              ; machine operation; verify instruction and data boundaries
00003faa | 6606                     | bne.b        $3fb2                               ; branch according to condition flags (bra unconditional, bsr call)
00003fac | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003fae | 600002a8                 | bra.w        $4258                               ; branch according to condition flags (bra unconditional, bsr call)
00003fb2 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00003fb4 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003fba | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00003fbe | 486effb8                 | pea.l        -$48(a6)                            ; machine operation; verify instruction and data boundaries
00003fc2 | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
00003fc4 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00003fc6 | 4878ffff                 | pea.l        $ffff.w                             ; machine operation; verify instruction and data boundaries
00003fca | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
00003fcc | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00003fce | a913                     | dc.w         $a913                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003fd0 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00003fd2 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00003fd4 | 6606                     | bne.b        $3fdc                               ; branch according to condition flags (bra unconditional, bsr call)
00003fd6 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00003fd8 | 6000027e                 | bra.w        $4258                               ; branch according to condition flags (bra unconditional, bsr call)
00003fdc | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003fe2 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003fe4 | 3f39000003fc             | move.w       $3fc.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003fea | a887                     | dc.w         $a887                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003fec | 3f39000003fe             | move.w       $3fe.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003ff2 | a88a                     | dc.w         $a88a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003ff4 | 3f3900000400             | move.w       $400.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00003ffa | a888                     | dc.w         $a888                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00003ffc | 486effb0                 | pea.l        -$50(a6)                            ; machine operation; verify instruction and data boundaries
00004000 | a88b                     | dc.w         $a88b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004002 | 362effb0                 | move.w       -$50(a6), d3                        ; copy source to destination (Motorola operand order); flags depend on variant
00004006 | d66effb2                 | add.w        -$4e(a6), d3                        ; arithmetic operation; flags depend on variant
0000400a | d66effb6                 | add.w        -$4a(a6), d3                        ; arithmetic operation; flags depend on variant
0000400e | 4a79000003f4             | tst.w        $3f4.l                              ; machine operation; verify instruction and data boundaries
00004014 | 6f08                     | ble.b        $401e                               ; branch according to condition flags (bra unconditional, bsr call)
00004016 | 3039000003f4             | move.w       $3f4.l, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000401c | 6002                     | bra.b        $4020                               ; branch according to condition flags (bra unconditional, bsr call)
0000401e | 7050                     | moveq        #$50, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00004020 | 33c0000003f4             | move.w       d0, $3f4.l                          ; copy source to destination (Motorola operand order); flags depend on variant
00004026 | 4a79000003f6             | tst.w        $3f6.l                              ; machine operation; verify instruction and data boundaries
0000402c | 6f08                     | ble.b        $4036                               ; branch according to condition flags (bra unconditional, bsr call)
0000402e | 3039000003f6             | move.w       $3f6.l, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00004034 | 6002                     | bra.b        $4038                               ; branch according to condition flags (bra unconditional, bsr call)
00004036 | 7018                     | moveq        #$18, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00004038 | 33c0000003f6             | move.w       d0, $3f6.l                          ; copy source to destination (Motorola operand order); flags depend on variant
0000403e | 4a39000003f1             | tst.b        $3f1.l                              ; machine operation; verify instruction and data boundaries
00004044 | 670e                     | beq.b        $4054                               ; branch according to condition flags (bra unconditional, bsr call)
00004046 | 5240                     | addq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00004048 | c1c3                     | muls.w       d3, d0                              ; arithmetic operation; flags depend on variant
0000404a | 0640000c                 | addi.w       #$c, d0                             ; arithmetic operation; flags depend on variant
0000404e | 3d40fffc                 | move.w       d0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00004052 | 600a                     | bra.b        $405e                               ; branch according to condition flags (bra unconditional, bsr call)
00004054 | c1c3                     | muls.w       d3, d0                              ; arithmetic operation; flags depend on variant
00004056 | 0640000c                 | addi.w       #$c, d0                             ; arithmetic operation; flags depend on variant
0000405a | 3d40fffc                 | move.w       d0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000405e | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00004060 | 3f3c0030                 | move.w       #$30, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00004064 | a88d                     | dc.w         $a88d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004066 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00004068 | c1f9000003f4             | muls.w       $3f4.l, d0                          ; arithmetic operation; flags depend on variant
0000406e | 06400018                 | addi.w       #$18, d0                            ; arithmetic operation; flags depend on variant
00004072 | 3d40fffe                 | move.w       d0, -$2(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00004076 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00004078 | 3eb80baa                 | move.w       $baa.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000407c | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000407e | 322dd41c                 | move.w       -$2be4(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
00004082 | 926dd418                 | sub.w        -$2be8(a5), d1                      ; arithmetic operation; flags depend on variant
00004086 | 9240                     | sub.w        d0, d1                              ; arithmetic operation; flags depend on variant
00004088 | 0641ffe8                 | addi.w       #$ffe8, d1                          ; arithmetic operation; flags depend on variant
0000408c | 3801                     | move.w       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
0000408e | 3a2dd41e                 | move.w       -$2be2(a5), d5                      ; copy source to destination (Motorola operand order); flags depend on variant
00004092 | 9a6dd41a                 | sub.w        -$2be6(a5), d5                      ; arithmetic operation; flags depend on variant
00004096 | b86efffc                 | cmp.w        -$4(a6), d4                         ; compare operands; set condition flags
0000409a | 6c12                     | bge.b        $40ae                               ; branch according to condition flags (bra unconditional, bsr call)
0000409c | 70f4                     | moveq        #$f4, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000409e | d044                     | add.w        d4, d0                              ; arithmetic operation; flags depend on variant
000040a0 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000040a2 | 81c3                     | divs.w       d3, d0                              ; arithmetic operation; flags depend on variant
000040a4 | c1c3                     | muls.w       d3, d0                              ; arithmetic operation; flags depend on variant
000040a6 | 0640000c                 | addi.w       #$c, d0                             ; arithmetic operation; flags depend on variant
000040aa | 3d40fffc                 | move.w       d0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
000040ae | 4a79000003f8             | tst.w        $3f8.l                              ; machine operation; verify instruction and data boundaries
000040b4 | 6676                     | bne.b        $412c                               ; branch according to condition flags (bra unconditional, bsr call)
000040b6 | 4a79000003fa             | tst.w        $3fa.l                              ; machine operation; verify instruction and data boundaries
000040bc | 666e                     | bne.b        $412c                               ; branch according to condition flags (bra unconditional, bsr call)
000040be | ba6efffe                 | cmp.w        -$2(a6), d5                         ; compare operands; set condition flags
000040c2 | 6c2c                     | bge.b        $40f0                               ; branch according to condition flags (bra unconditional, bsr call)
000040c4 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000040c6 | 3f3c0030                 | move.w       #$30, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
000040ca | a88d                     | dc.w         $a88d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000040cc | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000040ce | 3d40ff66                 | move.w       d0, -$9a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000040d2 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000040d4 | 3f3c0030                 | move.w       #$30, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
000040d8 | a88d                     | dc.w         $a88d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000040da | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000040dc | 72d4                     | moveq        #$d4, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
000040de | d245                     | add.w        d5, d1                              ; arithmetic operation; flags depend on variant
000040e0 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000040e2 | 83c0                     | divs.w       d0, d1                              ; arithmetic operation; flags depend on variant
000040e4 | c3eeff66                 | muls.w       -$9a(a6), d1                        ; arithmetic operation; flags depend on variant
000040e8 | 06410018                 | addi.w       #$18, d1                            ; arithmetic operation; flags depend on variant
000040ec | 3d41fffe                 | move.w       d1, -$2(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
000040f0 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000040f6 | 302dd41e                 | move.w       -$2be2(a5), d0                      ; copy source to destination (Motorola operand order); flags depend on variant
000040fa | 906dd41a                 | sub.w        -$2be6(a5), d0                      ; arithmetic operation; flags depend on variant
000040fe | 906efffe                 | sub.w        -$2(a6), d0                         ; arithmetic operation; flags depend on variant
00004102 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00004104 | 81fc0002                 | divs.w       #$2, d0                             ; arithmetic operation; flags depend on variant
00004108 | 3f00                     | move.w       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000410a | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000410c | 3eb80baa                 | move.w       $baa.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00004110 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00004112 | 3204                     | move.w       d4, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00004114 | 926efffc                 | sub.w        -$4(a6), d1                         ; arithmetic operation; flags depend on variant
00004118 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
0000411a | 83fc0005                 | divs.w       #$5, d1                             ; arithmetic operation; flags depend on variant
0000411e | d240                     | add.w        d0, d1                              ; arithmetic operation; flags depend on variant
00004120 | 06410018                 | addi.w       #$18, d1                            ; arithmetic operation; flags depend on variant
00004124 | 3f01                     | move.w       d1, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004126 | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
00004128 | a91b                     | dc.w         $a91b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000412a | 6016                     | bra.b        $4142                               ; branch according to condition flags (bra unconditional, bsr call)
0000412c | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004132 | 3f39000003fa             | move.w       $3fa.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004138 | 3f39000003f8             | move.w       $3f8.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000413e | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
00004140 | a91b                     | dc.w         $a91b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004142 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004148 | 3f2efffe                 | move.w       -$2(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000414c | 3f2efffc                 | move.w       -$4(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004150 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004154 | a91d                     | dc.w         $a91d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004156 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000415c | 2d680010fff8             | move.l       $10(a0), -$8(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00004162 | 2d680014fffc             | move.l       $14(a0), -$4(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00004168 | 70f1                     | moveq        #$f1, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000416a | d06efffe                 | add.w        -$2(a6), d0                         ; arithmetic operation; flags depend on variant
0000416e | 3d40fffa                 | move.w       d0, -$6(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00004172 | 526efffe                 | addq.w       #$1, -$2(a6)                        ; arithmetic operation; flags depend on variant
00004176 | 046e000efffc             | subi.w       #$e, -$4(a6)                        ; arithmetic operation; flags depend on variant
0000417c | 536efff8                 | subq.w       #$1, -$8(a6)                        ; arithmetic operation; flags depend on variant
00004180 | 4a39000003f1             | tst.b        $3f1.l                              ; machine operation; verify instruction and data boundaries
00004186 | 6708                     | beq.b        $4190                               ; branch according to condition flags (bra unconditional, bsr call)
00004188 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000418a | 5840                     | addq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
0000418c | d16efff8                 | add.w        d0, -$8(a6)                         ; arithmetic operation; flags depend on variant
00004190 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00004192 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004198 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
0000419c | 48790000025e             | pea.l        $25e.l                              ; machine operation; verify instruction and data boundaries
000041a2 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000041a6 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000041a8 | 2f3c00100000             | move.l       #$100000, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000041ae | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000041b0 | a954                     | dc.w         $a954                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000041b2 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000041b4 | 2279000008ec             | movea.l      $8ec.l, a1                          ; copy source to destination (Motorola operand order); flags depend on variant
000041ba | 234800a0                 | move.l       a0, $a0(a1)                         ; copy source to destination (Motorola operand order); flags depend on variant
000041be | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000041c4 | a915                     | dc.w         $a915                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000041c6 | 206dd48c                 | movea.l      -$2b74(a5), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000041ca | 2d680010fff8             | move.l       $10(a0), -$8(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
000041d0 | 2d680014fffc             | move.l       $14(a0), -$4(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
000041d6 | 046e000ffffe             | subi.w       #$f, -$2(a6)                        ; arithmetic operation; flags depend on variant
000041dc | 4a39000003f1             | tst.b        $3f1.l                              ; machine operation; verify instruction and data boundaries
000041e2 | 6708                     | beq.b        $41ec                               ; branch according to condition flags (bra unconditional, bsr call)
000041e4 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000041e6 | 5840                     | addq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
000041e8 | d16efff8                 | add.w        d0, -$8(a6)                         ; arithmetic operation; flags depend on variant
000041ec | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000041f0 | 2f3c00040004             | move.l       #$40004, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000041f6 | a8a9                     | dc.w         $a8a9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000041f8 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000041fa | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000041fe | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004202 | a9d2                     | dc.w         $a9d2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004204 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00004206 | 2279000008ec             | movea.l      $8ec.l, a1                          ; copy source to destination (Motorola operand order); flags depend on variant
0000420c | 2348009c                 | move.l       a0, $9c(a1)                         ; copy source to destination (Motorola operand order); flags depend on variant
00004210 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004214 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000421a | 2f28009c                 | move.l       $9c(a0), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000421e | a813                     | dc.w         $a813                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004220 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00004226 | 3179000003f600a4         | move.w       $3f6.l, $a4(a0)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000422e | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00004234 | 422800a6                 | clr.b        $a6(a0)                             ; bit/integer operation; flags depend on variant
00004238 | 2079000008ec             | movea.l      $8ec.l, a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000423e | 42a800aa                 | clr.l        $aa(a0)                             ; bit/integer operation; flags depend on variant
00004242 | 2f39000008ec             | move.l       $8ec.l, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004248 | 4eb900003968             | jsr          $3968.l                             ; call subroutine; push return address
0000424e | 2f2eff68                 | move.l       -$98(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004252 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004254 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00004256 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00004258 | 4cdf0438                 | movem.l      (a7)+, d3-d5/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
0000425c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000425e | 4e75                     | rts                                              ; return: pop return address from stack
00004260 | 4e56ffd6                 | link.w       a6, #$ffd6                          ; establish stack frame
00004264 | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004268 | 2d7900000250fff8         | move.l       $250.l, -$8(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004270 | 2d7900000254fffc         | move.l       $254.l, -$4(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004278 | 2d790000024affee         | move.l       $24a.l, -$12(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00004280 | 3d790000024efff2         | move.w       $24e.l, -$e(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004288 | 2d79000008ceffe8         | move.l       $8ce.l, -$18(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00004290 | 3d79000008d2ffec         | move.w       $8d2.l, -$14(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00004298 | 486dd420                 | pea.l        -$2be0(a5)                          ; machine operation; verify instruction and data boundaries
0000429c | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000429e | 486efff4                 | pea.l        -$c(a6)                             ; machine operation; verify instruction and data boundaries
000042a2 | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000042a4 | 382dd41e                 | move.w       -$2be2(a5), d4                      ; copy source to destination (Motorola operand order); flags depend on variant
000042a8 | 986dd41a                 | sub.w        -$2be6(a5), d4                      ; arithmetic operation; flags depend on variant
000042ac | 986efffe                 | sub.w        -$2(a6), d4                         ; arithmetic operation; flags depend on variant
000042b0 | 48c4                     | ext.l        d4                                  ; bit/integer operation; flags depend on variant
000042b2 | 89fc0002                 | divs.w       #$2, d4                             ; arithmetic operation; flags depend on variant
000042b6 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000042b8 | 3eb80baa                 | move.w       $baa.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000042bc | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000042be | 3d40ffd6                 | move.w       d0, -$2a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000042c2 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000042c4 | 3eb80baa                 | move.w       $baa.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000042c8 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000042ca | 322dd41c                 | move.w       -$2be4(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
000042ce | 926dd418                 | sub.w        -$2be8(a5), d1                      ; arithmetic operation; flags depend on variant
000042d2 | 9240                     | sub.w        d0, d1                              ; arithmetic operation; flags depend on variant
000042d4 | 926efffc                 | sub.w        -$4(a6), d1                         ; arithmetic operation; flags depend on variant
000042d8 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000042da | 83fc0005                 | divs.w       #$5, d1                             ; arithmetic operation; flags depend on variant
000042de | d26effd6                 | add.w        -$2a(a6), d1                        ; arithmetic operation; flags depend on variant
000042e2 | 3601                     | move.w       d1, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000042e4 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000042e8 | 3f04                     | move.w       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000042ea | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000042ec | a8a8                     | dc.w         $a8a8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000042ee | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000042f0 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000042f2 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000042f6 | 48790000025e             | pea.l        $25e.l                              ; machine operation; verify instruction and data boundaries
000042fc | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004300 | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004304 | 4878ffff                 | pea.l        $ffff.w                             ; machine operation; verify instruction and data boundaries
00004308 | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
0000430a | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000430c | a913                     | dc.w         $a913                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000430e | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00004310 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00004312 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00004314 | 660a                     | bne.b        $4320                               ; branch according to condition flags (bra unconditional, bsr call)
00004316 | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000431a | a9c8                     | dc.w         $a9c8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000431c | 600000de                 | bra.w        $43fc                               ; branch according to condition flags (bra unconditional, bsr call)
00004320 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004322 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004324 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00004326 | a887                     | dc.w         $a887                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004328 | 3f3c0024                 | move.w       #$24, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000432c | a88a                     | dc.w         $a88a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000432e | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004332 | a888                     | dc.w         $a888                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004334 | 486effee                 | pea.l        -$12(a6)                            ; machine operation; verify instruction and data boundaries
00004338 | aa14                     | dc.w         $aa14                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000433a | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
0000433e | 2f3c00050000             | move.l       #$50000, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004344 | 2f3c003700f0             | move.l       #$3700f0, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000434a | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000434c | 487900000244             | pea.l        $244.l                              ; machine operation; verify instruction and data boundaries
00004352 | 48780005                 | pea.l        $5.w                                ; machine operation; verify instruction and data boundaries
00004356 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
0000435a | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000435e | a9ce                     | dc.w         $a9ce                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004360 | 3f3c000c                 | move.w       #$c, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004364 | a88a                     | dc.w         $a88a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004366 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00004368 | a888                     | dc.w         $a888                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000436a | 486effe8                 | pea.l        -$18(a6)                            ; machine operation; verify instruction and data boundaries
0000436e | aa14                     | dc.w         $aa14                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004370 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004374 | 2f3c00370000             | move.l       #$370000, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000437a | 2f3c004b00f0             | move.l       #$4b00f0, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004380 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004382 | 487900000222             | pea.l        $222.l                              ; machine operation; verify instruction and data boundaries
00004388 | 48780021                 | pea.l        $21.w                               ; machine operation; verify instruction and data boundaries
0000438c | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004390 | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004394 | a9ce                     | dc.w         $a9ce                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004396 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
0000439a | 2f3c004b0000             | move.l       #$4b0000, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000043a0 | 2f3c005f00f0             | move.l       #$5f00f0, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000043a6 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000043a8 | 487900000209             | pea.l        $209.l                              ; machine operation; verify instruction and data boundaries
000043ae | 48780018                 | pea.l        $18.w                               ; machine operation; verify instruction and data boundaries
000043b2 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000043b6 | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000043ba | a9ce                     | dc.w         $a9ce                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000043bc | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000043c0 | 2f3c005f0000             | move.l       #$5f0000, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000043c6 | 2f3c007300f0             | move.l       #$7300f0, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000043cc | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000043ce | 4879000001ee             | pea.l        $1ee.l                              ; machine operation; verify instruction and data boundaries
000043d4 | 4878001a                 | pea.l        $1a.w                               ; machine operation; verify instruction and data boundaries
000043d8 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000043dc | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000043e0 | a9ce                     | dc.w         $a9ce                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000043e2 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000043e4 | 3f3c000a                 | move.w       #$a, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000043e8 | 486effd8                 | pea.l        -$28(a6)                            ; machine operation; verify instruction and data boundaries
000043ec | a970                     | dc.w         $a970                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000043ee | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000043f0 | 67f0                     | beq.b        $43e2                               ; branch according to condition flags (bra unconditional, bsr call)
000043f2 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000043f4 | a914                     | dc.w         $a914                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000043f6 | 2f2efff4                 | move.l       -$c(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000043fa | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000043fc | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00004400 | 4e5e                     | unlk         a6                                  ; restore stack frame
00004402 | 4e75                     | rts                                              ; return: pop return address from stack
00004404 | 4e56ff76                 | link.w       a6, #$ff76                          ; establish stack frame
00004408 | 48e71c38                 | movem.l      d3-d5/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000440c | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00004410 | 2d79000001e6fff8         | move.l       $1e6.l, -$8(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004418 | 2d79000001eafffc         | move.l       $1ea.l, -$4(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004420 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00004422 | 41f900000182             | lea.l        $182.l, a0                          ; machine operation; verify instruction and data boundaries
00004428 | 43eeff84                 | lea.l        -$7c(a6), a1                        ; machine operation; verify instruction and data boundaries
0000442c | 7018                     | moveq        #$18, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000442e | 22d8                     | move.l       (a0)+, (a1)+                        ; copy source to destination (Motorola operand order); flags depend on variant
00004430 | 51c8fffc                 | dbra         d0, $442e                           ; machine operation; verify instruction and data boundaries
00004434 | 486dd420                 | pea.l        -$2be0(a5)                          ; machine operation; verify instruction and data boundaries
00004438 | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000443a | 486eff7c                 | pea.l        -$84(a6)                            ; machine operation; verify instruction and data boundaries
0000443e | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004440 | 3a2dd41e                 | move.w       -$2be2(a5), d5                      ; copy source to destination (Motorola operand order); flags depend on variant
00004444 | 9a6dd41a                 | sub.w        -$2be6(a5), d5                      ; arithmetic operation; flags depend on variant
00004448 | 9a6efffe                 | sub.w        -$2(a6), d5                         ; arithmetic operation; flags depend on variant
0000444c | 48c5                     | ext.l        d5                                  ; bit/integer operation; flags depend on variant
0000444e | 8bfc0002                 | divs.w       #$2, d5                             ; arithmetic operation; flags depend on variant
00004452 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00004454 | 3eb80baa                 | move.w       $baa.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00004458 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000445a | 3d40ff76                 | move.w       d0, -$8a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000445e | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00004460 | 3eb80baa                 | move.w       $baa.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00004464 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00004466 | 322dd41c                 | move.w       -$2be4(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
0000446a | 926dd418                 | sub.w        -$2be8(a5), d1                      ; arithmetic operation; flags depend on variant
0000446e | 9240                     | sub.w        d0, d1                              ; arithmetic operation; flags depend on variant
00004470 | 926efffc                 | sub.w        -$4(a6), d1                         ; arithmetic operation; flags depend on variant
00004474 | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
00004476 | 83fc0005                 | divs.w       #$5, d1                             ; arithmetic operation; flags depend on variant
0000447a | d26eff76                 | add.w        -$8a(a6), d1                        ; arithmetic operation; flags depend on variant
0000447e | 3801                     | move.w       d1, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00004480 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004484 | 3f05                     | move.w       d5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004486 | 3f04                     | move.w       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004488 | a8a8                     | dc.w         $a8a8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000448a | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000448c | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000448e | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004492 | 48790000025e             | pea.l        $25e.l                              ; machine operation; verify instruction and data boundaries
00004498 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000449c | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000044a0 | 4878ffff                 | pea.l        $ffff.w                             ; machine operation; verify instruction and data boundaries
000044a4 | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
000044a6 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000044a8 | a913                     | dc.w         $a913                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000044aa | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000044ac | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000044ae | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000044b0 | 660a                     | bne.b        $44bc                               ; branch according to condition flags (bra unconditional, bsr call)
000044b2 | 3f3c000a                 | move.w       #$a, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000044b6 | a9c8                     | dc.w         $a9c8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000044b8 | 60000188                 | bra.w        $4642                               ; branch according to condition flags (bra unconditional, bsr call)
000044bc | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000044be | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000044c0 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000044c2 | a887                     | dc.w         $a887                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000044c4 | 3f3c000c                 | move.w       #$c, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000044c8 | a88a                     | dc.w         $a88a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000044ca | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000044cc | a888                     | dc.w         $a888                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000044ce | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000044d2 | 2f3c00040032             | move.l       #$40032, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000044d8 | 2f3c002e0104             | move.l       #$2e0104, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000044de | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000044e0 | 41eeff84                 | lea.l        -$7c(a6), a0                        ; machine operation; verify instruction and data boundaries
000044e4 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000044e6 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000044e8 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
000044ea | 66fa                     | bne.b        $44e6                               ; branch according to condition flags (bra unconditional, bsr call)
000044ec | 3800                     | move.w       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000044ee | 41eb0001                 | lea.l        $1(a3), a0                          ; machine operation; verify instruction and data boundaries
000044f2 | 43eeff84                 | lea.l        -$7c(a6), a1                        ; machine operation; verify instruction and data boundaries
000044f6 | 43f14000                 | lea.l        (a1, d4.w), a1                      ; machine operation; verify instruction and data boundaries
000044fa | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000044fc | 1013                     | move.b       (a3), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000044fe | a02e                     | dc.w         $a02e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004500 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00004502 | 1013                     | move.b       (a3), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00004504 | d044                     | add.w        d4, d0                              ; arithmetic operation; flags depend on variant
00004506 | 5240                     | addq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00004508 | 41eeff84                 | lea.l        -$7c(a6), a0                        ; machine operation; verify instruction and data boundaries
0000450c | 42300000                 | clr.b        (a0, d0.w)                          ; bit/integer operation; flags depend on variant
00004510 | 48790000017f             | pea.l        $17f.l                              ; machine operation; verify instruction and data boundaries
00004516 | 486eff84                 | pea.l        -$7c(a6)                            ; machine operation; verify instruction and data boundaries
0000451a | 4eb9000018b4             | jsr          $18b4.l                             ; call subroutine; push return address
00004520 | 486eff84                 | pea.l        -$7c(a6)                            ; machine operation; verify instruction and data boundaries
00004524 | 41eeff84                 | lea.l        -$7c(a6), a0                        ; machine operation; verify instruction and data boundaries
00004528 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000452a | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
0000452c | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
0000452e | 66fa                     | bne.b        $452a                               ; branch according to condition flags (bra unconditional, bsr call)
00004530 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004532 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004536 | 3f3cfffe                 | move.w       #$fffe, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000453a | a9ce                     | dc.w         $a9ce                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000453c | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004540 | 2f3c00080008             | move.l       #$80008, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004546 | 2f3c00280028             | move.l       #$280028, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000454c | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000454e | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00004550 | a9bb                     | dc.w         $a9bb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004552 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00004554 | 2848                     | movea.l      a0, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
00004556 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
0000455a | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000455c | a94b                     | dc.w         $a94b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000455e | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004562 | 2f3c00320069             | move.l       #$320069, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004568 | 2f3c004400a5             | move.l       #$4400a5, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000456e | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004570 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004572 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004576 | 48790000017c             | pea.l        $17c.l                              ; machine operation; verify instruction and data boundaries
0000457c | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004580 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00004582 | 2f3c00080000             | move.l       #$80000, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004588 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000458a | a954                     | dc.w         $a954                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000458c | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000458e | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00004590 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004592 | 4eb9000037c4             | jsr          $37c4.l                             ; call subroutine; push return address
00004598 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000459a | 6000008e                 | bra.w        $462a                               ; branch according to condition flags (bra unconditional, bsr call)
0000459e | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000045a0 | 3f3c000a                 | move.w       #$a, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000045a4 | 486effe8                 | pea.l        -$18(a6)                            ; machine operation; verify instruction and data boundaries
000045a8 | a970                     | dc.w         $a970                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000045aa | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000045ac | 677c                     | beq.b        $462a                               ; branch according to condition flags (bra unconditional, bsr call)
000045ae | 0c6e0001ffe8             | cmpi.w       #$1, -$18(a6)                       ; compare operands; set condition flags
000045b4 | 664a                     | bne.b        $4600                               ; branch according to condition flags (bra unconditional, bsr call)
000045b6 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000045b8 | 2f2efff2                 | move.l       -$e(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000045bc | 486eff80                 | pea.l        -$80(a6)                            ; machine operation; verify instruction and data boundaries
000045c0 | a92c                     | dc.w         $a92c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000045c2 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000045c4 | 5740                     | subq.w       #$3, d0                             ; arithmetic operation; flags depend on variant
000045c6 | 6662                     | bne.b        $462a                               ; branch according to condition flags (bra unconditional, bsr call)
000045c8 | b5eeff80                 | cmpa.l       -$80(a6), a2                        ; compare operands; set condition flags
000045cc | 665c                     | bne.b        $462a                               ; branch according to condition flags (bra unconditional, bsr call)
000045ce | 486efff2                 | pea.l        -$e(a6)                             ; machine operation; verify instruction and data boundaries
000045d2 | a871                     | dc.w         $a871                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000045d4 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000045d6 | 2f2efff2                 | move.l       -$e(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000045da | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000045dc | 486eff78                 | pea.l        -$88(a6)                            ; machine operation; verify instruction and data boundaries
000045e0 | a96c                     | dc.w         $a96c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000045e2 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000045e4 | 0c40000a                 | cmpi.w       #$a, d0                             ; compare operands; set condition flags
000045e8 | 6640                     | bne.b        $462a                               ; branch according to condition flags (bra unconditional, bsr call)
000045ea | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000045ec | 2f2eff78                 | move.l       -$88(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000045f0 | 2f2efff2                 | move.l       -$e(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000045f4 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000045f6 | a968                     | dc.w         $a968                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000045f8 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000045fa | 672e                     | beq.b        $462a                               ; branch according to condition flags (bra unconditional, bsr call)
000045fc | 7601                     | moveq        #$1, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000045fe | 602a                     | bra.b        $462a                               ; branch according to condition flags (bra unconditional, bsr call)
00004600 | 0c6e0003ffe8             | cmpi.w       #$3, -$18(a6)                       ; compare operands; set condition flags
00004606 | 6622                     | bne.b        $462a                               ; branch according to condition flags (bra unconditional, bsr call)
00004608 | 282effea                 | move.l       -$16(a6), d4                        ; copy source to destination (Motorola operand order); flags depend on variant
0000460c | 0284000000ff             | andi.l       #$ff, d4                            ; bit/integer operation; flags depend on variant
00004612 | 0c04000d                 | cmpi.b       #$d, d4                             ; compare operands; set condition flags
00004616 | 6706                     | beq.b        $461e                               ; branch according to condition flags (bra unconditional, bsr call)
00004618 | 0c040003                 | cmpi.b       #$3, d4                             ; compare operands; set condition flags
0000461c | 660c                     | bne.b        $462a                               ; branch according to condition flags (bra unconditional, bsr call)
0000461e | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004620 | 4eb90000379c             | jsr          $379c.l                             ; call subroutine; push return address
00004626 | 7601                     | moveq        #$1, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00004628 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000462a | 4a03                     | tst.b        d3                                  ; machine operation; verify instruction and data boundaries
0000462c | 6700ff70                 | beq.w        $459e                               ; branch according to condition flags (bra unconditional, bsr call)
00004630 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004632 | a955                     | dc.w         $a955                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004634 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004636 | a914                     | dc.w         $a914                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004638 | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000463a | a9a3                     | dc.w         $a9a3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000463c | 2f2eff7c                 | move.l       -$84(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004640 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004642 | 4cdf1c38                 | movem.l      (a7)+, d3-d5/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
00004646 | 4e5e                     | unlk         a6                                  ; restore stack frame
00004648 | 4e75                     | rts                                              ; return: pop return address from stack
0000464a | 4e56ff6c                 | link.w       a6, #$ff6c                          ; establish stack frame
0000464e | 48e71f38                 | movem.l      d3-d7/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00004652 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00004656 | 2d790000016efff8         | move.l       $16e.l, -$8(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000465e | 2d7900000172fffc         | move.l       $172.l, -$4(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004666 | 41f900000100             | lea.l        $100.l, a0                          ; machine operation; verify instruction and data boundaries
0000466c | 43eeff7a                 | lea.l        -$86(a6), a1                        ; machine operation; verify instruction and data boundaries
00004670 | 7036                     | moveq        #$36, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00004672 | 32d8                     | move.w       (a0)+, (a1)+                        ; copy source to destination (Motorola operand order); flags depend on variant
00004674 | 51c8fffc                 | dbra         d0, $4672                           ; machine operation; verify instruction and data boundaries
00004678 | 7a00                     | moveq        #$0, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
0000467a | 486dd420                 | pea.l        -$2be0(a5)                          ; machine operation; verify instruction and data boundaries
0000467e | a851                     | dc.w         $a851                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004680 | 486eff6e                 | pea.l        -$92(a6)                            ; machine operation; verify instruction and data boundaries
00004684 | a874                     | dc.w         $a874                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004686 | 3e2dd41e                 | move.w       -$2be2(a5), d7                      ; copy source to destination (Motorola operand order); flags depend on variant
0000468a | 9e6dd41a                 | sub.w        -$2be6(a5), d7                      ; arithmetic operation; flags depend on variant
0000468e | 9e6efffe                 | sub.w        -$2(a6), d7                         ; arithmetic operation; flags depend on variant
00004692 | 48c7                     | ext.l        d7                                  ; bit/integer operation; flags depend on variant
00004694 | 8ffc0002                 | divs.w       #$2, d7                             ; arithmetic operation; flags depend on variant
00004698 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
0000469a | 3eb80baa                 | move.w       $baa.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000469e | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000046a0 | 3d40ff6c                 | move.w       d0, -$94(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000046a4 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000046a6 | 3eb80baa                 | move.w       $baa.w, (a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000046aa | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000046ac | 322dd41c                 | move.w       -$2be4(a5), d1                      ; copy source to destination (Motorola operand order); flags depend on variant
000046b0 | 926dd418                 | sub.w        -$2be8(a5), d1                      ; arithmetic operation; flags depend on variant
000046b4 | 9240                     | sub.w        d0, d1                              ; arithmetic operation; flags depend on variant
000046b6 | 926efffc                 | sub.w        -$4(a6), d1                         ; arithmetic operation; flags depend on variant
000046ba | 48c1                     | ext.l        d1                                  ; bit/integer operation; flags depend on variant
000046bc | 83fc0005                 | divs.w       #$5, d1                             ; arithmetic operation; flags depend on variant
000046c0 | d26eff6c                 | add.w        -$94(a6), d1                        ; arithmetic operation; flags depend on variant
000046c4 | 3601                     | move.w       d1, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000046c6 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000046ca | 3f07                     | move.w       d7, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000046cc | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000046ce | a8a8                     | dc.w         $a8a8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000046d0 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000046d2 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000046d4 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000046d8 | 48790000025e             | pea.l        $25e.l                              ; machine operation; verify instruction and data boundaries
000046de | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000046e2 | 3f3c0001                 | move.w       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000046e6 | 4878ffff                 | pea.l        $ffff.w                             ; machine operation; verify instruction and data boundaries
000046ea | 4227                     | clr.b        -(a7)                               ; bit/integer operation; flags depend on variant
000046ec | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000046ee | a913                     | dc.w         $a913                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000046f0 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000046f2 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000046f4 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000046f6 | 660c                     | bne.b        $4704                               ; branch according to condition flags (bra unconditional, bsr call)
000046f8 | 3f3c000a                 | move.w       #$a, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000046fc | a9c8                     | dc.w         $a9c8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000046fe | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00004700 | 600002e2                 | bra.w        $49e4                               ; branch according to condition flags (bra unconditional, bsr call)
00004704 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004706 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004708 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
0000470a | a887                     | dc.w         $a887                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000470c | 3f3c000c                 | move.w       #$c, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004710 | a88a                     | dc.w         $a88a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004712 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00004714 | a888                     | dc.w         $a888                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004716 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
0000471a | 2f3c000c004e             | move.l       #$c004e, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004720 | 2f3c002c0175             | move.l       #$2c0175, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004726 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004728 | 41eeff7a                 | lea.l        -$86(a6), a0                        ; machine operation; verify instruction and data boundaries
0000472c | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000472e | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00004730 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00004732 | 66fa                     | bne.b        $472e                               ; branch according to condition flags (bra unconditional, bsr call)
00004734 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00004736 | 41eb0001                 | lea.l        $1(a3), a0                          ; machine operation; verify instruction and data boundaries
0000473a | 43eeff7a                 | lea.l        -$86(a6), a1                        ; machine operation; verify instruction and data boundaries
0000473e | 43f13000                 | lea.l        (a1, d3.w), a1                      ; machine operation; verify instruction and data boundaries
00004742 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00004744 | 1013                     | move.b       (a3), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00004746 | a02e                     | dc.w         $a02e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004748 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000474a | 1013                     | move.b       (a3), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000474c | d043                     | add.w        d3, d0                              ; arithmetic operation; flags depend on variant
0000474e | 5240                     | addq.w       #$1, d0                             ; arithmetic operation; flags depend on variant
00004750 | 41eeff7a                 | lea.l        -$86(a6), a0                        ; machine operation; verify instruction and data boundaries
00004754 | 42300000                 | clr.b        (a0, d0.w)                          ; bit/integer operation; flags depend on variant
00004758 | 4879000000ed             | pea.l        $ed.l                               ; machine operation; verify instruction and data boundaries
0000475e | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
00004762 | 4eb9000018b4             | jsr          $18b4.l                             ; call subroutine; push return address
00004768 | 486eff7a                 | pea.l        -$86(a6)                            ; machine operation; verify instruction and data boundaries
0000476c | 41eeff7a                 | lea.l        -$86(a6), a0                        ; machine operation; verify instruction and data boundaries
00004770 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00004772 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00004774 | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00004776 | 66fa                     | bne.b        $4772                               ; branch according to condition flags (bra unconditional, bsr call)
00004778 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000477a | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
0000477e | 3f3cfffe                 | move.w       #$fffe, -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004782 | a9ce                     | dc.w         $a9ce                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004784 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004788 | 2f3c000c0017             | move.l       #$c0017, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000478e | 2f3c002c0037             | move.l       #$2c0037, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004794 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004796 | 3f3c0002                 | move.w       #$2, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000479a | a9bb                     | dc.w         $a9bb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000479c | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000479e | 2e08                     | move.l       a0, d7                              ; copy source to destination (Motorola operand order); flags depend on variant
000047a0 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000047a4 | 2f07                     | move.l       d7, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000047a6 | a94b                     | dc.w         $a94b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000047a8 | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
000047ae | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000047b0 | 676a                     | beq.b        $481c                               ; branch according to condition flags (bra unconditional, bsr call)
000047b2 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000047b6 | 2f3c0039004e             | move.l       #$39004e, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000047bc | 2f3c004d009e             | move.l       #$4d009e, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000047c2 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000047c4 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000047c6 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000047c8 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000047cc | 4879000000e2             | pea.l        $e2.l                               ; machine operation; verify instruction and data boundaries
000047d2 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000047d6 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000047d8 | 2f3c00080000             | move.l       #$80000, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000047de | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000047e0 | a954                     | dc.w         $a954                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000047e2 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
000047e4 | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
000047e6 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
000047ea | 2f3c003900f5             | move.l       #$3900f5, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000047f0 | 2f3c004d0130             | move.l       #$4d0130, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000047f6 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000047f8 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000047fa | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000047fc | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004800 | 4879000000db             | pea.l        $db.l                               ; machine operation; verify instruction and data boundaries
00004806 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000480a | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000480c | 2f3c00080000             | move.l       #$80000, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004812 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00004814 | a954                     | dc.w         $a954                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004816 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00004818 | 2c08                     | move.l       a0, d6                              ; copy source to destination (Motorola operand order); flags depend on variant
0000481a | 6034                     | bra.b        $4850                               ; branch according to condition flags (bra unconditional, bsr call)
0000481c | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004820 | 2f3c003900e0             | move.l       #$3900e0, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004826 | 2f3c004d0130             | move.l       #$4d0130, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000482c | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000482e | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00004830 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004832 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004836 | 4879000000e2             | pea.l        $e2.l                               ; machine operation; verify instruction and data boundaries
0000483c | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004840 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00004842 | 2f3c00080000             | move.l       #$80000, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004848 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000484a | a954                     | dc.w         $a954                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000484c | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000484e | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
00004850 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
00004854 | 2f3c0039013a             | move.l       #$39013a, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000485a | 2f3c004d0176             | move.l       #$4d0176, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004860 | a8a7                     | dc.w         $a8a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004862 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00004864 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004866 | 486efff8                 | pea.l        -$8(a6)                             ; machine operation; verify instruction and data boundaries
0000486a | 4879000000d6             | pea.l        $d6.l                               ; machine operation; verify instruction and data boundaries
00004870 | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004874 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00004876 | 2f3c00080000             | move.l       #$80000, -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000487c | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
0000487e | a954                     | dc.w         $a954                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004880 | 205f                     | movea.l      (a7)+, a0                           ; copy source to destination (Motorola operand order); flags depend on variant
00004882 | 2848                     | movea.l      a0, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
00004884 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004886 | 4eb9000037c4             | jsr          $37c4.l                             ; call subroutine; push return address
0000488c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000488e | 6000012a                 | bra.w        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
00004892 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00004894 | 3f3c000a                 | move.w       #$a, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004898 | 486effe8                 | pea.l        -$18(a6)                            ; machine operation; verify instruction and data boundaries
0000489c | a970                     | dc.w         $a970                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000489e | 101f                     | move.b       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000048a0 | 67000118                 | beq.w        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
000048a4 | 0c6e0001ffe8             | cmpi.w       #$1, -$18(a6)                       ; compare operands; set condition flags
000048aa | 6674                     | bne.b        $4920                               ; branch according to condition flags (bra unconditional, bsr call)
000048ac | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000048ae | 2f2efff2                 | move.l       -$e(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000048b2 | 486eff72                 | pea.l        -$8e(a6)                            ; machine operation; verify instruction and data boundaries
000048b6 | a92c                     | dc.w         $a92c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000048b8 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000048ba | 5740                     | subq.w       #$3, d0                             ; arithmetic operation; flags depend on variant
000048bc | 660000fc                 | bne.w        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
000048c0 | b5eeff72                 | cmpa.l       -$8e(a6), a2                        ; compare operands; set condition flags
000048c4 | 660000f4                 | bne.w        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
000048c8 | 486efff2                 | pea.l        -$e(a6)                             ; machine operation; verify instruction and data boundaries
000048cc | a871                     | dc.w         $a871                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000048ce | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000048d0 | 2f2efff2                 | move.l       -$e(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000048d4 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000048d6 | 486eff76                 | pea.l        -$8a(a6)                            ; machine operation; verify instruction and data boundaries
000048da | a96c                     | dc.w         $a96c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000048dc | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000048de | 0c40000a                 | cmpi.w       #$a, d0                             ; compare operands; set condition flags
000048e2 | 660000d6                 | bne.w        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
000048e6 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000048e8 | 2f2eff76                 | move.l       -$8a(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000048ec | 2f2efff2                 | move.l       -$e(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
000048f0 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000048f2 | a968                     | dc.w         $a968                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000048f4 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000048f6 | 670000c2                 | beq.w        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
000048fa | b9eeff76                 | cmpa.l       -$8a(a6), a4                        ; compare operands; set condition flags
000048fe | 6602                     | bne.b        $4902                               ; branch according to condition flags (bra unconditional, bsr call)
00004900 | 7801                     | moveq        #$1, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00004902 | b7eeff76                 | cmpa.l       -$8a(a6), a3                        ; compare operands; set condition flags
00004906 | 6602                     | bne.b        $490a                               ; branch according to condition flags (bra unconditional, bsr call)
00004908 | 7802                     | moveq        #$2, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
0000490a | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
00004910 | 6708                     | beq.b        $491a                               ; branch according to condition flags (bra unconditional, bsr call)
00004912 | bcaeff76                 | cmp.l        -$8a(a6), d6                        ; compare operands; set condition flags
00004916 | 6602                     | bne.b        $491a                               ; branch according to condition flags (bra unconditional, bsr call)
00004918 | 7803                     | moveq        #$3, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
0000491a | 7a01                     | moveq        #$1, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
0000491c | 6000009c                 | bra.w        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
00004920 | 0c6e0003ffe8             | cmpi.w       #$3, -$18(a6)                       ; compare operands; set condition flags
00004926 | 66000092                 | bne.w        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
0000492a | 262effea                 | move.l       -$16(a6), d3                        ; copy source to destination (Motorola operand order); flags depend on variant
0000492e | 0283000000ff             | andi.l       #$ff, d3                            ; bit/integer operation; flags depend on variant
00004934 | 0c030059                 | cmpi.b       #$59, d3                            ; compare operands; set condition flags
00004938 | 6712                     | beq.b        $494c                               ; branch according to condition flags (bra unconditional, bsr call)
0000493a | 0c030079                 | cmpi.b       #$79, d3                            ; compare operands; set condition flags
0000493e | 670c                     | beq.b        $494c                               ; branch according to condition flags (bra unconditional, bsr call)
00004940 | 0c030053                 | cmpi.b       #$53, d3                            ; compare operands; set condition flags
00004944 | 6706                     | beq.b        $494c                               ; branch according to condition flags (bra unconditional, bsr call)
00004946 | 0c030073                 | cmpi.b       #$73, d3                            ; compare operands; set condition flags
0000494a | 6610                     | bne.b        $495c                               ; branch according to condition flags (bra unconditional, bsr call)
0000494c | 7801                     | moveq        #$1, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
0000494e | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004950 | 4eb90000379c             | jsr          $379c.l                             ; call subroutine; push return address
00004956 | 7a01                     | moveq        #$1, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
00004958 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000495a | 605e                     | bra.b        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
0000495c | 0c03004e                 | cmpi.b       #$4e, d3                            ; compare operands; set condition flags
00004960 | 671e                     | beq.b        $4980                               ; branch according to condition flags (bra unconditional, bsr call)
00004962 | 0c03006e                 | cmpi.b       #$6e, d3                            ; compare operands; set condition flags
00004966 | 6718                     | beq.b        $4980                               ; branch according to condition flags (bra unconditional, bsr call)
00004968 | 0c030044                 | cmpi.b       #$44, d3                            ; compare operands; set condition flags
0000496c | 6712                     | beq.b        $4980                               ; branch according to condition flags (bra unconditional, bsr call)
0000496e | 0c030064                 | cmpi.b       #$64, d3                            ; compare operands; set condition flags
00004972 | 670c                     | beq.b        $4980                               ; branch according to condition flags (bra unconditional, bsr call)
00004974 | 0c03000d                 | cmpi.b       #$d, d3                             ; compare operands; set condition flags
00004978 | 6706                     | beq.b        $4980                               ; branch according to condition flags (bra unconditional, bsr call)
0000497a | 0c030003                 | cmpi.b       #$3, d3                             ; compare operands; set condition flags
0000497e | 6610                     | bne.b        $4990                               ; branch according to condition flags (bra unconditional, bsr call)
00004980 | 7802                     | moveq        #$2, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00004982 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004984 | 4eb90000379c             | jsr          $379c.l                             ; call subroutine; push return address
0000498a | 7a01                     | moveq        #$1, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
0000498c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000498e | 602a                     | bra.b        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
00004990 | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
00004996 | 6722                     | beq.b        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
00004998 | 0c03002e                 | cmpi.b       #$2e, d3                            ; compare operands; set condition flags
0000499c | 6608                     | bne.b        $49a6                               ; branch according to condition flags (bra unconditional, bsr call)
0000499e | 082e0000fff6             | btst.b       #$0, -$a(a6)                        ; branch according to condition flags (bra unconditional, bsr call)
000049a4 | 6606                     | bne.b        $49ac                               ; branch according to condition flags (bra unconditional, bsr call)
000049a6 | 0c03001b                 | cmpi.b       #$1b, d3                            ; compare operands; set condition flags
000049aa | 660e                     | bne.b        $49ba                               ; branch according to condition flags (bra unconditional, bsr call)
000049ac | 7803                     | moveq        #$3, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
000049ae | 2f06                     | move.l       d6, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000049b0 | 4eb90000379c             | jsr          $379c.l                             ; call subroutine; push return address
000049b6 | 7a01                     | moveq        #$1, d5                             ; copy source to destination (Motorola operand order); flags depend on variant
000049b8 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000049ba | 4a05                     | tst.b        d5                                  ; machine operation; verify instruction and data boundaries
000049bc | 6700fed4                 | beq.w        $4892                               ; branch according to condition flags (bra unconditional, bsr call)
000049c0 | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000049c2 | a955                     | dc.w         $a955                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000049c4 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000049c6 | a955                     | dc.w         $a955                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000049c8 | 4a39000003ed             | tst.b        $3ed.l                              ; machine operation; verify instruction and data boundaries
000049ce | 6704                     | beq.b        $49d4                               ; branch according to condition flags (bra unconditional, bsr call)
000049d0 | 2f06                     | move.l       d6, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000049d2 | a955                     | dc.w         $a955                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000049d4 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000049d6 | a914                     | dc.w         $a914                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000049d8 | 2f07                     | move.l       d7, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000049da | a9a3                     | dc.w         $a9a3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000049dc | 2f2eff6e                 | move.l       -$92(a6), -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000049e0 | a873                     | dc.w         $a873                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000049e2 | 3004                     | move.w       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000049e4 | 4cdf1cf8                 | movem.l      (a7)+, d3-d7/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
000049e8 | 4e5e                     | unlk         a6                                  ; restore stack frame
000049ea | 4e75                     | rts                                              ; return: pop return address from stack
000049ec | 4feffff6                 | lea.l        -$a(a7), a7                         ; machine operation; verify instruction and data boundaries
000049f0 | 2eaf0012                 | move.l       $12(a7), (a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000049f4 | 2f6f00160004             | move.l       $16(a7), $4(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000049fa | 3f6f001a0008             | move.w       $1a(a7), $8(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004a00 | 4857                     | pea.l        (a7)                                ; machine operation; verify instruction and data boundaries
00004a02 | 3f3c001a                 | move.w       #$1a, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00004a06 | a9ec                     | dc.w         $a9ec                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004a08 | 206f000e                 | movea.l      $e(a7), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00004a0c | 2097                     | move.l       (a7), (a0)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004a0e | 216f00040004             | move.l       $4(a7), $4(a0)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004a14 | 316f00080008             | move.w       $8(a7), $8(a0)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004a1a | 4fef000a                 | lea.l        $a(a7), a7                          ; machine operation; verify instruction and data boundaries
00004a1e | 4e75                     | rts                                              ; return: pop return address from stack
00004a20 | 4feffff6                 | lea.l        -$a(a7), a7                         ; machine operation; verify instruction and data boundaries
00004a24 | 2eaf0012                 | move.l       $12(a7), (a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004a28 | 2f6f00160004             | move.l       $16(a7), $4(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004a2e | 3f6f001a0008             | move.w       $1a(a7), $8(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004a34 | 4857                     | pea.l        (a7)                                ; machine operation; verify instruction and data boundaries
00004a36 | 3f3c0018                 | move.w       #$18, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00004a3a | a9ec                     | dc.w         $a9ec                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004a3c | 206f000e                 | movea.l      $e(a7), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00004a40 | 2097                     | move.l       (a7), (a0)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004a42 | 216f00040004             | move.l       $4(a7), $4(a0)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004a48 | 316f00080008             | move.w       $8(a7), $8(a0)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004a4e | 4fef000a                 | lea.l        $a(a7), a7                          ; machine operation; verify instruction and data boundaries
00004a52 | 4e75                     | rts                                              ; return: pop return address from stack
00004a54 | 4feffff6                 | lea.l        -$a(a7), a7                         ; machine operation; verify instruction and data boundaries
00004a58 | 2eaf0012                 | move.l       $12(a7), (a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004a5c | 2f6f00160004             | move.l       $16(a7), $4(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004a62 | 3f6f001a0008             | move.w       $1a(a7), $8(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00004a68 | 2f2f000e                 | move.l       $e(a7), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004a6c | 486f0004                 | pea.l        $4(a7)                              ; machine operation; verify instruction and data boundaries
00004a70 | 2f2f0024                 | move.l       $24(a7), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004a74 | 3f3c000b                 | move.w       #$b, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004a78 | a9eb                     | dc.w         $a9eb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004a7a | 4fef000a                 | lea.l        $a(a7), a7                          ; machine operation; verify instruction and data boundaries
00004a7e | 4e75                     | rts                                              ; return: pop return address from stack
00004a80 | 2f2f0004                 | move.l       $4(a7), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004a84 | 2f2f000c                 | move.l       $c(a7), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004a88 | 2f2f0014                 | move.l       $14(a7), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00004a8c | 3f3c0003                 | move.w       #$3, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00004a90 | a9ee                     | dc.w         $a9ee                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004a92 | 2f2f000c                 | move.l       $c(a7), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00004a96 | 4eb900000070             | jsr          $70.l                               ; call subroutine; push return address
00004a9c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00004a9e | 4e75                     | rts                                              ; return: pop return address from stack
00004aa0 | 00000190                 | ori.b        #$90, d0                            ; bit/integer operation; flags depend on variant
00004aa4 | 4119                     | dc.w         $4119                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004aa6 | 4181                     | chk.w        d1, d0                              ; machine operation; verify instruction and data boundaries
00004aa8 | 4b45                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004aaa | 406a4047                 | negx.w       $4047(a2)                           ; machine operation; verify instruction and data boundaries
00004aae | fcd8                     | dc.w         $fcd8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ab0 | f7fc                     | dc.w         $f7fc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ab2 | fd40                     | dc.w         $fd40                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ab4 | 85ebaf9c                 | divs.w       -$5064(a3), d2                      ; arithmetic operation; flags depend on variant
00004ab8 | 4052                     | negx.w       (a2)                                ; machine operation; verify instruction and data boundaries
00004aba | fafa                     | dc.w         $fafa                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004abc | faf9                     | dc.w         $faf9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004abe | fa40                     | dc.w         $fa40                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ac0 | 61fa                     | bsr.b        $4abc                               ; call subroutine; push return address
00004ac2 | fafa                     | dc.w         $fafa                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ac4 | f9fa                     | dc.w         $f9fa                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ac6 | bbf68d40                 | cmpa.l       (a6, invalid.w), a5                 ; compare operands; set condition flags
00004aca | 54bf                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004acc | f999                     | dc.w         $f999                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ace | 8940                     | dc.w         $8940                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ad0 | 637f                     | bls.b        $4b51                               ; branch according to condition flags (bra unconditional, bsr call)
00004ad2 | a840                     | dc.w         $a840                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ad4 | 69fc                     | bvs.b        $4ad2                               ; branch according to condition flags (bra unconditional, bsr call)
00004ad6 | fefd                     | dc.w         $fefd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ad8 | fef1                     | dc.w         $fef1                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ada | fdfd                     | dc.w         $fdfd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004adc | c4fd                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004ade | 40694192                 | negx.w       $4192(a1)                           ; machine operation; verify instruction and data boundaries
00004ae2 | d0c8                     | adda.w       a0, a0                              ; arithmetic operation; flags depend on variant
00004ae4 | 7f54                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004ae6 | 9141                     | subx.w       d1, d0                              ; arithmetic operation; flags depend on variant
00004ae8 | 55f1f7f5f2eaca7f         | scs.b        ([$f2eaca7f])                       ; machine operation; verify instruction and data boundaries
00004af0 | 9df1e58ffc405240         | suba.l       ([], a6.w * 4, $fc405240), a6       ; arithmetic operation; flags depend on variant
00004af8 | 81eacd84                 | divs.w       -$327c(a2), d0                      ; arithmetic operation; flags depend on variant
00004afc | 4095                     | negx.l       (a5)                                ; machine operation; verify instruction and data boundaries
00004afe | f999                     | dc.w         $f999                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b00 | 8940                     | dc.w         $8940                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b02 | 59fc                     | dc.w         $59fc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b04 | fcfa                     | dc.w         $fcfa                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b06 | fcd3                     | dc.w         $fcd3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b08 | f6fb                     | dc.w         $f6fb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b0a | aedd                     | dc.w         $aedd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b0c | acfb                     | dc.w         $acfb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b0e | aafc                     | dc.w         $aafc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b10 | fefd                     | dc.w         $fefd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b12 | fe93                     | dc.w         $fe93                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b14 | 4042                     | negx.w       d2                                  ; machine operation; verify instruction and data boundaries
00004b16 | c2bafbf4                 | and.l        $470c(pc), d1                       ; bit/integer operation; flags depend on variant
00004b1a | de84                     | add.l        d4, d7                              ; arithmetic operation; flags depend on variant
00004b1c | 9bfcfefdf9b7             | suba.l       #$fefdf9b7, a5                      ; arithmetic operation; flags depend on variant
00004b22 | 8840                     | or.w         d0, d4                              ; bit/integer operation; flags depend on variant
00004b24 | 4ad3                     | tas.b        (a3)                                ; machine operation; verify instruction and data boundaries
00004b26 | fbf2                     | dc.w         $fbf2                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b28 | 9ff7ee85                 | suba.l       -$7b(a7, a6.l), a7                  ; arithmetic operation; flags depend on variant
00004b2c | 938c                     | subx.l       -(a4), -(a1)                        ; arithmetic operation; flags depend on variant
00004b2e | 8ff79d41                 | divs.w       ([a7]), d7                          ; arithmetic operation; flags depend on variant
00004b32 | f4c5                     | dc.w         $f4c5                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b34 | e2fa                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004b36 | ef7f                     | rol.w        d7, d7                              ; bit/integer operation; flags depend on variant
00004b38 | b7f2d47f                 | cmpa.l       $7f(a2, a5.w), a3                   ; compare operands; set condition flags
00004b3c | bfd0                     | cmpa.l       (a0), a7                            ; compare operands; set condition flags
00004b3e | dadd                     | adda.w       (a5)+, a5                           ; arithmetic operation; flags depend on variant
00004b40 | cbf841e7                 | muls.w       $41e7.w, d5                         ; arithmetic operation; flags depend on variant
00004b44 | 7e1e                     | moveq        #$1e, d7                            ; copy source to destination (Motorola operand order); flags depend on variant
00004b46 | 41d1                     | lea.l        (a1), a0                            ; machine operation; verify instruction and data boundaries
00004b48 | fdfd                     | dc.w         $fdfd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b4a | fbf8                     | dc.w         $fbf8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b4c | f4fd                     | dc.w         $f4fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b4e | f7fd                     | dc.w         $f7fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b50 | fcfd                     | dc.w         $fcfd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b52 | fcfc                     | dc.w         $fcfc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b54 | dcfd                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004b56 | fafd                     | dc.w         $fafd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b58 | fcfd                     | dc.w         $fcfd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b5a | fcfd                     | dc.w         $fcfd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b5c | fbfd                     | dc.w         $fbfd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b5e | f3fc                     | dc.w         $f3fc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b60 | fefd                     | dc.w         $fefd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b62 | fbe8                     | dc.w         $fbe8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b64 | fdfb                     | dc.w         $fdfb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b66 | faf8                     | dc.w         $faf8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b68 | f5fd                     | dc.w         $f5fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b6a | f6fd                     | dc.w         $f6fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b6c | fcfd                     | dc.w         $fcfd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b6e | fbfc                     | dc.w         $fbfc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b70 | f7fb                     | dc.w         $f7fb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b72 | f8f5                     | dc.w         $f8f5                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b74 | fdf7                     | dc.w         $fdf7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b76 | fdfc                     | dc.w         $fdfc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b78 | fdfb                     | dc.w         $fdfb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b7a | fcd8                     | dc.w         $fcd8                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b7c | fdf6                     | dc.w         $fdf6                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b7e | f1fd                     | dc.w         $f1fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b80 | fbfc                     | dc.w         $fbfc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b82 | fafd                     | dc.w         $fafd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b84 | f2fc                     | dc.w         $f2fc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b86 | fefd                     | dc.w         $fefd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b88 | fb40                     | dc.w         $fb40                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b8a | 65eb                     | bcs.b        $4b77                               ; branch according to condition flags (bra unconditional, bsr call)
00004b8c | f541                     | dc.w         $f541                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b8e | f696                     | dc.w         $f696                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b90 | f9f9                     | dc.w         $f9f9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b92 | fd86                     | dc.w         $fd86                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b94 | 938f                     | subx.l       -(a7), -(a1)                        ; arithmetic operation; flags depend on variant
00004b96 | f9fd                     | dc.w         $f9fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004b98 | 868c                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004b9a | 8ff9fd864096             | divs.w       $fd864096.l, d7                     ; arithmetic operation; flags depend on variant
00004ba0 | 7fb5                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004ba2 | cbfa407a                 | muls.w       $8c1e(pc), d5                       ; arithmetic operation; flags depend on variant
00004ba6 | efef                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004ba8 | effa                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004baa | e3fa                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004bac | fafa                     | dc.w         $fafa                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004bae | fa9f                     | dc.w         $fa9f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004bb0 | 4055                     | negx.w       (a5)                                ; machine operation; verify instruction and data boundaries
00004bb2 | efef                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004bb4 | ef41                     | asl.w        #$7, d1                             ; bit/integer operation; flags depend on variant
00004bb6 | 5af1f2fd                 | spl.b        -$3(a1, a7.w)                       ; machine operation; verify instruction and data boundaries
00004bba | 7fa3                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004bbc | f9f3                     | dc.w         $f9f3                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004bbe | f9f6                     | dc.w         $f9f6                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004bc0 | e9c4                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004bc2 | f3ef                     | dc.w         $f3ef                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004bc4 | 8940                     | dc.w         $8940                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004bc6 | 5940                     | subq.w       #$4, d0                             ; arithmetic operation; flags depend on variant
00004bc8 | e0f7f5f285b7f5b2faed     | asr.w        ([$85b7f5b2], $faed)                ; bit/integer operation; flags depend on variant
00004bd2 | 8540                     | dc.w         $8540                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004bd4 | 41faf5f2                 | lea.l        $41c8(pc), a0                       ; machine operation; verify instruction and data boundaries
00004bd8 | 85abb340                 | or.l         d2, -$4cc0(a3)                      ; bit/integer operation; flags depend on variant
00004bdc | 52d2                     | shi.b        (a2)                                ; machine operation; verify instruction and data boundaries
00004bde | 8540                     | dc.w         $8540                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004be0 | 67fc                     | beq.b        $4bde                               ; branch according to condition flags (bra unconditional, bsr call)
00004be2 | ecfc                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004be4 | fded                     | dc.w         $fded                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004be6 | 404f                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004be8 | 407e                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004bea | 9b8a                     | subx.l       -(a2), -(a5)                        ; arithmetic operation; flags depend on variant
00004bec | 40e3                     | move.w       sr, -(a3)                           ; copy source to destination (Motorola operand order); flags depend on variant
00004bee | 7fba                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004bf0 | f740                     | dc.w         $f740                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004bf2 | 5af1f4f7                 | spl.b        -$9(a1, a7.w)                       ; machine operation; verify instruction and data boundaries
00004bf6 | ec40                     | asr.w        #$6, d0                             ; bit/integer operation; flags depend on variant
00004bf8 | 9a8c                     | sub.l        a4, d5                              ; arithmetic operation; flags depend on variant
00004bfa | b240                     | cmp.w        d0, d1                              ; compare operands; set condition flags
00004bfc | 579a                     | subq.l       #$3, (a2)+                          ; arithmetic operation; flags depend on variant
00004bfe | 4052                     | negx.w       (a2)                                ; machine operation; verify instruction and data boundaries
00004c00 | f9e4                     | dc.w         $f9e4                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c02 | f140                     | dc.w         $f140                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c04 | 6483                     | bcc.b        $4b89                               ; branch according to condition flags (bra unconditional, bsr call)
00004c06 | 8383                     | dc.w         $8383                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c08 | 8484                     | or.l         d4, d2                              ; bit/integer operation; flags depend on variant
00004c0a | 8440                     | or.w         d0, d2                              ; bit/integer operation; flags depend on variant
00004c0c | 46fcfcca                 | move.w       #$fcca, sr                          ; copy source to destination (Motorola operand order); flags depend on variant
00004c10 | 4054                     | negx.w       (a4)                                ; machine operation; verify instruction and data boundaries
00004c12 | 4042                     | negx.w       d2                                  ; machine operation; verify instruction and data boundaries
00004c14 | 9191                     | sub.l        d0, (a1)                            ; arithmetic operation; flags depend on variant
00004c16 | 404d                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c18 | ea40                     | asr.w        #$5, d0                             ; bit/integer operation; flags depend on variant
00004c1a | 4240                     | clr.w        d0                                  ; bit/integer operation; flags depend on variant
00004c1c | 8fedf5fa                 | divs.w       -$a06(a5), d7                       ; arithmetic operation; flags depend on variant
00004c20 | e9b6                     | roxl.l       d4, d6                              ; bit/integer operation; flags depend on variant
00004c22 | f7a7                     | dc.w         $f7a7                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c24 | 9afc8894                 | suba.w       #$8894, a5                          ; arithmetic operation; flags depend on variant
00004c28 | f940                     | dc.w         $f940                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c2a | 5c41                     | addq.w       #$6, d1                             ; arithmetic operation; flags depend on variant
00004c2c | 5dfb                     | dc.w         $5dfb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c2e | fbf9                     | dc.w         $fbf9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c30 | faf9                     | dc.w         $faf9                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c32 | dcfbefe2f6f5e27f         | adda.w       ([$14329], $e27f), a6               ; arithmetic operation; flags depend on variant
00004c3a | 76ec                     | moveq        #$ec, d3                            ; copy source to destination (Motorola operand order); flags depend on variant
00004c3c | f8fd                     | dc.w         $f8fd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c3e | 4144                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c40 | dbd2                     | adda.l       (a2), a5                            ; arithmetic operation; flags depend on variant
00004c42 | dcfd                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c44 | c2fcddeb                 | mulu.w       #$ddeb, d1                          ; arithmetic operation; flags depend on variant
00004c48 | fdfb                     | dc.w         $fdfb                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c4a | fcfd                     | dc.w         $fcfd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c4c | fbfc                     | dc.w         $fbfc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c4e | f3fc                     | dc.w         $f3fc                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c50 | fc40                     | dc.w         $fc40                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c52 | dc40                     | add.w        d0, d6                              ; arithmetic operation; flags depend on variant
00004c54 | 6afc                     | bpl.b        $4c52                               ; branch according to condition flags (bra unconditional, bsr call)
00004c56 | 8cfc8cfc                 | divu.w       #$8cfc, d6                          ; arithmetic operation; flags depend on variant
00004c5a | b7ab9b93                 | eor.l        d3, -$646d(a3)                      ; bit/integer operation; flags depend on variant
00004c5e | 93a5                     | sub.l        d1, -(a5)                           ; arithmetic operation; flags depend on variant
00004c60 | fc89                     | dc.w         $fc89                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c62 | b8bf                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c64 | b340                     | eor.w        d1, d0                              ; bit/integer operation; flags depend on variant
00004c66 | 74fc                     | moveq        #$fc, d2                            ; copy source to destination (Motorola operand order); flags depend on variant
00004c68 | 88b940404138             | or.l         $40404138.l, d4                     ; bit/integer operation; flags depend on variant
00004c6e | e47f                     | ror.w        d2, d7                              ; bit/integer operation; flags depend on variant
00004c70 | bd7f                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c72 | 4f40                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c74 | 47cb                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c76 | 9ab541160000             | sub.l        ([a5], d4.w), d5                    ; arithmetic operation; flags depend on variant
00004c7c | 0013b5bf                 | ori.b        #$bf, (a3)                          ; bit/integer operation; flags depend on variant
00004c80 | b588                     | cmpm.l       (a0)+, (a2)+                        ; compare operands; set condition flags
00004c82 | 429c                     | clr.l        (a4)+                               ; bit/integer operation; flags depend on variant
00004c84 | 4060                     | negx.w       -(a0)                               ; machine operation; verify instruction and data boundaries
00004c86 | f841                     | dc.w         $f841                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c88 | 388b                     | move.w       a3, (a4)                            ; copy source to destination (Motorola operand order); flags depend on variant
00004c8a | 4141                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c8c | cc40                     | and.w        d0, d6                              ; bit/integer operation; flags depend on variant
00004c8e | 8a43                     | or.w         d3, d5                              ; bit/integer operation; flags depend on variant
00004c90 | fc87                     | dc.w         $fc87                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c92 | 4558                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c94 | 412a                     | dc.w         $412a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c96 | 4169                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c98 | 7f2c                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004c9a | 4334                     | dc.w         $4334                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004c9c | 000000a0                 | ori.b        #$a0, d0                            ; bit/integer operation; flags depend on variant
00004ca0 | ae99                     | dc.w         $ae99                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ca2 | a3ec                     | dc.w         $a3ec                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004ca4 | 4072f9f993b8978d         | negx.w       ([$93b8978d])                       ; machine operation; verify instruction and data boundaries
00004cac | 404b                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004cae | e2de                     | lsr.w        (a6)+                               ; bit/integer operation; flags depend on variant
00004cb0 | 8d8c                     | dc.w         $8d8c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004cb2 | 40699dbd                 | negx.w       -$6243(a1)                          ; machine operation; verify instruction and data boundaries
00004cb6 | 9140                     | subx.w       d0, d0                              ; arithmetic operation; flags depend on variant
00004cb8 | 43e9a8a8                 | lea.l        -$5758(a1), a1                      ; machine operation; verify instruction and data boundaries
00004cbc | a59e                     | dc.w         $a59e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004cbe | b2f2ee40                 | cmpa.w       $40(a2, a6.l), a1                   ; compare operands; set condition flags
00004cc2 | e57f                     | rol.w        d2, d7                              ; bit/integer operation; flags depend on variant
00004cc4 | a040                     | dc.w         $a040                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004cc6 | 6b7f                     | bmi.b        $4d47                               ; branch according to condition flags (bra unconditional, bsr call)
00004cc8 | a041                     | dc.w         $a041                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004cca | 6f40                     | ble.b        $4d0c                               ; branch according to condition flags (bra unconditional, bsr call)
00004ccc | 8240                     | or.w         d0, d1                              ; bit/integer operation; flags depend on variant
00004cce | d17f                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004cd0 | 8840                     | or.w         d0, d4                              ; bit/integer operation; flags depend on variant
00004cd2 | 8d8b                     | dc.w         $8d8b                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004cd4 | 41e4                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004cd6 | 7e8d                     | moveq        #$8d, d7                            ; copy source to destination (Motorola operand order); flags depend on variant
00004cd8 | 411c                     | dc.w         $411c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004cda | 7f6f                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004cdc | 7fbe                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004cde | 40a1                     | negx.l       -(a1)                               ; machine operation; verify instruction and data boundaries
00004ce0 | 406b4068                 | negx.w       $4068(a3)                           ; machine operation; verify instruction and data boundaries
00004ce4 | 91b8e3aa                 | sub.l        d0, $e3aa.w                         ; arithmetic operation; flags depend on variant
00004ce8 | 41e5                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004cea | 90a1                     | sub.l        -(a1), d0                           ; arithmetic operation; flags depend on variant
00004cec | 428d                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004cee | 8885                     | or.l         d5, d4                              ; bit/integer operation; flags depend on variant
00004cf0 | ad40                     | dc.w         $ad40                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004cf2 | 588f                     | addq.l       #$4, a7                             ; arithmetic operation; flags depend on variant
00004cf4 | 4083                     | negx.l       d3                                  ; machine operation; verify instruction and data boundaries
00004cf6 | 9a89                     | sub.l        a1, d5                              ; arithmetic operation; flags depend on variant
00004cf8 | b198                     | eor.l        d0, (a0)+                           ; bit/integer operation; flags depend on variant
00004cfa | 928b                     | sub.l        a3, d1                              ; arithmetic operation; flags depend on variant
00004cfc | a686                     | dc.w         $a686                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004cfe | bc86                     | cmp.l        d6, d6                              ; compare operands; set condition flags
00004d00 | 408d                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d02 | e8eb                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d04 | b487                     | cmp.l        d7, d2                              ; compare operands; set condition flags
00004d06 | 878a                     | dc.w         $878a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004d08 | 40a0                     | negx.l       -(a0)                               ; machine operation; verify instruction and data boundaries
00004d0a | 8441                     | or.w         d1, d2                              ; bit/integer operation; flags depend on variant
00004d0c | 117f                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d0e | b040                     | cmp.w        d0, d0                              ; compare operands; set condition flags
00004d10 | 4540                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d12 | 8a7f                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d14 | 9b88                     | subx.l       -(a0), -(a5)                        ; arithmetic operation; flags depend on variant
00004d16 | 96f48740                 | suba.w       (a4, invalid.w), a3                 ; arithmetic operation; flags depend on variant
00004d1a | 6fec                     | ble.b        $4d08                               ; branch according to condition flags (bra unconditional, bsr call)
00004d1c | b493                     | cmp.l        (a3), d2                            ; compare operands; set condition flags
00004d1e | 8a8d                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d20 | 4043                     | negx.w       d3                                  ; machine operation; verify instruction and data boundaries
00004d22 | 8f40                     | dc.w         $8f40                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004d24 | 4e9e                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d26 | 8340                     | dc.w         $8340                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004d28 | 488c                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d2a | 8e88                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d2c | 4207                     | clr.b        d7                                  ; bit/integer operation; flags depend on variant
00004d2e | 7e1e                     | moveq        #$1e, d7                            ; copy source to destination (Motorola operand order); flags depend on variant
00004d30 | 4080                     | negx.l       d0                                  ; machine operation; verify instruction and data boundaries
00004d32 | 7fb7                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d34 | 41a1                     | chk.w        -(a1), d0                           ; machine operation; verify instruction and data boundaries
00004d36 | f97f                     | dc.w         $f97f                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00004d38 | 527f                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d3a | 5542                     | subq.w       #$2, d2                             ; arithmetic operation; flags depend on variant
00004d3c | 6641                     | bne.b        $4d7f                               ; branch according to condition flags (bra unconditional, bsr call)
00004d3e | 699f                     | bvs.b        $4cdf                               ; branch according to condition flags (bra unconditional, bsr call)
00004d40 | 9789                     | subx.l       -(a1), -(a3)                        ; arithmetic operation; flags depend on variant
00004d42 | 9a90                     | sub.l        (a0), d5                            ; arithmetic operation; flags depend on variant
00004d44 | 8691                     | or.l         (a1), d3                            ; bit/integer operation; flags depend on variant
00004d46 | 909d                     | sub.l        (a5)+, d0                           ; arithmetic operation; flags depend on variant
00004d48 | 9193                     | sub.l        d0, (a3)                            ; arithmetic operation; flags depend on variant
00004d4a | 959d                     | sub.l        d2, (a5)+                           ; arithmetic operation; flags depend on variant
00004d4c | 8484                     | or.l         d4, d2                              ; bit/integer operation; flags depend on variant
00004d4e | 9f84                     | subx.l       d4, d7                              ; arithmetic operation; flags depend on variant
00004d50 | 8484                     | or.l         d4, d2                              ; bit/integer operation; flags depend on variant
00004d52 | 8440                     | or.w         d0, d2                              ; bit/integer operation; flags depend on variant
00004d54 | 4d40                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d56 | b987                     | eor.l        d4, d7                              ; bit/integer operation; flags depend on variant
00004d58 | 4058                     | negx.w       (a0)+                               ; machine operation; verify instruction and data boundaries
00004d5a | bc40                     | cmp.w        d0, d6                              ; compare operands; set condition flags
00004d5c | 4b41                     | .word ; undecoded bytes / possible Macintosh A-line trap
00004d5e | 1b84417fb583b983         | move.b       d4, ([$b583b983, a5])               ; copy source to destination (Motorola operand order); flags depend on variant
00004d66 | 4058                     | negx.w       (a0)+                               ; machine operation; verify instruction and data boundaries
00004d68 | 918f                     | subx.l       -(a7), -(a0)                        ; arithmetic operation; flags depend on variant
00004d6a | b341                     | eor.w        d1, d1                              ; bit/integer operation; flags depend on variant
00004d6c | b841                     | cmp.w        d1, d4                              ; compare operands; set condition flags
00004d6e | 69bc                     | bvs.b        $4d2c                               ; branch according to condition flags (bra unconditional, bsr call)
00004d70 | 4047                     | negx.w       d7                                  ; machine operation; verify instruction and data boundaries
00004d72 | 40a1                     | negx.l       -(a1)                               ; machine operation; verify instruction and data boundaries
00004d74 | 4092                     | negx.l       (a2)                                ; machine operation; verify instruction and data boundaries
00004d76 | 4095                     | negx.l       (a5)                                ; machine operation; verify instruction and data boundaries
00004d78 | eae6                     | .word ; undecoded bytes / possible Macintosh A-line trap
