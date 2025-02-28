`timescale 1ns / 1ps


module reg_file #(
   data_width = 32,
   addr_width = 4,
   reg_file_size = 9
   )(
    input clk, wen, reset,
    input [addr_width - 1 : 0] addr_r_a, addr_r_b,
    input [addr_width - 1 : 0] w_data,
    input [addr_width - 1 : 0] w_addr,
    output reg [data_width - 1 : 0] out_a, out_b
    );
    
    reg [data_width - 1 : 0] POH [0 : reg_file_size - 1];
    integer i;
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
            if(wen && w_addr != {addr_width{1'b0}} && w_addr != {{(addr_width-1){1'b0}},1'b1})
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
        begin
            out_a <= {POH[addr_r_a]};
            out_b <= {POH[addr_r_b]};
        end
    end
    
endmodule
