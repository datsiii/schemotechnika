module top_2 (
    input wire clk,
    input wire rst_n,
    input wire d,
    input wire [3:0] data,
    input wire [7:0] data1,
    input wire [1:0] addr,
    input wire [1:0] sel,
    input wire [15:0] angle_deg,  
    output reg q,
    output reg [7:0] reg_out,
    output wire [1:0] enc_out,
    output wire [3:0] dec_out,
    output wire y,
    output wire [7:0] bam_out    
);

    wire q_wire;
    wire [7:0] reg_out_wire;

    d_ff_reg_encoder d_ff_reg_encoder_inst (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .data(data),
        .q(q_wire),                 
        .reg_out(reg_out_wire),    
        .enc_out(enc_out)
    );

    reg_mux_decoder reg_mux_decoder_inst (
        .clk(clk),
        .rst_n(rst_n),
        .data(data1),
        .addr(addr),
        .sel(sel),
        .reg_out(reg_out_wire),     
        .dec_out(dec_out),
        .y(y)
    );


    angle_to_bam angle_to_bam_inst (
        .angle_deg(angle_deg),
        .bam_out(bam_out)
    );

  
    always @(posedge clk) begin
        if (!rst_n) begin
            q <= 1'b0;
            reg_out <= 8'b0;
        end else begin
            q <= q_wire;            
            reg_out <= reg_out_wire; 
        end
    end
endmodule
