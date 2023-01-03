package fft

import chisel3._
import chisel3.util._
import scala.math._

class FFTEngine extends Module with DataConfig{
    val io = IO(new Bundle{
        val readDataSram0Bank = Input(Vec(pow(2, parallelCnt).toInt, UInt((2 * (fftDataWidth + 2)).W)))
        val readDataSram1Bank = Input(Vec(pow(2, parallelCnt).toInt, UInt((2 * (fftDataWidth + 2)).W)))

        val readEnableSram0Bank = Output(Vec(pow(2, parallelCnt).toInt, Bool()))
        val readEnableSram1Bank = Output(Vec(pow(2, parallelCnt).toInt, Bool()))

        val writeDataSram0Bank = Output(Vec(pow(2, parallelCnt).toInt, UInt((2 * (fftDataWidth + 2)).W)))
        val writeDataSram1Bank = Output(Vec(pow(2, parallelCnt).toInt, UInt((2 * (fftDataWidth + 2)).W)))

        val writeEnableSram0Bank = Output(Vec(pow(2, parallelCnt).toInt, Bool()))
        val writeEnableSram1Bank = Output(Vec(pow(2, parallelCnt).toInt, Bool()))

        val addrSram0Bank = Output(Vec(pow(2, parallelCnt).toInt, UInt((addrWidth - parallelCnt).W)))
        val addrSram1Bank = Output(Vec(pow(2, parallelCnt).toInt, UInt((addrWidth - parallelCnt).W)))    
        
        val fftDone = Output(Bool())
        val fftEnable = Input(Bool())
        val fftEngineKick = Input(Bool())
        val fftMode = Input(Bool())

        val fftRShiftP0 = Input(Vec(stageCnt + 1, Bool()))
        val fftRShiftP1 = Input(Vec(2, Bool()))
    })

    val FFTCycleVal = (fftLength / pow(2, parallelCnt).toInt - 1).U
    val FFTLatency = 3.U
    val FFTPhaseVal = stageCnt.U

    val waitKick :: kernelPP :: kernelPPL :: kernelPPGap :: fftDone :: Nil = Enum(5)

    val isFFT = !io.fftMode

    val stateReg = RegInit(waitKick)

    val radixCount = RegInit(0.U((log2Ceil(fftLength) - parallelCnt).W))

    val phaseCount = RegInit(0.U(log2Ceil(stageCnt).W))

    switch(stateReg) {
        is(waitKick) {
            when(io.fftEngineKick) {
                stateReg := kernelPP
            } .otherwise(io.fftEngineKick) {
                stateReg := stateReg
            }
        }
        is(kernelPP) {
            when(radixCount === FFTCycleVal) {
                stateReg := kernelPPL
            } .otherwise{
                stateReg := stateReg
            }
        }
        is(kernelPPL) {
            when(radixCount === FFTLatency) {
                stateReg := kernelPPGap
            } .otherwise{
                stateReg := stateReg
            }
        }
        is(kernelPPGap) {
            when(phaseCount === FFTPhaseVal) {
                stateReg := fftDone
            } .otherwise{
                stateReg := stateReg
            }
        }
        is(fftDone) {
            stateReg := waitKick
        }
    }

    val radixInit = (stateReg === waitKick) |
    ((stateReg === kernelPP) && (radixCount === FFTCycleVal)) |
    ((stateReg === kernelPPL) && (radixCount === FFTLatency)) |
    (stateReg === kernelPPGap) |
    (stateReg === fftDone)

    val radixUp = (stateReg === kernelPP) | (stateReg == kernelPPL)

    when(radixInit) {
        radixCount := 0.U
    } .elsewhen(radixUp) {
        radixCount := radixCount + 1.U
    } .otherwise {
        radixCount := radixCount
    }

    val phaseInit = (stateReg === waitKick) |
    ((stateReg === kernelPPGap) & (phaseCount === FFTPhaseVal)) |
    (stateReg === fftDone)

    val phaseUp = (stateReg === kernelPPGap)

    when(phaseInit) {
        phaseCount := 0.U
    } .elsewhen(phaseUp) {
        phaseCount := phaseCount + 1.U
    } .otherwise {
        phaseCount := phaseCount
    }

    val srcBuffer = RegInit(false.B)

