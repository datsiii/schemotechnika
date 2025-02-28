`timescale 1ns / 1ps

module main(
    input clk, a, 
    output out
    );
    
reg ff1, ff2;
assign out = ff2;

always@ (posedge clk)
begin
    ff1 <= a;
    ff2 <= ~ff1;
end
endmodule
