v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
C {comp2_1x.sym} -120 -80 0 0 {name=x1}
C {code_shown.sym} -390 60 0 0 {name=MODELS only_toplevel=false value=".include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical"}
C {title.sym} -220 150 0 0 {name=l5 author="Symbelleuit"}
C {code.sym} -410 -100 0 0 {name=FUNCTIONAL only_toplevel=false value="* Stimuli
* VPOWER VDD gnd DC 3.3
* V_A A gnd PWL(0 0 \{10n-10p\} 0 \{10n+10p\} 3.3 \{20n-10p\} 3.3 \{20n+10p\} 0 \{30n-10p\} 0 \{30n+10p\} 3.3 40n 3.3)
* V_B B gnd PWL(0 0 \{20n-10p\} 0 \{20n+10p\} 3.3 40n 3.3)

* Simulation
* .tran 1p 40n
* .control
* run
* save all
* plot G E+4 L+8 B+12 A+16
* .endc
* .GLOBAL gnd
* .end"}
C {lab_pin.sym} -170 -140 0 0 {name=p1 sig_type=std_logic lab=A}
C {lab_pin.sym} -170 -110 0 0 {name=p2 sig_type=std_logic lab=B}
C {lab_pin.sym} -120 -200 1 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -120 -50 3 0 {name=p4 sig_type=std_logic lab=GND}
C {lab_pin.sym} -70 -150 2 0 {name=p5 sig_type=std_logic lab=L}
C {lab_pin.sym} -70 -130 2 0 {name=p6 sig_type=std_logic lab=E}
C {lab_pin.sym} -70 -110 2 0 {name=p7 sig_type=std_logic lab=G}
C {code.sym} -410 -260 0 0 {name=ANALYSIS only_toplevel=false value="* Define parameters
.GLOBAL gnd
.temp 25
.param vdd = 3.3V
.param slew_in = 10p
.param cload = 1f
.param vh = \{vdd/2\}
.param v_10 = \{vdd*0.1\}
.param v_90 = \{vdd*0.9\}
* For printing purposes
.csparam outload = \{1*cload\}
.csparam slewin = \{1*slew_in\}

* Stimuli
VVDD VDD gnd DC \{vdd\}
V_A A gnd PULSE(0 \{vdd\} 2n \{slew_in\} \{slew_in\} 4n 8n)
V_B B gnd PULSE(0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n)
* V_A A gnd PWL(0 0 \{10n-10p\} 0 \{10n+10p\} 3.3 \{20n-10p\} 3.3 \{20n+10p\} 0 \{30n-10p\} 0 \{30n+10p\} 3.3 40n 3.3)
* V_B B gnd PWL(0 0 \{20n-10p\} 0 \{20n+10p\} 3.3 40n 3.3)

* Load capacitance
CLL L gnd \{cload\}
CLE E gnd \{cload\}
CLG G gnd \{cload\}

********************************************************************************
* Analysis Statements
********************************************************************************
.OPTIONS SAVE CURRENTS
.tran 1p 10n

* --- Delay and Slew Measurements ---
* These .measure statements are now valid because vh, v_10, and v_90 are defined globally above.

* G (A > B) output
.meas tran g_delay_rise TRIG v(B) VAL=vh FALL=1 TARG v(G) VAL=vh RISE=1
.meas tran g_slew_rise  TRIG v(G) VAL=v_10 RISE=1 TARG v(G) VAL=v_90 RISE=1
.meas tran g_delay_fall TRIG v(B) VAL=vh RISE=1 TARG v(G) VAL=vh FALL=1
.meas tran g_slew_fall  TRIG v(G) VAL=v_90 RISE=1 TARG v(G) VAL=v_10 FALL=1

* L (A < B) output
.meas tran l_delay_rise TRIG v(B) VAL=vh RISE=1 TARG v(L) VAL=vh RISE=1
.meas tran l_slew_rise  TRIG v(L) VAL=v_10 RISE=1 TARG v(L) VAL=v_90 RISE=1
.meas tran l_delay_fall TRIG v(A) VAL=vh RISE=1 TARG v(L) VAL=vh FALL=1
.meas tran l_slew_fall  TRIG v(L) VAL=v_90 FALL=1 TARG v(L) VAL=v_10 FALL=1

* E (A = B) output
.meas tran e_delay_rise_a TRIG v(A) VAL=vh RISE=1 TARG v(E) VAL=vh RISE=1
.meas tran e_slew_rise_a  TRIG v(E) VAL=v_10 RISE=1 TARG v(E) VAL=v_90 RISE=1
.meas tran e_delay_fall_b TRIG v(B) VAL=vh FALL=1 TARG v(E) VAL=vh FALL=1
.meas tran e_slew_fall_b  TRIG v(E) VAL=v_90 FALL=1 TARG v(E) VAL=v_10 FALL=1

* --- Power and Energy Measurements ---
.meas tran avg_current AVG i(vvdd) FROM=0ns TO=8ns
.meas tran i_leak_00 find i(vvdd) at=0.5n
.meas tran i_leak_01 find i(vvdd) at=1.5n
.meas tran i_leak_11 find i(vvdd) at=2.5n
.meas tran i_leak_10 find i(vvdd) at=3.5n

********************************************************************************
* Simulation Control Block
********************************************************************************
.control
	run

	* Delay and Output Transition Time Analysis
	echo \\"========================================================================\\"
    	echo \\"1. Delay and Output Transition Time Analysis\\"
	echo -n \\"   Input Slew = \\"
	echo $&slewin
	echo -n \\"   Output Load = \\"
	echo $&outload
    	echo \\"------------------------------------------------------------------------\\"
    	print g_delay_rise g_slew_rise g_delay_fall g_slew_fall
    	print l_delay_rise l_slew_rise l_delay_fall l_slew_fall
    	print e_delay_rise_a e_slew_rise_a e_delay_fall_b e_slew_fall_b
.endc
.end"}
