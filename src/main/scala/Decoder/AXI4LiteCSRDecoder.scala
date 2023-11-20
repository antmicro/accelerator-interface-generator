package AIG.Decoder

import chisel3._
import chisel3.util._
import DMAController.DMAConfig._
import DMAController.Frontend.{Bus, CSRBus, AXI4LiteCSR}
import DMAController.Bus._
import AIG.AIGConfig.AIGConfigUtils._

class AXI4LiteCSRDecoder(addrWidth: Int, dataWidth: Int)
    extends AIGDecoder[AXI4Lite] {

  def isCsr(addr: UInt, baseAddr: UInt, csrSize: UInt): Bool = {
    (addr >= baseAddr) && (addr < (baseAddr + csrSize))
  }

  def isReadOver(axiControl: AXI4Lite): Bool = {
    (axiControl.r.rready && axiControl.r.rvalid)
  }

  def isWriteOver(axiControl: AXI4Lite): Bool = {
    (axiControl.b.bready && axiControl.b.bvalid)
  }

  val baseCsrAddrIn = baseDMAInAddr.U
  val baseCsrAddrOut = baseDMAOutAddr.U
  val baseCsrAddrAcc = baseAccAddr.U

  val io = IO(new Bundle {
    val controlIn = new AXI4Lite(addrWidth, dataWidth)
    val controlOut = new AXI4Lite(addrWidth, dataWidth)
    val controlAcc =
      if (accHasCSR) Some(new AXI4Lite(addrWidth, dataWidth)) else None
    val control = Flipped(new AXI4Lite(addrWidth, dataWidth))
  })

  val sIdleWrite :: sMuxWrite :: sDataWrite :: sRespWrite :: Nil = Enum(4)
  val sIdleRead :: sMuxRead :: sDataRead :: Nil = Enum(3)
  val writeState = RegInit(sIdleWrite)
  val readState = RegInit(sIdleRead)

  val sNone :: sIn :: sOut :: sAcc :: Nil = Enum(4)

  // Initialize CSR buses
  io.control.aw.awready := DontCare
  io.control.w.wready := DontCare
  io.control.b.bvalid := DontCare
  io.control.b.bresp := DontCare
  io.control.ar.arready := DontCare
  io.control.r.rdata := DontCare
  io.control.r.rresp := DontCare
  io.control.r.rvalid := DontCare

  io.controlIn.aw.awvalid := RegInit(false.B)
  io.controlIn.aw.awaddr := 0.U(addrWidth.W)
  io.controlIn.aw.awprot := 0.U(AXI4Lite.protWidth.W)
  io.controlIn.w.wvalid := false.B
  io.controlIn.w.wdata := 0.U(dataWidth.W)
  io.controlIn.w.wstrb := 0.U((dataWidth / 8).W)
  io.controlIn.b.bready := false.B
  io.controlIn.ar.arvalid := false.B
  io.controlIn.ar.araddr := 0.U(addrWidth.W)
  io.controlIn.ar.arprot := 0.U(AXI4Lite.protWidth.W)
  io.controlIn.r.rready := false.B

  io.controlOut.aw.awvalid := false.B
  io.controlOut.aw.awaddr := 0.U(addrWidth.W)
  io.controlOut.aw.awprot := 0.U(AXI4Lite.protWidth.W)
  io.controlOut.w.wvalid := false.B
  io.controlOut.w.wdata := 0.U(dataWidth.W)
  io.controlOut.w.wstrb := 0.U((dataWidth / 8).W)
  io.controlOut.b.bready := false.B
  io.controlOut.ar.arvalid := false.B
  io.controlOut.ar.araddr := 0.U(addrWidth.W)
  io.controlOut.ar.arprot := 0.U(AXI4Lite.protWidth.W)
  io.controlOut.r.rready := false.B

  if (accHasCSR) {
    io.controlAcc.get.aw.awvalid := false.B
    io.controlAcc.get.aw.awaddr := 0.U(addrWidth.W)
    io.controlAcc.get.aw.awprot := 0.U(AXI4Lite.protWidth.W)
    io.controlAcc.get.w.wvalid := false.B
    io.controlAcc.get.w.wdata := 0.U(dataWidth.W)
    io.controlAcc.get.w.wstrb := 0.U((dataWidth / 8).W)
    io.controlAcc.get.b.bready := false.B
    io.controlAcc.get.ar.arvalid := false.B
    io.controlAcc.get.ar.araddr := 0.U(addrWidth.W)
    io.controlAcc.get.ar.arprot := 0.U(AXI4Lite.protWidth.W)
    io.controlAcc.get.r.rready := false.B
  }

  val awaddr = RegInit(0.U(addrWidth.W))
  val araddr = RegInit(0.U(addrWidth.W))

  def connectWrite(axilite1: AXI4Lite, axilite2: AXI4Lite): Unit = {
    axilite1.aw <> axilite2.aw
    axilite1.w <> axilite2.w
    axilite1.b <> axilite2.b
  }

  def connectRead(axilite1: AXI4Lite, axilite2: AXI4Lite): Unit = {
    axilite1.ar <> axilite2.ar
    axilite1.r <> axilite2.r
  }

  val busReadMux = MuxCase(
    sNone,
    Array(
      isCsr(araddr, baseCsrAddrOut, dmaCSRSize.U) -> sOut,
      isCsr(araddr, baseCsrAddrIn, dmaCSRSize.U) -> sIn,
      isCsr(araddr, baseCsrAddrAcc, customCSRSize.U) -> sAcc
    )
  )

  val busWriteMux = MuxCase(
    sNone,
    Array(
      isCsr(awaddr, baseCsrAddrOut, dmaCSRSize.U) -> sOut,
      isCsr(awaddr, baseCsrAddrIn, dmaCSRSize.U) -> sIn,
      isCsr(awaddr, baseCsrAddrAcc, customCSRSize.U) -> sAcc
    )
  )

  val busRead = RegInit(sNone)
  val busWrite = RegInit(sNone)

  switch(readState) {
    is(sIdleRead) {
      when(io.control.ar.arvalid) {
        araddr := io.control.ar.araddr(aigMaxAddrLen, 0)
        readState := sMuxRead
      }
    }
    is(sMuxRead) {
      switch(busReadMux) {
        is(sNone) {}
        is(sIn) {
          connectRead(io.control, io.controlIn)
          when(isReadOver(io.control)) {
            readState := sIdleRead
          }
          busRead := busReadMux
        }
        is(sOut) {
          connectRead(io.control, io.controlOut)
          when(isReadOver(io.control)) {
            readState := sIdleRead
          }
          busRead := busReadMux
        }
        is(sAcc) {
          if (accHasCSR) {
            connectRead(io.control, io.controlAcc.get)
            when(isReadOver(io.control)) {
              readState := sIdleRead
            }
            busRead := busReadMux
          }
        }
      }
    }
  }

  switch(writeState) {
    is(sIdleWrite) {
      when(io.control.aw.awvalid) {
        awaddr := io.control.aw.awaddr(aigMaxAddrLen, 0)
        writeState := sMuxWrite
      }
    }
    is(sMuxWrite) {
      switch(busWriteMux) {
        is(sNone) {}
        is(sIn) {
          connectWrite(io.control, io.controlIn)
          when(isWriteOver(io.control)) {
            writeState := sIdleWrite
          }
          busWrite := busWriteMux
        }
        is(sOut) {
          connectWrite(io.control, io.controlOut)
          when(isWriteOver(io.control)) {
            writeState := sIdleWrite
          }
          busWrite := busWriteMux
        }
        is(sAcc) {
          if (accHasCSR) {
            connectWrite(io.control, io.controlAcc.get)
            when(isWriteOver(io.control)) {
              writeState := sIdleWrite
            }
            busWrite := busWriteMux
          }
        }
      }
    }
  }
}
