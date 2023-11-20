import datetime
from dataclasses import dataclass
from enum import Enum, StrEnum, auto
from math import ceil, pow, log2
import json
import os
import re


_acronym_to_soc_bus = {
    "AXI": "axi.AXIInterface",
    "AXIL": "axi.axi_lite.AXILiteInterface",
    "WB": "wishbone.Interface",
    "AXIS": "axi.stream.AXIStreamInterface"
}

_soc_bus_to_acronym = dict((v, k) for k, v in _acronym_to_soc_bus.items())

ROOT_DIR = os.path.dirname(__file__).removesuffix('/tools/gen/target')

class Signals:
    class AxiSignals(StrEnum):
        awid = auto()
        awaddr = auto()
        awlen = auto()
        awsize = auto()
        awburst = auto()
        awlock = auto()
        awcache = auto()
        awprot = auto()
        awqos = auto()
        awvalid = auto()
        awready = auto()
        wdata = auto()
        wstrb = auto()
        wlast = auto()
        wvalid = auto()
        wready = auto()
        bid = auto()
        bresp = auto()
        bvalid = auto()
        bready = auto()
        arid = auto()
        araddr = auto()
        arlen = auto()
        arsize = auto()
        arburst = auto()
        arlock = auto()
        arcache = auto()
        arprot = auto()
        arqos = auto()
        arvalid = auto()
        arready = auto()
        rid = auto()
        rdata = auto()
        rresp = auto()
        rlast = auto()
        rvalid = auto()
        rready = auto()

    class WishboneSourceSignals(StrEnum):
        dat_i = auto()
        dat_o = auto()
        cyc_i = auto()
        stb_i = auto()
        we_i = auto()
        adr_i = auto()
        sel_i = auto()
        ack_o = auto()
        stall_o = auto()
        err_o = auto()

    class WishboneSinkSignals(StrEnum):
        dat_i = auto()
        dat_o = auto()
        cyc_o = auto()
        stb_o = auto()
        we_o = auto()
        adr_o = auto()
        sel_o = auto()
        ack_i = auto()
        stall_i = auto()
        err_i = auto()

    class AxiStreamSignals(StrEnum):
        tdata = auto()
        tvalid = auto()
        tready = auto()
        tuser = auto()
        tlast = auto()

    def __init__(self) -> None:
        pass

    def get_csr_bus_signals(self, bus: str):
        if bus == "AXIL":
            return self.AxiSignals.__dict__.values()

        if bus in ["WB", "PWB"]:
            return self.WishboneSourceSignals.__dict__.values()

        raise ValueError(f"Unsupported control bus type: {bus}")

    def get_IO_bus_signals(self, bus: str):
        if bus == "AXIS":
            return self.AxiStreamSignals.__dict__.values()

        if bus == "AXI":
            return self.AxiSignals.__dict__.values()

        if bus in ["WB", "PWB"]:
            return self.WishboneSinkSignals.__dict__.values()

        raise ValueError(f"Unsupported bus type: {bus}")

    def to_soc(self, aig_signal: str):
        def belongs_to_reader_bus(s):
            return 'read' in s

        def belongs_to_writer_bus(s):
            return 'write' in s

        def belongs_to_csr_bus(s):
            return 'control' in s

        axi_io = self.get_IO_bus_signals("AXI")
        axil_csr = self.get_csr_bus_signals("AXIL")
        wb_csr = self.get_csr_bus_signals("WB")
        wb_io = self.get_IO_bus_signals("WB")
        s = aig_signal.split('_')

        # the last (or second last in case of wishbone) element
        # is the name of a singal; previous ones represent the hierarchy
        s_last = s[len(s) - 1]

        channels = ["aw", "ar", "w", "b", "r"]
        # The names of the AXI / AXIL signals in verilog are
        # constructed as <axi_channel><signal_name>
        # So data in 'r' channel will be *_rdata in FastVDMA's verilog
        # soc is expecting those to be <axi_channel>.<signal_name>
        if s_last in axil_csr or s_last in axi_io:
            for ch in channels:
                if s_last.startswith(ch):
                    return f"{s_last[:len(ch)]}.{s_last[len(ch):]}"

        if s_last == "clock":
            return 'ClockSignal("sys")'

        if s_last == "reset":
            return 'ResetSignal("sys")'

        if s_last.startswith('dma'):
            return f'irq_{s_last}'

        s_snd_last = '_'.join(s[len(s) - 2:])
        # soc doesn't specify wishbone's signals directions (apart from
        # the data signal) therefore stripping suffix
        # (and translating data i/o to w/r) is sufficient
        if s_snd_last in wb_csr or s_snd_last in wb_io:
            if s_snd_last.startswith('dat'):
                if belongs_to_reader_bus(s) or belongs_to_writer_bus(s):
                    return "dat_r" if s_snd_last == "dat_i" else "dat_w"
                if belongs_to_csr_bus(s):
                    return "dat_w" if s_snd_last == "dat_i" else "dat_r"
            return s_snd_last[:-2]

        raise ValueError(f"Unknown signal: {aig_signal}")

    def get_aigtop_signals(self, ROOT_DIR: os.PathLike[str]):
        with open(os.path.join(ROOT_DIR, "AIGTop.v"), "r") as aigtop:
            # Extract top module definition from verilog
            out = re.search('(?s)module AIGTop\([^\(\)]*\)', aigtop.read())
            defs = re.sub('module AIGTop', '', out.group(0))
            defs = defs.split(',\n')
            # Get rid of any characters that are not signal direction (input/output)
            # or its name
            defs = [re.sub('[\(\)\[0-9\]:,\n]', '', d) for d in defs]
            # Get rid of multiple (or trailing) spaces (it's more consistent this way)
            defs = [re.sub(' +', ' ', d).strip() for d in defs]
            # prefix signal names with i/o
            # final list of topmodule's signals
            defs = [f"{d[0]}_{'_'.join(d.split()[1:])}" for d in defs]
        return defs


