package AIG.Bfm

import DMAController.Bus._
import chisel3._
import chiseltest._

import java.nio._

class Axi4MemoryBfm(val axi: AXI4, val size: Int, val println: String => Unit)
    extends Axi4Bfm {

  var buf: Array[Int] = new Array[Int](size)

  class Write {
    private object State extends Enumeration {
      type State = Value
      val Idle, WriteAddr, WriteData, WriteResp, HoldOneCycleMore = Value
    }

    private var state = State.Idle

    private var awaddr: BigInt = 0
    private var awlen: BigInt = 0
    private var awvalid: BigInt = 0

    private var wdata: BigInt = 0
    private var wlast: BigInt = 0
    private var wvalid: BigInt = 0

    private var bready: BigInt = 0

    private var addr: Int = 0
    private var last_addr: Int = 0
    private var len: Int = 0
    private var xferLen: Int = 0

    private def peekInputs(): Unit = {
      awaddr = axi.aw.awaddr.peek().litValue
      awlen = axi.aw.awlen.peek().litValue
      awvalid = axi.aw.awvalid.peek().litValue

      wdata = axi.w.wdata.peek().litValue
      wlast = axi.w.wlast.peek().litValue
      wvalid = axi.w.wvalid.peek().litValue

      bready = axi.b.bready.peek().litValue
    }

    def update(t: Long): Unit = {
      peekInputs
      state match {
        case State.Idle => {
          axi.aw.awready.poke(1.B)
          len = 0
          if (awvalid != 0) {
            addr = awaddr.toInt / 4
            xferLen = awlen.toInt + 1
            state = State.WriteData
          } else {
            state = State.WriteAddr
          }
        }
        case State.WriteAddr => {
          if (awvalid != 0) {
            addr = awaddr.toInt / 4
            xferLen = awlen.toInt + 1
            state = State.WriteData
          }
        }
        case State.WriteData => {
          axi.w.wready.poke(1.B)
          axi.aw.awready.poke(0.B)
          if (wvalid != 0) {
            buf(addr) = wdata.toInt
            addr += 1
            len += 1
            if (wlast != 0) {
              axi.b.bvalid.poke(1.B)
              axi.b.bresp.poke(0.U)
              state = State.WriteResp
              assert(last_addr + len == addr)
              last_addr = addr
            }
          }
        }
        case State.WriteResp => {
          axi.w.wready.poke(0.B)
          if (bready != 0) {
            state = State.HoldOneCycleMore
          }
        }
        case State.HoldOneCycleMore => { // We are running in 180 phase shift
          axi.b.bvalid.poke(0.B)
          state = State.Idle
        }
      }
    }
  }

  class Read {
    private object State extends Enumeration {
      type State = Value
      val Idle, ReadAddr, ReadData = Value
    }

    private var state = State.Idle

    private var araddr: BigInt = 0
    private var arlen: BigInt = 0
    private var arvalid: BigInt = 0

    private var rready: BigInt = 0

    private var addr: Int = 0
    private var len: Int = 0
    private var xferLen: Int = 0

    private def peekInputs(): Unit = {
      araddr = axi.ar.araddr.peek().litValue
      arlen = axi.ar.arlen.peek().litValue
      arvalid = axi.ar.arvalid.peek().litValue

      rready = axi.r.rready.peek().litValue
    }

    def update(t: Long): Unit = {
      peekInputs
      state match {
        case State.Idle => {
          axi.ar.arready.poke(1.B)
          axi.r.rlast.poke(0.B)
          axi.r.rvalid.poke(0.B)
          state = State.ReadAddr
          len = 0
        }
        case State.ReadAddr => {
          if (arvalid != 0) {
            addr = araddr.toInt / 4
            xferLen = arlen.toInt + 1
            axi.ar.arready.poke(1.B)
            state = State.ReadData
          }
        }
        case State.ReadData => {
          axi.r.rdata.poke(("x" + buf(addr).toHexString).U)
          axi.r.rvalid.poke(1.B)

          if (rready != 0) {
            addr += 1
            len += 1
            if (xferLen == len) {
              state = State.Idle
            }
          }

          if (xferLen == len) {
            axi.r.rlast.poke(1.B)
          }
        }
      }
    }
  }

  def loadFromFile(filename: String): Unit = {
    val path = file.Paths.get(filename)
    val buffer = file.Files.readAllBytes(path)
    val bb = ByteBuffer.wrap(buffer)
    buf = new Array[Int](buffer.length / 4)
    for (i <- 0 until buf.length) {
      val a = bb.get()
      val b = bb.get()
      val c = bb.get()
      val d = bb.get()
      buf(i) =
        ((d << 24) & 0xff000000) | ((c << 16) & 0xff0000) | ((b << 8) & 0xff00) | (a & 0xff)
    }
  }

  def saveToFile(filename: String): Unit = {
    val path = file.Paths.get(filename)
    val bb = ByteBuffer.allocate(4 * buf.length)
    for (i <- 0 until buf.length) {
      val d = buf(i)
      val r = ((d & 0xff0000) >> 16).asInstanceOf[Byte]
      val g = ((d & 0x00ff00) >> 8).asInstanceOf[Byte]
      val b = (d & 0xff).asInstanceOf[Byte]
      bb.put(Array[Byte](r, g, b, 0))
    }
    file.Files.write(path, bb.array())
  }

  private val writer = new Write()
  private val reader = new Read()

  def update(t: Long): Unit = {
    writer.update(t)
    reader.update(t)
  }
}
