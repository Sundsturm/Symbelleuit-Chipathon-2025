v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
C {comp2_2x.sym} 220 -190 0 0 {name=x1}
C {code_shown.sym} -180 120 0 0 {name=MODELS only_toplevel=false value=".include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical"}
C {title.sym} -20 200 0 0 {name=l1 author="Symbelleuit"}
C {code_shown.sym} -180 -280 0 0 {name=FUNCTIONAL only_toplevel=false value=".tran 1p 40n"}
C {code_shown.sym} -180 -180 0 0 {name=ANALYSIS only_toplevel=false value=""}
C {vsource.sym} 0 -50 0 0 {name=V1 value=3.3 savecurrent=false}
C {gnd.sym} 0 -20 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 0 -80 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} 80 50 0 0 {name="V2" value="PWL(0 0 \{20n-10p\} 0 \{20n+10p\} 1.8 40n 1.8)" savecurrent=false}
C {lab_pin.sym} 80 20 0 0 {name=p3 sig_type=std_logic lab=A_F}
C {gnd.sym} 80 80 0 0 {name=l3 lab=GND}
C {vsource.sym} 80 -50 0 0 {name=V3 value="PWL(0 0 \{10n-10p\} 0 \{10n+10p\} 1.8 \{20n-10p\} 1.8 \{20n+10p\} 0 \{30n-10p\} 0 \{30n+10p\} 1.8 40n 1.8)" savecurrent=false}
C {lab_pin.sym} 80 -80 0 0 {name=p4 sig_type=std_logic lab=B_F}
C {gnd.sym} 80 -20 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 170 -210 0 0 {name=p2 sig_type=std_logic lab=A_F}
C {lab_pin.sym} 170 -180 0 0 {name=p5 sig_type=std_logic lab=B_F}
C {lab_pin.sym} 220 -270 1 0 {name=p6 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 270 -220 2 0 {name=p7 sig_type=std_logic lab=L}
C {lab_pin.sym} 270 -200 2 0 {name=p8 sig_type=std_logic lab=E}
C {lab_pin.sym} 270 -180 2 0 {name=p9 sig_type=std_logic lab=G}
C {gnd.sym} 220 -120 0 0 {name=l5 lab=GND}
