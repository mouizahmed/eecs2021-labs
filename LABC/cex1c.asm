<<<<<<< HEAD
s1: DC "Enter an unsigned integer:\0"

STACK:	EQU 0x100000
	lui sp, STACK >>12
	addi x5, x0, s1
	ecall x1, x5, 4 ; out question
	ecall x5, x0, 9 ; inp integer

loop1:	ld
=======
s1: DC "exp:"

c1: DC "+"
c2: DC "-"
c3: DC "*"
c4: DC "/"


STACK:	EQU 0x100000
	lui sp, STACK>>12
	addi x12, x0, s1

	ld x28, c1(x0) ; +
	ld x29, c2(x0) ; -
	ld x30, c3(x0) ; *
	ld x31, c4(x0) ; -


	ecall x1, x5, 4 ; out question
	ecall x5, x0, 9
	lbu x6, 0(x5) ; store first character from memory to x6
	subi x6, x6, 48
	sd x6, 0(sp) ; store first character into stack
	addi sp, sp, -8 ; (push)

LOOP:	beq x6, x0, exit
	 addi x5, x5, 1
	# jal x0, push

	lbu x6, 0(x5)
	beq x6, x28, add
	beq x6, x29, sub
	beq x6, x30, mult
	beq x6, x31, div
	addi x13, x0, 1
	bge x6, x13, convert
	sd x6, 0(sp)
	addi sp, sp, -8
	jal x0, LOOP

convert:	subi x6, x6, 48
sd x6, 0(sp)
	addi sp, sp, -8
	jal x0, LOOP
	
add:	addi sp, sp, 8
	ld x8, 0(sp)
	addi sp, sp, 8
	ld x9, 0(sp)
	
	add x10, x8, x9
	sd x10, 0(sp)
	addi sp, sp, -8

	jal x0, LOOP

sub:	addi sp, sp, 8
	ld x8, 0(sp)
	addi sp, sp, 8
	ld x9, 0(sp)
	
	sub x10, x9, x8
	sd x10, 0(sp)
	addi sp, sp, -8

	jal x0, LOOP

mult:	addi sp, sp, 8
	ld x8, 0(sp)
	addi sp, sp, 8
	ld x9, 0(sp)
	
	mul x10, x8, x9
	
	sd x10, 0(sp)
	addi sp, sp, -8

	jal x0, LOOP

div: 	addi sp, sp, 8
	ld x8, 0(sp)
	addi sp, sp, 8
	ld x9, 0(sp)
	
	div x10, x9, x8
	
	sd x10, 0(sp)
	addi sp, sp, -8

	jal x0, LOOP

exit:	addi sp, sp, 8
	ld x14, 0(sp)
	#ecall x0, x14, 0
		


	
>>>>>>> 76a0cfd5f027e065afaa8ec7ab89e950dab40ae8
