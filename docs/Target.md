# Target

## Generate target

In order to generate a target containing AIG design run:

```bash
make target CONFIG_FILE=<path_to_config> TARGET=<target_device> AIG_SIZE=<core_size> FREQ=<clock_frequency>
```

Where the `TARGET` is the name of the target device. Currently supported targets are:
- `digilent_arty` (with `VexRiscV SMP`),
- `antmicro_zynq_video_board` (with `Zynq7000`).

Optionally, `AIG_SIZE` and `FREQ` parameters may be passed to specify the size of the memory region to be designated for the AIG core and the clock frequency respectively.

The generated target will be saved in `aig_generated_target.py` file. 

To synthesize, place, route & generate bitstream, run:

```bash
python3 aig_generated_target.py --build
```

## Expand the supported targets

If the chosen `TARGET` is not supported, one can easily extend the target generation with said target.

The first step is to extend the enums within `aig_target.py` with the new target:
```python
class SoCTarget(StrEnum):
	arty = "digilent_arty"
	zvb = "antmicro_zynq_video_board"
	tg = "new_target"

class SoCPlatform(StrEnum):
	arty = "digilent_arty"
	zvb = "antmicro_zynq_video_board"
	tg = "platform_for_the_new_target"

class SoCCPU(StrEnum):
	vexriscv_smp = auto()
	zynq7000 = auto()
	new_cpu = auto() # If any
```

Then, in `targets.py` define the class representing the new target. This definition should contain the information about the bus standard and methods for registering interrupts and connecting memory buses.
```python
class AIGTargetOnTARGET(AIGTarget): # (1)
	bus_standard = AIGBus.<wb/axil/axi> # (2)
	csr_bus = AIGBus.<wb/axil/axi>

	def __init__(self, frequency, size, config: Config): # (3)
		AIGTarget.__init__(self, SoCCPU.new_cpu, SoCPlatform.tg,
			SoCTarget.tg, size, frequency, config)

	def _add_interrupts(self, interupts: dict): # (4)
		irqs = []
		for no, irq in interupts.items():
			irqs.append(f'self.cpu.interrupt[{no}].eq({irq})')
		return [self._comb('[' + ',\n'.join(irqs) + ']')]

	def _connect_memory_bus(self, memoryBus: Bus): # (5)
		return f'self.add_master(master={memoryBus.soc_name})'
```

::::{code-annotations}
1. The `AIGTarget` implements all the methods necessary for generating the target file.
   The AIGTargetOnTARGET specifies target-specific actions.
2. The `bus_standard` and `csr_bus` are the information on what bus interfaces does the target provide. With this information, if the AIG configuration uses different bus interface, a bridge will be placed.
3. For the most part, the `__init__` is supposed to initialize the AIGTarget with appropriate target, platform and cpu.
4. Here, one needs to specify how to register interrupts within this target. `interrupts` is a dictionary in which keys are desired numbers for the interrupts and values are the interrupt instances themselves.
5. Here, one needs to specify how to connect a memory bus in this target.
::::