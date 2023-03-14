v1: DF 1.21, 5.85, -7.3, 23.1, -5.55

v2: DF 3.14, -2.1, 44.2, 11.0, -7.77

v3: DF 1.0

#max index of 4

addi x5, x0, 40
addi x6, x0, 0

loop:
fld f1, v1(x6)
fld f2, v2(x6)

fmul.d f3, f1, f2 #ax*bx
fadd.d f4, f4, f3
fsd f4, v3(x0)
addi x6, x6, 8
blt x6, x5, loop


