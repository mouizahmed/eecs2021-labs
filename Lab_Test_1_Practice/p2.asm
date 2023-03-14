s0: 	DC "x:"
s1: 	DC "y:"


	addi x5, x0, s0
	addi x6, x0, s1
	addi x30, x0, 0 ; result

	ecall x0, x5, 4
	ecall x28, x0, 5
	
	ecall x0, x6, 4
	ecall x29, x0, 5

#?x
check_x:		bge x28, x0, checkPositive_y
		beq x0, x0, check_y

#+x, ?y
checkPositive_y:			bge x29, x0, both_positive
			beq x0, x0, one_positive

# -x, ?y
check_y:		bge x29, x0, one_positive
		beq x0, x0, both_negative

both_negative:		addi x30, x0, 0
		beq x0, x0, end


one_positive:		addi x30, x0, 1
		beq x0, x0, end

both_positive:		addi x30, x0, 2
		beq x0, x0, end

end:	ecall x0, x30, 0