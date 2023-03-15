package fft

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint

class FFTMultiply extends RawModule with DataConfig{
    val io = IO(new Bundle {
        val a = Input(new MyComplex())
        val b = Input(new MyComplex())
        val product = Output(new MyComplex())
    })

    val multS = (io.a.re + io.a.im) * (io.b.re + io.b.im)
    val multR = io.a.re * io.b.re
    val multI = io.a.im * io.b.im

    io.product.re := multR - multI
    io.product.im := multS - multR - multI
}
