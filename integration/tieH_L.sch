v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -150 -50 -150 60 {
lab=G}
N -110 10 -110 30 {
lab=G}
N -150 10 -110 10 {
lab=G}
N -110 -20 -30 -20 {
lab=Z_1}
N -110 -120 -110 -80 {
lab=D}
N -110 -50 -90 -50 {
lab=D}
N -90 -90 -90 -50 {
lab=D}
N -110 -90 -90 -90 {
lab=D}
N -110 90 -110 130 {
lab=S}
N -110 60 -90 60 {
lab=S}
N -90 60 -90 100 {
lab=S}
N -110 100 -90 100 {
lab=S}
N 180 -50 180 60 {
lab=G2}
N 220 -120 220 -80 {
lab=D}
N 220 -50 240 -50 {
lab=D}
N 240 -90 240 -50 {
lab=D}
N 220 -90 240 -90 {
lab=D}
N 220 90 220 130 {
lab=S}
N 220 60 240 60 {
lab=S}
N 240 60 240 100 {
lab=S}
N 220 100 240 100 {
lab=S}
N 180 -20 220 -20 {
lab=G2}
N 220 30 330 30 {
lab=Z_2}
N -180 -10 -150 -10 {
lab=G}
N 120 0 180 0 {
lab=G2}
N -200 -10 -180 -10 {
lab=G}
N -110 130 220 130 {lab=S}
N -110 -120 220 -120 {lab=D}
C {symbols/nfet_03v3.sym} -130 60 0 0 {name=M1
L=0.6u
W=0.82u
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -130 -50 0 0 {name=M2
L=0.5u
W=1.22u
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
C {symbols/nfet_03v3.sym} 200 60 0 0 {name=M3
L=0.5u
W=1.22u
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 200 -50 0 0 {name=M4
L=0.5u
W=1.22u
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
C {devices/opin.sym} -30 -20 0 0 {name=p3 lab=Z_1
}
C {devices/iopin.sym} 220 -120 3 0 {name=p4 lab=D}
C {devices/iopin.sym} 220 130 3 1 {name=p6 lab=S}
C {devices/opin.sym} 330 30 0 0 {name=p8 lab=Z_2
}
C {devices/lab_pin.sym} -200 -10 0 0 {name=l2 sig_type=std_logic lab=G}
C {devices/lab_pin.sym} 120 0 0 0 {name=l8 sig_type=std_logic lab=G2}
