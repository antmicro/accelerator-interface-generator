package AIG.CSR.CustomCSRDefinition

import chisel3._
import chisel3.util._
import AIG.CSR._
import AIG.AIGConfig.AIGConfigUtils

class CustomCSRWrapper(val controlDataWidth: Int, controlRegisterCnt: Int)
    extends Module {
  val io = IO(new Bundle {
    val csrs = Flipped(new CustomCSRBundle)
    val bus = Flipped(new CSRBusBundle(controlDataWidth, controlRegisterCnt))
  })

  val baseAddr = (AIGConfigUtils.baseAccAddr.U / (AIGConfigUtils.dataWidth / 8).U(32.W))

  io.bus.ready := io.bus.reg.write || io.bus.reg.read
  io.bus.reg.dataIn := 0xbeef.U

  val regMap = collection.mutable.Map[String, BaseRegister]() ++= CSRMap.regMap

  val csrs = Wire(new CustomCSRBundle)
  io.csrs <> csrs

  for (
    (acc, reg) <- (csrs.productIterator.toList.asInstanceOf[List[Bundle]] zip regMap.values)
  ) {
    reg match {
      case x: StorageRegister[_] => acc <> x.fields
    }
  }

  for ((addr, reg) <- regMap) {
    when((io.bus.addr === (addr.U / (controlDataWidth / 8).U))) {
      reg.io <> io.bus.reg
    }.otherwise {
      reg.io.write := false.B
      reg.io.read := false.B
      reg.io.dataOut := 0.U
    }
  }
}
