#!/usr/bin/env python3

import argparse
import sys
import os
import datetime
import json
import re

BR = "\n\n"

axi_signals = ["awid",
               "awaddr",
               "awlen",
               "awsize",
               "awburst",
               "awlock",
               "awcache",
               "awprot",
               "awqos",
               "awvalid",
               "awready",
               "wdata",
               "wstrb",
               "wlast",
               "wvalid",
               "wready",
               "bid",
               "bresp",
               "bvalid",
               "bready",
               "arid",
               "araddr",
               "arlen",
               "arsize",
               "arburst",
               "arlock",
               "arcache",
               "arprot",
               "arqos",
               "arvalid",
               "arready",
               "rid",
               "rdata",
               "rresp",
               "rlast",
               "rvalid",
               "rready"]

_acronym_to_litex_bus = {
    "AXI": "axi.AXIInterface",
    "AXIL": "axi.axi_lite.AXILiteInterface",
    "WB": "wishbone.Interface",
    "AXIS": "axi.stream.AXIStreamInterface"
}

_litex_bus_to_acronym = dict((v, k) for k, v in _acronym_to_litex_bus.items())


def get_aigtop_signals():
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


def _header(title, isz=0, ich=' '):
    i = indt(isz, ich)
    return f"{i}# {title}{'-' * (100 - (len(i) + len(title) + 2))}"


def indt(isz: int = 0, ich: str = ' ') -> str:
    return f"{isz * ich}"


def _comment(lines=[], isz=0, ich=' '):
    return "\n".join([f'{indt(isz, ich)}# ' + l for l in lines])


def _join(xs: list[str], ch: str = '\n'):
    return ch.join(xs)


def _copyright():
    year = datetime.date.today().year
    return _join(['#!/usr/bin/env python3', "",
                  _comment([f"Copyright (c) {year} Antmicro <www.antmicro.com>",
                            "", "SPDX-License-Identifier: BSD-2-Clause"])])


def _bus_config_to_litex(bus: str):
    reader, csr, writer = bus_config.split('_')

    for bus in [reader, csr, writer]:
        if bus not in _acronym_to_litex_bus.keys():
            raise ValueError(f"Unsupported bus type: {bus}")

    return (f'{reader.lower()}_read', f'{csr.lower()}_control',
            f'{writer.lower()}_write')


def get_csr_bus_signals(bus: str):
    if bus == "AXIL":
        return axi_signals

    if bus in ["WB", "PWB"]:
        return ["dat_i",
                "dat_o",
                "cyc_i",
                "stb_i",
                "we_i",
                "adr_i",
                "sel_i",
                "ack_o",
                "stall_o",
                "err_o"]

    raise ValueError(f"Unsupported control bus type: {bus}")


def get_IO_bus_signals(bus: str):
    # TODO Handle AXIS properly
    if bus == "AXIS":
        return ["tdata", "tvalid", "tready", "tuser", "tlast"]

    if bus == "AXI":
        return axi_signals

    if bus in ["WB", "PWB"]:
        return ["dat_i",
                "dat_o",
                "cyc_o",
                "stb_o",
                "we_o",
                "adr_o",
                "sel_o",
                "ack_i",
                "stall_i",
                "err_i"]

    raise ValueError(f"Unsupported bus type: {bus}")


def signal_to_litex(aig_signal):

    def belongs_to_reader_bus(s):
        return 'read' in s

    def belongs_to_writer_bus(s):
        return 'write' in s

    def belongs_to_csr_bus(s):
        return 'control' in s

    axi_io = get_IO_bus_signals("AXI")
    axil_csr = get_csr_bus_signals("AXIL")
    wb_csr = get_csr_bus_signals("WB")
    wb_io = get_IO_bus_signals("WB")
    s = aig_signal.split('_')

    # the last (or second last in case of wishbone) element
    # is the name of a singal; previous ones represent the hierarchy
    s_last = s[len(s) - 1]

    channels = ["aw", "ar", "w", "b", "r"]
    # The names of the AXI / AXIL signals in verilog are
    # constructed as <axi_channel><signal_name>
    # So data in 'r' channel will be *_rdata in FastVDMA's verilog
    # LiteX is expecting those to be <axi_channel>.<signal_name>
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

    s_snd_last = _join(s[len(s) - 2:], '_')
    # LiteX doesn't specify wishbone's signals directions (apart from
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


