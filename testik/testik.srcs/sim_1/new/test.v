`timescale 1ns / 1ps
module test;

localparam pi = 3.14159265;

`include "maklaren.v"

reg [63:0] real_sin_out, real_sin_res_bit;
real real_sin_i, real_sin_res;
wire [10:0] real_sin_exp = real_sin_res_bit[62 -:11];
initial
begin
    real_sin_i = 0;
    while(1)
    begin
        real_sin_res = real_sin(real_sin_i);
        real_sin_res_bit = $realtobits(real_sin_res);
        real_sin_out = $rtoi(real_sin(real_sin_i) * 2.0**(real_sin_exp - 1023 + 15));
        
        #10;
        real_sin_i = real_sin_i + pi/180;
    end
end

reg [63:0] real_cos_out, real_cos_res_bit;
real real_cos_i, real_cos_res;
wire [10:0] real_cos_exp = real_cos_res_bit[62 -:11];
initial
begin
    real_cos_i = 0;
    while(1)
    begin
        real_cos_res = real_cos(real_cos_i);
        real_cos_res_bit = $realtobits(real_cos_res);
        real_cos_out = $rtoi(real_cos(real_cos_i) * 2.0**(real_cos_exp - 1023 + 15));
        
        #10;
        real_cos_i = real_cos_i + pi/180;
    end
end


reg [63:0] i;
initial i = 64'b0;
reg [31:0] cordic_angle;
reg [9:0] table_angle;

always
begin
    cordic_angle = ((1 << 32) * i) / 360;
    table_angle = ((1 << 10) * i) / 360;
    #10;
    i = i+1;
end

reg clk = 0;
always #5 clk = ~clk;

localparam TABLE_VALUE_WIDTH = 33;
localparam TABLE_ANGLE_WIDTH = 10;

wire [TABLE_VALUE_WIDTH-1:0] trig_table_sin;
wire [TABLE_VALUE_WIDTH-1:0] trig_table_cos;

trig_table #(
    .VALUE_WIDTH(TABLE_VALUE_WIDTH),
    .ANGLE_WIDTH(TABLE_ANGLE_WIDTH)
) uut(
    .angle_in(table_angle),
    .sin_out(trig_table_sin),
    .cos_out(trig_table_cos) 
);

//-------------

wire [16:0] Xout, Yout, cos_cordic, sin_cordic;
reg [15:0] Xin, Yin;

initial
begin
    Xin = 32000 / 1.647;
    Yin = 0;
end

cordic uut1(
    .clk(clk), .angle(cordic_angle), .Yin(Yin), .Xin(Xin),
    .COS_OUT(Xout), .SIN_OUT(Yout)
);
assign cos_cordic = Xout;
assign sin_cordic = Yout;


// ip cordic
wire ip_valid_out;
wire [31:0] sin_ip_out, cos_ip_out;
reg [31:0] ip_cordic_angle;
real r_ip_cordic_angle;

initial
begin
    ip_cordic_angle = 0;
    r_ip_cordic_angle = 0;
    
    @(posedge clk)
    while(1)
    begin
        @(posedge clk)
        r_ip_cordic_angle = r_ip_cordic_angle + 3.14159265/180;
        if (r_ip_cordic_angle > 3.14159265)
            r_ip_cordic_angle = - 3.14159265;
        r_ip_cordic_angle = $rtoi(r_ip_cordic_angle * (2 **29));
    end
    
end

cordic_0 u_ip(
    .s_axis_phase_tdata(ip_cordic_angle),
    .s_axis_phase_tvalid(1'b1),
    .aclk(clk),
    .m_axis_dout_tvalid(ip_valid_out),
    .m_axis_dout_tdata({sin_ip_out, cos_ip_out})
);
endmodule
