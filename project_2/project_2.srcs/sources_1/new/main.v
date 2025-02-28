`timescale 1ns / 1ps
module combsh(
    input [31:0] a, [31:0] b, [31:0] c, [31:0] d,
    output [32:0] res
    );
    assign res = a << b << c + d;
endmodule
