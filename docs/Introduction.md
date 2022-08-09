The Accelerator Interface Generator aims for configurability and simplicity. It's main purpose was to be able to create a generic accelerator interface that could be used in efficient Deep Learning in IoT.

The AIG is a vendor independent project that allows to generate a Verilog module that incorporates two DMAs and an user-defined accelerator. The only requirement for the accelerator is compatibility with AXI Stream. AIG supports custom CSRs, which can be defined via configuration file. More on configuration can be found in the [Usage](Usage) section. 

AIG provides functionality to generate example LiteX target boards including said accelerator design.
The targets that are currently supported are:
- Zynq Video Board with Zynq7000 CPU
- Arty A7 with open source RISCV CPU

Apart from that, one can also generate files necessary for Renode-Verilator co-simulation or LiteX simulation, which can be useful in debugging.
