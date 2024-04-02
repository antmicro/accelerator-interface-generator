# Introduction

The Accelerator Interface Generator (AIG) is a vendor independent project aiming to enhance interest and accessibility of computing on edge with FPGA devices. AIG offers a framework that automates the process of developing AI accelerators for different FPGA chips. Given accelerator's source code and its configuration, it incorporates two DMAs, accelerator and custom, user-specified CSRs.

The only requirement for the accelerator is  that it is compatible with AXI Stream for I/O operations.

All configuration is declared via configuration file. The comprehensive description can be found under [Configuration](Configuration.md) section. 

AIG provides functionality to generate example LiteX target boards including the accelerator design.

The targets that are currently supported are:
- Zynq Video Board with Zynq 7000 SoC
- Arty A7 with open source RISCV CPU

AIG provides a sample cocotb test suite for an example accelerator, which contains configuration-independent definition of `AIGTestInterface` making it easily adaptable to custom use cases.