; if n<=5 rec_lin(n) = 5
; else rec_lin(n) = 4*rec_lin(n-5)+n

main:	addi sp, x0, 0
	addi x6, x0, 5 ; constant
	addi x7, x0, 6 ; constant
	addi x5, x0, 8 ; n
	jal x1, rec_lin
	ebreak x0, x0, 0

rec_lin:		bge x5, x7, recu
		addi x5, x6, 0
		jalr x0, 0(x1)

recu:	sd x1, -8(sp) # stores return address in stack at -8 offset
	sd x5, -16(sp) # stores x5 in stack at -16 offset
	addi sp, sp, -16 # adjust sp
	addi x5, x5, -5 # n - 5
	jal x1, rec_lin
	addi sp, sp, 16 # adjust sp
	ld x1, -8(sp) # popping return address
	ld x10, -16(sp) # popping x5 --> n
	slli x5, x5, 2 #--> NOW x5 = rec_lin(n-5)
	add x10, x10, x5
	jalr x0, 0(x1) 