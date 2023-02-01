addi x6, x0, 1234
addi x7, x0, 567
addi x8, x0, 89

add x9, x7, x8

xori x10, x9, -1
addi x10, x10, 1

add x5, x6, x10 # final value