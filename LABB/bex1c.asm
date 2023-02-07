a:	DD 0xAAAABBBBCCCCDDDD
b:	DD 0x4444333322221111
ORG 0x00000
c:	DM 8

	
	ld x5, a(x0)
	ld x6, b(x0)
	add x7, x5, x6 # a+b
	sub x8, x5, x6 # a-b
	sub x9, x6, x5 # b-a
	and x10, x5, x6 # a AND b
	or x11, x5, x6 # a or b
	xor x12, x5, x6 # a XOR b
	xori x13, x5, -1 # not a
	xori x14, x6, -1 # not b

	addi x16, x0, c
	sd x7, 0(x16)