module reg_mux_decoder (
    input wire clk,
    input wire rst_n,
    input wire [7:0] data,
    input wire [1:0] addr,
    input wire [1:0] sel,
    output reg [7:0] reg_out,
    output wire [3:0] dec_out,
    output wire y
);

    always @(posedge clk) begin
        if (!rst_n)
            reg_out <= 8'b0;
        else
            reg_out <= data;
    end


    assign dec_out = 4'b0001 << addr;


    assign y = (sel == 2'b00) ? reg_out[0] :
               (sel == 2'b01) ? reg_out[1] :
               (sel == 2'b10) ? reg_out[2] :
               reg_out[3];
endmodule
