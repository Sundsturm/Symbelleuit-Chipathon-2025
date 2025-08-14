v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 270 100 270 120 {lab=VDD}
N 270 100 540 100 {lab=VDD}
N 540 100 540 120 {lab=VDD}
N 540 120 540 150 {lab=VDD}
N 270 120 270 150 {lab=VDD}
N 270 180 270 200 {lab=#net1}
N 270 230 310 230 {lab=VDD}
N 510 230 540 230 {lab=VDD}
N 310 230 380 230 {lab=VDD}
N 380 100 380 230 {lab=VDD}
N 430 230 510 230 {lab=VDD}
N 430 100 430 230 {lab=VDD}
N 540 180 540 200 {lab=#net2}
N 270 260 270 290 {lab=Out}
N 270 290 540 290 {lab=Out}
N 540 260 540 290 {lab=Out}
N 270 290 270 330 {lab=Out}
N 540 290 540 330 {lab=Out}
N 270 480 270 500 {lab=GND}
N 270 500 540 500 {lab=GND}
N 540 480 540 500 {lab=GND}
N 400 500 400 510 {lab=GND}
N 270 450 270 480 {lab=GND}
N 540 450 540 480 {lab=GND}
N 270 360 380 360 {lab=GND}
N 380 360 380 500 {lab=GND}
N 440 360 540 360 {lab=GND}
N 430 360 440 360 {lab=GND}
N 430 360 430 500 {lab=GND}
N 540 390 540 420 {lab=#net3}
N 270 390 270 420 {lab=#net4}
N 40 190 40 210 {lab=#net5}
N -30 160 0 160 {lab=A}
N -30 160 -30 240 {lab=A}
N -30 240 -0 240 {lab=A}
N -40 200 -30 200 {lab=A}
N 40 100 40 130 {lab=VDD}
N 40 100 270 100 {lab=VDD}
N 40 130 40 160 {lab=VDD}
N 40 240 40 270 {lab=GND}
N -10 440 -10 470 {lab=GND}
N 40 470 40 500 {lab=GND}
N 40 500 270 500 {lab=GND}
N 40 270 40 470 {lab=GND}
N -10 470 -10 500 {lab=GND}
N -10 500 50 500 {lab=GND}
N -10 100 -10 330 {lab=VDD}
N -10 100 40 100 {lab=VDD}
N -70 360 -50 360 {lab=B}
N -70 360 -70 440 {lab=B}
N -70 440 -50 440 {lab=B}
N -90 400 -70 400 {lab=B}
N -10 390 -10 410 {lab=#net6}
N -10 330 -10 360 {lab=VDD}
N 40 200 110 200 {lab=#net5}
N 110 20 110 200 {lab=#net5}
N 110 20 640 20 {lab=#net5}
N 640 20 640 150 {lab=#net5}
N 580 150 640 150 {lab=#net5}
N -10 400 90 400 {lab=#net6}
N 90 400 90 570 {lab=#net6}
N 90 570 620 570 {lab=#net6}
N 580 230 620 230 {lab=#net6}
N -20 240 -20 280 {lab=A}
N -20 280 150 280 {lab=A}
N 150 150 150 280 {lab=A}
N 150 150 230 150 {lab=A}
N -60 310 -60 360 {lab=B}
N -60 310 200 310 {lab=B}
N 200 230 200 310 {lab=B}
N 200 230 230 230 {lab=B}
N 210 150 210 360 {lab=A}
N 210 360 230 360 {lab=A}
N 90 450 230 450 {lab=#net6}
N 410 80 410 100 {lab=VDD}
N 640 150 640 360 {lab=#net5}
N 580 360 640 360 {lab=#net5}
N 620 230 620 570 {lab=#net6}
N -70 440 -70 540 {lab=B}
N -70 540 580 540 {lab=B}
N 580 450 580 540 {lab=B}
N 540 290 700 290 {lab=Out}
C {devices/title.sym} 0 -40 0 0 {name=l1 author="M. Yoga Putrapratama
"}
C {symbols/pfet_03v3.sym} 250 150 0 0 {name=M2
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
C {symbols/nfet_03v3.sym} 250 360 0 0 {name=M4
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
C {symbols/pfet_03v3.sym} 250 230 0 0 {name=M1
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
C {symbols/pfet_03v3.sym} 560 150 0 1 {name=M3
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
C {symbols/pfet_03v3.sym} 560 230 0 1 {name=M5
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
C {symbols/nfet_03v3.sym} 250 450 0 0 {name=M6
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
C {symbols/nfet_03v3.sym} 560 360 0 1 {name=M7
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
C {symbols/nfet_03v3.sym} 560 450 0 1 {name=M8
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
C {devices/iopin.sym} 410 80 3 0 {name=p4 lab=VDD}
C {devices/iopin.sym} 400 510 1 0 {name=p5 lab=GND
}
C {devices/ipin.sym} -40 200 0 0 {name=p1 lab=A}
C {devices/ipin.sym} -90 400 0 0 {name=p3 lab=B}
C {symbols/pfet_03v3.sym} 20 160 0 0 {name=M9
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
C {symbols/pfet_03v3.sym} -30 360 0 0 {name=M10
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
C {symbols/nfet_03v3.sym} 20 240 0 0 {name=M11
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
C {symbols/nfet_03v3.sym} -30 440 0 0 {name=M12
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
C {devices/opin.sym} 700 290 0 0 {name=p2 lab=Out}
