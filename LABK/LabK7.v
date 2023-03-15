module labK;

reg a, b, c, flag;
wire z, bcOut, notCOut, notCIn, aNotCOut;

not my_not_c(notCOut, c);
and my_and_anc(aNotCOut, notCIn, a);
and my_and(bcOut, b, c);
or my_or(z, bcOut, aNotCOut);

assign notCIn = notCOut;

initial
begin
	// a = 1; b = 0; c = 0;
	

    flag = $value$plusargs("a=%b", a);
    if (!flag) 
        $display("Warning: 'a' does not have a value.");

    flag = $value$plusargs("b=%b", b);
    if (!flag) 
        $display("Warning: 'b' does not have a value.");

    flag = $value$plusargs("c=%b", c);
    if (!flag) 
        $display("Warning: 'c' does not have a value.");

    #1 
    $display("a=%b b=%b c=%b z=%b", a, b, c, z);
    $finish;
end

endmodule
