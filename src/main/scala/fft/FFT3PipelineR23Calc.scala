package fft

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint
import scala.math._

class FFT3PipelineR23Calc extends Module with DataConfig{
    override val compileOptions = chisel3.ExplicitCompileOptions.Strict.copy(explicitInvalidate = false)
    val io = IO(new Bundle{
        val dataIn = Input(Vec(pow(2, 3).toInt, new MyComplex()))

        val dataOut3c = Output(Vec(pow(2, 3).toInt, new MyComplex()))

        val twiLutIdx = Input(UInt((addrWidth - 3).W))

        val calcMode = Input(UInt(2.W)) //b00 for r-2 b10 for r-2^2 b11 for r-2^3
        val rShiftSym = Input(Bool())
        val isFFT = Input(Bool())
        val procMode = Input(Bool())
        val state1c = Input(Bool())
        val state2c = Input(Bool())
    })

    def getBitsReverse(n: Int): Int = n match{
        case 0 => 0
        case 1 => 4
        case 2 => 2
        case 3 => 6
        case 4 => 1
        case 5 => 5
        case 6 => 3
        case 7 => 7
        case _ => 0
    }

    val multiplyUnits = Seq.fill(9)(Module(new FFTMultiply))
    val twiddleUnits = Seq.fill(9)(Module(new FFTTwiddle))

