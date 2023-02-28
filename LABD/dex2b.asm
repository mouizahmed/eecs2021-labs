d1:	DF 1.0

s0: 	DC "n="
s1:	DC "Approximate e="
s2:	DC "Reference e=2.71828182845904523536"

	addi x5, x0, s0
	ecall x1, x5, 4 ; out info
	ecall x6, x0, 5 ; inp n
	addi x30, x0, 1 ; starting (for factorial)
	addi x31, x0, 0 ; starting n (for float)
	addi x8, x0, 1 ; factorial
	fld f1, d1(x0) ; 1.0/n!
	# f2 = final value

loop:	bge x30, x31, end
	mul x8, x8, x30
	addi x30, x30, 1
 
	beq x0, x0, loop

end: 	mul x8, x8, x30
	fcvt.d.l f5, x8
	fdiv.d f2, f1, f5
	fadd.d f3, f3, f2
	bge x31, x6, final
	addi x31, x31, 1 # n + 1
 	addi x8, x0, 1
	addi x30, x0, 1
	beq x0, x0, loop
	

final:	addi x10, x0, s1
	ecall x1, x10, 4 ; out info
	ecall x0, f3, 1
	addi x12, x0, s2
	ecall x1, x12, 4

ecall x0, x0, 0
	
	
	
	