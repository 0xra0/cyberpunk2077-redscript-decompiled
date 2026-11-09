# Cyberpunk 2077 — Decompiled REDscript Source Code Repository

[![Cyberpunk 2077](https://img.shields.io/badge/Cyberpunk%202077-v2.0%2B-red.svg)](https://www.cyberpunk.net/)
[![REDscript](https://img.shields.io/badge/REDscript-v0.5%2B-blue.svg)](https://wiki.redmodding.org/redscript)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Vanilla Lines](https://img.shields.io/badge/Vanilla%20Lines-559%2C904-orange.svg)](#statistics--metrics)
[![Modded Lines](https://img.shields.io/badge/Modded%20Lines-1%2C821%2C376-purple.svg)](#statistics--metrics)

Comprehensive, fully indexed decompilation of Cyberpunk 2077 **REDscript** (`.reds`) script files. This repository contains both pristine **vanilla** engine scripts and a massive **modded** script compilation featuring thousands of community mod classes, extensions, and framework integrations (including [Codeware](https://github.com/psiberx/cp2077-codeware), [EquipmentEx](https://github.com/psiberx/cp2077-equipment-ex), and more).

---

## 📌 Repository Metadata

- **GitHub Repository Name**: `cyberpunk2077-redscript-decompiled`
- **GitHub Description**:
  > Decompiled Cyberpunk 2077 REDscript (.reds) source code repository containing vanilla base-game scripts (560k+ lines) and an extensive modded script compilation (1.82M+ lines) with 4,000+ modded classes (Codeware, EquipmentEx, etc.) for modding reference, reverse engineering, and script development.
- **GitHub Topics**:
  `cyberpunk-2077`, `cyberpunk2077`, `cyberpunk2077-mods`, `redscript`, `redscript-modding`, `redengine`, `redengine4`, `decompiled-scripts`, `reverse-engineering`, `codeware`, `equipment-ex`, `game-modding`, `mod-reference`
- **Current Release**: `v1.0.0` ([Download Release Assets](https://github.com/0xra0/cyberpunk2077-redscript-decompiled/releases/latest))

---

## 📑 Table of Contents

- [Overview & Purpose](#-overview--purpose)
- [Statistics & Metrics](#-statistics--metrics)
- [Directory Structure](#-directory-structure)
- [Community Frameworks & Mods in Modded Dump](#-community-frameworks--mods-in-modded-dump)
- [How to Use This Repository](#-how-to-use-this-repository)
  - [1. Mod Development & API Reference](#1-mod-development--api-reference)
  - [2. Reverse Engineering Game Mechanics](#2-reverse-engineering-game-mechanics)
  - [3. Diffing Vanilla vs Modded Implementations](#3-diffing-vanilla-vs-modded-implementations)
- [How to Install REDscript in Cyberpunk 2077](#-how-to-install-redscript-in-cyberpunk-2077)
- [How to Install REDscript Mods](#-how-to-install-redscript-mods)
- [How to Decompile Your Own Scripts](#-how-to-decompile-your-own-scripts)
- [REDscript Quick Reference & Annotations](#-redscript-quick-reference--annotations)
- [Included Helper Scripts](#-included-helper-scripts)
- [Recommended Tools & Extensions](#-recommended-tools--extensions)
- [Legal & Fair Use Disclaimer](#-legal--fair-use-disclaimer)

---

## 🔍 Overview & Purpose

Cyberpunk 2077 compiles all gameplay, UI, quest, vehicle, and AI scripts into a unified cache file located at:
```text
Cyberpunk 2077/r6/cache/final.redscripts
```

By decompiling this binary cache using the **REDscript compiler & decompiler**, developers obtain the high-level `.reds` source code. 

### Why is this repository valuable?

1. **Native Reference**: Discover the exact parameter types, method names, fields, and events exposed by REDengine.
2. **Hooking Accurate Signatures**: When using `@replaceMethod`, `@wrapMethod`, or `@addMethod`, having the exact signature prevents compilation failures on game startup.
3. **Modding Interoperability**: Learn how popular mods like *Codeware*, *EquipmentEx*, and *Virtual Atelier* extend the engine without conflicting with base scripts.
4. **Offline Search**: Search through the entire game script architecture in seconds without needing to boot up or decompile the game yourself.

---

## 📊 Statistics & Metrics

| Metric | Vanilla (`vanilla/final.reds`) | Modded (`modded/final.modded.reds`) | Net Delta |
| :--- | :--- | :--- | :--- |
| **Total Lines** | `559,904` | `1,821,376` | **+1,261,472** lines (+225%) |
| **Total Classes** | `6,450` | `11,596` | **+5,146** classes (+79.8%) |
| **Total Functions** | `51,718` | `120,376` | **+68,658** functions (+132.8%) |
| **Enums** | `897` | `1,797` | **+900** enums (+100.3%) |
| **Structs** | `411` | `539` | **+128** structs (+31.1%) |
| **Uncompressed Size** | `19.81 MB` (20,773,518 bytes) | `70.57 MB` (73,999,210 bytes) | **+50.76 MB** |
| **Compressed (ZIP)** | `~3.0 MB` | `~9.6 MB` | **~12.6 MB** combined |
| **SHA-256 Checksum** | `156ba686bf5a507f59fd604abf679a377edb4f2032df7620fb40c366794041b8` | `14371fb5cfa8a8a7cd2617c825beb101f7b5a1ed901735b5a109812ca107b57f` | — |

---

## 📁 Directory Structure

```text
cyberpunk2077-redscript-decompiled/
├── .github/
│   └── workflows/
│       └── release.yml                 # Automated release workflow
├── dist/                               # Pre-built release ZIP bundles
│   ├── cyberpunk2077-vanilla-reds.zip  # Vanilla decompiled code (~3 MB)
│   └── cyberpunk2077-modded-reds.zip   # Modded decompiled code (~9.6 MB)
├── modded/
│   └── final.modded.reds               # 1.82M lines decompiled modded scripts
├── vanilla/
│   └── final.reds                      # 560K lines decompiled vanilla scripts
├── scripts/
│   ├── create_release_bundle.sh        # Generates release zip archives & checksums
│   ├── decompile_guide.sh              # Instructions for decompiling game cache
│   ├── diff_analysis.py                # Python tool to calculate symbol deltas
│   └── search_symbols.sh               # CLI symbol search utility
├── .gitattributes                      # Git LFS & line ending definitions
├── .gitignore                          # Ignored temporary / editor files
├── checksums.sha256                    # Checksums for data verification
├── LICENSE                             # MIT License with IP Disclaimer
├── README.md                           # Documentation & usage guide
└── RELEASE_NOTES.md                    # Release notes for GitHub Releases
```

---

## 🧩 Community Frameworks & Mods in Modded Dump

The modded compilation (`final.modded.reds`) consolidates hundreds of community mods and core frameworks into one searchable reference, including:

| Framework / Mod | Classes | Description / Purpose |
| :--- | :--- | :--- |
| **Codeware** (`Codeware.*`) | **882** | Core library providing UI controllers, localization, reflection, and event buses. |
| **DigitalVixenCore** | **575** | Multi-lingual translation packages and framework helpers. |
| **EquipmentEx** (`EquipmentEx.*`) | **141** | Advanced outfit and wardrobe management system replacing vanilla limitations. |
| **ChipwareExpansion** | **140** | Expanded cyberware and chip system architecture. |
| **Phoenicia / GangHandlers** | **100** | Faction reinforcements and AI cooldown callback management. |
| **DrugDealer / SmugglersCache** | **150** | Economy, loot container, and vendor expansion scripts. |
| **NightCityAllies** | **75** | Companion and NPC alliance AI scriptable systems. |
| **TraumaTeam** | **73** | Medical response and safety callback systems. |
| **VehicleSystemsSimulation** | **69** | Physics, aerodynamics, and vehicle behavior systems. |
| **ShaderDrift / DynamicWardrobe**| **109** | Visual effect management and custom outfit controllers. |
| **VirtualAtelier / AtelierDelivery**| **69** | In-game web shopping interfaces and delivery systems. |
| **CustomPerkFramework** | **25** | Modular custom perks and progression trees. |
| **Audioware** | **22** | Sound engine hooks and custom audio triggers. |

---

## 💡 How to Use This Repository

### 1. Mod Development & API Reference

When writing a REDscript mod, you need to know:
- Does a specific method exist?
- What are its exact parameter types?
- Is it `private`, `protected`, or `public`?
- What class does it belong to?

#### Searching in VS Code
1. Clone or download this repository.
2. Open the folder in **VS Code**.
3. Press `Ctrl + Shift + F` (or `Cmd + Shift + F` on macOS).
4. Search for any class (e.g. `class PlayerPuppet`) or method (e.g. `func TakeDamage`).

#### Searching via Terminal
Use the included helper script:
```bash
./scripts/search_symbols.sh --kind class EquipmentEx
./scripts/search_symbols.sh --target vanilla --kind func OnHit
```

Or using `ripgrep`:
```bash
rg "func.*TakeDamage" vanilla/final.reds
```

### 2. Reverse Engineering Game Mechanics

To understand how Cyberpunk 2077 calculates fall damage, weapon stats, or police wanted levels:
- Search for the relevant system manager (e.g. `PreventionSystem`, `DamageSystem`, `EquipmentSystem`).
- Trace event handlers and callbacks from engine triggers down to UI updates.

### 3. Diffing Vanilla vs Modded Implementations

To see how community mods hook into vanilla functions:
1. Search for a core vanilla function (e.g. `CanPlayerDropWeapon`) in `vanilla/final.reds`.
2. Search for the same function in `modded/final.modded.reds`.
3. Observe how mods use `@wrapMethod` or `@replaceMethod` to alter behavior without breaking game flow.

---

## 💻 How to Install REDscript in Cyberpunk 2077

To compile and execute `.reds` mods in your game:

### Step 1: Install REDscript
1. Download the latest `redscript-v*.zip` from the [official REDscript releases](https://github.com/jac3km4/redscript/releases).
2. Extract the archive into your main Cyberpunk 2077 directory:
   ```text
   Cyberpunk 2077/
   ├── engine/
   │   └── tools/
   │       └── scc.exe          <-- REDscript compiler replacement
   └── r6/
       └── scripts/             <-- Where REDscript mod files live
   ```
3. Start the game once to verify initialization. Check `Cyberpunk 2077/r6/logs/redscript_rCURRENT.log` to confirm the compiler ran successfully.

---

## 📦 How to Install REDscript Mods

1. Download your desired mod (from [Nexus Mods](https://www.nexusmods.com/cyberpunk2077)).
2. Place the mod's `.reds` file or folder into:
   ```text
   <Cyberpunk 2077 Directory>/r6/scripts/
   ```
   *Example:*
   ```text
   Cyberpunk 2077/r6/scripts/MyAwesomeMod/MyAwesomeMod.reds
   ```
3. When you launch Cyberpunk 2077, `scc.exe` automatically compiles all `.reds` files in `r6/scripts/` into `r6/cache/modded/final.redscripts`.

---

## ⚙️ How to Decompile Your Own Scripts

If you want to decompile your own modded or vanilla cache:

1. Install the `redscript` CLI using Rust's Cargo:
   ```bash
   cargo install redscript-cli
   ```
   *Or build from the official source repository.*

2. Decompile your game's script cache:
   ```bash
   # Decompile vanilla cache:
   redscript decompile -c "/path/to/Cyberpunk 2077/r6/cache/final.redscripts" -o ./my_decompiled_vanilla

   # Decompile modded cache:
   redscript decompile -c "/path/to/Cyberpunk 2077/r6/cache/modded/final.redscripts" -o ./my_decompiled_modded
   ```

---

## 📝 REDscript Quick Reference & Annotations

REDscript provides powerful annotations for modifying existing game functions:

### 1. `@wrapMethod` (Recommended for Compatibility)
Wraps around an existing method, allowing you to run custom logic before, after, or conditionally around `wrappedMethod()`:
```swift
@wrapMethod(PlayerPuppet)
protected cb func OnDamageReceived(evt: ref<gameDamageReceivedEvent>) -> Bool {
  // Custom logic before vanilla execution
  LogChannel(n"DEBUG", "Player took damage!");

  // Call the original engine method
  return wrappedMethod(evt);
}
```

### 2. `@replaceMethod` (Destructive Override)
Completely replaces the original method implementation:
```swift
@replaceMethod(VehicleComponent)
public final func CanMount() -> Bool {
  // Completely custom condition
  return true;
}
```

### 3. `@addMethod` (New Functionality)
Adds a brand new method to an existing class:
```swift
@addMethod(PlayerPuppet)
public final func MyCustomHealingFunction(amount: Float) -> Void {
  GameInstance.GetStatPoolsSystem(this.GetGame()).RequestChangingStatPoolValue(
    Cast(this.GetEntityID()), 
    gamedataStatPoolType.Health, 
    amount, 
    null, 
    false
  );
}
```

### 4. `@addField` (State Extension)
Injects a new field into a class:
```swift
@addField(PlayerPuppet)
public let m_customModTimer: Float;
```

---

## 🛠 Included Helper Scripts

In the `scripts/` directory:
- **`search_symbols.sh`**: Fast regex / symbol lookup across vanilla and modded code.
- **`diff_analysis.py`**: Calculates symbol counts, class namespaces, and statistical summaries.
- **`create_release_bundle.sh`**: Compresses `.reds` files into release-ready zip archives and calculates checksums.
- **`decompile_guide.sh`**: Shell guide for local game cache extraction.

---

## 🧰 Recommended Tools & Extensions

- [REDscript IDE (VS Code Extension)](https://marketplace.visualstudio.com/items?itemName=jac3km4.redscript-ide): Syntax highlighting, go-to-definition, and autocompletion for `.reds` files.
- [Cyber Engine Tweaks (CET)](https://github.com/maxime由来/CyberEngineTweaks): Lua scripting framework, developer console, and low-level engine hooks.
- [Codeware](https://github.com/psiberx/cp2077-codeware): Extends REDscript with custom UI widgets, localization, and engine reflections.
- [WolvenKit](https://github.com/WolvenKit/WolvenKit): Open-source modding tool and asset editor for REDengine games.

---

## ⚖️ Legal & Fair Use Disclaimer

- **Cyberpunk 2077** and **REDengine** are registered trademarks of **CD PROJEKT S.A.**
- This repository is not affiliated with, endorsed by, or sponsored by CD PROJEKT RED.
- The decompiled scripts and bytecode representations contained herein are published strictly for educational, research, reverse-engineering, and non-commercial mod development purposes under fair use doctrine.
- Community mod scripts included in the modded dump remain the intellectual property of their respective creators. If you are a mod author and wish to request attribution or modification, please open an issue.

---

## 🤝 Contributing & Support

Contributions, documentation improvements, and feedback are welcome!
- **Issues**: Report broken syntax or suggest improvements via GitHub Issues.
- **Discussions**: Connect with the community on the [REDmodding Discord](https://discord.gg/redmodding).
