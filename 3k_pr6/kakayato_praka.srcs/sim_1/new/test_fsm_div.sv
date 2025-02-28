`timescale 1ns / 1ps
class fsm_div_cl;
    //randc bit [7:0] a, b;
    //randc bit reset;
    //input valid_in,
    //------------
    randc bit [3:0] d_in;
    //output reg [3:0] d_out,
    //output reg valid_out,
    //output reg error_out
endclass

module test_fsm_div;
    logic clk = 0;
    always #10 clk <= ~clk;
    
    logic [7:0] a, b;
    logic [8:0] c;

fsm_div uut(
    .reset(reset),
    .clk(clk),
    .valid_in(valid_in),
    .d_in(d_in),
    .d_out(d_out),
    .valid_out(alid_out),
    .error_out(error_out)
);

fsm_div_cl fsm_div_ob;

covergroup cg @(posedge clk);
    cp_a: coverpoint fsm_div_ob.a { option.auto_bin_max = 256; } 
    cp_b: coverpoint sum_ob.b { option.auto_bin_max = 256; } 
    cp_div: coverpoint sum_ob.a / sum_ob.b { option.auto_bin_max = 256; } 
endgroup

cg cg_ob;

//проверка корректности суммы
sequence sum_seq;
    (c == a + b);
endsequence

property sum_prop;
    @(posedge clk) ##1 sum_seq;
endproperty

assert property (sum_prop)
    $info("%d + %d = %d", a, b, c);
else
    $fatal("%d + %d != %d", a, b, c);
    
//проверка наличия переноса в случае его необходимости
property carry_prop;
   @(posedge clk) ##1 (a + b > 255) == c[8];
endproperty

assert property (carry_prop)
     $info("Carry is correct");
else
    $info("Carry is NOT correct!!!");
    
initial
begin
    sum_ob = new();
    cg_ob = new();
    repeat(256)
        begin
            sum_ob.randomize();
            a = sum_ob.a;
            b = sum_ob.b;    
            @(posedge clk);
            $display("[%0d]: Coverage cp_a: %0.2f %%", $time(), cg_ob.cp_a.get_inst_coverage());
            $display("[%0d]: Coverage cp_b: %0.2f %%", $time(),cg_ob.cp_b.get_inst_coverage());
            $display("[%0d]: Coverage cp_sum: %0.2f %%", $time(),cg_ob.cp_sum.get_inst_coverage());
            $display("[%0d]: Coverage: %0.2f %%", $time(),cg_ob.get_inst_coverage());
            $display("--------------------------------- \n");
       end 
    $finish;
end
endmodule
