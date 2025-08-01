v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
C {comp2_1x.sym} -150 -270 0 0 {name=x1}
C {code_shown.sym} -400 -470 0 0 {name=FUNCTIONAL only_toplevel=false value=".tran 1p 40n"}
C {code_shown.sym} -390 60 0 0 {name=MODELS only_toplevel=false value=".include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical"}
C {vsource.sym} -150 -140 0 0 {name=V1 value=3.3 savecurrent=false}
C {gnd.sym} -150 -110 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -150 -170 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -150 -390 1 0 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} -150 -240 0 0 {name=l2 lab=GND}
C {vsource.sym} -70 -40 0 0 {name="V2" value="PWL(0 0 \{20n-10p\} 0 \{20n+10p\} 1.8 40n 1.8)" savecurrent=false}
C {lab_pin.sym} -70 -70 0 0 {name=p3 sig_type=std_logic lab=A_F}
C {gnd.sym} -70 -10 0 0 {name=l3 lab=GND}
C {vsource.sym} -70 -140 0 0 {name=V3 value="PWL(0 0 \{10n-10p\} 0 \{10n+10p\} 1.8 \{20n-10p\} 1.8 \{20n+10p\} 0 \{30n-10p\} 0 \{30n+10p\} 1.8 40n 1.8)" savecurrent=false}
C {lab_pin.sym} -70 -170 0 0 {name=p4 sig_type=std_logic lab=B_F}
C {gnd.sym} -70 -110 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -200 -300 0 0 {name=p5 sig_type=std_logic lab=B}
C {lab_pin.sym} -200 -330 0 0 {name=p6 sig_type=std_logic lab=A}
C {title.sym} -220 150 0 0 {name=l5 author="Kean Malik Aji Santoso"}
C {lab_pin.sym} -100 -340 2 0 {name=p7 sig_type=std_logic lab=L}
C {lab_pin.sym} -100 -320 2 0 {name=p8 sig_type=std_logic lab=E}
C {lab_pin.sym} -100 -300 2 0 {name=p9 sig_type=std_logic lab=G}
C {code_shown.sym} -400 -360 0 0 {name=ANALYSIS only_toplevel=false value=""}
