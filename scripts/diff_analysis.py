#!/usr/bin/env python3
"""
REDscript Vanilla vs Modded Metrics & Diff Analysis Tool
Calculates symbol counts, unique namespace breakdown, and size statistics.
"""

import os
import re
import sys
from collections import Counter

def analyze(filepath):
    stats = {
        "lines": 0,
        "classes": set(),
        "enums": set(),
        "structs": set(),
        "functions": 0,
        "namespaces": Counter(),
    }
    
    if not os.path.exists(filepath):
        print(f"File not found: {filepath}")
        return None

    class_pattern = re.compile(r"^(?:public |abstract )?class ([A-Za-z0-9_.]+)")
    enum_pattern = re.compile(r"^enum ([A-Za-z0-9_]+)")
    struct_pattern = re.compile(r"^(?:public )?struct ([A-Za-z0-9_]+)")

    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            stats["lines"] += 1
            s = line.strip()
            
            mc = class_pattern.match(s)
            if mc:
                cname = mc.group(1)
                stats["classes"].add(cname)
                if "." in cname:
                    ns = cname.split(".")[0]
                    stats["namespaces"][ns] += 1
                continue

            me = enum_pattern.match(s)
            if me:
                stats["enums"].add(me.group(1))
                continue

            ms = struct_pattern.match(s)
            if ms:
                stats["structs"].add(ms.group(1))
                continue

            if "func " in s:
                stats["functions"] += 1

    return stats

def main():
    root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    vanilla_path = os.path.join(root, "vanilla", "final.reds")
    modded_path = os.path.join(root, "modded", "final.modded.reds")

    print("Analyzing Vanilla scripts...")
    v = analyze(vanilla_path)
    print("Analyzing Modded scripts...")
    m = analyze(modded_path)

    if not v or not m:
        print("Analysis failed: one or more files missing.")
        sys.exit(1)

    print("\n" + "="*70)
    print("CYBERPUNK 2077 REDSCRIPT COMPARISON SUMMARY")
    print("="*70)
    print(f"{'Metric':<25} | {'Vanilla':<18} | {'Modded':<18} | {'Diff':<10}")
    print("-" * 75)
    print(f"{'Total Lines':<25} | {v['lines']:<18,d} | {m['lines']:<18,d} | +{m['lines'] - v['lines']:,d}")
    print(f"{'Classes':<25} | {len(v['classes']):<18,d} | {len(m['classes']):<18,d} | +{len(m['classes']) - len(v['classes']):,d}")
    print(f"{'Enums':<25} | {len(v['enums']):<18,d} | {len(m['enums']):<18,d} | +{len(m['enums']) - len(v['enums']):,d}")
    print(f"{'Structs':<25} | {len(v['structs']):<18,d} | {len(m['structs']):<18,d} | +{len(m['structs']) - len(v['structs']):,d}")
    print(f"{'Functions':<25} | {v['functions']:<18,d} | {m['functions']:<18,d} | +{m['functions'] - v['functions']:,d}")
    print("="*70)

    print("\nTop Community Mod Namespaces in Modded Compilation:")
    for ns, count in m["namespaces"].most_common(25):
        print(f"  - {ns:<30}: {count} classes")

if __name__ == "__main__":
    main()
