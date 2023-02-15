	addi sp, x0, 0
	addi x6, x0, 2 ; const 1
	addi x7, x0, 1 ; const 1
	addi a0, x0, 5 ; n=5
	addi a1, x0, 1 ; a = 0
	addi a2, x0, 1 ; b = 1
	jal x1, fib ; call fib
	ebreak x0, x0, 0
fib:	addi a0, a0, -1
	bge a0, x6, recu
	beq a0, x0, retA
	beq a0, x7, retB

recu:
	addi x31, a2, 0
	add a2, a2, a1
	add a1, x31, x0 
	jal x1, fib


retA:	add a0, a1, x0
	jal x0, end

retB:	add a0, a2, x0
	jal x0, end

end: ebreak x0, x0, 0