class SoCTarget(StrEnum):
    arty = "digilent_arty"
    zvb = "antmicro_zynq_video_board"


class SoCPlatform(StrEnum):
    arty = "digilent_arty"
    zvb = "antmicro_zynq_video_board"


class SoCCPU(StrEnum):
    vexriscv_smp = auto()
    zynq7000 = auto()


class SoCBus(StrEnum):
    axi = "axi.AXIInterface"
    wb = "wishbone.Interface"
    axil = "axi.AXILiteInterface"
    pwb = "wishbone.Interface"
    axis = "axi.stream.AXIStreamInterface"

    def to_aig_bus(self, value):
        return AIGBus.__getattribute__(value.name)

    def config_to_soc_instances(bus_config):
        reader, csr, writer = bus_config.split('_')

        for bus in [reader, csr, writer]:
            if bus not in _soc_bus_to_acronym.values():
                raise ValueError(f"Unsupported bus type: {bus}")

        return (f'{reader.lower()}_read', f'{csr.lower()}_control', f'{writer.lower()}_write')


class AIGBus(StrEnum):
    axi = "AXI"
    wb = "WB"
    axil = "AXIL"
    pwb = "PWB"
    axis = "AXIS"

    def to_soc_bus(value):
        return SoCBus.__getattribute__(value.name)

    def to_soc_bus_from_aronym(acr):
        for bus in AIGBus:
            if bus == acr:
                return SoCBus.__getattribute__(bus.name)


class BusPlacement(Enum):
    bus_in = auto()
    bus_csr = auto()
    bus_out = auto()


class Bus:
    def __init__(self, bus_type: str, placement: BusPlacement,
                 addrwidth: int, datawidth: int, name: str = None) -> None:

        assert (bus_type.lower() in ["axi", "axis", "wb", "pwb", "axil"])
        bus_type = bus_type.lower()

        self.soc_type = SoCBus[bus_type]
        self.aig_type = AIGBus[bus_type]
        self.placement = placement
        self.addrwidth = addrwidth - 2 if bus_type == 'wb' else addrwidth
        self.datawidth = datawidth

        match placement:
            case BusPlacement.bus_in:
                self.soc_name = bus_type + '_read'
            case BusPlacement.bus_csr:
                self.soc_name = bus_type + '_control'
            case BusPlacement.bus_out:
                self.soc_name = bus_type + '_write'
        if name:
            self.soc_name = name


