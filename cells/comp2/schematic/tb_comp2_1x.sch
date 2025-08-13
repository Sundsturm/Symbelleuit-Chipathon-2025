v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
C {comp2_1x.sym} -120 -130 0 0 {name=x1}
C {code_shown.sym} -390 60 0 0 {name=MODELS only_toplevel=false value=".include $PDKPATH/libs.tech/ngspice/design.ngspice
.lib $PDKPATH/libs.tech/ngspice/sm141064.ngspice typical"}
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

* ---- STIMULIS ----
* Power
VVDD VDD gnd DC \{vdd\}

* Change stimuli here!
VA A gnd PULSE(\{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n)
VB B gnd DC 0

* Load capacitance & additional loads
VmeasL L L_load 0
CLL L_load gnd \{cload\}
VmeasE E E_load 0
CLE E_load gnd \{cload\}
VmeasG G G_load 0
CLG G_load gnd \{cload\}

********************************************************************************
* Analysis Statements
********************************************************************************
.OPTIONS SAVE CURRENTS
.tran 1p 10n
* ---- DYNAMIC ENERGY MEASUREMENT (Pin) ----
* Measuring energy that sent to the load capacitor for each pin 
* Dynamic power will be positive when LH and negative when HL
.MEASURE TRAN curr_L_uJ INTEG I(VmeasL) from=0 to=10n
.MEASURE TRAN energy_L_uJ param='curr_L_uJ * vdd'
.MEASURE TRAN curr_E_uJ INTEG I(VmeasE) from=0 to=10n
.MEASURE TRAN energy_E_uJ param='curr_E_uJ * vdd'
.MEASURE TRAN curr_G_uJ INTEG I(VmeasG) from=0 to=10n
.MEASURE TRAN energy_G_uJ param='curr_G_uJ * vdd'

* Total energy of VDD measurement
.measure tran curr_TOTAL_uJ INTEG I(vvdd) from=0 to=10n
.measure tran energy_TOTAL_uJ param='curr_TOTAL_uJ * (-1) * vdd'

********************************************************************************
* Simulation Control Block
********************************************************************************
.control
    run
.endc
.end"}
C {code.sym} -410 -410 0 0 {name=DELAY_TRANSITION only_toplevel=false value="* Copy and paste this line to code \\"ANALYSIS\\"
* Stimuli: A(HL) and B
* VA A gnd PULSE(\{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n)
* VB B gnd DC \{vdd\}

* Stimuli: A(HL) and !B
* VA A gnd PULSE(\{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n)
* VB B gnd DC 0

* Stimuli: A(LH) and B
* VA A gnd PULSE(0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n)
* VB B gnd DC \{vdd\}

* Stimuli: A(LH) and !B
* VA A gnd PULSE(0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n)
* VB B gnd DC 0

* Stimuli: B(HL) and A
* VA A gnd DC \{vdd\}
* VB B gnd PULSE(\{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n)

* Stimuli: B(HL) and !A
* VA A gnd DC 0
* VB B gnd PULSE(\{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n)

* Stimuli: B(LH) and A
* VA A gnd DC \{vdd\}
* VB B gnd PULSE(0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n)

* Stimuli: B(LH) and !A
* VA A gnd DC 0
* VB B gnd PULSE(0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n)

* .OPTIONS SAVE CURRENTS
* .tran 1p 10n

* --- Delay and Slew Measurements ---
* Stimuli: A(HL) and B -> L(LH) & E(HL)
* Delay and Rise Time of L(LH)
* .MEASURE TRAN delay_AHL_B_L TRIG V(A) VAL=\{vh\} FALL=1 TARG V(L) VAL=\{vh\} RISE=1
* .MEASURE TRAN rise_AHL_B_L TRIG V(L) VAL=\{v_10\} RISE=1 TARG V(L) VAL=\{v_90\} RISE=1
* Delay and Fall Time of E(HL)
* .MEASURE TRAN delay_AHL_B_E TRIG V(A) VAL=\{vh\} FALL=1 TARG V(E) VAL=\{vh\} FALL=1
* .MEASURE TRAN fall_AHL_B_E TRIG V(E) VAL=\{v_90\} FALL=1 TARG V(E) VAL=\{v_10\} FALL=1

* Stimuli: A(HL) and !B -> E(LH) & G(HL)
* Delay and Rise Time of E(LH)
* .MEASURE TRAN delay_AHL_noB_E TRIG V(A) VAL=\{vh\} FALL=1 TARG V(E) VAL=\{vh\} RISE=1
* .MEASURE TRAN rise_AHL_noB_E TRIG V(E) VAL=\{v_10\} RISE=1 TARG V(E) VAL=\{v_90\} RISE=1
* Delay and Fall Time of G(HL)
* .MEASURE TRAN delay_AHL_noB_G TRIG V(A) VAL=\{vh\} FALL=1 TARG V(G) VAL=\{vh\} FALL=1
* .MEASURE TRAN fall_AHL_noB_G TRIG V(G) VAL=\{v_90\} FALL=1 TARG V(G) VAL=\{v_10\} FALL=1

* Stimuli: A(LH) and B -> L(HL) & E(LH)
* Delay and Fall Time of L(HL)
* .MEASURE TRAN delay_ALH_B_L TRIG V(A) VAL=\{vh\} RISE=1 TARG V(L) VAL=\{vh\} FALL=1
* .MEASURE TRAN fall_ALH_B_L TRIG V(L) VAL=\{v_90\} FALL=1 TARG V(L) VAL=\{v_10\} FALL=1
* Delay and Rise Time of E(LH)
* .MEASURE TRAN delay_ALH_B_E TRIG V(A) VAL=\{vh\} RISE=1 TARG V(E) VAL=\{vh\} RISE=1
* .MEASURE TRAN rise_ALH_B_E TRIG V(E) VAL=\{v_10\} RISE=1 TARG V(E) VAL=\{v_90\} RISE=1 

* Stimuli: A(LH) and !B -> E(HL) & G(LH)
* Delay and Fall Time of E(HL)
* .MEASURE TRAN delay_ALH_noB_E TRIG V(A) VAL=\{vh\} RISE=1 TARG V(E) VAL=\{vh\} FALL=1
* .MEASURE TRAN fall_ALH_noB_E TRIG V(E) VAL=\{v_90\} FALL=1 TARG V(E) VAL=\{v_10\} FALL=1
* Delay and Rise Time of G(LH)
* .MEASURE TRAN delay_ALH_noB_G TRIG V(A) VAL=\{vh\} RISE=1 TARG V(G) VAL=\{vh\} RISE=1
* .MEASURE TRAN rise_ALH_noB_G TRIG V(G) VAL=\{v_10\} RISE=1 TARG V(G) VAL=\{v_90\} RISE=1

* Stimuli: B(HL) and A -> E(HL) & G(LH)
* Delay and Fall Time of E(HL)
* .MEASURE TRAN delay_BHL_A_E TRIG V(B) VAL=\{vh\} FALL=1 TARG V(E) VAL=\{vh\} FALL=1
* .MEASURE TRAN fall_BHL_A_E TRIG V(E) VAL=\{v_90\} FALL=1 TARG V(E) VAL=\{v_10\} FALL=1
* Delay and Rise Time of G(LH)
* .MEASURE TRAN delay_BHL_A_G TRIG V(B) VAL=\{vh\} FALL=1 TARG V(G) VAL=\{vh\} RISE=1
* .MEASURE TRAN rise_BHL_A_G TRIG V(G) VAL=\{v_10\} RISE=1 TARG V(G) VAL=\{v_90\} RISE=1

* Stimuli: B(HL) and !A -> L(HL) & E(LH)
* Delay and Fall Time of L(HL)
* .MEASURE TRAN delay_BHL_noA_L TRIG V(B) VAL=\{vh\} FALL=1 TARG V(L) VAL=\{vh\} FALL=1
* .MEASURE TRAN fall_BHL_noA_L TRIG V(L) VAL=\{v_90\} FALL=1 TARG V(L) VAL=\{v_10\} FALL=1
* Delay and Rise Time of E(LH)
* .MEASURE TRAN delay_BHL_noA_E TRIG V(B) VAL=\{vh\} FALL=1 TARG V(E) VAL=\{vh\} RISE=1
* .MEASURE TRAN rise_BHL_noA_E TRIG V(E) VAL=\{v_10\} RISE=1 TARG V(E) VAL=\{v_90\} RISE=1

* Stimuli: B(LH) and A -> E(LH) & G(HL)
* Delay and Rise Time of E(LH)
* .MEASURE TRAN delay_BLH_A_E TRIG V(B) VAL=\{vh\} RISE=1 TARG V(E) VAL=\{vh\} RISE=1
* .MEASURE TRAN rise_BLH_A_E TRIG V(E) VAL=\{v_10\} RISE=1 TARG V(E) VAL=\{v_90\} RISE=1
* Delay and Fall Time of G(HL)
* .MEASURE TRAN delay_BLH_A_G TRIG V(B) VAL=\{vh\} RISE=1 TARG V(G) VAL=\{vh\} FALL=1
* .MEASURE TRAN fall_BLH_A_G TRIG V(G) VAL=\{v_90\} FALL=1 TARG V(G) VAL=\{v_10\} FALL=1

* Stimuli: B(LH) and !A -> L(LH) & E(HL)
* Delay and Rise Time of L(LH)
* .MEASURE TRAN delay_BLH_noA_L TRIG V(B) VAL=\{vh\} RISE=1 TARG V(L) VAL=\{vh\} RISE=1
* .MEASURE TRAN rise_BLH_noA_L TRIG V(L) VAL=\{v_10\} RISE=1 TARG V(L) VAL=\{v_90\} RISE=1
* Delay and Fall Time of E(HL)
* .MEASURE TRAN delay_BLH_noA_E TRIG V(B) VAL=\{vh\} RISE=1 TARG V(E) VAL=\{vh\} FALL=1
* .MEASURE TRAN fall_BLH_noA_E TRIG V(E) VAL=\{v_90\} FALL=1 TARG V(E) VAL=\{v_10\} FALL=1

* .control
	* Delay and Output Transition Time Analysis
	* echo \\"========================================================================\\"
    	* echo \\"1. Delay and Output Transition Time Analysis\\"
	* echo -n \\"   Input Slew = \\"
	* echo $&slewin
	* echo -n \\"   Output Load = \\"
	* echo $&outload
    	* echo \\"------------------------------------------------------------------------\\"
	
	* Stimuli 1: A(HL) & B -> L(LH) & E(HL)
	* alter @VA[pulse] = [ \{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n ]
	* alter @VB[dc] = \{vdd\}
	* run
	* echo -n \\"  > Delay A(HL)->L(LH): \\"; print delay_AHL_B_L
	* echo -n \\"  > Slew L(LH):     \\"; print rise_AHL_B_L
	* echo -n \\"  > Delay A(HL)->E(HL): \\"; print delay_AHL_B_E
	* echo -n \\"  > Slew E(HL):     \\"; print fall_AHL_B_E

	* Stimuli 2: A(HL) & !B -> E(LH) & G(HL)
	* alter @VB[dc] = 0
	* run
	* echo -n \\"  > Delay A(HL)->E(LH): \\"; print delay_AHL_noB_E
	* echo -n \\"  > Slew E(LH):     \\"; print rise_AHL_noB_E
	* echo -n \\"  > Delay A(HL)->G(HL): \\"; print delay_AHL_noB_G
	* echo -n \\"  > Slew G(HL):     \\"; print fall_AHL_noB_G

	* Stimuli 3: A(LH) & B -> L(HL) & E(LH)
	* alter @VA[pulse] = [ 0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n ]
	* alter @VB[dc] = \{vdd\}
	* run
	* echo -n \\"  > Delay A(LH)->L(HL): \\"; print delay_ALH_B_L
	* echo -n \\"  > Slew L(HL):     \\"; print fall_ALH_B_L
	* echo -n \\"  > Delay A(LH)->E(LH): \\"; print delay_ALH_B_E
	* echo -n \\"  > Slew E(LH):     \\"; print rise_ALH_B_E

	* Stimuli 4: A(LH) & !B -> E(HL) & G(LH)
	* alter @VB[dc] = 0
	* run
	* echo -n \\"  > Delay A(LH)->E(HL): \\"; print delay_ALH_noB_E
	* echo -n \\"  > Slew E(HL):     \\"; print fall_ALH_noB_E
	* echo -n \\"  > Delay A(LH)->G(LH): \\"; print delay_ALH_noB_G
	* echo -n \\"  > Slew G(LH):     \\"; print rise_ALH_noB_G

	* Stimuli 5: B(HL) & A -> E(HL) & G(LH)
	* alter @VA[dc] = \{vdd\}
	* alter @VB[pulse] = [ \{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n ]
	* run
	* echo -n \\"  -> Delay B(HL)->E(HL): \\"; print delay_BHL_A_E
	* echo -n \\"  -> Slew E(HL):     \\"; print fall_BHL_A_E
	* echo -n \\"  -> Delay B(HL)->G(LH): \\"; print delay_BHL_A_G
	* echo -n \\"  -> Slew G(LH):     \\"; print rise_BHL_A_G

	* Stimuli 6: B(HL) & !A -> L(HL) & E(LH)
	* alter @VA[dc] = 0
	* run
	* echo -n \\"  -> Delay B(HL)->L(HL): \\"; print delay_BHL_noA_L
	* echo -n \\"  -> Slew L(HL):     \\"; print fall_BHL_noA_L
	* echo -n \\"  -> Delay B(HL)->E(LH): \\"; print delay_BHL_noA_E
	* echo -n \\"  -> Slew E(LH):     \\"; print rise_BHL_noA_E

	* Stimuli 7: B(LH) & A -> E(LH) & G(HL)
	* alter @VA[dc] = \{vdd\}
	* alter @VB[pulse] = [ 0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n ]
	* run
	* echo -n \\"  -> Delay B(LH)->E(LH): \\"; print delay_BLH_A_E
	* echo -n \\"  -> Slew E(LH):     \\"; print rise_BLH_A_E
	* echo -n \\"  -> Delay B(LH)->G(HL): \\"; print delay_BLH_A_G
	* echo -n \\"  -> Slew G(HL):     \\"; print fall_BLH_A_G

	* Stimuli 8: B(LH) & !A -> L(LH) & E(HL)
	* alter @VA[dc] = 0
	* run
	* echo -n \\"  -> Delay B(LH)->L(LH): \\"; print delay_BLH_noA_L
	* echo -n \\"  -> Slew L(LH):     \\"; print rise_BLH_noA_L
	* echo -n \\"  -> Delay B(LH)->E(HL): \\"; print delay_BLH_noA_E
	* echo -n \\"  -> Slew E(HL):     \\"; print fall_BLH_noA_E"}
C {code.sym} -230 -410 0 0 {name=POWER_LEAKAGE only_toplevel=false value="* STIMULI
* !A & !B
* VA A gnd DC 0
* VB B gnd DC 0

* !A & B
* VA A gnd DC 0
* VB B gnd DC \{vdd\}

* A & !B
* VA A gnd DC \{vdd\}
* VB B gnd DC 0

* A & B
* VA A gnd DC \{vdd\}
* VB B gnd DC \{vdd\}

* .OP

* .control
	* run
	* let leakage_current = -I(VVDD)
	* let leak_watt = \{vdd\}*leakage_current
	* print leak_watt
	* save all
* .endc
* .end"}
C {code.sym} -60 -410 0 0 {name=DYNAMIC_POWER only_toplevel=false value="* Stimuli: A(HL) and B
* VA A gnd PULSE(\{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n)
* VB B gnd DC \{vdd\}

* Stimuli: A(HL) and !B
* VA A gnd PULSE(\{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n)
* VB B gnd DC 0

* Stimuli: A(LH) and B
* VA A gnd PULSE(0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n)
* VB B gnd DC \{vdd\}

* Stimuli: A(LH) and !B
* VA A gnd PULSE(0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n)
* VB B gnd DC 0

* Stimuli: B(HL) and A
* VA A gnd DC \{vdd\}
* VB B gnd PULSE(\{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n)

* Stimuli: B(HL) and !A
* VA A gnd DC 0
* VB B gnd PULSE(\{vdd\} 0 1n \{slew_in\} \{slew_in\} 2n 4n)

* Stimuli: B(LH) and A
* VA A gnd DC \{vdd\}
* VB B gnd PULSE(0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n)

* Stimuli: B(LH) and !A
* VA A gnd DC 0
* VB B gnd PULSE(0 \{vdd\} 1n \{slew_in\} \{slew_in\} 2n 4n)

* VmeasL L L_load 0
* CLL L_load gnd \{cload\}
* VmeasE E E_load 0
* CLE E_load gnd \{cload\}
* VmeasG G G_load 0
* CLG G_load gnd \{cload\}

* .OPTIONS SAVE CURRENTS
* .tran 1p 10n

* ---- DYNAMIC ENERGY MEASUREMENT (Pin) ----
* Measuring energy that sent to the load capacitor for each pin 
* Dynamic power will be positive when LH and negative when HL
* .MEASURE TRAN curr_L_uJ INTEG I(VmeasL) from=0 to=10n
* .MEASURE TRAN energy_L_uJ param='curr_L_uJ * vdd'
* .MEASURE TRAN curr_E_uJ INTEG I(VmeasE) from=0 to=10n
* .MEASURE TRAN energy_E_uJ param='curr_E_uJ * vdd'
* .MEASURE TRAN curr_G_uJ INTEG I(VmeasG) from=0 to=10n
* .MEASURE TRAN energy_G_uJ param='curr_G_uJ * vdd'

* Total energy of VDD measurement
* .measure tran curr_TOTAL_uJ INTEG I(vvdd) from=0 to=10n
* .measure tran energy_TOTAL_uJ param='curr_TOTAL_uJ * (-1) * vdd'
    * run

    * echo \\"========================================================================\\"
    * echo \\"          Dynamic Energy Analysis Results (uW/MHz atau uJ/cycle)\\"
    * echo \\"========================================================================\\"
    * echo \\"CATATAN: Nilai energi yang mendekati nol berarti tidak ada transisi\\"
    * echo \\"         pada pin output tersebut untuk stimulus yang dipilih.\\"
    * echo \\"------------------------------------------------------------------------\\"
    
    * print energy_L_uJ
    * print energy_E_uJ
    * print energy_G_uJ
    
    * echo \\"------------------------------------------------------------------------\\"
    * print energy_TOTAL_uJ
    * echo \\"========================================================================\\""}