    val srcBufferNext = (stateReg === kernelPPGap) & !srcBuffer

    val srcUp = (stateReg === waitKick) | (stateReg === kernelPPGap)

    when(srcUp) {
        srcBuffer := srcBufferNext
    } .otherwise {
        srcBuffer := srcBuffer
    }

    val kernelState = (stateReg === kernelPP)

    val readEnable = kernelState

    val radixCountTemp = radixCount(radixCount.getWidth - 1 - 1, 0)

    def cyclicShiftL(data: UInt, n: UInt): UInt ={
        val dataTemp = Cat(data, data) << n
        dataTemp(2 * data.getWidth - 1, data.getWidth)
    }

    val addrSPre = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTPre = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    if (parallelCnt == 1) {
        addrSPre := (0 until 1 by 1).map(i => Cat(radixCountTemp, 0.U(1.W))).map(i => cyclicShiftL(i, phaseCount))
        addrTPre := (0 until 1 by 1).map(i => Cat(radixCountTemp, 1.U(1.W))).map(i => cyclicShiftL(i, phaseCount))
    } else {
        addrSPre := (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => Cat(radixCountTemp, i.U((parallelCnt - 1).W), 0.U(1.W))).map(i => cyclicShiftL(i, phaseCount))
        addrTPre := (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => Cat(radixCountTemp, i.U((parallelCnt - 1).W), 1.U(1.W))).map(i => cyclicShiftL(i, phaseCount))
    }

    val nk = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    if (parallelCnt == 1) {
        nk := (0 until pow(2, parallelCnt - 1).toInt).map(i => radixCount(radixCount.getWidth - 1 - 1, 0) & ~(Cat(0.U(1.W), VecInit(Seq.fill(stageCnt)(1.U(1.W))).asUInt) >> phaseCount))
    }
    else {
        nk := (0 until pow(2, parallelCnt - 1).toInt).map(i => Cat(radixCount(radixCount.getWidth - 1 - 1, 0), i.U((parallelCnt - 1).W)) & ~(Cat(0.U(1.W), VecInit(Seq.fill(stageCnt)(1.U(1.W))).asUInt) >> phaseCount))
    }

    def addrGen(addrWidthIn: Int, sel: Bool, in1: UInt, in2: UInt): Seq[Bool] = {
        val addrTemp = (0 until addrWidthIn by 1)
            .map(i => Mux(sel, in1(addrWidthIn - 1 - i), in2(i)))
        addrTemp
    }

