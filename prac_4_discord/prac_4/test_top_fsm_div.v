`timescale 1ns / 1ps

module test_top_fsm_div;

localparam CLK_PERIOD = 10;
reg clk;
initial clk = 0;
always #(CLK_PERIOD/2) clk <= ~clk;

localparam CLK_DIV_PERIOD = 100_000;
reg clk_div;
initial 
begin
    clk_div = 0;
    
    @(posedge clk);
    forever begin
        clk_div <= 1;
        #(CLK_PERIOD);
        clk_div <= 0;
        #(CLK_DIV_PERIOD - CLK_PERIOD);
    end
end

reg signed [3:0] SW;
initial SW = 0;
reg btn_c_in;
initial btn_c_in = 0;
reg btn_reset_in;
initial btn_reset_in = 1;

wire [7:0] AN;
wire [6:0] CATH;
wire valid_out_LED;

top_fsm_div uut (
	.clk(clk),
	.btn_c_in(btn_c_in),
	.btn_reset_in(btn_reset_in),
	.SW(SW),
	.AN(AN),
	.CATH(CATH),
	.valid_out_LED(valid_out_LED)
);

localparam TEST_COUNT = 2;
integer i;
reg [7:0] test_register [0:TEST_COUNT-1];
initial 
begin
    for (i = 0; i < TEST_COUNT; i = i + 1)
        test_register[i] = 8'b0;

    @(posedge clk);
    test_top_1(test_register[0]);
    test_top_2(test_register[1]);
    test_stats();
end    

task test_stats;
integer i, j;
reg [1:0] test_counter;
begin        
    test_counter = 0;
    $display("\n[%0t]: Результаты тестирования:", $time);
    
    for (i = 0; i < TEST_COUNT; i = i + 1)
    begin
        if (&(test_register[i]))
        begin
            $display("Сценарий %0d пройден успешно.", i+1);
            test_counter = test_counter + 1;
        end
        else begin      
            $display("Сценарий %0d НЕ пройден.", i+1); 
            for (j = 0; j < 8; j = j + 1)
                if (!test_register[i][j])
                    $display("Ошибка на шаге %0d", j + 1); 
            end        
    end  
    $display("Пройдено сценариев: %0d/%0d", test_counter, TEST_COUNT); 
end
endtask

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


task test_top_1;
    output reg [7:0] test_register;
begin
    $display("\nСценарий 1. Деление на ноль (негативный сценарий)");
    test_script(
        .a(4'h3), .b(4'h0), 
        .res_expected(0), 
        .error_expected(1), 
        .test_register(test_register)
    );       
end
endtask


task test_top_2;
    output reg [7:0] test_register;
begin
    $display("\nСценарий 2. Деление двух чисел (позитивный сценарий)");
    test_script(
        .a(4'h6), .b(4'h3), 
        .res_expected(4'h2), 
        .error_expected(0), 
        .test_register(test_register)
    ); 
end
endtask

localparam PRESS = 1, RELEASE = 0;
localparam op_an_number = 0, op_an_count = 1;
localparam err_an_number = 4, err_an_count = 1;
localparam res_an_number = 7, res_an_count = 1;
task test_script;
    input [3:0] a, b, res_expected;
    input error_expected;
    output reg [7:0] test_register;  
reg test_result;      
reg [3:0] res_real;
reg error_real;
begin      
    // Ввод первого числа
    @(posedge clk);
    SW = a;
    btn_c(PRESS, 32);
    btn_c(RELEASE, 32);
    
    $display("\n1) Проверка ввода первого числа.");
    test_segs(op_an_number, op_an_count, a, test_result);
    test_register[0] = test_result;
    
    // Ввод второго числа
    @(posedge clk);
    SW = b;
    btn_c(PRESS, 32);
    btn_c(RELEASE, 32);
    
    $display("\n2) Проверка ввода второго числа.");
    test_segs(op_an_number, op_an_count, b, test_result);
    test_register[1] = test_result;
    
    $display("\n3) Проверка наличия сигнала готовности выходных данных на светодиоде.");
    if (valid_out_LED)
       $display("Сигнал готовности выходных данных присутствует на шине valid_out_LED"); 
    else
       $display("Сигнал готовности выходных данных отсутствует на шине valid_out_LED");
    test_register[2] = valid_out_LED;
  
    $display("\n4) Проверка вывода результата на индикаторах.");
    if (error_expected) begin
        $display("Результат не учитывается при ненулевой ошибке");
        test_register[3] = 1;
    end
    else begin
        test_segs(res_an_number, res_an_count, res_expected, test_result);
        test_register[3] = test_result;
    end
        
    $display("\n5) Проверка вывода ошибки на индикаторах.");
    test_segs(err_an_number, err_an_count, error_expected, test_result);
    test_register[4] = test_result;
    
    // Подтверждение обработки вывода
    btn_c(PRESS, 32);
    btn_c(RELEASE, 32);
    
    $display("\n6) Проверка сброса сигнала готовности выходных данных на светодиоде.");
    if (valid_out_LED)
       $display("Сигнал готовности выходных данных присутствует на шине valid_out_LED"); 
    else
       $display("Сигнал готовности выходных данных отсутствует на шине valid_out_LED");
    test_register[5] = valid_out_LED == 0;
    
    $display("\n7) Проверка сброса результата на индикаторах.");
    test_segs(res_an_number, res_an_count, 0, test_result); 
    test_register[6] = test_result;
    
    $display("\n8) Проверка сброса ошибки на индикаторах.");
    test_segs(err_an_number, err_an_count, 0, test_result);
    test_register[7] = test_result;
end
endtask


task btn_c;  
    input signal_in;
    input [6:0] ticks;
begin
    @(posedge clk); 
    btn_c_in <= signal_in;
    $display("\n[%0t]: Сигнал %b подан на линию btn_c_in.", $time, signal_in);
    
    repeat(ticks + 2)
        @(posedge clk);  
    
    btn_c_in <= 0;
    $display("[%0t]: Сигнал %b убран с линии btn_c_in, подан сигнал 0", $time, signal_in);
end
endtask

task btn_reset;  
    input signal_in;
    input [6:0] ticks;
begin
    @(posedge clk); 
    btn_reset_in <= signal_in;
    $display("\n[%0t]: Сигнал %b подан на линию btn_reset_in.", $time, signal_in);
    
    repeat(ticks + 2)
        @(posedge clk);  
    
    btn_reset_in <= 0;
    $display("[%0t]: Сигнал %b убран с линии btn_reset_in, подан сигнал 0", $time, signal_in);
end
endtask


task test_segs;
    input [2:0] an_number;
    input [3:0] an_count;
    input [31:0] value;
    output reg test_result;
reg [3:0] i;
begin
    test_result = 1;
    wait(AN == get_an_mask(an_number));
    $display("\n[%0t] Номер младшего индикатора: %d", $time, an_number);
    $display("Количество индикаторов: %d", an_count);
    $display("Значение: %h", value);
    
    for (i = 0; i < an_count; i = i + 1)
    begin
        @(posedge clk);
        $display("[%0t] Номер индикатора: %0d", $time, an_number + i);
        $display("Ожидаемые сигналы на линии катодов (CATH): %b", get_cath_mask( value[(i+1)*4-1 -: 4]));
        $display("Фактические сигналы на линии катодов (CATH): %b", CATH);
        
        if ( CATH != get_cath_mask( value[(i+1)*4-1 -: 4] ) )
            test_result = 0;
            
        @(posedge clk_div);
        @(posedge clk);
    end    
end
endtask

endmodule