class SoCBridge(StrEnum):
    axi2wishbone = 'axi.AXI2Wishbone'
    wishbone2axi = 'axi.Wishbone2AXI'
    axil2wishbone = 'axi.AXILite2Wishbone'
    wishbone2axil = 'axi.Wishbone2AXILite'
    axi2axil = 'axi.AXI2AXILite'
    axil2axi = 'axi.AXILite2AXI'


@dataclass(frozen=True)
class MemoryRegion:
    name: str
    origin: int
    size: int

@dataclass(frozen=True)
class MemoryMapEntry:
    name: str
    origin: int

class Config:
    def __init__(self, target_config_path: str):
        from jsonschema import validate
        from validate_config import validate_config

        target_schema_path = os.path.join(ROOT_DIR, "docs", "target.schema.json")
        with open(target_config_path, 'r') as target_config, open(target_schema_path) as target_schema:
            config = json.load(target_config)
            schema = json.load(target_schema)

            # Validate target config
            try:
                validate(config, schema)
            except Exception as err:
                raise Exception(f'Invalid target config: {type(err)}: {err}')

            self.target = config['targetDevice']
            self.cpu = config['cpu']
            self.freq = config['systemClockFrequency']
            self.base_addr = int(config['baseAddress'], 16)

            if 'additionalMemoryRegions' in config:
                self.mem_regions = []
                for reg in config['additionalMemoryRegions']:
                    self.mem_regions.append(MemoryRegion(reg['name'], reg['origin'], reg['size']))

            if 'customMemoryMapEntries' in config:
                self.mem_map_entries = []
                for entry in config['customMemoryMapEntries']:
                    self.mem_map_entries.append(MemoryMapEntry(entry['name'], entry['origin']))

            self.soc_args = {'cpu_type': self.cpu}
            if 'socArgs' in config:
                for arg in config['socArgs']:
                    val = arg['value']
                    # Deduce value type
                    if type(val) is int: # Decimal number
                        pass
                    elif val.startswith('0x') and val[2:].isnumeric(): # Hexadecimal number
                        val = int(val, 16)
                    elif val.lower() == "true": # Boolean
                        val = True
                    elif val.lower() == "false": # Boolean
                        val = False

                    self.soc_args[arg['name']] = val

            if 'addArgGroupsCustom' in config:
                self.custom_arg_groups = []
                for func in config['addArgGroupsCustom']:
                    self.custom_arg_groups.append(func)

            if 'setCpuArgsCustom' in config:
                self.set_cpu_args_custom = []
                for func in config['setCpuArgsCustom']:
                    self.set_cpu_args_custom.append(func)

            self.aig_size = None if 'aigSize' not in config else config['aigSize']
            aig_config_path = config['aigConfigPath']

        # Validate AIG config
        try:
            validate_config(aig_config_path)
        except Exception as err:
            raise Exception(f'Invalid AIG config: {type(err)}: {err}')

        with open(aig_config_path, 'r') as aig_config:
            config = json.load(aig_config)

            params = "params"
            for comp in ["dmaIn", "dmaOut", "accelerator"]:
                for width in ["dataWidth", "addrWidth", "controlDataWidth", "controlAddrWidth"]:
                    if comp in config and params in config[comp]:
                        self.__setattr__("_".join([comp.lower(),
                                                   width.lower()]),
                                         config[comp]["params"][width])
                    else:
                        self.__setattr__("_".join([comp.lower(),
                                                   width.lower()]),
                                         config['accelerator']["params"][width])

            self.bus_config = config["busConfiguration"]
            bus_in, bus_csr, bus_out = self.bus_config.split("_")

            self.__setattr__('bus_in',
                             Bus(bus_in,
                                 BusPlacement.bus_in,
                                 self.dmain_addrwidth,
                                 self.dmain_datawidth))

            self.__setattr__('bus_csr',
                             Bus(bus_csr,
                                 BusPlacement.bus_csr,
                                 self.accelerator_addrwidth,
                                 self.accelerator_datawidth))

            self.__setattr__('bus_out',
                             Bus(bus_out,
                                 BusPlacement.bus_out,
                                 self.dmaout_addrwidth,
                                 self.dmaout_datawidth))

            acc_config = config["accelerator"]
            self.top_name = acc_config["topName"]
            self.source_file = acc_config["sourceFile"]
            self.signal_mapping = acc_config["signals"]

            if not self.aig_size:
                dma_reg_cnt = 16
                dma_csr_size = dma_reg_cnt * (self.dmaout_controldatawidth / 8)
                acc_csr_size = 0 if 'csr' not in config['accelerator'] else len(config['accelerator']['csr'])
                aligned_csr_size = int(pow(2, ceil(log2(max(dma_csr_size, acc_csr_size)))))
                self.aig_size = aligned_csr_size

