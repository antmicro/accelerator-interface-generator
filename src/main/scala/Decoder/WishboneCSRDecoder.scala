package AIG.Decoder

import chisel3._
import chisel3.util._
import DMAController.Bus.WishboneSlave
import AIG.AIGConfig.AIGConfigUtils._

class WishboneCSRDecoder(addrWidth: Int, dataWidth: Int)
    extends AIGDecoder[WishboneSlave] {

  val addrIn = (baseDMAInAddr >> 2).U
  val addrOut = (baseDMAOutAddr >> 2).U
  val addrAcc = (baseAccAddr >> 2).U

  val sNone :: sIn :: sOut :: sAcc :: Nil = Enum(4)

  def isCsr(addr_i: UInt, baseAddr: UInt, customCSRSize: UInt): Bool = {
    (addr_i >= baseAddr) && (addr_i < (baseAddr + customCSRSize / 4.U))
  }
  def isCsrIn(addr_i: UInt): Bool = {
    isCsr(addr_i, addrIn, dmaCSRSize.U)
  }
  def isCsrOut(addr_i: UInt): Bool = {
    isCsr(addr_i, addrOut, dmaCSRSize.U)
  }
  def isCsrAcc(addr_i: UInt): Bool = {
    isCsr(addr_i, addrAcc, customCSRSize.U)
  }

  val io = IO(new Bundle {
    val controlIn = Flipped(new WishboneSlave(addrWidth, dataWidth))
    val controlOut = Flipped(new WishboneSlave(addrWidth, dataWidth))
    val controlAcc =
      if (accHasCSR)
        Some(Flipped(new WishboneSlave(addrWidth, dataWidth)))
      else None
    val control = new WishboneSlave(addrWidth, dataWidth)
  })

  io.control.stall_o := false.B
  io.control.err_o := false.B

  val addr_i = RegInit(0.U)
  val cyc_i = RegInit(0.U)
  val stb_i = RegInit(0.U)
  val we_i = RegInit(0.U)
  val sel_i = RegInit(0.U)
  val dat_i = RegInit(0.U)

  val ack_o = RegInit(false.B)
  val dat_o = RegInit(0.U)

  val sIdle :: sAwaitAck :: Nil = Enum(2)
  val state = RegInit(sIdle)
  val busMux = MuxCase(
    sNone,
    Array(
      isCsrOut(addr_i) -> sOut,
      isCsrIn(addr_i) -> sIn,
      isCsrAcc(addr_i) -> sAcc
    )
  )

  def isIn: Bool = { busMux === sIn }
  def isOut: Bool = { busMux === sOut }
  def isAcc: Bool = { busMux === sAcc }

  io.control.dat_o :=
    MuxCase(
      0.U,
      Array(
        isOut -> io.controlOut.dat_o,
        isIn -> io.controlIn.dat_o,
        isAcc -> io.controlAcc.get.dat_o
      )
    )

  io.control.ack_o := (state === sAwaitAck) &&
    (io.controlIn.ack_o & isIn | io.controlOut.ack_o & isOut | io.controlAcc.get.ack_o & isAcc)

  switch(state) {
    is(sIdle) {
      when(io.control.stb_i & io.control.cyc_i) {
        state := sAwaitAck
        addr_i := io.control.adr_i(aigMaxAddrLen, 0)
        sel_i := io.control.sel_i
        we_i := io.control.we_i
        cyc_i := true.B
        stb_i := true.B
      }
    }
    is(sAwaitAck) {
      when(io.control.ack_o) {
        state := sIdle
        sel_i := 0.U
        cyc_i := false.B
        stb_i := false.B
        we_i := false.B
      }
    }
  }

  io.controlOut.adr_i := addr_i & 0xff.U
  io.controlOut.stb_i := stb_i & isOut
  io.controlOut.cyc_i := cyc_i & isOut
  io.controlOut.we_i := we_i & isOut
  io.controlOut.sel_i := sel_i
  io.controlOut.dat_i := io.control.dat_i

  if (accHasCSR) {
    io.controlAcc.get.adr_i := addr_i & 0xff.U
    io.controlAcc.get.stb_i := stb_i & isAcc
    io.controlAcc.get.cyc_i := cyc_i & isAcc
    io.controlAcc.get.we_i := we_i & isAcc
    io.controlAcc.get.sel_i := sel_i
    io.controlAcc.get.dat_i := io.control.dat_i
  }

  io.controlIn.adr_i := addr_i & 0xff.U
  io.controlIn.stb_i := stb_i & isIn
  io.controlIn.cyc_i := cyc_i & isIn
  io.controlIn.we_i := we_i & isIn
  io.controlIn.sel_i := sel_i
  io.controlIn.dat_i := io.control.dat_i
}
