s0: 	DC "n! Enter n:"
c1: 	DC "!="

	addi x5, x0, s0
	ecall x1, x5, 4 ; out info
	ecall x6, x0, 5 ; inp n
	addi x30, x0, 1
	addi x8, x0, 1

loop:	bge x30, x6, end
	mul x8, x8, x30
	addi x30, x30, 1
 
	beq x0, x0, loop

end: 	mul x8, x8, x30
	ecall x1, x6, 0
	addi x9, x0, c1
	ecall x1, x9, 4
	ecall x1, x8, 0
	