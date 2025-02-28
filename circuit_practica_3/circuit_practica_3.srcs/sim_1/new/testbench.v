`timescale 1ns / 1ps


module testbench();
reg clk = 0;
reg [3:0] DATA_IN;
reg R_I = 0, reset = 0;
wire R_0 = 0;
wire [3:0] res;
top top(.clk(clk), .R_I(R_I), .R_O(R_O), .reset(reset), .res(res), .DATA_IN(DATA_IN));
initial begin
    DATA_IN = 4'h7; 
    #2
    @(posedge clk); 
    R_I = 1'b1;  
    #1
    R_I = 1'b0;
    DATA_IN = 4'h1; 
    #2
    @(posedge clk); 
    R_I = 1'b1;  
    #1
    R_I = 1'b0;
    DATA_IN = 4'h0; 
    #2
    @(posedge clk); 
    R_I = 1'b1;  
    #1
    R_I = 1'b0;
    DATA_IN = 4'h0; 
    #2
    @(posedge clk); 
    R_I = 1'b1;  
    #1
    R_I = 1'b0;
    @(posedge R_O); #50
    reset = 1; 
    #5
    reset = 0;
end
always #1 clk = ~clk;
endmodule
