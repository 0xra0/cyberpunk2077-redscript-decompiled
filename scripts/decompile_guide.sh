#!/usr/bin/env bash
# ==============================================================================
# Cyberpunk 2077 REDscript Decompiler Helper
# Demonstrates how to extract and decompile scripts from your own game install.
# ==============================================================================

set -euo pipefail

echo "========================================================================"
echo " Cyberpunk 2077 REDscript Decompilation Instructions"
echo "========================================================================"
echo ""
echo "Prerequisites:"
echo "  1. Cyberpunk 2077 installed (GOG / Steam / Epic)."
echo "  2. redscript CLI compiler installed (cargo install redscript-cli or release binary)."
echo ""
echo "Typical file paths:"
echo "  - Vanilla compiled cache: <Cyberpunk 2077>/r6/cache/final.redscripts"
echo "  - Modded compiled cache:  <Cyberpunk 2077>/r6/cache/modded/final.redscripts"
echo ""
echo "Decompilation command:"
echo "  redscript decompile -c /path/to/final.redscripts -o /path/to/output_folder"
echo ""
echo "Or using the cargo workspace in this environment:"
echo "  cargo run -p redscript-cli -- decompile -c <path_to_final.redscripts> -o <output_folder>"
echo "========================================================================"
