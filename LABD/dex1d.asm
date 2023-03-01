s0: DC "Find all divisors."
s1: DC "i:"
s2: DC "prime"
s3: DC "not prime"

c: DM 100

addi x5, x0, s0
ecall x0, x5, 4
addi x31, x0, 0 ; initial counter
addi x30, x0, 16 ; third index
addi x29, x0, 8 ; constant
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
sd x8, 0(x31)
addi x31, x31, 8
#ecall x0, x8, 0
blt x8, x7, loop
sub x31, x31, x29
bge x31, x30, prime
beq x0, x0, not_prime

prime:
addi x12, x0, s2
ecall x0, x12, 4
beq x0, x0, done

not_prime:
addi x11, x0, s3
ecall x0, x11, 4
beq x0, x0, done

done:
