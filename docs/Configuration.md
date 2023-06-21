# Configuration

All of the customization can be specified with the JSON configuration file. Configuration file consists of four sections.

## Global bus configuration
```json
{
	"busConfiguration":"bus-in_csr-bus_bus-out",
}
```

Global bus configuration specifies the types of buses used for CSR handling and I/O operations -- that is the bus with which DMAs perform reads and writes to the main memory.

Bus configuration is decoded by `busConfiguration` variable, which is a string of format `bus-in_csr-bus_bus-out`, where `bus-in` and `bus-out` are abbreviations for AXI-Stream (AXIS), AXI4 (AXI), Wishbone (WB) and the `csr-bus` is an abbreviation for AXI4-Lite (AXIL) or Wishbone (WB).

## DMA Configuration
```json
{
    "dmaIn":{
        "baseAddress":"dmaInAddr"
        "params": {}
    },
    "dmaOut":{
        "baseAddress":"dmaOutAddr"
        "params": {}
    },
}
```

Address Space -- via `baseAddress` field -- is a required property for both DMAs and the accelerator. AIG uses a custom decoder that grants access upon those values.

## DMA Parameters Definition (optional)
```json
"params":{
    "addrWidth":"addrWidth",
    "dataWidth":"dataWidth",
    "maxBurst":"maxBurst",
    "controlAddrWidth":"controlAddrWidth",
    "controlDataWidth":"controlDataWidth",
    "fifoDepth":"fifoDepth"
}
```

FastVDMA itself allows for some customization. AIG permits the user to specify FastVDMA parameters to tailor the accelerator's system to user's use case. Those include declaring FastVDMA's buses widths as well as adjusting its internal FIFO size via `fifoDepth`.

## Accelerator Configuration

```json
{
    "accelerator":{
        "sourceFile":"acceleratorFilename",
        "topName":"acceleratorTopModule",
        "baseAddress":"acceleratorAddr",
        "params": {},
        "signals":{
            "clock":"clock",
            "reset":"reset",
            "input":{
                "tdata":"tdata",
                "tvalid":"tvalid",
                "tready":"tready",
                "tuser":"tuser",
                "tlast":"tlast"
            },
            "output": {}
        },
        "csr": []
  }
}
```

The main part of the configuration file is the `accelerator` property. This part is ought to contain the general knowledge about the accelerator such as: name of accelerator's Verilog source code file, name of the top module, signal mappings and optional, custom CSRs.

It is important to ensure that the accelerator's source code is in sbt's path. By default, the AIG will look for accelerator's source code in `examples/resources/` directory.

In order to specify custom path to resources in, include line in `build.sbt` file:
```scala
Compile / resourceDirectory := "path" / "to" / "resource" / "directory"
```

The `params` property contains information about address and data widths of `AXI-Streams` on the I/O of the accelerator (`addrWidth`, `dataWidth`) and of the CSR-handling bus (`controlAddrWidth`, `controlDataWidth`).

Accelerator's `AXI-Stream interfaces`, `clock` and `reset` are mapped to AIG interface using `signals` property. Each of these signals needs to be accessible from the accelerator's top module.

Lastly, `csr` attribute gives the option to specify custom registers to be added to the target and connected to the accelerator via chosen CSR-bus.

## Custom CSRs Definition (optional)
```json
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
        ]
    },
]
```

There are three types of registers supported: `Storage`, `Status` and `Clear`. Each register is determined by its `name` (needs to be **unique**), its **absolute address** and `fields`.

The `fields` define the contents of the CSR. The names of the fields are supposed to be the exact same as their signal correspondents in accelerator's top module. Field `type` refers to Chisel's type to be used when implementing this CSR it needs to be one of `UInt` or `Bool`.

Property `direction` identifies the data flow direction from accelerator's perspective (coincides with directions from accelerator's top module). Needs to be `Input` or `Output`.

Finally, the remaining position to specify is the `size` expressed in bits. It is important to note that the total size of the CSR cannot exceed the data address width.

The order of CSR fields is significant as they will be generated the way they are specified.
```json
"csr": [
    {
        "name": "ExCSR",
        "type": "Storage",
        "address": "0x10000",
        "fields": [
            {
                "name": "A",
                "type": "UInt",
                "direction": "Input",
                "size": 2
            },
            {
                "name": "B",
                "type": "UInt",
                "direction": "Output",
                "size": 2
            }
        ]
    },
]
```

The `ExCSR` layout will be of format `b'..AABB`.

AIG provides [JSON Schema](https://json-schema.org/) for the AIG configuration. This enables effortless validation of custom configuration file.