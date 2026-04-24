# Timex SCLD CPLD Replacement (TC2068)

![Working Setup](docs/images/image-1777061193117.jpg)

A fully working CPLD replacement for the Timex SCLD — validated on real hardware.

✔ Timing fixes
✔ CMOS Z80 compatible
✔ Tested on real hardware

> This is not just a simulation model — this version works on real hardware.

---

## 🎥 Demo (Real Hardware)

> ✔ Proof of real hardware operation — not just simulation

### CPLD Replacement Running (Timex 2048)

https://www.youtube.com/watch?v=t5ia4-bkabo

---

### Original Hardware Reference (SCLD)

https://www.youtube.com/watch?v=evhCbX4_XCQ

---

## 📸 Hardware & Debug

> Real hardware validation using logic analysis and live system testing.

### Logic Analyzer (Timing Validation)

![Logic Analyzer](docs/images/image-1777061179767.jpg)

Captured signals used to debug and align timing (MREQ, RAS, CAS, multiplexing).

---

### Timex 2048 ("Timmy") Running with Guzman Logic Analyzer

![Timmy Running](docs/images/image-1777061193117.jpg)

System running with CPLD-based SCLD replacement, monitored using a Guzman logic analyzer.

---

### Timex 2068 Hardware

![Timex Board](docs/images/image-1777061549706.jpg)

Target system for SCLD replacement.

---

## ⚡ Quick Start

1. Program the CPLD with `scld_devboard.jed`
2. Install in place of the original SCLD
3. Power on

Done.

---

## 🧠 Overview

This project implements the Timex TC2068 SCLD using a CPLD.

Used in:

* Timex Computer 2048
* Timex Computer 2068

The SCLD is responsible for:

* Memory paging
* Video timing
* Bus arbitration
* DRAM access

---

## 🔧 What was fixed / improved

The original implementation worked in simulation but not reliably on real hardware.

This version includes:

* Timing fixes (MREQ, RAS, CAS, multiplexing)
* Improved compatibility with CMOS Z80 CPUs
* Bus contention corrections
* DRAM access stabilization
* Real hardware validation

---

## 🧪 Development Process

* Started from original VHDL implementation
* Observed incorrect behaviour on real hardware
* Analysed signals using logic analyzer
* Adjusted timing and internal logic
* Tested with multiple Z80 variants (NMOS / CMOS)
* Validated behaviour against real system

---

## 🧪 Development Approach

The project evolved through direct hardware testing rather than strict schematic-first design.

Key fixes were implemented and validated directly on the PCB.

---

## 🧰 Hardware

### Final PCB

`hardware/pcb/final/`

Final PCB design used for the working CPLD-based SCLD replacement.

---

### Prototype PCB

`hardware/pcb/prototype/`

Early prototype used during development and testing.

---

### Prototype Schematic

`hardware/schematics/`

⚠️ Note:
This schematic corresponds to the prototype stage and may differ from the final PCB.

The design evolved through direct hardware testing and iterative fixes.

---

## 💾 Firmware

### Prebuilt

`firmware/jed/`

* `scld_devboard.jed` → ready to program

---

### Source Code

`firmware/src/`

* VHDL implementation of the SCLD

---

### Constraints

`firmware/constraints/`

* UCF file defining CPLD pin mapping

---

### Xilinx Project

`firmware/xilinx/full_project/`

Full Xilinx ISE project used during development.

⚠️ Note:
Includes generated files (`remote/`, logs, etc.) to preserve the working environment.

Rebuilding is optional — the `.jed` file is sufficient.

---

## 🔍 Validation

Validated against real hardware:

* Video output behaviour
* Memory timing
* System stability
* CPU interaction timing

---

## 🙏 Credits

Based on work from:

* Load ZX Spectrum Museum
* Álvaro Lopes
* Paulo Cortesão
* João Diogo
* Hugo Pinto

Additional support:

* Rui Ribeiro

Extended, fixed and hardware-validated implementation:

* António Vítor

---

## 📜 License

Creative Commons Attribution-ShareAlike 4.0 International License

https://creativecommons.org/licenses/by-sa/4.0/

---

## ⚖️ Trademarks

TIMEX is a trademark of TIMEX GROUP USA, INC

The authors are not affiliated with or endorsed by the trademark holders.

Xilinx is a registered trademark of Xilinx, Inc.

## 📸 Hardware & Debug

> Real hardware validation using logic analysis and live system testing.

### Logic Analyzer (Timing Validation)

![Logic Analyzer](docs/images/image-1777061179767.jpg)

Captured signals used to debug and align timing (MREQ, RAS, CAS, multiplexing).

---

### Timex 2048 ("Timmy") Running with Guzman Analyzer

![Timmy Running](docs/images/image-1777061193117.jpg)

CPLD-based SCLD replacement running on real hardware.

---

### Timex 2068 Hardware

![Timex Board](docs/images/image-1777061549706.jpg)

Target system for SCLD replacement.
