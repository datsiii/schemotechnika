`timescale 1ns / 1ps

module sync(
    input clk,
    input in,
    output out
    );
    
reg t1 = 0;
reg t2 = 0;

assign out = t2;

always@(posedge clk) begin
    t2 <= t1;
    t1 <= in;
end
    
endmodule
