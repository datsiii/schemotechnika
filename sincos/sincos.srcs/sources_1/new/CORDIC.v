`timescale 1ns / 1ps
module CORDIC(
    input clk, [31:0] angle, [15:0] Yin, Xin, // угол в BAM*84444
    output [16:0] COS_OUT, SIN_OUT
    );
    wire signed [31:0] atan_table [0:30];
    `include "atan_table.vh"
    
    reg signed [31:0] X [0:31];
    reg signed [31:0] Y [0:31];
    reg signed [31:0] RES_ACC [0:31];
    reg signed[16:0] RES_ACC_add [0:31];
    
    
    wire [1:0] quadrant = angle[31:30];
    
    always@(posedge clk)
    begin
        case(quadrant)
            2'b00, 2'b11:
            begin
                RES_ACC[0] <= angle;
                X[0] <= Xin;
                Y[0] <= Yin;
            end
            2'b01:
            begin
                X[0] <= -Yin;
                Y[0] <= Xin;
                RES_ACC[0] <= {2'b00, angle[29:0]};
            end
            2'b10:
            begin
                X[0] <= Yin;
                Y[0] <= -Xin;
                RES_ACC[0] <= {2'b11, angle[29:0]};
            end
        endcase
    end
genvar i;
generate
for (i = 0; i < 31; i = i + 1)
begin
    wire rotation_sign;
    wire signed [16:0] X_shift, Y_shift;
    
    assign X_shift = X[i] >>> i;
    assign Y_shift = Y[i] >>> i;
    wire [31:0] atan = rotation_sign ? atan_table[i] : -atan_table[i];
    wire [31:0] RES_ACC_result;
    assign rotation_sign = RES_ACC[i][31];
    adder_tree(
            .a(RES_ACC[i]),
            .b(atan[i]),
            .q(RES_ACC_result)
    );
    always@(posedge clk)
    begin
        X[i+1] <= rotation_sign ? X[i] + Y_shift : X[i] - Y_shift;
        Y[i+1] <= rotation_sign ? Y[i] - X_shift : Y[i] + X_shift;
       // RES_ACC[i+1] <= rotation_sign ? RES_ACC[i] + atan_table[i] : RES_ACC[i] - atan_table[i];
        //RES_ACC_add[i] <= RES_ACC[i][15:0] + atan[15:0];
                                                                                                                                           
        RES_ACC[i+1] <= RES_ACC_result;
    end
end
endgenerate 

assign COS_OUT = X[31];
assign SIN_OUT = Y[31];

endmodule
