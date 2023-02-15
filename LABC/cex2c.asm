str1: DC "sampled text\0"
str2: DC "new text\0"

STACK: 	EQU 0x100000
	lui sp, STACK>>12
	addi x12, x0, str1
	addi x14, x0, str2

lench:	addi t0, x0, 0

lench_loop:		lbu x11, 0(t0)
		beq x11, x0, lench_done
		addi x10, x10, 1
		jal x0, lench_loop
		
lench_done:	jalr x0, 0(x1)

appch:	addi x10, x0, 0
	
	