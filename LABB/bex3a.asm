c1: 	DC "!"
c2: 	DC "Hello "
s1: 	DC "What is your name?"
	ld x28, c1(x0) # !
	ld x29, c2(x0) # hello
	addi x30, x0, s1
	ecall x0, x30, 4 ;info string

msg:	ecall x6, x0, 8 ; string
	ecall x1, x29, 3 ;" hello "
	ecall x1, x6, 3
	ecall x1, x28, 3
	#ecall x0, x5, 0 ;the result
	