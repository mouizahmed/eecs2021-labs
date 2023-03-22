module labl;

reg cin, ok;
reg [31:0] a, b;
reg[31:0] expect;
wire [31:0] z;
wire cout;
integer i, j, k;

yAdder adder[31:0](z, cout, a, b, cin);

initial

begin


			repeat(10)
			begin
			a = $random;
			b = $random;
			cin = 0;
			ok = 0;
			expect = a + b + cin;
			
			#1;
			if (expect === z) begin
				ok = 1;
				$display("PASS: a=%b b=%b cin=%b z=%b cout=%b ok=%b", a, b, cin, z, cout, ok);
			end
			else
				$display("FAIL: a=%b b=%b cin=%b z=%b cout=%b ok=%b", a, b, cin, z, cout, ok);
			end

$finish;

end

endmodule
