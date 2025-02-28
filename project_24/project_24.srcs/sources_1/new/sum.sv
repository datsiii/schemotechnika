`timescale 1ns / 1ps

module sum(
    input clk,
    input [7:0] a, b,
    output logic [8:0] c
    );
    
    always_ff @(posedge clk)
        c <= a + b;
    
endmodule
