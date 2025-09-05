v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 690 -510 770 -510 {lab=#net1}
N 690 -530 770 -530 {lab=#net1}
N 690 -530 690 -510 {lab=#net1}
N 610 -590 770 -590 {lab=VDD}
N 690 -450 770 -450 {lab=E}
N 690 -450 690 -440 {lab=E}
N 610 -370 610 -350 {lab=#net2}
N 770 -370 770 -350 {lab=#net3}
N 710 -290 770 -290 {lab=VSS}
N 690 -430 770 -430 {lab=E}
N 690 -440 690 -430 {lab=E}
N -110 -270 -110 -260 {lab=NOT_B}
N -110 -340 -110 -310 {lab=VDD}
N -110 -230 -110 -120 {lab=VSS}
N -150 -270 -150 -230 {lab=B}
N -160 -270 -150 -270 {lab=B}
N -110 -270 -100 -270 {lab=NOT_B}
N -110 -520 -110 -510 {lab=NOT_A}
N -110 -590 -110 -560 {lab=VDD}
N -110 -480 -110 -370 {lab=VSS}
N -150 -520 -150 -480 {lab=A}
N -160 -520 -150 -520 {lab=A}
N -110 -520 -100 -520 {lab=NOT_A}
N 130 -450 130 -430 {lab=#net4}
N 130 -530 210 -530 {lab=#net5}
N 50 -590 210 -590 {lab=VDD}
N 130 -520 130 -510 {lab=#net5}
N 130 -520 310 -520 {lab=#net5}
N 210 -590 350 -590 {lab=VDD}
N 350 -520 350 -510 {lab=L}
N 50 -590 50 -560 {lab=VDD}
N 210 -590 210 -560 {lab=VDD}
N 350 -590 350 -560 {lab=VDD}
N 310 -520 310 -480 {lab=#net5}
N 350 -480 350 -370 {lab=VSS}
N 130 -400 130 -370 {lab=VSS}
N 160 -200 160 -180 {lab=#net6}
N 160 -280 240 -280 {lab=#net7}
N 80 -340 240 -340 {lab=VDD}
N 160 -270 160 -260 {lab=#net7}
N 160 -270 340 -270 {lab=#net7}
N 240 -340 380 -340 {lab=VDD}
N 380 -270 380 -260 {lab=G}
N 80 -340 80 -310 {lab=VDD}
N 240 -340 240 -310 {lab=VDD}
N 380 -340 380 -310 {lab=VDD}
N 340 -270 340 -230 {lab=#net7}
N 380 -230 380 -120 {lab=VSS}
N 160 -150 160 -120 {lab=VSS}
N -110 -340 80 -340 {lab=VDD}
N -110 -120 160 -120 {lab=VSS}
N 350 -520 360 -520 {lab=L}
N 380 -270 390 -270 {lab=G}
N 690 -440 780 -440 {lab=E}
N -110 -590 50 -590 {lab=VDD}
N -110 -370 130 -370 {lab=VSS}
N 260 -370 350 -370 {lab=VSS}
N 130 -480 260 -480 {lab=VSS}
N 260 -480 260 -370 {lab=VSS}
N 380 -120 710 -120 {lab=VSS}
N 610 -590 610 -560 {lab=VDD}
N 770 -590 770 -560 {lab=VDD}
N 610 -320 610 -290 {lab=VSS}
N 770 -320 770 -290 {lab=VSS}
N 610 -400 660 -400 {lab=VSS}
N 660 -400 660 -290 {lab=VSS}
N 770 -400 890 -400 {lab=VSS}
N 890 -400 890 -290 {lab=VSS}
N 770 -290 890 -290 {lab=VSS}
N 770 -480 890 -480 {lab=VDD}
N 890 -590 890 -480 {lab=VDD}
N 770 -590 890 -590 {lab=VDD}
N 160 -230 280 -230 {lab=VSS}
N 280 -230 280 -120 {lab=VSS}
N 350 -590 610 -590 {lab=VDD}
N 710 -290 710 -120 {lab=VSS}
N 610 -530 690 -530 {lab=#net1}
N 610 -510 690 -510 {lab=#net1}
N 610 -450 690 -450 {lab=E}
N 610 -430 690 -430 {lab=E}
N -150 -310 -150 -270 {lab=B}
N -110 -280 -110 -270 {lab=NOT_B}
N -150 -560 -150 -520 {lab=A}
N -110 -530 -110 -520 {lab=NOT_A}
N 50 -530 130 -530 {lab=#net5}
N 130 -530 130 -520 {lab=#net5}
N 310 -560 310 -520 {lab=#net5}
N 80 -280 160 -280 {lab=#net7}
N 160 -280 160 -270 {lab=#net7}
N 340 -310 340 -270 {lab=#net7}
N 350 -530 350 -520 {lab=L}
N 380 -280 380 -270 {lab=G}
N 130 -370 260 -370 {lab=VSS}
N 610 -290 660 -290 {lab=VSS}
N 280 -120 380 -120 {lab=VSS}
N 160 -120 280 -120 {lab=VSS}
N 660 -290 710 -290 {lab=VSS}
C {devices/title.sym} -250 -40 0 0 {name=l1 author="Symbelleuit"}
C {symbols/pfet_03v3.sym} 590 -560 0 0 {name=M17
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 590 -480 0 0 {name=M18
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 750 -560 0 0 {name=M19
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 750 -480 0 0 {name=M20
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 590 -400 0 0 {name=M21
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 590 -320 0 0 {name=M22
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 750 -400 0 0 {name=M23
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 750 -320 0 0 {name=M24
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} -130 -230 0 0 {name=M1
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -130 -310 0 0 {name=M2
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} -130 -480 0 0 {name=M3
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -130 -560 0 0 {name=M4
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 110 -480 0 0 {name=M5
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 110 -400 0 0 {name=M6
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 190 -560 0 0 {name=M7
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 30 -560 0 0 {name=M8
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 330 -480 0 0 {name=M9
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 330 -560 0 0 {name=M10
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 140 -230 0 0 {name=M11
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 140 -150 0 0 {name=M12
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 220 -310 0 0 {name=M13
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 60 -310 0 0 {name=M14
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 360 -230 0 0 {name=M15
L=0.3u
W=0.85u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 360 -310 0 0 {name=M16
L=0.3u
W=1.7u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {opin.sym} 360 -520 0 0 {name=p1 lab=L}
C {opin.sym} 390 -270 0 0 {name=p2 lab=G}
C {opin.sym} 780 -440 0 0 {name=p3 lab=E}
C {ipin.sym} -160 -520 0 0 {name=p4 lab=A}
C {ipin.sym} -160 -270 0 0 {name=p5 lab=B}
C {lab_pin.sym} -100 -520 2 0 {name=p6 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} -100 -270 2 0 {name=p7 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} 10 -560 0 0 {name=p8 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} 170 -560 0 0 {name=p9 sig_type=std_logic lab=B}
C {lab_pin.sym} 90 -480 0 0 {name=p10 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} 90 -400 0 0 {name=p11 sig_type=std_logic lab=B}
C {lab_pin.sym} 40 -310 0 0 {name=p12 sig_type=std_logic lab=A}
C {lab_pin.sym} 200 -310 0 0 {name=p13 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} 120 -150 0 0 {name=p14 sig_type=std_logic lab=A}
C {lab_pin.sym} 120 -230 0 0 {name=p15 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} 570 -560 0 0 {name=p16 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} 730 -560 0 0 {name=p17 sig_type=std_logic lab=B}
C {lab_pin.sym} 730 -480 0 0 {name=p18 sig_type=std_logic lab=A}
C {lab_pin.sym} 570 -480 0 0 {name=p19 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} 570 -400 0 0 {name=p20 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} 730 -320 0 0 {name=p21 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} 570 -320 0 0 {name=p22 sig_type=std_logic lab=B}
C {lab_pin.sym} 730 -400 0 0 {name=p23 sig_type=std_logic lab=A}
C {ipin.sym} 440 -590 1 0 {name=p24 lab=VDD}
C {lab_pin.sym} 610 -480 2 0 {name=p25 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 380 -340 2 0 {name=p26 sig_type=std_logic lab=VDD}
C {ipin.sym} 380 -120 3 0 {name=p27 lab=VSS}
C {lab_pin.sym} 350 -370 2 0 {name=p28 sig_type=std_logic lab=VSS}
