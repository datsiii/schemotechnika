`timescale 1ns / 1ps

module cnt #(
    WIDTH = 2,
    MODULE = 8,
    STEP = 1
)
(
    input [WIDTH - 1 : 0] id,
    input clk,
    input iReset,
    input iEn,
    input iDir,
    output reg [$clog2(MODULE) - 1 : 0] oCount
);

initial oCount = 0;

always@(posedge clk) begin
    if(iReset)
        oCount = 0;
    else if(iEn)
        oCount = id % MODULE;
    else if(iDir)
        oCount = (oCount + STEP) % MODULE;
    else
        oCount = (oCount - STEP) % MODULE;
end

endmodule
