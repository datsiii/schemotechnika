`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 14:30:32
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_file #(
    data_width = 32,
    addr_width = 4,
    reg_file_size = 9
)(
    input clk, wen, reset,
    input [addr_width - 1 : 0] addr_r_a, addr_r_b,
    input [data_width - 1 : 0] w_data,
    input [addr_width - 1 : 0] w_addr,
    output reg [data_width - 1 : 0] out_a, out_b
    );
    
    reg [data_width - 1 : 0] POH [0 : reg_file_size - 1];
    
    integer i;
    initial
    begin
        for(i = 0; i < reg_file_size; i = i + 1)
            begin
                POH[i] = {data_width{1'b0}};
            end
       POH[1] = {{(data_width-1){1'b0}},1'b1};            
    end
    
    always@(posedge clk)
    begin
        if(reset)
        begin
            for(i = 2; i < reg_file_size; i = i + 1)
            begin
                POH[i] = {data_width{1'b0}};
            end
        end
        else
        begin
            if(wen && w_addr != {addr_width{1'b0}}&& w_addr != {{(addr_width-1){1'b0}},1'b1})
               POH[w_addr] <= w_data;
        end
    end
    
    always@(posedge clk)
    begin
    if(reset)
    begin
        out_a <= {data_width{1'b0}};
        out_b <= {data_width{1'b0}};
    end
    else
        out_a <= POH[addr_r_a];
        out_b <= POH[addr_r_b];
    end
    
    
endmodule
