# Mouiz Ahmed 218105536

dir:	DC "John"
	DC "11111"
	DC "Nick"
	DC "22222"
	DC "Sara"
	DC "11111"
	DC "Nick"
	DC "33333"
	DD 0
	
	#add x8, x0, x0 # index

c1: 	DC "search:"
c2:	DC " "
s1: 	DC "Enter a phone or a name"
s2:	DC "Not found"

	ld x28, c1(x0) # "search:"
	ld x29, c2(x0) # " "
	addi x30, x0, s1
	addi x31, x0, s2
	

loop_input:		ecall x0, x30, 4 ;info string
		ecall x6, x28, 8 ; string input
		jal x0, loop_search

loop_search:		ld x9, dir(x8)
		beq x6, x9, found
		beq x9, x0, end_loop
		addi x8, x8, 8
		beq x0, x0, loop_search

found:
	addi x16, x0, 8
	addi x17, x0, 24
	addi x18, x0, 40
	addi x19, x0, 56
	beq x8, x16, get_name
	beq x8, x17, get_name
	beq x8, x18, get_name
	beq x8, x19, get_name
# 0, 8, 16, 24, 32, 40, 48, 56
	addi x20, x0, 0
	addi x21, x0, 16
	addi x22, x0, 32
	addi x23, x0, 48
	
	
get_number:		ecall x1, x9, 3
		ecall x1, x29, 3
		addi x8, x8, 8
		ld x11, dir(x8)
		ecall x0, x11, 3
		#addi x8, x0, 0
		jal x0, loop_search

get_name: 		ecall x1, x9, 3
		ecall x1, x29, 3
		addi x8, x8, -8
		ld x11, dir(x8)
		ecall x0, x11, 3
		addi x8, x8, 16
		jal x0, loop_search

end_loop:	#ecall x0, x31, 4 ;info string error
	addi x8, x0, 0
	jal x0, loop_input