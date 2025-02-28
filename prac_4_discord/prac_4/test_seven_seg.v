`timescale 1ns / 1ps

module test_seven_seg;

reg clk;
initial clk = 0;
always #5 clk <= ~clk;

localparam AN_COUNT = 8;
localparam CATH_COUNT = 7;

localparam DIGIT_SIZE = 4;
localparam DIGIT_COUNT = 16;

reg CE, RESET;
reg [AN_COUNT*DIGIT_SIZE-1:0] NUMBER;
reg [AN_COUNT-1:0] AN_MASK; 
initial 
begin
    CE = 1;
    RESET = 0;
    NUMBER = {(AN_COUNT*DIGIT_SIZE){1'b0}};
end

wire [AN_COUNT-1:0] AN; 
wire [CATH_COUNT-1:0] CATH; 

seven_seg uut (
	.clk(clk),
	.CE(1),
	.RESET(RESET),
	.NUMBER(NUMBER),
	.AN_MASK(AN_MASK),
	.AN(AN),
	.CATH(CATH)
);

initial
begin
    test_seven_segments(8'b00101100);
    test_show_stats();
end

function [6:0] get_cath_mask;
    input [3:0] number;
begin
	case (number)
        4'h0:  get_cath_mask = 7'b1000000;
        4'h1:  get_cath_mask = 7'b1111001;
        4'h2:  get_cath_mask = 7'b0100100;
        4'h3:  get_cath_mask = 7'b0110000;
        4'h4:  get_cath_mask = 7'b0011001;
        4'h5:  get_cath_mask = 7'b0010010;
        4'h6:  get_cath_mask = 7'b0000010;
        4'h7:  get_cath_mask = 7'b1111000;
        4'h8:  get_cath_mask = 7'b0000000;
        4'h9:  get_cath_mask = 7'b0010000;
        4'ha:  get_cath_mask = 7'b0001000;
        4'hb:  get_cath_mask = 7'b0000011;
        4'hc:  get_cath_mask = 7'b1000110;
        4'hd:  get_cath_mask = 7'b0100001;
        4'he:  get_cath_mask = 7'b0000110;
        4'hf:  get_cath_mask = 7'b0001110;
     default:  get_cath_mask = 7'b1111111;
	endcase
end	
endfunction

function [7:0] get_an_mask;
    input [2:0] an_number;
begin    
	case (an_number)
			3'd0: get_an_mask = 8'b11111110;
			3'd1: get_an_mask = 8'b11111101;
			3'd2: get_an_mask = 8'b11111011;
			3'd3: get_an_mask = 8'b11110111;
			3'd4: get_an_mask = 8'b11101111;
			3'd5: get_an_mask = 8'b11011111;
			3'd6: get_an_mask = 8'b10111111;
			3'd7: get_an_mask = 8'b01111111;
		 default: get_an_mask = 8'b11111111;
	endcase
end
endfunction

reg [AN_COUNT-1:0] test_an_register; 
reg [DIGIT_COUNT-1:0] test_digit_register;
reg test_an_mask_register;

task test_seven_segments;
    input [AN_COUNT-1:0] mask_value;
reg [3:0] i;
reg [3:0] number; 

begin     
    $display("\n[%0t]: Тест отображения цифр на индикаторах, принципа работы динамической индикации и анодной маски.", $time);
    test_an_register = {AN_COUNT{1'b1}};
    test_digit_register = {DIGIT_COUNT{1'b1}};
    test_an_mask_register = 1'b1;
    
    AN_MASK = mask_value;
    $display("Битовая маска (AN_MASK): %b", AN_MASK);
    
    wait(uut.digit_counter == AN_COUNT-1);
    @(posedge clk);
    
    number = 0;
    repeat(DIGIT_COUNT)
    begin
        // Подача числа на входную шину
        for (i = 0; i < AN_COUNT; i = i + 1)
            NUMBER[ ((i+1)*4)-1 -: 4 ] <= number;
        
        @(posedge clk);
        $display("\n[%0t]: Тест для цифры: %h", $time, number);
        for (i = 0; i < AN_COUNT; i = i + 1)
        begin
            $display("Текущий анод: %d", i);
            
            test_digit_register[number] <= CATH == get_cath_mask(number);
            $display("Ожидаемые сигналы на линии катодов (CATH): %b", get_cath_mask(number));
            $display("Фактические сигналы на линии катодов (CATH): %b", CATH);
            
            test_an_register[number] <= uut.AN_REG == get_an_mask(i);
            $display("Ожидаемые сигналы на линии анодов (ДО применения анодной маски): %b", get_an_mask(i));
            $display("Фактические сигналы на линии анодов (ДО применения анодной маски): %b", uut.AN_REG);

            test_an_mask_register <= AN == (get_an_mask(i) | AN_MASK);
            $display("Ожидаемые сигналы на линии анодов (ПОСЛЕ применения анодной маски): %b", get_an_mask(i) | AN_MASK);
            $display("Фактические сигналы на линии анодов (ПОСЛЕ применения анодной маски): %b", AN);
            
            if (i != AN_COUNT-1) 
                @(posedge clk);           
        end  
        number = number + 1;        
    end       
end
endtask

task test_show_stats;
localparam TEST_COUNT = 3;
integer test_counter, i;
begin
    test_counter = 0;
    $display("\n[%0t]: Результаты тестирования:", $time);
    // Отображение цифры
    if (&(test_digit_register))
    begin
        $display("1. Тест на отображение пройден успешно для всех возможных вариантов цифр.");
        test_counter = test_counter + 1;
    end
    else begin      
        $display("1. Тест на отображение цифр НЕ пройден"); 
        for (i = 0; i < DIGIT_COUNT; i = i + 1)
            if (!test_digit_register[i])
                $display("Ошибка отображения цифры %d", i); 
    end              
    // Динамическая индикация        
    if (&(test_an_register))
    begin
        test_counter = test_counter + 1;
        $display("2. Тест работы динамической индикации пройден успешно.");
    end
    else begin   
        $display("2. Тест работы динамической индикации НЕ пройден.", i);   
        for (i = 0; i < AN_COUNT; i = i + 1)
            if (!test_an_register[i])
                $display("Ошибка на индикаторе %0d.", i);       
    end    
    // Анодная маска          
    if (test_an_mask_register)
    begin
        $display("3. Тест анодной маски пройден успешно.");     
        test_counter = test_counter + 1;
    end
    else
        $display("3. Тест анодной маски НЕ пройден."); 
        
    $display("Пройдено тестов: %0d/%0d.", test_counter, TEST_COUNT);         
end
endtask

endmodule
