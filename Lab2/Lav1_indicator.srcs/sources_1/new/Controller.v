`timescale 1ns / 1ps

module Controller#(
    DIV = 2048,
    MODULE = 8
)(
    input [15:0] SWITCHES,
    input btn_in, btn_l, btn_r, clk, RESET,
    output R_E,
    output R_O,
    output [7:0] AN,
    output [6:0] SEG
    );


reg[7:0] AN_MASK = 8'b11111111;
reg[31:0] NUMBER = 0;

localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3;
localparam max_size = 16;

reg[2:0] state = S0; 

wire[max_size * 16 - 1:0] fsmOut;

wire button_signal_en, reset_signal_en, btn_l_signal_en, btn_r_signal_en;  
wire clk_d;

fsm#(.MAX(max_size)) fsm(
    .dataIn(SWITCHES),
    .R_I(button_signal_en),
    .reset(reset_signal_en),
    .clk(clk),
    .dataOut(fsmOut),
    .R_E(R_E),
    .R_O(R_O)
);

SevenSegmentLED led(
    .AN_MASK(AN_MASK),
    .NUMBER(NUMBER),
    .clk(clk_d),
    .clk_enable(1'b1),
    .RESET(reset_signal_en),
    .AN(AN),
    .SEG(SEG));

divider#(.DIV(DIV)) divider(
    .iReset(1'b0),
    .clk(clk),
    .clk_d(clk_d)
);

debouncer#(.MODULE(MODULE)) dbncBtnIn(
    .clk(clk),
    .in_signal(btn_in),
    .CLOCK_ENABLE(1'b1),
    .out_signal(),
    .out_signal_enable(button_signal_en));

debouncer#(.MODULE(MODULE)) dbncReset( 
    .clk(clk),
    .in_signal(RESET),
    .CLOCK_ENABLE(1'b1),
    .out_signal(),
    .out_signal_enable(reset_signal_en));

debouncer#(.MODULE(MODULE)) dbncBtnL( 
    .clk(clk),
    .in_signal(btn_l),
    .CLOCK_ENABLE(1'b1),
    .out_signal(),
    .out_signal_enable(btn_l_signal_en));

debouncer#(.MODULE(MODULE)) dbncBtnR( 
    .clk(clk),
    .in_signal(btn_r),
    .CLOCK_ENABLE(1'b1),
    .out_signal(),
    .out_signal_enable(btn_r_signal_en));

reg[max_size-1:0] array_size = 0;
reg[max_size-1:0] array_counter = 0;

reg[15:0] first = 0;  
reg[15:0] second = 0;  

reg[max_size-1:0]  position = 0;

always@(posedge clk)
begin
    if(reset_signal_en)
    begin
        AN_MASK <= 8'b11111111;
        NUMBER <= 0;
        state <= S0;
        position <= 0;
        array_counter <= 0;
        array_size <= 0;
        first <= 0;
        second <= 0;
    end
    else
    begin
        case(state) //Ввод размерности
            S0:
            begin
                NUMBER <= {NUMBER[31:16], SWITCHES};
                AN_MASK <= 8'b11111100;
                if( button_signal_en )
                begin
                    state <= S1;
                    if (SWITCHES > max_size)
                        array_size <= max_size;
                    else
                        array_size <= SWITCHES;
                end
            end
            
            S1: //Ввод значений
            begin
                
                NUMBER <= {array_counter + 1, SWITCHES};
                AN_MASK <= 0;
                if( !(array_counter < array_size) )
                begin
                    state = S2;
                end
                else
                    if ( button_signal_en )
                        array_counter = array_counter + 1;
                
            end
            
            S2: //Вывод
            begin
            
                AN_MASK <= 0;
                NUMBER <= 0;
                                
                first <= fsmOut >> ( position << 4 );
                second <= fsmOut >> ((position + 1) << 4);
                
                if ( R_O )
                begin
                    NUMBER <= { first , second };
                end
                
                if ( btn_r_signal_en )
                begin
                    if ( position > array_size - 2 )
                        position <= 0;
                    else
                        position <= position + 1;
                end
                
                if ( btn_l_signal_en )
                begin
                    if ( position == 0 )
                        position <= array_size - 1;
                    else
                        position <= (position - 1);
                end
                
            end
            
            default:
            begin
            end

            
        endcase
    end
    
end

endmodule
