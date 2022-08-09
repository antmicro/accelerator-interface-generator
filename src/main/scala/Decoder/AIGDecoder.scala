package AIG.Decoder

import chisel3._
import DMAController.Frontend._
import DMAController.Bus._
import dataclass.data

abstract class AIGDecoder[+T] extends Module {
  val io: Bundle {
    val controlIn: T
    val controlOut: T
    val controlAcc: T
    val control: T
  }
}

object AIGDecoder {
  import DMAController.DMAConfig.DMAConfig.{AXIL, WB}
  def apply(busType: Int, addrWidth: Int, dataWidth: Int) = busType match {
    case AXIL => new AXI4LiteCSRDecoder(addrWidth, dataWidth)
    case WB   => new WishboneCSRDecoder(addrWidth, dataWidth)
  }
}
