package AIG

import chisel3._
import chisel3.util._

import AIG.AcceleratorIntegration._
import AIG.Decoder._
import AIG.CSR._
import AIG.AIGConfig._
import CSR.CustomCSRDefinition.CustomCSRWrapper
import CSR.AIGBus._

import DMAController._
import DMAController.Bus._
import DMAController.Frontend._

import AIG.CSR.CustomCSRDefinition._
import AIGConfigUtils._

class AIGTop extends Module {
  val (in_reader, in_csr, in_writer) = AIGConfigUtils.dmaIn.getBusConfig()
  val (out_reader, out_csr, out_writer) = AIGConfigUtils.dmaOut.getBusConfig()

  val dmaInParams = AIGConfigUtils.dmaIn
  val dmaOutParams = AIGConfigUtils.dmaOut
  assert(dmaInParams.controlDataWidth == dmaOutParams.controlDataWidth)
  val controlDataWidth = dmaInParams.controlDataWidth
  val controlAddrWidth = dmaInParams.controlAddrWidth

  val busIn = new Bus(dmaInParams)
  val busOut = new Bus(dmaOutParams)
  val io = IO(new Bundle {
    val in_read = busIn.getReaderBus(in_reader)
    val control = busIn.getControlBus(in_csr)
    val out_write = busOut.getWriterBus(out_writer)
    val irq_dmaIn = Output(UInt(2.W))
    val irq_dmaOut = Output(UInt(2.W))

  })
  val irq_in = VecInit(io.irq_dmaIn.asBools)
  val irq_out = VecInit(io.irq_dmaOut.asBools)

  val dmaIn = Module(new DMATop(dmaInParams))
  val dmaOut = Module(new DMATop(dmaOutParams))
  val accelerator = Module(new AcceleratorIntegration(controlDataWidth))
  val accd = Module(AIGDecoder(in_csr, controlAddrWidth, controlDataWidth))

  if (accHasCSR) {
    val csrBus = Module(AIGBus(in_csr, controlAddrWidth))
    val csrWrapper = Module(new CustomCSRWrapper(controlDataWidth, customCSRSize))

    // Connect Accelerator's CSRs
    accelerator.io.csrs <> csrWrapper.io.csrs

    accd.io.controlAcc.get <> csrBus.io.ctl
    csrWrapper.io.bus <> csrBus.io.bus
  }

  // Connect Accelerator and DMAs via streams
  accelerator.io.out <> dmaOut.io.read
  accelerator.io.in <> dmaIn.io.write

  // Connect CSR Decoder
  dmaIn.io.control <> accd.io.controlIn
  dmaOut.io.control <> accd.io.controlOut
  io.control <> accd.io.control

  // Connect DMA read & write frontends to the TOP module
  io.in_read <> dmaIn.io.read
  io.out_write <> dmaOut.io.write

  // Propagate clocks & resets
  accelerator.io.clk := clock
  accelerator.io.rst := reset

  // Connect IRQs
  irq_in(0) <> dmaIn.io.irq.writerDone
  irq_in(1) <> dmaIn.io.irq.readerDone
  io.irq_dmaIn <> irq_in.asUInt
  irq_out(0) <> dmaOut.io.irq.writerDone
  irq_out(1) <> dmaOut.io.irq.readerDone
  io.irq_dmaOut <> irq_out.asUInt

  // Ignore unused IOs
  dmaIn.io.sync <> DontCare
  dmaOut.io.sync <> DontCare
}
