`timescale 1ns / 1ps

module top(
    input clk,
    output [5:0] clk_pll,
    output [6:0] clk_mmcm
    );
    
wire mmcm_locked;    
clk_wiz_0 mmcm(
    .clk_in1(clk),
    .clk_out1(clk_mmcm[0]),
    .clk_out2(clk_mmcm[1]),
    .clk_out3(clk_mmcm[2]),
    .clk_out4(clk_mmcm[3]),
    .clk_out5(clk_mmcm[4]),
    .clk_out6(clk_mmcm[5]),
    .clk_out7(clk_mmcm[6]),
    .locked(mmcm_locked)
);

wire pll_locked;    
clk_wiz_1 pll(
    .clk_in1(clk),
    .clk_out1(clk_pll[0]),
    .clk_out2(clk_pll[1]),
    .clk_out3(clk_pll[2]),
    .clk_out4(clk_pll[3]),
    .clk_out5(clk_pll[4]),
    .clk_out6(clk_pll[5]),
    .locked(pll_locked)
);    
    
endmodule
