package AIG.AIGConfig

import DMAController.DMAConfig.DMAConfig
import play.api.libs.json._
import java.io.File
import chisel3._
import AIG.CSR.{BaseRegister, StorageRegister, ClearRegister, StatusRegister}
import AIG.CSR.CustomCSRDefinition._
import math.{pow, log, max, ceil}

case class CSRField(
    name: String,
    fieldType: Either[Bool.type, UInt.type],
    size: Int
)
case class CustomCSR(
    name: String,
    csrType: Class[_ <: BaseRegister],
    address: Int,
    fields: List[CSRField]
)

object AIGConfigUtils {
  private val configFileName = System.getenv("AIG_CONFIG")
  if (!new File(configFileName).exists()) {
    throw new Exception("Missing configuration file")
  }
  private val fileContent: JsValue =
    Json.parse(scala.io.Source.fromFile(configFileName).getLines().mkString)

  val busConfigString = (fileContent \ "busConfiguration").get.as[String]
  private val AIGbuses = busConfigString.split("_")
  private val (reader, csr, writer) = (AIGbuses(0), AIGbuses(1), AIGbuses(2))

  private val dmaInConfigString = s"${reader}_${csr}_AXIS"
  private val dmaOutConfigString = s"AXIS_${csr}_${writer}"

  private val dmaRegCount = 16
  private def getDMAConfig(name: String, busConfig: String): DMAConfig = {
    val pathToParams =
      if ((fileContent \ name \ "params").isDefined)
        (fileContent \ name \ "params")
      else (fileContent \ "accelerator" \ "params")
    val addrWidth = (pathToParams \ "addrWidth").get.as[Int]
    val dataWidth = (pathToParams \ "dataWidth").get.as[Int]
    val maxBurst = (pathToParams \ "maxBurst").get.as[Int]
    val controlAddrWidth =
      (pathToParams \ "controlAddrWidth").get.as[Int]
    val controlDataWidth =
      (pathToParams \ "controlDataWidth").get.as[Int]
    val fifoDepth = (pathToParams \ "fifoDepth").get.as[Int]

    val (readMaxBurst, writeMaxBurst) = name match {
      case "dmaIn"  => (maxBurst, 0)
      case "dmaOut" => (0, maxBurst)
    }

    val (reader4KBarrier, writer4KBarrier) = name match {
      case "dmaIn"  => (true, false)
      case "dmaOut" => (false, true)
    }

    new DMAConfig(
      busConfig,
      addrWidth,
      dataWidth,
      dataWidth,
      readMaxBurst,
      writeMaxBurst,
      reader4KBarrier,
      writer4KBarrier,
      controlDataWidth,
      controlAddrWidth,
      dmaRegCount,
      fifoDepth
    )
  }

  val dmaIn = getDMAConfig("dmaIn", dmaInConfigString)
  val dmaOut = getDMAConfig("dmaOut", dmaOutConfigString)
  assert(dmaIn.controlDataWidth == dmaOut.controlDataWidth)
  val dataWidth = dmaIn.controlDataWidth
  val customCSRSize = (fileContent \ "accelerator" \ "csr")
    .asOpt[List[JsValue]]
    .getOrElse(List())
    .length * (dataWidth / 8)
  val accHasCSR = customCSRSize > 0
  val dmaCSRSize =
    dmaRegCount * (dataWidth / 8) // FastVDMA does not yet allow for customizable control data width
  val csrSizeAligned = pow(2, ceil(log(List(dmaCSRSize, customCSRSize).max)/log(2))).toInt
  val baseDMAInAddr = 0
  val baseAccAddr = baseDMAInAddr + csrSizeAligned
  val baseDMAOutAddr = baseAccAddr + csrSizeAligned
  private val aigSize = baseDMAOutAddr + csrSizeAligned - baseDMAInAddr
  val aigMaxAddrLen = aigSize.toBinaryString.length()
  println(f"DMA IN offset: 0x$baseDMAInAddr%X")
  println(f"Accelerator offset: 0x$baseAccAddr%X")
  println(f"DMA out offset: 0x$baseDMAOutAddr%X")
}
