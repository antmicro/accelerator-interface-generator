package AIG.CSR

import chisel3._
import chisel3.util.Decoupled

import AIG.CSR.CustomCSRDefinition.RegisterBase

class BaseRegister(registerDataWidth: Int) extends Module {
  val io = IO(Flipped(new CSRAccessBundle(registerDataWidth)))
  io.dataIn := 0.U
}

class StorageRegister[T <: RegisterBase](base: T, controlDataWidth: Int)
    extends BaseRegister(controlDataWidth) {
  val fields = IO(Output(base))
  val storage = RegInit(0.U(controlDataWidth.W))

  fields := storage.asTypeOf(base)

  when(io.write) {
    storage := io.dataOut
  }

  io.dataIn := storage
}

class ClearRegister[T <: RegisterBase](base: T, controlDataWidth: Int)
    extends StorageRegister(base, controlDataWidth) {
  when(io.write) {
    storage := io.dataOut
  }.otherwise(
    storage := 0.U(controlDataWidth.W)
  )
}

class StatusRegister[T <: RegisterBase](base: T, controlDataWidth: Int)
    extends BaseRegister(controlDataWidth) {
  val fields = IO(Input(base))
  io.dataIn := fields.asUInt
}
