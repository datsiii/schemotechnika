`timescale 1ns / 1ps

module testbench;


reg[15:0] SWITCHES = 0;
reg clk = 0;
reg btn_in = 0;
reg btn_l = 0;
reg btn_r = 0;
reg reset = 0;
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

task inputExample;
begin
    #100
    
    inputTask(16'b0000000000001000);//8
    inputTask(16'b0000000000000101);//5
    inputTask(16'b0000000000000101);//5
    inputTask(16'b0000000000000110);//6
    inputTask(16'b0000000000000010);//2
    inputTask(16'b0000000000010000);//16
    inputTask(16'b0000000000000100);//4
    inputTask(16'b0000000000000000);//0
    inputTask(16'b0000000000000101);//5
    
    SWITCHES = 0;
    
end
endtask


always #10 clk = ~clk;

initial
begin
    #100
    $srandom(34000);
    
    inputExample();
    
    #100
    
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
    
    inputExample();
    
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
