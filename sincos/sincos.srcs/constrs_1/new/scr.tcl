create_clock -period 3 -waveform {0 1.5} [ get_ports clk ]
set_property PACKAGE_PIN E3 [ get_ports clk ]
set_property IOSTANDARD LVCMOS33 [ get_ports clk ]

set pb_width 4
set pb_height 9

set x0 28 
set y0 66
set x_begin_y0 [ expr $y0 ]
set dir 1

for {set i = 0} {$i < 6} {incr i} {
    
    if { ([expr $i % 5 == 0]) && ($i != 0) } {
        set s_begin_y0 [ expr $s_begin_y0 - $pb_height ]
        set dir [ expr $dir * -1]
    } else {
        set s_begin_x0 [ expr $x0 + $dir * $i * $pb_width ]
    }
    set s_end_x0 [ expr $s_begin_x0 + $dir * $pb_width - 1 ] 
    set s_end_y0 [ expr $s_begin_y0 * $pb_height - 1 ]
   
    set slice_block "SLICE_X${s_begin_x0}Y${s_begin_y0}:SLICE_X${s_end_x0}Y${s_end_y0}"
    create_pblock "pblock_${i}"
    resize_pblock [ get_pblock "pblock_${i}" ] - add $slice_block
    set_property IS_SOFT FALSE [ get_pblock "pblock_${i}" ]
    add_cells_to_block [ get_pblock "pblock_${i}" ] [ get_cells "stage[${i}].*" ]
}