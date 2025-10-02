v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 10 200 10 {lab=#net1}
N 200 10 200 400 {lab=#net1}
N 200 400 330 400 {lab=#net1}
N 100 -10 270 -10 {lab=#net2}
N 270 -10 270 110 {lab=#net2}
N 270 110 330 110 {lab=#net2}
N 100 -170 100 -30 {lab=#net3}
N 100 -170 330 -170 {lab=#net3}
N -130 -20 -0 -20 {lab=#net4}
N -130 -200 -130 -40 {lab=#net4}
N -130 -40 -130 -20 {lab=#net4}
N -180 100 -60 100 {lab=#net5}
N -60 10 -60 100 {lab=#net5}
N -60 10 -0 10 {lab=#net5}
N -180 -200 -130 -200 {lab=#net4}
N 590 70 680 70 {lab=E}
N 590 -210 670 -210 {lab=L}
N 590 360 690 360 {lab=G}
N 20 730 20 780 {lab=#net6}
N 20 780 510 780 {lab=#net6}
N 510 480 510 780 {lab=#net6}
N -360 280 -360 770 {lab=#net6}
N -360 770 -360 780 {lab=#net6}
N -360 780 20 780 {lab=#net6}
N 190 530 190 570 {lab=VSS}
N 190 530 470 530 {lab=VSS}
N 470 480 470 530 {lab=VSS}
N -320 530 190 530 {lab=VSS}
N -320 280 -320 530 {lab=VSS}
N 50 70 50 530 {lab=VSS}
N 150 -640 150 -610 {lab=VDD}
N 70 -610 150 -610 {lab=VDD}
N 50 -610 70 -610 {lab=VDD}
N 50 -610 50 -80 {lab=VDD}
N -340 -570 -110 -570 {lab=#net7}
N -350 -570 -340 -570 {lab=#net7}
N -360 -570 -350 -570 {lab=#net7}
N -360 -570 -360 -280 {lab=#net7}
N -300 -610 60 -610 {lab=VDD}
N -320 -610 -300 -610 {lab=VDD}
N -320 -610 -320 -280 {lab=VDD}
N 20 200 20 570 {lab=#net7}
N 20 200 470 200 {lab=#net7}
N 470 200 510 200 {lab=#net7}
N 510 200 510 220 {lab=#net7}
N 510 780 800 780 {lab=#net6}
N 800 -280 800 780 {lab=#net6}
N 800 -380 800 -280 {lab=#net6}
N -110 -380 800 -380 {lab=#net6}
N -110 -410 -110 -380 {lab=#net6}
N -70 -410 -70 530 {lab=VSS}
N -320 -10 -70 -10 {lab=VSS}
N -320 -20 -320 -10 {lab=VSS}
N 160 -70 160 200 {lab=#net7}
N 160 -80 160 -70 {lab=#net7}
N 170 -80 510 -80 {lab=#net7}
N 510 -80 510 -70 {lab=#net7}
N 160 -80 170 -80 {lab=#net7}
N -110 -380 -110 -0 {lab=#net6}
N -360 -0 -110 0 {lab=#net6}
N -360 -20 -360 0 {lab=#net6}
N 510 -90 800 -90 {lab=#net6}
N 510 190 800 190 {lab=#net6}
N -580 -570 -360 -570 {lab=#net7}
N -580 -570 -580 420 {lab=#net7}
N -580 420 -580 530 {lab=#net7}
N -580 530 -580 550 {lab=#net7}
N -580 550 20 550 {lab=#net7}
N -490 -140 -440 -140 {lab=A}
N -490 160 -440 160 {lab=B}
N -580 20 -360 20 {lab=#net7}
N -20 -140 50 -140 {lab=VDD}
N -20 -140 -20 420 {lab=VDD}
N -20 420 60 420 {lab=VDD}
N 60 420 60 570 {lab=VDD}
N -200 30 -20 30 {lab=VDD}
N -200 20 -200 30 {lab=VDD}
N -320 20 -200 20 {lab=VDD}
N -20 220 470 220 {lab=VDD}
N 50 -350 470 -350 {lab=VDD}
N 50 -90 290 -90 {lab=VDD}
N 290 -90 290 -70 {lab=VDD}
N 290 -70 470 -70 {lab=VDD}
N 160 -370 160 -80 {lab=#net7}
N 160 -370 510 -370 {lab=#net7}
N 510 -370 510 -350 {lab=#net7}
N 50 190 470 190 {lab=VSS}
N 300 -90 470 -90 {lab=VSS}
N 300 -90 300 190 {lab=VSS}
C {gf180mcu_gp9t3v3__comp2_2.sym} 50 0 0 0 {name=x1}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} -440 280 0 0 {name=IO1
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_dvdd.sym} -190 -410 0 0 {name=IO2
model=gf180mcu_fd_io__dvdd
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_dvss.sym} -60 730 0 0 {name=IO3
model=gf180mcu_fd_io__dvss
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} -440 -20 0 0 {name=IO4
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 590 -90 0 1 {name=IO5
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 590 190 0 1 {name=IO6
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 590 480 0 1 {name=IO7
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {devices/ipin.sym} -490 -140 0 0 {name=p1 lab=A}
C {devices/opin.sym} 670 -210 0 0 {name=p2 lab=L}
C {devices/iopin.sym} 190 570 0 0 {name=p3 lab=VSS}
C {devices/ipin.sym} -490 160 0 0 {name=p4 lab=B}
C {devices/opin.sym} 680 70 0 0 {name=p5 lab=E}
C {devices/opin.sym} 690 360 0 0 {name=p6 lab=G}
C {devices/iopin.sym} 150 -640 0 0 {name=p7 lab=VDD}
