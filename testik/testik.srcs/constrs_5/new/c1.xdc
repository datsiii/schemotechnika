set_property BEL C5FF [get_cells {genblk1[3].Y_reg[4][14]}]
set_property LOC SLICE_X4Y103 [get_cells {genblk1[3].Y_reg[4][14]}]
create_pblock pblock_reokr
resize_pblock [get_pblocks pblock_reokr] -add {SLICE_X52Y112:SLICE_X59Y117}
set_property IS_SOFT FALSE [get_pblocks pblock_reokr]
