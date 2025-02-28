vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../circuit_practica_3.gen/sources_1/ip/vio_1/hdl/verilog" "+incdir+../../../../circuit_practica_3.gen/sources_1/ip/vio_1/hdl" \
"../../../../circuit_practica_3.gen/sources_1/ip/vio_1/sim/vio_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

