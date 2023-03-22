module labL;
reg signed [31:0] a, b;
reg signed [31:0] expect;
reg [1*8:1] operation;
reg [2:0] op;
wire ex;
wire [31:0] z;
reg ok, flag, tmp;
yAlu mine(z, ex, a, b, op);
initial
begin
    repeat (10)
    begin
    a = $random;
    b = $random;
    tmp = $random % 2;
    if (tmp == 0) b = a;
    flag = $value$plusargs("op=%d", op);
    // The oracle: compute "expect" based on "op"

    if (op === 3'b000) begin
        expect = a & b;
        operation = "&";
        
    end
    else if (op === 3'b001) begin
        expect = a | b;
        operation = "|";

    end
    else if (op === 3'b010) begin
        expect = a + b;
        operation = "+";

    end
    else if (op === 3'b110) begin
        expect = a - b;
        operation = "-";
    end
    else if (op === 3'b111) begin
        expect = (a < b) ? 1 : 0;
        operation = "<";
    end


    #1;
    // Compare the circuit's output with "expect"
    // and set "ok" accordingly
    // Display ok and the various signals
    ok = (expect === z) ? 1 : 0;
    if (ok) begin
       $display("PASS: a=%b b=%b a%sb=%b", a, b, operation, z); 
    end
    else 
        $display("FAIL: a=%b b=%b a%sb=%b expected=%b", a, b, operation, z, expect);
    end
    $finish;
end
endmodule