# Cyberpunk 2077 Decompiled REDscripts (v1.0.0)

Complete decompiled REDscript source code collection for **Cyberpunk 2077**, featuring both the pristine **Vanilla 2.0+** base game script hierarchy and an extensive **Modded compilation** containing over 4,000 community mod classes and framework bindings.

---

## 📦 Release Assets & Downloads

| Archive | Contents | Raw Size | Compressed Size | SHA-256 Checksum |
| :--- | :--- | :--- | :--- | :--- |
| **`cyberpunk2077-vanilla-reds.zip`** | Decompiled vanilla base-game scripts (`final.reds`) | 19.81 MB | ~3.0 MB | `b0e2eee08fd9e8244690201635e368050c9f072323a86bda8922c183a35ab3b9` |
| **`cyberpunk2077-modded-reds.zip`** | Decompiled modded scripts (`final.modded.reds`) | 70.57 MB | ~9.6 MB | `b849a12cd2a7ee0dfed2bbe73aee24c1456edf47e0dcb8b4b14f0cef15db3726` |
| **`checksums.sha256`** | SHA-256 validation file for all raw and compressed files | — | < 1 KB | — |

---

## 📊 Comparison Statistics

| Metric | Vanilla (`final.reds`) | Modded (`final.modded.reds`) | Net Delta |
| :--- | :--- | :--- | :--- |
| **Total Lines** | `559,904` | `1,821,376` | **+1,261,472** (+225%) |
| **Total Classes** | `6,450` | `11,596` | **+5,146** (+79.8%) |
| **Total Functions** | `51,718` | `120,376` | **+68,658** (+132.8%) |
| **Enums** | `897` | `1,797` | **+900** (+100.3%) |
| **Structs** | `411` | `539` | **+128** (+31.1%) |
| **Raw Uncompressed Size**| `19.81 MB` | `70.57 MB` | **+50.76 MB** |

---

## 🛠 Included Frameworks & Community Mods in Modded Dump

The modded build (`final.modded.reds`) consolidates hundreds of community mods and core frameworks into one searchable reference, including:
- **Core Frameworks**: [Codeware](https://github.com/psiberx/cp2077-codeware) (882 classes), Redscript Config Framework, Custom Perk Framework, Audioware.
- **UI & Custom Menus**: [EquipmentEx](https://github.com/psiberx/cp2077-equipment-ex) (141 classes), Virtual Atelier, Atelier Delivery, Dynamic Wardrobe, Dialogue History, Calendar.
- **Gameplay & Mechanics**: Night City Allies, Night City Skies, Vehicle Systems Simulation, Enhanced Vehicle System, Realistic Push, Trauma Team Safety, Drug Dealer, Smuggler's Cache, Gang Battle Power, Cop Killer, Custom Quickslots, Disclosed Hidden Gems, and many more.

---

## 🚀 Quick Usage

1. **Extract the archive**:
   ```bash
   unzip cyberpunk2077-vanilla-reds.zip
   # or
   unzip cyberpunk2077-modded-reds.zip
   ```
2. **Open in VS Code or any editor**:
   Install the **REDscript IDE** extension for full syntax highlighting and symbol navigation.
3. **Search for native methods & hook targets**:
   Search for `@replaceMethod`, `@wrapMethod`, `@addMethod`, or specific classes like `PlayerPuppet`, `VehicleComponent`, etc.
