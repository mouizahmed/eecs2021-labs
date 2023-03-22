module labl;

reg [31:0] a, b, expect;
reg c;
integer i, j, k;
wire [31:0] z;
yMux #(.SIZE(32)) mux[31:0](z, a, b, c);

initial

begin
	
	repeat(500)
	begin	
	a = $random;
	b = $random;
	c = $random % 2;
	
		
	for (i = 0; i < 32; i = i+1)
	begin	
		expect[i] = c ? b[i] : a[i];
	end
			
	#1
	if (z !== expect) 
		$display("FAIL a=%b b=%b c=%b z=%b", a, b, c, z);	
				
		
	end
	$finish;
	
	end

endmodule
