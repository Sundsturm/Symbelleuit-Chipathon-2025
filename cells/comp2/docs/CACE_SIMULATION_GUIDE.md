# CACE Characterization & Post-Silicon Physical Bring-Up Guide: `comp2` (GF180MCU 3.3V)

This document provides a comprehensive technical overview of the schematic prelayout architecture, post-layout extracted netlists (clean layout and RCX/PEX sign-off), the CACE (Circuit Automatic Characterization Engine) verification suite, and practical guidelines for translating simulation metrics into safe operating limits on physical laboratory instruments (**DC Power Supply** and **Signal/Function Generator**) during *post-silicon bring-up*.

---

## 1. Circuit Architecture & Subcircuit Interface (`comp2`)

The `comp2` macro is a static, fully complementary CMOS **1-Bit Digital Magnitude Comparator** fabricated using the **GlobalFoundries 180nm MCU (PDK `gf180mcuD`, 3.3V rail)** process.

### 1.1 Pinout & Logic Interface
The cell features 7 standardized pins conforming to the subcircuit definition across schematic, clean layout, and RCX extracted views:
```spice
.subckt gf180mcu_gp9t3v3__comp2_1 VDD L A E G B VSS
```

| Pin | Type | Direction | Function | Active State / Nominal Voltage |
|:---:|:---:|:---:|:---|:---|
| `VDD` | Power | Inout | Primary Core Power Supply | Nominal **3.3 V** (Safe operational range: 3.0 V – 3.6 V) |
| `VSS` | Ground | Inout | Primary Ground Reference | **0.0 V** |
| `A` | Signal | Input | Digital Input Bit A | Standard 3.3V CMOS logic level |
| `B` | Signal | Input | Digital Input Bit B | Standard 3.3V CMOS logic level |
| `L` | Signal | Output | Less Than Flag ($A < B$) | Active High when $A=0, B=1$ ($L = \overline{A} \cdot B$) |
| `E` | Signal | Output | Equality Flag ($A = B$) | Active High when $A=B$ ($E = \overline{A \oplus B}$) |
| `G` | Signal | Output | Greater Than Flag ($A > B$) | Active High when $A=1, B=0$ ($G = A \cdot \overline{B}$) |

### 1.2 Truth Table
| Input A | Input B | Output L ($A < B$) | Output E ($A = B$) | Output G ($A > B$) |
|:---:|:---:|:---:|:---:|:---:|
| 0 (0 V) | 0 (0 V) | 0 (0 V) | **1 (3.3 V)** | 0 (0 V) |
| 0 (0 V) | 1 (3.3 V) | **1 (3.3 V)** | 0 (0 V) | 0 (0 V) |
| 1 (3.3 V) | 1 (3.3 V) | 0 (0 V) | **1 (3.3 V)** | 0 (0 V) |
| 1 (3.3 V) | 0 (0 V) | 0 (0 V) | 0 (0 V) | **1 (3.3 V)** |

### 1.3 Cell Variants
- **`gf180mcu_gp9t3v3__comp2_1`**: Standard $1\times$ fan-out drive variant ($W_{n}=0.85\text{ }\mu\text{m}, W_{p}=1.7\text{ }\mu\text{m}$). This cell is **100% DRC and LVS Clean**, with a complete parasitic RC extraction netlist (`spice/rcx/`).
- **`gf180mcu_gp9t3v3__comp2_2`**: High-drive $2\times$ fan-out variant with doubled output stage transistor widths ($W_{n}=1.7\text{ }\mu\text{m}, W_{p}=3.4\text{ }\mu\text{m}$) for larger capacitive interconnect loads.

---

## 2. Directory Structure & File Manifest

