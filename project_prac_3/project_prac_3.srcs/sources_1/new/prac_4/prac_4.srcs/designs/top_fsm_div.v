module top_fsm_div (
	input clk,
	input btn_c_in,
	input btn_reset_in,
	input [3:0] SW,
	
	output [7:0] AN,
	output [6:0] CATH,
	output valid_out_LED
);

	
wire btn_c_out;
FILTER #(4) btn_c_filter(
	.CLK(clk),
	.CLOCK_ENABLE(1),
	.IN_SIGNAL(btn_c_in),
	.OUT_SIGNAL_ENABLE(btn_c_out)
);
	
wire btn_reset_out;
FILTER #(4) btn_reset_filter(
	.CLK(clk),
	.CLOCK_ENABLE(1),
	.IN_SIGNAL(~btn_reset_in),
	.OUT_SIGNAL_ENABLE(btn_reset_out)
);	

wire fsm_valid_out, fsm_error_out;

wire [3:0] fsm_d_out;
reg  [3:0] fsm_d_out_reg;  
reg  fsm_valid_out_reg, fsm_error_out_reg;
assign valid_out_LED = fsm_valid_out_reg;
initial 
begin    
    fsm_d_out_reg <= 0;
    fsm_valid_out_reg <= 0;
    fsm_error_out_reg <= 0;
end
      
always@(posedge clk)
begin
    if (fsm_valid_out)
        begin
            fsm_d_out_reg <= fsm_d_out;
            fsm_valid_out_reg <= fsm_valid_out;
            fsm_error_out_reg <= fsm_error_out;
        end
    else if (btn_c_out && fsm_valid_out_reg)    
        begin
            fsm_d_out_reg <= 0;
            fsm_valid_out_reg <= 0;
            fsm_error_out_reg <= 0;
        end    
end
    
wire fsm_valid_in = btn_c_out && !fsm_valid_out_reg;    

fsm_div fsm(
	.clk(clk),
	.valid_in(fsm_valid_in),
	.reset(btn_reset_out),
	.valid_out(fsm_valid_out),
	.d_in(SW),
	.d_out(fsm_d_out),
	.error_out(fsm_error_out)
);

wire clk_div_out;
clk_div clk_div1 (
	.clk(clk),
	.clk_div(clk_div_out)
);

seven_seg seg(
	.clk(clk),
	.CE(clk_div_out),
	.RESET(btn_reset_out),
	.NUMBER({fsm_d_out_reg, 8'd0, 3'd0, fsm_error_out_reg, 12'd0, SW}),
	.AN_MASK(8'b01101110),
	.AN(AN),
	.CATH(CATH)
);

endmodule
