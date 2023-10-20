package AIG.AIGConfig

import DMAController.DMAConfig.DMAConfig
import play.api.libs.json._
import java.io.File
import chisel3._
import AIG.CSR.{BaseRegister, StorageRegister, ClearRegister, StatusRegister}
import AIG.CSR.CustomCSRDefinition._

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
  private val configFileName = System.getenv("CONFIG_FILE")
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
      16,
      fifoDepth
    )
  }

  val dmaIn = getDMAConfig("dmaIn", dmaInConfigString)
  val dmaOut = getDMAConfig("dmaOut", dmaOutConfigString)
  assert(dmaIn.controlDataWidth == dmaOut.controlDataWidth)
  private val baseAccAddrStr =
    (fileContent \ "accelerator" \ "baseAddress").get.as[String].substring(2)
  private val baseDMAInAddrStr =
    (fileContent \ "dmaIn" \ "baseAddress").get.as[String].substring(2)
  private val baseDMAOutAddrStr =
    (fileContent \ "dmaOut" \ "baseAddress").get.as[String].substring(2)
  val baseAccAddr = s"h$baseAccAddrStr".U(32.W)
  val baseDMAInAddr = s"h$baseDMAInAddrStr".U(32.W)
  val baseDMAOutAddr = s"h$baseDMAOutAddrStr".U(32.W)
  val dataWidth = dmaIn.controlDataWidth
  val csrSize = (fileContent \ "accelerator" \ "csr").get
    .as[List[JsValue]]
    .length * dataWidth
}
