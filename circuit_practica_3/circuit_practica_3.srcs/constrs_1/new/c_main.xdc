create_clock -add -name clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }]
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk }]

set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports { reset }]; 
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { R_I }];

set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { DATA_IN[0] }]; 
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { DATA_IN[1] }]; 
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { DATA_IN[2] }]; 
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { DATA_IN[3] }]; 

set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { R_O }];

set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { res[0] }]; 
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { res[1] }]; 
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { res[2] }];
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { res[3] }];

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J17} [get_ports { AN[0] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J18} [get_ports { AN[1] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T9 } [get_ports { AN[2] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J14} [get_ports { AN[3] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P14} [get_ports { AN[4] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T14} [get_ports { AN[5] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K2 } [get_ports { AN[6] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U13} [get_ports { AN[7] }]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T10} [get_ports { SEG[0] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R10} [get_ports { SEG[1] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K16} [get_ports { SEG[2] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K13} [get_ports { SEG[3] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P15} [get_ports { SEG[4] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T11} [get_ports { SEG[5] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L18} [get_ports { SEG[6] }]



