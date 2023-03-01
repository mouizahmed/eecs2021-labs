s0: DC "Find all divisors."
s1: DC "Enter i:"

addi x5, x0, s0
ecall x0, x5, 4

addi x6, x0, s1
ecall x1, x6, 4

ecall x7, x0, 5

#loop until i reaches the number, numbers with no remainders will be printed
# x8 = i
addi x8, x0, 0 


loop:
addi x8, x8, 1
rem x9, x7, x8 # 10/1 = 10 r0
beq x9, x0, print
blt x8, x7, loop


print:
ecall x0, x8, 0
blt x8, x7, loop