`timescale 1ns / 1ps

class div_data_class;
    randc bit [3:0] div_data_in1;
    randc bit [3:0] div_data_in2;
    
   // constraint constr { !(div_data_in2 inside {0}); };
endclass

module tb;

logic clk = 0;
always #10 clk <= ~clk;


logic reset;
logic valid_in;
logic [3:0] d_in;
logic [3:0] d_out;
logic valid_out;
logic error_out;

div_data_class div_data_obj;

covergroup cg @(posedge clk);
    cp1 : coverpoint div_data_obj.div_data_in1;
    cp2 : coverpoint div_data_obj.div_data_in2;
    cp3 : coverpoint div_data_obj.div_data_in1 / div_data_obj.div_data_in2;
endgroup

fsm_div uut1 (
    .reset(0),
    .clk(clk),
    .valid_in(1),
    .d_in(d_in),
    .d_out(d_out),
    .valid_out(valid_out),
    .error_out(error_out)
);


cg cg_obj;


property res_prop;
    @(posedge clk) ##1 uut1.state == 1 |-> (d_out == 0 && uut1.a_reg == 0 && uut1.b_reg == 0 && d_out == 0 && error_out == 0 && valid_out == 0);
endproperty 

assert property (res_prop)
    $info("All regesters are nulls!");
else 
    $error("Something went wrong!!!");
    
    
property deiv_null;
    @(posedge clk) ##1 (d_in == 0 && uut1.state == 0) |-> error_out == 1;
endproperty 

assert property (deiv_null)
    $info("Error is working!");
else 
    $error("Errro is not working...");
    
property div_not_null;
    @(posedge clk) ##1 (d_in != 0 && uut1.state == 0) |-> d_out == uut1.a_reg / d_in && valid_out == 1;
endproperty 

assert property (div_not_null)
    $info("Div is correct");
else
    $error("Div is not correct...");
initial begin
    div_data_obj = new();
    cg_obj = new();
    d_in = 0;
    
    repeat(16) begin
        div_data_obj.randomize();
        
        @(posedge clk);
        @(posedge clk);
        d_in = div_data_obj.div_data_in1;
        @(posedge  clk);
        d_in = div_data_obj.div_data_in2;
        @(posedge clk);
        
        
        $display("Coverage cp2 = %0.2f %%", cg_obj.cp2.get_inst_coverage());
        $display("Coverage cp3 = %0.2f %%", cg_obj.cp3.get_inst_coverage());
        $display("Coverage = %0.2f %%", cg_obj.get_inst_coverage());
        $display("~~~~~~~~~~~~~~~~~~~\n");
    end
    
    $finish;
end

endmodule