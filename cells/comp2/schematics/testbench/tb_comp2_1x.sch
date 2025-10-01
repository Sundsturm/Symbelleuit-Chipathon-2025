v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
C {code_shown.sym} -390 60 0 0 {name=MODELS only_toplevel=false value=".include $PDKPATH/libs.tech/ngspice/design.ngspice
.lib $PDKPATH/libs.tech/ngspice/sm141064.ngspice typical"}
C {title.sym} -220 150 0 0 {name=l5 author="Symbelleuit"}
C {code.sym} -410 -100 0 0 {name=FUNCTIONAL only_toplevel=false value="* Stimuli
VPOWER VDD gnd DC 3.3
V_A A gnd PWL(0 0 \{10n-10p\} 0 \{10n+10p\} 3.3 \{20n-10p\} 3.3 \{20n+10p\} 0 \{30n-10p\} 0 \{30n+10p\} 3.3 40n 3.3)
V_B B gnd PWL(0 0 \{20n-10p\} 0 \{20n+10p\} 3.3 40n 3.3)

* Simulation
.tran 1p 40n
.control
run
save all
plot G E+4 L+8 B+12 A+16
.endc
.GLOBAL gnd
.end"}
C {lab_pin.sym} -170 -140 0 0 {name=p1 sig_type=std_logic lab=A}
C {lab_pin.sym} -170 -110 0 0 {name=p2 sig_type=std_logic lab=B}
C {lab_pin.sym} -120 -200 1 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -120 -50 3 0 {name=p4 sig_type=std_logic lab=GND}
C {lab_pin.sym} -70 -150 2 0 {name=p5 sig_type=std_logic lab=L}
C {lab_pin.sym} -70 -130 2 0 {name=p6 sig_type=std_logic lab=E}
C {lab_pin.sym} -70 -110 2 0 {name=p7 sig_type=std_logic lab=G}
C {/foss/designs/chipathon_2025/Symbelleuit-Chipathon-2025/cells/comp2/schematics/gf180mcu_gp9t3v3__comp2_1.sym} -120 -130 0 0 {name=x1}
