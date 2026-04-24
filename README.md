A fully working CPLD-based replacement for the Timex SCLD, validated on real hardware.

This project is based on the original reverse engineering and VHDL model developed by the Load ZX Spectrum Museum and contributors.

⚠️ The original implementation was not fully functional on real hardware.
This version includes significant fixes and improvements required to achieve stable operation.

---

## 🧠 Overview

This is an implementation of the Timex TC2068 SCLD as used in:

* Timex Computer 2048
* Timex Computer 2068

The SCLD is responsible for:

* Memory control
* Video timing
* Bus arbitration

---

## 🔧 What was added / fixed

This version includes major corrections and hardware validation:

* Timing fixes (MREQ, RAS/CAS, address multiplexing)
* Improved compatibility with CMOS Z80 CPUs
* Bus contention behaviour corrections
* DRAM access stabilization
* Real hardware validation (not just simulation)

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

All design files (VHDL, PCB, etc.) are licensed under:

Creative Commons Attribution-ShareAlike 4.0 International License

https://creativecommons.org/licenses/by-sa/4.0/

A copy of the license is included in this repository.

---

## ⚖️ Trademarks

TIMEX is a trademark of TIMEX GROUP USA, INC

The authors of this work are not affiliated with or endorsed by the trademark holders.

Xilinx is a registered trademark of Xilinx, Inc.

---

## 📸 Hardware & Debug
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
