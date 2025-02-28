`timescale 1ns / 1ps
//projet 8, tr_proj
module SevenSegmentLED(
    input [7:0] AN_MASK,
    input [31:0] NUMBER,
    input clk,
    input clk_enable,
    input RESET,
    output [7:0] AN,
    output reg[6:0] SEG);
    
reg[2:0] digit_counter_reg = 0;

always@(posedge clk)
begin
    if (RESET == 1)
        digit_counter_reg = 0;
    else if (clk_enable == 1)
            digit_counter_reg = digit_counter_reg + 3'b1;
end

reg [7:0] AN_REG = 0;
assign AN = AN_REG | AN_MASK;

wire [3:0] NUMBER_SPLITTER[0:7];

genvar i;
generate
    for (i = 0; i < 8; i = i + 1)
    begin
//        assign NUMBER_SPLITTER[i] = NUMBER[0+i*4] + NUMBER[i*4+1]*2 + NUMBER[i*4+2]*4 + NUMBER[i*4+3]*8;
        assign NUMBER_SPLITTER[i] = NUMBER[((i+1)*4-1)-:4];
    end
endgenerate

always @(digit_counter_reg)
begin
    case (NUMBER_SPLITTER[digit_counter_reg])
        4'h0: SEG <= 7'b1000000;
        4'h1: SEG <= 7'b1111001;
        4'h2: SEG <= 7'b0100100;
        4'h3: SEG <= 7'b0110000;
        4'h4: SEG <= 7'b0011001;
        4'h5: SEG <= 7'b0010010;
        4'h6: SEG <= 7'b0000010;
        4'h7: SEG <= 7'b1111000;
        4'h8: SEG <= 7'b0000000;
        4'h9: SEG <= 7'b0010000;
        4'ha: SEG <= 7'b0001000;
        4'hb: SEG <= 7'b0000011;
        4'hc: SEG <= 7'b1000110;
        4'hd: SEG <= 7'b0100001;
        4'he: SEG <= 7'b0000110;
        4'hf: SEG <= 7'b0001110;
        default: SEG = 7'b1111111;
    endcase
    AN_REG = ~(8'b1 << digit_counter_reg);
end

 
endmodule
