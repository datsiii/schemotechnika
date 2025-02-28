create_clock -period 3.000 -waveform {0.000 1.500} [get_ports clk]
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set pb_width 4
set pb_height 9

set x0 28
set y0 66
set s_begin_x0 [ expr $x0 ]
set s_begin_y0 [ expr $y0 ]
set dir 1


for {set i 0} {$i < 32} {incr i} {

    if { ([ expr $i % 10 == 0 ]) && ($i != 0 ) } {
        set s_begin_y0 [ expr $s_begin_y0 - $pb_height ]
        set dir [ expr $dir * -1]
    } else {
        set s_begin_x0 [ expr $s_begin_x0 + $dir * $pb_width ]
    }



    set s_end_x0 [ expr $s_begin_x0 + $pb_width -1 ]
    set s_end_y0 [ expr $s_begin_y0 + $pb_height -1 ]

    set slice_block "SLICE_X${s_begin_x0}Y${s_begin_y0}:SLICE_X${s_end_x0}Y${s_end_y0}"

    create_pblock "pblock_${i}"
    resize_pblock [ get_pblocks "pblock_${i}" ] -add $slice_block
    add_cells_to_pblock [ get_pblocks "pblock_${i}" ] [ get_cells "stage\[*\].*\[${i}\]\[*" ]
}

set_property EXCLUDE_PLACEMENT 1 [get_pblocks "*"]
set_property IS_SOFT FALSE [get_pblocks "*"]
