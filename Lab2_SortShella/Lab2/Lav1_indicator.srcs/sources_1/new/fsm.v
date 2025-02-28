module fsm #(MAX = 16)(
    input [15:0] dataIn,
    input R_I,
    input reset,
    input clk,
    output [MAX * 16 - 1:0] dataOut,
    output reg R_O,
    output reg R_E
    );
    
localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;

reg[2:0] state = S0;

reg[15:0] array_size = 0;

reg[15:0] temp;
reg[15:0] array[0:MAX-1];
reg[3:0] already_input = 0;

integer s = 0, i = 0, j = 0, position = 0;

always@(posedge clk)
begin
    if (reset)
    begin
        s <= 0;
        i <= 0;
        j <= 0;
        R_O <= 0;
        R_E <= 0;
        position <= 0;
        state <= S0;
        array_size <= 0;
		
		for(i = 0; i < MAX; i = i + 1)
			array[i] = 0;
    end
    else
    begin
        case(state)
                S0: //Узнаём у пользователя сколько значений
                begin
                    R_O <= 0;
                    R_E = 0;
                
                    if (R_I)
                    begin
                        state <= S1;
                        
                        if ( dataIn > MAX )
                        begin
                            R_E = 1;
                            array_size <= MAX;
                        end  
                        else
                            array_size <= dataIn;
                    end
					
                    for(i = 0; i < MAX; i = i + 1)
                            array[i] = 0;
                end
                
                S1: //Вводим значения 
                begin
                    if(position < array_size)
                    begin
                        if (R_I)
                        begin
                            array[position] <= dataIn;
                            position = position + 1;
                        end
                    end
                    else
                        begin
                            state <= S2;
                            s <= array_size / 2;
                        end    
                end
                
                S2: //Сортируем и выводим
                begin
                    if (s > 0)
                    begin
                        i = s;
                        state = S3;
                    end
                    else
                    begin
                        R_O = 1;
                    end
                end
                
                S3:
                begin
                    if (i < array_size)
                    begin
                        j = i - s;
                        state = S4;
                    end
                    else 
                    begin
                        s = s / 2;
                        state = S2;
                    end
                end
                
                S4:
                begin
                    if (j >= 0 && array[j] > array[j+s])
                    begin
                        array[j] <= array[j+s];
                        array[j+s] <= array[j];
                        j = j - s;
                    end
                    else
                    begin
                        i = i + 1;
                        state = S3;
                    end
                end
                
                default:
                begin
                end
        endcase
        
    end
end


genvar k;
generate
    for (k = 0; k < 16; k = k + 1)
    begin
        assign dataOut[((k+1)*16-1)-:16] = array[k];
    end
endgenerate


endmodule
