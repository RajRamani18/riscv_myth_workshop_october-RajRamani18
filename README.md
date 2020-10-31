# RISC-V Core (RV32I)

This repository describes information needed to build pipelined RISC-V core. This core supports base integer RV32I instruction. This core is designed using TL-Verilog on makerchip platoform.

# Table of Contents

- [Introduction to RISC-V ISA](#Introduction-to-RISC-V-ISA)
- [Overview of GNU Compiler Collection](#Overview-of-GNU-Compiler-Collection)

# Introduction to RISC-V ISA

A RISC-V Instruction Set Architecture (ISA) is defined as a base integer ISA, which must be present in any implementation, plus optional extensions to the base ISA. Each base integer instruction set is characterized by

  1. Width of the integer registers (XLEN)
  2. Corresponding size of the address space
  3. Number of integer registers (32 in RISC-V)
  
More details on RISC-V ISA can be obtained [here](https://github.com/riscv/riscv-isa-manual/releases/download/draft-20200727-8088ba4/riscv-spec.pdf).

# Overview of GNU Compiler Collection

The GNU Compiler Collection (GCC) is a compiler system produced by the GNU Project supporting various programming languages. GCC has been ported to a wide variety of ISA. Here's the expalanation of how processor understands the machine code.

* Preprocessor - Process source code before compilation. Macro definition, file inclusion or any other directive if present.
* Compiler - Takes the input from preprocessor and converts into assembly code.
* Assembler - Takes compiled assembly code as an input and translates to relocatable machine code.
* Linker - Merge the machine code from several object files into one executable file.

RISC-V toolchain,
* Command to use the RISC-V gcc compiler:

  `riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o <object filename> <C filename>`
  
  Generic command with different options:
  
  `riscv64-unknown-elf-gcc <compiler option -O1 ; -Ofast> <ABI specifier -lp64; -lp32; -ilp32> <architecture specifier -RV64 ; -RV32> -o <object filename> <C filename>`
  
  More details on compiler options can be obtained [here](https://www.sifive.com/blog/all-aboard-part-1-compiler-args)
  
* Command to view assembly code
  
  `riscv64-unknown-elf-objdump -d <object filename>`

* SPIKE simulator to run RISC-V obj file

  `spike pk <object filename>`
  
  Use SPIKE as a debugger
  
  `spike -d pk <object Filename>`
  
  Set breakpoint
  
  `until pc 0 <pc of your choice>`
  
  To install complete risc-v toolchain locally on linux machine
  
  1. [RISC-V GNU Toolchain](http://hdlexpress.com/RisKy1/How2/toolchain/toolchain.html)
  2. [RISC-V ISA Simulator - SPIKE](https://github.com/kunalg123/riscv_workshop_collaterals)
  
  After installation, add PATH to .bashrc file for further use.
    
