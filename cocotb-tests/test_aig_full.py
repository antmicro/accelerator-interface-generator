#!/usr/bin/env python3

import os
import cocotb
from cocotb.clock import Clock
import cocotb_test
import cocotb_test.simulator
import cocotbext.axi as cta
from cocotbext.wishbone.driver import WishboneMaster, WBOp
from cocotbext.wishbone.monitor import WishboneSlave
from cocotb.triggers import ClockCycles, RisingEdge
from enum import IntEnum
import json


def as_bytes(value: int) -> bytes:
    return value.to_bytes(length=4, byteorder='little')


def initAxiBusFromVerilog(dut, prefix: str) -> cta.AxiBus:
    axi_aw = cta.AxiAWBus.from_prefix(dut, prefix + "_aw")
    axi_w = cta.AxiWBus.from_prefix(dut, prefix + "_w")
    axi_b = cta.AxiBBus.from_prefix(dut, prefix + "_b")

    axi_ar = cta.AxiARBus.from_prefix(dut, prefix + "_ar")
    axi_r = cta.AxiRBus.from_prefix(dut, prefix + "_r")

    axi_writer = cta.AxiWriteBus(aw=axi_aw, w=axi_w, b=axi_b)
    axi_reader = cta.AxiReadBus(ar=axi_ar, r=axi_r)

    return cta.AxiBus(axi_writer, axi_reader)


def initAxiLiteBusFromVerilog(dut, prefix: str) -> cta.AxiLiteBus:
    axil_aw = cta.AxiLiteAWBus.from_prefix(dut, prefix + "_aw")
    axil_w = cta.AxiLiteWBus.from_prefix(dut, prefix + "_w")
    axil_b = cta.AxiLiteBBus.from_prefix(dut, prefix + "_b")

    axil_ar = cta.AxiLiteARBus.from_prefix(dut, prefix + "_ar")
    axil_r = cta.AxiLiteRBus.from_prefix(dut, prefix + "_r")

    axil_writer = cta.AxiLiteWriteBus(aw=axil_aw, w=axil_w, b=axil_b)
    axil_reader = cta.AxiLiteReadBus(ar=axil_ar, r=axil_r)

    return cta.AxiLiteBus(axil_writer, axil_reader)


