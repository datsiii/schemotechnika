module clk_div 
#(
    DIV_COUNT = 10000   
) 
(
	input clk,
	output reg clk_div
);

reg [$clog2(DIV_COUNT)-1:0] clk_counter; // счётчик тактов для делителя
initial 
begin
    clk_counter = {DIV_COUNT{1'b0}};
    clk_div = 0;
end
	
always@ (posedge clk) 
begin
    if (clk_counter == 0)
        clk_div <= 1;
    else
        clk_div <= 0;
end

always@ (posedge clk) 
begin
	if (clk_counter == (DIV_COUNT-1))
        clk_counter <= 0;
	else
        clk_counter <= clk_counter + 1;
end

endmodule