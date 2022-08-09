package AIG.CSR

import AIG.AIGConfig._
import chisel3._
import chisel3.util._
import DMAController.Bus._

class WishboneCustomCSR(addrWidth: Int, csrCount: Int)
    extends AIGCSRBus[WishboneSlave] {
  val params = AIGConfigUtils.dmaIn

  val io = IO(new Bundle {
    val ctl = new WishboneSlave(addrWidth, params.controlDataWidth)
    val bus = new CSRBusBundle(params.controlDataWidth, csrCount)
  })

  val sIdle :: sAck :: Nil = Enum(2)
  val state = RegInit(sIdle)
  val ack = RegInit(false.B)
  val valid = WireInit(io.ctl.stb_i & io.ctl.cyc_i)

  switch(state) {
    is(sIdle) {
      ack := false.B
      when(io.ctl.stb_i & io.ctl.cyc_i) {
        state := sAck
        ack := true.B
      }
    }
    is(sAck) {
      ack := false.B
      state := sIdle
    }
  }

  io.ctl.stall_o := false.B
  io.ctl.err_o := false.B

  io.ctl.ack_o := ack
  io.bus.reg.write := ack & io.ctl.we_i
  io.bus.reg.read := ack & !io.ctl.we_i

  io.bus.reg.dataOut := io.ctl.dat_i
  io.ctl.dat_o := io.bus.reg.dataIn
  io.bus.addr := io.ctl.adr_i
}
