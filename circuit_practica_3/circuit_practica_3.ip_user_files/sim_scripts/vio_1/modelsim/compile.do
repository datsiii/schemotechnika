vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../circuit_practica_3.gen/sources_1/ip/vio_1/hdl/verilog" "+incdir+../../../../circuit_practica_3.gen/sources_1/ip/vio_1/hdl" \
"../../../../circuit_practica_3.gen/sources_1/ip/vio_1/sim/vio_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

