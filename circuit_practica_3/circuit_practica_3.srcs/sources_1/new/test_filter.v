`timescale 1ns / 1ps


module test_filter;

reg clk;
initial clk = 0;
always #5 clk <= ~clk;

localparam PRESS = 1, RELEASE = 0;
reg R_I; initial R_I = 0;
wire btn_out_enable, btn_out;
filter #(.size(7)) filter(
    .clk(clk),
    .clock_enable_in(1),
    .btn_in(R_I),
    .btn_out(btn_out),
    .clock_enable_out(btn_out_enable)
    );

localparam COUNT_OF_TESTS = 3;
reg [0:COUNT_OF_TESTS-1] test_register;

initial
begin
    test_register = {COUNT_OF_TESTS{1'b0}};

    test_filter_1();
    test_filter_2();
    test_filter_3();
    test_show_stats();
end

task test_filter_1;
reg test_res;
begin
    $display("\n[%0t]: Тест 1. Реакция фильтра дребезга на сигнал высокого уровня на шине физ. манипулятора.", $time);
    $display("[%0t]: (время удержания сигнала соответствует требуемому)", $time); 
    send_signal_to_filter(PRESS, 32);
    @(posedge clk) test_res <= (btn_out_enable == 1'b1); 
    send_signal_to_filter(RELEASE, 32);
    test_info(1, test_res);    
end
endtask

task test_filter_2;
reg test_res;
begin
    $display("\n[%0t]: Тест 2. Реакция фильтра дребезга на сигнал высокого уровня на шине физ. манипулятора.", $time); 
    $display("[%0t]: (время удержания сигнала меньше требуемого)", $time); 
    send_signal_to_filter(PRESS, 16);
    @(posedge clk); test_res = (btn_out_enable == 1'b0);
    test_info(2, test_res);    
end
endtask

task test_filter_3;
reg test_res;
begin
    $display("\n[%0t]: Тест 3. Реакция фильтра дребезга на сигнал низкого уровня на шине физ. манипулятора.", $time);  
    send_signal_to_filter(RELEASE, 32);
    @(posedge clk); test_res = (btn_out_enable == 1'b0);  
    test_info(3, test_res); 
end
endtask

task test_info;
input integer test_num;
input test_res;
begin
    test_register[test_num-1] = test_res;
    if (test_res)
        $display("[%0t]: Тест %0d пройден.", $time, test_num);
    else
        $display("[%0t]: Тест %0d НЕ пройден.", $time, test_num);  
end
endtask

task test_show_stats;
integer i, test_counter;
begin
    $display("\nРезультаты тестирования:");
    test_counter = 0; 
    
    for (i = 0; i < COUNT_OF_TESTS; i = i + 1)
    begin
        if (test_register[i])
            $display("Тест %2d пройден.", i+1);
        else
            $display("Тест %2d НЕ пройден.", i+1);    
        test_counter = test_counter + (test_register[i] ? 1 : 0);
    end
    $display("Пройдено тестов: %0d/%0d", test_counter, COUNT_OF_TESTS);  
end
endtask


task send_signal_to_filter;
    input signal_in;
    input [6:0] ticks;
begin
    @(posedge clk); 
    R_I <= signal_in;
    $display("[%0t]: Сигнал %b подан на линию.", $time, signal_in);
    
    repeat(ticks + 2)
        @(posedge clk);  
    
    R_I <= 0;
    $display("[%0t]: Сигнал %b убран с линии, подан сигнал 0", $time, signal_in);
end
endtask

//task test_filter;
//    input signal_in;
//    input [6:0] ticks;
//    output reg test_result;
//begin
    
//end         
//endtask



task push_c_button;  
begin
    //$display("Дребезг на кнопке C");
    
    $srandom(33985);
	repeat($urandom_range(150,0))
	begin
		R_I = $random;
		#3;
	end
	R_I = 1;
	
	#200;
	
	repeat($urandom_range(150,0))
	begin
		R_I = $random;
		#3;
	end
	R_I = 0;
	
	#200;
end
endtask

endmodule
