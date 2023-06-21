# Usage

## Synthesizable AIG verilog

If `CONFIG_FILE` is not specified, the default configuration file is `config.json` in project's root directory.

Running:

```

make verilog

```


will generate remaining chisel files (the Accelerator definition, AcceleratorIntegration and  optional CSRs) to, in the next step, generate --  `AIGTop.v` the synthesizable Accelerator-DMA system definition in Verilog.

  
To specify a different configuration file:

```

make verilog CONFIG_FILE=<path_to_config>

```

## Cocotb simulation

AIG implements a bus configuration independent testbench for AIG system with an example accelerator -- [FPGA ISP](https://github.com/antmicro/fpga-isp-core) core. It is a collection of ISP cores dedicated for real time video processing in FPGAs. It implements three different demosaicing debayering algorithms interpolating an image in Bayer format and outputting said image in RGB format.

The cocotb test suit can be easily adjusted to custom use case due to `AIGTestInterface` that instantiates I/O and CSR buses accordingly to configuration and handles reading from and writing to file. 

The part that needs to be adjusted is to correctly set up both FastVDMA's and Accelerator's CSR (if any).

FastVDMA requires transfer specific information such as:
- ReaderStartAddr -- Where to start reading from.
- LineLen -- Line length of the transfer (expressed as multiple of interface's data bus width).
- LineCnt -- Number of lines to transfer (height in terms of images).
- Stride -- The gap between consecutive lines (as multiple of data width).

```python
########################## Setup input DMA ##########################
# setup FastVDMA parameters - addresses, line lengtht etc.
await aig.write_csr(DMARegisterMap.ReaderStartAddr + base_addr_dma_in, 0)
await aig.write_csr(DMARegisterMap.ReaderLineLen + base_addr_dma_in,
                    (height * width) // 4)
await aig.write_csr(DMARegisterMap.ReaderLineCnt + base_addr_dma_in, 1)
await aig.write_csr(DMARegisterMap.ReaderStride + base_addr_dma_in, 0)

await aig.write_csr(DMARegisterMap.WriterStartAddr + base_addr_dma_in, 0)
await aig.write_csr(DMARegisterMap.WriterLineLen + base_addr_dma_in,
                    (height * width) // 4)
await aig.write_csr(DMARegisterMap.WriterLineCnt + base_addr_dma_in, 1)
await aig.write_csr(DMARegisterMap.WriterStride + base_addr_dma_in, 0)
```

Then, the FastVDMA needs to be started by writing to control register and unmasking interrupts:

```python
############################### Run DMAs  ################################
# Enable interrupts
await aig.write_csr(DMARegisterMap.InterruptMask + base_addr_dma_in, 0x3)
# Run in loop mode
await aig.write_csr(DMARegisterMap.Ctrl + base_addr_dma_in, 0xf)
```

Here's more detailed description on [FastVMDA's CSRs](https://github.com/antmicro/fastvdma/blob/main/doc/csr.md).