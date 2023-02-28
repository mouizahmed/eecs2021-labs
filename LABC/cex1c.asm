s1: DC "Enter an unsigned integer:\0"

STACK:	EQU 0x100000
	lui sp, STACK >>12
	addi x5, x0, s1
	ecall x1, x5, 4 ; out question
	ecall x5, x0, 9 ; inp integer

loop1:	ld