    val dataInRnd = Wire(Vec(pow(2, 3).toInt, new MyComplex()))
    for(i <- 0 until 8 by 1) {
        dataInRnd(i).re := (Cat(io.dataIn(i).re(fftDataWidth + 1), io.dataIn(i).re(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataIn(i).re(0))).asFixedPoint((fftDataWidth + 1).BP)
        dataInRnd(i).im := (Cat(io.dataIn(i).im(fftDataWidth + 1), io.dataIn(i).im(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataIn(i).im(0))).asFixedPoint((fftDataWidth + 1).BP)
    }

    val dataIn1c = Wire(Vec(pow(2, 3).toInt, new MyComplex()))
    for(i <- 0 until 8 by 1) {
        dataIn1c(i) := Mux(io.rShiftSym, dataInRnd(i), io.dataIn(i))
    }

    val twiLutCaseIdx1c = Mux(io.isFFT, 0.U(2.W), 1.U(2.W))
    val wR1c = Wire(Vec(9, FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP)))
    val wI1c = Wire(Vec(9, FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP)))
    val wR2c = Wire(Vec(9, FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP)))
    val wI2c = Wire(Vec(9, FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP)))
    val wR3c = Wire(Vec(9, FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP)))
    val wI3c = Wire(Vec(9, FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP)))

    val data2cPrePre = Wire(Vec(pow(2, 3).toInt, new MyComplex()))
    val data2cPre = Wire(Vec(pow(2, 3).toInt, new MyComplex()))
    val data2c = Wire(Vec(pow(2, 3).toInt, new MyComplex()))
    val data3cPrePre = Wire(Vec(pow(2, 3).toInt, new MyComplex()))
    val data3cPre = Wire(Vec(pow(2, 3).toInt, new MyComplex()))
    val data3c = Wire(Vec(pow(2, 3).toInt, new MyComplex()))
    val dataOut3cPrePre = Wire(Vec(pow(2, 3).toInt, new MyComplex()))
    val dataOut3cPre = Wire(Vec(pow(2, 3).toInt, new MyComplex()))

    Seq.tabulate(7) { i =>
        twiddleUnits(i).io.nk := ((i + 1).U(3.W) * io.twiLutIdx) << 1
        twiddleUnits(i).io.twiLutCaseIndex := twiLutCaseIdx1c
        wR1c(i) := twiddleUnits(i).io.wR
        wI1c(i) := twiddleUnits(i).io.wI
    }

    twiddleUnits(7).io.nk := 1.U << (addrWidth - 3 + 1) // for preproc need to shift 1 more bits w18
    twiddleUnits(7).io.twiLutCaseIndex := twiLutCaseIdx1c
    wR1c(7) := twiddleUnits(7).io.wR
    wI1c(7) := twiddleUnits(7).io.wI

    twiddleUnits(8).io.nk := 3.U << (addrWidth - 3 + 1) //w38
    twiddleUnits(8).io.twiLutCaseIndex := twiLutCaseIdx1c
    wR1c(8) := twiddleUnits(8).io.wR
    wI1c(8) := twiddleUnits(8).io.wI

    wR2c.zip(wR1c).foreach { case(d1, d2) =>
        d1 := ShiftRegister(d2, 1, FixedPoint(0, (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP), io.state1c)
    }

    wI2c.zip(wI1c).foreach { case(d1, d2) =>
        d1 := ShiftRegister(d2, 1, FixedPoint(0, (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP), io.state1c)
    }

    wR3c.zip(wR2c).foreach { case(d1, d2) =>
        d1 := ShiftRegister(d2, 1, FixedPoint(0, (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP), io.state1c)
    }

    wI3c.zip(wI2c).foreach { case(d1, d2) =>
        d1 := ShiftRegister(d2, 1, FixedPoint(0, (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP), io.state1c)
    }

    Seq.range(1, 8).foreach { i =>
        multiplyUnits(i - 1).io.data := dataOut3cPrePre(i)
        multiplyUnits(i - 1).io.wR := wR3c(getBitsReverse(i) - 1)
        multiplyUnits(i - 1).io.wI := wI3c(getBitsReverse(i) - 1)
    }

    multiplyUnits(7).io.data := data3cPrePre(5)
    multiplyUnits(7).io.wR := wR2c(7)
    multiplyUnits(7).io.wI := wI2c(7)

    multiplyUnits(8).io.data := data3cPrePre(7)
    multiplyUnits(8).io.wR := wR2c(8)
    multiplyUnits(8).io.wI := wI2c(8)

    data2c.zip(data2cPre).foreach { case(d1, d2) =>
        d1.re := ShiftRegister(d2.re, 1, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), io.state1c)
        d1.im := ShiftRegister(d2.im, 1, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), io.state1c)
    }

    data3c.zip(data3cPre).foreach { case(d1, d2) =>
        d1.re := ShiftRegister(d2.re, 1, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), io.state1c)
        d1.im := ShiftRegister(d2.im, 1, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), io.state1c)
    }

    Seq.tabulate(8) { i =>
        io.dataOut3c(i) := dataOut3cPre(i)
    }

    //butterfly 0
    Seq.tabulate(4) { i =>
        data2cPrePre(i).re := dataIn1c(i).re + dataIn1c(i + 4).re
        data2cPrePre(i).im := dataIn1c(i).im + dataIn1c(i + 4).im
        data2cPrePre(i + 4).re := dataIn1c(i).re - dataIn1c(i + 4).re
        data2cPrePre(i + 4).im := dataIn1c(i).im - dataIn1c(i + 4).im
    }

    //butterfly 1
    Seq(0, 1, 4, 5).foreach{ i =>
        data3cPrePre(i).re := data2c(i).re + data2c(i + 2).re
        data3cPrePre(i).im := data2c(i).im + data2c(i + 2).im
        data3cPrePre(i + 2).re := data2c(i).re - data2c(i + 2).re
        data3cPrePre(i + 2).im := data2c(i).im - data2c(i + 2).im
    }

    //butterfly 2
    Seq(0, 2, 4, 6).foreach { i =>
        dataOut3cPrePre(i).re := data3c(i).re + data3c(i + 1).re
        dataOut3cPrePre(i).im := data3c(i).im + data3c(i + 1).im
        dataOut3cPrePre(i + 1).re := data3c(i).re - data3c(i + 1).re
        dataOut3cPrePre(i + 1).im := data3c(i).im - data3c(i + 1).im
    }

    when(io.calcMode === 3.U) {
        //stage 0
        Seq(0, 1, 2, 3, 4, 5).foreach { i =>
            data2cPre(i) := data2cPrePre(i)
        }
        
        data2cPre(6).re := data2cPrePre(6).im
        data2cPre(6).im := -data2cPrePre(6).re

        data2cPre(7).re := data2cPrePre(7).im
        data2cPre(7).im := -data2cPrePre(7).re

        //stage 1
        Seq(0, 1, 2, 4, 6).foreach { i =>
            data3cPre(i) := data3cPrePre(i)
        }

        data3cPre(3).re := data3cPrePre(3).im
        data3cPre(3).im := -data3cPrePre(3).re

        data3cPre(5) := multiplyUnits(7).io.product

        data3cPre(7) := multiplyUnits(8).io.product

        //stage 2
        dataOut3cPre(0) := dataOut3cPrePre(0)

        Seq.range(1, 8).foreach { i =>
            dataOut3cPre(i) := multiplyUnits(i - 1).io.product
        }
    } .elsewhen(io.calcMode === 2.U) {
        //stage 0
        //skip butterfly 0
        Seq.tabulate(8) { i =>
            data2cPre(i) := dataIn1c(i)
        }

        //stage 1
        Seq(0, 1, 2, 4, 5, 6).foreach { i =>
            data3cPre(i) := data3cPrePre(i)
        }

        data3cPre(3).re := data3cPrePre(3).im
        data3cPre(3).im := -data3cPrePre(3).re

        data3cPre(7).re := data3cPrePre(7).im
        data3cPre(7).im := -data3cPrePre(7).re

        //stage 2
        Seq.tabulate(8) { i =>
            dataOut3cPre(i) := dataOut3cPrePre(i)
        }
    } .otherwise {
        //stage 0
        //skip butterfly 0
        Seq.tabulate(8) { i =>
            data2cPre(i) := dataIn1c(i)
        }

        //stage 1
        //skip butterfly 1
        Seq(0, 1, 2, 4, 5, 6).foreach { i =>
            data3cPre(i) := data3cPrePre(i)
        }

        data3cPre(3).re := data3cPrePre(3).im
        data3cPre(3).im := -data3cPrePre(3).re

        data3cPre(7).re := data3cPrePre(7).im
        data3cPre(7).im := -data3cPrePre(7).re

        //stage 2
        Seq.tabulate(8) { i =>
            dataOut3cPre(i) := dataOut3cPrePre(i)
        }
    }

}