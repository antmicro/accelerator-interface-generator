/*
MIT License

Copyright (c) 2018 Jan Marjanovic
Copyright (c) 2019 Antmicro

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
package AIG.Bfm

import DMAController.Bus._
import chisel3._
import chiseltest._

import scala.collection.mutable.ListBuffer

/**
  * Bus functional model for AXI Lite master
  *
  * Instantiation:
  *   provide connection to axi interface (`axi`) and utilities from Chisel
  *   PeekPoke tester
  *
  * Usage (read):
  *   call `readPush` with the desired address, then poll `getResponse`
  *   until you get the response with the data. Multiple commands can
  *   be "chained" one after another, just by calling `readPush` multiple
  *   times.
  *
  * Usage (write):
  *   call `writePush` with the desired address and data, then poll
  *   `getREsponse` until you get the response (with status code). As
  *   with reads commands, miltiple commands can be "chained" together
  *   just by callin `writePush` multiple times.
  *
  * Note:
  *   if both read and write commands are in the queue one after another,
  *   both actions will be performed in parallel.
  */
class AxiLiteMasterBfm(val axi: AXI4Lite,
                       val println: String => Unit)
    extends AxiLiteBfm {

  //==========================================================================
  // read interface
  class ReadIf {
    private var currCmd: Cmd = new Cmd(false, 0, 0)

    private object State extends Enumeration {
      type State = Value
      val Idle, ReadAddr, ReadData = Value
    }
    private var state = State.Idle

    private var ar_ready: BigInt = 0
    private var ar_valid: BigInt = 0
    private var r_data: BigInt = 0
    private var r_resp: BigInt = 0
    private var r_ready: BigInt = 0
    private var r_valid: BigInt = 0

    private def peekInputs(): Unit = {
      ar_ready = axi.ar.arready.peek().litValue
      ar_valid = axi.ar.arvalid.peek().litValue
      r_data = axi.r.rdata.peek().litValue
      r_resp = axi.r.rresp.peek().litValue
      r_ready = axi.r.rready.peek().litValue
      r_valid = axi.r.rvalid.peek().litValue
    }

    private def printWithBg(s: String): Unit = {
      // black on cyan
      println("\u001b[30;46m" + s + "\u001b[39;49m")
    }

    def update(t: Long): Unit = {
      state match {
        case State.Idle => {
          if (cmdList.nonEmpty && cmdList(0).is_read) {
            currCmd = cmdList.remove(0)
            printWithBg(f"${t}%5d AxiLiteMasterBfm: read: leaving idle")
            state = State.ReadAddr
          }
        }
        case State.ReadAddr => {
          axi.ar.arvalid.poke(1.B)
          axi.ar.araddr.poke(currCmd.addr.U)
          if (ar_ready != 0 && ar_valid != 0) {
            axi.ar.arvalid.poke(0.B)
            state = State.ReadData
          }
        }
        case State.ReadData => {
          axi.r.rready.poke(1.B)
          if (r_ready != 0 && r_valid != 0) {
            axi.r.rready.poke(0.B)
            printWithBg(f"${t}%5d AxiLiteMasterBfm: read: from addr 0x${currCmd.addr}%x data 0x${r_data}%08x")
            respList += new Resp(r_resp == 0, r_data)
            state = State.Idle
          }
        }
      }

      peekInputs
    }
  }

  //==========================================================================
  // write interface
  class WriteIf {
    private var currCmd: Cmd = new Cmd(false, 0, 0)

    private object State extends Enumeration {
      type State = Value
      val Idle, WriteAddr, WriteData, WriteWaitResp = Value
    }
    private var state = State.Idle

    private var aw_ready: BigInt = 0
    private var aw_valid: BigInt = 0
    private var w_ready: BigInt = 0
    private var w_valid: BigInt = 0
    private var b_resp: BigInt = 0
    private var b_valid: BigInt = 0
    private var b_ready: BigInt = 0

    private def peekInputs(): Unit = {
      aw_ready = axi.aw.awready.peek().litValue
      aw_valid = axi.aw.awvalid.peek().litValue
      w_ready = axi.w.wready.peek().litValue
      w_valid = axi.w.wvalid.peek().litValue
      b_resp = axi.b.bresp.peek().litValue
      b_ready = axi.b.bready.peek().litValue
      b_valid = axi.b.bvalid.peek().litValue
    }

    private def printWithBg(s: String): Unit = {
      // black on magenta
      println("\u001b[30;45m" + s + "\u001b[39;49m")
    }

    def update(t: Long): Unit = {
      state match {
        case State.Idle => {
          if (cmdList.nonEmpty && !cmdList(0).is_read) {
            currCmd = cmdList.remove(0)
            printWithBg(f"${t}%5d AxiLiteMasterBfm: write: leaving idle")
            state = State.WriteAddr
          }
        }
        case State.WriteAddr => {
          axi.aw.awvalid.poke(1.B)
          axi.aw.awaddr.poke(currCmd.addr.U)
          if (aw_ready != 0 && aw_valid != 0) {
            axi.aw.awvalid.poke(0.B)
            state = State.WriteData
          }
        }
        case State.WriteData => {
          axi.w.wvalid.poke(1.B)
          axi.w.wdata.poke(currCmd.wr_data.U)
          if (w_ready != 0 && w_valid != 0) {
            axi.w.wvalid.poke(0.B)
            state = State.WriteWaitResp
          }
        }
        case State.WriteWaitResp => {
          axi.b.bready.poke(1.B)
          if (b_ready != 0 && b_valid != 0) {
            val resp_str = if (b_resp == 0) { "OK" } else { "ERR" }
            printWithBg(f"${t}%5d AxiLiteMasterBfm: write: to addr 0x${currCmd.addr}%x resp ${resp_str}")
            axi.b.bready.poke(0.B)
            respList += new Resp(b_resp == 0, 0)
            state = State.Idle
          }
        }
      }

      peekInputs
    }
  }

  //==========================================================================
  // queues
  class Cmd(val is_read: Boolean, val addr: BigInt, val wr_data: BigInt)
  class Resp(val success: Boolean, val rd_data: BigInt)
  private var cmdList: ListBuffer[Cmd] = new ListBuffer()
  private var respList: ListBuffer[Resp] = new ListBuffer()

  // interfaces
  private val read_if = new ReadIf()
  private val write_if = new WriteIf()

  //==========================================================================
  // public functions

  /** return response if there is any */
  def getResponse(): Option[Resp] = {
    if (respList.isEmpty) {
      None
    } else {
      Some(respList.remove(0))
    }
  }

  /** push new read command into the command queue */
  def readPush(addr: BigInt): Unit = {
    cmdList += new Cmd(true, addr, 0)
  }

  /** push new write command into the command queue */
  def writePush(addr: BigInt, data: BigInt): Unit = {
    cmdList += new Cmd(false, addr, data)
  }

  /** part of ChiselBFM, should be called every clock cycle */
  def update(t: Long): Unit = {
    read_if.update(t)
    write_if.update(t)
  }
}
