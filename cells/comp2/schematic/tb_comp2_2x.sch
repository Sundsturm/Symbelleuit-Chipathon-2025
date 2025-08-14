v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
C {comp2_2x.sym} 470 -190 0 0 {name=x1}
C {code_shown.sym} -180 120 0 0 {name=MODELS only_toplevel=false value=".include $PDKPATH/libs.tech/ngspice/design.ngspice
.lib $PDKPATH/libs.tech/ngspice/sm141064.ngspice typical"}
C {title.sym} -20 200 0 0 {name=l1 author="Symbelleuit"}
C {code_shown.sym} -180 -310 0 0 {name=SIMULATION only_toplevel=false value=".GLOBAL gnd

* For functional
* .tran 1p 40n

* Load
CLL L gnd 1f
CLE E gnd 1f
CLG G gnd 1f

* For leakage power
.op
.control
	lol
	run
	let leakage_current = -I(V1)
	let leak_watt = \{vdd\}*leakage_current
	print leak_watt
 	save all
.endc
.end"}
C {vsource.sym} 380 -50 0 0 {name=V1 value=3.3 savecurrent=false}
C {gnd.sym} 380 -20 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 380 -80 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} 460 50 0 0 {name="V2" value="DC 0" savecurrent=false}
C {lab_pin.sym} 460 20 0 0 {name=p3 sig_type=std_logic lab=A}
C {gnd.sym} 460 80 0 0 {name=l3 lab=GND}
C {vsource.sym} 460 -50 0 0 {name=V3 value="DC 3.3" savecurrent=false}
C {lab_pin.sym} 460 -80 0 0 {name=p4 sig_type=std_logic lab=B}
C {gnd.sym} 460 -20 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 420 -210 0 0 {name=p2 sig_type=std_logic lab=A}
C {lab_pin.sym} 420 -180 0 0 {name=p5 sig_type=std_logic lab=B}
C {lab_pin.sym} 470 -270 1 0 {name=p6 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 520 -220 2 0 {name=p7 sig_type=std_logic lab=L}
C {lab_pin.sym} 520 -200 2 0 {name=p8 sig_type=std_logic lab=E}
C {lab_pin.sym} 520 -180 2 0 {name=p9 sig_type=std_logic lab=G}
C {gnd.sym} 470 -120 0 0 {name=l5 lab=GND}
