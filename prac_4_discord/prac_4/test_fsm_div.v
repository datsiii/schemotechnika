module test_fsm_div;

reg clk;
initial clk = 0;
always #5 clk <= ~clk;

reg valid_in, reset;
reg [3:0] d_in;
initial
begin
    valid_in = 0;
    reset = 0;
    d_in = 4'd0;
end

wire [3:0] d_out;
wire valid_out, error_out;

fsm_div uut(
	.clk(clk),
	.valid_in(valid_in),
	.reset(reset),
	.valid_out(valid_out),
	.d_in(d_in),
	.d_out(d_out),
	.error_out(error_out)
);

initial
begin
     test_fsm_1();
     test_fsm_2();
     test_fsm_3();
     test_fsm_4();
     test_fsm_5();
     test_fsm_6();
     test_fsm_7();
     test_fsm_8();
     test_fsm_9();
    test_fsm_10();
    test_fsm_11();
    test_fsm_12();

    test_show_stats();
end

localparam NO_ERROR = 0, DIV_BY_ZERO = 1;

task test_fsm_1;
reg test_result;
begin
    $display("\n[%0t]: ���� 1. ����� ���������� ��������� ��������.", $time);
    test_reset(test_result);
    test_info(1, test_result);
end
endtask

task test_fsm_2;
reg test_result;
begin
    $display("\n[%0t]: ���� 2. a / b ��� b == 0, a != 0", $time);
    test_error(4'd5, 4'd0, DIV_BY_ZERO, test_result);
    test_info(2, test_result);
end
endtask

task test_fsm_3;
reg test_result;
begin
    $display("\n[%0t]: ���� 3. a / b ��� b == 0, a == 0", $time);
    test_error(4'd0, 4'd0, DIV_BY_ZERO, test_result);
    test_info(3, test_result);
end
endtask

task test_fsm_4;
reg test_result;
begin
    $display("\n[%0t]: ���� 4. a / b ��� b != 0, a == 0", $time);
    test_res(4'd0, 4'd1, 4'd0, test_result);
    test_info(4, test_result);
end
endtask

task test_fsm_5;
reg test_result;
begin
    $display("\n[%0t]: ���� 5. a / b ��� |a| > |b|, a > 0, b > 0", $time);
    test_res(4'd6, 4'd3, 4'd2, test_result);
    test_info(5, test_result);
end
endtask


task test_fsm_6;
reg test_result;
begin
    $display("\n[%0t]: ���� 6. a / b ��� |a| < |b|, a > 0, b > 0", $time);
    test_res(4'd2, 4'd7, 4'd0, test_result);
    test_info(6, test_result);
end
endtask


task test_fsm_7;
reg test_result;
begin
    $display("\n[%0t]: ���� 7. a / b ��� |a| > |b|, a < 0, b < 0", $time);
    test_res(-4'd7, -4'd2, 4'd3, test_result);
    test_info(7, test_result);
end
endtask


task test_fsm_8;
reg test_result;
begin
    $display("\n[%0t]: ���� 8. a / b ��� |a| < |b|, a < 0, b < 0", $time);
    test_res(-4'd4, -4'd5, 4'd0, test_result);
    test_info(8, test_result);
end
endtask


task test_fsm_9;
reg test_result;
begin
    $display("\n[%0t]: ���� 9. a / b ��� |a| > |b|, a > 0, b < 0", $time);
    test_res(4'd5, -4'd2, -4'd2, test_result);
    test_info(9, test_result);
end
endtask

task test_fsm_10;
reg test_result;
begin
    $display("\n[%0t]: ���� 10. a / b ��� |a| < |b|, a > 0, b < 0", $time);
    test_res(4'd1, -4'd6, 4'd0, test_result);
    test_info(10, test_result);
end
endtask

task test_fsm_11;
reg test_result;
begin
    $display("\n[%0t]: ���� 11. a / b ��� |a| > |b|, a < 0, b > 0", $time);
    test_res(-4'd8, 4'd2, -4'd4, test_result);
    test_info(11, test_result);
end
endtask

task test_fsm_12;
reg test_result;
begin
    $display("\n[%0t]: ���� 12. a / b ��� |a| < |b|, a < 0, b > 0", $time);
    test_res(-4'd3, 4'd5, 4'd0, test_result);
    test_info(12, test_result);
end
endtask


localparam TEST_COUNT = 12;
reg [0:TEST_COUNT-1] test_register;
initial test_register = {TEST_COUNT{1'b0}};

task test_info;
input integer test_number;
input test_result;
begin
    test_register[test_number-1] = test_result;
    if (test_result)
        $display("[%0t]: ���� %0d �������.", $time, test_number);
    else
        $display("[%0t]: ���� %0d �� �������.", $time, test_number);
end
endtask

task test_show_stats;
integer i, test_counter;
begin
    $display("\n���������� ������������:");
    test_counter = 0;

    for (i = 0; i < TEST_COUNT; i = i + 1)
    begin
        if (test_register[i])
            $display("���� %2d �������.", i+1);
        else
            $display("���� %2d �� �������.", i+1);
        test_counter = test_counter + (test_register[i] ? 1 : 0);
    end
    $display("�������� ������: %0d/%0d", test_counter, TEST_COUNT);
end
endtask


task test_res;
    input signed [3:0] a, b;
    input signed [3:0] res_expected;
    output reg test_result;
reg signed [3:0] res_real;
reg error;
begin
    divide_a_b(a, b, res_real, error);

    $display("������� ������: a = %0d, b = %0d", a, b);
    $display("��������� ���������: %0d", res_expected);
    $display("����������� ���������: %0d", res_real);

    test_result = (res_expected == res_real) && (error == NO_ERROR);
end
endtask


task test_error;
    input signed [3:0] a, b;
    input error_num;
    output reg test_result;

reg signed [3:0] res;
reg error;
begin
    divide_a_b(a, b, res, error);

    $display("������� ������: a = %0d, b = %0d", a, b);
    $display("��������� ����� ������: %0d", error_num);
    $display("����������� ����� ������: %0d", error);

    test_result = error == error_num;
end
endtask


task test_reset;
    output reg test_result;
begin
    @(posedge clk) reset <= 1;
    @(posedge clk) reset <= 0;

    @(posedge clk);
    $display("��������� ��������� ��������� �������� ����� ������: %0d", 0);
    $display("����������� ��������� ��������� �������� ����� ������: %0d", uut.state);

    test_result = uut.state == 0;
end
endtask


task divide_a_b;
    input [3:0] a, b;
    output [3:0] res;
    output error;
begin
    // ���� ������� �����
    @(posedge clk);
    d_in <= a; valid_in <= 1;
    @(posedge clk);
    valid_in <= 0;

    // ���� ������� �����
    @(posedge clk);
    d_in <= b; valid_in <= 1;
    @(posedge clk);
    valid_in <= 0;

    // �������� ����������
    @(posedge valid_out); @(posedge clk);
    res = d_out;
    error = error_out;
end
endtask

endmodule
