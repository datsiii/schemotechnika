`timescale 1ns / 1ps

module top(
    input clk,
    input [3:0] DATA_IN,
    input R_I, reset,
    output [3:0] res,
    output R_O
    );
    
reg clock_enable = 0;
always @(posedge clk)
    clock_enable <= ~clock_enable;
wire btn_out_R_I, btn_out_enable_R_I, btn_out_RESET, btn_out_enable_RESET;
filter #(.size(7)) filterRI(
    .clk(clk),
    .clock_enable_in(clock_enable),
    .btn_in(R_I),
    .btn_out(btn_out_R_I),
    .clock_enable_out(btn_out_enable_R_I)
    );
filter #(.size(7)) filterRESET(
    .clk(clk),
    .clock_enable_in(clock_enable),
    .btn_in(reset),
    .btn_out(btn_out_RESET),
    .clock_enable_out(btn_out_enable_RESET)
    );

wire btn_c_out;
FILTER #(4) btn_c_filter(
	.CLK(clk),
	.CLOCK_ENABLE(1),
	.IN_SIGNAL(btn_c_in),
	.OUT_SIGNAL_ENABLE(btn_c_out)
);

main main(
    .DATA_IN(DATA_IN),
    .clk(clk), 
    .R_I(R_I), .reset(reset), 
    .res(res),
    .R_O(R_O));
 
wire clk_div_out;
clk_div clk_div1 (
    .clk(clk),
    .clk_div(clk_div_out)
);

seven_seg_led seg (
    .clk(clk_div_out),
    .NUMBER(shift_register),
    .AN_MASK(an_mask),
    .AN(AN),
    .SEG(SEG)
);

endmodule
