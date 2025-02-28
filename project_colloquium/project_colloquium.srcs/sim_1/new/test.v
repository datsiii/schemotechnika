`timescale 1ns / 1ps

module test;

reg start;
reg clk = 0;
always #5 clk <= ~clk;

reg clk;
reg reset;
reg signed [0:3] data_in;
reg R_I;
wire signed [0:3] data_out;
wire R_O;

top lfsm(
    .clk(clk), 
    .reset(reset),
    .data_in(data_in),
    .R_I(R_I),
    .data_out(data_out),
    .R_O(R_O)
    );

initial begin
start = 1;
reset = 0;
end
always @(posedge start)begin
    #20
    data_in = 3'b0111; //7
    R_I = 1;
    #10 R_I = 0;
    #10
    data_in = 3'b0011; //3
    R_I = 1;
    #10 R_I = 0;
    
    
end
endmodule
