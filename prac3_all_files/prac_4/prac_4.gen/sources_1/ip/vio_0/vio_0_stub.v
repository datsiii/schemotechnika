// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Apr 10 11:55:10 2024
// Host        : Magic running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/schemotechnika/prac3_all_files/prac_4/prac_4.gen/sources_1/ip/vio_0/vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2022.2" *)
module vio_0(clk, probe_in0, probe_in1, probe_in2, probe_out0, 
  probe_out1, probe_out2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[7:0],probe_in1[6:0],probe_in2[0:0],probe_out0[0:0],probe_out1[0:0],probe_out2[3:0]" */;
  input clk;
  input [7:0]probe_in0;
  input [6:0]probe_in1;
  input [0:0]probe_in2;
  output [0:0]probe_out0;
  output [0:0]probe_out1;
  output [3:0]probe_out2;
endmodule
