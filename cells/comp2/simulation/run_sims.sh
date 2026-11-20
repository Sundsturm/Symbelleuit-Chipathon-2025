#!/bin/bash
# ==============================================================================
# Batch simulation runner comparing prelayout, clean layout, and RCX extracted netlists
# ==============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

# Ensure PDK environment variables
if [ -z "${PDKPATH}" ]; then
  if [ -d "/foss/pdks/gf180mcuD" ]; then
    export PDK_ROOT=/foss/pdks
    export PDK=gf180mcuD
    export PDKPATH=/foss/pdks/gf180mcuD
  elif [ -d "/home/osotnas/pdk/gf180mcuD" ]; then
    export PDK_ROOT=/home/osotnas/pdk
    export PDK=gf180mcuD
    export PDKPATH=/home/osotnas/pdk/gf180mcuD
  fi
fi

echo "========================================================================"
echo " Starting Comparison Simulations (Ngspice Batch Mode)"
echo " PDK: ${PDKPATH}"
echo "========================================================================"

echo "[1/3] Running Prelayout Simulation..."
ngspice -b tb_comp2_prelayout.spice > prelayout.log 2>&1

echo "[2/3] Running Post-Layout Clean Simulation..."
ngspice -b tb_comp2_postlayout_clean.spice > postlayout_clean.log 2>&1

echo "[3/3] Running Post-Layout RCX Simulation..."
ngspice -b tb_comp2_postlayout_rcx.spice > postlayout_rcx.log 2>&1

echo "Simulations complete!"
echo "Extracting Bring-Up metrics..."
python3 extract_bringup_params.py
