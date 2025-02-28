`timescale 1ns / 1ps

module test;

reg clk = 0;
always #5 clk <= ~clk;

reg reset = 0;
wire [1:0] stage;

cpu uut(
    .clk(clk), 
    .reset(reset),
    .stage(stage)
);

initial
begin
    reset = 1;
    @(posedge clk);
    @(posedge clk);
    reset = 0;
end


endmodule
