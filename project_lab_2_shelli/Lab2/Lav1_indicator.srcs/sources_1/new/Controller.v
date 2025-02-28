module Controller(
    input clk,
//    input reset,
    input [15:0] SWITCHES,
//    input R_I,
    input btn_c, //  нопка ввода и вывода
    output [6:0] SEG,
    output [7:0] AN,
    output [15:0] dataOut
);

    wire f_btn_c;
    filter #(3) d_btn_c(
        .CLK(clk),
        .CLOCK_ENABLE(1'b1),
        .IN_SIGNAL(btn_c),
        .OUT_SIGNAL(f_btn_c),
        .OUT_SIGNAL_ENABLE()
    );
 

    wire [15:0] dataOut;
    wire R_O;
    reg d_R_I, d_reset = 0;
    wire [15:0] dataIn;
    fsm #(16) fsm1 (
        .clk(clk),
        .reset(d_reset),
        .R_I(d_R_I),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .R_O(R_O)
    );
    
    wire clk_div_out;
    clk_div clk_div1 (
        .clk(clk),
        .clk_div(clk_div_out)
    );

    reg [31:0] NUMBERS;
    reg [7:0] MASK;
    SevenSegmentLED sevenSegment (
        .clk(clk_div_out),
        .RESET(reset),
        .NUMBER(NUMBERS), 
        .AN_MASK(MASK), 
        .AN(AN),
        .SEG(SEG)
    );
    
    reg [3:0] state;
    reg btn_in;
    reg array_size;
    reg already_n;
    reg wait_fsm;
    
    initial begin
        btn_in = 0;
        already_n = 0;
        array_size = 0;
        wait_fsm = 0;
        MASK = 8'b00000000;
    end
    always @(posedge f_btn_c) begin
        btn_in = 1;
    end
    
    integer i = 0;
    assign dataIn = {SWITCHES};
    
    always @(posedge clk) begin
    if(R_O) 
    begin
        NUMBERS <= {dataOut};
    end
    else begin
        NUMBERS <=  {SWITCHES};
    end
     case(state)
        0: begin
            if(wait_fsm)
            begin
                state <= 15;
            end
            else if(btn_in)
            begin
                btn_in <= 0;
                state <= 1;
            end
            
        end
        1: begin
            if(already_n == 0)
            begin
                state <= 2;
            end
            else begin
                state <= 10;
            end
        end
        2: begin
            array_size <= {SWITCHES};
            already_n <= 1;
            state <= 0;
            i <= 0;
        end
        10: begin
            if(i < array_size)
            begin
                d_R_I <= 1;
                state <= 11;
            end
            else begin
                state <= 15;
                wait_fsm = 1;
            end
        end
        11: begin
            i = i + 1;
            state <= 0;
        end
        15: begin
            if(R_O)
            begin
                
            end
            else begin
            state <= 0;
            end
        end
    endcase
end


endmodule
