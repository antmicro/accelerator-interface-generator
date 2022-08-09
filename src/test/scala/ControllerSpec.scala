package AIG

import chiseltest.{
  ChiselScalatestTester,
  VerilatorBackendAnnotation,
  WriteVcdAnnotation
}

import org.scalatest.flatspec.AnyFlatSpec
import chisel3._
import chiseltest._
import chiseltest.simulator.VerilatorFlags
import chisel3.experimental.annotate
import java.io.File

class ControllerSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "ControllerSpec"
  val PATH = new File(".").getCanonicalPath
  println("PATH: " + PATH)
  val flags = new VerilatorFlags(
    Seq(
      "-Wno-PINMISSING",
      "-Wno-MODDUP",
      "-Wno-COMBDLY",
      "-Wno-CASEINCOMPLETE",
      "-Wno-WIDTH",
      "-Wno-INITIALDLY",
      // workaround for verilator missing some of the
      // resources used in test
      s"-I$PATH/src/main/resources"
    )
  )
  val verilog_annos = Seq(VerilatorBackendAnnotation, WriteVcdAnnotation, flags)

  def testImageTransfer(dut: AIGTop): Unit = {
    val imgTransfer = new ImageTransfer(dut)
  }

  import AIG.AIGConfig.AIGConfigUtils.busConfigString

  busConfigString match {
    case "AXI_AXIL_AXI" =>
      it should "perform 2D MM2MM transfer" in {
        test(new AIGTop).withAnnotations(verilog_annos)(testImageTransfer)
      }
    case _ => ()
  }
}
