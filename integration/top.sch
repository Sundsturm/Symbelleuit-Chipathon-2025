v {xschem version=3.4.7 file_version=1.2
* Copyright 2022 GlobalFoundries PDK Authors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     https://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.

}
G {}
K {}
V {}
S {}
E {}
N 720 680 820 680 {lab=#net1}
N 820 680 820 1070 {lab=#net1}
N 820 1070 950 1070 {lab=#net1}
N 720 660 890 660 {lab=#net2}
N 890 660 890 780 {lab=#net2}
N 890 780 950 780 {lab=#net2}
N 720 500 720 640 {lab=#net3}
N 720 500 950 500 {lab=#net3}
N 490 650 620 650 {lab=#net4}
N 490 470 490 630 {lab=#net4}
N 490 630 490 650 {lab=#net4}
N 440 770 560 770 {lab=#net5}
N 560 680 560 770 {lab=#net5}
N 560 680 620 680 {lab=#net5}
N 440 470 490 470 {lab=#net4}
N 1210 740 1300 740 {lab=E}
N 1210 460 1290 460 {lab=L}
N 1210 1030 1310 1030 {lab=G}
N 130 530 180 530 {lab=A}
N 130 830 180 830 {lab=B}
N 1090 600 1130 600 {lab=VDD}
N 1090 580 1130 580 {lab=VSS}
N 1090 320 1130 320 {lab=VDD}
N 1090 860 1130 860 {lab=VSS}
N 1090 890 1130 890 {lab=VDD}
N 260 950 300 950 {lab=VSS}
N 780 110 820 110 {lab=VDD}
N 260 390 300 390 {lab=VDD}
N 260 650 300 650 {lab=VSS}
N 260 690 300 690 {lab=VDD}
N 510 260 550 260 {lab=VSS}
N 1090 1150 1130 1150 {lab=VSS}
N 800 50 800 110 {lab=VDD}
N 800 50 840 50 {lab=VDD}
N 530 260 530 300 {lab=VSS}
N 530 300 540 300 {lab=VSS}
N 780 270 780 290 {lab=VSS}
N 670 740 670 760 {lab=VSS}
N 280 950 280 970 {lab=VSS}
N 280 650 280 660 {lab=VSS}
N 240 660 280 660 {lab=VSS}
N 1260 200 1260 230 {lab=VSS}
N 1260 100 1260 140 {lab=VDD}
N 2280 660 2380 660 {lab=#net6}
N 2380 660 2380 1050 {lab=#net6}
N 2380 1050 2510 1050 {lab=#net6}
N 2280 640 2450 640 {lab=#net7}
N 2450 640 2450 760 {lab=#net7}
N 2450 760 2510 760 {lab=#net7}
N 2280 480 2280 620 {lab=#net8}
N 2280 480 2510 480 {lab=#net8}
N 2050 630 2180 630 {lab=#net9}
N 2050 450 2050 610 {lab=#net9}
N 2050 610 2050 630 {lab=#net9}
N 2000 750 2120 750 {lab=#net10}
N 2120 660 2120 750 {lab=#net10}
N 2120 660 2180 660 {lab=#net10}
N 2000 450 2050 450 {lab=#net9}
N 2770 720 2860 720 {lab=E}
N 2770 440 2850 440 {lab=L}
N 2770 1010 2870 1010 {lab=G}
N 1690 510 1740 510 {lab=A}
N 1690 810 1740 810 {lab=B}
N 2650 580 2690 580 {lab=VDD}
N 2650 560 2690 560 {lab=VSS}
N 2650 300 2690 300 {lab=VDD}
N 2650 840 2690 840 {lab=VSS}
N 2650 870 2690 870 {lab=VDD}
N 1820 930 1860 930 {lab=VSS}
N 1820 370 1860 370 {lab=VDD}
N 1820 630 1860 630 {lab=VSS}
N 1820 670 1860 670 {lab=VDD}
N 2650 1130 2690 1130 {lab=VSS}
N 2230 720 2230 740 {lab=VSS}
N 1840 930 1840 950 {lab=VSS}
N 1840 630 1840 640 {lab=VSS}
N 1800 640 1840 640 {lab=VSS}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Integration Padframe"}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 180 950 0 0 {name=IO1
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_dvdd.sym} 430 260 0 0 {name=IO2
model=gf180mcu_fd_io__dvdd
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_dvss.sym} 700 270 0 0 {name=IO3
model=gf180mcu_fd_io__dvss
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 180 650 0 0 {name=IO4
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 1210 580 0 1 {name=IO5
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 1210 860 0 1 {name=IO6
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 1210 1150 0 1 {name=IO7
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {devices/ipin.sym} 130 530 0 0 {name=p1 lab=A}
C {devices/opin.sym} 1290 460 0 0 {name=p2 lab=L}
C {devices/iopin.sym} 540 300 0 0 {name=p3 lab=VSS}
C {devices/ipin.sym} 130 830 0 0 {name=p4 lab=B}
C {devices/opin.sym} 1300 740 0 0 {name=p5 lab=E}
C {devices/opin.sym} 1310 1030 0 0 {name=p6 lab=G}
C {devices/iopin.sym} 840 50 0 0 {name=p7 lab=VDD}
C {cells/D17_Symbelleuit/gf180mcu_gp9t3v3__comp2_2.sym} 670 670 0 0 {name=x1}
C {devices/lab_pin.sym} 530 290 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 780 290 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 670 760 0 0 {name=p10 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 280 970 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 240 660 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1090 580 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1090 1150 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1090 860 0 0 {name=p15 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 510 100 0 0 {name=p16 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 800 90 0 0 {name=p17 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 260 390 0 0 {name=p18 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 260 690 0 0 {name=p19 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 1090 320 0 0 {name=p20 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 1090 600 0 0 {name=p21 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 1090 890 0 0 {name=p22 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 670 590 0 0 {name=p23 sig_type=std_logic lab=VDD

}
C {tieH_L.sym} 1110 170 0 0 {name=x2}
C {devices/lab_pin.sym} 1260 100 0 0 {name=p24 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 1260 230 0 0 {name=p25 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1260 160 0 1 {name=p26 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 1260 180 0 1 {name=p27 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 440 430 0 1 {name=p28 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 440 730 0 1 {name=p29 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 950 540 0 0 {name=p30 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 1260 160 0 1 {name=p31 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 950 820 0 0 {name=p32 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 950 1110 0 0 {name=p33 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 950 1030 0 0 {name=p34 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 950 1050 0 0 {name=p35 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 950 740 0 0 {name=p36 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 950 760 0 0 {name=p37 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 950 460 0 0 {name=p38 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 950 480 0 0 {name=p39 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 440 910 0 1 {name=p44 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 440 610 0 1 {name=p45 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 950 930 0 0 {name=p46 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 950 640 0 0 {name=p47 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 950 360 0 0 {name=p48 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 950 800 0 0 {name=p49 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 950 1090 0 0 {name=p50 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 950 520 0 0 {name=p51 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 440 510 0 1 {name=p40 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 440 490 0 1 {name=p41 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 440 450 0 1 {name=p42 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 440 790 0 1 {name=p43 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 440 810 0 1 {name=p52 sig_type=std_logic lab=H}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 1740 930 0 0 {name=IO8
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 1740 630 0 0 {name=IO9
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 2770 560 0 1 {name=IO10
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 2770 840 0 1 {name=IO11
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_bi_t.sym} 2770 1130 0 1 {name=IO12
model=gf180mcu_fd_io__bi_t
spiceprefix=X
}
C {devices/ipin.sym} 1690 510 0 0 {name=p53 lab=A}
C {devices/opin.sym} 2850 440 0 0 {name=p54 lab=L}
C {devices/ipin.sym} 1690 810 0 0 {name=p55 lab=B}
C {devices/opin.sym} 2860 720 0 0 {name=p56 lab=E}
C {devices/opin.sym} 2870 1010 0 0 {name=p57 lab=G}
C {devices/lab_pin.sym} 2230 740 0 0 {name=p58 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1840 950 0 0 {name=p59 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1800 640 0 0 {name=p60 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2650 560 0 0 {name=p61 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2650 1130 0 0 {name=p62 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2650 840 0 0 {name=p63 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1820 370 0 0 {name=p64 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 1820 670 0 0 {name=p65 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 2650 300 0 0 {name=p66 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 2650 580 0 0 {name=p67 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 2650 870 0 0 {name=p68 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 2230 570 0 0 {name=p69 sig_type=std_logic lab=VDD

}
C {devices/lab_pin.sym} 2000 410 0 1 {name=p70 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 2000 710 0 1 {name=p71 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 2510 520 0 0 {name=p72 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 2510 800 0 0 {name=p73 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 2510 1090 0 0 {name=p74 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 2510 1010 0 0 {name=p75 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 2510 1030 0 0 {name=p76 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2510 720 0 0 {name=p77 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 2510 740 0 0 {name=p78 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2510 440 0 0 {name=p79 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 2510 460 0 0 {name=p80 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2000 890 0 1 {name=p81 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2000 590 0 1 {name=p82 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2510 910 0 0 {name=p83 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2510 620 0 0 {name=p84 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2510 340 0 0 {name=p85 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2510 780 0 0 {name=p86 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2510 1070 0 0 {name=p87 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2510 500 0 0 {name=p88 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2000 490 0 1 {name=p89 sig_type=std_logic lab=H}
C {devices/lab_pin.sym} 2000 470 0 1 {name=p90 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2000 430 0 1 {name=p91 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2000 770 0 1 {name=p92 sig_type=std_logic lab=L}
C {devices/lab_pin.sym} 2000 790 0 1 {name=p93 sig_type=std_logic lab=H}
C {cells/D17_Symbelleuit/gf180mcu_gp9t3v3__comp2_1.sym} 2230 640 0 0 {name=x3}
