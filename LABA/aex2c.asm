addi x6, x0, 1
slli x6, x6, 44

addi x7, x0, 2
slli x7, x7, 40

addi x8, x0, 4
slli x8, x8, 36

add x5, x6, x7
add x5, x5, x8

#Adding 1, 2, and 4 at their specific spots manually (adding and shifting) -- hexadecimal, each hexadecimal digit is 4 binary digits.