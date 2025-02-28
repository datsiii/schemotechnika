vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../prac_4.gen/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../prac_4.gen/sources_1/ip/vio_0/hdl" \
"../../../../prac_4.gen/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

