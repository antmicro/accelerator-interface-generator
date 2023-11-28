# Accelerator Interface Generator
---
Copyright (c) 2023 [Antmicro](https://www.antmicro.com)

## Overview
---
Accelerator Interface Generator is a tool that can connect any FPGA accelerator with FastVDMA Controllers via AXI Stream interface, creating ready-to-use data transferring pipeline for both simulation and hardware.

## Features
---
Given an accelerator source code and configuration file, AIG is able to generate:
- vendor independent DMA-Accelerator interface
- FPGA target device description with integrated AIG system

## Supported Configurations
---
- Data
	- AXI4
	- AXI Stream
	- Wishbone

- Control
	- AXI Lite
	- Wishbone

## Configuration File
---
In order to use this project, one must provide Accelerator source code (in verilog) and a configuration file in json format.

Configuration file must be of structure:
```json
{
    "busConfiguration": "busConfiguration",

    "Accelerator": {

        "sourceFile": "acceleratorFilename",
        "topName": "acceleratorTopModule",

        "params": {
            "addrWidth": "addrWidth",
            "dataWidth": "dataWidth",
            "maxBurst": "maxBurst",
            "controlAddrWidth": "controlAddrWidth",
            "controlDataWidth": "controlDataWidth",
            "fifoDepth": "fifoDepth"
        },

        "signals": {
            "clock": "clock",
            "reset": "reset",
            "input": {
                "tdata": "tdata",
                "tvalid": "tvalid",
                "tready": "tready",
                "tuser": "tuser",
                "tlast": "tlast"
            },
            "output": {
                "tdata": "tdata",
                "tvalid": "tvalid",
                "tready": "tready",
                "tuser": "tuser",
                "tlast": "tlast"
            }
        },

        "csr": [
            {
                "name": "csrName",
                "type": "csrType",
                "address": "csrAddress",
                "fields": [
                    {
                        "name": "fieldName",
                        "type": "fieldType",
                        "direction": "fieldDirection",
                        "size": "fieldSize"
                    },
                    "..."
                ]
            },
            "..."
        ]
    }
}
```

One can also precisely specify both DMAs by specifying `"params"` for `"DMAIn"` and `"DMAOut"`.

For more information on configuration see the [documentation](https://antmicro.github.io/accelerator-interface-generator/Configuration.html).

## Synthesizable AIG verilog
---
By default, the configuration file is `config.json` in project's root directory.

To produce a synthesizable AIG verilog run:
```
make verilog
```

Otherwise, path to the configuration file can be passed via `AIG_CONFIG`:
```
make verilog AIG_CONFIG=<path_to_config>
```

This will result in generating remaining scala files (the Accelerator definition, optional CSRs) which then results in synthesizable `AIGTop.v` Accelerator-DMA system.

## Source Code Structure
---
- [src](src) -- AIG scala sources
	- [main/scala](src/main/scala) -- chisel3 AIG implementation
		- [Accelerator Integration](src/main/scala/AcceleratorIntegration) -- auto generated Accelerator definition & its integration
		- [CSR](src/main/scala/CSR) -- definitions that allow for custom CSRs; some of which are auto generated
		- [Decoder](src/main/scala/Decoder) -- implementations of Wishbone and AXI4Lite decoders
	- [test](src/test) -- chiseltests
	- [fastvdma-chisel](https://github.com/antmicro/fastvdma) -- FastVDMA submodule
- [tools/gen](tools/gen) -- generating scripts
	- [accelerator_integration](tools/gen/accelerator_integration) -- scripts parsing configuration file to Accelerator definitions and custom CSRs
	- [target](tools/gen/target) -- scripts generating targets with AIG system
- [cocotb-tests](cocotb-tests) -- configuration independent simulation for example Accelerator in cocotb
