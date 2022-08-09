package AIG

import chisel3.stage.ChiselStage
object AcceleratorDriver extends App {
  (new ChiselStage).emitVerilog(new AIGTop)
}
