`timescale 1ns / 1ps

module test_fsm;

reg clk, R_I, reset;
reg [15:0] dataIn;
wire [239:0] dataOut;
wire R_O;
wire R_E;

fsm fsm1(
    .clk(clk),
    .reset(reset),
    .R_I(R_I),
    .dataIn(dataIn),
    .dataOut(dataOut),
    .R_O(R_O),
    .R_E(R_E)
);

always #10 clk <= ~clk;


task inputTask;
    input [15:0] number;
begin

    @(negedge clk)
    R_I = 1;
    dataIn = number;
    @(negedge clk)
    R_I = 0;
    
end
endtask

task resetTask;
begin

    @(negedge clk)
    reset = 1;
    @(negedge clk)
    reset = 0;
    
end
endtask


task inputExampleBase;
begin
    #100
    
    inputTask(16'b0000000000001000);
    inputTask(16'b0000000000000101);
    inputTask(16'b0000000000000101);
    inputTask(16'b0000000000000110);
    inputTask(16'b0000000000000010);
    inputTask(16'b0000000000010000);
    inputTask(16'b0000000000000100);
    inputTask(16'b0000000000000000);
    inputTask(16'b0000000000000101);
    
end
endtask


task inputExampleHigherThanMax;
begin
    #100
    
    inputTask(16'b0000000000010001);
    inputTask(16'b0000000000000101);
    inputTask(16'b0000000000000101);
    inputTask(16'b0000000000000110);
    inputTask(16'b0000000000010010);
    inputTask(16'b0000000000010000);
    inputTask(16'b0000000000000100);
    inputTask(16'b0000000000000000);
    inputTask(16'b0000000000011101);
    inputTask(16'b0000000000000101);
    inputTask(16'b0000000000000101);
    inputTask(16'b0000000000000110);
    inputTask(16'b0000000000000010);
    inputTask(16'b0000000000010000);
    inputTask(16'b0000000000000100);
    inputTask(16'b0000000000000000);
    inputTask(16'b0000000000000101);
    inputTask(16'b1111111111111111);
        
end
endtask

task inputExampleEmpty;
begin
    #100
    
    inputTask(16'b0000000000000000);
    inputTask(16'b0000000000000101);
        
end
endtask

initial
begin
    clk = 0;
    R_I = 0;
    reset = 0;
    dataIn = 0;
    
    inputExampleBase();
    
    @(posedge R_O)
    #60
    resetTask();
    inputExampleHigherThanMax();
    
    @(posedge R_O)
    #60
    resetTask();
    inputExampleEmpty();
    
    
    #100
    resetTask();
    
    #50
    
    $stop;
end

endmodule