def _import(_from: str, imports: list[str] = [], isz: int = 0, ich: str = ' '):
    prefix = f"from {_from} " if imports else ""
    suffix = _join(imports, ', ') if imports else _from
    return indt(isz, ich) + prefix + f"import {suffix}"


def _var(name: str, value: str, op: str = "=", isz: int = 0, ich: str = ' '):
    return f"{indt(isz, ich)}{name} {op} {value}"


def _imports(target):
    imports = {
        "os": [],
        "migen": ["*"],
        "litex_boards.targets": [target],
        "litex.soc.interconnect": ["axi", "wishbone"],
        "litex.soc.integration.soc": ["SoCRegion"],
        "litex.soc.integration.builder": ["Builder"],
        "litex.build.parser": ["LiteXArgumentParser"]
    }
    return _join([_import(f, i) for f, i in imports.items()])


def _sources(src: list[str], isz: int = 0, ich: str = ' '):
    def add_source(name: str):
        return f'platform.add_sources(os.path.abspath(os.path.dirname(__file__)), "{name}")'
    return _join([f"{indt(isz, ich)}{add_source(f)}" for f in src])


def _comb(right: str, isz: int = 0, ich: str = ' '):
    return _var("self.comb", right, "+=", isz, ich)


def _specials(right: str, isz: int = 0, ich: str = ' '):
    return _var("self.specials", right, "+=", isz, ich)


def _class(name: str, content: str, extending: str = "", isz: int = 0, ich: str = ' '):
    inheritance = f'({extending})' if extending else ''
    return f"{indt(isz, ich)}class {name}{inheritance}:\n" + content


def _func(name: str, params: str, content: str = "", isz: int = 0, ich: str = ' '):
    return f"{indt(isz, ich)}def {name}({', '.join(params)}):\n" + content


def _if(if_cond: str, exec_if: str, elif_conds: list[str] = [], exec_elif: list[str] = [],
        exec_else: str = "", isz: int = 0, ich: str = ' '):
    i = indt(isz, ich)

    _if_block = f"{i}if {if_cond}:\n{indt(isz+4, ich)}{exec_if}"

    _else = f"{i}else:\n{indt(isz+4, ich)}{exec_else}" if exec_else else ""

    if elif_conds:
        _elif = _join([f"{i}elif {cond}:{ex}" for cond,
                      ex in zip(elif_conds, exec_elif)])
        return _join([_if_block, _elif, _else])

    return _join([_if_block, _else])


def connect_aig_to_litex(bus_config: str, isz=0, ich=' '):
    litex_in, litex_csr, litex_out = _bus_config_to_litex(bus_config)

    # match the signal to the litex bus based on
    # aig signal prefix (hierarchy)
    # (or don't - when it's clock, reset or irq)
    def litex_bus(aig_signal):
        if 'io_in_read' in aig_signal:
            return litex_in
        elif 'io_control' in aig_signal:
            return litex_csr
        elif 'io_out_write' in aig_signal:
            return litex_out
        elif aig_signal in ['i_clock', 'i_reset', 'o_io_irq_dmaIn', 'o_io_irq_dmaOut']:
            return ''
        raise ValueError(f'Weird signal {aig_signal}')

    # parse signal names from verilog
    aig = get_aigtop_signals()

    assignents = []
    for s in aig:
        # LiteX doesn't implement stall for wishbone
        if 'stall' in s:
            continue
        bus = litex_bus(s)
        bus = bus + '.' if bus else ""
        prefix = 'self.' if s not in ['i_clock', 'i_reset'] else ''
        assignents.append(_var(s, f"{prefix}{bus}{signal_to_litex(s)}",
                               isz=isz, ich=ich))
    return _join(assignents, ',\n')


def _aig_module(bus_config, data_width, addr_width, signal_mapping, cpu, isz=0, ich=' '):
    source_files = ["AIGTop.v", "fpga_isp.v"]
    src = _sources(source_files, isz=isz + 8, ich=ich)

    # Init buses
    bus_inits = []
    for bus, litex_bus in zip(bus_config.split("_"), _bus_config_to_litex(bus_config)):
        width = addr_width

        if bus == 'WB' and cpu == 'zynq7000':
            width -= 2

        bus_inits.append(
            _var(f'self.{litex_bus}', _acronym_to_litex_bus[bus] + f'(data_width, {width})'))

    # Size of the FastVDMA irqs if fixed
    irq_in = _var('self.irq_dmaIn', 'Signal(2)')
    irq_out = _var('self.irq_dmaOut', 'Signal(2)')

    off = len(_specials('Instance(')) + isz + 8
    signals = connect_aig_to_litex(bus_config, isz=off, ich=' ')
    aig_instance = _specials(
        f'Instance("AIGTop",\n{signals}\n{indt(off, ich)})')

    init_params = ['self', 'platform', f'data_width={data_width}',
                   f'addr_width={addr_width}']

    init_content = _join([src, *bus_inits, irq_in, irq_out,
                         aig_instance], f'\n{indt(isz+8, ich)}')

    init_func = _func('__init__', init_params,
                      init_content, isz=isz+4, ich=ich)

    return _class('AIG', init_func, 'Module')


