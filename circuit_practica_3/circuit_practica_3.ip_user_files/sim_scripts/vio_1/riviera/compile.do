vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../circuit_practica_3.gen/sources_1/ip/vio_1/hdl/verilog" "+incdir+../../../../circuit_practica_3.gen/sources_1/ip/vio_1/hdl" \
"../../../../circuit_practica_3.gen/sources_1/ip/vio_1/sim/vio_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

