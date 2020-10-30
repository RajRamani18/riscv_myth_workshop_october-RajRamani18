# RISC-V Core (RV32I)

This repository describes information needed to build pipelined RISC-V core. This core supports base integer RV32I instruction. This core is designed using TL-Verilog on makerchip platoform.

# Table of Contents

- [Introduction to RISC-V ISA](RISC-V%20%Core%20%(RV32I)#Introduction%20%to%20%RISC-V%20%ISA)

# Introduction to RISC-V ISA

A RISC-V Instruction Set Architecture (ISA) is defined as a base integer ISA, which must be present in any implementation, plus optional extensions to the base ISA. Each base integer instruction set is characterized by

  1. Width of the integer registers (XLEN)
  2. Corresponding size of the address space
  3. Number of integer registers (32 in RISC-V)
  
More details on RISC-V ISA can be obtained [here](https://github.com/riscv/riscv-isa-manual/releases/download/draft-20200727-8088ba4/riscv-spec.pdf).
