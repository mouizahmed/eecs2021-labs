module labK;

reg a, b, cin, flag;
reg[1:0] expect;
integer i, j, k;
wire z, cout, ab_xor, ab_and, abc_and; 
xor my_xor1 (ab_xor, a, b);
and my_and1 (ab_and, a, b);
xor my_xor2 (z, ab_xor, cin);
and my_and2 (abc_and, ab_xor, cin);
or my_or (cout, abc_and, ab_and);

initial begin
    // flag = $value$plusargs("a=%b", a);
    // if (!flag) 
    //     $display("Warning: 'a' does not have a value.");

    // flag = $value$plusargs("b=%b", b);
    // if (!flag) 
    //     $display("Warning: 'b' does not have a value.");

    // flag = $value$plusargs("cin=%b", cin);
    // if (!flag) 
    //     $display("Warning: 'cin' does not have a value.");

    // #1 
    // $display("a=%b b=%b cin=%b z=%b, cout=%b", a, b, cin, z, cout);
    
    for (i = 0; i < 2; i = i + 1) begin
        for (j = 0; j < 2; j = j + 1) begin
            for (k = 0; k < 2; k = k + 1) begin
                a = i; b = j; cin = k;
                expect = a + b + cin;
                #1
                if (expect[0] === z && expect[1] === cout)
                    $display("PASS: a=%b b=%b cin=%b z=%b, cout=%b", a, b, cin, z, cout);
                else
                    $display("FAIL: a=%b b=%b cin=%b z=%b, cout=%b", a, b, cin, z, cout);
                
            end
        end
    end

    $finish;
end

endmodule