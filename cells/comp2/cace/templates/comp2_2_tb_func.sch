v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N -120 -220 -120 -200 {lab=VDD}
N -120 -50 -120 -30 {lab=GND}
N -190 -140 -170 -140 {lab=A}
N -190 -110 -170 -110 {lab=B}
N -70 -150 -50 -150 {lab=L}
N -70 -130 -50 -130 {lab=E}
N -70 -110 -50 -110 {lab=G}
N 50 -220 50 -200 {lab=VDD}
N 50 -140 50 -120 {lab=GND}
N 130 -220 130 -200 {lab=A}
N 130 -140 130 -120 {lab=GND}
N 210 -220 210 -200 {lab=B}
N 210 -140 210 -120 {lab=GND}
N 290 -220 290 -200 {lab=L}
N 290 -140 290 -120 {lab=GND}
N 370 -220 370 -200 {lab=E}
N 370 -140 370 -120 {lab=GND}
N 450 -220 450 -200 {lab=G}
N 450 -140 450 -120 {lab=GND}
C {code_shown.sym} -390 60 0 0 {name=MODELS only_toplevel=false value=".include $PDKPATH/libs.tech/ngspice/design.ngspice
.lib $PDKPATH/libs.tech/ngspice/sm141064.ngspice typical
.include /foss/designs/chipathon_2025/Symbelleuit-Chipathon-2025/cells/comp2/spice/comp2_2_netlist.spice"}
C {title.sym} -220 150 0 0 {name=l5 author="Symbelleuit"}
C {code.sym} -410 -100 0 0 {name=SIM_CONTROL only_toplevel=false value="* CACE Functional Truth-Table Error Simulation
.tran 100p 25n
.control
  run
  * State 00: A=0, B=0 -> L=0, E=3.3, G=0
  meas tran v_L_00 FIND v(L) AT=2.5n
  meas tran v_E_00 FIND v(E) AT=2.5n
  meas tran v_G_00 FIND v(G) AT=2.5n

  * State 01: A=0, B=1 -> L=3.3, E=0, G=0
  meas tran v_L_01 FIND v(L) AT=7.5n
  meas tran v_E_01 FIND v(E) AT=7.5n
  meas tran v_G_01 FIND v(G) AT=7.5n

  * State 11: A=1, B=1 -> L=0, E=3.3, G=0
  meas tran v_L_11 FIND v(L) AT=12.5n
  meas tran v_E_11 FIND v(E) AT=12.5n
  meas tran v_G_11 FIND v(G) AT=12.5n

  * State 10: A=1, B=0 -> L=0, E=0, G=3.3
  meas tran v_L_10 FIND v(L) AT=17.5n
  meas tran v_E_10 FIND v(E) AT=17.5n
  meas tran v_G_10 FIND v(G) AT=17.5n

  let err_00 = v_L_00 + abs(v_E_00 - 3.3) + v_G_00
  let err_01 = abs(v_L_01 - 3.3) + v_E_01 + v_G_01
  let err_11 = v_L_11 + abs(v_E_11 - 3.3) + v_G_11
  let err_10 = v_L_10 + v_E_10 + abs(v_G_10 - 3.3)
  let func_total_err = err_00 + err_01 + err_11 + err_10
  print func_total_err
  echo \"$&func_total_err\" > comp2_2_tb_func_0.data
.endc
.GLOBAL GND
"}
C {devices/lab_wire.sym} -120 -220 1 0 {name=p_vdd sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} -120 -30 3 0 {name=p_vss sig_type=std_logic lab=GND}
C {devices/lab_wire.sym} -190 -140 0 0 {name=p_a sig_type=std_logic lab=A}
C {devices/lab_wire.sym} -190 -110 0 0 {name=p_b sig_type=std_logic lab=B}
C {devices/lab_wire.sym} -50 -150 2 0 {name=p_l sig_type=std_logic lab=L}
C {devices/lab_wire.sym} -50 -130 2 0 {name=p_e sig_type=std_logic lab=E}
C {devices/lab_wire.sym} -50 -110 2 0 {name=p_g sig_type=std_logic lab=G}
C {gf180mcu_gp9t3v3__comp2_2.sym} -120 -120 0 0 {name=x1}
C {devices/vsource.sym} 50 -170 0 0 {name=VPOWER value=3.3 savecurrent=false}
C {devices/lab_wire.sym} 50 -220 0 0 {name=p_vp sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 50 -120 0 0 {name=p_vm sig_type=std_logic lab=GND}
C {devices/gnd.sym} 50 -120 0 0 {name=g_vp lab=GND}
C {devices/vsource.sym} 130 -170 0 0 {name=VA value="PWL(0 0 9.9n 0 10.1n 3.3 19.9n 3.3 20.1n 0 25n 0)" savecurrent=false}
C {devices/lab_wire.sym} 130 -220 0 0 {name=p_vap sig_type=std_logic lab=A}
C {devices/lab_wire.sym} 130 -120 0 0 {name=p_vam sig_type=std_logic lab=GND}
C {devices/gnd.sym} 130 -120 0 0 {name=g_va lab=GND}
C {devices/vsource.sym} 210 -170 0 0 {name=VB value="PWL(0 0 4.9n 0 5.1n 3.3 14.9n 3.3 15.1n 0 25n 0)" savecurrent=false}
C {devices/lab_wire.sym} 210 -220 0 0 {name=p_vbp sig_type=std_logic lab=B}
C {devices/lab_wire.sym} 210 -120 0 0 {name=p_vbm sig_type=std_logic lab=GND}
C {devices/gnd.sym} 210 -120 0 0 {name=g_vb lab=GND}
C {devices/capa.sym} 290 -170 0 0 {name=C_L value=50f m=1}
C {devices/lab_wire.sym} 290 -220 0 0 {name=p_clp sig_type=std_logic lab=L}
C {devices/lab_wire.sym} 290 -120 0 0 {name=p_clm sig_type=std_logic lab=GND}
C {devices/gnd.sym} 290 -120 0 0 {name=g_cl lab=GND}
C {devices/capa.sym} 370 -170 0 0 {name=C_E value=50f m=1}
C {devices/lab_wire.sym} 370 -220 0 0 {name=p_cep sig_type=std_logic lab=E}
C {devices/lab_wire.sym} 370 -120 0 0 {name=p_cem sig_type=std_logic lab=GND}
C {devices/gnd.sym} 370 -120 0 0 {name=g_ce lab=GND}
C {devices/capa.sym} 450 -170 0 0 {name=C_G value=50f m=1}
C {devices/lab_wire.sym} 450 -220 0 0 {name=p_cgp sig_type=std_logic lab=G}
C {devices/lab_wire.sym} 450 -120 0 0 {name=p_cgm sig_type=std_logic lab=GND}
C {devices/gnd.sym} 450 -120 0 0 {name=g_cg lab=GND}
