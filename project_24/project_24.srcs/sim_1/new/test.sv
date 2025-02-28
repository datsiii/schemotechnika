`timescale 1ns / 1ps

class sum_cl;
    randc bit [7:0] a, b;
    
    //constraint constr {!(b inside {0});};
    
endclass

module test;

logic clk = 0;
always #10 clk <= ~clk;


logic [7:0] a, b;
logic [8:0] c;

sum uut(
    .clk(clk),
    .a(a),
    .b(b),
    .c(c)
);

sum_cl sum_ob;

covergroup cg @(posedge clk); 
    cp_a : coverpoint sum_ob.a { option.auto_bin_max = 256; }
    cp_b : coverpoint sum_ob.b { option.auto_bin_max = 256; }
    cp_sum : coverpoint sum_ob.a + sum_ob.b { option.auto_bin_max = 256; }
endgroup 

cg cg_ob;

// Проверка корректности суммы 
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


// Проверка наличия переноса в случае его необходимости
property carry_prop;
    @(posedge clk) ##1 (a + b > 255) == c[0];
endproperty

assert property (carry_prop)
    $info("Carry is correct");
else
    $error("Carry is not correct!!!");
    
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
            $display("[%0d]: Coverage cp_b: %0.2f %%", $time(), cg_ob.cp_b.get_inst_coverage());
            $display("[%0d]: Coverage cp_sum: %0.2f %%", $time(), cg_ob.cp_sum.get_inst_coverage());
            $display("[%0d]: Coverage: %0.2f %%", $time(), cg_ob.get_inst_coverage());
            $display("------------------------ \n");
        end    
    $finish;    
end    
    
endmodule