class AIGTarget:
    BR = "\n\n"

    def __init__(self, cpu: SoCCPU, platform: SoCPlatform, target: SoCTarget,
                 aig_size: int, freq: int, config: Config) -> None:
        self.cpu = cpu
        self.platform = platform
        self.target = target
        self.bus_in = config.bus_in
        self.bus_csr = config.bus_csr
        self.bus_out = config.bus_out
        self.aig_size = aig_size
        self.config = config
        self.freq = freq

    def indt(self, isz: int = 0, ich: str = ' ') -> str:
        return f"{isz * ich}"

    def _join(self, xs: list[str], ch: str = '\n'):
        return ch.join(xs)

    def _comment(self, lines=[], isz=0, ich=' '):
        return "\n".join([f'{self.indt(isz, ich)}# ' + l for l in lines])

    def _copyright(self):
        year = datetime.date.today().year
        year = year if year == 2023 else f"2023-{year}"
        return self._join(['#!/usr/bin/env python3',
                           "",
                           self._comment([f"Copyright (c) {year} Antmicro <www.antmicro.com>",
                                          "", "SPDX-License-Identifier: BSD-2-Clause"])])

    def _header(self, title, isz=0, ich=' '):
        i = self.indt(isz, ich)
        return f"{i}# {title}{'-' * (100 - (len(i) + len(title) + 2))}"

    def _var(self, name: str, value: str, op: str = "=", isz: int = 0, ich: str = ' '):
        return f"{self.indt(isz, ich)}{name} {op} {value}"

    def _comb(self, right: str, isz: int = 0, ich: str = ' '):
        return self._var("self.comb", right, "+=", isz, ich)

    def _specials(self, right: str, isz: int = 0, ich: str = ' '):
        return self._var("self.specials", right, "+=", isz, ich)

    def _class(self, name: str, content: str, extending: str = "", isz: int = 0, ich: str = ' '):
        inheritance = f'({extending})' if extending else ''
        return f"{self.indt(isz, ich)}class {name}{inheritance}:\n" + content

    def _func(self, name: str, params: str, content: str = "", isz: int = 0, ich: str = ' '):
        return f"{self.indt(isz, ich)}def {name}({', '.join(params)}):\n" + content

    def _if(self, if_cond: str, exec_if: str, elif_conds: list[str] = [], exec_elif: list[str] = [],
            exec_else: str = "", isz: int = 0, ich: str = ' '):

        i = self.indt(isz, ich)
        _if_block = f"{i}if {if_cond}:\n{self.indt(isz+4, ich)}{exec_if}"
        _else = f"{i}else:\n{self.indt(isz+4, ich)}{exec_else}" if exec_else else ""

        if elif_conds:
            _elif = self._join([f"{i}elif {cond}:{ex}" for cond, ex in zip(elif_conds, exec_elif)])
            return self._join([_if_block, _elif, _else])

        return self._join([_if_block, _else])

    def _import(self, _from: str, imports: list[str] = [], isz: int = 0, ich: str = ' '):
        prefix = f"from {_from} " if imports else ""
        suffix = self._join(imports, ', ') if imports else _from
        return self.indt(isz, ich) + prefix + f"import {suffix}"

    def _imports(self):
        imports = {
            "os": [],
            "migen": ["*"],
            "litex_boards.targets": [f"{self.target} as target"],
            "litex.soc.interconnect": ["axi", "wishbone"],
            "litex.soc.integration.soc": ["SoCRegion"],
            "litex.soc.integration.builder": ["Builder", "builder_args"],
            "litex.build.parser": ["LiteXArgumentParser"],
            "litex.soc.integration.soc_core": ["soc_core_args"],
            "litex.soc.cores.cpu.vexriscv_smp": ["VexRiscvSMP"]
        }
        return self._join([self._import(f, i) for f, i in imports.items()])

    def _sources(self, src: list[str], isz: int = 0, ich: str = ' '):
        def add_source(name: str):
            return f'platform.add_sources(os.path.abspath(os.path.dirname(__file__)), "{name}")'
        return self._join([f"{self.indt(isz, ich)}{add_source(f)}" for f in src])

    def _aig_module(self, isz: int = 0, ich: str = ' '):
        source_files = ["AIGTop.v", self.config.source_file]
        src = self._sources(source_files, isz=isz + 8, ich=ich)

        # Init buses
        bus_inits = [self._var(f'self.{bus.soc_name}',
                               bus.soc_type + f'({bus.datawidth}, {bus.addrwidth})')
                     for bus in [self.bus_in, self.bus_csr, self.bus_out]]

        # Size of the FastVDMA irqs is fixed
        irq_in = self._var('self.irq_dmaIn', 'Signal(2)')
        irq_out = self._var('self.irq_dmaOut', 'Signal(2)')

        off = len(self._specials('Instance(')) + isz + 8
        signals = self.connect_aig_to_soc(self.config.bus_config, isz=off, ich=' ')
        aig_instance = self._specials(f'Instance("AIGTop",\n{signals}\n{self.indt(off, ich)})')

        init_params = ['self', 'platform', f'data_width={self.config.accelerator_datawidth}',
                       f'addr_width={self.config.accelerator_addrwidth}']

        init_content = self._join([src, *bus_inits, irq_in, irq_out, aig_instance],
                                  f'\n{self.indt(isz+8, ich)}')

        init_func = self._func('__init__', init_params, init_content, isz=isz+4, ich=ich)

        return self._class('AIG', init_func, 'Module')

    def _add_interrupts(self, interupts: dict[int, str]):
        raise NotImplementedError

    def _connect_memory_bus(memoryBus: Bus):
        raise NotImplementedError

    def getsocBridge(self, busl: Bus, busr: Bus):
        _bridge_map = {
            (AIGBus.axi, AIGBus.wb): SoCBridge.axi2wishbone,
            (AIGBus.wb, AIGBus.axi): SoCBridge.wishbone2axi,
            (AIGBus.axil, AIGBus.wb): SoCBridge.axil2wishbone,
            (AIGBus.wb, AIGBus.axil): SoCBridge.wishbone2axil,
            (AIGBus.axi, AIGBus.axil): SoCBridge.axi2axil,
            (AIGBus.axil, AIGBus.axi): SoCBridge.axil2axi,
        }
        _parameter_name = {
            AIGBus.axi: 'axi',
            AIGBus.axil: 'axi_lite',
            AIGBus.wb: 'wishbone',
            AIGBus.pwb: 'wishbone'
        }

        bridge = _bridge_map[busl.aig_type, busr.aig_type]
        bridge += (f'({_parameter_name[busl.aig_type]}={busl.soc_name}, '
                   f'{_parameter_name[busr.aig_type]}={busr.soc_name})')
        return self._var('self.submodules', bridge, '+=')

    def _aigsoc(self, isz: int = 0, ich: str = ' '):
        init_soc_core = [f"target.BaseSoC.__init__(self, **kwargs)", '']
        init_aig = self._var('self.submodules.AIG', 'AIG(self.platform)')

        # Connect IOs
        ios = []
        for bus in [self.bus_in, self.bus_out]:
            bus.soc_name = 'self.AIG.' + bus.soc_name
            if self.bus_standard != bus.aig_type:
                name = self.bus_standard.lower() + '_' + bus.soc_name.split("_")[1]
                bus_convert = Bus(self.bus_standard, bus.placement,
                                  bus.addrwidth, bus.datawidth, name)
                ios.append(self._var(name, SoCBus[self.bus_standard.lower()] + '()'))
                ios.append(self.getsocBridge(bus, bus_convert))
                bus = bus_convert

            ios.append(self._connect_memory_bus(bus))
            ios.append('')

        self.bus_csr.soc_name = f'self.AIG.{self.bus_csr.soc_name}'

        custom_mem_map_entries = []
        if hasattr(self.config, 'mem_map_entries'):
            for entry in self.config.mem_map_entries:
                custom_mem_map_entries.append(f'self.mem_map["{entry.name}"]={entry.origin}')

        custom_mem_regions = []
        if hasattr(self.config, 'mem_regions'):
            for reg in self.config.mem_regions:
                custom_mem_regions.append(self._var(f'self.bus.regions["{reg.name}"]',
                                             f'SoCRegion(origin={reg.origin}, size={reg.size})'))

        add_aig = f'self.bus.add_slave("AIG", {self.bus_csr.soc_name}, SoCRegion(origin={hex(self.config.base_addr)}, size={hex(self.aig_size)}, cached=False))'

        add_irq = self._add_interrupts({0: 'self.AIG.irq_dmaIn[1]', 1: 'self.AIG.irq_dmaOut[0]'})

        init_content = self.indt(isz+8, ich) + f"\n{self.indt(isz+8, ich)}".join(
            [*init_soc_core, init_aig, *ios, *custom_mem_map_entries, *custom_mem_regions, add_aig, *add_irq])

        init_params = ["self", "**kwargs"]

        init = self._func("__init__", init_params, init_content, isz=isz+4, ich=ich)

        return self._class("AIGSoC", init, f"target.BaseSoC")

    def _main(self):
        # Import platform
        parser = []
        desc = f"AIG SoC on {self.target}"
        parser = [self._var("parser", f'LiteXArgumentParser(description="{desc}")'),
                  'builder_args(parser)',
                  'soc_core_args(parser)']

        if hasattr(self.config, 'custom_arg_groups'):
            for func in self.config.custom_arg_groups:
                parser.append(f'{func}(parser)')

        args = self._var('custom_soc_args', '{}')
        if hasattr(self.config, 'soc_args'):
            args = self._var('custom_soc_args', self.config.soc_args)

        update_args = [self._var('soc_args', 'parser.soc_argdict'),
                       'soc_args.update(custom_soc_args)',
                       'parser.set_defaults(**soc_args)'
                       ]
        if hasattr(self.config, 'set_cpu_args_custom'):
            update_args.append(self._var('args', 'parser.parse_args()'))
            for func in self.config.set_cpu_args_custom:
                update_args.append(f'{func}(args)')

        init_soc = [self._var("soc", f"AIGSoC(**soc_args)")]

        output_path = 'os.path.join("build", "aig_generated_target")'
        builder = self._var("builder", f"Builder(soc, output_dir={output_path})")

        content = [*parser, args, *update_args, *init_soc, builder,
                   'builder.build(**parser.toolchain_argdict)']

        main_content = f"\n{self.indt(4)}".join(content)

        return self._if('__name__ == "__main__"', main_content)

    def connect_aig_to_soc(self, bus_config: str, isz: int = 0, ich: str = ' '):
        soc_in, soc_csr, soc_out = SoCBus.config_to_soc_instances(bus_config)

        # match the signal to the soc bus based on
        # aig signal prefix (hierarchy)
        # (or don't - when it's clock, reset or irq)
        def soc_bus(aig_signal):
            if 'io_in_read' in aig_signal:
                return soc_in
            elif 'io_control' in aig_signal:
                return soc_csr
            elif 'io_out_write' in aig_signal:
                return soc_out
            elif aig_signal in ['i_clock', 'i_reset', 'o_io_irq_dmaIn', 'o_io_irq_dmaOut']:
                return ''
            raise ValueError(f'Unknown signal {aig_signal}')

        # parse signal names from verilog
        aig = Signals().get_aigtop_signals(ROOT_DIR)

        assignents = []
        for s in aig:
            # soc doesn't implement stall for wishbone
            if 'stall' in s:
                continue
            bus = soc_bus(s)
            bus = bus + '.' if bus else ""
            prefix = 'self.' if s not in ['i_clock', 'i_reset'] else ''
            assignents.append(
                self._var(s, f"{prefix}{bus}{Signals().to_soc(s)}", isz=isz, ich=ich))

        return self._join(assignents, ',\n')

    def to_file(self, path: os.PathLike[str]):
        with open(path, 'w') as fout:
            fout.write(self._join([self._copyright(),
                                   self._header("Imports"),
                                   self._imports(),
                                   self._header("AIG"),
                                   self._aig_module(),
                                   self._header("AIGSoC"),
                                   self._aigsoc(),
                                   self._header("Build"),
                                   self._main()],
                                  self.BR))
