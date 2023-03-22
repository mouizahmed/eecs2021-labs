module yAlu(z, ex, a, b, op);
input [31:0] a, b;
input [2:0] op;
wire [31:0] alu_and, alu_or, alu_arith, slt, tmp;
wire cout, condition;
wire [15:0] z16;
wire [7:0] z8;
wire [3:0] z4;
wire [1:0] z2;
wire z1, z0;
output [31:0] z;
output ex;
assign slt[31:1] = 0; // not supported
//assign ex = 0; // not supported
// instantiate the components and connect them
// Hint: about 4 lines of code

or or16[15:0] (z16, z[15:0], z[31:16]);
or or8[7:0] (z8, z16[7:0], z16[15:8]);
or or4[3:0] (z4, z8[3:0], z8[7:4]);
or or2[1:0] (z2, z4[1:0], z4[3:2]);
or or1[15:0] (z1, z2[1], z2[0]);
not zero_not(z0, z1);
assign ex = z0;




xor m_xor(condition, a[31], b[31]);
yArith my_arith2(tmp, cout, a, b, 1'b1);
yMux #(.SIZE(1)) slt_mux(slt[0], tmp[31], a[31], condition);



and my_and[31:0](alu_and, a, b);
or my_or[31:0](alu_or, a, b);
yArith my_arith(alu_arith, cout, a, b, op[2]);
yMux4to1 #(.SIZE(32)) mux(z, alu_and, alu_or, alu_arith, slt, op[1:0]);

endmodule