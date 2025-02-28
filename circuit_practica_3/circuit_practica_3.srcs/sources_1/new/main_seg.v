`timescale 1ns / 1ps

module seg_test(
    input clk,
    input btn_c,
    input [3:0] DATA_IN,
    output [7:0] AN,
    output [6:0] SEG
);
reg CLOCK_ENABLE = 0;

wire btn_c_out, btn_c_out_enable;
filter #(
    .size(10)) 
    
btn_c_filter(
    .CLK(clk),
    .CLOCK_ENABLE(1),
    .IN_SIGNAL(btn_c),
    .OUT_SIGNAL(btn_c_out),
    .OUT_SIGNAL_ENABLE(btn_c_out_enable));
    
reg [31:0] shift_register;
reg [7:0] an_mask;
initial
begin
    shift_register = 0;
    an_mask <= 8'b11111111;
end
always@(posedge clk)
    if (btn_c_out_enable)
        begin
            shift_register <= {shift_register[27:0], DATA_IN};
            an_mask <= {an_mask[6:0], 1'b0};
        end
        
wire clk_div_out;
clk_div #(.size(10)) clk_div1 (
    .clk(clk),
    .clk_div(clk_div_out)
);
seven_seg_led seg(
    .clk(clk_div_out),
    .RESET(1'b0),
    .NUMBER(shift_register),
    .AN_MASK(an_mask),
    .AN(AN),
    .SEG(SEG)
);

endmodule