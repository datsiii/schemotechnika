`timescale 1ns / 1ps


module main(

    input [31:0] a, b, c, d,
    input clk,
    output [31:0] out
    
);
    reg [31:0] ff1, ff2, ff3, ff4, ffout;
    assign out = ffout;

always @(posedge clk) begin
        ff1 <= a;
        ff2 <= b;
        ff3 <= c;
        ff4 <= d;
        ffout <= ff1 / ff2 - ff3 - ff4;
end

endmodule
