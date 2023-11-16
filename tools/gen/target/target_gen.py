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
            # User interrupts begin at no 14
            irqs.append(f'self.cpu.interrupt[{no+14}].eq({irq})')

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

def get_target_instance_from_string(target: str):
    supported_targets = {
        'digilent_arty': AIGTargetOnArty,
        'antmicro_zynq_video_board': AIGTargetOnZVB
    }
    return supported_targets[target]

if __name__ == "__main__":
    ROOT_DIR = os.path.dirname(__file__).removesuffix('/tools/gen/target')
    DEF_TARGET_PATH = os.path.join(ROOT_DIR, 'aig_generated_target.py')

    parser = argparse.ArgumentParser(description="AIG soc Target Generator.")
    parser.add_argument("--config", type=str, help="Path to target configuration.")
    parser.add_argument("--out", default=DEF_TARGET_PATH, type=str, help="Path for output target definition.")
    # Provides access to AIG validating procedures
    sys.path.append(os.path.join(ROOT_DIR, 'tools/gen/accelerator_integration')) 

    args = parser.parse_args()
    cfg = Config(args.config)
    target = get_target_instance_from_string(cfg.target)(cfg.freq, cfg.aig_size, cfg)
    target.to_file(args.out)

    import subprocess
    subprocess.run(['autopep8', '--in-place', args.out])
