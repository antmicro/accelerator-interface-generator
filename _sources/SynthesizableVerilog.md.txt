# Synthesizable AIG verilog

If `AIG_CONFIG` is not specified, the default configuration file is `config.json` in project's root directory.

Running:

```
make verilog
```


will generate remaining chisel files (the Accelerator definition, AcceleratorIntegration and  optional CSRs) to, in the next step, generate --  `AIGTop.v` the synthesizable Accelerator-DMA system definition in Verilog.

  
To specify a different configuration file:

```
make verilog AIG_CONFIG=<path_to_config>
```
