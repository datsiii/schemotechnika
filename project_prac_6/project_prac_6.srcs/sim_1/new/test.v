`timescale 1ns / 1ps

module test;
 
 reg clk = 0;
 always #5 clk <= ~clk;
 
 wire [5:0] clk_pll;
 wire [6:0] clk_mmcm;
 
top uut(
    .clk(clk),
    .clk_pll(clk_pll),
    .clk_mmcm(clk_mmcm)
 );
    
endmodule