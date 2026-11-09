#!/usr/bin/env bash
# ==============================================================================
# REDscript Release Bundle Generator
# Packages vanilla and modded .reds files into compressed release archives.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DIST_DIR="${REPO_ROOT}/dist"

mkdir -p "${DIST_DIR}"

echo "Creating compressed release packages in ${DIST_DIR}..."

VANILLA_SRC="${REPO_ROOT}/vanilla/final.reds"
MODDED_SRC="${REPO_ROOT}/modded/final.modded.reds"

VANILLA_ZIP="${DIST_DIR}/cyberpunk2077-vanilla-reds.zip"
MODDED_ZIP="${DIST_DIR}/cyberpunk2077-modded-reds.zip"

if [[ -f "${VANILLA_SRC}" ]]; then
    echo "Packaging vanilla REDscripts..."
    zip -9 -j "${VANILLA_ZIP}" "${VANILLA_SRC}"
fi

if [[ -f "${MODDED_SRC}" ]]; then
    echo "Packaging modded REDscripts..."
    zip -9 -j "${MODDED_ZIP}" "${MODDED_SRC}"
fi

echo "Generating SHA-256 checksums..."
cd "${REPO_ROOT}"
sha256sum vanilla/final.reds modded/final.modded.reds dist/*.zip > checksums.sha256

echo "Bundle generation complete:"
ls -lh "${DIST_DIR}"
cat checksums.sha256
