package AIG

import org.scalatest.flatspec.AnyFlatSpec
import scala.reflect.runtime.universe._
import java.io.File

import chisel3._
import chiseltest._

import DMAController.Bus.{AXI4Lite}
import DMAController.Frontend.{AXI4LiteCSR}

import AIG.Bfm._
import AIG.AIGConfig.AIGConfigUtils._
import AIG.Decoder.AXI4LiteCSRDecoder

class DecoderTest(
    c: AXI4LiteCSRDecoder,
    addr: BigInt,
    expectedTargetBus: AXI4Lite
) {
  var cnt: Int = 0
  val max_steps = 3
  val min_steps = 0

  val cls = runtimeMirror(getClass.getClassLoader).reflect(this)
  val members = cls.symbol.typeSignature.members
  def bfms = members.filter(_.typeSignature <:< typeOf[ChiselBfm])

  def waitRange(data: Bits, exp: BigInt, min: Int, max: Int): Unit = {
    var cnt = 0

    while (data.peek().litValue != exp && cnt < max) {
      step(1)
      cnt += 1
    }

    assert(cnt < max)
    assert(cnt >= min)
  }

  def stepSingle(): Unit = {
    for (bfm <- bfms) {
      cls.reflectField(bfm.asTerm).get.asInstanceOf[ChiselBfm].update(cnt)
    }
    c.clock.step(1)
  }

  def step(n: Int): Unit = {
    for (_ <- 0 until n) {
      stepSingle
    }
  }

  val main_axil = new AxiLiteMasterBfm(c.io.control, println)

  // Intializing write at the AXI4LiteCSR that provides interface
  // between the AIGDecoder and the outside of the AIG system
  // (usually connected to the system bus)
  main_axil.writePush(addr, 0xbeef)

  // After requesting write a at the main AXI4LiteCSR, the write
  // should be forwarded to one of the CSR buses (FastVDMAs'
  // or Accelerator's) based on the address of the request.
  // This will be confirmed via transaction appearing on the `aw`
  // channel of the associated bus.
  waitRange(expectedTargetBus.aw.awaddr, addr, min_steps, max_steps)
}

class DecoderSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "DecoderSpec"
  val addrWidth = 32
  val dmaInAddr = baseDMAInAddr.litValue
  val dmaOutAddr = baseDMAOutAddr.litValue
  val accAddr = baseAccAddr.litValue

  val componentNames =
    List("DMAIn CSR Bus", "DMAOut CSR Bus", "Accelerator CSR Bus")
  val baseAddresses = List(dmaInAddr, dmaOutAddr, accAddr)
  val addrRanges =
    baseAddresses.map(addr => (addr until addr + customCSRSize by addrWidth / 4))

  for ((name, range) <- (componentNames zip addrRanges))
    for (addr <- range)
      it should s"initiate transfers for $name at address ${f"$addr%X"}" in
        test(new AXI4LiteCSRDecoder(addrWidth, dataWidth)).withAnnotations(
          Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)
        )(c =>
          name match {
            case x if x contains "DMAIn" =>
              new DecoderTest(c, addr, c.io.controlIn)
            case x if x contains "DMAOut" =>
              new DecoderTest(c, addr, c.io.controlOut)
            case x if x contains "Accelerator" =>
              c.io.controlAcc match {
                case Some(csrBus) => new DecoderTest(c, addr, csrBus)
                case None =>
                  println("No custom CSR specified. Skipping Accelerator case.")
              }
          }
        )
}
