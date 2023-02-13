package fft

import chisel3._
import chisel3.util._

class FFT3PipelineCalc extends Module with DataConfig{
    override val compileOptions = chisel3.ExplicitCompileOptions.Strict.copy(explicitInvalidate = false)
    val io = IO(new Bundle{
        val dataInSR = Input(UInt())
        val dataInSI = Input(UInt())
        val dataInTR = Input(UInt())
        val dataInTI = Input(UInt())

        val dataOutSR3c = Output(UInt())
        val dataOutSI3c = Output(UInt())
        val dataOutTR3c = Output(UInt())
        val dataOutTI3c = Output(UInt())

        val nk = Input(UInt())

        val rShiftSym = Input(Bool())
        val isFFT = Input(Bool())
        val dataMode = Input(Bool())
        val state1c = Input(Bool())
        val state2c = Input(Bool())
    })

    val dataInSRRnd = Cat(io.dataInSR(fftDataWidth + 1), io.dataInSR(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataInSR(0))
    val dataInSIRnd = Cat(io.dataInSI(fftDataWidth + 1), io.dataInSI(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataInSI(0))
    val dataInTRRnd = Cat(io.dataInTR(fftDataWidth + 1), io.dataInTR(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataInTR(0))
    val dataInTIRnd = Cat(io.dataInTI(fftDataWidth + 1), io.dataInTI(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), io.dataInTI(0))

    val dataInSR1c = Mux(io.rShiftSym, dataInSRRnd, io.dataInSR)
    val dataInSI1c = Mux(io.rShiftSym, dataInSIRnd, io.dataInSI)
    val dataInTR1c = Mux(io.rShiftSym, dataInTRRnd, io.dataInTR)
    val dataInTI1c = Mux(io.rShiftSym, dataInTIRnd, io.dataInTI)

    val nk1c = ShiftRegister(io.nk, 1, 0.U, true.B)

    val twiLutIdx1c = Cat(nk1c(addrWidth - 1 - 1, 0), 0.U(1.W))

    val twiLutCaseIdx1c = Mux(io.isFFT, 0.U(2.W), 1.U(2.W))

    val fftTwiddle = Module(new FFTTwiddle)
    fftTwiddle.io.nk := twiLutIdx1c
    fftTwiddle.io.twiLutCaseIndex := twiLutCaseIdx1c
    val wR1c = fftTwiddle.io.wR
    val wI1c = fftTwiddle.io.wI

    val sR2c = ShiftRegister(dataInSR1c, 1, 0.U, io.state1c)
    val sI2c = ShiftRegister(dataInSI1c, 1, 0.U, io.state1c)
    val tR2c = ShiftRegister(dataInTR1c, 1, 0.U, io.state1c)
    val tI2c = ShiftRegister(dataInTI1c, 1, 0.U, io.state1c)
    val wR2c = ShiftRegister(Cat(wR1c, Fill(5, 0.U)), 1, 0.U, io.state1c)
    val wI2c = ShiftRegister(Cat(wI1c, Fill(5, 0.U)), 1, 0.U, io.state1c)

    val addTRI = Cat(Fill(2, tR2c(fftDataWidth + 1)), tR2c) + Cat(Fill(2, tI2c(fftDataWidth + 1)), tI2c)
    val addWRI = Cat(wR2c(fftDataWidth + 2), wR2c) + Cat(wI2c(fftDataWidth + 2), wI2c)
    val fftMultiply = Module(new FFTMultiply)
    fftMultiply.io.a := addTRI
    fftMultiply.io.b := addWRI
    fftMultiply.io.tc := true.B
    val multS = fftMultiply.io.product

    val multRPre = Cat(Fill(fftDataWidth + 3, tR2c(fftDataWidth + 1)), tR2c) * Cat(Fill(fftDataWidth + 2, wR2c(fftDataWidth + 2)), wR2c)
    val multR = multRPre(2 * (fftDataWidth + 2), 0)

    val multIPre = Cat(Fill(fftDataWidth + 3, tI2c(fftDataWidth + 1)), tI2c) * Cat(Fill(fftDataWidth + 2, wI2c(fftDataWidth + 2)), wI2c)
    val multI = multIPre(2 * (fftDataWidth + 2), 0)

    val qR2cKernel = Cat(multR(2 * (fftDataWidth + 2)), multR(2 * (fftDataWidth + 1), (fftDataWidth + 1))) - Cat(multI(2 * (fftDataWidth + 2)), multI(2 * (fftDataWidth + 1), (fftDataWidth + 1)))
    val qI2cKernel = Cat(multS(2 * (fftDataWidth + 3) + 1), multS(2 * (fftDataWidth + 1), (fftDataWidth + 1))) - Cat(multR(2 * (fftDataWidth + 2)), multR(2 * (fftDataWidth + 1), (fftDataWidth + 1))) - Cat(multI(2 * (fftDataWidth + 2)), multI(2 * (fftDataWidth + 1), (fftDataWidth + 1)))

    val qR2cProc = Cat(tR2c(fftDataWidth + 1), tR2c)
    val qI2cProc = ~Cat(tI2c(fftDataWidth + 1), tI2c) + 1.U

    val qR2c = Mux(io.dataMode, qR2cProc, qR2cKernel)
    val qI2c = Mux(io.dataMode, qI2cProc, qI2cKernel)

    val sR3c = ShiftRegister(sR2c, 1, 0.U, io.state2c)
    val sI3c = ShiftRegister(sI2c, 1, 0.U, io.state2c)

    val qR3c = ShiftRegister(qR2c, 1, 0.U, io.state2c)
    val qI3c = ShiftRegister(qI2c, 1, 0.U, io.state2c) 

    val xR3cPre = Cat(Fill(2, sR3c(fftDataWidth + 1)), sR3c) + Cat(qR3c(fftDataWidth + 2), qR3c)
    val xI3cPre = Cat(Fill(2, sI3c(fftDataWidth + 1)), sI3c) + Cat(qI3c(fftDataWidth + 2), qI3c)

    val xR3c = Mux((xR3cPre(fftDataWidth + 3) ^ xR3cPre(fftDataWidth + 2)), Cat(xR3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, xR3cPre(fftDataWidth + 3))), Mux((xR3cPre(fftDataWidth + 3) ^ xR3cPre(fftDataWidth + 1)), Cat(xR3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, xR3cPre(fftDataWidth + 3))), xR3cPre(fftDataWidth + 1, 0)))
    val xI3c = Mux((xI3cPre(fftDataWidth + 3) ^ xI3cPre(fftDataWidth + 2)), Cat(xI3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, xI3cPre(fftDataWidth + 3))), Mux((xI3cPre(fftDataWidth + 3) ^ xI3cPre(fftDataWidth + 1)), Cat(xI3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, xI3cPre(fftDataWidth + 3))), xI3cPre(fftDataWidth + 1, 0)))

    io.dataOutSR3c := xR3c
    io.dataOutSI3c := xI3c

    val yR3cPre = Cat(Fill(2, sR3c(fftDataWidth + 1)), sR3c) - Cat(qR3c(fftDataWidth + 2), qR3c)
    val yI3cPre = Cat(Fill(2, sI3c(fftDataWidth + 1)), sI3c) - Cat(qI3c(fftDataWidth + 2), qI3c)

    val yR3c = Mux((yR3cPre(fftDataWidth + 3) ^ yR3cPre(fftDataWidth + 2)), Cat(yR3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, yR3cPre(fftDataWidth + 3))), Mux((yR3cPre(fftDataWidth + 3) ^ yR3cPre(fftDataWidth + 1)), Cat(yR3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, yR3cPre(fftDataWidth + 3))), yR3cPre(fftDataWidth + 1, 0)))
    val yI3c = Mux((yI3cPre(fftDataWidth + 3) ^ yI3cPre(fftDataWidth + 2)), Cat(yI3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, yI3cPre(fftDataWidth + 3))), Mux((yI3cPre(fftDataWidth + 3) ^ yI3cPre(fftDataWidth + 1)), Cat(yI3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, yI3cPre(fftDataWidth + 3))), yI3cPre(fftDataWidth + 1, 0)))

    io.dataOutTR3c := yR3c
    io.dataOutTI3c := yI3c
}
