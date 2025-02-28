`timescale 1ns / 1ps

module test_fsm;

reg clk, R_I, reset;
reg [15:0] dataIn;
wire [15:0] dataOut;
wire R_O;

fsm #(16) fsm1 (
    .clk(clk),
    .reset(reset),
    .R_I(R_I),
    .dataIn(dataIn),
    .dataOut(dataOut),
    .R_O(R_O)
);

always #10 clk = ~clk;

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

initial begin
    clk = 0;
    R_I = 0;
    reset = 0;
    dataIn = 0;
    
    // ��������� �����
    resetTask();
    
    // ������ ������ �������
    inputTask(16'b0000000000001000); // 8

    // ������ �������� �������
    inputTask(16'b0000000000000011); // 3
    inputTask(16'b0000000000000010); // 2
    inputTask(16'b0000000000000001); // 1
    inputTask(16'b0000000000000001); // 1
    inputTask(16'b0000000000000011); // 3
    inputTask(16'b0000000000000010); // 2
    inputTask(16'b0000000000000001); // 1
    inputTask(16'b0000000000000000); // 0
    
    // ������� ���������� ���������� � ������ ������
    @(posedge R_O);

    // ��������� ��������������� ��������
    repeat (8) begin
        @(negedge clk);
        if (R_O) begin
            $display("Output: %d", dataOut);
            @(negedge clk);
            R_I = 1;
            @(negedge clk);
            R_I = 0;
        end
    end
    
    // ��������� ��������� �����
    resetTask();
    
    #50;
    
    $stop;
end

endmodule