| Category | File Path | Description |
|---|---|---|
| **CACE 5.2 Specification (1x)** | `cells/comp2/comp2_1.yaml` | CACE datasheet defining parameters, PVT conditions, limits, and tool bindings |
| **CACE 5.2 Specification (2x)** | `cells/comp2/comp2_2.yaml` | CACE datasheet for the 2x drive strength variant |
| **CACE Testbench Templates** | `cells/comp2/cace/templates/` | Native Xschem schematic templates (`.sch`) and standalone SPICE templates (`.spice`) |
| **Prelayout Netlist** | `cells/comp2/spice/schematic/gf180mcu_gp9t3v3__comp2_1.spice` | Ideal transistor netlist generated from Xschem schematic |
| **Post-Layout Netlist (Clean)** | `cells/comp2/spice/layout/gf180mcu_gp9t3v3__comp2_1.spice` | Extracted netlist from Magic layout without parasitic R-C |
| **Post-Layout Netlist (RCX)** | `cells/comp2/spice/rcx/gf180mcu_gp9t3v3__comp2_1.spice` | Parasitic-extracted sign-off netlist with interconnect resistors and coupling capacitors |
| **Master CACE Runner** | `cells/comp2/run_cace.sh` | Automated CLI and GUI execution script for CACE with KLayout sanitization |

---

## 3. CACE Simulation Parameters & Scaled Engineering Units

To prevent truncation to `0.000` in markdown report tables, all microscopic parameters are normalized into appropriate human-readable metric units:

| Parameter ID | Display Name | Unit | Typical (1x RCX) | Typical (2x RCX) | Physical Significance |
|---|---|:---:|:---:|:---:|---|
| `magic_area` | Area | $\mu\text{m}^2$ | $100.27\text{ }\mu\text{m}^2$ | $198.50\text{ }\mu\text{m}^2$ | Total cell silicon footprint |
| `magic_drc` | DRC | - | 0 errors | 0 errors | Magic DRC design rule check |
| `quiescent_current` | Quiescent Current ($I_Q$ / $I_{DDQ}$) | $\text{pA}$ | $44.15\text{ pA}$ | $88.30\text{ pA}$ | Static quiescent supply current ($I_Q = I_{DDQ}$) |
| `quiescent_power` | Quiescent Power ($P_Q$) | $\text{pW}$ | $145.68\text{ pW}$ | $291.36\text{ pW}$ | Static standby power dissipation ($P_Q = I_{DDQ} \cdot V_{DD}$) |
| `dynamic_peak_current`| Peak Switching Current | $\mu\text{A}$ | $647.81\text{ }\mu\text{A}$ | $1240.00\text{ }\mu\text{A}$ | Peak dynamic switching current spike ($I_{DD,peak}$) |
| `dynamic_avg_power` | Dynamic Switching Power | $\mu\text{W}$ | $85.50\text{ }\mu\text{W}$ | $165.00\text{ }\mu\text{W}$ | Average dynamic power at active continuous switching |
| `powerup_inrush_current`| Power-Up Inrush Current | $\mu\text{A}$ | $1.35\text{ }\mu\text{A}$ | $2.50\text{ }\mu\text{A}$ | Peak current spike during power rail turn-on ($t_{ramp} = 1\text{ }\mu\text{s}$) |
| `switching_threshold_vm`| Logic Switching Threshold ($V_M$)| $\text{V}$ | $1.531\text{ V}$ | $1.535\text{ V}$ | DC midpoint switching threshold voltage |
| `propagation_delay_max`| Max Propagation Delay ($t_{pd}$)| $\text{ns}$ | $0.664\text{ ns}$ | $0.540\text{ ns}$ | Worst-case delay across all input-to-output paths |
| `functional_logic_error`| Functional Logic Error | $\text{mV}$ | $15.39\text{ mV}$ | $12.10\text{ mV}$ | Cumulative voltage deviation from ideal supply/ground |

---

## 4. DC Power Supply Dimensioning & Safe Physical Bench Setup

When characterizing the physical chip using laboratory instruments, simulation results must be translated into instrument settings to avoid destroying the bond wires or causing brownout failures:

### 4.1 DC Power Supply Settings
1. **Nominal Voltage ($V_{DD}$):**
   * Program output voltage to exactly **$3.30\text{ V}$**.
   * Set Over-Voltage Protection (OVP) limit to **$3.60\text{ V}$** (+10% maximum rating for GF180MCU 3.3V devices). Never raise voltage above $3.60\text{ V}$.
