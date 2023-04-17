package fft

import chisel3._
import scala.math._

class FFTSram extends Module with DataConfig {
  val width: Int = 2 * (fftDataWidth + 2)
  val io = IO(new Bundle {
    val readEnable = Input(Bool())
    val writeEnable = Input(Bool())
    val addr = Input(UInt((addrWidth - parallelCnt).W))
    val dataIn = Input(UInt(width.W))
    val dataOut = Output(UInt(width.W))
  })

  val mem = SyncReadMem(pow(2, addrWidth - parallelCnt).toInt, UInt(width.W))
  io.dataOut := DontCare
  when(io.readEnable) {
    val rdwrPort = mem(io.addr)
    when (io.writeEnable) { rdwrPort := io.dataIn }
      .otherwise    { io.dataOut := rdwrPort }
  }
}
