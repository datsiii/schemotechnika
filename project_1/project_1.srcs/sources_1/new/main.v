module main(
    input [1:0] a,b,
    input clk,
    output reg[2:0] c
    );
always@(posedge reg)
    c = a + b;
endmodule