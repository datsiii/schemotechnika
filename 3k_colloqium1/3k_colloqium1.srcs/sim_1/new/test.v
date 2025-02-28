module top_2_tb;
    reg clk, rst_n, d;
    reg [3:0] data;
    reg [7:0] data1;
    reg [1:0] addr, sel;
    reg [15:0] angle_deg;
    wire q, y;
    wire [7:0] reg_out, bam_out;
    wire [1:0] enc_out;
    wire [3:0] dec_out;

    top_2 uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .data(data),
        .data1(data1),
        .addr(addr),
        .sel(sel),
        .angle_deg(angle_deg),
        .q(q),
        .reg_out(reg_out),
        .enc_out(enc_out),
        .dec_out(dec_out),
        .y(y),
        .bam_out(bam_out)
    );

    always #5 clk = ~clk;

    initial begin
    rst_n = 0;
    clk = 0;
    d = 0;  
    data = 4'b0000; 
    data1 = 8'b00000000;
    addr = 2'b00;
    sel = 2'b00;

    #10 rst_n = 1;  
    angle_deg = 16'd90;  
    data = 4'b1010;  
    #20; 

    $finish;
end

endmodule