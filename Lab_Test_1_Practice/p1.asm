s0: 	DC "Integer 1:"
s1: 	DC "Integer 2:"
s2: 	DC "Integer 3:"
s3:	DC "Smallest Integer:"


	addi x5, x0, s0
	addi x6, x0, s1
	addi x7, x0, s2
	addi x8, x0, s3
	add x31, x0, x0 ; where the smallest integer is stored

	ecall x1, x5, 4
	ecall x28, x0, 5

	ecall x1, x6, 4
	ecall x29, x0, 5

	ecall x1, x7, 4
	ecall x30, x0, 5


check_first:		blt x28, x29, check_third
		blt x29, x30, set_second
		add x31, x0, x30
		beq x0, x0, end		

set_second:		add x31, x0, x29
		beq x0, x0, end

check_third:		blt x28, x30, set_first
		add x31, x0, x30
		beq x0, x0, end

set_first:		add x31, x0, x28
		beq x0, x0, end

end:	ecall x1, x8, 4
	ecall x1, x31, 0 

