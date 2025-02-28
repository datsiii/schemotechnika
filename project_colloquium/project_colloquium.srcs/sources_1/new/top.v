`timescale 1ns / 1ps

module top(
input clk, 
    input reset,
    input signed [0:3] data_in,
    input R_I,
    output signed [0:3] data_out,
    output reg R_O
    );
    
reg [4:0]state;
reg lreset;
reg lR_I;
reg signed [0:9] a;
reg signed [0:9] b;
reg cnt;
reg signed [0:3] result;

assign data_out = result;

initial begin
    result = 0;
    state = 0;
    lreset = 0;
    cnt = 0;
end

always @(posedge reset) begin
    lreset <= 1;
end


always @(posedge R_I) begin
    lR_I <= 1;
end

always @(posedge clk)begin
    case(state) 
        0: begin
            if (lreset == 1) begin
                state <= 1;
                lreset <= 0;
            end else if (lR_I == 1) begin
                state <= 2;
                lR_I <= 0;
            end
        end
        
        1: begin
            a <= 0;
            b <= 0;
            state <= 0;
            cnt <= 0;
        end
        
        2: begin 
            if (cnt == 0) begin
                a <= data_in;
                cnt <= 1;
                state <= 0;
            end
            else begin
                b <= data_in;
                state <= 3;
            end
        end
        
        3: begin
           if (a>b) begin
                result <= b;
                R_O <= 1;
                state <= 0;
            end else begin
                result <= a;
                R_O <= 1;
                state <= 0;
            end
          
        end
    endcase

end

endmodule

