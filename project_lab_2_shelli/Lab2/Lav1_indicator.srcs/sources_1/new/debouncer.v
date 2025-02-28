`timescale 1ns / 1ps


module debouncer #(
    MODULE = 4
)
(
    input clk,
    input in_signal,
    input CLOCK_ENABLE,
    output out_signal,
    output out_signal_enable
);
 
wire sync_out;   
 
sync sync_(
    .clk(clk),
    .in(in_signal),
    .out(sync_out)
);

wire[MODULE - 1:0] count;

cnt #(
    .MODULE((1 << MODULE)), 
    .STEP(1)
    ) 
cnter(
    .id(),
    .clk(clk),
    .iReset(out_signal ~^ sync_out),
    .iEn(1'b0),
    .iDir(1'b1),
    .oCount(count)
);

reg OUT_SIGNAL_reg = 0;
reg OUT_SIGNAL_ENABLE_reg = 0;

always@(posedge clk)
begin
    if (&(count) & CLOCK_ENABLE)
        OUT_SIGNAL_reg <= sync_out;
    OUT_SIGNAL_ENABLE_reg <= &(count) & sync_out & CLOCK_ENABLE;
end

assign out_signal = OUT_SIGNAL_reg;
assign out_signal_enable = OUT_SIGNAL_ENABLE_reg;

endmodule

