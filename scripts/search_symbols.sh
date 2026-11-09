#!/usr/bin/env bash
# ==============================================================================
# REDscript Symbol Search Helper
# Rapidly search classes, functions, enums, and fields in decompiled scripts.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

VANILLA="${REPO_ROOT}/vanilla/final.reds"
MODDED="${REPO_ROOT}/modded/final.modded.reds"

usage() {
    echo "Usage: $0 [options] <search-term>"
    echo ""
    echo "Options:"
    echo "  -t, --target <vanilla|modded|both>   Target file to search (default: both)"
    echo "  -k, --kind <class|func|enum|all>     Filter by symbol kind (default: all)"
    echo "  -c, --context <num>                  Lines of context around match (default: 2)"
    echo "  -h, --help                           Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 PlayerPuppet"
    echo "  $0 --kind class Codeware"
    echo "  $0 --target vanilla --kind func OnHit"
    exit 1
}

TARGET="both"
KIND="all"
CONTEXT=2
QUERY=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -t|--target)
            TARGET="$2"
            shift 2
            ;;
        -k|--kind)
            KIND="$2"
            shift 2
            ;;
        -c|--context)
            CONTEXT="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            QUERY="$1"
            shift
            ;;
    esac
done

if [[ -z "${QUERY}" ]]; then
    echo "Error: Search query required."
    usage
fi

search_file() {
    local label="$1"
    local file="$2"

    echo "=================================================================="
    echo "Searching [${label}]: ${file}"
    echo "=================================================================="

    if [[ ! -f "${file}" ]]; then
        echo "Error: File not found: ${file}"
        return 1
    fi

    local pattern="${QUERY}"
    case "${KIND}" in
        class)
            pattern="class .*${QUERY}"
            ;;
        func)
            pattern="func .*${QUERY}"
            ;;
        enum)
            pattern="enum .*${QUERY}"
            ;;
        all)
            pattern="${QUERY}"
            ;;
        *)
            echo "Unknown kind: ${KIND}. Using default pattern."
            ;;
    esac

    if command -v rg >/dev/null 2>&1; then
        rg -n -C "${CONTEXT}" -i "${pattern}" "${file}" || echo "No matches found."
    else
        grep -n -C "${CONTEXT}" -i -E "${pattern}" "${file}" || echo "No matches found."
    fi
    echo ""
}

if [[ "${TARGET}" == "vanilla" || "${TARGET}" == "both" ]]; then
    search_file "Vanilla" "${VANILLA}"
fi

if [[ "${TARGET}" == "modded" || "${TARGET}" == "both" ]]; then
    search_file "Modded" "${MODDED}"
fi
