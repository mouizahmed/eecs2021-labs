module labK;
reg [31:0] x; // a 32-bit register

reg[0:0] one;
reg[0:1] two;
reg[0:2] three;

initial
begin
	$display("time = %5d, x = %b", $time, x);

	x = 32'hffff0000;
	$display("time = %5d, x = %b", $time, x);

	x = x + 2;
	$display("time = %5d, x = %b", $time, x);

	one = &x; // and reduction
	two = x[1:0]; // part-select
	three = {one, two}; // concatenate

	$display("one = %b", one);
	$display("one = %b", two);
	$display("one = %b", three);

	$finish;
end

endmodule 