class AIGTestInterface:
    wb_csr_mapping = {
        "cyc": "cyc_i",
        "stb":  "stb_i",
        "we":   "we_i",
        "adr":  "adr_i",
        "datwr": "dat_i",
        "datrd": "dat_o",
        "ack":  "ack_o",
        "stall": "stall_o",
        "sel": "sel_i",
        "ack": "ack_o",
        "err": "err_o",
    }
    wb_sub_mapping = {
        "cyc": "cyc_o",
        "stb":  "stb_o",
        "we":   "we_o",
        "adr":  "adr_o",
        "datwr": "dat_o",
        "datrd": "dat_i",
        "ack":  "ack_i",
        "stall": "stall_i",
        "sel": "sel_o",
        "ack": "ack_i",
        "err": "err_i",
    }

    def __init__(self, dut, config: list[str]) -> None:
        (self.in_bus, self.csr_bus, self.out_bus) = config
        read_prefix = "io_in_read"
        csr_prefix = "io_control"
        write_prefix = "io_out_write"

        self.read_region = None
        self.write_region = None

        # Initialize reader bus
        if self.in_bus == "AXI":
            self.read_region = cta.MemoryRegion(size=2**32)
            axi_bus = initAxiBusFromVerilog(dut, read_prefix)
            self.reader = cta.AxiSlave(
                axi_bus, dut.clock, dut.reset, self.read_region)
        elif self.in_bus == "WB":
            self.read_region = []
            self.reader = WishboneSlave(
                dut, read_prefix, dut.clock, width=32, signals_dict=self.wb_sub_mapping, datgen=self._wishbone_read_memory())

        # Initialize CSR handling bus
        if self.csr_bus == "AXIL":
            axil_bus = initAxiLiteBusFromVerilog(dut, csr_prefix)

            self.ctl = cta.AxiLiteMaster(axil_bus, dut.clock, dut.reset)
            self.read_csr = lambda addr, lenght: self.ctl.read(addr, lenght)
            self.write_csr = lambda addr, value: self.ctl.write(
                addr, as_bytes(value))

        elif self.csr_bus == "WB":
            self.ctl = WishboneMaster(dut, csr_prefix, dut.clock, width=32,
                                      signals_dict=self.wb_csr_mapping)
            self.read_csr = lambda addr, _: self.ctl.send_cycle(
                [WBOp(addr >> 2)])
            self.write_csr = lambda addr, value: self.ctl.send_cycle(
                [WBOp(addr >> 2, value)])

        # Initialize writer bus
        if self.out_bus == "AXI":
            self.write_region = cta.MemoryRegion(size=2**32)
            write_axi_bus = initAxiBusFromVerilog(dut, write_prefix)
            self.writer = cta.AxiSlave(
                write_axi_bus, dut.clock, dut.reset, target=self.write_region)

        elif self.out_bus == "WB":
            self.write_region = []
            self.writer = WishboneSlave(
                dut, write_prefix, dut.clock, width=32, signals_dict=self.wb_sub_mapping, callback=lambda x: self._wishbone_write_callback(x))

    def _wishbone_read_memory(self):
        im_in = []
        val, i = 0, 0
        for p in self.read_region:
            val |= (p << (8*(i)))
            i += 1
            if (i == 4):
                im_in.append(val)
                i, val = 0, 0

        while True:
            adr = self.reader.bus.adr.value.integer
            yield im_in[adr]

    def _wishbone_write_callback(self, transaction):
        for v in transaction:
            self.write_region.append(v.datwr.value)

    @cocotb.coroutine
    async def load_image(self, path: str, width: int, height: int) -> int:
        with open(path, 'rb') as in_image:
            data_in = in_image.read(width * height)
            if isinstance(self.read_region, cta.MemoryRegion):
                self.read_region.mem.write(data_in)
            else:
                self.read_region = data_in

        return 0

    @cocotb.coroutine
    async def write_image_to_file(self, path: str, width: int, height: int) -> int:
        # Save the output image to the file
        with open(path, 'wb') as out:
            if isinstance(self.write_region, cta.MemoryRegion):
                out_data = await self.write_region._read(0, width * height * 4)
                out.write(out_data)
            else:
                for i in range(width * height):
                    d = self.write_region[i]
                    r = (d & 0xff0000) >> 16
                    g = (d & 0x00ff00) >> 8
                    b = (d & 0x0000ff)
                    payload = bytearray([b, g, r, 0])
                    out.write(payload)
        return 0


class DMARegisterMap(IntEnum):
    Ctrl = 0x00
    Status = 0x04
    InterruptMask = 0x08
    InterruptStatus = 0x0c
    ReaderStartAddr = 0x10
    ReaderLineLen = 0x14
    ReaderLineCnt = 0x18
    ReaderStride = 0x1c
    WriterStartAddr = 0x20
    WriterLineLen = 0x24
    WriterLineCnt = 0x28
    WriterStride = 0x2c
    Version = 0x30
    Configuration = 0x34


async def step(dut, steps=1):
    await ClockCycles(dut.clock, num_cycles=steps)


async def waitRange(dut, expected, minc, maxc):
    i = 0
    while (dut.io_irq_dmaOut[0].value != expected) and (i < maxc and i >= minc):
        await step(dut)
        i = i+1
    assert (i >= minc)
    assert (i < maxc)


@cocotb.coroutine
async def reset(dut):
    RESET_CYCLES = 10

    dut.reset.setimmediatevalue(0)
    await ClockCycles(dut.clock, num_cycles=RESET_CYCLES)
    dut.reset.value = 1
    await ClockCycles(dut.clock, num_cycles=RESET_CYCLES)
    dut.reset.value = 0
    await RisingEdge(dut.clock)


