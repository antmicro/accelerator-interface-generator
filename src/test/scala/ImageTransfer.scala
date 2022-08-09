package AIG

import DMAController.DMAConfig
import scala.reflect.runtime.universe._
import DMAController.Bus._
import DMAController.Worker._
import AIG.Bfm._
import chisel3._
import chiseltest._
import AIG.AIGConfig.AIGConfigUtils._

class ImageTransfer(dut: AIGTop) {

  println("Initialize")

  val width = 600
  val height = 398
  val min = 0
  val max = width * height * 2
  var cnt: Int = 0

  val io = dut.io.asInstanceOf[
    Bundle {
      val in_read: AXI4
      val control: AXI4Lite
      val out_write: AXI4
      val irq_dmaIn: UInt
      val irq_dmaOut: UInt
    }
  ]

  val cls = runtimeMirror(getClass.getClassLoader).reflect(this)
  val members = cls.symbol.typeSignature.members
  def bfms = members.filter(_.typeSignature <:< typeOf[ChiselBfm])

  def stepSingle(): Unit = {
    for (bfm <- bfms) {
      cls.reflectField(bfm.asTerm).get.asInstanceOf[ChiselBfm].update(cnt)
    }
    dut.clock.step(1)
  }

  def step(n: Int): Unit = {
    for (_ <- 0 until n) {
      stepSingle
    }
  }

  def waitRange(data: Bits, exp: Int, min: Int, max: Int): Unit = {
    var cnt = 0

    while (data.peek().litValue != exp && cnt < max) {
      step(1)
      cnt += 1
    }

    assert(cnt < max)
    assert(cnt >= min)
  }

  val control = new AxiLiteMasterBfm(io.control, println)
  val reader = new Axi4MemoryBfm(io.in_read, width * height, println)
  val writer = new Axi4MemoryBfm(io.out_write, width * height, println)

  val dmaInAddr = baseDMAInAddr.litValue
  val dmaOutAddr = baseDMAOutAddr.litValue
  val accAddr = baseAccAddr.litValue
  println("Confiure registers")

  reader.loadFromFile("./test-img.gray")

  // Set algorithm & pattern
  //                          bgr           pattern       algorithm
  control.writePush(accAddr, (0x0 << 0x6) | (0x0 << 0x4) | 0x1)
  // Set cols & rows
  control.writePush(accAddr + 0x4, (height << 0xd) | width)

  control.writePush(DMAConfig.Register.ReaderStartAddr + dmaInAddr, 0)
  control.writePush(DMAConfig.Register.ReaderLineLen + dmaInAddr, height * width / 4)
  control.writePush(DMAConfig.Register.ReaderLineCnt + dmaInAddr, 1)
  control.writePush(DMAConfig.Register.ReaderStride + dmaInAddr, 0)

  control.writePush(DMAConfig.Register.WriterStartAddr + dmaInAddr, 0)
  control.writePush(DMAConfig.Register.WriterLineLen + dmaInAddr, height * width / 4)
  control.writePush(DMAConfig.Register.WriterLineCnt + dmaInAddr, 1)
  control.writePush(DMAConfig.Register.WriterStride + dmaInAddr, 0)

  control.writePush(DMAConfig.Register.ReaderStartAddr + dmaOutAddr, 0)
  control.writePush(DMAConfig.Register.ReaderLineLen + dmaOutAddr, width * height)
  control.writePush(DMAConfig.Register.ReaderLineCnt + dmaOutAddr, 1)
  control.writePush(DMAConfig.Register.ReaderStride + dmaOutAddr, 0)

  control.writePush(DMAConfig.Register.WriterStartAddr + dmaOutAddr, 0)
  control.writePush(DMAConfig.Register.WriterLineLen + dmaOutAddr, width * height)
  control.writePush(DMAConfig.Register.WriterLineCnt + dmaOutAddr, 1)
  control.writePush(DMAConfig.Register.WriterStride + dmaOutAddr, 0)

  control.readPush(DMAConfig.Register.ReaderStartAddr + dmaInAddr)
  control.readPush(DMAConfig.Register.Configuration + dmaInAddr)
  
  control.readPush(DMAConfig.Register.ReaderStartAddr + dmaOutAddr)
  control.readPush(DMAConfig.Register.Configuration + dmaOutAddr)

  println("Start transfer")

  step(100)

  control.writePush(DMAConfig.Register.InterruptMask + dmaOutAddr, 3)
  control.writePush(DMAConfig.Register.Ctrl + dmaOutAddr, 0xf)

  control.writePush(DMAConfig.Register.InterruptMask + dmaInAddr, 3)
  control.writePush(DMAConfig.Register.Ctrl + dmaInAddr, 0xf)

  println("Wait for writer to be done")
  var tick_cnt = 0

  while ((io.irq_dmaOut.peek().litValue == 0) && (tick_cnt < max)) {
    step(1)
    tick_cnt += 1
  }

  if (tick_cnt >= max)
    println("Timeout!")

  assert(tick_cnt < max)
  assert(tick_cnt >= min)

  assert(io.irq_dmaIn.peek().litValue != 0)
  assert(io.irq_dmaOut.peek().litValue != 0)

  println("Save to file")

  writer.saveToFile("./out.rgba")
}
