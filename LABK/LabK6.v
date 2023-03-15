module labK;

reg a, b, c;
wire z, bcOut, notCOut, notCIn, aNotCOut;

not my_not_c(notCOut, c);
and my_and_anc(aNotCOut, notCIn, a);
and my_and(bcOut, b, c);
or my_or(z, bcOut, aNotCOut);

assign notCIn = notCOut;

initial
begin
	a = 1; b = 0; c = 0;
	#1 $display("a=%b b=%b c=%b z=%b", a, b, c, z);

end

endmodule
