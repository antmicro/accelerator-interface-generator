package AIG.CSR

import chisel3._
import chisel3.util.log2Ceil

class CSRAccessBundle(val controlDataWidth: Int) extends Bundle{
    val read = Output(Bool())
    val dataOut = Output(UInt(controlDataWidth.W))
    val write = Output(Bool())
    val dataIn = Input(UInt(controlDataWidth.W))
}

class CSRBusBundle(val controlDataWidth: Int, val controlRegisterCnt: Int) extends Bundle{
    val ready = Input(Bool())
    val addr = Output(UInt((if (controlRegisterCnt > 0) log2Ceil(controlRegisterCnt) else 1).W))
    val reg = new CSRAccessBundle(controlDataWidth)

    def read: Bool = ready && reg.read
    def readAddr(tgtAddr: UInt) : Bool =  (addr === tgtAddr) && read
    def write: Bool = ready && reg.write
}
