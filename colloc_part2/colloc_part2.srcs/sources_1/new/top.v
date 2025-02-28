`timescale 1ns / 1ps

module top(
    input clk, reset, btn_valid_in,
    input [31:0] data_in1,
    input [31:0] data_in2,
    output [31:0] data_out
    );
    wire valid_in;

    FILTER #(.size(3)) filter_0(
    .CLK(clk),
    .CLOCK_ENABLE(1'b1),
    .IN_SIGNAL(btn_valid_in),
    .OUT_SIGNAL_ENABLE(valid_in)
    );

    fsm_32bit_data uuu (
    .clk(clk),
    .reset(reset),
    .data_in1(data_in1),
    .data_in2(data_in2),
    .data_out(data_out)
);
endmodule