def _aigsoc(bus_config: str, freq: int, base_address: str, aig_size: int,
            cpu_type: str,  target, isz=0, ich=' '):
    litex_in, litex_csr, litex_out = _bus_config_to_litex(bus_config)
    bus_in_type, bus_csr_type, bus_out_type = bus_config.split('_')

    init_soc_core = [
        f"{target}.BaseSoC.__init__(self, **kwargs)", '']

    init_aig = _var('self.submodules.AIG', 'AIG(self.platform)')

    # Connect IOs

    ios = []
    for bus_name, bus_type in [(litex_in, bus_in_type), (litex_out, bus_out_type)]:
        if cpu_type == 'vexriscv_smp':
            if bus_type == 'AXI':
                wb_name = 'wb_' + bus_name.split("_")[1]
                ios.append(_var(wb_name,
                                _acronym_to_litex_bus['WB'] + '()'))
                ios.append(_var('self.submodules',
                                (f'axi.AXI2Wishbone(wishbone={wb_name},'
                                 f'axi=self.AIG.{bus_name})'),
                                '+='))
                ios.append(
                    f'self.dma_bus.add_master(name="aig_{wb_name}", master={wb_name})')
                ios.append('')
            else:
                ios.append(
                    f'self.dma_bus.add_master(name="aig_{bus_name}", master=self.AIG.{bus_name})')
        else:
            if bus_type == 'WB':
                ios.append(_var('self.submodules',
                                (f'axi.Wishbone2AXI(wishbone=self.AIG.{bus_name},'
                                 'axi=self.cpu.add_axi_hp_slave())'),
                                '+='))
                ios.append('')

            else:
                ios.append(
                    _comb(f"self.AIG.{bus_name}.connect(self.cpu.add_axi_hp_slave())"))
    csr = []
    if cpu_type == 'vexriscv_smp':
        if bus_csr_type == 'AXIL':
            aig_csr = 'wb_csr'
            csr.append(_var(aig_csr, _acronym_to_litex_bus['WB'] + '()'))
            csr.append(_var('self.submodules',
                            f'axi.Wishbone2AXILite(wishbone={aig_csr},'
                            f'axi_lite=self.AIG.{litex_csr})', '+='))
            csr.append('')
        else:
            aig_csr = f'self.AIG.{litex_csr}'

    elif cpu_type == 'zynq7000':
        aig_csr = f'self.AIG.{litex_csr}'
        csr.append(f'self.mem_map["csr"]={hex(0x43c00000 - base_addr)}')

    add_aig = f'self.bus.add_slave("AIG", {aig_csr}, SoCRegion(origin={hex(base_address)}, size={hex(aig_size)}, cached=False))'

    if cpu_type == "zynq7000":
        irq = _var('vdma_irq', 'Signal(16)')
        connect_irqs = _comb(
            ('[vdma_irq[0].eq(self.AIG.irq_dmaIn[1])\n,' 'vdma_irq[2].eq(self.AIG.irq_dmaOut[0]),]'))
        add_irq_to_ps7 = 'self.cpu.cpu_params.update({"i_IRQ_F2P" : vdma_irq})'
        add_irq = [irq, connect_irqs, add_irq_to_ps7]
    else:
        add_irq = [_comb(('[self.cpu.interrupt[14].eq(self.AIG.irq_dmaIn[1]),\n'
                          'self.cpu.interrupt[15].eq(self.AIG.irq_dmaOut[0])]'))]

    init_content = indt(isz+8, ich) + f"\n{indt(isz+8, ich)}".join(
        [*init_soc_core,
         init_aig, *ios, *csr, add_aig,
         *add_irq])

    init_params = ["self", "**kwargs"]

    init = _func("__init__", init_params, init_content,
                 isz=isz+4, ich=ich)

    return _class("AIGSoC", init, f"{target}.BaseSoC")


