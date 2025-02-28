`timescale 1ns / 1ps

module clk_div #(parameter size = 1)(
    input clk,
    output reg clk_div
);

reg [size - 1:0] counter;
initial 
begin
    clk_div = 0;
    counter = 0;
end

always@(posedge clk)
begin
    clk_div = |(counter) ? clk_div : ~clk_div;
    counter = counter + 1;
end
endmodule