`timescale 1ns / 1ps

module fsm_div
(
    input reset,
    input clk,
    input valid_in,
    input [3:0] d_in,
    output reg [3:0] d_out,
    output reg valid_out,
    output reg error_out
);

// Константы ошибок
localparam NO_ERROR = 0, DIV_BY_ZERO = 1;

// Регистры операндов
reg signed [3:0] a_reg, b_reg;

// Состояния конечного автомата
localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3;
reg [1:0] state;
initial state = S0;

always@(posedge clk)
begin
    if (reset)
        state <= S0;
    else        
        case(state)
            // Сброс регистров
            S0: begin
                    a_reg <= 0;
                    b_reg <= 0;
                    d_out <= 0;
                    error_out <= 0;
                    valid_out <= 0;
                    
                    state <= 1;
                end
            
            // Ввод первого операнда (делимого)                
            S1: if (valid_in) 
                    begin
                        a_reg <= d_in;
                        state <= S2;
                    end    
            
            // Ввод второго операнда (делителя) 
            S2: if (valid_in) 
                    begin
                        b_reg <= d_in;
                        state <= S3;
                    end    
            
            // Выполнение операции деления
            S3: begin
                    if (b_reg == 0)
                        begin
                            error_out <= DIV_BY_ZERO;
                            valid_out <= 1;     
                        end
                    else if (a_reg == 0)
                        begin
                            d_out <= 0;
                            valid_out <= 1;   
                        end           
                    else 
                        begin
                            d_out <= a_reg / b_reg;
                            valid_out <= 1;
                        end
                        
                    state <= S0;   
                end             
        endcase
end
   
endmodule