2. **Current Compliance Limit (Over-Current Protection - OCP):**
   * **Formula:**
     $$I_{OCP, set} \ge I_{DD,peak} \times 1.5$$
   * For single cell testing (`comp2_1`): $I_{DD,peak} = 647.8\text{ }\mu\text{A} \approx 0.65\text{ mA}$.
   * **Recommended OCP Setting:** Set power supply current limit to **$2.0\text{ mA} - 5.0\text{ mA}$**.
   * *Why this range is critical:*
     * If OCP is set too low ($< 0.65\text{ mA}$): The power supply will enter Constant Current (CC) mode during input switching, causing $V_{DD}$ to droop (brownout) and producing false functional errors.
     * If OCP is left at the instrument default ($1.0\text{ A}$): An accidental short circuit, bond-wire misalignment, or latch-up condition will dump excessive energy into the silicon die, permanently melting the metal interconnects.
3. **Quiescent Leakage Sanity Check ($I_{DDQ}$):**
   * At steady state (inputs static at $0\text{ V}$ or $3.3\text{ V}$), the power supply current display should read near zero ($< 1.0\text{ }\mu\text{A}$).
   * If static current exceeds $100\text{ }\mu\text{A}$ or milliamps, turn off the power supply immediately (indicates ESD failure or layout short).
4. **Power-On Sequence & Slew Rate:**
   * Power up $V_{DD}$ **BEFORE** applying signal generator inputs to prevent parasitic substrate diode turn-on (latch-up).
   * Program power supply voltage ramp to $1\text{ }\mu\text{s} - 10\text{ }\mu\text{s}$ (inrush current $< 2.0\text{ }\mu\text{A}$).

### 4.2 Signal / Function Generator Settings
1. **Output Termination:**
   * **MANDATORY:** Select **High-Z mode** ($> 1\text{ }\text{M}\Omega$) on the signal generator output channels.
   * *Caution:* Standard $50\text{ }\Omega$ mode will double the displayed voltage into CMOS high-impedance gates ($3.3\text{ V}$ setting becomes $6.6\text{ V}$), instantly puncturing the gate oxide!
2. **Logic Voltage Levels:**
   * Low Level ($V_{Low}$): **$0.00\text{ V}$**.
   * High Level ($V_{High}$): **$3.30\text{ V}$**.
3. **Clock Frequency & Slew Rate:**
   * Start initial bring-up clock at **$100\text{ kHz} - 1.0\text{ MHz}$**.
   * Maximum functional frequency: $f_{max} \approx \frac{1}{2 \cdot t_{pd}} = \frac{1}{2 \cdot 0.664\text{ ns}} \approx 750\text{ MHz}$ (internal core limit).
   * Program input rise/fall time ($t_r, t_f$) to **$2.0\text{ ns} - 5.0\text{ ns}$** on coaxial cables to avoid transmission line reflections.

---

## 5. Troubleshooting: Post-Simulation KLayout Error Fix

If CACE finishes evaluating all simulation parameters but throws the following error during report and layout image generation:
```
[11:56:39] ERROR    Subprocess exited with error code 1                                  common.py:689
[11:56:39] ERROR    Error output generated by subprocess:                                common.py:693
[11:56:39] ERROR    ERROR: RuntimeError: Unable to open file: /foss/pdks/ciel/gf180mcu/versions/026824c7969ce6f4fc9678e6ca04b0a06a596c4b/gf180mcuD/libs.tech/klayout/tech//sg13g2.lyp (errno=2) in LayoutViewBase.load_layer_props
[11:56:39] ERROR      klayout_script.py:34
```

### Root Cause Analysis

1. **Why does `/foss/pdks/ciel/...` appear instead of `/foss/pdks/gf180mcuD`?**
   * Inside the `IIC-OSIC-TOOLS` Docker container, `/foss/pdks/gf180mcuD` is a symbolic link (symlink) pointing to `/foss/pdks/ciel/gf180mcu/versions/026824c7969ce6f4fc9678e6ca04b0a06a596c4b/gf180mcuD` (the official package location managed by the `ciel` PDK package manager).
   * Python and KLayout internal routines automatically resolve this symlink to its physical canonical realpath (`os.path.realpath`), which is why the underlying path points to the `ciel` directory. Both paths point to the exact same physical files.

