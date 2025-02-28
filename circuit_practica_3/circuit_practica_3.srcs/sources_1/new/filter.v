`timescale 1ns / 1ps


module filter#(parameter size = 5) (
    input clk, clock_enable_in, btn_in,
    output reg btn_out, clock_enable_out
    );
    
reg [1:0] in_signal;
reg [size-1:0] counter;
initial
    begin
        in_signal = 0; 
        counter = 0;
        btn_out = 0; 
        clock_enable_out = 0;
    end
always @(posedge clk)
    begin
        in_signal <= {in_signal[0], btn_in};
        counter <= (in_signal[1] ~^ btn_out) ? 0 : (clock_enable_in ? counter + 1 : counter);
        if (&(counter) & clock_enable_in)
            btn_out <= in_signal[1];
        clock_enable_out <= &(counter) & clock_enable_in & in_signal[1];
    end
endmodule
