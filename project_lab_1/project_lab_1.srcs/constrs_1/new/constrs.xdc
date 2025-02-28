create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN E3} [get_ports { clk } ]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J15} [get_ports { SW[0] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L16} [get_ports { SW[1] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M13} [get_ports { SW[2] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R15} [get_ports { SW[3] }]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N17} [get_ports { button }]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J17} [get_ports { AN[0] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J18} [get_ports { AN[1] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T9 } [get_ports { AN[2] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J14} [get_ports { AN[3] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P14} [get_ports { AN[4] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T14} [get_ports { AN[5] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K2 } [get_ports { AN[6] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U13} [get_ports { AN[7] }]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T10} [get_ports { CAT[0] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R10} [get_ports { CAT[1] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K16} [get_ports { CAT[2] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K13} [get_ports { CAT[3] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P15} [get_ports { CAT[4] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T11} [get_ports { CAT[5] }]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L18} [get_ports { CAT[6] }]