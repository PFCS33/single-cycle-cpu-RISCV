# ⚙ RISC-V Single Cycle CPU

## Project Introduction

This is a Year 4 Summer Term project implementing a single-cycle CPU based on the RISC-V instruction set architecture. The CPU is designed using Verilog HDL and demonstrates fundamental computer architecture concepts including instruction fetch, decode, execute, and memory access operations in a single clock cycle.

The project successfully implements core RISC-V instructions and validates the design through comprehensive behavioral simulation testing, including a complete bubble sort algorithm execution.

## Development Environment & Tools

- **Implementation**: Verilog HDL
- **Simulation & Testing**: Xilinx Vivado
- **Assembly**: RARS for translating RISC-V assembly code to machine code that runs on the CPU

## Implementation Results

- **Successfully implemented instructions**: ADD, ADDI, SUB, LW, SW, BEQ, BLT, JAL, ORI
  - All instructions verified through behavioral simulation waveform testing

- **Implemented datapath diagram**:

  ![demo](./img/demo.png)

- **Behavioral simulation validation** of bubble sort algorithm for 5 numbers:

  ![demo2](./img/demo2.png)