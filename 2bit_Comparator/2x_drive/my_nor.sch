v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 680 -50 680 -0 {lab=Out}
N 850 -50 850 -0 {lab=Out}
N 680 -50 850 -50 {lab=Out}
N 760 -100 760 -50 {lab=Out}
N 760 -70 890 -70 {lab=Out}
N 760 -190 760 -160 {lab=#net1}
N 760 -260 760 -250 {lab=VDD}
N 760 -250 760 -220 {lab=VDD}
N 760 -130 840 -130 {lab=VDD}
N 840 -250 840 -130 {lab=VDD}
N 840 -260 840 -250 {lab=VDD}
N 760 -260 840 -260 {lab=VDD}
N 680 60 680 120 {lab=GND}
N 680 120 850 120 {lab=GND}
N 850 60 850 120 {lab=GND}
N 770 120 770 130 {lab=GND}
N 680 30 680 60 {lab=GND}
N 850 30 850 60 {lab=GND}
N 480 -110 630 -110 {lab=A}
N 630 -220 630 -110 {lab=A}
N 630 -220 720 -220 {lab=A}
N 480 -70 710 -70 {lab=B}
N 710 -130 710 -70 {lab=B}
N 710 -130 720 -130 {lab=B}
N 710 -70 710 -0 {lab=B}
N 710 0 790 -0 {lab=B}
N 790 -0 790 30 {lab=B}
N 790 30 810 30 {lab=B}
N 580 -110 580 30 {lab=A}
N 580 30 640 30 {lab=A}
C {symbols/pfet_03v3.sym} 740 -220 0 0 {name=M2
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
C {symbols/pfet_03v3.sym} 740 -130 0 0 {name=M1
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
C {devices/title.sym} 350 -350 0 0 {name=l1 author="M. Yoga Putrapratama
"}
C {symbols/nfet_03v3.sym} 660 30 0 0 {name=M3
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
C {symbols/nfet_03v3.sym} 830 30 0 0 {name=M4
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
C {devices/ipin.sym} 480 -110 0 0 {name=p1 lab=A}
C {devices/ipin.sym} 480 -70 0 0 {name=p3 lab=B}
C {devices/iopin.sym} 760 -260 3 0 {name=p4 lab=VDD}
C {devices/iopin.sym} 770 130 1 0 {name=p5 lab=GND
}
C {devices/opin.sym} 890 -70 0 0 {name=p2 lab=Out
}
