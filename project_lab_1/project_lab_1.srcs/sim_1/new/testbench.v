`timescale 1ns / 1ps

module testbench();
reg clk = 0;
reg [3:0] switch = 4'b0000;
wire [7:0] anodes;
wire [6:0] cathodes;
reg button = 0;

main main_test(.clk(clk), .button(button), .SW(switch), .AN(anodes), .CAT(cathodes));

initial
    begin
        //1
        switch = 4'b0001;
        button = 1'b1;
        repeat(2**8)
            @(posedge clk); 
        button = 1'b0;
        repeat(2**8)
            @(posedge clk);
        
        //2
        switch = 4'b0010;
        button = 1'b1;
        repeat(2**8)
            @(posedge clk); 
        button = 1'b0;
        repeat(2**8)
            @(posedge clk);
        
        //3
        switch = 4'b0011;
        button = 1'b1;
        repeat(2**8)
            @(posedge clk); 
        button = 1'b0;
        repeat(2**8)
            @(posedge clk);
        
        //4
        switch = 4'b0100;
        button = 1'b1;
        repeat(2**8)
            @(posedge clk); 
        button = 1'b0;
        repeat(2**8)
            @(posedge clk);
            
        //5
        switch = 4'b0101;
        button = 1'b1;
        repeat(2**8)
            @(posedge clk); 
        button = 1'b0;
        repeat(2**8)
            @(posedge clk);
            
        //6
        switch = 4'b0110;
        button = 1'b1;
        repeat(2**8)
            @(posedge clk); 
        button = 1'b0;
        repeat(2**8)
            @(posedge clk);
        
        //7
        switch = 4'b0111;
        button = 1'b1;
        repeat(2**8)
            @(posedge clk); 
        button = 1'b0;
        repeat(2**8)
            @(posedge clk);
            
        //8
        switch = 4'b1000;
        button = 1'b1;
        repeat(2**8)
            @(posedge clk); 
        button = 1'b0;
        repeat(2**8)
            @(posedge clk);
    end

always #1 clk = ~clk;
endmodule