2. **Why does KLayout look for `sg13g2.lyp` inside the GF180MCU directory?**
   * The `IIC-OSIC-TOOLS` container image is built with **IHP SG13G2** (`sg13g2`) as its default initial PDK.
   * Persistent KLayout configuration files in `/headless/.klayout/klayoutrc` and `/headless/.klayout/tech/` store `sg13g2` as the active default technology with its layer properties file set to `sg13g2.lyp`.
   * The standard `sak-pdk gf180mcuD` script exports:
     ```bash
     KLAYOUT_PATH=/headless/.klayout:/foss/pdks/gf180mcuD/libs.tech/klayout
     ```
     Because `/headless/.klayout` appears first and KLayout always loads configuration from `$HOME/.klayout`, KLayout continues to detect `sg13g2` as the active technology.
   * When CACE invokes `klayout_script.py` to render layout images for the documentation, KLayout queries the active technology's layer properties (`sg13g2.lyp`) and attempts to locate it in the current GF180MCU tech directory. Because GF180MCU uses `gf180mcu.lyp` rather than `sg13g2.lyp`, KLayout fails with `errno=2`.

### Permanent Solutions

#### Option 1: Using the Master Script `run_cace.sh` (Recommended & Automated)
The master automation script [run_cace.sh](file:///home/osotnas/eda/designs/chipathon_2025/Symbelleuit-Chipathon-2025/cells/comp2/run_cace.sh) isolates `KLAYOUT_HOME` into `/tmp/klayout_home`, removes residual `sg13g2` technology references, and establishes fallback layer property symlinks automatically:
```bash
sak-pdk gf180mcuD
cd /foss/designs/chipathon_2025/Symbelleuit-Chipathon-2025/cells/comp2
./run_cace.sh --cell comp2_1 --source rcx
```

#### Option 2: Running CACE CLI Directly
If executing `cace` directly in your terminal, export the clean KLayout isolation environment variables beforehand:
```bash
sak-pdk gf180mcuD

# Isolate KLayout configuration from stale SG13G2 profile in /headless/.klayout
export KLAYOUT_HOME=/tmp/klayout_home
mkdir -p /tmp/klayout_home
export KLAYOUT_PATH=/foss/pdks/gf180mcuD/libs.tech/klayout
rm -f /headless/.klayout/klayoutrc 2>/dev/null || true

# Run CACE characterization
cd /foss/designs/chipathon_2025/Symbelleuit-Chipathon-2025/cells/comp2
cace comp2_1.yaml --source rcx
```

---

## 6. CACE Simulation Modes & Execution Options

CACE supports multiple simulation modes and operational flags. This allows designers to characterize the cell across different levels of abstraction—from ideal transistor-level schematics to full sign-off parasitic-extracted silicon layouts.

### 6.1 Netlist Source Modes (`--source <source>`)

CACE provides three distinct netlist sources plus a full sequential comparison sweep:

| Source Mode | Netlist File Location | Extraction & Netlist Engine | Parasitics Included | Execution Speed | Typical Use Case |
|:---:|---|---|:---:|:---:|---|
| **`schematic`** | `spice/schematic/gf180mcu_gp9t3v3__comp2_1.spice` | Xschem schematic netlister | None (ideal devices) | Fastest ($\approx 2\text{ s}$) | Initial architectural exploration, functional logic validation, baseline ideal performance |
| **`layout`** | `spice/layout/gf180mcu_gp9t3v3__comp2_1.spice` | Magic layout extractor (clean) | Geometric only (W/L/AD/AS) | Fast ($\approx 4\text{ s}$) | Pre-RC physical validation, verifying that transistor geometries and layout connectivity match schematic |
| **`rcx`** *(Default)* | `spice/rcx/gf180mcu_gp9t3v3__comp2_1.spice` | Magic RCX / PEX extraction | Full parasitic R and C | Thorough ($\approx 10\text{ s}$) | **Sign-off verification**: True physical die behavior including interconnect wire resistance and coupling capacitance |
| **`all`** | All three sources above sequentially | Automated pipeline | Multi-tier comparison | Comprehensive ($\approx 16\text{ s}$) | Generates comprehensive multi-source comparison tables showing degradation between ideal schematic vs physical silicon |

---

### 6.2 Running Different Netlist Sources

#### A. Running with the Automated Runner Script (`run_cace.sh`)
The master runner script handles environment configuration, KLayout isolation, and source selection automatically:

```bash
# Ensure PDK environment is active
sak-pdk gf180mcuD
cd /foss/designs/chipathon_2025/Symbelleuit-Chipathon-2025/cells/comp2

# 1. Parasitic-extracted netlist (Default sign-off)
./run_cace.sh --source rcx

# 2. Schematic pre-layout netlist (Ideal circuit)
./run_cace.sh --source schematic

# 3. Clean extracted layout netlist (Physical layout without RC)
./run_cace.sh --source layout

# 4. Sequential sweep across all three abstraction levels
./run_cace.sh --all
```

#### B. Running Directly via CACE CLI
When using the native `cace` command directly, provide the `--source` (or `-s`) argument:

```bash
# Environment setup & KLayout isolation (mandatory once per terminal session)
sak-pdk gf180mcuD
export KLAYOUT_HOME=/tmp/klayout_home
mkdir -p /tmp/klayout_home
export KLAYOUT_PATH=/foss/pdks/gf180mcuD/libs.tech/klayout
rm -f /headless/.klayout/klayoutrc 2>/dev/null || true
cd /foss/designs/chipathon_2025/Symbelleuit-Chipathon-2025/cells/comp2

# 1. Sign-off RCX
cace comp2_1.yaml --source rcx

# 2. Schematic pre-layout
cace comp2_1.yaml --source schematic

# 3. Clean layout
cace comp2_1.yaml --source layout
```

---

### 6.3 Additional CACE Simulation Options

In addition to selecting netlist sources, CACE provides several powerful CLI options for fine-grained simulation control:

#### 1. Targeting Specific Cell Drive Strengths (`comp2_1` vs `comp2_2`)
Characterize either the standard $1\times$ fan-out variant (`comp2_1`) or the high-drive $2\times$ fan-out variant (`comp2_2`):
```bash
# Using run_cace.sh
./run_cace.sh --cell comp2_1 --source rcx
./run_cace.sh --cell comp2_2 --source rcx

# Using CACE CLI
cace comp2_1.yaml --source rcx
cace comp2_2.yaml --source rcx
```

#### 2. Selective Parameter Execution (`-p` / `--parameter`)
Accelerate characterization by simulating only a specific parameter or subset of parameters instead of running the entire suite:
```bash
# Simulate only Quiescent Current and Quiescent Power
cace comp2_1.yaml -s rcx -p quiescent_current quiescent_power

# Simulate only Propagation Delay and Switching Threshold
cace comp2_1.yaml -s rcx -p propagation_delay_max switching_threshold_vm

# Simulate only Dynamic Switching Current and Dynamic Power
cace comp2_1.yaml -s rcx -p dynamic_peak_current dynamic_avg_power

# Simulate only Functional Truth-Table Error
cace comp2_1.yaml -s rcx -p functional_logic_error
```

#### 3. Interactive Graphical User Interface (`--gui` / `cace-gui`)
Launch CACE's graphical interface to interactively view pass/fail status, parameter histograms, waveforms, and documentation plots:
```bash
# Using run_cace.sh
./run_cace.sh --gui

# Using cace-gui CLI directly
cace-gui comp2_1.yaml
```

#### 4. Parallel Job Multi-Threading (`-j` / `--jobs`)
Specify the maximum number of parallel Ngspice simulation threads to accelerate characterization sweeps:
```bash
cace comp2_1.yaml --source rcx -j 8
```

#### 5. Force Re-simulation (`--force`)
Bypass cached results and force CACE to rerun all netlist generations and SPICE simulations:
```bash
cace comp2_1.yaml --source rcx --force
```
