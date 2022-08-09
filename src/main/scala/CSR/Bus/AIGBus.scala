package AIG.CSR

import DMAController.Frontend.{Bus, CSRBus, IOBus}
import chisel3.{Bundle, Module}
import AIG.AIGConfig.AIGConfigUtils.csrSize

abstract class AIGCSRBus[+T] extends Module {
  val io: Bundle {
    val ctl: T
    val bus: CSRBusBundle
  }
}

object AIGBus {
  import DMAController.DMAConfig.DMAConfig.{AXIL, WB}

  def apply(busType: Int, addrWidth: Int) = busType match {
    case AXIL => new AXI4LiteCustomCSR(addrWidth, csrSize)
    case WB   => new WishboneCustomCSR(addrWidth, csrSize)
  }
}
