module labK;

reg a, b, c, flag, expect;
integer i, j, k;
wire z, bcOut, notCOut, notCIn, aNotCOut;

not my_not_c(notCOut, c);
and my_and_anc(aNotCOut, notCIn, a);
and my_and(bcOut, b, c);
or my_or(z, bcOut, aNotCOut);

assign notCIn = notCOut;

initial
begin
	// a = 1; b = 0; c = 0;
	

   for (i = 0; i < 2; i = i + 1) begin
        for (j = 0; j < 2; j = j + 1) begin
            for (k = 0; k < 2; k = k + 1) begin
                a = i; b = j; c = k;
                expect = c ? b : a;
                #1
                if (z === expect)
                    $display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
                else
                    $display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
            end
        end
   end


    #1 
    $display("a=%b b=%b c=%b z=%b", a, b, c, z);
    $finish;
end

endmodule
