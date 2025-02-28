create_pblock pblock_1
resize_pblock [get_pblocks pblock_1] -add {SLICE_X48Y102:SLICE_X51Y103}
set_property IS_SOFT FALSE [get_pblocks pblock_1]
