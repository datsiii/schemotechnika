
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:022default:default2
00:00:052default:default2
376.7342default:default2
62.6052default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental D:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/utils_1/imports/synth_1/via_test_top.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2y
eD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/utils_1/imports/synth_1/via_test_top.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
z
Command: %s
53*	vivadotcl2I
5synth_design -top via_test_top -part xc7a100tcsg324-12default:defaultZ4-113h px� 
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
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
_
#Helper process launched with PID %s4824*oasys2
45082default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2�
|D:/Xilinx_Windows_Unpacked_2022_2/Xilinx_Windows_Unpacked_2022_2/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
btn_c_in2default:default2
wire2default:default2f
PD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/top.v2default:default2
342default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2"
shift_register2default:default2
wire2default:default2f
PD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/top.v2default:default2
532default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
an_mask2default:default2
wire2default:default2f
PD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/top.v2default:default2
542default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
AN2default:default2
wire2default:default2f
PD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/top.v2default:default2
552default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
SEG2default:default2
wire2default:default2f
PD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/top.v2default:default2
562default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:06 . Memory (MB): peak = 1218.723 ; gain = 408.402
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2 
via_test_top2default:default2
 2default:default2o
YD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/via_test_top.v2default:default2
42default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
vio_02default:default2
 2default:default2�
qD:/schemotechnika/circuit_practica_3/circuit_practica_3.runs/synth_1/.Xil/Vivado-4452-Magic/realtime/vio_0_stub.v2default:default2
52default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
vio_02default:default2
 2default:default2
02default:default2
12default:default2�
qD:/schemotechnika/circuit_practica_3/circuit_practica_3.runs/synth_1/.Xil/Vivado-4452-Magic/realtime/vio_0_stub.v2default:default2
52default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
top2default:default2
 2default:default2f
PD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/top.v2default:default2
32default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
filter2default:default2
 2default:default2i
SD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/filter.v2default:default2
42default:default8@Z8-6157h px� 
Y
%s
*synth2A
-	Parameter size bound to: 7 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
filter2default:default2
 2default:default2
02default:default2
12default:default2i
SD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/filter.v2default:default2
42default:default8@Z8-6155h px� 
�
module '%s' not found439*oasys2
FILTER2default:default2f
PD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/top.v2default:default2
312default:default8@Z8-439h px� 
{
%s
*synth2c
O	Parameter positional_param_0 bound to: 32'sb00000000000000000000000000000100 
2default:defaulth p
x
� 
�
!failed synthesizing module '%s'%s4496*oasys2
top2default:default2
 2default:default2f
PD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/top.v2default:default2
32default:default8@Z8-6156h px� 
�
!failed synthesizing module '%s'%s4496*oasys2 
via_test_top2default:default2
 2default:default2o
YD:/schemotechnika/circuit_practica_3/circuit_practica_3.srcs/sources_1/new/via_test_top.v2default:default2
42default:default8@Z8-6156h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:07 . Memory (MB): peak = 1308.355 ; gain = 498.035
2default:defaulth px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
222default:default2
02default:default2
02default:default2
42default:defaultZ4-41h px� 
N

%s failed
30*	vivadotcl2 
synth_design2default:defaultZ4-43h px� 
�
Command failed: %s
69*common2Y
ESynthesis failed - please see the console or run log file for details2default:defaultZ17-69h px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Wed Apr  3 18:14:37 20242default:defaultZ17-206h px� 


End Record