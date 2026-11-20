
# CACE Summary for gf180mcu_gp9t3v3__comp2_2

**netlist source**: rcx

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Area                 | magic_area           | area                 |               ​ |          ​ |            ​ |          ​ |     1200 µm² | 130.746 µm² |   Pass ✅    |
| Quiescent Current (I_Q / IDDQ) | ngspice              | i_quiescent          |               ​ |          ​ |      80.0 pA |  55.816 pA |   15000.0 pA |  55.816 pA |   Pass ✅    |
| Quiescent Power (P_Q) | ngspice              | p_quiescent          |               ​ |          ​ |     264.0 pW | 184.194 pW |   49500.0 pW | 184.194 pW |   Pass ✅    |
| Peak Switching Current | ngspice              | i_peak               |               ​ |          ​ |    2500.0 µA | 835.683 µA |    8000.0 µA | 835.683 µA |   Pass ✅    |
| Dynamic Switching Power | ngspice              | p_dynamic            |               ​ |          ​ |     250.0 µW | 137.034 µW |     800.0 µW | 137.034 µW |   Pass ✅    |
| Power-Up Inrush Current | ngspice              | i_inrush             |               ​ |          ​ |      15.0 µA |   1.227 µA |     150.0 µA |   1.227 µA |   Pass ✅    |
| Logic Switching Threshold (VM) | ngspice              | vm_G_sweepA          |           1.3 V |    1.531 V |       1.65 V |    1.531 V |        2.0 V |    1.531 V |   Pass ✅    |
| Max Propagation Delay (tpd) | ngspice              | tpd_max              |               ​ |          ​ |       0.7 ns |   0.653 ns |       2.0 ns |   0.653 ns |   Pass ✅    |
| Functional Truth-Table Error | ngspice              | func_total_err       |               ​ |          ​ |            ​ |          ​ |     100.0 mV |  17.216 mV |   Pass ✅    |


## Plots
