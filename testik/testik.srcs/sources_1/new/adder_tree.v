`timescale 1ns / 1ps
module adder_tree
#(
    SIZE = 32 
)
(
    input clk,
    input [SIZE-1:0] a,
    input [SIZE-1:0] b,
    output [SIZE:0] q
);

genvar i, j;
generate
begin
    for (i = 0; i < SIZE; i = i + 1)
        begin: add
            reg [SIZE-1-i:0] s;
            reg [SIZE-1-i:0] c;
        end
    reg [SIZE-1-2:0] c_grand;
    for (i = 0; i < SIZE; i = i + 1)
    begin
        for (j = 0; j < SIZE-i; j = j + 1)
        begin
            if (i == 0)
                always@(posedge clk)
                    { add[i].c[j], add[i].s[j] } <= a[j] + b[j];
            else
                always@(posedge clk)
                    { add[i].c[j], add[i].s[j] } <= add[i-1].c[j] + add[i-1].s[j+1];
        end
        
        if (i == 2)
            always@(posedge clk)
            c_grand[0] <= add[0].c[SIZE-i-1] + add[1].c[SIZE-i-1];
        else if (i > 2)
            always@(posedge clk)
                c_grand[i-2] <= c_grand[i-3] + add[i-1].c[SIZE-i-1];
        
        
    end
    for (i = 0; i < SIZE; i = i + 1)
        begin
            assign q[i] = add[i].s[0];
        end
        
        assign q[SIZE-1] = c_grand[SIZE-2-1];


end
endgenerate 
endmodule
