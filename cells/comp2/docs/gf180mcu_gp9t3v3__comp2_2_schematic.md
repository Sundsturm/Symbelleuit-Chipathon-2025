
# CACE Summary for gf180mcu_gp9t3v3__comp2_2

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Area                 | magic_area           | area                 |               ​ |          ​ |            ​ |          ​ |     1200 µm² |          ​ |   Skip 🟧    |
| Quiescent Current (I_Q / IDDQ) | ngspice              | i_quiescent          |               ​ |          ​ |      80.0 pA |  44.444 pA |   15000.0 pA |  44.444 pA |   Pass ✅    |
| Quiescent Power (P_Q) | ngspice              | p_quiescent          |               ​ |          ​ |     264.0 pW | 146.667 pW |   49500.0 pW | 146.667 pW |   Pass ✅    |
| Peak Switching Current | ngspice              | i_peak               |               ​ |          ​ |    2500.0 µA | 830.702 µA |    8000.0 µA | 830.702 µA |   Pass ✅    |
| Dynamic Switching Power | ngspice              | p_dynamic            |               ​ |          ​ |     250.0 µW | 133.408 µW |     800.0 µW | 133.408 µW |   Pass ✅    |
| Power-Up Inrush Current | ngspice              | i_inrush             |               ​ |          ​ |      15.0 µA |   1.258 µA |     150.0 µA |   1.258 µA |   Pass ✅    |
| Logic Switching Threshold (VM) | ngspice              | vm_G_sweepA          |           1.3 V |    1.530 V |       1.65 V |    1.530 V |        2.0 V |    1.530 V |   Pass ✅    |
| Max Propagation Delay (tpd) | ngspice              | tpd_max              |               ​ |          ​ |       0.7 ns |   0.626 ns |       2.0 ns |   0.626 ns |   Pass ✅    |
| Functional Truth-Table Error | ngspice              | func_total_err       |               ​ |          ​ |            ​ |          ​ |     100.0 mV |  13.253 mV |   Pass ✅    |


## Plots
