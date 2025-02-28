`timescale 1ns / 1ps

module top(
    input clk,
    input button,
    input [3:0] SW,
    output [7:0] AN,
    output [6:0] CAT
    );

reg CLOCK_ENABLE = 0;
wire button_out, button_out_enable;
FILTER #(
.size(8)
) button_filter
(
    .CLK(clk),
    .CLOCK_ENABLE(1),
    .IN_SIGNAL(button),
    .OUT_SIGNAL(button_out),
    .OUT_SIGNAL_ENABLE(button_out_enable)
);


reg [31:0] shift_register;
reg [7:0] an_mask;
initial
begin
shift_register = 0;
an_mask <= 8'b11111111;
end
always@(posedge clk)
    if (button_out_enable)
        begin
            shift_register <= {shift_register[27:0], SW};
            an_mask <= {an_mask[6:0], 1'b0};
        end
wire clk_div_out;
clk_div  #(.size(10)) clk_div (
    .clk(clk),
    .clk_div(clk_div_out)
);


SevenSegmentLED seg(
    .clk(clk_div_out),
    .RESET(1'b0),
    .NUMBER(shift_register),
    .AN_MASK(an_mask),
    .AN(AN),
    .CAT(CAT)
);


endmodule