    val addrS = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => VecInit(addrGen(addrWidth, true.B, addrSPre(i), addrSPre(i))).asUInt)
    val addrT = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => VecInit(addrGen(addrWidth, true.B, addrTPre(i), addrTPre(i))).asUInt)

    def getBitSeqSum(dataIn: UInt, gap: Int, start: Int): UInt = {
        val sum = (start until dataIn.getWidth by gap).map(_.asUInt).fold(0.U)((x, y) => x + dataIn(y))
        sum
    }

    val addrSBankSelPrePre = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => (0 until parallelCnt by 1).map(j => getBitSeqSum(addrS(i), parallelCnt, parallelCnt - 1 - j)))

    val addrSBankSelPre = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => addrSBankSelPrePre(i).fold(0.U)((x, y) => (x << 1) + y)).map(j => j(parallelCnt - 1, 0))

    val addrSBankSel = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    addrSBankSel(0) := Mux(kernelState, addrSBankSelPre(0), 0.U)
    
    for (i <- 1 until pow(2, parallelCnt - 1).toInt by 1) {
        when(kernelState) {
            addrSBankSel(i) := addrSBankSelPre(i)
        } .otherwise {
            addrSBankSel(i) := (addrSBankSelPre(0) + (i.U << 1))(parallelCnt - 1, 0)
        }
    }

    val addrTBankSelPrePre = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => (0 until parallelCnt by 1).map(j => getBitSeqSum(addrT(i), parallelCnt, parallelCnt - 1 - j)))

    val addrTBankSelPre = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => addrTBankSelPrePre(i).fold(0.U)((x, y) => (x << 1) + y)).map(j => j(parallelCnt - 1, 0))

    val addrTBankSel = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    addrTBankSel(0) := Mux(kernelState, addrTBankSelPre(0), 1.U)
    
    for (i <- 1 until pow(2, parallelCnt - 1).toInt by 1) {
        when(kernelState) {
            addrTBankSel(i) := addrTBankSelPre(i)
        } .otherwise {
            addrTBankSel(i) := (addrTBankSelPre(0) + (i.U << 1))(parallelCnt - 1, 0)
        }
    }

    val readAddrBank = WireDefault(VecInit(Seq.fill(pow(2, parallelCnt).toInt)(0.U((addrWidth - parallelCnt).W))))

    for (i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        readAddrBank(addrSBankSel(i)) := addrS(i)(addrWidth - parallelCnt - 1, 0)
    }

    for (i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        readAddrBank(addrTBankSel(i)) := addrT(i)(addrWidth - parallelCnt - 1, 0)
    }

    io.readEnableSram0Bank := VecInit(Seq.fill(pow(2, parallelCnt).toInt)(readEnable & !srcBuffer))
    io.readEnableSram1Bank := VecInit(Seq.fill(pow(2, parallelCnt).toInt)(readEnable & srcBuffer))

    val addrSBankSel1c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrSBankSel2c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrSBankSel3c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    for (i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        addrSBankSel1c(i) := ShiftRegister(addrSBankSel(i), 1, (i * 2).U, true.B)
        addrSBankSel2c(i) := ShiftRegister(addrSBankSel1c(i), 1, (i * 2).U, true.B)
        addrSBankSel3c(i) := ShiftRegister(addrSBankSel2c(i), 1, (i * 2).U, true.B)
    }

    val addrTBankSel1c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTBankSel2c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTBankSel3c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    for (i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        addrTBankSel1c(i) := ShiftRegister(addrTBankSel(i), 1, (i * 2 + 1).U, true.B)
        addrTBankSel2c(i) := ShiftRegister(addrTBankSel1c(i), 1, (i * 2 + 1).U, true.B)
        addrTBankSel3c(i) := ShiftRegister(addrTBankSel2c(i), 1, (i * 2 + 1).U, true.B)
    }

    val kernelState1c = ShiftRegister(kernelState, 1, false.B, true.B)
    val kernelState2c = ShiftRegister(kernelState1c, 1, false.B, true.B)
    val kernelState3c = ShiftRegister(kernelState2c, 1, false.B, true.B)

    val dataInRPre = Wire(Vec(pow(2, parallelCnt).toInt, UInt()))
    val dataInIPre = Wire(Vec(pow(2, parallelCnt).toInt, UInt()))

    for (i <- 0 until pow(2, parallelCnt).toInt by 1) {
        dataInRPre(i) := Mux(srcBuffer, io.readDataSram1Bank(i)(fftDataWidth + 1, 0), io.readDataSram0Bank(i)(fftDataWidth + 1, 0))
        dataInIPre(i) := Mux(srcBuffer, io.readDataSram1Bank(i)(2 * (fftDataWidth + 2) - 1, fftDataWidth + 2), io.readDataSram0Bank(i)(2 * (fftDataWidth + 2) - 1, fftDataWidth + 2))
    }
    for (i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        val addrS1c = ShiftRegister(addrS(i)(addrWidth - parallelCnt - 1, 0), 1, 0.U, true.B)
        val addrS2c = ShiftRegister(addrS1c, 1, 0.U, true.B)
        val addrS3c = ShiftRegister(addrS2c, 1, 0.U, true.B)

        val addrT1c = ShiftRegister(addrT(i)(addrWidth - parallelCnt - 1, 0), 1, 0.U, true.B)
        val addrT2c = ShiftRegister(addrT1c, 1, 0.U, true.B)
        val addrT3c = ShiftRegister(addrT2c, 1, 0.U, true.B)

        val rShiftAmt = io.fftRShiftP0(phaseCount)

        val dataInSR = dataInRPre(addrSBankSel(i))
        val dataInSI = dataInIPre(addrSBankSel(i))
        val dataInTR = dataInRPre(addrTBankSel(i))
        val dataInTI = dataInIPre(addrTBankSel(i))

        val dataInSRRnd = Cat(dataInSR(fftDataWidth+1), dataInSR(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), dataInSR(0))
        val dataInSIRnd = Cat(dataInSI(fftDataWidth+1), dataInSI(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), dataInSI(0))
        val dataInTRRnd = Cat(dataInTR(fftDataWidth+1), dataInTR(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), dataInTR(0))
        val dataInTIRnd = Cat(dataInTI(fftDataWidth+1), dataInTI(fftDataWidth + 1, 1)) + Cat(Fill(fftDataWidth + 1, 0.U), dataInTI(0))

        val dataInSR1c = Mux(rShiftAmt, dataInSRRnd, dataInSR)
        val dataInSI1c = Mux(rShiftAmt, dataInSIRnd, dataInSI)
        val dataInTR1c = Mux(rShiftAmt, dataInTRRnd, dataInTR)
        val dataInTI1c = Mux(rShiftAmt, dataInTIRnd, dataInTI)
        
        val nk1c = ShiftRegister(nk(i), 1, 0.U, true.B)

        val twiLutIdx1c = Cat(nk1c(addrWidth - 1 - 1, 0), 0.U(1.W))

        val twiLutCaseIdx = Mux(isFFT, 0.U(2.W), 1.U(2.W))

        val fftTwiddle = Module(new FFTTwiddle)
        fftTwiddle.io.nk := twiLutIndex1c
        tfftTwiddle.io.twiLutCaseIndex := twiLutCaseIdx1c
        val wR1c = fftTwiddle.io.wR
        val wI1c = fftTwiddle.io.wI

        val dataInSR2c = ShiftRegister(dataInSR1c, 1, 0.U, kernelState1c)
        val dataInSI2c = ShiftRegister(dataInSI1c, 1, 0.U, kernelState1c)
        val dataInTR2c = ShiftRegister(dataInTR1c, 1, 0.U, kernelState1c)
        val dataInTI2c = ShiftRegister(dataInTI1c, 1, 0.U, kernelState1c)

        val wR2c = ShiftRegister(Cat(wR1c, Fill(5, 0.U)), 1, 0.U, kernelState1c)
        val wI2c = ShiftRegister(Cat(wI1c, Fill(5, 0.U)), 1, 0.U, kernelState1c)
    
        val sR2c = dataInSR2c
        val sI2c = dataInSI2c
        val tR2c = dataInTR2c
        val tI2c = dataInTI2c

        val addTRI = (Cat(Fill(2, tR2c(fftDataWidth + 1)), tR2c) + Cat(Fill(2, tI2c(fftDataWidth + 1)), tI2c)).asSInt
        val addWRI = (Cat(wR2c(fftDataWidth + 2), wR2c) + Cat(wI2c(fftDataWidth + 2), wI2c)).asSInt
        val multS = addTRI * addWRI

        val multRPre = tR2c.asSInt * wR2c.asSInt
        val multR = multRPre(2 * (fftDataWidth + 2), 0)

        val multIPre = tI2c.asSInt * wI2c.asSInt
        val multI = multIPre(2 * (fftDataWidth + 2), 0)

        val qR2c = Cat(multR(2 * (fftDataWidth + 2)), multR(2 * (fftDataWidth + 1), (fftDataWidth + 1))) - Cat(multI(2 * (fftDataWidth + 2)), multI(2 * (fftDataWidth + 1), (fftDataWidth + 1)))
        val qI2c = Cat(multS(2 * (fftDataWidth + 3) + 1), multS(2 * (fftDataWidth + 1), (fftDataWidth + 1))) - Cat(multR(2 * (fftDataWidth + 2)), multR(2 * (fftDataWidth + 1), (fftDataWidth + 1))) - Cat(multI(2 * (fftDataWidth + 2)), multI(2 * (fftDataWidth + 1), (fftDataWidth + 1)))
    
        val sR3c = ShiftRegister(sR2c, 1, 0.U, kernelState2c)
        val sI3c = ShiftRegister(sI2c, 1, 0.U, kernelState2c)

        val qR3c = ShiftRegister(qR2c, 1, 0.U, kernelState2c)
        val qI3c = ShiftRegister(qI2c, 1, 0.U, kernelState2c) 

        val xR3cPre = Cat(Fill(2, sR3c(fftDataWidth + 1)), sR3c) + Cat(qR3c(fftDataWidth + 2), qR3c)
        val xI3cPre = Cat(Fill(2, sI3c(fftDataWidth + 1)), sI3c) + Cat(qI3c(fftDataWidth + 2), qI3c)

        val xR3c = Mux((xR3cPre(fftDataWidth + 3) ^ xR3cPre(fftDataWidth + 2)), Cat(xR3cPre(fftDataWidth +3), ~Fill(fftDataWidth + 1, xR3cPre(fftDataWidth + 3))), Mux((xR3cPre(fftDataWidth + 3) ^ xR3cPre(fftDataWidth + 1)), Cat(xR3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, xR3cPre(fftDataWidth + 3))), xR3cPre(fftDataWidth + 1, 0)))
        val xI3c = Mux((xI3cPre(fftDataWidth + 3) ^ xI3cPre(fftDataWidth + 2)), Cat(xI3cPre(fftDataWidth +3), ~Fill(fftDataWidth + 1, xI3cPre(fftDataWidth + 3))), Mux((xI3cPre(fftDataWidth + 3) ^ xI3cPre(fftDataWidth + 1)), Cat(xI3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, xI3cPre(fftDataWidth + 3))), xI3cPre(fftDataWidth + 1, 0)))

        val yR3cPre = Cat(Fill(2, sR3c(fftDataWidth + 1)), sR3c) - Cat(qR3c(fftDataWidth + 2), qR3c)
        val yI3cPre = Cat(Fill(2, sI3c(fftDataWidth + 1)), sI3c) - Cat(qI3c(fftDataWidth + 2), qI3c)

        val yR3c = Mux((yR3cPre(fftDataWidth + 3) ^ yR3cPre(fftDataWidth + 2)), Cat(yR3cPre(fftDataWidth +3), ~Fill(fftDataWidth + 1, yR3cPre(fftDataWidth + 3))), Mux((yR3cPre(fftDataWidth + 3) ^ yR3cPre(fftDataWidth + 1)), Cat(yR3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, yR3cPre(fftDataWidth + 3))), yR3cPre(fftDataWidth + 1, 0)))
        val yI3c = Mux((yI3cPre(fftDataWidth + 3) ^ yI3cPre(fftDataWidth + 2)), Cat(yI3cPre(fftDataWidth +3), ~Fill(fftDataWidth + 1, yI3cPre(fftDataWidth + 3))), Mux((yI3cPre(fftDataWidth + 3) ^ yI3cPre(fftDataWidth + 1)), Cat(yI3cPre(fftDataWidth + 3), ~Fill(fftDataWidth + 1, yI3cPre(fftDataWidth + 3))), yI3cPre(fftDataWidth + 1, 0)))
    
        io.writeEnableSram0Bank(addrSBankSel3c(i)) := srcBuffer & kernelState3c
        io.writeEnableSram0Bank(addrTBankSel3c(i)) := srcBuffer & kernelState3c
        io.writeEnableSram1Bank(addrSBankSel3c(i)) := !srcBuffer & kernelState3c
        io.writeEnableSram1Bank(addrTBankSel3c(i)) := !srcBuffer & kernelState3c

        io.addrSram0Bank(addrSBankSel3c(i)) := addrSBankSel3c(i)
        io.addrSram0Bank(addrTBankSel3c(i)) := addrTBankSel3c(i)
        io.addrSram1Bank(addrSBankSel3c(i)) := addrSBankSel3c(i)
        io.addrSram1Bank(addrTBankSel3c(i)) := addrTBankSel3c(i)

        val writeDataSram0SPre = Cat(xI3c, xR3c)
        val writeDataSram0TPre = Cat(yI3c, yR3c)

        io.writeDataSram0Bank(addrSBankSel3c(i)) := writeDataSram0SPre
        io.writeDataSram0Bank(addrTBankSel3c(i)) := writeDataSram0TPre
        io.writeDataSram1Bank(addrSBankSel3c(i)) := writeDataSram0SPre
        io.writeDataSram1Bank(addrTBankSel3c(i)) := writeDataSram0TPre
    }

    val donePre = (stateReg === fftDone)
    val fftDoneReg = RegNext(donePre, false.B)
    io.fftDone := fftDoneReg
}
