`timescale 1ns / 1ps

module test_bench;

reg clk = 0;
always #5 clk <= ~clk;

reg reset = 0;

cpu_pipeline uut(
    .clk(clk), 
    .reset(reset)
);

initial
begin
    reset = 1;
    @(posedge clk);
    @(posedge clk);
    reset = 0;
end


endmodule

