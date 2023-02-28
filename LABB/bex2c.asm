vector1: DD 1, 5, -7, 23, -5
vector2: DD 3, -2, 4, 11, -7

	add x6, x0, x0 
	addi x28, x0, 40 # max index is 40 
	addi x9, x0, 0 # starting index of new
	
loop:	beq x6, x28, end
	ld x7, vector1(x6) # vector1
	ld x8, vector2(x6) # vector2
	
	add x10, x7, x8 # sum of two indexes
	beq x0, x0, store

store: 	sd x10, dst(x9)
	addi x9, x9, 8
	addi x6, x6, 8
	beq x0, x0, loop

end: ebreak x0, x0, 0


dst: DM 5