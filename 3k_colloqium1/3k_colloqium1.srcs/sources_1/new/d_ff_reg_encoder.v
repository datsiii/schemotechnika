module d_ff_reg_encoder (
    input wire clk,
    input wire rst_n,
    input wire d,
    input wire [3:0] data,
    output reg q,
    output reg [7:0] reg_out,
    output wire [1:0] enc_out
);
    reg [1:0] encoded_data;


    always @(posedge clk) begin
        if (!rst_n)
            q <= 1'b0;
        else
            q <= d;
    end


    always @(posedge clk) begin
        if (!rst_n)
            reg_out <= 8'b0;
        else
            reg_out <= {reg_out[6:0], d};
    end


    always @(*) begin
        case (data)
            4'b1000: encoded_data = 2'b11;
            4'b0100: encoded_data = 2'b10;
            4'b0010: encoded_data = 2'b01;
            4'b0001: encoded_data = 2'b00;
            default: encoded_data = 2'b00;
        endcase
    end
    assign enc_out = encoded_data;
endmodule
