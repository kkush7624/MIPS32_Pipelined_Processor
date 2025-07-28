# MIPS32 Pipelined Processor 🚀

A fully functional 5-stage pipelined processor based on the MIPS32 ISA, implemented in Verilog. Includes instruction memory, register file, and pipeline stages (IF, ID, EX, MEM, WB). Tested with multiple programs and verified using GTKWave waveforms.

---

## 📌 Features

- ✅ 5-stage pipeline: **IF → ID → EX → MEM → WB**
- ✅ Instruction Memory and Register File
- ✅ Branch handling and HALT support
- ✅ Sample testbenches demonstrating:
  - Arithmetic operations (ADDI, ADD)
  - Memory access (LW, SW)
  - Loop execution (factorial-style multiply)
- ✅ Verified with **GTKWave simulation**

---

## 🧠 Architecture Diagram

![Block Diagram](/waveform/Pipelining_Architecture.jpeg)

---



## 🧪 Testbenches Explained

### 🔹 Testbench 1 — Arithmetic Addition

- Loads 3 numbers (10, 20, 25) → Adds → Stores result
- ✅ Final result: `R5 = 55`
- 📷 [Waveform Screenshot](./waveforms/testbench1.png)

### 🔹 Testbench 2 — Memory Load/Store

- Loads a value from memory → Adds constant → Stores back
- ✅ Demonstrates LW/ADDI/SW sequence
- 📷 [Waveform Screenshot](./waveforms/testbench2.png)

### 🔹 Testbench 3 — Loop Multiply (like factorial)

- Demonstrates data hazards and loop execution
- ✅ Result: `Mem[198] = 5040` (7!)
- 📷 [Waveform Screenshot](./waveforms/testbench3.png)

---

## 📷 Waveform Snapshots (GTKWave)

> Stored in `/waveforms/` folder, captured via `GTKWave`.

---

## 🛠️ Tools Used

- Verilog (Icarus Verilog)
- GTKWave
- Git, GitHub

---

## 👨‍💻 Author

**Kush Khandelwal**  
> Electrical Engineering @ DTU  
> Passionate about digital design, RTL & computer architecture

---

## 📎 License

This project is open-sourced under the [MIT License](LICENSE).
