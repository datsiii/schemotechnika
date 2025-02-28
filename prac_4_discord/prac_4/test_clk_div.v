`timescale 1ns / 1ns

module test_clk_div;

reg clk;
initial clk = 0;
always #5 clk <= ~clk;

wire clk_div_out;
clk_div clk_div1 (
	.clk(clk),
	.clk_div(clk_div_out)
);
integer clk_div_period = 100_000;
realtime t_begin, t_end;
initial
begin
    @(posedge clk_div_out);
    t_begin = $realtime;
    @(posedge clk_div_out);
    t_end = $realtime;
    
    $display("Ожидаемый период сигнала: %0d", clk_div_period);
    $write("Фактический период сигнала: ");
    $write((t_end - t_begin));
    
    if ( (t_end - t_begin) == clk_div_period )
        $display("\nТест пройден.");
    else 
        $display("\nТест НЕ пройден."); 
end
    
endmodule
