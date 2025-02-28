`timescale 1ns / 1ps
module comsbh(
    input signed [7:0] a, signed [7:0] b, signed [7:0] c, signed [7:0] d,
    output signed [8:0] res
    );
    assign res = a << b << c + d;
endmodule