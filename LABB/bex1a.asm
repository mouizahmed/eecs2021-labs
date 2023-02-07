c:	DD 1024, 2048, 4096, 8192
	addi x5, x0, c
	ld x6, 0(x5)
	ld x7, 8(x5)
	ld x8, 16(x5)
	ld x9, 24(x5)
	
	add x10, x6, x7
	add x10, x10, x8
	add x10, x10, x9
	
	srli x11, x10, 2
	
	sd x11, c(x11)
	