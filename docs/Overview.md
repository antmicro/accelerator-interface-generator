# Overview

The accelerator interface generator produces a system in which the Accelerator is attached to two DMAs via AXI Stream interface which handle the data between Accelerator and the memory.

DMAs used in this system are from the open source [FastVDMA](https://github.com/antmicro/fastvdma) project that supports a range of buses (AXI4, AXI Stream, Wishbone, AXI4 Lite).

If specified, the Accelerator is equipped with the bus that handles its custom CSRs (the bus could be either Wishbone or AXI Lite).

![[accelerator-interface.png]]

The AIG uses a custom decoder which grants access depended upon `baseAddress` defined in a configuration file.