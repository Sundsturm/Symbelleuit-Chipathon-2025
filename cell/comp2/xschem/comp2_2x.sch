v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 230 -470 390 -470 {lab=#net1}
N 230 -490 390 -490 {lab=#net1}
N 310 -490 310 -470 {lab=#net1}
N 230 -550 390 -550 {lab=VDD}
N 230 -410 390 -410 {lab=E}
N 310 -410 310 -400 {lab=E}
N 230 -330 230 -310 {lab=#net2}
N 390 -330 390 -310 {lab=#net3}
N 230 -250 390 -250 {lab=GND}
N 230 -390 390 -390 {lab=E}
N 310 -400 310 -390 {lab=E}
N -490 -240 -490 -220 {lab=NOT_B}
N -490 -300 -490 -270 {lab=VDD}
N -490 -190 -490 -160 {lab=GND}
N -530 -270 -530 -190 {lab=B}
N -540 -230 -530 -230 {lab=B}
N -490 -230 -480 -230 {lab=NOT_B}
N -490 -490 -490 -470 {lab=NOT_A}
N -490 -550 -490 -520 {lab=VDD}
N -490 -440 -490 -410 {lab=GND}
N -530 -520 -530 -440 {lab=A}
N -540 -480 -530 -480 {lab=A}
N -490 -480 -480 -480 {lab=NOT_A}
N -250 -410 -250 -390 {lab=#net4}
N -330 -490 -170 -490 {lab=#net5}
N -330 -550 -170 -550 {lab=VDD}
N -250 -490 -250 -470 {lab=#net5}
N -250 -480 -240 -480 {lab=#net5}
N -170 -550 -30 -550 {lab=VDD}
N -30 -490 -30 -470 {lab=L}
N -330 -550 -330 -520 {lab=VDD}
N -170 -550 -170 -520 {lab=VDD}
N -30 -550 -30 -520 {lab=VDD}
N -70 -520 -70 -440 {lab=#net5}
N -240 -480 -70 -480 {lab=#net5}
N -30 -440 -30 -410 {lab=GND}
N -250 -360 -250 -330 {lab=GND}
N -220 -160 -220 -140 {lab=#net6}
N -300 -240 -140 -240 {lab=#net7}
N -300 -300 -140 -300 {lab=VDD}
N -220 -240 -220 -220 {lab=#net7}
N -220 -230 -210 -230 {lab=#net7}
N -140 -300 0 -300 {lab=VDD}
N 0 -240 0 -220 {lab=G}
N -300 -300 -300 -270 {lab=VDD}
N -140 -300 -140 -270 {lab=VDD}
N 0 -300 0 -270 {lab=VDD}
N -40 -270 -40 -190 {lab=#net7}
N -210 -230 -40 -230 {lab=#net7}
N 0 -190 0 -160 {lab=GND}
N -220 -110 -220 -80 {lab=GND}
N -490 -300 -300 -300 {lab=VDD}
N -490 -160 -490 -80 {lab=GND}
N -490 -80 -220 -80 {lab=GND}
N -30 -480 -20 -480 {lab=L}
N 0 -230 10 -230 {lab=G}
N 310 -400 400 -400 {lab=E}
N -490 -550 -330 -550 {lab=VDD}
N -490 -410 -490 -330 {lab=GND}
N -490 -330 -250 -330 {lab=GND}
N -250 -330 -30 -330 {lab=GND}
N -30 -410 -30 -330 {lab=GND}
N -250 -440 -120 -440 {lab=GND}
N -120 -440 -120 -330 {lab=GND}
N -220 -80 240 -80 {lab=GND}
N 230 -550 230 -520 {lab=VDD}
N 390 -550 390 -520 {lab=VDD}
N 230 -280 230 -250 {lab=GND}
N 390 -280 390 -250 {lab=GND}
N 230 -360 280 -360 {lab=GND}
N 280 -360 280 -250 {lab=GND}
N 390 -360 510 -360 {lab=GND}
N 510 -360 510 -250 {lab=GND}
N 390 -250 510 -250 {lab=GND}
N 390 -440 510 -440 {lab=VDD}
N 510 -550 510 -440 {lab=VDD}
N 390 -550 510 -550 {lab=VDD}
N 0 -160 0 -80 {lab=GND}
N -220 -190 -100 -190 {lab=GND}
N -100 -190 -100 -80 {lab=GND}
N -30 -550 60 -550 {lab=VDD}
N 240 -80 320 -80 {lab=GND}
N 240 -80 330 -80 {lab=GND}
N 330 -250 330 -80 {lab=GND}
N 60 -550 230 -550 {lab=VDD}
C {symbols/pfet_03v3.sym} 210 -520 0 0 {name=M17
L=0.3u
W=1.7u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 210 -440 0 0 {name=M18
L=0.3u
W=1.7u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 370 -520 0 0 {name=M19
L=0.3u
W=1.7u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 370 -440 0 0 {name=M20
L=0.3u
W=1.7u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 210 -360 0 0 {name=M21
L=0.3u
W=0.85u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 210 -280 0 0 {name=M22
L=0.3u
W=0.85u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 370 -360 0 0 {name=M23
L=0.3u
W=0.85u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 370 -280 0 0 {name=M24
L=0.3u
W=0.85u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} -510 -190 0 0 {name=M1
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
C {symbols/pfet_03v3.sym} -510 -270 0 0 {name=M2
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
C {symbols/nfet_03v3.sym} -510 -440 0 0 {name=M3
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
C {symbols/pfet_03v3.sym} -510 -520 0 0 {name=M4
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
C {symbols/nfet_03v3.sym} -270 -440 0 0 {name=M5
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
C {symbols/nfet_03v3.sym} -270 -360 0 0 {name=M6
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
C {symbols/pfet_03v3.sym} -190 -520 0 0 {name=M7
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
C {symbols/pfet_03v3.sym} -350 -520 0 0 {name=M8
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
C {symbols/nfet_03v3.sym} -50 -440 0 0 {name=M9
L=0.3u
W=0.85u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -50 -520 0 0 {name=M10
L=0.3u
W=1.7u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} -240 -190 0 0 {name=M11
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
C {symbols/nfet_03v3.sym} -240 -110 0 0 {name=M12
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
C {symbols/pfet_03v3.sym} -160 -270 0 0 {name=M13
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
C {symbols/pfet_03v3.sym} -320 -270 0 0 {name=M14
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
C {symbols/nfet_03v3.sym} -20 -190 0 0 {name=M15
L=0.3u
W=0.85u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -20 -270 0 0 {name=M16
L=0.3u
W=1.7u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {opin.sym} -20 -480 0 0 {name=p1 lab=L}
C {opin.sym} 10 -230 0 0 {name=p2 lab=G}
C {opin.sym} 400 -400 0 0 {name=p3 lab=E}
C {ipin.sym} -540 -480 0 0 {name=p4 lab=A}
C {ipin.sym} -540 -230 0 0 {name=p5 lab=B}
C {lab_pin.sym} -480 -480 2 0 {name=p6 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} -480 -230 2 0 {name=p7 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} -370 -520 0 0 {name=p8 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} -210 -520 0 0 {name=p9 sig_type=std_logic lab=B}
C {lab_pin.sym} -290 -440 0 0 {name=p10 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} -290 -360 0 0 {name=p11 sig_type=std_logic lab=B}
C {lab_pin.sym} -340 -270 0 0 {name=p12 sig_type=std_logic lab=A}
C {lab_pin.sym} -180 -270 0 0 {name=p13 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} -260 -190 0 0 {name=p14 sig_type=std_logic lab=A}
C {lab_pin.sym} -260 -110 0 0 {name=p15 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} 190 -520 0 0 {name=p16 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} 350 -520 0 0 {name=p17 sig_type=std_logic lab=B}
C {lab_pin.sym} 190 -440 0 0 {name=p18 sig_type=std_logic lab=A}
C {lab_pin.sym} 350 -440 0 0 {name=p19 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} 190 -360 0 0 {name=p20 sig_type=std_logic lab=NOT_A}
C {lab_pin.sym} 350 -280 0 0 {name=p21 sig_type=std_logic lab=NOT_B}
C {lab_pin.sym} 190 -280 0 0 {name=p22 sig_type=std_logic lab=B}
C {lab_pin.sym} 350 -360 0 0 {name=p23 sig_type=std_logic lab=A}
C {ipin.sym} 60 -550 1 0 {name=p24 lab=VDD}
C {lab_pin.sym} 230 -440 2 0 {name=p25 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 0 -300 2 0 {name=p26 sig_type=std_logic lab=VDD}
C {ipin.sym} 0 -80 3 0 {name=p27 lab=GND}
C {lab_pin.sym} -30 -330 2 0 {name=p28 sig_type=std_logic lab=GND}
C {title.sym} -500 20 0 0 {name=l1 author="Symbelleuit"}
