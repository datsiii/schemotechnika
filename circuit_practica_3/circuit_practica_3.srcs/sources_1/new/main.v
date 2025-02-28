`timescale 1ns / 1ps
module main (
input [3:0] DATA_IN,
input clk, reset, R_I,
output reg [3:0] res,
output reg R_O);
 
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010,
S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

reg [2:0] state;
initial state = 0;

reg [15:0] a_, b_, c_, d_;

always@(posedge clk)
begin
    if (reset)
        state <= S0;
    else
        case(state)
            S0: begin
                a_ <= 0; b_ <= 0; c_ <= 0; d_ <= 0;
                R_O <= 0;
                res <= 0;
                state <= S1;
            end
            S1: if (R_I) begin
                a_ <= DATA_IN;
                state <= S2;
            end
            S2: if (R_I) begin
                b_ <= DATA_IN;
                state <= S3;
            end
            S3: if (R_I) begin
                c_ <= DATA_IN;
                state <= S4;
            end
            S4: if (R_I) begin
                d_ <= DATA_IN;
                state <= S5;
            end
            S5: if (R_I) begin
                res <= a_ * b_ >> c_ - d_;
                R_O <= 1;
                state <= S0;
            end
        endcase
end
endmodule