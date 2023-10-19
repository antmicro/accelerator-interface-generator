import argparse
import sys
from aig_target import *
import os


class AIGTargetOnArty(AIGTarget):
    bus_standard = AIGBus.wb
    csr_bus = AIGBus.wb

    def __init__(self, frequency, size, config: Config) -> None:
        AIGTarget.__init__(self, SoCCPU.vexriscv_smp, SoCPlatform.arty,
                           SoCTarget.arty, size, frequency, config)
        self.config = config

    def _add_interrupts(self, interupts: dict):
        irqs = []
        for no, irq in interupts.items():
            irqs.append(f'self.cpu.interrupt[{no}].eq({irq})')

        return [self._comb('[' + ',\n'.join(irqs) + ']')]

    def _connect_memory_bus(self, memoryBus: Bus):
        return f'self.dma_bus.add_master(master={memoryBus.soc_name})'


class AIGTargetOnZVB(AIGTarget):
    bus_standard = AIGBus.axi
    csr_bus = AIGBus.axil

    def __init__(self, frequency, size, config: Config) -> None:
        AIGTarget.__init__(self, SoCCPU.zynq7000,
                           SoCPlatform.zvb, SoCTarget.zvb, size, frequency, config)
        self.config = config

    def _add_interrupts(self, interupts: dict):
        init_irq = self._var('irqs', 'Signal(32)')
        irqs = []
        for no, irq in interupts.items():
            irqs.append(f'irqs[{no}].eq({irq})')

        add_irq_to_ps7 = 'self.cpu.cpu_params.update({"i_IRQ_F2P" : irqs})'
        return [init_irq, self._comb('[' + ',\n'.join(irqs) + ']'), add_irq_to_ps7]

    def _connect_memory_bus(self, memoryBus: Bus):
        return self._comb(f"{memoryBus.soc_name}.connect(self.cpu.add_axi_hp_slave())")


if __name__ == "__main__":
    ROOT_DIR = os.path.join(os.path.dirname(
        os.path.abspath(__file__)), '../../../')
    DEF_CONFIG_PATH = os.path.join(ROOT_DIR, 'config.json')
    DEF_TARGET_PATH = os.path.join(ROOT_DIR, 'aig_generated_target.py')

    parser = argparse.ArgumentParser(description="AIG soc Target Generator.")
    parser.add_argument("--freq", default=100e6,
                        type=int, help="Target clock frequency.")
    parser.add_argument("--aig-size", default=0x10_0000,
                        type=int, help="Total size of AIG interface.")
    parser.add_argument("--target", default="digilent_arty",
                        type=str, help="Target FPGA device.")
    parser.add_argument("--config", default=DEF_CONFIG_PATH,
                        type=str, help="Path to AIG configuration.")
    parser.add_argument("--out", default=DEF_TARGET_PATH,
                        type=str, help="Output path.")

    args = parser.parse_args()
    assert (args.target in ['antmicro_zynq_video_board', 'digilent_arty'])

    sys.path.append(os.path.join(ROOT_DIR, 'tools/gen/accelerator_integration'))

    desc = os.open(path=args.out, flags=(os.O_WRONLY | os.O_CREAT | os.O_TRUNC), mode=0o777)
    cfg = Config(args.config)

    if args.target == 'digilent_arty':
        target = AIGTargetOnArty(args.freq, args.aig_size, cfg)
    elif args.target == 'antmicro_zynq_video_board':
        target = AIGTargetOnZVB(args.freq, args.aig_size, cfg)

    target.to_file(args.out)

    # Agressive formating (lines are a bit too long)
    import subprocess
    subprocess.run(['autopep8', '--in-place', args.out])
