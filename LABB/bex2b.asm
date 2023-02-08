# Mouiz Ahmed 218105536

src: 	DD 121, 33, -5, 242, -45, -12, 0
	add x6, x0, x0
	ld x5, src(x6) # assume smallest
	ld x8, src(x6) # initial number

loop: 	ld x7, src(x6)
	beq x7, x0, end
	bge x7, x5, skip
	blt x7, x5, swap

swap:	ld x5, src(x6) # new smallest
	add x9, x0, x6 # smallest index
	addi x6, x6, 8
	beq x0, x0, loop

skip: 	
	addi 	x6, x6, 8
	beq x0, x0, loop

end: 	sd x5, src(x0) # set to initial
	sd x8, src(x9) # swap
	ebreak x0, x0, 0
