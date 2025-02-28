`timescale 1ns / 1ps

module testbench;


reg[15:0] SWITCHES = 0;
reg clk = 0;
reg btn_in = 0;
reg btn_l = 0;
reg btn_r = 0;
reg reset = 0;
wire DONE;
wire ERR;
wire[7:0] AN;
wire[6:0] SEG;

Controller#(
    .DIV(4),
    .MODULE(4)
    ) cntlr(
    .SWITCHES(SWITCHES),
    .btn_in(btn_in),
    .btn_r(btn_r),
    .btn_l(btn_l),
    .clk(clk),
    .RESET(reset),
    .R_E(ERR),
    .R_O(DONE),
    .AN(AN),
    .SEG(SEG));


task confirm;
begin
    
    #500;    
    repeat($urandom_range(70,0))
    begin
        btn_in = $random;
        #3;
    end
    btn_in = 1;
    #500;
    
    repeat($urandom_range(70,0))
    begin
        btn_in = $random;
        #3;
    end
    btn_in = 0;
    
end
endtask


task push_left;
begin
    
    #500;    
    repeat($urandom_range(70,0))
    begin
        btn_l = $random;
        #3;
    end
    btn_l = 1;
    #500;
    
    repeat($urandom_range(70,0))
    begin
        btn_l = $random;
        #3;
    end
    btn_l = 0;
    
end
endtask


task push_right;
begin
    
    #500;    
    repeat($urandom_range(70,0))
    begin
        btn_r = $random;
        #3;
    end
    btn_r = 1;
    #500;
    
    repeat($urandom_range(70,0))
    begin
        btn_r = $random;
        #3;
    end
    btn_r = 0;
    
end
endtask


task inputTask;
    input [15:0] sw;
begin
    #500;
    
    SWITCHES = sw;
    repeat($urandom_range(70,0))
    begin
        btn_in = $random;
        #3;
    end
    btn_in = 1;
    #500;
    
    repeat($urandom_range(70,0))
    begin
        btn_in = $random;
        #3;
    end
    btn_in = 0;
    
end
endtask


task resetTask;
begin
    #800;
    
    repeat($urandom_range(70,0))
    begin
        reset = $random;
        #3;
    end
    reset = 1;
    
    #500;
    
    repeat($urandom_range(70,0))
    begin
        reset = $random;
        #3;
    end
    
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
    
    SWITCHES = 0;
    
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
    
    SWITCHES = 0;
    
end
endtask

task inputExampleEmpty;
begin
    #100
    
    inputTask(16'b0000000000000000);
    inputTask(16'b0000000000000101);
    
    SWITCHES = 0;
    
end
endtask


always #10 clk = ~clk;

initial
begin
    #100
    $srandom(34000);
    
    inputExampleBase();
    
    #100
    
    push_right();
    push_right();
    push_right();
    push_right();
    push_right();
    push_right();
    push_right();
    push_right();
    push_right();
    push_left();
    push_left();
    push_left();
    push_left();

    #2000
    
    resetTask();
    
    #200
    
    inputExampleEmpty();
    
    #100
    
    push_left();
    push_left();
    push_left();
    push_left();
    push_right();
    push_right();
    
    #2000
    
    resetTask();
    
    #400
    
    inputExampleHigherThanMax();
    
    #100
    
    push_left();
    push_left();
    push_left();
    push_left();
    push_right();
    push_right();
    
    #2000
    
    resetTask();
    
    #400
    $stop;
end

endmodule
