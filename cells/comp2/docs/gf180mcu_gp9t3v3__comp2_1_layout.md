
# CACE Summary for gf180mcu_gp9t3v3__comp2_1

**netlist source**: layout

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Area                 | magic_area           | area                 |               ​ |          ​ |            ​ |          ​ |     1000 µm² | 100.266 µm² |   Pass ✅    |
| Quiescent Current (I_Q / IDDQ) | ngspice              | i_quiescent          |               ​ |          ​ |      50.0 pA |  44.146 pA |   10000.0 pA |  44.146 pA |   Pass ✅    |
| Quiescent Power (P_Q) | ngspice              | p_quiescent          |               ​ |          ​ |     165.0 pW | 145.682 pW |   33000.0 pW | 145.682 pW |   Pass ✅    |
| Peak Switching Current | ngspice              | i_peak               |               ​ |          ​ |    1500.0 µA | 647.811 µA |    5000.0 µA | 647.811 µA |   Pass ✅    |
| Dynamic Switching Power | ngspice              | p_dynamic            |               ​ |          ​ |     150.0 µW | 133.994 µW |     500.0 µW | 133.994 µW |   Pass ✅    |
| Power-Up Inrush Current | ngspice              | i_inrush             |               ​ |          ​ |      10.0 µA |   1.350 µA |     100.0 µA |   1.350 µA |   Pass ✅    |
| Logic Switching Threshold (VM) | ngspice              | vm_G_sweepA          |           1.3 V |    1.531 V |       1.65 V |    1.531 V |        2.0 V |    1.531 V |   Pass ✅    |
| Max Propagation Delay (tpd) | ngspice              | tpd_max              |               ​ |          ​ |       0.8 ns |   0.664 ns |       2.5 ns |   0.664 ns |   Pass ✅    |
| Functional Truth-Table Error | ngspice              | func_total_err       |               ​ |          ​ |            ​ |          ​ |     100.0 mV |  15.393 mV |   Pass ✅    |


## Plots
