
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:012default:default2
00:00:062default:default2
376.7772default:default2
58.8872default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
xread_checkpoint -auto_incremental -incremental D:/schemotechnika/testik/testik.srcs/utils_1/imports/synth_1/maklaren.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2]
ID:/schemotechnika/testik/testik.srcs/utils_1/imports/synth_1/maklaren.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
t
Command: %s
53*	vivadotcl2C
/synth_design -top CORDIC -part xc7a100tcsg324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
184362default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2�
|D:/Xilinx_Windows_Unpacked_2022_2/Xilinx_Windows_Unpacked_2022_2/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
%s*synth2�
sStarting Synthesize : Time (s): cpu = 00:00:01 ; elapsed = 00:00:05 . Memory (MB): peak = 817.727 ; gain = 409.629
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
CORDIC2default:default2
 2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
22default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

adder_tree2default:default2
 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
22default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

adder_tree2default:default2
 2default:default2
02default:default2
12default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
22default:default8@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
q2default:default2
332default:default2

adder_tree2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
552default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
clk2default:default2

adder_tree2default:default2"
nolabel_line522default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
nolabel_line522default:default2

adder_tree2default:default2
42default:default2
32default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
522default:default8@Z8-7023h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CORDIC2default:default2
 2default:default2
02default:default2
12default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
22default:default8@Z8-6155h px� 
�
+Unused sequential element %s was removed. 
4326*oasys28
$genblk1.genblk2[31].genblk1[0].c_reg2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2/
genblk1[30].RES_ACC_reg[31]2default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
512default:default8@Z8-6014h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
q[32]2default:default2

adder_tree2default:defaultZ8-7129h px� 
�
%s*synth2�
sFinished Synthesize : Time (s): cpu = 00:00:02 ; elapsed = 00:00:08 . Memory (MB): peak = 944.008 ; gain = 535.910
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
~Finished Constraint Validation : Time (s): cpu = 00:00:02 ; elapsed = 00:00:08 . Memory (MB): peak = 944.008 ; gain = 535.910
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:02 ; elapsed = 00:00:08 . Memory (MB): peak = 944.008 ; gain = 535.910
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2)
genblk1[30].X_reg[31]2default:default2
322default:default2
172default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
472default:default8@Z8-3936h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2)
genblk1[30].Y_reg[31]2default:default2
322default:default2
172default:default2Q
;D:/schemotechnika/testik/testik.srcs/sources_1/new/cordic.v2default:default2
482default:default8@Z8-3936h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:11 . Memory (MB): peak = 944.008 ; gain = 535.910
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   32 Bit       Adders := 60    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   17 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit       Adders := 15376 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit       Adders := 1922  
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 93    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               17 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 32674 
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 90    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   32 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   17 Bit        Muxes := 2     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:24 ; elapsed = 00:01:12 . Memory (MB): peak = 1385.520 ; gain = 977.422
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:24 ; elapsed = 00:01:13 . Memory (MB): peak = 1399.305 ; gain = 991.207
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[12].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[12].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[13].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[13].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[14].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[14].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[15].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[15].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[16].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[16].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[17].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[17].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[18].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[18].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[19].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[19].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[20].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[20].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[21].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[21].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[22].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[22].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[23].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[23].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[24].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[24].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[25].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[25].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[26].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[26].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[27].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[27].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[28].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[28].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[29].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[29].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[11].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[11].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2X
D\genblk1[10].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2T
@\genblk1[10].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[9].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[9].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[8].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[8].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[7].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[7].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[6].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[6].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[5].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[5].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[4].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[4].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[3].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[3].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[2].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[2].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[1].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[1].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2W
C\genblk1[0].nolabel_line52/genblk1.genblk2[31].genblk1[0].s_reg[0] 2default:default2
CORDIC2default:default2S
?\genblk1[0].nolabel_line52/genblk1.genblk2[31].c_grand_reg[29] 2default:default2U
?D:/schemotechnika/testik/testik.srcs/sources_1/new/adder_tree.v2default:default2
312default:default8@Z8-4765h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Technology Mapping : Time (s): cpu = 00:00:24 ; elapsed = 00:01:14 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
wFinished IO Insertion : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |   498|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |    33|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |  1890|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |    66|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |     2|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |    30|
2default:defaulth px� 
D
%s*synth2,
|8     |FDRE   |  1963|
2default:defaulth px� 
D
%s*synth2,
|9     |IBUF   |    35|
2default:defaulth px� 
D
%s*synth2,
|10    |OBUF   |    34|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
� 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
� 
N
%s
*synth26
"|      |Instance |Module |Cells |
2default:defaulth p
x
� 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
� 
N
%s
*synth26
"|1     |top      |       |  4552|
2default:defaulth p
x
� 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 99 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1408.535 ; gain = 1000.438
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0362default:default2
1409.7302default:default2
0.0002default:defaultZ17-268h px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
4982default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
�
�Netlist '%s' is not ideal for floorplanning, since the cellview '%s' contains a large number of primitives.  Please consider enabling hierarchy in synthesis if you want to do floorplanning.
310*netlist2
CORDIC2default:default2
CORDIC2default:defaultZ29-101h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1429.7622default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
fec448ff2default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
512default:default2
1002default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:262default:default2
00:01:212default:default2
1429.7622default:default2
1028.0982default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2K
7D:/schemotechnika/testik/testik.runs/synth_1/CORDIC.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2v
bExecuting : report_utilization -file CORDIC_utilization_synth.rpt -pb CORDIC_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Oct  3 18:13:59 20242default:defaultZ17-206h px� 


End Record