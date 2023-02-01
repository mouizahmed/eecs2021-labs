lui x5, 0x12345
slli x5, x5, 32

lui x6, 0x8781
slli x6, x6, 16
add x5, x5, x6

lui x7, 0x1223
add x5, x5, x7

addi x8, x0, 3
slli x8, x8, 8
add x5, x5, x8

addi x9, x0, 4
slli x9, x9, 4
add x5, x5, x9

addi x5, x5, 4


