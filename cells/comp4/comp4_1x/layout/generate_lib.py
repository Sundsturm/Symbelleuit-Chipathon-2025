#!/usr/bin/env python3
"""
SPICE to Liberty (.lib) Generator for 2-bit Comparator
Generates timing and power characterization data from SPICE simulation
"""

import os
import subprocess
import re
import numpy as np
from datetime import datetime

class SPICELibGenerator:
    def __init__(self, spice_file, lib_name="analysis_comp4"):
        self.spice_file = spice_file
        self.lib_name = lib_name
        self.vdd = 3.3
        self.vss = 0.0
        self.temp = 25
        
        # Define input/output pins
        self.inputs = ['A0', 'A1', 'B0', 'B1']
        self.outputs = ['L', 'G', 'E']
        
        # Timing measurement points (20% and 80% of VDD)
        self.vil = 0.2 * self.vdd  # 0.66V
        self.vih = 0.8 * self.vdd  # 2.64V
        self.vol = 0.2 * self.vdd
        self.voh = 0.8 * self.vdd
        self.vth = 0.5 * self.vdd  # 1.65V
        
        # Characterization parameters
        self.slew_rates = [0.1, 0.5, 1.0, 2.0]  # ns
        self.load_caps = [0.01, 0.05, 0.1, 0.2]  # pF
        
    def generate_char_spice(self, input_pin, output_pin, slew, load, transition='rise'):
        """Generate SPICE netlist for timing characterization"""
        
        # Create stimulus pattern
        if transition == 'rise':
            v_start, v_end = 0, self.vdd
        else:
            v_start, v_end = self.vdd, 0
            
        # Calculate rise/fall time for slew rate
        tr_time = slew * (self.voh - self.vol) / self.vdd
        
        # Read the original SPICE file to get subcircuit definition
        subckt_content = ""
        try:
            with open(self.spice_file, 'r') as f:
                lines = f.readlines()
                
            # Extract subcircuit definition (from .subckt to .ends)
            in_subckt = False
            for line in lines:
                if line.strip().startswith('.subckt'):
                    in_subckt = True
                if in_subckt:
                    subckt_content += line
                if line.strip() == '.ends':
                    break
        except FileNotFoundError:
            print(f"Warning: Could not find {self.spice_file}")
            subckt_content = "* Subcircuit not found\n"
        
        spice_content = f"""* Timing characterization: {input_pin} -> {output_pin}
* Slew: {slew}ns, Load: {load}pF, Transition: {transition}

.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical

* Subcircuit definition
{subckt_content}

* Supply voltages
VDD VDD 0 {self.vdd}
VSS VSS 0 0

* Input stimulus with controlled slew
V{input_pin} {input_pin} 0 PWL(0n {v_start} 5n {v_start} {5+tr_time}n {v_end} {15+tr_time}n {v_end})

* Other inputs at default state (all combinations need to be tested)
"""
        
        # Set other inputs to known states
        for pin in self.inputs:
            if pin != input_pin:
                spice_content += f"V{pin} {pin} 0 0\n"
                
        # Add load capacitance
        spice_content += f"CL{output_pin} {output_pin} 0 {load}p\n"
        
        # Include DUT
        spice_content += f"""
* Device Under Test
Xdut VDD VSS B0 A0 B1 A1 L G E x2bit_comp_1x

* Measurements
.param tr_start={5}n
.param tr_end={5+tr_time}n

* Input transition time
.meas tran input_slew trig v({input_pin}) val={self.vil} {transition}=1 targ v({input_pin}) val={self.vih} {transition}=1

* Propagation delay
.meas tran tpd trig v({input_pin}) val={self.vth} {transition}=1 targ v({output_pin}) val={self.vth} {'fall' if transition=='rise' else 'rise'}=1

* Output transition time  
.meas tran output_slew trig v({output_pin}) val={self.vol} {'fall' if transition=='rise' else 'rise'}=1 targ v({output_pin}) val={self.voh} {'fall' if transition=='rise' else 'rise'}=1

* Power measurement
.meas tran avg_power avg p(VDD) from=0n to={20+tr_time}n

* Simulation control
.tran 0.01n {25+tr_time}n
.temp {self.temp}

.control
    run
    print input_slew output_slew tpd avg_power
    exit
.endc

.end
"""
        return spice_content
    
    def run_spice_sim(self, spice_content, temp_file="temp_char.sp"):
        """Run SPICE simulation and extract measurements"""
        
        with open(temp_file, 'w') as f:
            f.write(spice_content)
        
        try:
            # Run ngspice
            result = subprocess.run(['ngspice', '-b', temp_file], 
                                 capture_output=True, text=True, timeout=30)
            
            if result.returncode != 0:
                print(f"SPICE simulation failed: {result.stderr}")
                return None
                
            # Extract measurements from output
            output = result.stdout
            measurements = {}
            
            # Parse measurement results
            for line in output.split('\n'):
                if 'input_slew' in line:
                    match = re.search(r'input_slew\s*=\s*([\d.e+-]+)', line)
                    if match:
                        measurements['input_slew'] = float(match.group(1)) * 1e9  # Convert to ns
                        
                if 'output_slew' in line:
                    match = re.search(r'output_slew\s*=\s*([\d.e+-]+)', line)
                    if match:
                        measurements['output_slew'] = float(match.group(1)) * 1e9
                        
                if 'tpd' in line and 'tpd' in measurements:  # Avoid multiple matches
                    match = re.search(r'tpd\s*=\s*([\d.e+-]+)', line)
                    if match:
                        measurements['tpd'] = float(match.group(1)) * 1e9
                        
                if 'avg_power' in line:
                    match = re.search(r'avg_power\s*=\s*([\d.e+-]+)', line)
                    if match:
                        measurements['avg_power'] = float(match.group(1)) * 1e6  # Convert to uW
            
            return measurements
            
        except subprocess.TimeoutExpired:
            print("SPICE simulation timed out")
            return None
        except Exception as e:
            print(f"Error running SPICE: {e}")
            return None
        finally:
            # Clean up temp file
            if os.path.exists(temp_file):
                os.remove(temp_file)
    
    def characterize_timing_arc(self, input_pin, output_pin):
        """Characterize timing arc between input and output pins"""
        
        timing_data = {
            'cell_rise': [],
            'cell_fall': [], 
            'rise_transition': [],
            'fall_transition': [],
            'rise_power': [],
            'fall_power': []
        }
        
        print(f"Characterizing {input_pin} -> {output_pin}")
        
        for slew in self.slew_rates:
            rise_row = []
            fall_row = []
            rise_trans_row = []
            fall_trans_row = []
            rise_pwr_row = []
            fall_pwr_row = []
            
            for load in self.load_caps:
                print(f"  Slew: {slew}ns, Load: {load}pF", end="")
                
                # Rise transition
                spice_content = self.generate_char_spice(input_pin, output_pin, slew, load, 'rise')
                rise_meas = self.run_spice_sim(spice_content)
                
                if rise_meas:
                    rise_row.append(rise_meas.get('tpd', 0.5))
                    rise_trans_row.append(rise_meas.get('output_slew', 0.1))
                    rise_pwr_row.append(rise_meas.get('avg_power', 1.0))
                    print(" ✓", end="")
                else:
                    rise_row.append(0.5)  # Default values
                    rise_trans_row.append(0.1)
                    rise_pwr_row.append(1.0)
                    print(" ✗", end="")
                
                # Fall transition  
                spice_content = self.generate_char_spice(input_pin, output_pin, slew, load, 'fall')
                fall_meas = self.run_spice_sim(spice_content)
                
                if fall_meas:
                    fall_row.append(fall_meas.get('tpd', 0.5))
                    fall_trans_row.append(fall_meas.get('output_slew', 0.1))
                    fall_pwr_row.append(fall_meas.get('avg_power', 1.0))
                    print(" ✓")
                else:
                    fall_row.append(0.5)
                    fall_trans_row.append(0.1)
                    fall_pwr_row.append(1.0)
                    print(" ✗")
            
            timing_data['cell_rise'].append(rise_row)
            timing_data['cell_fall'].append(fall_row)
            timing_data['rise_transition'].append(rise_trans_row)
            timing_data['fall_transition'].append(fall_trans_row)
            timing_data['rise_power'].append(rise_pwr_row)
            timing_data['fall_power'].append(fall_pwr_row)
        
        return timing_data
    
    def generate_lookup_table(self, data, name):
        """Generate Liberty lookup table format"""
        
        table_str = f'        lu_table_template({name}) {{\n'
        
        # Add index arrays
        table_str += f'          index_1 ("{", ".join(map(str, self.slew_rates))}");\n'
        table_str += f'          index_2 ("{", ".join(map(str, self.load_caps))}");\n'
        table_str += '          values ( \\\n'
        
        # Add data values
        for i, row in enumerate(data):
            values_str = ', '.join([f'{val:.6f}' for val in row])
            if i == len(data) - 1:
                table_str += f'            "{values_str}" \\\n'
            else:
                table_str += f'            "{values_str}", \\\n'
        
        table_str += '          );\n'
        table_str += '        }\n'
        
        return table_str
    
    def generate_liberty_file(self, timing_results):
        """Generate complete Liberty (.lib) file"""
        
        lib_content = f"""/* Liberty file for {self.lib_name} 
 * Generated on {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}
 * Technology: GF180MCU
 */

library({self.lib_name}) {{
  
  comment                        : "2-bit Comparator Library";
  delay_model                    : table_lookup;
  simulation                     : false;
  capacitive_load_unit (1,pF);
  leakage_power_unit             : 1nW;
  current_unit                   : "1uA";
  pulling_resistance_unit        : "1kOhm";
  time_unit                      : "1ns";
  voltage_unit                   : "1V";
  
  input_threshold_pct_rise       : 50;
  input_threshold_pct_fall       : 50;
  output_threshold_pct_rise      : 50;
  output_threshold_pct_fall      : 50;
  
  slew_lower_threshold_pct_rise  : 20;
  slew_lower_threshold_pct_fall  : 20;
  slew_upper_threshold_pct_rise  : 80;
  slew_upper_threshold_pct_fall  : 80;
  slew_derate_from_library       : 1.0;
  
  nom_process                    : 1;
  nom_temperature                : {self.temp};
  nom_voltage                    : {self.vdd};
  
  operating_conditions(typical) {{
    process     : 1;
    temperature : {self.temp};
    voltage     : {self.vdd};
  }}
  
  default_operating_conditions : typical;
  
  /* Lookup table templates */
  lu_table_template(delay_template_5x5) {{
    variable_1 : input_net_transition;
    variable_2 : total_output_net_capacitance;
    index_1 ("{", ".join(map(str, self.slew_rates))}");\n    index_2 ("{", ".join(map(str, self.load_caps))}");\n  }}
  
  /* Power lookup table template */
  power_lut_template(power_template_5x5) {{
    variable_1 : input_transition_time;
    variable_2 : total_output_net_capacitance;
    index_1 ("{", ".join(map(str, self.slew_rates))}");\n    index_2 ("{", ".join(map(str, self.load_caps))}");\n  }}
  
  /* Cell definition */
  cell(2bit_comp_1x) {{
    area : 100.0;
    
    /* Input pins */
"""

        # Add input pin definitions
        for pin in self.inputs:
            lib_content += f"""    pin({pin}) {{
      direction : input;
      capacitance : 0.01;
    }}
    
"""

        # Add output pin definitions with timing arcs
        for output_pin in self.outputs:
            lib_content += f"""    pin({output_pin}) {{
      direction : output;
      
      /* Boolean function */"""
            
            # Add function based on pin
            if output_pin == 'L':
                lib_content += '\n      function : "(!A1 & B1) | ((!(B1 ^ A1)) & !A0 & B0)";\n'
            elif output_pin == 'G':  
                lib_content += '\n      function : "(A1 & !B1) | ((!(B1 ^ A1)) & A0 & !B0)";\n'
            else:  # E
                lib_content += '\n      function : "(!(B1 ^ A1)) & (!(B0 ^ A0))";\n'
            
            lib_content += f"""      
      /* Timing arcs */"""
            
            # Add timing arcs for each input
            for input_pin in self.inputs:
                if f"{input_pin}_{output_pin}" in timing_results:
                    timing_data = timing_results[f"{input_pin}_{output_pin}"]
                    
                    lib_content += f"""
      timing() {{
        related_pin : "{input_pin}";
        timing_sense : non_unate;
        
        cell_rise(delay_template_5x5) {{
{self.generate_lookup_table(timing_data['cell_rise'], 'delay_template_5x5')}        }}
        
        cell_fall(delay_template_5x5) {{
{self.generate_lookup_table(timing_data['cell_fall'], 'delay_template_5x5')}        }}
        
        rise_transition(delay_template_5x5) {{
{self.generate_lookup_table(timing_data['rise_transition'], 'delay_template_5x5')}        }}
        
        fall_transition(delay_template_5x5) {{
{self.generate_lookup_table(timing_data['fall_transition'], 'delay_template_5x5')}        }}
      }}"""
            
            lib_content += f"""
    }}
    
"""
        
        lib_content += """  }
}"""
        
        return lib_content
    
    def run_full_characterization(self, output_dir="postlayout_lib"):
        """Run complete timing characterization"""
        
        print(f"Starting full characterization of {self.lib_name}")
        print(f"VDD: {self.vdd}V, Temperature: {self.temp}°C")
        print(f"Slew rates: {self.slew_rates} ns")
        print(f"Load capacitances: {self.load_caps} pF\n")
        
        # Create output directory
        os.makedirs(output_dir, exist_ok=True)
        
        # Characterize all timing arcs
        timing_results = {}
        
        for input_pin in self.inputs:
            for output_pin in self.outputs:
                arc_name = f"{input_pin}_{output_pin}"
                timing_results[arc_name] = self.characterize_timing_arc(input_pin, output_pin)
        
        # Generate Liberty file
        print(f"\nGenerating Liberty file...")
        lib_content = self.generate_liberty_file(timing_results)
        
        # Write to file
        lib_file = os.path.join(output_dir, f"{self.lib_name}.lib")
        with open(lib_file, 'w') as f:
            f.write(lib_content)
            
        print(f"Liberty file generated: {lib_file}")
        return lib_file

def main():
    # Initialize generator - Update this path to your actual SPICE file
    spice_file = "./2bit_comp_1x.spice"  # Change this to your actual file path
    
    # Check if SPICE file exists
    if not os.path.exists(spice_file):
        print(f"Error: SPICE file '{spice_file}' not found!")
        print("Please update the spice_file path in main() function")
        return
    
    generator = SPICELibGenerator(spice_file)
    
    # Run characterization
    lib_file = generator.run_full_characterization()
    
    print(f"\nCharacterization complete!")
    print(f"Generated Liberty file: {lib_file}")

if __name__ == "__main__":
    main()
