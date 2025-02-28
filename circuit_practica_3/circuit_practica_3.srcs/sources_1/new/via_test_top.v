`timescale 1ns / 1ps


module via_test_top(
    input clk,
    output [3:0] res,
	output R_O,
	
	input btn_c,
    output [7:0] AN,
    output [6:0] SEG
);

wire R_I, reset;
wire [3:0] DATA_IN;
vio_0 vio (
    .clk(clk),
    .probe_in0(res),
    .probe_in1(R_O),
    .probe_out0(R_I),
    .probe_out1(reset),
    .probe_out2(DATA_IN)
);

top t(
    .clk(clk),
    .DATA_IN(DATA_IN),
    .R_I(R_I), .reset(reset),
    .res(res),
    .R_O(R_O)
);
    
endmodule
