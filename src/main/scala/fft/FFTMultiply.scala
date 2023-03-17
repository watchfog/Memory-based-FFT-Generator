package fft

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint

class FFTMultiply extends RawModule with DataConfig{
    val io = IO(new Bundle {
        val data = Input(new MyComplex())
        val wR = Input(FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP))
        val wI = Input(FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP))
        val product = Output(new MyComplex())
    })

    val multS = (io.data.re + io.data.im) * (io.wR + io.wI)
    val multR = io.data.re * io.wR
    val multI = io.data.im * io.wI

    io.product.re := multR - multI
    io.product.im := multS - multR - multI
}
