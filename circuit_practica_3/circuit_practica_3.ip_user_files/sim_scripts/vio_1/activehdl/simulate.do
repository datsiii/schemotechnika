onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+vio_1  -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.vio_1 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {vio_1.udo}

run 1000ns

endsim

quit -force
