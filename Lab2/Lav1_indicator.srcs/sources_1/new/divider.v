`timescale 1ns / 1ps

module divider #(DIV = 4)
(
    input iReset,
    input clk,
    output reg clk_d
);

wire [$clog2(DIV) - 1 : 0] cnt;

cnt #(
    .WIDTH($clog2(DIV)),
    .STEP(1),
    .MODULE(DIV)
)
inst_counter
(
    .id(),
    .clk(clk),
    .iReset(iReset),
    .iEn(1'b0),
    .iDir(1'b1),
    .oCount(cnt)
);

initial clk_d <= 0;

always@(clk) begin
    if(iReset)
        clk_d <= 0;
    else if(cnt == (DIV-1))
        clk_d <= ~clk_d;
end

endmodule