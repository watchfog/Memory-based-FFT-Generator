package fft

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint
import scala.math._

class FFT3PipelineR23Calc extends Module with DataConfig{
    override val compileOptions = chisel3.ExplicitCompileOptions.Strict.copy(explicitInvalidate = false)
    val io = IO(new Bundle{
        val dataIn = Wire(Vec(pow(2, 3).toInt, new MyComplex()))

        val dataOut3c = Wire(Vec(pow(2, 3).toInt, new MyComplex()))

        val calcMode = Input(UInt(2.W)) //00 for r-2 10 for r-2^2 11 for r-2^3
        val rShiftSym = Input(Bool())
        val isFFT = Input(Bool())
        val procMode = Input(Bool())
        val state1c = Input(Bool())
        val state2c = Input(Bool())
    })

    val multiplyUnits = Seq.fill(9)(Module(new FFTMultiply))
}