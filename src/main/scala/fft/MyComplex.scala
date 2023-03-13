package fft

import chisel3._
import chisel3.experimental._

class MyComplex extends Bundle with DataConfig{
    val im = FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP)
    val re = FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP)
}
