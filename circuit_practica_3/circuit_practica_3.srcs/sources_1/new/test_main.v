`timescale 1ns / 1ps

module test_main;

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
    $display("\n[%0t]: ���������� ������������:", $time);
    
    for (i = 0; i < TEST_COUNT; i = i + 1)
    begin
        if (&(test_register[i]))
        begin
            $display("�������� %0d ������� �������.", i+1);
            test_counter = test_counter + 1;
        end
        else begin      
            $display("�������� %0d �� �������.", i+1); 
            for (j = 0; j < 8; j = j + 1)
                if (!test_register[i][j])
                    $display("������ �� ���� %0d", j + 1); 
            end        
    end  
    $display("�������� ���������: %0d/%0d", test_counter, TEST_COUNT); 
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
    $display("\n�������� 1. ��� ���������� ����� 0)");
    test_script(
        .a(4'h0), .b(4'h0), .c(4'h1), .d(4'h0),
        .res_expected(0), 
        .error_expected(0), 
        .test_register(test_register)
    );       
end
endtask


task test_top_2;
    output reg [7:0] test_register;
begin
     $display("\n�������� 2.� = 1, b = 2, c = 0, d = 1");
    test_script(
        .a(4'h1), .b(4'h2), .c(4'h0), .d(4'h1),
        .res_expected(1), 
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
    input [3:0] a, b, c, d, res_expected;
    input error_expected;
    output reg [10:0] test_register;  
reg test_result;      
reg [3:0] res_real;
reg error_real;
begin      
    // ���� 1 �����
    @(posedge clk);
    SW = a;
    btn_c(PRESS, 32);
    btn_c(RELEASE, 32);
    
    $display("\n1) �������� ����� 1 �����.");
    test_segs(op_an_number, op_an_count, a, test_result);
    test_register[0] = test_result;
    
    // ���� 2 �����
    @(posedge clk);
    SW = b;
    btn_c(PRESS, 32);
    btn_c(RELEASE, 32);
    
    $display("\n2) �������� ����� 2 �����.");
    test_segs(op_an_number, op_an_count, b, test_result);
    test_register[1] = test_result;
    
    // ���� 3 �����
    @(posedge clk);
    SW = c;
    btn_c(PRESS, 32);
    btn_c(RELEASE, 32);
    
    $display("\n2) �������� ����� 3 �����.");
    test_segs(op_an_number, op_an_count, c, test_result);
    test_register[2] = test_result;
    
    // ���� 4 �����
    @(posedge clk);
    SW = d;
    btn_c(PRESS, 32);
    btn_c(RELEASE, 32);
    
    $display("\n2) �������� ����� 4 �����.");
    test_segs(op_an_number, op_an_count, d, test_result);
    test_register[3] = test_result;
    
    $display("\n3) �������� ������� ������� ���������� �������� ������ �� ����������.");
    if (valid_out_LED)
       $display("������ ���������� �������� ������ ������������ �� ���� valid_out_LED"); 
    else
       $display("������ ���������� �������� ������ ����������� �� ���� valid_out_LED");
    test_register[4] = valid_out_LED;
  
    $display("\n4) �������� ������ ���������� �� �����������.");
    if (error_expected) begin
        $display("��������� �� ����������� ��� ��������� ������");
        test_register[5] = 1;
    end
    else begin
        test_segs(res_an_number, res_an_count, res_expected, test_result);
        test_register[6] = test_result;
    end
        
    $display("\n5) �������� ������ ������ �� �����������.");
    test_segs(err_an_number, err_an_count, error_expected, test_result);
    test_register[7] = test_result;
    
    // ������������� ��������� ������
    btn_c(PRESS, 32);
    btn_c(RELEASE, 32);
    
    $display("\n6) �������� ������ ������� ���������� �������� ������ �� ����������.");
    if (valid_out_LED)
       $display("������ ���������� �������� ������ ������������ �� ���� valid_out_LED"); 
    else
       $display("������ ���������� �������� ������ ����������� �� ���� valid_out_LED");
    test_register[8] = valid_out_LED == 0;
    
    $display("\n7) �������� ������ ���������� �� �����������.");
    test_segs(res_an_number, res_an_count, 0, test_result); 
    test_register[9] = test_result;
  
end
endtask


task btn_c;  
    input signal_in;
    input [6:0] ticks;
begin
    @(posedge clk); 
    btn_c_in <= signal_in;
    $display("\n[%0t]: ������ %b ����� �� ����� btn_c_in.", $time, signal_in);
    
    repeat(ticks + 2)
        @(posedge clk);  
    
    btn_c_in <= 0;
    $display("[%0t]: ������ %b ����� � ����� btn_c_in, ����� ������ 0", $time, signal_in);
end
endtask

task btn_reset;  
    input signal_in;
    input [6:0] ticks;
begin
    @(posedge clk); 
    btn_reset_in <= signal_in;
    $display("\n[%0t]: ������ %b ����� �� ����� btn_reset_in.", $time, signal_in);
    
    repeat(ticks + 2)
        @(posedge clk);  
    
    btn_reset_in <= 0;
    $display("[%0t]: ������ %b ����� � ����� btn_reset_in, ����� ������ 0", $time, signal_in);
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
    $display("\n[%0t] ����� �������� ����������: %d", $time, an_number);
    $display("���������� �����������: %d", an_count);
    $display("��������: %h", value);
    
    for (i = 0; i < an_count; i = i + 1)
    begin
        @(posedge clk);
        $display("[%0t] ����� ����������: %0d", $time, an_number + i);
        $display("��������� ������� �� ����� ������� (CATH): %b", get_cath_mask( value[(i+1)*4-1 -: 4]));
        $display("����������� ������� �� ����� ������� (CATH): %b", CATH);
        
        if ( CATH != get_cath_mask( value[(i+1)*4-1 -: 4] ) )
            test_result = 0;
            
        @(posedge clk_div);
        @(posedge clk);
    end    
end
endtask

endmodule