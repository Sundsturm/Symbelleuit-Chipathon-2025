#!/bin/bash
# ==============================================================================
# Master CACE Automation Script for comp2
# Configured for IIC-OSIC-TOOLS (with 'sak-pdk gf180mcuD') and native environments.
#
# Usage:
#   ./run_cace.sh [options]
#
# Options:
#   --source schematic   Run CACE on schematic prelayout netlist
#   --source layout      Run CACE on extracted clean layout netlist
#   --source rcx         Run CACE on parasitic-extracted (PEX RC) netlist (default)
#   --all                Run CACE sequentially on schematic, layout, and rcx
#   --cell comp2_1       Target comp2_1 (1x drive, default)
#   --cell comp2_2       Target comp2_2 (2x drive)
#   --gui                Launch CACE Graphical User Interface (CACE GUI)
# ==============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

CELL="comp2_1"
SOURCE="rcx"
RUN_ALL=0
LAUNCH_GUI=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --source)
      SOURCE="$2"
      shift 2
      ;;
    --cell)
      CELL="$2"
      shift 2
      ;;
    --all)
      RUN_ALL=1
      shift
      ;;
    --gui)
      LAUNCH_GUI=1
      shift
      ;;
    -h|--help)
      echo "Usage: ./run_cace.sh [--source schematic|layout|rcx] [--cell comp2_1|comp2_2] [--all] [--gui]"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

YAML_FILE="${CELL}.yaml"

if [ ! -f "${YAML_FILE}" ]; then
  echo "Error: Specification file ${YAML_FILE} not found in ${SCRIPT_DIR}!"
  exit 1
fi

echo "========================================================================"
echo "                   CACE SIMULATION SUITE FOR COMP2                      "
echo "========================================================================"
echo "Target Cell: ${CELL} (${YAML_FILE})"

# Set and verify environment (matching 'sak-pdk gf180mcuD')
if [ -d "/foss/pdks" ]; then
  export PDK_ROOT=/foss/pdks
  export PDK=gf180mcuD
  export PDKPATH=$PDK_ROOT/$PDK
  export STD_CELL_LIBRARY=gf180mcu_fd_sc_mcu7t5v0
  export SPICE_USERINIT_DIR=$PDKPATH/libs.tech/ngspice
  export GF_PDK_OPTION=D
  if [ -d "/foss/tools/xschem/share/xschem" ]; then
    export XSCHEM_SHAREDIR=/foss/tools/xschem/share/xschem
  fi

  # Fix KLayout layer properties mismatch between PDKs in IIC-OSIC-TOOLS
  # 1. Isolate KLayout home to avoid reading stale SG13G2 config from /headless/.klayout
  mkdir -p /tmp/klayout_home/tech
  export KLAYOUT_HOME=/tmp/klayout_home
  export KLAYOUT_PATH="${PDKPATH}/libs.tech/klayout"
  rm -f /headless/.klayout/klayoutrc 2>/dev/null || true

  # 2. Link GF180MCU tech files into KLAYOUT_HOME
  if [ -d "${PDKPATH}/libs.tech/klayout/tech" ]; then
    ln -sf "${PDKPATH}/libs.tech/klayout/tech/"* /tmp/klayout_home/tech/ 2>/dev/null || true
    ln -sf "${PDKPATH}/libs.tech/klayout/tech/gf180mcu.lyp" /tmp/klayout_home/tech/sg13g2.lyp 2>/dev/null || true
  fi

  # 3. Add fallback symlinks in PDKPATH and canonical realpath (ciel directory) if writable
  REAL_PDK=$(realpath "${PDKPATH}" 2>/dev/null || echo "${PDKPATH}")
  for p in "${PDKPATH}/libs.tech/klayout/tech" "${REAL_PDK}/libs.tech/klayout/tech"; do
    if [ -d "$p" ]; then
      ln -sf "$p/gf180mcu.lyp" "$p/sg13g2.lyp" 2>/dev/null || true
    fi
  done

  echo "Environment: IIC-OSIC-TOOLS detected ($PDKPATH)."
fi

# GUI Mode
if [ "${LAUNCH_GUI}" -eq 1 ]; then
  echo "Launching CACE GUI..."
  if command -v cace-gui &> /dev/null; then
    cace-gui "${YAML_FILE}"
  elif command -v cace &> /dev/null; then
    cace "${YAML_FILE}"
  else
    echo "cace-gui command not found. Please ensure cace is installed."
  fi
  exit 0
fi

# Run CACE characterization
run_single_cace() {
  local src="$1"
  echo "------------------------------------------------------------------------"
  echo " Running CACE Characterization with --source ${src}..."
  echo "------------------------------------------------------------------------"
  
  # Point dynamic netlist symlink to the chosen source (schematic, layout, or rcx)
  local target_netlist="${SCRIPT_DIR}/spice/${src}/gf180mcu_gp9t3v3__${CELL}.spice"
  if [ -f "${target_netlist}" ]; then
    # Sanitize subcircuit netlist to remove duplicate model includes that cause Ngspice fatal errors
    sed -i '/design\.ngspice/d; /sm141064\.ngspice/d' "${target_netlist}" 2>/dev/null || true
    (cd "${SCRIPT_DIR}/spice" && ln -sf "${src}/gf180mcu_gp9t3v3__${CELL}.spice" "${CELL}_netlist.spice")
  fi

  if command -v cace &> /dev/null; then
    cace "${YAML_FILE}" --source "${src}"
    echo "CACE completed for source: ${src}. Output summary updated."
  else
    echo "CACE CLI not found in current PATH."
    echo "To run inside IIC-OSIC-TOOLS container, execute:"
    echo "  docker exec -it <container_name> bash -c 'sak-pdk gf180mcuD && cd /foss/designs/chipathon_2025/Symbelleuit-Chipathon-2025/cells/comp2 && cace ${YAML_FILE} --source ${src}'"
  fi
}

if [ "${RUN_ALL}" -eq 1 ]; then
  echo "Executing full sweep across all sources: schematic -> layout -> rcx"
  run_single_cace "schematic"
  run_single_cace "layout"
  run_single_cace "rcx"
else
  run_single_cace "${SOURCE}"
fi

echo "========================================================================"
echo " CACE Automation Finished."
echo "========================================================================"

