# ⏰ Digital Clock (24-Hour Format) – Verilog Project

![Language](https://img.shields.io/badge/Language-Verilog-blue)
![Tool](https://img.shields.io/badge/Tool-Xilinx%20ISE%20%2F%20Vivado-orange)
![Status](https://img.shields.io/badge/Status-Completed-success)

---

## 🧠 Overview
This project implements a **Digital Clock in 24-hour format** using **Verilog HDL**.  
The clock displays time in the format **HH:MM:SS** and automatically resets after `23:59:59` to `00:00:00`.  
It demonstrates the use of **counters**, **modular design**, and **clock division** in digital logic design.

---

## 🎯 Objective
To design and simulate a **24-hour digital clock** that:
- Accurately counts seconds, minutes, and hours.  
- Automatically resets at midnight (`24:00:00 → 00:00:00`).  
- Displays time in a clear 24-hour format.

---

## 🧩 Tools Used
| Tool | Purpose |
|------|----------|
| **Xilinx ISE / Vivado** | Design simulation and waveform generation |
| **VS Code** | Verilog code editing |
| **ModelSim / Multisim (optional)** | Logic verification and debugging |

---

## ⚙️ Working Principle
The digital clock consists of three main counters:
1. **Second Counter (0–59)**  
2. **Minute Counter (0–59)**  
3. **Hour Counter (0–23)**  

Each counter rolls over when it reaches its limit:
- When seconds reach `59`, it resets to `00` and increments minutes.  
- When minutes reach `59`, it resets to `00` and increments hours.  
- When hours reach `23`, it resets to `00`.  

---

## 🧮 Block Diagram
pgsql
Copy code
      +----------------------------+
      |        Digital Clock       |
      |----------------------------|
      | Inputs: Clock, Reset       |
      | Outputs: HH, MM, SS        |
      +----------------------------+
               |     |     |
               v     v     v
       +--------+ +--------+ +--------+
       | Hours  | | Minutes| | Seconds|
       +--------+ +--------+ +--------+
yaml
Copy code

---

## 💻 Simulation Steps
1. Open **Xilinx ISE / Vivado** or **VS Code** with Verilog extension.  
2. Create a new project and add:
   - `digital_clock.v` → main module  
   - `digital_clock_tb.v` → testbench file  
3. Run behavioral simulation.  
4. View waveform to verify correct counting of hours, minutes, and seconds.  
5. Confirm proper rollover from `23:59:59 → 00:00:00`.

---

## 📂 Project Files
| File | Description |
|------|--------------|
| `digital_clock.v` | Main Verilog module |
| `digital_clock_tb.v` | Testbench file |
| `waveform.png` | Simulation waveform output |
| `README.md` | Project documentation |

---

## 📊 Results
- The clock successfully counts and displays time in **24-hour format**.  
- The design resets correctly after reaching `23:59:59`.  
- Simulation waveform confirms accurate time progression.

## 📸 Output
<img width="1918" height="1017" alt="image" src="https://github.com/user-attachments/assets/a652ea1c-c5ea-49b4-ad59-537e18a8e648" />

## 🚀 Future Enhancements
- Add **7-segment display driver** for FPGA hardware.  
- Include **AM/PM mode toggle** for 12-hour format.  
- Integrate **alarm functionality** and **stopwatch mode**.

---

## 👩‍💻 Author
**Aditi K**  
CSE (AI & ML) | Digital Clock Project | Verilog Simulation  

