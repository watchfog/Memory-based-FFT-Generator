package fft

import chisel3._
import chisel3.util._

class FFTMultiply extends RawModule with DataConfig{
    val io = IO(new Bundle {
        val a = Input(UInt((fftDataWidth + 4).W))
        val b = Input(UInt((fftDataWidth + 4).W))
        val tc = Input(Bool())
        val product = Output(UInt((2*(fftDataWidth + 4)).W))
    })
    
    val temp_a = Mux(io.a(fftDataWidth + 4 - 1), (~io.a + 1.U), io.a)
    val temp_b = Mux(io.b(fftDataWidth + 4 - 1), (~io.b + 1.U), io.b)

    val long_temp1 = temp_a * temp_b
    val long_temp2 = ~(long_temp1 - 1.U)

    io.product := Mux((((io.a ^ io.a).xorR =/= false.B) || ((io.b ^ io.b).xorR =/= false.B) || ((io.tc ^ io.tc).xorR =/= false.B)), Fill(2 * (fftDataWidth + 4), 1.U(1.W)), Mux(io.tc, Mux(((io.a(fftDataWidth + 4 - 1) ^ io.b(fftDataWidth + 4 - 1)) && (long_temp1.orR)), Cat(1.U(1.W), long_temp2), Cat(0.U(1.W), long_temp1)), io.a * io.b))
}
