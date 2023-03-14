s0: 	DC "sum(1..n-1) Enter n:"

c1: 	DC "sum(1.."
c2: 	DC ")="
c3: 	DC "(n*(n-1))/2="

	addi x5, x0, s0
	ecall x1, x5, 4 ; out prompt
	ecall x6, x0, 5 ; inp n
	
	addi x30, x0, 1 ; starting
	sub x31, x6, x30 ; ending
	addi x10, x0, 0 ; ACTUAL VALUE
	beq x0, x0, loop


loop:	add x10, x10, x30
	addi x30, x30, 1
	blt x30, x6, loop
	beq x0, x0, end

end: 	addi x20, x0, c1
	addi x21, x0, c2
	ecall x1, x20, 4
	ecall x1, x31, 0
	ecall x1, x21, 4
	ecall x0, x10, 0
	mul x11, x6, x31
	srli x12, x11, 1
	addi x22, x0, c3
	ecall x1, x22, 4
	ecall x1, x12, 0