package fft

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint

class FFT3PipelineCalc extends Module with DataConfig{
    override val compileOptions = chisel3.ExplicitCompileOptions.Strict.copy(explicitInvalidate = false)
    val io = IO(new Bundle{
        val dataInSR = Input(FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP))
        val dataInSI = Input(FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP))
        val dataInTR = Input(FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP))
        val dataInTI = Input(FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP))

        val dataOutSR3c = Output(FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP))
        val dataOutSI3c = Output(FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP))
        val dataOutTR3c = Output(FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP))
        val dataOutTI3c = Output(FixedPoint((fftDataWidth + 2).W, (fftDataWidth + 1).BP))

        val nk = Input(UInt())

        val rShiftSym = Input(Bool())
        val isFFT = Input(Bool())
        val procMode = Input(Bool())
        val state1c = Input(Bool())
        val state2c = Input(Bool())
    })

    val dataInSRRnd = Cat(io.dataInSR(fftDataWidth + 1), io.dataInSR(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataInSR(0))
    val dataInSIRnd = Cat(io.dataInSI(fftDataWidth + 1), io.dataInSI(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataInSI(0))
    val dataInTRRnd = Cat(io.dataInTR(fftDataWidth + 1), io.dataInTR(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataInTR(0))
    val dataInTIRnd = Cat(io.dataInTI(fftDataWidth + 1), io.dataInTI(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataInTI(0))

    val dataInSR1c = Mux(io.rShiftSym, dataInSRRnd.asFixedPoint((fftDataWidth + 1).BP), io.dataInSR)
    val dataInSI1c = Mux(io.rShiftSym, dataInSIRnd.asFixedPoint((fftDataWidth + 1).BP), io.dataInSI)
    val dataInTR1c = Mux(io.rShiftSym, dataInTRRnd.asFixedPoint((fftDataWidth + 1).BP), io.dataInTR)
    val dataInTI1c = Mux(io.rShiftSym, dataInTIRnd.asFixedPoint((fftDataWidth + 1).BP), io.dataInTI)

    val nk1c = ShiftRegister(io.nk, 1, 0.U, true.B)

    val twiLutIdx1c = nk1c

    val twiLutCaseIdx1c = Mux(io.isFFT, 0.U(2.W), 1.U(2.W))

    val fftTwiddle = Module(new FFTTwiddle)
    fftTwiddle.io.nk := twiLutIdx1c
    fftTwiddle.io.twiLutCaseIndex := twiLutCaseIdx1c
    val wR1c = fftTwiddle.io.wR
    val wI1c = fftTwiddle.io.wI

    val sR2c = ShiftRegister(dataInSR1c, 1, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), io.state1c)
    val sI2c = ShiftRegister(dataInSI1c, 1, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), io.state1c)
    val tR2c = ShiftRegister(dataInTR1c, 1, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), io.state1c)
    val tI2c = ShiftRegister(dataInTI1c, 1, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), io.state1c)
    val wR2c = ShiftRegister(wR1c, 1, FixedPoint(0, (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP), io.state1c)
    val wI2c = ShiftRegister(wI1c, 1, FixedPoint(0, (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP), io.state1c)

    val addTRI = tR2c + tI2c
    val addWRI = wR2c + wI2c
    val multS = addTRI * addWRI

    val multRPre = tR2c * wR2c
    val multR = multRPre

    val multIPre = tI2c * wI2c
    val multI = multIPre

    val qR2cKernel = multR - multI
    val qI2cKernel = multS - multR - multI

    val qR2cProc = tR2c
    val qI2cProc = -tI2c

    val qR2c = Mux(io.procMode, qR2cProc, qR2cKernel)
    val qI2c = Mux(io.procMode, qI2cProc, qI2cKernel)

    val sR3c = ShiftRegister(sR2c, 1, FixedPoint(0, sR2c.getWidth.W, (fftDataWidth + 1).BP), io.state2c)
    val sI3c = ShiftRegister(sI2c, 1, FixedPoint(0, sI2c.getWidth.W, (fftDataWidth + 1).BP), io.state2c)

    val qR3c = ShiftRegister(qR2c, 1, FixedPoint(0, qR2c.getWidth.W, (fftDataWidth + 1).BP), io.state2c)
    val qI3c = ShiftRegister(qI2c, 1, FixedPoint(0, qI2c.getWidth.W, (fftDataWidth + 1).BP), io.state2c) 

    val xR3cPrePre = sR3c + qR3c
    val xI3cPrePre = sI3c + qI3c

    val xR3cPre = Mux((sR3c(sR3c.getWidth - 1) === qR3c(qR3c.getWidth - 1)) && (sR3c(sR3c.getWidth - 1) =/= xR3cPrePre(xR3cPrePre.getWidth - 1)), Cat(xR3cPrePre(xR3cPrePre.getWidth - 1), ~Fill(fftDataWidth + 1, xR3cPrePre(xR3cPrePre.getWidth - 1))).asFixedPoint((fftDataWidth + 1).BP), xR3cPrePre)
    val xI3cPre = Mux((sI3c(sI3c.getWidth - 1) === qI3c(qI3c.getWidth - 1)) && (sI3c(sI3c.getWidth - 1) =/= xI3cPrePre(xI3cPrePre.getWidth - 1)), Cat(xI3cPrePre(xI3cPrePre.getWidth - 1), ~Fill(fftDataWidth + 1, xI3cPrePre(xI3cPrePre.getWidth - 1))).asFixedPoint((fftDataWidth + 1).BP), xI3cPrePre)

    io.dataOutSR3c := xR3cPre(fftDataWidth + 1, 0).asFixedPoint((fftDataWidth + 1).BP)
    io.dataOutSI3c := xI3cPre(fftDataWidth + 1, 0).asFixedPoint((fftDataWidth + 1).BP)

    val yR3cPrePre = sR3c - qR3c
    val yI3cPrePre = sI3c - qI3c

    val yR3cPre = Mux((sR3c(sR3c.getWidth - 1) =/= qR3c(qR3c.getWidth - 1)) && (sR3c(sR3c.getWidth - 1) =/= yR3cPrePre(yR3cPrePre.getWidth - 1)), Cat(yR3cPrePre(yR3cPrePre.getWidth - 1), ~Fill(fftDataWidth + 1, yR3cPrePre(yR3cPrePre.getWidth - 1))).asFixedPoint((fftDataWidth + 1).BP), yR3cPrePre)
    val yI3cPre = Mux((sI3c(sI3c.getWidth - 1) =/= qI3c(qI3c.getWidth - 1)) && (sI3c(sI3c.getWidth - 1) =/= yI3cPrePre(yI3cPrePre.getWidth - 1)), Cat(yI3cPrePre(yI3cPrePre.getWidth - 1), ~Fill(fftDataWidth + 1, yI3cPrePre(yI3cPrePre.getWidth - 1))).asFixedPoint((fftDataWidth + 1).BP), yI3cPrePre)

    io.dataOutTR3c := yR3cPre(fftDataWidth + 1, 0).asFixedPoint((fftDataWidth + 1).BP)
    io.dataOutTI3c := yI3cPre(fftDataWidth + 1, 0).asFixedPoint((fftDataWidth + 1).BP)
}
