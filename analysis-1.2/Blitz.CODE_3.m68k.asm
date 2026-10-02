; Linear Motorola 68000 decode. Offsets include the 4-byte segment header.
; Embedded data/strings may decode as instructions; control flow is not yet fully verified.
; CODE 0 is a jump table and is preserved as raw data, not disassembled.
; Segment header: 00280007

00000004 | 00000028                 | ori.b        #$28, d0                            ; bit/integer operation; flags depend on variant
00000008 | 0000108e                 | ori.b        #$8e, d0                            ; bit/integer operation; flags depend on variant
0000000c | 4aadfe08                 | tst.l        -$1f8(a5)                           ; machine operation; verify instruction and data boundaries
00000010 | 6604                     | bne.b        $16                                 ; branch according to condition flags (bra unconditional, bsr call)
00000012 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000014 | 4e75                     | rts                                              ; return: pop return address from stack
00000016 | 53adfe08                 | subq.l       #$1, -$1f8(a5)                      ; arithmetic operation; flags depend on variant
0000001a | 202dfe08                 | move.l       -$1f8(a5), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
0000001e | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
00000020 | 41edfc74                 | lea.l        -$38c(a5), a0                       ; machine operation; verify instruction and data boundaries
00000024 | 21af00040800             | move.l       $4(a7), (a0, d0.l)                  ; copy source to destination (Motorola operand order); flags depend on variant
0000002a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000002c | 4e75                     | rts                                              ; return: pop return address from stack
0000002e | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000032 | 4aadfcfc                 | tst.l        -$304(a5)                           ; machine operation; verify instruction and data boundaries
00000036 | 661e                     | bne.b        $56                                 ; branch according to condition flags (bra unconditional, bsr call)
00000038 | 6014                     | bra.b        $4e                                 ; branch according to condition flags (bra unconditional, bsr call)
0000003a | 202dfe04                 | move.l       -$1fc(a5), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
0000003e | 52adfe04                 | addq.l       #$1, -$1fc(a5)                      ; arithmetic operation; flags depend on variant
00000042 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
00000044 | 41edfd00                 | lea.l        -$300(a5), a0                       ; machine operation; verify instruction and data boundaries
00000048 | 20700800                 | movea.l      (a0, d0.l), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
0000004c | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
0000004e | 7022                     | moveq        #$22, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000050 | b0adfe04                 | cmp.l        -$1fc(a5), d0                       ; compare operands; set condition flags
00000054 | 62e4                     | bhi.b        $3a                                 ; branch according to condition flags (bra unconditional, bsr call)
00000056 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000005a | 4eb900000064             | jsr          $64.l                               ; call subroutine; push return address
00000060 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000062 | 4e75                     | rts                                              ; return: pop return address from stack
00000064 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000068 | 4eb9000004ae             | jsr          $4ae.l                              ; call subroutine; push return address
0000006e | 6014                     | bra.b        $84                                 ; branch according to condition flags (bra unconditional, bsr call)
00000070 | 202dfe08                 | move.l       -$1f8(a5), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000074 | 52adfe08                 | addq.l       #$1, -$1f8(a5)                      ; arithmetic operation; flags depend on variant
00000078 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
0000007a | 41edfc74                 | lea.l        -$38c(a5), a0                       ; machine operation; verify instruction and data boundaries
0000007e | 20700800                 | movea.l      (a0, d0.l), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000082 | 4e90                     | jsr          (a0)                                ; call subroutine; push return address
00000084 | 7022                     | moveq        #$22, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000086 | b0adfe08                 | cmp.l        -$1f8(a5), d0                       ; compare operands; set condition flags
0000008a | 62e4                     | bhi.b        $70                                 ; branch according to condition flags (bra unconditional, bsr call)
0000008c | 4eb900001072             | jsr          $1072.l                             ; call subroutine; push return address
00000092 | a9f4                     | dc.w         $a9f4                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000094 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000096 | 4e75                     | rts                                              ; return: pop return address from stack
00000098 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000009c | 48e71020                 | movem.l      d3/a2, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000000a0 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000000a2 | 601c                     | bra.b        $c0                                 ; branch according to condition flags (bra unconditional, bsr call)
000000a4 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000000a6 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000000a8 | 41edfeb4                 | lea.l        -$14c(a5), a0                       ; machine operation; verify instruction and data boundaries
000000ac | 24700800                 | movea.l      (a0, d0.l), a2                      ; copy source to destination (Motorola operand order); flags depend on variant
000000b0 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000000b2 | 670a                     | beq.b        $be                                 ; branch according to condition flags (bra unconditional, bsr call)
000000b4 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000000b6 | 4eb9000000f0             | jsr          $f0.l                               ; call subroutine; push return address
000000bc | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000000be | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
000000c0 | 7040                     | moveq        #$40, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000000c2 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
000000c4 | 65de                     | bcs.b        $a4                                 ; branch according to condition flags (bra unconditional, bsr call)
000000c6 | 4cdf0408                 | movem.l      (a7)+, d3/a2                        ; copy source to destination (Motorola operand order); flags depend on variant
000000ca | 4e5e                     | unlk         a6                                  ; restore stack frame
000000cc | 4e75                     | rts                                              ; return: pop return address from stack
000000ce | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000000d2 | 4aadfd8c                 | tst.l        -$274(a5)                           ; machine operation; verify instruction and data boundaries
000000d6 | 6614                     | bne.b        $ec                                 ; branch according to condition flags (bra unconditional, bsr call)
000000d8 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000000da | 2b40fd8c                 | move.l       d0, -$274(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
000000de | 487900000030             | pea.l        $30.l                               ; machine operation; verify instruction and data boundaries
000000e4 | 4eb90000000c             | jsr          $c.l                                ; call subroutine; push return address
000000ea | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000000ec | 4e5e                     | unlk         a6                                  ; restore stack frame
000000ee | 4e75                     | rts                                              ; return: pop return address from stack
000000f0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000000f4 | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
000000f8 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
000000fc | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000000fe | 4eb9000001f0             | jsr          $1f0.l                              ; call subroutine; push return address
00000104 | 2800                     | move.l       d0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000106 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000108 | 7240                     | moveq        #$40, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
0000010a | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
0000010c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000010e | 670c                     | beq.b        $11c                                ; branch according to condition flags (bra unconditional, bsr call)
00000110 | 2f2a0004                 | move.l       $4(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000114 | 4eb90000069c             | jsr          $69c.l                              ; call subroutine; push return address
0000011a | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000011c | 42aa0004                 | clr.l        $4(a2)                              ; bit/integer operation; flags depend on variant
00000120 | 4a6a0002                 | tst.w        $2(a2)                              ; machine operation; verify instruction and data boundaries
00000124 | 6d16                     | blt.b        $13c                                ; branch according to condition flags (bra unconditional, bsr call)
00000126 | 302a0002                 | move.w       $2(a2), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000012a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
0000012c | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000012e | 4eb900000b26             | jsr          $b26.l                              ; call subroutine; push return address
00000134 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000136 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000138 | 6702                     | beq.b        $13c                                ; branch according to condition flags (bra unconditional, bsr call)
0000013a | 78ff                     | moveq        #$ff, d4                            ; copy source to destination (Motorola operand order); flags depend on variant
0000013c | 4aaa0030                 | tst.l        $30(a2)                             ; machine operation; verify instruction and data boundaries
00000140 | 6722                     | beq.b        $164                                ; branch according to condition flags (bra unconditional, bsr call)
00000142 | 2f2a0030                 | move.l       $30(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000146 | 4eb9000003f8             | jsr          $3f8.l                              ; call subroutine; push return address
0000014c | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
0000014e | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000150 | 6702                     | beq.b        $154                                ; branch according to condition flags (bra unconditional, bsr call)
00000152 | 78ff                     | moveq        #$ff, d4                            ; copy source to destination (Motorola operand order); flags depend on variant
00000154 | 2f2a0030                 | move.l       $30(a2), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000158 | 4eb90000069c             | jsr          $69c.l                              ; call subroutine; push return address
0000015e | 42aa0030                 | clr.l        $30(a2)                             ; bit/integer operation; flags depend on variant
00000162 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000164 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000166 | 028000000080             | andi.l       #$80, d0                            ; bit/integer operation; flags depend on variant
0000016c | 6730                     | beq.b        $19e                                ; branch according to condition flags (bra unconditional, bsr call)
0000016e | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000170 | 601a                     | bra.b        $18c                                ; branch according to condition flags (bra unconditional, bsr call)
00000172 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000174 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
00000176 | 41edfeb4                 | lea.l        -$14c(a5), a0                       ; machine operation; verify instruction and data boundaries
0000017a | b5f00800                 | cmpa.l       (a0, d0.l), a2                      ; compare operands; set condition flags
0000017e | 660a                     | bne.b        $18a                                ; branch according to condition flags (bra unconditional, bsr call)
00000180 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000182 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
00000184 | 42b00800                 | clr.l        (a0, d0.l)                          ; bit/integer operation; flags depend on variant
00000188 | 6008                     | bra.b        $192                                ; branch according to condition flags (bra unconditional, bsr call)
0000018a | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
0000018c | 7040                     | moveq        #$40, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000018e | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00000190 | 65e0                     | bcs.b        $172                                ; branch according to condition flags (bra unconditional, bsr call)
00000192 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000194 | 4eb90000069c             | jsr          $69c.l                              ; call subroutine; push return address
0000019a | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000019c | 6048                     | bra.b        $1e6                                ; branch according to condition flags (bra unconditional, bsr call)
0000019e | 4252                     | clr.w        (a2)                                ; bit/integer operation; flags depend on variant
000001a0 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001a2 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000001a6 | 2548000c                 | move.l       a0, $c(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000001aa | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001ac | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000001b0 | 25480010                 | move.l       a0, $10(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000001b4 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001b6 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000001ba | 25480026                 | move.l       a0, $26(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000001be | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001c0 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000001c4 | 25480014                 | move.l       a0, $14(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000001c8 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001ca | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000001ce | 2548002a                 | move.l       a0, $2a(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000001d2 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001d4 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000001d8 | 25480018                 | move.l       a0, $18(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000001dc | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001de | 41e80022                 | lea.l        $22(a0), a0                         ; machine operation; verify instruction and data boundaries
000001e2 | 2548001c                 | move.l       a0, $1c(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000001e6 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001e8 | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
000001ec | 4e5e                     | unlk         a6                                  ; restore stack frame
000001ee | 4e75                     | rts                                              ; return: pop return address from stack
000001f0 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000001f4 | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
000001f8 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
000001fc | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000001fe | 6632                     | bne.b        $232                                ; branch according to condition flags (bra unconditional, bsr call)
00000200 | 7800                     | moveq        #$0, d4                             ; copy source to destination (Motorola operand order); flags depend on variant
00000202 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000204 | 6022                     | bra.b        $228                                ; branch according to condition flags (bra unconditional, bsr call)
00000206 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000208 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
0000020a | 41edfeb4                 | lea.l        -$14c(a5), a0                       ; machine operation; verify instruction and data boundaries
0000020e | 26700800                 | movea.l      (a0, d0.l), a3                      ; copy source to destination (Motorola operand order); flags depend on variant
00000212 | 200b                     | move.l       a3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000214 | 6710                     | beq.b        $226                                ; branch according to condition flags (bra unconditional, bsr call)
00000216 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000218 | 4eb9000001f0             | jsr          $1f0.l                              ; call subroutine; push return address
0000021e | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000220 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000222 | 6c02                     | bge.b        $226                                ; branch according to condition flags (bra unconditional, bsr call)
00000224 | 78ff                     | moveq        #$ff, d4                            ; copy source to destination (Motorola operand order); flags depend on variant
00000226 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000228 | 7040                     | moveq        #$40, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000022a | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
0000022c | 6dd8                     | blt.b        $206                                ; branch according to condition flags (bra unconditional, bsr call)
0000022e | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000230 | 6072                     | bra.b        $2a4                                ; branch according to condition flags (bra unconditional, bsr call)
00000232 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000234 | 028000002000             | andi.l       #$2000, d0                          ; bit/integer operation; flags depend on variant
0000023a | 6604                     | bne.b        $240                                ; branch according to condition flags (bra unconditional, bsr call)
0000023c | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000023e | 6064                     | bra.b        $2a4                                ; branch according to condition flags (bra unconditional, bsr call)
00000240 | 266a0004                 | movea.l      $4(a2), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000244 | 6038                     | bra.b        $27e                                ; branch according to condition flags (bra unconditional, bsr call)
00000246 | 206a000c                 | movea.l      $c(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000024a | 91cb                     | suba.l       a3, a0                              ; arithmetic operation; flags depend on variant
0000024c | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000024e | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000250 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000252 | 4eb900000f70             | jsr          $f70.l                              ; call subroutine; push return address
00000258 | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000025a | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
0000025c | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000260 | 6e1a                     | bgt.b        $27c                                ; branch according to condition flags (bra unconditional, bsr call)
00000262 | 256a0004000c             | move.l       $4(a2), $c(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000268 | 256a00040014             | move.l       $4(a2), $14(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000026e | 256a0004002a             | move.l       $4(a2), $2a(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000274 | 00520200                 | ori.w        #$200, (a2)                         ; bit/integer operation; flags depend on variant
00000278 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000027a | 6028                     | bra.b        $2a4                                ; branch according to condition flags (bra unconditional, bsr call)
0000027c | d7c3                     | adda.l       d3, a3                              ; arithmetic operation; flags depend on variant
0000027e | b7ea000c                 | cmpa.l       $c(a2), a3                          ; compare operands; set condition flags
00000282 | 65c2                     | bcs.b        $246                                ; branch according to condition flags (bra unconditional, bsr call)
00000284 | 256a0004000c             | move.l       $4(a2), $c(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000028a | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000028c | 028000004000             | andi.l       #$4000, d0                          ; bit/integer operation; flags depend on variant
00000292 | 6708                     | beq.b        $29c                                ; branch according to condition flags (bra unconditional, bsr call)
00000294 | 256a00080014             | move.l       $8(a2), $14(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000029a | 6006                     | bra.b        $2a2                                ; branch according to condition flags (bra unconditional, bsr call)
0000029c | 256a0008002a             | move.l       $8(a2), $2a(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
000002a2 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000002a4 | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
000002a8 | 4e5e                     | unlk         a6                                  ; restore stack frame
000002aa | 4e75                     | rts                                              ; return: pop return address from stack
000002ac | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000002b0 | 48e71020                 | movem.l      d3/a2, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000002b4 | 7600                     | moveq        #$0, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000002b6 | 6052                     | bra.b        $30a                                ; branch according to condition flags (bra unconditional, bsr call)
000002b8 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000002ba | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000002bc | 41edfeb4                 | lea.l        -$14c(a5), a0                       ; machine operation; verify instruction and data boundaries
000002c0 | 4ab00800                 | tst.l        (a0, d0.l)                          ; machine operation; verify instruction and data boundaries
000002c4 | 6628                     | bne.b        $2ee                                ; branch according to condition flags (bra unconditional, bsr call)
000002c6 | 48780038                 | pea.l        $38.w                               ; machine operation; verify instruction and data boundaries
000002ca | 4eb9000007f6             | jsr          $7f6.l                              ; call subroutine; push return address
000002d0 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000002d2 | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000002d4 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000002d6 | 6604                     | bne.b        $2dc                                ; branch according to condition flags (bra unconditional, bsr call)
000002d8 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
000002da | 6054                     | bra.b        $330                                ; branch according to condition flags (bra unconditional, bsr call)
000002dc | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000002de | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000002e0 | 41edfeb4                 | lea.l        -$14c(a5), a0                       ; machine operation; verify instruction and data boundaries
000002e4 | 218a0800                 | move.l       a2, (a0, d0.l)                      ; copy source to destination (Motorola operand order); flags depend on variant
000002e8 | 34bc0080                 | move.w       #$80, (a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000002ec | 6022                     | bra.b        $310                                ; branch according to condition flags (bra unconditional, bsr call)
000002ee | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000002f0 | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000002f2 | 20700800                 | movea.l      (a0, d0.l), a0                      ; copy source to destination (Motorola operand order); flags depend on variant
000002f6 | 4a50                     | tst.w        (a0)                                ; machine operation; verify instruction and data boundaries
000002f8 | 660e                     | bne.b        $308                                ; branch according to condition flags (bra unconditional, bsr call)
000002fa | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000002fc | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
000002fe | 41edfeb4                 | lea.l        -$14c(a5), a0                       ; machine operation; verify instruction and data boundaries
00000302 | 24700800                 | movea.l      (a0, d0.l), a2                      ; copy source to destination (Motorola operand order); flags depend on variant
00000306 | 6008                     | bra.b        $310                                ; branch according to condition flags (bra unconditional, bsr call)
00000308 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
0000030a | 7040                     | moveq        #$40, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000030c | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
0000030e | 65a8                     | bcs.b        $2b8                                ; branch according to condition flags (bra unconditional, bsr call)
00000310 | 7040                     | moveq        #$40, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000312 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00000314 | 6504                     | bcs.b        $31a                                ; branch according to condition flags (bra unconditional, bsr call)
00000316 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
00000318 | 6016                     | bra.b        $330                                ; branch according to condition flags (bra unconditional, bsr call)
0000031a | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
0000031c | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000031e | 2f2e000c                 | move.l       $c(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000322 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000326 | 4eb90000046a             | jsr          $46a.l                              ; call subroutine; push return address
0000032c | 4fef000e                 | lea.l        $e(a7), a7                          ; machine operation; verify instruction and data boundaries
00000330 | 4cdf0408                 | movem.l      (a7)+, d3/a2                        ; copy source to destination (Motorola operand order); flags depend on variant
00000334 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000336 | 4e75                     | rts                                              ; return: pop return address from stack
00000338 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000033c | 48e71e30                 | movem.l      d3-d6/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000340 | 2a2e000c                 | move.l       $c(a6), d5                          ; copy source to destination (Motorola operand order); flags depend on variant
00000344 | 2c2e0010                 | move.l       $10(a6), d6                         ; copy source to destination (Motorola operand order); flags depend on variant
00000348 | 246e0014                 | movea.l      $14(a6), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
0000034c | 2005                     | move.l       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000034e | 2206                     | move.l       d6, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000350 | 4eb9000004d2             | jsr          $4d2.l                              ; call subroutine; push return address
00000356 | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000358 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
0000035c | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
0000035e | 6612                     | bne.b        $372                                ; branch according to condition flags (bra unconditional, bsr call)
00000360 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000362 | 6000008c                 | bra.w        $3f0                                ; branch according to condition flags (bra unconditional, bsr call)
00000366 | 206a0018                 | movea.l      $18(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000036a | 52aa0018                 | addq.l       #$1, $18(a2)                        ; arithmetic operation; flags depend on variant
0000036e | 16d0                     | move.b       (a0), (a3)+                         ; copy source to destination (Motorola operand order); flags depend on variant
00000370 | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000372 | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00000374 | 6762                     | beq.b        $3d8                                ; branch according to condition flags (bra unconditional, bsr call)
00000376 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000378 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
0000037c | b1ea0018                 | cmpa.l       $18(a2), a0                         ; compare operands; set condition flags
00000380 | 62e4                     | bhi.b        $366                                ; branch according to condition flags (bra unconditional, bsr call)
00000382 | 6054                     | bra.b        $3d8                                ; branch according to condition flags (bra unconditional, bsr call)
00000384 | 4aaa0022                 | tst.l        $22(a2)                             ; machine operation; verify instruction and data boundaries
00000388 | 670a                     | beq.b        $394                                ; branch according to condition flags (bra unconditional, bsr call)
0000038a | 256a00220010             | move.l       $22(a2), $10(a2)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000390 | 42aa0022                 | clr.l        $22(a2)                             ; bit/integer operation; flags depend on variant
00000394 | 206a000c                 | movea.l      $c(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000398 | b1ea0010                 | cmpa.l       $10(a2), a0                         ; compare operands; set condition flags
0000039c | 650e                     | bcs.b        $3ac                                ; branch according to condition flags (bra unconditional, bsr call)
0000039e | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000003a0 | 4eb900000590             | jsr          $590.l                              ; call subroutine; push return address
000003a6 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
000003a8 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000003aa | 6f30                     | ble.b        $3dc                                ; branch according to condition flags (bra unconditional, bsr call)
000003ac | 206a0010                 | movea.l      $10(a2), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
000003b0 | 91ea000c                 | suba.l       $c(a2), a0                          ; arithmetic operation; flags depend on variant
000003b4 | 2808                     | move.l       a0, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000003b6 | b684                     | cmp.l        d4, d3                              ; compare operands; set condition flags
000003b8 | 6402                     | bcc.b        $3bc                                ; branch according to condition flags (bra unconditional, bsr call)
000003ba | 2803                     | move.l       d3, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
000003bc | 204b                     | movea.l      a3, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000003be | 226a000c                 | movea.l      $c(a2), a1                          ; copy source to destination (Motorola operand order); flags depend on variant
000003c2 | 2204                     | move.l       d4, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
000003c4 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000003c6 | 4a81                     | tst.l        d1                                  ; machine operation; verify instruction and data boundaries
000003c8 | 6706                     | beq.b        $3d0                                ; branch according to condition flags (bra unconditional, bsr call)
000003ca | 10d9                     | move.b       (a1)+, (a0)+                        ; copy source to destination (Motorola operand order); flags depend on variant
000003cc | 5381                     | subq.l       #$1, d1                             ; arithmetic operation; flags depend on variant
000003ce | 66fa                     | bne.b        $3ca                                ; branch according to condition flags (bra unconditional, bsr call)
000003d0 | d7c4                     | adda.l       d4, a3                              ; arithmetic operation; flags depend on variant
000003d2 | 9684                     | sub.l        d4, d3                              ; arithmetic operation; flags depend on variant
000003d4 | d9aa000c                 | add.l        d4, $c(a2)                          ; arithmetic operation; flags depend on variant
000003d8 | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
000003da | 66a8                     | bne.b        $384                                ; branch according to condition flags (bra unconditional, bsr call)
000003dc | 2005                     | move.l       d5, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000003de | 2206                     | move.l       d6, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
000003e0 | 4eb9000004d2             | jsr          $4d2.l                              ; call subroutine; push return address
000003e6 | 9083                     | sub.l        d3, d0                              ; arithmetic operation; flags depend on variant
000003e8 | 2205                     | move.l       d5, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
000003ea | 4eb900000504             | jsr          $504.l                              ; call subroutine; push return address
000003f0 | 4cdf0c78                 | movem.l      (a7)+, d3-d6/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
000003f4 | 4e5e                     | unlk         a6                                  ; restore stack frame
000003f6 | 4e75                     | rts                                              ; return: pop return address from stack
000003f8 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000003fc | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000400 | 4eb900000d48             | jsr          $d48.l                              ; call subroutine; push return address
00000406 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000408 | 4e75                     | rts                                              ; return: pop return address from stack
0000040a | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000040e | 48e71800                 | movem.l      d3-d4, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000412 | 282e000c                 | move.l       $c(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
00000416 | 7003                     | moveq        #$3, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000418 | c084                     | and.l        d4, d0                              ; bit/integer operation; flags depend on variant
0000041a | e588                     | lsl.l        #$2, d0                             ; bit/integer operation; flags depend on variant
0000041c | 41edffb4                 | lea.l        -$4c(a5), a0                        ; machine operation; verify instruction and data boundaries
00000420 | 26300800                 | move.l       (a0, d0.l), d3                      ; copy source to destination (Motorola operand order); flags depend on variant
00000424 | 7004                     | moveq        #$4, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000426 | c084                     | and.l        d4, d0                              ; bit/integer operation; flags depend on variant
00000428 | 6706                     | beq.b        $430                                ; branch according to condition flags (bra unconditional, bsr call)
0000042a | 008300000100             | ori.l        #$100, d3                           ; bit/integer operation; flags depend on variant
00000430 | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000432 | c084                     | and.l        d4, d0                              ; bit/integer operation; flags depend on variant
00000434 | 6706                     | beq.b        $43c                                ; branch according to condition flags (bra unconditional, bsr call)
00000436 | 008300000800             | ori.l        #$800, d3                           ; bit/integer operation; flags depend on variant
0000043c | 7010                     | moveq        #$10, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000043e | c084                     | and.l        d4, d0                              ; bit/integer operation; flags depend on variant
00000440 | 6706                     | beq.b        $448                                ; branch according to condition flags (bra unconditional, bsr call)
00000442 | 008300000200             | ori.l        #$200, d3                           ; bit/integer operation; flags depend on variant
00000448 | 7020                     | moveq        #$20, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000044a | c084                     | and.l        d4, d0                              ; bit/integer operation; flags depend on variant
0000044c | 6706                     | beq.b        $454                                ; branch according to condition flags (bra unconditional, bsr call)
0000044e | 008300008000             | ori.l        #$8000, d3                          ; bit/integer operation; flags depend on variant
00000454 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000456 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000045a | 4eb900000898             | jsr          $898.l                              ; call subroutine; push return address
00000460 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00000462 | 4cdf0018                 | movem.l      (a7)+, d3-d4                        ; copy source to destination (Motorola operand order); flags depend on variant
00000466 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000468 | 4e75                     | rts                                              ; return: pop return address from stack
0000046a | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000046e | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000472 | 266e000c                 | movea.l      $c(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000476 | 246e0010                 | movea.l      $10(a6), a2                         ; copy source to destination (Motorola operand order); flags depend on variant
0000047a | 382e0014                 | move.w       $14(a6), d4                         ; copy source to destination (Motorola operand order); flags depend on variant
0000047e | 3612                     | move.w       (a2), d3                            ; copy source to destination (Motorola operand order); flags depend on variant
00000480 | 028300000080             | andi.l       #$80, d3                            ; bit/integer operation; flags depend on variant
00000486 | 41edffc4                 | lea.l        -$3c(a5), a0                        ; machine operation; verify instruction and data boundaries
0000048a | 43d2                     | lea.l        (a2), a1                            ; machine operation; verify instruction and data boundaries
0000048c | 700d                     | moveq        #$d, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000048e | 22d8                     | move.l       (a0)+, (a1)+                        ; copy source to destination (Motorola operand order); flags depend on variant
00000490 | 51c8fffc                 | dbra         d0, $48e                            ; machine operation; verify instruction and data boundaries
00000494 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000496 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
0000049a | 2548000c                 | move.l       a0, $c(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000049e | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000004a0 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000004a4 | 25480010                 | move.l       a0, $10(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000004a8 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000004aa | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000004ae | 25480026                 | move.l       a0, $26(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000004b2 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000004b4 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000004b8 | 25480014                 | move.l       a0, $14(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000004bc | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000004be | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000004c2 | 2548002a                 | move.l       a0, $2a(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000004c6 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000004c8 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
000004cc | 25480018                 | move.l       a0, $18(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000004d0 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000004d2 | 41e80022                 | lea.l        $22(a0), a0                         ; machine operation; verify instruction and data boundaries
000004d6 | 2548001c                 | move.l       a0, $1c(a2)                         ; copy source to destination (Motorola operand order); flags depend on variant
000004da | 0c130072                 | cmpi.b       #$72, (a3)                          ; compare operands; set condition flags
000004de | 6718                     | beq.b        $4f8                                ; branch according to condition flags (bra unconditional, bsr call)
000004e0 | 0c130077                 | cmpi.b       #$77, (a3)                          ; compare operands; set condition flags
000004e4 | 670e                     | beq.b        $4f4                                ; branch according to condition flags (bra unconditional, bsr call)
000004e6 | 0c130061                 | cmpi.b       #$61, (a3)                          ; compare operands; set condition flags
000004ea | 6704                     | beq.b        $4f0                                ; branch according to condition flags (bra unconditional, bsr call)
000004ec | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000004ee | 6002                     | bra.b        $4f2                                ; branch according to condition flags (bra unconditional, bsr call)
000004f0 | 7016                     | moveq        #$16, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000004f2 | 6002                     | bra.b        $4f6                                ; branch according to condition flags (bra unconditional, bsr call)
000004f4 | 701a                     | moveq        #$1a, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000004f6 | 6002                     | bra.b        $4fa                                ; branch according to condition flags (bra unconditional, bsr call)
000004f8 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000004fa | 7200                     | moveq        #$0, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
000004fc | 3203                     | move.w       d3, d1                              ; copy source to destination (Motorola operand order); flags depend on variant
000004fe | 8280                     | or.l         d0, d1                              ; bit/integer operation; flags depend on variant
00000500 | 3481                     | move.w       d1, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000502 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000504 | 7203                     | moveq        #$3, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000506 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000508 | 6630                     | bne.b        $53a                                ; branch according to condition flags (bra unconditional, bsr call)
0000050a | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000050c | 4eb9000000f0             | jsr          $f0.l                               ; call subroutine; push return address
00000512 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
00000514 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000516 | 6070                     | bra.b        $588                                ; branch according to condition flags (bra unconditional, bsr call)
00000518 | 0c130062                 | cmpi.b       #$62, (a3)                          ; compare operands; set condition flags
0000051c | 660e                     | bne.b        $52c                                ; branch according to condition flags (bra unconditional, bsr call)
0000051e | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000520 | 7220                     | moveq        #$20, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000522 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000524 | 6622                     | bne.b        $548                                ; branch according to condition flags (bra unconditional, bsr call)
00000526 | 00520020                 | ori.w        #$20, (a2)                          ; bit/integer operation; flags depend on variant
0000052a | 600e                     | bra.b        $53a                                ; branch according to condition flags (bra unconditional, bsr call)
0000052c | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000052e | 7203                     | moveq        #$3, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000530 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000532 | 5780                     | subq.l       #$3, d0                             ; arithmetic operation; flags depend on variant
00000534 | 6712                     | beq.b        $548                                ; branch according to condition flags (bra unconditional, bsr call)
00000536 | 00520003                 | ori.w        #$3, (a2)                           ; bit/integer operation; flags depend on variant
0000053a | 528b                     | addq.l       #$1, a3                             ; arithmetic operation; flags depend on variant
0000053c | 0c130062                 | cmpi.b       #$62, (a3)                          ; compare operands; set condition flags
00000540 | 67d6                     | beq.b        $518                                ; branch according to condition flags (bra unconditional, bsr call)
00000542 | 0c13002b                 | cmpi.b       #$2b, (a3)                          ; compare operands; set condition flags
00000546 | 67d0                     | beq.b        $518                                ; branch according to condition flags (bra unconditional, bsr call)
00000548 | 4a44                     | tst.w        d4                                  ; machine operation; verify instruction and data boundaries
0000054a | 6706                     | beq.b        $552                                ; branch according to condition flags (bra unconditional, bsr call)
0000054c | 35440002                 | move.w       d4, $2(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000550 | 601a                     | bra.b        $56c                                ; branch according to condition flags (bra unconditional, bsr call)
00000552 | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000554 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000556 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000558 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000055a | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
0000055e | 4eb90000040a             | jsr          $40a.l                              ; call subroutine; push return address
00000564 | 35400002                 | move.w       d0, $2(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000568 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
0000056c | 4a6a0002                 | tst.w        $2(a2)                              ; machine operation; verify instruction and data boundaries
00000570 | 6c0e                     | bge.b        $580                                ; branch according to condition flags (bra unconditional, bsr call)
00000572 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000574 | 4eb9000000f0             | jsr          $f0.l                               ; call subroutine; push return address
0000057a | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
0000057c | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
0000057e | 6008                     | bra.b        $588                                ; branch according to condition flags (bra unconditional, bsr call)
00000580 | 4eb9000000ce             | jsr          $ce.l                               ; call subroutine; push return address
00000586 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000588 | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
0000058c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000058e | 4e75                     | rts                                              ; return: pop return address from stack
00000590 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000594 | 48e71020                 | movem.l      d3/a2, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000598 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
0000059c | 206a000c                 | movea.l      $c(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
000005a0 | b1ea0010                 | cmpa.l       $10(a2), a0                         ; compare operands; set condition flags
000005a4 | 6406                     | bcc.b        $5ac                                ; branch according to condition flags (bra unconditional, bsr call)
000005a6 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000005a8 | 600000ea                 | bra.w        $694                                ; branch according to condition flags (bra unconditional, bsr call)
000005ac | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000005ae | 028000000100             | andi.l       #$100, d0                           ; bit/integer operation; flags depend on variant
000005b4 | 6706                     | beq.b        $5bc                                ; branch according to condition flags (bra unconditional, bsr call)
000005b6 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000005b8 | 600000da                 | bra.w        $694                                ; branch according to condition flags (bra unconditional, bsr call)
000005bc | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000005be | 02800000a001             | andi.l       #$a001, d0                          ; bit/integer operation; flags depend on variant
000005c4 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
000005c6 | 671c                     | beq.b        $5e4                                ; branch according to condition flags (bra unconditional, bsr call)
000005c8 | 08120007                 | btst.b       #$7, (a2)                           ; branch according to condition flags (bra unconditional, bsr call)
000005cc | 6608                     | bne.b        $5d6                                ; branch according to condition flags (bra unconditional, bsr call)
000005ce | 203c00004200             | move.l       #$4200, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
000005d4 | 6006                     | bra.b        $5dc                                ; branch according to condition flags (bra unconditional, bsr call)
000005d6 | 203c00000200             | move.l       #$200, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000005dc | 8152                     | or.w         d0, (a2)                            ; bit/integer operation; flags depend on variant
000005de | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000005e0 | 600000b2                 | bra.w        $694                                ; branch according to condition flags (bra unconditional, bsr call)
000005e4 | 4aaa0004                 | tst.l        $4(a2)                              ; machine operation; verify instruction and data boundaries
000005e8 | 6646                     | bne.b        $630                                ; branch according to condition flags (bra unconditional, bsr call)
000005ea | 48781000                 | pea.l        $1000.w                             ; machine operation; verify instruction and data boundaries
000005ee | 4eb9000007f6             | jsr          $7f6.l                              ; call subroutine; push return address
000005f4 | 25480004                 | move.l       a0, $4(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
000005f8 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000005fa | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000005fc | 6616                     | bne.b        $614                                ; branch according to condition flags (bra unconditional, bsr call)
000005fe | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000600 | 41e80036                 | lea.l        $36(a0), a0                         ; machine operation; verify instruction and data boundaries
00000604 | 25480004                 | move.l       a0, $4(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000608 | 206a0004                 | movea.l      $4(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000060c | 5288                     | addq.l       #$1, a0                             ; arithmetic operation; flags depend on variant
0000060e | 25480008                 | move.l       a0, $8(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000612 | 601c                     | bra.b        $630                                ; branch according to condition flags (bra unconditional, bsr call)
00000614 | 00520040                 | ori.w        #$40, (a2)                          ; bit/integer operation; flags depend on variant
00000618 | 206a0004                 | movea.l      $4(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000061c | 41e81000                 | lea.l        $1000(a0), a0                       ; machine operation; verify instruction and data boundaries
00000620 | 25480008                 | move.l       a0, $8(a2)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000624 | 256a00040026             | move.l       $4(a2), $26(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000062a | 256a0004002a             | move.l       $4(a2), $2a(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000630 | 256a0004000c             | move.l       $4(a2), $c(a2)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000636 | 256a00040010             | move.l       $4(a2), $10(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000063c | 256a00040014             | move.l       $4(a2), $14(a2)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000642 | 206a0008                 | movea.l      $8(a2), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000646 | 91ea0004                 | suba.l       $4(a2), a0                          ; arithmetic operation; flags depend on variant
0000064a | 2f08                     | move.l       a0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
0000064c | 2f2a0004                 | move.l       $4(a2), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000650 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000652 | 4eb900000f0a             | jsr          $f0a.l                              ; call subroutine; push return address
00000658 | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000065a | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
0000065c | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000660 | 6c08                     | bge.b        $66a                                ; branch according to condition flags (bra unconditional, bsr call)
00000662 | 00524200                 | ori.w        #$4200, (a2)                        ; bit/integer operation; flags depend on variant
00000666 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000668 | 602a                     | bra.b        $694                                ; branch according to condition flags (bra unconditional, bsr call)
0000066a | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
0000066c | 661c                     | bne.b        $68a                                ; branch according to condition flags (bra unconditional, bsr call)
0000066e | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000670 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000672 | 0280ffffefff             | andi.l       #$ffffefff, d0                      ; bit/integer operation; flags depend on variant
00000678 | 008000000100             | ori.l        #$100, d0                           ; bit/integer operation; flags depend on variant
0000067e | 008000004000             | ori.l        #$4000, d0                          ; bit/integer operation; flags depend on variant
00000684 | 3480                     | move.w       d0, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000686 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000688 | 600a                     | bra.b        $694                                ; branch according to condition flags (bra unconditional, bsr call)
0000068a | 00525000                 | ori.w        #$5000, (a2)                        ; bit/integer operation; flags depend on variant
0000068e | d7aa0010                 | add.l        d3, $10(a2)                         ; arithmetic operation; flags depend on variant
00000692 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000694 | 4cdf0408                 | movem.l      (a7)+, d3/a2                        ; copy source to destination (Motorola operand order); flags depend on variant
00000698 | 4e5e                     | unlk         a6                                  ; restore stack frame
0000069a | 4e75                     | rts                                              ; return: pop return address from stack
0000069c | 48e70018                 | movem.l      a3-a4, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000006a0 | 594f                     | subq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000006a2 | 266f0010                 | movea.l      $10(a7), a3                         ; copy source to destination (Motorola operand order); flags depend on variant
000006a6 | 200b                     | move.l       a3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000006a8 | 6700009a                 | beq.w        $744                                ; branch according to condition flags (bra unconditional, bsr call)
000006ac | 224b                     | movea.l      a3, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
000006ae | 5989                     | subq.l       #$4, a1                             ; arithmetic operation; flags depend on variant
000006b0 | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000006b2 | b091                     | cmp.l        (a1), d0                            ; compare operands; set condition flags
000006b4 | 6206                     | bhi.b        $6bc                                ; branch according to condition flags (bra unconditional, bsr call)
000006b6 | 7003                     | moveq        #$3, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000006b8 | c091                     | and.l        (a1), d0                            ; bit/integer operation; flags depend on variant
000006ba | 6704                     | beq.b        $6c0                                ; branch according to condition flags (bra unconditional, bsr call)
000006bc | 60000086                 | bra.w        $744                                ; branch according to condition flags (bra unconditional, bsr call)
000006c0 | 2e91                     | move.l       (a1), (a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
000006c2 | 4aadfde4                 | tst.l        -$21c(a5)                           ; machine operation; verify instruction and data boundaries
000006c6 | 6706                     | beq.b        $6ce                                ; branch according to condition flags (bra unconditional, bsr call)
000006c8 | b3edfde4                 | cmpa.l       -$21c(a5), a1                       ; compare operands; set condition flags
000006cc | 640c                     | bcc.b        $6da                                ; branch according to condition flags (bra unconditional, bsr call)
000006ce | 236dfde40004             | move.l       -$21c(a5), $4(a1)                   ; copy source to destination (Motorola operand order); flags depend on variant
000006d4 | 2b49fde4                 | move.l       a1, -$21c(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
000006d8 | 6044                     | bra.b        $71e                                ; branch according to condition flags (bra unconditional, bsr call)
000006da | 266dfde4                 | movea.l      -$21c(a5), a3                       ; copy source to destination (Motorola operand order); flags depend on variant
000006de | 6004                     | bra.b        $6e4                                ; branch according to condition flags (bra unconditional, bsr call)
000006e0 | 266b0004                 | movea.l      $4(a3), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
000006e4 | 4aab0004                 | tst.l        $4(a3)                              ; machine operation; verify instruction and data boundaries
000006e8 | 6706                     | beq.b        $6f0                                ; branch according to condition flags (bra unconditional, bsr call)
000006ea | b3eb0004                 | cmpa.l       $4(a3), a1                          ; compare operands; set condition flags
000006ee | 62f0                     | bhi.b        $6e0                                ; branch according to condition flags (bra unconditional, bsr call)
000006f0 | 284b                     | movea.l      a3, a4                              ; copy source to destination (Motorola operand order); flags depend on variant
000006f2 | d9d3                     | adda.l       (a3), a4                            ; arithmetic operation; flags depend on variant
000006f4 | b3cc                     | cmpa.l       a4, a1                              ; compare operands; set condition flags
000006f6 | 654c                     | bcs.b        $744                                ; branch according to condition flags (bra unconditional, bsr call)
000006f8 | b9c9                     | cmpa.l       a1, a4                              ; compare operands; set condition flags
000006fa | 6608                     | bne.b        $704                                ; branch according to condition flags (bra unconditional, bsr call)
000006fc | 2011                     | move.l       (a1), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000006fe | d193                     | add.l        d0, (a3)                            ; arithmetic operation; flags depend on variant
00000700 | 224b                     | movea.l      a3, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000702 | 601a                     | bra.b        $71e                                ; branch according to condition flags (bra unconditional, bsr call)
00000704 | 4aab0004                 | tst.l        $4(a3)                              ; machine operation; verify instruction and data boundaries
00000708 | 670a                     | beq.b        $714                                ; branch according to condition flags (bra unconditional, bsr call)
0000070a | 2049                     | movea.l      a1, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000070c | d1d1                     | adda.l       (a1), a0                            ; arithmetic operation; flags depend on variant
0000070e | b1eb0004                 | cmpa.l       $4(a3), a0                          ; compare operands; set condition flags
00000712 | 6230                     | bhi.b        $744                                ; branch according to condition flags (bra unconditional, bsr call)
00000714 | 236b00040004             | move.l       $4(a3), $4(a1)                      ; copy source to destination (Motorola operand order); flags depend on variant
0000071a | 27490004                 | move.l       a1, $4(a3)                          ; copy source to destination (Motorola operand order); flags depend on variant
0000071e | 4aa90004                 | tst.l        $4(a1)                              ; machine operation; verify instruction and data boundaries
00000722 | 6720                     | beq.b        $744                                ; branch according to condition flags (bra unconditional, bsr call)
00000724 | 2049                     | movea.l      a1, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000726 | d1d1                     | adda.l       (a1), a0                            ; arithmetic operation; flags depend on variant
00000728 | b1e90004                 | cmpa.l       $4(a1), a0                          ; compare operands; set condition flags
0000072c | 6616                     | bne.b        $744                                ; branch according to condition flags (bra unconditional, bsr call)
0000072e | 42adfde0                 | clr.l        -$220(a5)                           ; bit/integer operation; flags depend on variant
00000732 | 20690004                 | movea.l      $4(a1), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000736 | 2010                     | move.l       (a0), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000738 | d191                     | add.l        d0, (a1)                            ; arithmetic operation; flags depend on variant
0000073a | 20690004                 | movea.l      $4(a1), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000073e | 236800040004             | move.l       $4(a0), $4(a1)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000744 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000746 | 4cdf1800                 | movem.l      (a7)+, a3-a4                        ; copy source to destination (Motorola operand order); flags depend on variant
0000074a | 4e75                     | rts                                              ; return: pop return address from stack
0000074c | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000750 | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000754 | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
00000758 | 246dfde0                 | movea.l      -$220(a5), a2                       ; copy source to destination (Motorola operand order); flags depend on variant
0000075c | 200a                     | move.l       a2, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000075e | 662e                     | bne.b        $78e                                ; branch according to condition flags (bra unconditional, bsr call)
00000760 | 45edfde0                 | lea.l        -$220(a5), a2                       ; machine operation; verify instruction and data boundaries
00000764 | 588a                     | addq.l       #$4, a2                             ; arithmetic operation; flags depend on variant
00000766 | 6010                     | bra.b        $778                                ; branch according to condition flags (bra unconditional, bsr call)
00000768 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000076a | b890                     | cmp.l        (a0), d4                            ; compare operands; set condition flags
0000076c | 6204                     | bhi.b        $772                                ; branch according to condition flags (bra unconditional, bsr call)
0000076e | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000770 | 607c                     | bra.b        $7ee                                ; branch according to condition flags (bra unconditional, bsr call)
00000772 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000774 | 5888                     | addq.l       #$4, a0                             ; arithmetic operation; flags depend on variant
00000776 | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00000778 | 4a92                     | tst.l        (a2)                                ; machine operation; verify instruction and data boundaries
0000077a | 66ec                     | bne.b        $768                                ; branch according to condition flags (bra unconditional, bsr call)
0000077c | 6036                     | bra.b        $7b4                                ; branch according to condition flags (bra unconditional, bsr call)
0000077e | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000780 | b890                     | cmp.l        (a0), d4                            ; compare operands; set condition flags
00000782 | 6204                     | bhi.b        $788                                ; branch according to condition flags (bra unconditional, bsr call)
00000784 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000786 | 6066                     | bra.b        $7ee                                ; branch according to condition flags (bra unconditional, bsr call)
00000788 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000078a | 5888                     | addq.l       #$4, a0                             ; arithmetic operation; flags depend on variant
0000078c | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
0000078e | 4a92                     | tst.l        (a2)                                ; machine operation; verify instruction and data boundaries
00000790 | 66ec                     | bne.b        $77e                                ; branch according to condition flags (bra unconditional, bsr call)
00000792 | 206dfde0                 | movea.l      -$220(a5), a0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000796 | 2650                     | movea.l      (a0), a3                            ; copy source to destination (Motorola operand order); flags depend on variant
00000798 | 45edfde0                 | lea.l        -$220(a5), a2                       ; machine operation; verify instruction and data boundaries
0000079c | 588a                     | addq.l       #$4, a2                             ; arithmetic operation; flags depend on variant
0000079e | 6010                     | bra.b        $7b0                                ; branch according to condition flags (bra unconditional, bsr call)
000007a0 | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000007a2 | b890                     | cmp.l        (a0), d4                            ; compare operands; set condition flags
000007a4 | 6204                     | bhi.b        $7aa                                ; branch according to condition flags (bra unconditional, bsr call)
000007a6 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
000007a8 | 6044                     | bra.b        $7ee                                ; branch according to condition flags (bra unconditional, bsr call)
000007aa | 2052                     | movea.l      (a2), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
000007ac | 5888                     | addq.l       #$4, a0                             ; arithmetic operation; flags depend on variant
000007ae | 2448                     | movea.l      a0, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
000007b0 | b7d2                     | cmpa.l       (a2), a3                            ; compare operands; set condition flags
000007b2 | 66ec                     | bne.b        $7a0                                ; branch according to condition flags (bra unconditional, bsr call)
000007b4 | 263c00008000             | move.l       #$8000, d3                          ; copy source to destination (Motorola operand order); flags depend on variant
000007ba | b684                     | cmp.l        d4, d3                              ; compare operands; set condition flags
000007bc | 6402                     | bcc.b        $7c0                                ; branch according to condition flags (bra unconditional, bsr call)
000007be | 2604                     | move.l       d4, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000007c0 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000007c2 | 4eb90000086e             | jsr          $86e.l                              ; call subroutine; push return address
000007c8 | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
000007ca | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000007cc | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000007ce | 660c                     | bne.b        $7dc                                ; branch according to condition flags (bra unconditional, bsr call)
000007d0 | b684                     | cmp.l        d4, d3                              ; compare operands; set condition flags
000007d2 | 6604                     | bne.b        $7d8                                ; branch according to condition flags (bra unconditional, bsr call)
000007d4 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
000007d6 | 6016                     | bra.b        $7ee                                ; branch according to condition flags (bra unconditional, bsr call)
000007d8 | e28b                     | lsr.l        #$1, d3                             ; bit/integer operation; flags depend on variant
000007da | 60de                     | bra.b        $7ba                                ; branch according to condition flags (bra unconditional, bsr call)
000007dc | 2683                     | move.l       d3, (a3)                            ; copy source to destination (Motorola operand order); flags depend on variant
000007de | 486b0004                 | pea.l        $4(a3)                              ; machine operation; verify instruction and data boundaries
000007e2 | 4eb90000069c             | jsr          $69c.l                              ; call subroutine; push return address
000007e8 | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
000007ea | 6000ff6c                 | bra.w        $758                                ; branch according to condition flags (bra unconditional, bsr call)
000007ee | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
000007f2 | 4e5e                     | unlk         a6                                  ; restore stack frame
000007f4 | 4e75                     | rts                                              ; return: pop return address from stack
000007f6 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
000007fa | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
000007fe | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
00000802 | 70fc                     | moveq        #$fc, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000804 | 2604                     | move.l       d4, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000806 | 5e83                     | addq.l       #$7, d3                             ; arithmetic operation; flags depend on variant
00000808 | c680                     | and.l        d0, d3                              ; bit/integer operation; flags depend on variant
0000080a | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
0000080c | 6604                     | bne.b        $812                                ; branch according to condition flags (bra unconditional, bsr call)
0000080e | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
00000810 | 6054                     | bra.b        $866                                ; branch according to condition flags (bra unconditional, bsr call)
00000812 | b684                     | cmp.l        d4, d3                              ; compare operands; set condition flags
00000814 | 6204                     | bhi.b        $81a                                ; branch according to condition flags (bra unconditional, bsr call)
00000816 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
00000818 | 604c                     | bra.b        $866                                ; branch according to condition flags (bra unconditional, bsr call)
0000081a | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000081c | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
0000081e | 6402                     | bcc.b        $822                                ; branch according to condition flags (bra unconditional, bsr call)
00000820 | 7608                     | moveq        #$8, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000822 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000824 | 4eb90000074c             | jsr          $74c.l                              ; call subroutine; push return address
0000082a | 2648                     | movea.l      a0, a3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000082c | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000082e | 584f                     | addq.w       #$4, a7                             ; arithmetic operation; flags depend on variant
00000830 | 6604                     | bne.b        $836                                ; branch according to condition flags (bra unconditional, bsr call)
00000832 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
00000834 | 6030                     | bra.b        $866                                ; branch according to condition flags (bra unconditional, bsr call)
00000836 | 2453                     | movea.l      (a3), a2                            ; copy source to destination (Motorola operand order); flags depend on variant
00000838 | 2012                     | move.l       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000083a | 5180                     | subq.l       #$8, d0                             ; arithmetic operation; flags depend on variant
0000083c | b083                     | cmp.l        d3, d0                              ; compare operands; set condition flags
0000083e | 6406                     | bcc.b        $846                                ; branch according to condition flags (bra unconditional, bsr call)
00000840 | 26aa0004                 | move.l       $4(a2), (a3)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000844 | 6018                     | bra.b        $85e                                ; branch according to condition flags (bra unconditional, bsr call)
00000846 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000848 | d1c3                     | adda.l       d3, a0                              ; arithmetic operation; flags depend on variant
0000084a | 2688                     | move.l       a0, (a3)                            ; copy source to destination (Motorola operand order); flags depend on variant
0000084c | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000084e | 216a00040004             | move.l       $4(a2), $4(a0)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000854 | 2012                     | move.l       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000856 | 9083                     | sub.l        d3, d0                              ; arithmetic operation; flags depend on variant
00000858 | 2053                     | movea.l      (a3), a0                            ; copy source to destination (Motorola operand order); flags depend on variant
0000085a | 2080                     | move.l       d0, (a0)                            ; copy source to destination (Motorola operand order); flags depend on variant
0000085c | 2483                     | move.l       d3, (a2)                            ; copy source to destination (Motorola operand order); flags depend on variant
0000085e | 2b4bfde0                 | move.l       a3, -$220(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000862 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000864 | 5888                     | addq.l       #$4, a0                             ; arithmetic operation; flags depend on variant
00000866 | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
0000086a | 4e5e                     | unlk         a6                                  ; restore stack frame
0000086c | 4e75                     | rts                                              ; return: pop return address from stack
0000086e | 4e56fffc                 | link.w       a6, #$fffc                          ; establish stack frame
00000872 | 2f03                     | move.l       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000874 | 262e0008                 | move.l       $8(a6), d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000878 | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
0000087a | 6714                     | beq.b        $890                                ; branch according to condition flags (bra unconditional, bsr call)
0000087c | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000087e | a11e                     | dc.w         $a11e                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000880 | 2d48fffc                 | move.l       a0, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000884 | 2008                     | move.l       a0, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000886 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000888 | 6706                     | beq.b        $890                                ; branch according to condition flags (bra unconditional, bsr call)
0000088a | 206efffc                 | movea.l      -$4(a6), a0                         ; copy source to destination (Motorola operand order); flags depend on variant
0000088e | 6002                     | bra.b        $892                                ; branch according to condition flags (bra unconditional, bsr call)
00000890 | 91c8                     | suba.l       a0, a0                              ; arithmetic operation; flags depend on variant
00000892 | 261f                     | move.l       (a7)+, d3                           ; copy source to destination (Motorola operand order); flags depend on variant
00000894 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000896 | 4e75                     | rts                                              ; return: pop return address from stack
00000898 | 4e56fe08                 | link.w       a6, #$fe08                          ; establish stack frame
0000089c | 48e71c00                 | movem.l      d3-d5, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
000008a0 | 282e000c                 | move.l       $c(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
000008a4 | 0c2dfffffffc             | cmpi.b       #$ff, -$4(a5)                       ; compare operands; set condition flags
000008aa | 6606                     | bne.b        $8b2                                ; branch according to condition flags (bra unconditional, bsr call)
000008ac | 4eb900000e36             | jsr          $e36.l                              ; call subroutine; push return address
000008b2 | 486efe86                 | pea.l        -$17a(a6)                           ; machine operation; verify instruction and data boundaries
000008b6 | 2f2e0008                 | move.l       $8(a6), -(a7)                       ; copy source to destination (Motorola operand order); flags depend on variant
000008ba | 4eb900000e84             | jsr          $e84.l                              ; call subroutine; push return address
000008c0 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
000008c2 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
000008c4 | 6706                     | beq.b        $8cc                                ; branch according to condition flags (bra unconditional, bsr call)
000008c6 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
000008c8 | 60000254                 | bra.w        $b1e                                ; branch according to condition flags (bra unconditional, bsr call)
000008cc | 7003                     | moveq        #$3, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000008ce | c084                     | and.l        d4, d0                              ; bit/integer operation; flags depend on variant
000008d0 | 6604                     | bne.b        $8d6                                ; branch according to condition flags (bra unconditional, bsr call)
000008d2 | 7603                     | moveq        #$3, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
000008d4 | 601c                     | bra.b        $8f2                                ; branch according to condition flags (bra unconditional, bsr call)
000008d6 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000008d8 | c084                     | and.l        d4, d0                              ; bit/integer operation; flags depend on variant
000008da | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
000008dc | 6610                     | bne.b        $8ee                                ; branch according to condition flags (bra unconditional, bsr call)
000008de | 7002                     | moveq        #$2, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000008e0 | c084                     | and.l        d4, d0                              ; bit/integer operation; flags depend on variant
000008e2 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
000008e4 | 6604                     | bne.b        $8ea                                ; branch according to condition flags (bra unconditional, bsr call)
000008e6 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000008e8 | 6002                     | bra.b        $8ec                                ; branch according to condition flags (bra unconditional, bsr call)
000008ea | 7002                     | moveq        #$2, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000008ec | 6002                     | bra.b        $8f0                                ; branch according to condition flags (bra unconditional, bsr call)
000008ee | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
000008f0 | 1600                     | move.b       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000008f2 | 4a2dfffc                 | tst.b        -$4(a5)                             ; machine operation; verify instruction and data boundaries
000008f6 | 6770                     | beq.b        $968                                ; branch according to condition flags (bra unconditional, bsr call)
000008f8 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000008fa | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000008fc | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
000008fe | 486efe86                 | pea.l        -$17a(a6)                           ; machine operation; verify instruction and data boundaries
00000902 | 486efe40                 | pea.l        -$1c0(a6)                           ; machine operation; verify instruction and data boundaries
00000906 | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000908 | aa52                     | dc.w         $aa52                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000090a | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000090c | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000090e | 028000003000             | andi.l       #$3000, d0                          ; bit/integer operation; flags depend on variant
00000914 | 6618                     | bne.b        $92e                                ; branch according to condition flags (bra unconditional, bsr call)
00000916 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000918 | 486efe40                 | pea.l        -$1c0(a6)                           ; machine operation; verify instruction and data boundaries
0000091c | 1f3c0001                 | move.b       #$1, -(a7)                          ; copy source to destination (Motorola operand order); flags depend on variant
00000920 | 486efe09                 | pea.l        -$1f7(a6)                           ; machine operation; verify instruction and data boundaries
00000924 | 486efe08                 | pea.l        -$1f8(a6)                           ; machine operation; verify instruction and data boundaries
00000928 | 700c                     | moveq        #$c, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000092a | a823                     | dc.w         $a823                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
0000092c | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000092e | 41eefe40                 | lea.l        -$1c0(a6), a0                       ; machine operation; verify instruction and data boundaries
00000932 | 5c88                     | addq.l       #$6, a0                             ; arithmetic operation; flags depend on variant
00000934 | 2d48ff98                 | move.l       a0, -$68(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000938 | 3d6efe40ff9c             | move.w       -$1c0(a6), -$64(a6)                 ; copy source to destination (Motorola operand order); flags depend on variant
0000093e | 2d6efe42ffb6             | move.l       -$1be(a6), -$4a(a6)                 ; copy source to destination (Motorola operand order); flags depend on variant
00000944 | 1d43ffa1                 | move.b       d3, -$5f(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000948 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000094a | 028000004000             | andi.l       #$4000, d0                          ; bit/integer operation; flags depend on variant
00000950 | 670a                     | beq.b        $95c                                ; branch according to condition flags (bra unconditional, bsr call)
00000952 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00000956 | a20a                     | dc.w         $a20a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000958 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000095a | 6058                     | bra.b        $9b4                                ; branch according to condition flags (bra unconditional, bsr call)
0000095c | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00000960 | 701a                     | moveq        #$1a, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000962 | a260                     | dc.w         $a260                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000964 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000966 | 604c                     | bra.b        $9b4                                ; branch according to condition flags (bra unconditional, bsr call)
00000968 | 42aeffb6                 | clr.l        -$4a(a6)                            ; bit/integer operation; flags depend on variant
0000096c | 426eff9c                 | clr.w        -$64(a6)                            ; bit/integer operation; flags depend on variant
00000970 | 41eefe86                 | lea.l        -$17a(a6), a0                       ; machine operation; verify instruction and data boundaries
00000974 | 2d48ff98                 | move.l       a0, -$68(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000978 | 1d43ffa1                 | move.b       d3, -$5f(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
0000097c | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
0000097e | 028000004000             | andi.l       #$4000, d0                          ; bit/integer operation; flags depend on variant
00000984 | 6718                     | beq.b        $99e                                ; branch according to condition flags (bra unconditional, bsr call)
00000986 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000988 | 486efe86                 | pea.l        -$17a(a6)                           ; machine operation; verify instruction and data boundaries
0000098c | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
0000098e | 486eff9e                 | pea.l        -$62(a6)                            ; machine operation; verify instruction and data boundaries
00000992 | 4eb900000078             | jsr          $78.l                               ; call subroutine; push return address
00000998 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
0000099a | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
0000099c | 6016                     | bra.b        $9b4                                ; branch according to condition flags (bra unconditional, bsr call)
0000099e | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
000009a0 | 486efe86                 | pea.l        -$17a(a6)                           ; machine operation; verify instruction and data boundaries
000009a4 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
000009a6 | 486eff9e                 | pea.l        -$62(a6)                            ; machine operation; verify instruction and data boundaries
000009aa | 4eb900000070             | jsr          $70.l                               ; call subroutine; push return address
000009b0 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
000009b2 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000009b4 | 0c43ffd5                 | cmpi.w       #$ffd5, d3                          ; compare operands; set condition flags
000009b8 | 660000f2                 | bne.w        $aac                                ; branch according to condition flags (bra unconditional, bsr call)
000009bc | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000009be | 028000000200             | andi.l       #$200, d0                           ; bit/integer operation; flags depend on variant
000009c4 | 670000e6                 | beq.w        $aac                                ; branch according to condition flags (bra unconditional, bsr call)
000009c8 | 422effa5                 | clr.b        -$5b(a6)                            ; bit/integer operation; flags depend on variant
000009cc | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
000009d0 | a208                     | dc.w         $a208                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000009d2 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
000009d4 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
000009d6 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
000009d8 | 665c                     | bne.b        $a36                                ; branch according to condition flags (bra unconditional, bsr call)
000009da | 2a04                     | move.l       d4, d5                              ; copy source to destination (Motorola operand order); flags depend on variant
000009dc | 028500008000             | andi.l       #$8000, d5                          ; bit/integer operation; flags depend on variant
000009e2 | 2f05                     | move.l       d5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000009e4 | 4eb900000ee8             | jsr          $ee8.l                              ; call subroutine; push return address
000009ea | 2d40ffa6                 | move.l       d0, -$5a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000009ee | 2f05                     | move.l       d5, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
000009f0 | 4eb900000ec6             | jsr          $ec6.l                              ; call subroutine; push return address
000009f6 | 2d40ffaa                 | move.l       d0, -$56(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
000009fa | 426effae                 | clr.w        -$52(a6)                            ; bit/integer operation; flags depend on variant
000009fe | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000a00 | 028000002000             | andi.l       #$2000, d0                          ; bit/integer operation; flags depend on variant
00000a06 | 504f                     | addq.w       #$8, a7                             ; arithmetic operation; flags depend on variant
00000a08 | 670e                     | beq.b        $a18                                ; branch according to condition flags (bra unconditional, bsr call)
00000a0a | 4a2dfffc                 | tst.b        -$4(a5)                             ; machine operation; verify instruction and data boundaries
00000a0e | 6708                     | beq.b        $a18                                ; branch according to condition flags (bra unconditional, bsr call)
00000a10 | 3d7c8000ffae             | move.w       #$8000, -$52(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00000a16 | 6004                     | bra.b        $a1c                                ; branch according to condition flags (bra unconditional, bsr call)
00000a18 | 426effae                 | clr.w        -$52(a6)                            ; bit/integer operation; flags depend on variant
00000a1c | 41eefe0a                 | lea.l        -$1f6(a6), a0                       ; machine operation; verify instruction and data boundaries
00000a20 | 20b8020c                 | move.l       $20c.w, (a0)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000a24 | 2d6efe0affd2             | move.l       -$1f6(a6), -$2e(a6)                 ; copy source to destination (Motorola operand order); flags depend on variant
00000a2a | 2d6efe0affce             | move.l       -$1f6(a6), -$32(a6)                 ; copy source to destination (Motorola operand order); flags depend on variant
00000a30 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00000a34 | a20d                     | dc.w         $a20d                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a36 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00000a38 | 6714                     | beq.b        $a4e                                ; branch according to condition flags (bra unconditional, bsr call)
00000a3a | 0c43ffd0                 | cmpi.w       #$ffd0, d3                          ; compare operands; set condition flags
00000a3e | 670e                     | beq.b        $a4e                                ; branch according to condition flags (bra unconditional, bsr call)
00000a40 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000a42 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000a44 | 2b40fd88                 | move.l       d0, -$278(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000a48 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000a4a | 600000d2                 | bra.w        $b1e                                ; branch according to condition flags (bra unconditional, bsr call)
00000a4e | 4a2dfffc                 | tst.b        -$4(a5)                             ; machine operation; verify instruction and data boundaries
00000a52 | 6720                     | beq.b        $a74                                ; branch according to condition flags (bra unconditional, bsr call)
00000a54 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000a56 | 028000004000             | andi.l       #$4000, d0                          ; bit/integer operation; flags depend on variant
00000a5c | 670a                     | beq.b        $a68                                ; branch according to condition flags (bra unconditional, bsr call)
00000a5e | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00000a62 | a20a                     | dc.w         $a20a                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a64 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000a66 | 6044                     | bra.b        $aac                                ; branch according to condition flags (bra unconditional, bsr call)
00000a68 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00000a6c | 701a                     | moveq        #$1a, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000a6e | a260                     | dc.w         $a260                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000a70 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000a72 | 6038                     | bra.b        $aac                                ; branch according to condition flags (bra unconditional, bsr call)
00000a74 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000a76 | 028000004000             | andi.l       #$4000, d0                          ; bit/integer operation; flags depend on variant
00000a7c | 6718                     | beq.b        $a96                                ; branch according to condition flags (bra unconditional, bsr call)
00000a7e | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000a80 | 486efe86                 | pea.l        -$17a(a6)                           ; machine operation; verify instruction and data boundaries
00000a84 | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00000a86 | 486eff9e                 | pea.l        -$62(a6)                            ; machine operation; verify instruction and data boundaries
00000a8a | 4eb900000078             | jsr          $78.l                               ; call subroutine; push return address
00000a90 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000a92 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000a94 | 6016                     | bra.b        $aac                                ; branch according to condition flags (bra unconditional, bsr call)
00000a96 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000a98 | 486efe86                 | pea.l        -$17a(a6)                           ; machine operation; verify instruction and data boundaries
00000a9c | 4267                     | clr.w        -(a7)                               ; bit/integer operation; flags depend on variant
00000a9e | 486eff9e                 | pea.l        -$62(a6)                            ; machine operation; verify instruction and data boundaries
00000aa2 | 4eb900000070             | jsr          $70.l                               ; call subroutine; push return address
00000aa8 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000aaa | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000aac | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00000aae | 6718                     | beq.b        $ac8                                ; branch according to condition flags (bra unconditional, bsr call)
00000ab0 | 0c43ffd0                 | cmpi.w       #$ffd0, d3                          ; compare operands; set condition flags
00000ab4 | 6712                     | beq.b        $ac8                                ; branch according to condition flags (bra unconditional, bsr call)
00000ab6 | 0c43ffcf                 | cmpi.w       #$ffcf, d3                          ; compare operands; set condition flags
00000aba | 670c                     | beq.b        $ac8                                ; branch according to condition flags (bra unconditional, bsr call)
00000abc | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000abe | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000ac0 | 2b40fd88                 | move.l       d0, -$278(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000ac4 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000ac6 | 6056                     | bra.b        $b1e                                ; branch according to condition flags (bra unconditional, bsr call)
00000ac8 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000aca | 028000000800             | andi.l       #$800, d0                           ; bit/integer operation; flags depend on variant
00000ad0 | 6724                     | beq.b        $af6                                ; branch according to condition flags (bra unconditional, bsr call)
00000ad2 | 3d6eff9efe26             | move.w       -$62(a6), -$1da(a6)                 ; copy source to destination (Motorola operand order); flags depend on variant
00000ad8 | 42aefe2a                 | clr.l        -$1d6(a6)                           ; bit/integer operation; flags depend on variant
00000adc | 41eefe0e                 | lea.l        -$1f2(a6), a0                       ; machine operation; verify instruction and data boundaries
00000ae0 | a012                     | dc.w         $a012                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000ae2 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000ae4 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000ae6 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000ae8 | 670c                     | beq.b        $af6                                ; branch according to condition flags (bra unconditional, bsr call)
00000aea | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000aec | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000aee | 2b40fd88                 | move.l       d0, -$278(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000af2 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000af4 | 6028                     | bra.b        $b1e                                ; branch according to condition flags (bra unconditional, bsr call)
00000af6 | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000af8 | 028000000100             | andi.l       #$100, d0                           ; bit/integer operation; flags depend on variant
00000afe | 6718                     | beq.b        $b18                                ; branch according to condition flags (bra unconditional, bsr call)
00000b00 | 48780002                 | pea.l        $2.w                                ; machine operation; verify instruction and data boundaries
00000b04 | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00000b06 | 302eff9e                 | move.w       -$62(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000b0a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000b0c | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000b0e | 4eb900000ba4             | jsr          $ba4.l                              ; call subroutine; push return address
00000b14 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000b18 | 302eff9e                 | move.w       -$62(a6), d0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000b1c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000b1e | 4cdf0038                 | movem.l      (a7)+, d3-d5                        ; copy source to destination (Motorola operand order); flags depend on variant
00000b22 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000b24 | 4e75                     | rts                                              ; return: pop return address from stack
00000b26 | 4e56ff48                 | link.w       a6, #$ff48                          ; establish stack frame
00000b2a | 48e71800                 | movem.l      d3-d4, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000b2e | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
00000b32 | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
00000b34 | 6d0a                     | blt.b        $b40                                ; branch according to condition flags (bra unconditional, bsr call)
00000b36 | 7002                     | moveq        #$2, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000b38 | b880                     | cmp.l        d0, d4                              ; compare operands; set condition flags
00000b3a | 6e04                     | bgt.b        $b40                                ; branch according to condition flags (bra unconditional, bsr call)
00000b3c | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000b3e | 605c                     | bra.b        $b9c                                ; branch according to condition flags (bra unconditional, bsr call)
00000b40 | 426eff64                 | clr.w        -$9c(a6)                            ; bit/integer operation; flags depend on variant
00000b44 | 3d44ff60                 | move.w       d4, -$a0(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000b48 | 42aeff5a                 | clr.l        -$a6(a6)                            ; bit/integer operation; flags depend on variant
00000b4c | 41eeff48                 | lea.l        -$b8(a6), a0                        ; machine operation; verify instruction and data boundaries
00000b50 | 7008                     | moveq        #$8, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000b52 | a260                     | dc.w         $a260                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b54 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b56 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b58 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000b5a | 6628                     | bne.b        $b84                                ; branch according to condition flags (bra unconditional, bsr call)
00000b5c | 3d6eff5eff9c             | move.w       -$a2(a6), -$64(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000b62 | 3d44ff9e                 | move.w       d4, -$62(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000b66 | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00000b6a | a001                     | dc.w         $a001                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b6c | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b6e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b70 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000b72 | 6610                     | bne.b        $b84                                ; branch according to condition flags (bra unconditional, bsr call)
00000b74 | 42aeff98                 | clr.l        -$68(a6)                            ; bit/integer operation; flags depend on variant
00000b78 | 3d6eff5eff9c             | move.w       -$a2(a6), -$64(a6)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000b7e | 41eeff86                 | lea.l        -$7a(a6), a0                        ; machine operation; verify instruction and data boundaries
00000b82 | a013                     | dc.w         $a013                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000b84 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b86 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000b88 | 6708                     | beq.b        $b92                                ; branch according to condition flags (bra unconditional, bsr call)
00000b8a | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000b8c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000b8e | 2b40fd88                 | move.l       d0, -$278(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000b92 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00000b94 | 6704                     | beq.b        $b9a                                ; branch according to condition flags (bra unconditional, bsr call)
00000b96 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000b98 | 6002                     | bra.b        $b9c                                ; branch according to condition flags (bra unconditional, bsr call)
00000b9a | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000b9c | 4cdf0018                 | movem.l      (a7)+, d3-d4                        ; copy source to destination (Motorola operand order); flags depend on variant
00000ba0 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000ba2 | 4e75                     | rts                                              ; return: pop return address from stack
00000ba4 | 4e56ffce                 | link.w       a6, #$ffce                          ; establish stack frame
00000ba8 | 48e71e00                 | movem.l      d3-d6, -(a7)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000bac | 282e0008                 | move.l       $8(a6), d4                          ; copy source to destination (Motorola operand order); flags depend on variant
00000bb0 | 2a2e000c                 | move.l       $c(a6), d5                          ; copy source to destination (Motorola operand order); flags depend on variant
00000bb4 | 2c2e0010                 | move.l       $10(a6), d6                         ; copy source to destination (Motorola operand order); flags depend on variant
00000bb8 | 4a84                     | tst.l        d4                                  ; machine operation; verify instruction and data boundaries
00000bba | 6d0c                     | blt.b        $bc8                                ; branch according to condition flags (bra unconditional, bsr call)
00000bbc | 7002                     | moveq        #$2, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000bbe | b880                     | cmp.l        d0, d4                              ; compare operands; set condition flags
00000bc0 | 6e06                     | bgt.b        $bc8                                ; branch according to condition flags (bra unconditional, bsr call)
00000bc2 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000bc4 | 600000ec                 | bra.w        $cb2                                ; branch according to condition flags (bra unconditional, bsr call)
00000bc8 | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000bcc | 2d45fffc                 | move.l       d5, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000bd0 | 2006                     | move.l       d6, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000bd2 | 670a                     | beq.b        $bde                                ; branch according to condition flags (bra unconditional, bsr call)
00000bd4 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000bd6 | 670e                     | beq.b        $be6                                ; branch according to condition flags (bra unconditional, bsr call)
00000bd8 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000bda | 6712                     | beq.b        $bee                                ; branch according to condition flags (bra unconditional, bsr call)
00000bdc | 6016                     | bra.b        $bf4                                ; branch according to condition flags (bra unconditional, bsr call)
00000bde | 3d7c0001fffa             | move.w       #$1, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000be4 | 600e                     | bra.b        $bf4                                ; branch according to condition flags (bra unconditional, bsr call)
00000be6 | 3d7c0003fffa             | move.w       #$3, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000bec | 6006                     | bra.b        $bf4                                ; branch according to condition flags (bra unconditional, bsr call)
00000bee | 3d7c0002fffa             | move.w       #$2, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000bf4 | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00000bf8 | a044                     | dc.w         $a044                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000bfa | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000bfc | 0c43ffd9                 | cmpi.w       #$ffd9, d3                          ; compare operands; set condition flags
00000c00 | 66000096                 | bne.w        $c98                                ; branch according to condition flags (bra unconditional, bsr call)
00000c04 | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c08 | 2006                     | move.l       d6, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c0a | 670a                     | beq.b        $c16                                ; branch according to condition flags (bra unconditional, bsr call)
00000c0c | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000c0e | 670c                     | beq.b        $c1c                                ; branch according to condition flags (bra unconditional, bsr call)
00000c10 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000c12 | 6726                     | beq.b        $c3a                                ; branch according to condition flags (bra unconditional, bsr call)
00000c14 | 6040                     | bra.b        $c56                                ; branch according to condition flags (bra unconditional, bsr call)
00000c16 | 2d45ffea                 | move.l       d5, -$16(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c1a | 603a                     | bra.b        $c56                                ; branch according to condition flags (bra unconditional, bsr call)
00000c1c | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00000c20 | a018                     | dc.w         $a018                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c22 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c24 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c26 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000c28 | 662c                     | bne.b        $c56                                ; branch according to condition flags (bra unconditional, bsr call)
00000c2a | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c2e | 202efffc                 | move.l       -$4(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000c32 | d085                     | add.l        d5, d0                              ; arithmetic operation; flags depend on variant
00000c34 | 2d40ffea                 | move.l       d0, -$16(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c38 | 601c                     | bra.b        $c56                                ; branch according to condition flags (bra unconditional, bsr call)
00000c3a | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00000c3e | a011                     | dc.w         $a011                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c40 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c42 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c44 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000c46 | 660e                     | bne.b        $c56                                ; branch according to condition flags (bra unconditional, bsr call)
00000c48 | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c4c | 206effea                 | movea.l      -$16(a6), a0                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c50 | d1c5                     | adda.l       d5, a0                              ; arithmetic operation; flags depend on variant
00000c52 | 2d48ffea                 | move.l       a0, -$16(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c56 | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00000c5a | a012                     | dc.w         $a012                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c5c | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c5e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c60 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000c62 | 6634                     | bne.b        $c98                                ; branch according to condition flags (bra unconditional, bsr call)
00000c64 | 3d44ffe6                 | move.w       d4, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c68 | 2d45fffc                 | move.l       d5, -$4(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000c6c | 2006                     | move.l       d6, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c6e | 670a                     | beq.b        $c7a                                ; branch according to condition flags (bra unconditional, bsr call)
00000c70 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000c72 | 670e                     | beq.b        $c82                                ; branch according to condition flags (bra unconditional, bsr call)
00000c74 | 5380                     | subq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000c76 | 6712                     | beq.b        $c8a                                ; branch according to condition flags (bra unconditional, bsr call)
00000c78 | 6016                     | bra.b        $c90                                ; branch according to condition flags (bra unconditional, bsr call)
00000c7a | 3d7c0001fffa             | move.w       #$1, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c80 | 600e                     | bra.b        $c90                                ; branch according to condition flags (bra unconditional, bsr call)
00000c82 | 3d7c0003fffa             | move.w       #$3, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c88 | 6006                     | bra.b        $c90                                ; branch according to condition flags (bra unconditional, bsr call)
00000c8a | 3d7c0002fffa             | move.w       #$2, -$6(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000c90 | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00000c94 | a044                     | dc.w         $a044                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000c96 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c98 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000c9a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000c9c | 6708                     | beq.b        $ca6                                ; branch according to condition flags (bra unconditional, bsr call)
00000c9e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000ca0 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000ca2 | 2b40fd88                 | move.l       d0, -$278(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000ca6 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00000ca8 | 6704                     | beq.b        $cae                                ; branch according to condition flags (bra unconditional, bsr call)
00000caa | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000cac | 6004                     | bra.b        $cb2                                ; branch according to condition flags (bra unconditional, bsr call)
00000cae | 202efffc                 | move.l       -$4(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000cb2 | 4cdf0078                 | movem.l      (a7)+, d3-d6                        ; copy source to destination (Motorola operand order); flags depend on variant
00000cb6 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000cb8 | 4e75                     | rts                                              ; return: pop return address from stack
00000cba | 4e56ffce                 | link.w       a6, #$ffce                          ; establish stack frame
00000cbe | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000cc2 | 262e0008                 | move.l       $8(a6), d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000cc6 | 246e000c                 | movea.l      $c(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00000cca | 282e0010                 | move.l       $10(a6), d4                         ; copy source to destination (Motorola operand order); flags depend on variant
00000cce | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00000cd0 | 662c                     | bne.b        $cfe                                ; branch according to condition flags (bra unconditional, bsr call)
00000cd2 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000cd4 | 4eb900001068             | jsr          $1068.l                             ; call subroutine; push return address
00000cda | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00000cdc | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000cde | 661a                     | bne.b        $cfa                                ; branch according to condition flags (bra unconditional, bsr call)
00000ce0 | 486dfe44                 | pea.l        -$1bc(a5)                           ; machine operation; verify instruction and data boundaries
00000ce4 | 4eb9000001f0             | jsr          $1f0.l                              ; call subroutine; push return address
00000cea | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000cec | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000cee | 4eb900001084             | jsr          $1084.l                             ; call subroutine; push return address
00000cf4 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000cf8 | 6046                     | bra.b        $d40                                ; branch according to condition flags (bra unconditional, bsr call)
00000cfa | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000cfc | 6042                     | bra.b        $d40                                ; branch according to condition flags (bra unconditional, bsr call)
00000cfe | 3d43ffe6                 | move.w       d3, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d02 | 2d4affee                 | move.l       a2, -$12(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d06 | 2d44fff2                 | move.l       d4, -$e(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000d0a | 426efffa                 | clr.w        -$6(a6)                             ; bit/integer operation; flags depend on variant
00000d0e | 42aefffc                 | clr.l        -$4(a6)                             ; bit/integer operation; flags depend on variant
00000d12 | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00000d16 | a002                     | dc.w         $a002                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d18 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000d1a | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000d1c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000d1e | 670e                     | beq.b        $d2e                                ; branch according to condition flags (bra unconditional, bsr call)
00000d20 | 0c43ffd9                 | cmpi.w       #$ffd9, d3                          ; compare operands; set condition flags
00000d24 | 6708                     | beq.b        $d2e                                ; branch according to condition flags (bra unconditional, bsr call)
00000d26 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000d28 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000d2a | 2b40fd88                 | move.l       d0, -$278(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000d2e | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00000d30 | 6706                     | beq.b        $d38                                ; branch according to condition flags (bra unconditional, bsr call)
00000d32 | 0c43ffd9                 | cmpi.w       #$ffd9, d3                          ; compare operands; set condition flags
00000d36 | 6606                     | bne.b        $d3e                                ; branch according to condition flags (bra unconditional, bsr call)
00000d38 | 202efff6                 | move.l       -$a(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000d3c | 6002                     | bra.b        $d40                                ; branch according to condition flags (bra unconditional, bsr call)
00000d3e | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000d40 | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00000d44 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000d46 | 4e75                     | rts                                              ; return: pop return address from stack
00000d48 | 4e56feb0                 | link.w       a6, #$feb0                          ; establish stack frame
00000d4c | 48e71030                 | movem.l      d3/a2-a3, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000d50 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000d54 | 45eeff00                 | lea.l        -$100(a6), a2                       ; machine operation; verify instruction and data boundaries
00000d58 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00000d5a | 6002                     | bra.b        $d5e                                ; branch according to condition flags (bra unconditional, bsr call)
00000d5c | 14db                     | move.b       (a3)+, (a2)+                        ; copy source to destination (Motorola operand order); flags depend on variant
00000d5e | 4a13                     | tst.b        (a3)                                ; machine operation; verify instruction and data boundaries
00000d60 | 66fa                     | bne.b        $d5c                                ; branch according to condition flags (bra unconditional, bsr call)
00000d62 | 4212                     | clr.b        (a2)                                ; bit/integer operation; flags depend on variant
00000d64 | 41eeff00                 | lea.l        -$100(a6), a0                       ; machine operation; verify instruction and data boundaries
00000d68 | 224a                     | movea.l      a2, a1                              ; copy source to destination (Motorola operand order); flags depend on variant
00000d6a | 93c8                     | suba.l       a0, a1                              ; arithmetic operation; flags depend on variant
00000d6c | 5389                     | subq.l       #$1, a1                             ; arithmetic operation; flags depend on variant
00000d6e | 2009                     | move.l       a1, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000d70 | 1d40ff00                 | move.b       d0, -$100(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000d74 | 2d48fec2                 | move.l       a0, -$13e(a6)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000d78 | 426efec6                 | clr.w        -$13a(a6)                           ; bit/integer operation; flags depend on variant
00000d7c | 422efeca                 | clr.b        -$136(a6)                           ; bit/integer operation; flags depend on variant
00000d80 | 41eefeb0                 | lea.l        -$150(a6), a0                       ; machine operation; verify instruction and data boundaries
00000d84 | a009                     | dc.w         $a009                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000d86 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000d88 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000d8a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000d8c | 6708                     | beq.b        $d96                                ; branch according to condition flags (bra unconditional, bsr call)
00000d8e | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000d90 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000d92 | 2b40fd88                 | move.l       d0, -$278(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000d96 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00000d98 | 6704                     | beq.b        $d9e                                ; branch according to condition flags (bra unconditional, bsr call)
00000d9a | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000d9c | 6002                     | bra.b        $da0                                ; branch according to condition flags (bra unconditional, bsr call)
00000d9e | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000da0 | 4cdf0c08                 | movem.l      (a7)+, d3/a2-a3                     ; copy source to destination (Motorola operand order); flags depend on variant
00000da4 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000da6 | 4e75                     | rts                                              ; return: pop return address from stack
00000da8 | 4e56ffce                 | link.w       a6, #$ffce                          ; establish stack frame
00000dac | 48e71820                 | movem.l      d3-d4/a2, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000db0 | 262e0008                 | move.l       $8(a6), d3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000db4 | 246e000c                 | movea.l      $c(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00000db8 | 282e0010                 | move.l       $10(a6), d4                         ; copy source to destination (Motorola operand order); flags depend on variant
00000dbc | 7001                     | moveq        #$1, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000dbe | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00000dc0 | 6706                     | beq.b        $dc8                                ; branch according to condition flags (bra unconditional, bsr call)
00000dc2 | 7002                     | moveq        #$2, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000dc4 | b680                     | cmp.l        d0, d3                              ; compare operands; set condition flags
00000dc6 | 662c                     | bne.b        $df4                                ; branch according to condition flags (bra unconditional, bsr call)
00000dc8 | 3f03                     | move.w       d3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000dca | 4eb900001068             | jsr          $1068.l                             ; call subroutine; push return address
00000dd0 | 4a40                     | tst.w        d0                                  ; machine operation; verify instruction and data boundaries
00000dd2 | 544f                     | addq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000dd4 | 661a                     | bne.b        $df0                                ; branch according to condition flags (bra unconditional, bsr call)
00000dd6 | 486dfe0c                 | pea.l        -$1f4(a5)                           ; machine operation; verify instruction and data boundaries
00000dda | 4eb9000001f0             | jsr          $1f0.l                              ; call subroutine; push return address
00000de0 | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000de2 | 2f0a                     | move.l       a2, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000de4 | 4eb90000107a             | jsr          $107a.l                             ; call subroutine; push return address
00000dea | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000dee | 603e                     | bra.b        $e2e                                ; branch according to condition flags (bra unconditional, bsr call)
00000df0 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000df2 | 603a                     | bra.b        $e2e                                ; branch according to condition flags (bra unconditional, bsr call)
00000df4 | 3d43ffe6                 | move.w       d3, -$1a(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000df8 | 2d4affee                 | move.l       a2, -$12(a6)                        ; copy source to destination (Motorola operand order); flags depend on variant
00000dfc | 2d44fff2                 | move.l       d4, -$e(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e00 | 426efffa                 | clr.w        -$6(a6)                             ; bit/integer operation; flags depend on variant
00000e04 | 42aefffc                 | clr.l        -$4(a6)                             ; bit/integer operation; flags depend on variant
00000e08 | 426effe4                 | clr.w        -$1c(a6)                            ; bit/integer operation; flags depend on variant
00000e0c | 41eeffce                 | lea.l        -$32(a6), a0                        ; machine operation; verify instruction and data boundaries
00000e10 | a003                     | dc.w         $a003                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e12 | 3600                     | move.w       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000e14 | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000e16 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000e18 | 6708                     | beq.b        $e22                                ; branch according to condition flags (bra unconditional, bsr call)
00000e1a | 3003                     | move.w       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000e1c | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000e1e | 2b40fd88                 | move.l       d0, -$278(a5)                       ; copy source to destination (Motorola operand order); flags depend on variant
00000e22 | 4a43                     | tst.w        d3                                  ; machine operation; verify instruction and data boundaries
00000e24 | 6704                     | beq.b        $e2a                                ; branch according to condition flags (bra unconditional, bsr call)
00000e26 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000e28 | 6004                     | bra.b        $e2e                                ; branch according to condition flags (bra unconditional, bsr call)
00000e2a | 202efff6                 | move.l       -$a(a6), d0                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e2e | 4cdf0418                 | movem.l      (a7)+, d3-d4/a2                     ; copy source to destination (Motorola operand order); flags depend on variant
00000e32 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000e34 | 4e75                     | rts                                              ; return: pop return address from stack
00000e36 | 4e56fff8                 | link.w       a6, #$fff8                          ; establish stack frame
00000e3a | 422dfffc                 | clr.b        -$4(a5)                             ; bit/integer operation; flags depend on variant
00000e3e | 303ca89f                 | move.w       #$a89f, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000e42 | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e44 | 2d48fff8                 | move.l       a0, -$8(a6)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e48 | 303ca1ad                 | move.w       #$a1ad, d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000e4c | a746                     | dc.w         $a746                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00000e4e | b1eefff8                 | cmpa.l       -$8(a6), a0                         ; compare operands; set condition flags
00000e52 | 672c                     | beq.b        $e80                                ; branch according to condition flags (bra unconditional, bsr call)
00000e54 | 554f                     | subq.w       #$2, a7                             ; arithmetic operation; flags depend on variant
00000e56 | 2f3c73797376             | move.l       #$73797376, -(a7)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000e5c | 486efffc                 | pea.l        -$4(a6)                             ; machine operation; verify instruction and data boundaries
00000e60 | 4eb900000060             | jsr          $60.l                               ; call subroutine; push return address
00000e66 | 301f                     | move.w       (a7)+, d0                           ; copy source to destination (Motorola operand order); flags depend on variant
00000e68 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000e6a | 6614                     | bne.b        $e80                                ; branch according to condition flags (bra unconditional, bsr call)
00000e6c | 0cae00000700fffc         | cmpi.l       #$700, -$4(a6)                      ; compare operands; set condition flags
00000e74 | 5cc0                     | sge.b        d0                                  ; machine operation; verify instruction and data boundaries
00000e76 | 4400                     | neg.b        d0                                  ; machine operation; verify instruction and data boundaries
00000e78 | 4880                     | ext.w        d0                                  ; bit/integer operation; flags depend on variant
00000e7a | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000e7c | 1b40fffc                 | move.b       d0, -$4(a5)                         ; copy source to destination (Motorola operand order); flags depend on variant
00000e80 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000e82 | 4e75                     | rts                                              ; return: pop return address from stack
00000e84 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000e88 | 48e71030                 | movem.l      d3/a2-a3, -(a7)                     ; copy source to destination (Motorola operand order); flags depend on variant
00000e8c | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00000e90 | 266e000c                 | movea.l      $c(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000e94 | 204a                     | movea.l      a2, a0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000e96 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000e98 | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000e9a | 4a18                     | tst.b        (a0)+                               ; machine operation; verify instruction and data boundaries
00000e9c | 66fa                     | bne.b        $e98                                ; branch according to condition flags (bra unconditional, bsr call)
00000e9e | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000ea0 | 0c83000000ff             | cmpi.l       #$ff, d3                            ; compare operands; set condition flags
00000ea6 | 6304                     | bls.b        $eac                                ; branch according to condition flags (bra unconditional, bsr call)
00000ea8 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000eaa | 6012                     | bra.b        $ebe                                ; branch according to condition flags (bra unconditional, bsr call)
00000eac | 1683                     | move.b       d3, (a3)                            ; copy source to destination (Motorola operand order); flags depend on variant
00000eae | 7601                     | moveq        #$1, d3                             ; copy source to destination (Motorola operand order); flags depend on variant
00000eb0 | 6006                     | bra.b        $eb8                                ; branch according to condition flags (bra unconditional, bsr call)
00000eb2 | 179a3800                 | move.b       (a2)+, (a3, d3.l)                   ; copy source to destination (Motorola operand order); flags depend on variant
00000eb6 | 5283                     | addq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000eb8 | 4a12                     | tst.b        (a2)                                ; machine operation; verify instruction and data boundaries
00000eba | 66f6                     | bne.b        $eb2                                ; branch according to condition flags (bra unconditional, bsr call)
00000ebc | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00000ebe | 4cdf0c08                 | movem.l      (a7)+, d3/a2-a3                     ; copy source to destination (Motorola operand order); flags depend on variant
00000ec2 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000ec4 | 4e75                     | rts                                              ; return: pop return address from stack
00000ec6 | 4aadfdec                 | tst.l        -$214(a5)                           ; machine operation; verify instruction and data boundaries
00000eca | 6706                     | beq.b        $ed2                                ; branch according to condition flags (bra unconditional, bsr call)
00000ecc | 202dfdec                 | move.l       -$214(a5), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000ed0 | 4e75                     | rts                                              ; return: pop return address from stack
00000ed2 | 4aaf0004                 | tst.l        $4(a7)                              ; machine operation; verify instruction and data boundaries
00000ed6 | 6708                     | beq.b        $ee0                                ; branch according to condition flags (bra unconditional, bsr call)
00000ed8 | 203c3f3f3f3f             | move.l       #$3f3f3f3f, d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000ede | 4e75                     | rts                                              ; return: pop return address from stack
00000ee0 | 203c43574945             | move.l       #$43574945, d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000ee6 | 4e75                     | rts                                              ; return: pop return address from stack
00000ee8 | 4aadfde8                 | tst.l        -$218(a5)                           ; machine operation; verify instruction and data boundaries
00000eec | 6706                     | beq.b        $ef4                                ; branch according to condition flags (bra unconditional, bsr call)
00000eee | 202dfde8                 | move.l       -$218(a5), d0                       ; copy source to destination (Motorola operand order); flags depend on variant
00000ef2 | 4e75                     | rts                                              ; return: pop return address from stack
00000ef4 | 4aaf0004                 | tst.l        $4(a7)                              ; machine operation; verify instruction and data boundaries
00000ef8 | 6708                     | beq.b        $f02                                ; branch according to condition flags (bra unconditional, bsr call)
00000efa | 203c42494e41             | move.l       #$42494e41, d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f00 | 4e75                     | rts                                              ; return: pop return address from stack
00000f02 | 203c54455854             | move.l       #$54455854, d0                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f08 | 4e75                     | rts                                              ; return: pop return address from stack
00000f0a | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000f0e | 48e71830                 | movem.l      d3-d4/a2-a3, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000f12 | 246e0008                 | movea.l      $8(a6), a2                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f16 | 266e000c                 | movea.l      $c(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f1a | 2f2e0010                 | move.l       $10(a6), -(a7)                      ; copy source to destination (Motorola operand order); flags depend on variant
00000f1e | 2f0b                     | move.l       a3, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f20 | 302a0002                 | move.w       $2(a2), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f24 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000f26 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f28 | 4eb900000cba             | jsr          $cba.l                              ; call subroutine; push return address
00000f2e | 2600                     | move.l       d0, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f30 | 4a83                     | tst.l        d3                                  ; machine operation; verify instruction and data boundaries
00000f32 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000f36 | 672e                     | beq.b        $f66                                ; branch according to condition flags (bra unconditional, bsr call)
00000f38 | 3012                     | move.w       (a2), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000f3a | 7220                     | moveq        #$20, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000f3c | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000f3e | 6626                     | bne.b        $f66                                ; branch according to condition flags (bra unconditional, bsr call)
00000f40 | 2803                     | move.l       d3, d4                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f42 | 244b                     | movea.l      a3, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f44 | 6018                     | bra.b        $f5e                                ; branch according to condition flags (bra unconditional, bsr call)
00000f46 | 0c12000d                 | cmpi.b       #$d, (a2)                           ; compare operands; set condition flags
00000f4a | 6606                     | bne.b        $f52                                ; branch according to condition flags (bra unconditional, bsr call)
00000f4c | 14bc000a                 | move.b       #$a, (a2)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f50 | 600a                     | bra.b        $f5c                                ; branch according to condition flags (bra unconditional, bsr call)
00000f52 | 0c12000a                 | cmpi.b       #$a, (a2)                           ; compare operands; set condition flags
00000f56 | 6604                     | bne.b        $f5c                                ; branch according to condition flags (bra unconditional, bsr call)
00000f58 | 14bc000d                 | move.b       #$d, (a2)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f5c | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00000f5e | 2004                     | move.l       d4, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f60 | 5384                     | subq.l       #$1, d4                             ; arithmetic operation; flags depend on variant
00000f62 | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000f64 | 66e0                     | bne.b        $f46                                ; branch according to condition flags (bra unconditional, bsr call)
00000f66 | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f68 | 4cdf0c18                 | movem.l      (a7)+, d3-d4/a2-a3                  ; copy source to destination (Motorola operand order); flags depend on variant
00000f6c | 4e5e                     | unlk         a6                                  ; restore stack frame
00000f6e | 4e75                     | rts                                              ; return: pop return address from stack
00000f70 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00000f74 | 48e71838                 | movem.l      d3-d4/a2-a4, -(a7)                  ; copy source to destination (Motorola operand order); flags depend on variant
00000f78 | 266e0008                 | movea.l      $8(a6), a3                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f7c | 286e000c                 | movea.l      $c(a6), a4                          ; copy source to destination (Motorola operand order); flags depend on variant
00000f80 | 282e0010                 | move.l       $10(a6), d4                         ; copy source to destination (Motorola operand order); flags depend on variant
00000f84 | 3013                     | move.w       (a3), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000f86 | 7220                     | moveq        #$20, d1                            ; copy source to destination (Motorola operand order); flags depend on variant
00000f88 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000f8a | 6626                     | bne.b        $fb2                                ; branch according to condition flags (bra unconditional, bsr call)
00000f8c | 2604                     | move.l       d4, d3                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f8e | 244c                     | movea.l      a4, a2                              ; copy source to destination (Motorola operand order); flags depend on variant
00000f90 | 6018                     | bra.b        $faa                                ; branch according to condition flags (bra unconditional, bsr call)
00000f92 | 0c12000a                 | cmpi.b       #$a, (a2)                           ; compare operands; set condition flags
00000f96 | 6606                     | bne.b        $f9e                                ; branch according to condition flags (bra unconditional, bsr call)
00000f98 | 14bc000d                 | move.b       #$d, (a2)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000f9c | 600a                     | bra.b        $fa8                                ; branch according to condition flags (bra unconditional, bsr call)
00000f9e | 0c12000d                 | cmpi.b       #$d, (a2)                           ; compare operands; set condition flags
00000fa2 | 6604                     | bne.b        $fa8                                ; branch according to condition flags (bra unconditional, bsr call)
00000fa4 | 14bc000a                 | move.b       #$a, (a2)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fa8 | 528a                     | addq.l       #$1, a2                             ; arithmetic operation; flags depend on variant
00000faa | 2003                     | move.l       d3, d0                              ; copy source to destination (Motorola operand order); flags depend on variant
00000fac | 5383                     | subq.l       #$1, d3                             ; arithmetic operation; flags depend on variant
00000fae | 4a80                     | tst.l        d0                                  ; machine operation; verify instruction and data boundaries
00000fb0 | 66e0                     | bne.b        $f92                                ; branch according to condition flags (bra unconditional, bsr call)
00000fb2 | 3013                     | move.w       (a3), d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000fb4 | 7204                     | moveq        #$4, d1                             ; copy source to destination (Motorola operand order); flags depend on variant
00000fb6 | c081                     | and.l        d1, d0                              ; bit/integer operation; flags depend on variant
00000fb8 | 6720                     | beq.b        $fda                                ; branch according to condition flags (bra unconditional, bsr call)
00000fba | 48780002                 | pea.l        $2.w                                ; machine operation; verify instruction and data boundaries
00000fbe | 42a7                     | clr.l        -(a7)                               ; bit/integer operation; flags depend on variant
00000fc0 | 302b0002                 | move.w       $2(a3), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000fc4 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000fc6 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fc8 | 4eb900000ba4             | jsr          $ba4.l                              ; call subroutine; push return address
00000fce | 5280                     | addq.l       #$1, d0                             ; arithmetic operation; flags depend on variant
00000fd0 | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000fd4 | 6604                     | bne.b        $fda                                ; branch according to condition flags (bra unconditional, bsr call)
00000fd6 | 70ff                     | moveq        #$ff, d0                            ; copy source to destination (Motorola operand order); flags depend on variant
00000fd8 | 6016                     | bra.b        $ff0                                ; branch according to condition flags (bra unconditional, bsr call)
00000fda | 2f04                     | move.l       d4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fdc | 2f0c                     | move.l       a4, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fde | 302b0002                 | move.w       $2(a3), d0                          ; copy source to destination (Motorola operand order); flags depend on variant
00000fe2 | 48c0                     | ext.l        d0                                  ; bit/integer operation; flags depend on variant
00000fe4 | 2f00                     | move.l       d0, -(a7)                           ; copy source to destination (Motorola operand order); flags depend on variant
00000fe6 | 4eb900000da8             | jsr          $da8.l                              ; call subroutine; push return address
00000fec | 4fef000c                 | lea.l        $c(a7), a7                          ; machine operation; verify instruction and data boundaries
00000ff0 | 4cdf1c18                 | movem.l      (a7)+, d3-d4/a2-a4                  ; copy source to destination (Motorola operand order); flags depend on variant
00000ff4 | 4e5e                     | unlk         a6                                  ; restore stack frame
00000ff6 | 4e75                     | rts                                              ; return: pop return address from stack
00000ff8 | 4e56fff6                 | link.w       a6, #$fff6                          ; establish stack frame
00000ffc | 2d6e000cfff6             | move.l       $c(a6), -$a(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001002 | 2d6e0010fffa             | move.l       $10(a6), -$6(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00001008 | 3d6e0014fffe             | move.w       $14(a6), -$2(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
0000100e | 486efff6                 | pea.l        -$a(a6)                             ; machine operation; verify instruction and data boundaries
00001012 | 3f3c001a                 | move.w       #$1a, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
00001016 | a9ec                     | dc.w         $a9ec                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001018 | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
0000101c | 20aefff6                 | move.l       -$a(a6), (a0)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001020 | 216efffa0004             | move.l       -$6(a6), $4(a0)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001026 | 316efffe0008             | move.w       -$2(a6), $8(a0)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000102c | 4e5e                     | unlk         a6                                  ; restore stack frame
0000102e | 4e75                     | rts                                              ; return: pop return address from stack
00001030 | 4e56fff6                 | link.w       a6, #$fff6                          ; establish stack frame
00001034 | 2d6e000cfff6             | move.l       $c(a6), -$a(a6)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000103a | 2d6e0010fffa             | move.l       $10(a6), -$6(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00001040 | 3d6e0014fffe             | move.w       $14(a6), -$2(a6)                    ; copy source to destination (Motorola operand order); flags depend on variant
00001046 | 486efff6                 | pea.l        -$a(a6)                             ; machine operation; verify instruction and data boundaries
0000104a | 3f3c0018                 | move.w       #$18, -(a7)                         ; copy source to destination (Motorola operand order); flags depend on variant
0000104e | a9ec                     | dc.w         $a9ec                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
00001050 | 206e0008                 | movea.l      $8(a6), a0                          ; copy source to destination (Motorola operand order); flags depend on variant
00001054 | 20aefff6                 | move.l       -$a(a6), (a0)                       ; copy source to destination (Motorola operand order); flags depend on variant
00001058 | 216efffa0004             | move.l       -$6(a6), $4(a0)                     ; copy source to destination (Motorola operand order); flags depend on variant
0000105e | 316efffe0008             | move.w       -$2(a6), $8(a0)                     ; copy source to destination (Motorola operand order); flags depend on variant
00001064 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001066 | 4e75                     | rts                                              ; return: pop return address from stack
00001068 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000106c | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000106e | 4e5e                     | unlk         a6                                  ; restore stack frame
00001070 | 4e75                     | rts                                              ; return: pop return address from stack
00001072 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001076 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001078 | 4e75                     | rts                                              ; return: pop return address from stack
0000107a | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
0000107e | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
00001080 | 4e5e                     | unlk         a6                                  ; restore stack frame
00001082 | 4e75                     | rts                                              ; return: pop return address from stack
00001084 | 4e560000                 | link.w       a6, #$0                             ; establish stack frame
00001088 | 7000                     | moveq        #$0, d0                             ; copy source to destination (Motorola operand order); flags depend on variant
0000108a | 4e5e                     | unlk         a6                                  ; restore stack frame
0000108c | 4e75                     | rts                                              ; return: pop return address from stack
0000108e | 00000006                 | ori.b        #$6, d0                             ; bit/integer operation; flags depend on variant
00001092 | 407044d6                 | negx.w       -$2a(a0, d4.w)                      ; machine operation; verify instruction and data boundaries
00001096 | 7f84                     | .word ; undecoded bytes / possible Macintosh A-line trap
00001098 | 4088                     | .word ; undecoded bytes / possible Macintosh A-line trap
0000109a | 7f84                     | .word ; undecoded bytes / possible Macintosh A-line trap
0000109c | 425b                     | clr.w        (a3)+                               ; bit/integer operation; flags depend on variant
0000109e | 00000004                 | ori.b        #$4, d0                             ; bit/integer operation; flags depend on variant
000010a2 | b541                     | eor.w        d2, d1                              ; bit/integer operation; flags depend on variant
000010a4 | bc7f                     | .word ; undecoded bytes / possible Macintosh A-line trap
000010a6 | b840                     | cmp.w        d0, d4                              ; compare operands; set condition flags
000010a8 | 4d00                     | dc.w         $4d00                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010aa | 000028ae                 | ori.b        #$ae, d0                            ; bit/integer operation; flags depend on variant
000010ae | 9995                     | sub.l        d4, (a5)                            ; arithmetic operation; flags depend on variant
000010b0 | 978d                     | subx.l       -(a5), -(a3)                        ; arithmetic operation; flags depend on variant
000010b2 | 404b                     | .word ; undecoded bytes / possible Macintosh A-line trap
000010b4 | e2de                     | lsr.w        (a6)+                               ; bit/integer operation; flags depend on variant
000010b6 | 8d8c                     | dc.w         $8d8c                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010b8 | 40699dbc                 | negx.w       -$6244(a1)                          ; machine operation; verify instruction and data boundaries
000010bc | aebd                     | dc.w         $aebd                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010be | b0ad408d                 | cmp.l        $408d(a5), d0                       ; compare operands; set condition flags
000010c2 | cca991b7                 | and.l        -$6e49(a1), d6                      ; bit/integer operation; flags depend on variant
000010c6 | b240                     | cmp.w        d0, d1                              ; compare operands; set condition flags
000010c8 | b890                     | cmp.l        (a0), d4                            ; compare operands; set condition flags
000010ca | a140                     | dc.w         $a140                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010cc | 4487                     | neg.l        d7                                  ; machine operation; verify instruction and data boundaries
000010ce | 4095                     | negx.l       (a5)                                ; machine operation; verify instruction and data boundaries
000010d0 | 8640                     | or.w         d0, d3                              ; bit/integer operation; flags depend on variant
000010d2 | 8f40                     | dc.w         $8f40                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010d4 | e388                     | lsl.l        #$1, d0                             ; bit/integer operation; flags depend on variant
000010d6 | 8540                     | dc.w         $8540                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010d8 | 6e88                     | bgt.b        $1062                               ; branch according to condition flags (bra unconditional, bsr call)
000010da | 8540                     | dc.w         $8540                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010dc | a240                     | dc.w         $a240                               ; unrecognized opcode / embedded data; A-line words may be Macintosh Toolbox traps
000010de | 508f                     | addq.l       #$8, a7                             ; arithmetic operation; flags depend on variant