@cocotb.test()
async def run_test(dut):
    ROOT_DIR = os.path.dirname(__file__).removesuffix('/cocotb-tests')
    width = 600
    height = 398
    CLK_PERIOD = 2
    CONFIG_PATH = os.path.join(ROOT_DIR, os.getenv("CONFIG_FILE"))
    with open(CONFIG_PATH, 'r') as conf:
        config = json.load(conf)
        cfg = config['busConfiguration'].split("_")

    base_addr_dma_in = int(config["dmaIn"]["baseAddress"], 16)
    base_addr_dma_out = int(config["dmaOut"]["baseAddress"], 16)
    base_addr_acc = int(config["accelerator"]["baseAddress"], 16)
    aig = AIGTestInterface(dut, cfg)

    assert (await aig.load_image(os.path.join(ROOT_DIR, "test-img.gray"), width, height) == 0)

    # generate clock
    await cocotb.start(Clock(dut.clock, CLK_PERIOD).start())
    await reset(dut)

    ##################### Setup Accelerator #####################
    #                               bgr             patter      algorithm
    await aig.write_csr(base_addr_acc, ((0x1 << 0x8) | (0x0 << 0x4) | 0x1))
    #                                     heigtht          width
    await aig.write_csr(base_addr_acc + 0x4, (height << 0xd) | width)

    ##################### Setup input DMA #####################
    cfg_in = await aig.read_csr(DMARegisterMap.Configuration + base_addr_dma_in, 4)
    # assert the config

    # setup FastVDMA parameters - addresses, line lengtht etc.
    await aig.write_csr(DMARegisterMap.ReaderStartAddr + base_addr_dma_in, 0)
    await aig.write_csr(DMARegisterMap.ReaderLineLen + base_addr_dma_in, (height * width) // 4)
    await aig.write_csr(DMARegisterMap.ReaderLineCnt + base_addr_dma_in, 1)
    await aig.write_csr(DMARegisterMap.ReaderStride + base_addr_dma_in, 0)

    await aig.write_csr(DMARegisterMap.WriterStartAddr + base_addr_dma_in, 0)
    await aig.write_csr(DMARegisterMap.WriterLineLen + base_addr_dma_in, (height * width) // 4)
    await aig.write_csr(DMARegisterMap.WriterLineCnt + base_addr_dma_in, 1)
    await aig.write_csr(DMARegisterMap.WriterStride + base_addr_dma_in, 0)

    ##################### Setup output DMA #####################
    cfg_out = await aig.read_csr(DMARegisterMap.Configuration + base_addr_dma_out, 4)
    # assert the config

    # setup FastVDMA parameters - addresses, line lengtht etc.
    await aig.write_csr(DMARegisterMap.ReaderStartAddr + base_addr_dma_out, 1)
    await aig.write_csr(DMARegisterMap.ReaderLineLen + base_addr_dma_out, width * height)
    await aig.write_csr(DMARegisterMap.ReaderLineCnt + base_addr_dma_out, 1)
    await aig.write_csr(DMARegisterMap.ReaderStride + base_addr_dma_out, 0)

    await aig.write_csr(DMARegisterMap.WriterStartAddr + base_addr_dma_out, 0)
    await aig.write_csr(DMARegisterMap.WriterLineLen + base_addr_dma_out, width * height)
    await aig.write_csr(DMARegisterMap.WriterLineCnt + base_addr_dma_out, 1)
    await aig.write_csr(DMARegisterMap.WriterStride + base_addr_dma_out, 0)

    #####################     Run DMAs     #####################
    await aig.write_csr(DMARegisterMap.InterruptMask + base_addr_dma_out, 0x3)
    await aig.write_csr(DMARegisterMap.Ctrl + base_addr_dma_out, 0xf)

    await aig.write_csr(DMARegisterMap.InterruptMask + base_addr_dma_in, 0x3)
    await aig.write_csr(DMARegisterMap.Ctrl + base_addr_dma_in, 0xf)

    await waitRange(dut, 1, 0, width*height*4)

    assert ((dut.io_irq_dmaIn[0].value == 1)
            or (dut.io_irq_dmaIn[1].value == 1))
    assert ((dut.io_irq_dmaOut[0].value == 1)
            or (dut.io_irq_dmaOut[1].value == 1))

    # Save the output image to file
    assert (await aig.write_image_to_file(os.path.join(ROOT_DIR, "out.rgba"), width, height) == 0)


def test_aig():
    ROOT_DIR = os.path.dirname(__file__).removesuffix('/cocotb-tests')
    TEST_DIR = os.path.abspath(os.getcwd())
    module = "test_aig_full"
    toplevel = "AIGTop"

    src = [
        os.path.join(ROOT_DIR, f"{toplevel}.v"),
        os.path.join(ROOT_DIR, "fpga_isp.v"),
    ]

    os.environ["WAVES"] = "1"

    cocotb_test.simulator.run(
        toplevel=toplevel,
        module=module,
        verilog_sources=src,
        sim_build=os.path.join(TEST_DIR, "sim_build"),
    )
