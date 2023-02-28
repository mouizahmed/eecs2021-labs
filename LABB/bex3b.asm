c1: 	DC "memory:"
c2: 	DC "integer:"
s1: 	DC "Enter integer value"
s2:	DC "Enter memory address"

	ld x28, c1(x0) # "memory:"
	ld x29, c2(x0) # "integer:"
	addi x30, x0, s1
	ecall x0, x30, 4 ;info string

loop: 	ecall x6, x29, 5 # integer input (value)
	ecall x7, x28, 5 # integer input (memory)		
	sd x6, 0(x7)
	jal x0, loop

dst: DM 100

