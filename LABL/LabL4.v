module labl;

reg [31:0] a0, a1, a2, a3, zLo, zHi, expect;
reg [1:0] c;
integer i, j, k;
wire [31:0] z;
yMux4to1 #(.SIZE(32)) mux[31:0](z, a0, a1, a2, a3, c);

initial

begin
	
	repeat(500)
	begin	
	a0 = $random;
	a1 = $random;
	a2 = $random;
	a3 = $random;
	c = $random % 4;
	
		
	for (i = 0; i < 32; i = i+1)
	begin	
		zLo[i] = (a0[i] & ~c[0]) + (a1[i] & c[0]);
		zHi[i] = (a2[i] & ~c[0]) + (a3[i] & c[0]);
		expect[i] = (zLo[i] & ~c[1]) + (zHi[i] & c[1]);
	end
			
	#1
	if (z !== expect) 
		$display("FAIL a0=%b a1=%b a2=%b a3=%b", a0, a1, a2, a3);	
				
		
	end
	$finish;
	
	end

endmodule
