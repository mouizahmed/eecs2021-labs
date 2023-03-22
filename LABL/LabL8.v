module labl;

reg cin, ctrl, ok;
reg signed [31:0] a, b;
reg signed [31:0] expect;
wire [31:0] z;
wire cout;
integer i, j, k;

yArith adder[31:0](z, cout, a, b, ctrl);

initial

begin


			repeat(10)
			begin
			a = $random;
			b = $random;
			ctrl = $random % 2;
			cin = 0;
			ok = 0;
			
			
			if (ctrl === 1) 
				expect = a + ~b + 1;	
			else
				expect = a + b + cin;	


			#1;
			if (expect === z) begin
				ok = 1;
				$display("PASS: a=%b b=%b cin=%b z=%b ctrl=%b ok=%b", a, b, cin, z, ctrl, ok);
			end
			else
				$display("FAIL: a=%b b=%b cin=%b z=%b ctrl=%b ok=%b", a, b, cin, z, ctrl, ok);
			end

$finish;

end

endmodule