def _main(target, platform, base_addr):
    # Import platform
    parser = []
    desc = f"AIG SoC on {target}"
    if target == 'digilent_arty':
        imp = _import("litex_boards.platforms", [platform])
        parser = [imp, _var(
            "parser", f'LiteXArgumentParser(platform={platform}.Platform,'
            f'description="{desc}")')]

    elif target == 'antmicro_zynq_video_board':
        parser = [_var(
            "parser", f'LiteXArgumentParser(description="{desc}")')]

    add_build_arg = 'parser.add_argument("--build", action="store_true", help="Build bitstream")'
    args = _var("args", "parser.parse_args()")

    soc = []

    if target == 'digilent_arty':
        soc = [_var("soc", f"AIGSoC(**parser.soc_argdict)")]
    elif target == 'antmicro_zynq_video_board':
        soc = [_var('soc_args', 'parser.soc_argdict'), _var(
            'soc_args["cpu_type"]', '"zynq7000"'), _var("soc", f"AIGSoC(**soc_args)")]

    output_path = 'os.path.join("build", "aig_generated_target")'
    builder = _var("builder", f"Builder(soc, output_dir={output_path})")

    content = [*parser, add_build_arg, args, *soc,
               builder, _if('args.build', f'{indt(4)}builder.build(**parser.toolchain_argdict)')]

    main_content = f"\n{indt(4)}".join(content)

    return _if('__name__ == "__main__"', main_content)


if __name__ == "__main__":
    ROOT_DIR = os.path.join(os.path.dirname(
        os.path.abspath(__file__)), '../../../')
    DEF_CONFIG_PATH = os.path.join(ROOT_DIR, 'config.json')
    DEF_TARGET_PATH = os.path.join(ROOT_DIR, 'aig_generated_target.py')

    parser = argparse.ArgumentParser(description="AIG LiteX Target Generator.")
    parser.add_argument("--freq", default=100e6,
                        type=int, help="Target clock frequency.")
    parser.add_argument("--aig-size", default=0x10_0000,
                        type=int, help="Total size of AIG interface.")
    parser.add_argument("--target", default="digilent_arty",
                        type=str, help="Target FPGA device defined in LiteX Boards targets.")
    parser.add_argument("--platform", default="digilent_arty",
                        type=str, help="Platform of target FPGA device defined in LiteX Boards platforms.")
    parser.add_argument("--cpu-type", default="vexriscv_smp",
                        type=str, help="CPU type: zynq7000 or vexriscv_smp.")
    parser.add_argument("--config", default=DEF_CONFIG_PATH,
                        type=str, help="Path to AIG configuration.")
    parser.add_argument("--out", default=DEF_TARGET_PATH,
                        type=str, help="Output path.")

    args = parser.parse_args()
    assert (args.cpu_type in ["zynq7000", "vexriscv_smp"])
    assert (args.target in ['antmicro_zynq_video_board', 'digilent_arty'])

    sys.path.append(os.path.join(
        ROOT_DIR, 'tools/gen/accelerator_integration'))

    with open(args.config, 'r') as conf:
        config = json.load(conf)
        params = config["accelerator"]["params"]

        bus_config = config["busConfiguration"]
        data_width = params["dataWidth"]
        addr_width = params["addrWidth"]
        top_name = config["accelerator"]["topName"]
        signal_mapping = config["accelerator"]["signals"]

        baseaddr_dma_in = int(config['dmaIn']['baseAddress'], 16)
        baseaddr_dma_out = int(config['dmaOut']['baseAddress'], 16)
        baseaddr_dma_acc = int(config['accelerator']['baseAddress'], 16)

        base_addr = min(baseaddr_dma_in, baseaddr_dma_out, baseaddr_dma_acc)

    desc = os.open(path=args.out,
                   flags=(os.O_WRONLY | os.O_CREAT | os.O_TRUNC), mode=0o777)

    with open(desc, 'w') as fout:
        fout.write(_join([_copyright(),
                          _header("Imports"),
                          _imports(args.target),
                          _header("AIG"),
                          _aig_module(bus_config, data_width,
                                      addr_width, signal_mapping, args.cpu_type),
                          _header("AIGSoC"),
                          _aigsoc(bus_config, args.freq, base_addr,
                                  args.aig_size, args.cpu_type, args.target),
                          _header("Build"),
                          _main(args.target, args.platform, base_addr)],
                         BR))

    # Agressive formating (lines are a bit too long)
    import subprocess
    subprocess.run(['autopep8', '--in-place', args.out])
