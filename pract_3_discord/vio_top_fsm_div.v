`timescale 1ns / 1ps

module vio_top_fsm_div(
    input clk,
    output [7:0] AN,
	output [6:0] CATH,
	output valid_out_LED
);

wire btn_c_in, btn_reset_in;
wire [3:0] SW;
vio_0 vio (
    .clk(clk),
    .probe_in0(AN),
    .probe_in1(CATH),
    .probe_in2(valid_out_LED),
    .probe_out0(btn_c_in),
    .probe_out1(btn_reset_in),
    .probe_out2(SW)
);
    
top_fsm_div uut (
	.clk(clk),
	.btn_c_in(btn_c_in),
	.btn_reset_in(btn_reset_in),
	.SW(SW),
	.AN(AN),
	.CATH(CATH),
	.valid_out_LED(valid_out_LED)
);
    
endmodule
