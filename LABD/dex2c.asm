fc1:	DF 1.0
fc2:	DF 2.0
#fc3:	DF 0.0001

s0:	DC "a="
s1:	DC "precision="
s2:	DC "square root="
	
	fld f1, fc1(x0)
	fld f31, fc2(x0)
	#fld f30, fc3(x0) ; precision
	fadd.d f3, f0, f0 ; left
	addi x13, x0, 1 ; constant 1
	addi x5, x0, s0
	ecall x1, x5, 4 ; out enter a
	ecall f2, x0, 6 ; inp a float
	addi x7, x0, s1 
	ecall x1, x7, 4 ; out enter precision
	ecall f30, x0, 6 ; inp precision float
	flt.d x31, f1, f2
	beq x31, x13, upper
	flt.d x11, f2, f1
	beq x11, x0, lower

lower:	fadd.d f4, f0, f1 ; right = 1 (a < 1)
	beq x0, x0, loop
	

upper:	fadd.d f4, f0, f2 ; right = a (a > 1)
	beq x0, x0, loop

loop:	fsub.d f10, f4, f3 ; right - left
	flt.d x28, f10, f30 ; (right - left) < precision
	beq x28, x13, done
	#calculate mid 
	fadd.d f5, f3, f4 ; left + right
	fdiv.d f5, f5, f31 ; (left + right) / 2 -- mid
	
	fmul.d f28, f5, f5 ; mid * mid
	flt.d x26, f28, f2
	beq x26, x13, left
	beq x0, x0, right		
	
left:	fadd.d f3, f0, f5
	beq x0, x0, loop

right:	fadd.d f4, f0, f5
	beq x0, x0, loop
	
done:	fadd.d f14, f3, f4 ; left + right
	fdiv.d f14, f14, f31 ; (left + right) / 2.0
	addi x8, x0, s2
	ecall x1, x8, 4
	ecall x1, f14, 1
	
	
