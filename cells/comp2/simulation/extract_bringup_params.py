#!/usr/bin/env python3
"""
Extract simulation metrics and format them into safe laboratory limits for:
1. DC Power Supply
2. Signal / Function Generator
"""
import re
import os

def parse_meas_log(filepath):
    results = {}
    if not os.path.exists(filepath):
        return results
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Extract meas lines
    meas_matches = re.findall(r'^\s*([a-zA-Z0-9_]+)\s*=\s*([+-]?\d+\.?\d*(?:[eE][+-]?\d+)?)', content, re.M)
    for k, v in meas_matches:
        try:
            results[k] = float(v)
        except ValueError:
            pass
    return results

def main():
    pre = parse_meas_log('prelayout.log')
    clean = parse_meas_log('postlayout_clean.log')
    rcx = parse_meas_log('postlayout_rcx.log')

    print("\n" + "="*80)
    print("      SIMULATION METRICS COMPARISON (PRELAYOUT vs. RCX POST-LAYOUT)")
    print("="*80)
    print(f"{'Metric':<25} | {'Prelayout':<15} | {'Clean Layout':<15} | {'RCX (Sign-Off)':<15}")
    print("-" * 80)
    
    metrics = [
        ('Peak Current (i_peak)', 'i_peak', 'A'),
        ('Average Current (i_avg)', 'i_avg', 'A'),
        ('tpd (A -> G LH)', 'tpd_g_lh', 's'),
        ('tpd (A -> G HL)', 'tpd_g_hl', 's'),
        ('tpd (B -> L LH)', 'tpd_l_lh', 's'),
        ('tpd (A -> L HL)', 'tpd_l_hl', 's'),
        ('tpd (A -> E HL)', 'tpd_e_hl', 's'),
        ('tpd (A -> E LH)', 'tpd_e_lh', 's'),
    ]

    for label, key, unit in metrics:
        v_pre = f"{pre.get(key, 0.0):.3e} {unit}" if key in pre else "N/A"
        v_clean = f"{clean.get(key, 0.0):.3e} {unit}" if key in clean else "N/A"
        v_rcx = f"{rcx.get(key, 0.0):.3e} {unit}" if key in rcx else "N/A"
        print(f"{label:<25} | {v_pre:<15} | {v_clean:<15} | {v_rcx:<15}")

    print("\n" + "="*80)
    print("   PHYSICAL LABORATORY BRING-UP LIMITS (RECOMMENDED SAFE SETTINGS)")
    print("="*80)
    
    i_peak_rcx = rcx.get('i_peak', 2.5e-3)
    tpd_values = [v for k, v in rcx.items() if k.startswith('tpd_')]
    tpd_max = max(tpd_values) if tpd_values else 1.2e-9
    f_max_est = (1.0 / (2.0 * tpd_max)) / 1e6 if tpd_max > 0 else 200.0

    print("1. DC POWER SUPPLY BENCH SETTINGS:")
    print(f"   * Nominal Core Voltage (VDD) : 3.30 V (GF180MCU 3.3V Core)")
    print(f"   * Over-Voltage Protection   : 3.60 V (+10% margin, strictly below oxide breakdown)")
    print(f"   * Static Bring-Up OCP Limit : 10.0 mA - 20.0 mA (Safe initial compliance)")
    print(f"   * Dynamic Current Limit     : {i_peak_rcx*2e3:.2f} mA (2x peak switching margin)")
    print(f"   * Power Sequencing          : Turn ON VDD prior to enabling Signal Generator inputs!")

    print("\n2. SIGNAL / FUNCTION GENERATOR BENCH SETTINGS:")
    print(f"   * Output Load Mode          : [HIGH-Z] (CRITICAL: Do NOT set to 50 Ohm to avoid 6.6V double voltage!)")
    print(f"   * High Level (V_High)       : 3.30 V")
    print(f"   * Low Level (V_Low)         : 0.00 V (Strictly non-negative)")
    print(f"   * Maximum Frequency (f_max) : ~{f_max_est:.1f} MHz (Simulated post-layout RCX ceiling)")
    print(f"   * Initial Bring-Up Clock    : 100 kHz - 1 MHz (Safe functional verification start)")
    print(f"   * Rise / Fall Time (tr, tf) : 2.0 ns - 5.0 ns (To prevent ringing/overshoot on socket wires)")
    print("="*80 + "\n")

if __name__ == '__main__':
    main()
