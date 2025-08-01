v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 420 -140 420 -90 {lab=Out}
N 420 -90 530 -90 {lab=Out}
N 530 -90 530 -30 {lab=Out}
N 530 -90 600 -90 {lab=Out}
N 600 -140 600 -90 {lab=Out}
N 420 -240 420 -200 {lab=VDD}
N 420 -240 520 -240 {lab=VDD}
N 600 -240 600 -200 {lab=VDD}
N 520 -240 600 -240 {lab=VDD}
N 530 30 530 60 {lab=#net1}
N 530 120 530 160 {lab=xxx}
N 530 90 530 120 {lab=xxx}
N 530 -0 640 0 {lab=xxx}
N 640 0 640 120 {lab=xxx}
N 530 120 640 120 {lab=xxx}
N 420 -200 420 -170 {lab=VDD}
N 600 -200 600 -170 {lab=VDD}
N 260 -120 380 -120 {lab=A}
N 380 -170 380 -120 {lab=A}
N 260 -80 550 -80 {lab=B}
N 550 -80 560 -80 {lab=B}
N 560 -170 560 -80 {lab=B}
N 310 -120 310 -0 {lab=A}
N 310 -0 490 0 {lab=A}
N 400 -80 400 90 {lab=B}
N 400 90 490 90 {lab=B}
N 530 -50 620 -50 {lab=Out}
C {symbols/nfet_03v3.sym} 510 0 0 0 {name=M1
L=0.28u
W=0.22u
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
C {symbols/pfet_03v3.sym} 400 -170 0 0 {name=M2
L=0.28u
W=0.22u
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
C {devices/ipin.sym} 260 -120 0 0 {name=p1 lab=A}
C {devices/opin.sym} 620 -50 0 0 {name=p2 lab=Out
}
C {devices/title.sym} 70 -330 0 0 {name=l1 author="M. Yoga Putrapratama
"}
C {symbols/pfet_03v3.sym} 580 -170 0 0 {name=M3
L=0.28u
W=0.22u
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
C {symbols/nfet_03v3.sym} 510 90 0 0 {name=M4
L=0.28u
W=0.22u
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
C {devices/ipin.sym} 260 -80 0 0 {name=p3 lab=B}
C {devices/iopin.sym} 520 -240 3 0 {name=p4 lab=VDD}
C {devices/iopin.sym} 530 150 1 0 {name=p5 lab=GND}
