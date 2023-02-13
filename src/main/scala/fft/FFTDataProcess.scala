package fft

import chisel3._
import chisel3.util._
import scala.math._

class FFTDataProcess extends Module with DataConfig{
    override val compileOptions = chisel3.ExplicitCompileOptions.Strict.copy(explicitInvalidate = false)
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

        val procDone = Output(Bool())
        val procKick = Input(Bool())
        val fftMode = Input(Bool())
    })

    val ProcCycleVal = (fftLength / 2 - 1).U
    val ProcLatency = 3.U
    val ProcPhaseVal = 1.U

    val waitKick :: procPP :: procPPL :: procPPGap :: procDone :: Nil = Enum(5)

    val isFFT = !io.fftMode

    val stateReg = RegInit(waitKick)

    val radixCount = RegInit(0.U(log2Ceil(fftLength).W))

    val phaseCount = RegInit(0.U(2.W))

    switch(stateReg) {
        is(waitKick) {
            when(io.procKick) {
                stateReg := procPP
            } .otherwise {
                stateReg := stateReg
            }
        }
        is(procPP) {
            when(radixCount === ProcCycleVal) {
                stateReg := procPPL
            } .otherwise{
                stateReg := stateReg
            }
        }
        is(procPPL) {
            when(radixCount === ProcLatency) {
                stateReg := procPPGap
            } .otherwise{
                stateReg := stateReg
            }
        }
        is(procPPGap) {
            when(phaseCount === ProcPhaseVal) {
                stateReg := procDone
            } .otherwise{
                stateReg := procPP
            }
        }
        is(procDone) {
            stateReg := waitKick
        }
    }

    val radixInit = (stateReg === waitKick) |
    ((stateReg === procPP) && (radixCount === ProcCycleVal)) |
    ((stateReg === procPPL) && (radixCount === ProcLatency)) |
    (stateReg === procPPGap) |
    (stateReg === procDone)

    val radixUp = (stateReg === procPP) | (stateReg === procPPL)

    when(radixInit) {
        radixCount := 0.U
    } .elsewhen(radixUp) {
        radixCount := radixCount + 1.U
    } .otherwise {
        radixCount := radixCount
    }

    val phaseInit = (stateReg === waitKick) |
    ((stateReg === procPPGap) & (phaseCount === ProcPhaseVal)) |
    (stateReg === procDone)

    val phaseUp = (stateReg === procPPGap)

    when(phaseInit) {
        phaseCount := 0.U
    } .elsewhen(phaseUp) {
        phaseCount := phaseCount + 1.U
    } .otherwise {
        phaseCount := phaseCount
    }

    val srcBuffer = RegInit(false.B)

    val srcBufferNext = (stateReg === procPPGap) & !srcBuffer

    val srcUp = (stateReg === waitKick) | (stateReg === procPPGap)

    when(srcUp) {
        srcBuffer := srcBufferNext
    } .otherwise {
        srcBuffer := srcBuffer
    }

    val procState = (stateReg === procPP)

    val readEnable = procState

    def myBitReverse(widthIn: Int, sel: Bool, in: UInt): Seq[Bool] = {
        val temp = (0 until widthIn by 1)
            .map(i => Mux(sel, in(widthIn - 1 - i), in(i)))
        temp
    }

    val addrS = VecInit(myBitReverse(addrWidth, true.B, radixCount)).asUInt
    val addrT = VecInit(myBitReverse(addrWidth, true.B, (~radixCount + 1.U)(addrWidth - 1, 0))).asUInt
    
    val sameAddr = addrS === addrT

    def getBitSeqSum(dataIn: UInt, gap: Int, start: Int): UInt = {
        val sum = (start until dataIn.getWidth by gap).map(_.asUInt).fold(0.U(parallelCnt.W))((x, y) => x + dataIn(y))
        sum
    }

    val addrSBankSelPre = (0 until parallelCnt by 1).map(j => getBitSeqSum(addrS, parallelCnt, parallelCnt - 1 - j))

    val addrSBankSel = addrSBankSelPre.fold(0.U)((x, y) => (x << 1) + y)(parallelCnt - 1, 0)

    val addrTBankSelPre = (0 until parallelCnt by 1).map(j => getBitSeqSum(addrT, parallelCnt, parallelCnt - 1 - j))

    val addrTBankSel = addrTBankSelPre.fold(0.U)((x, y) => (x << 1) + y)(parallelCnt - 1, 0)

    when(srcBuffer === 0.U) {
        io.addrSram0Bank(addrSBankSel) := addrS(addrWidth - parallelCnt - 1, 0)
        io.addrSram0Bank(addrTBankSel) := addrT(addrWidth - parallelCnt - 1, 0)
    } .otherwise {
        io.addrSram1Bank(addrSBankSel) := addrS(addrWidth - parallelCnt - 1, 0)
        io.addrSram1Bank(addrTBankSel) := addrT(addrWidth - parallelCnt - 1, 0)
    }

    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
        when((i.U === addrSBankSel) || (i.U === addrTBankSel)) {
            io.readEnableSram0Bank(i) := readEnable & !srcBuffer
            io.readEnableSram0Bank(i) := readEnable & !srcBuffer
            io.readEnableSram1Bank(i) := readEnable & srcBuffer
            io.readEnableSram1Bank(i) := readEnable & srcBuffer
        } .otherwise{
            io.readEnableSram0Bank(i) := false.B
            io.readEnableSram0Bank(i) := false.B
            io.readEnableSram1Bank(i) := false.B
            io.readEnableSram1Bank(i) := false.B
        }
    }

    val addrSBankSel1c = ShiftRegister(addrSBankSel, 1, 0.U, true.B)
    val addrSBankSel2c = ShiftRegister(addrSBankSel1c, 1, 0.U, true.B)
    val addrSBankSel3c = ShiftRegister(addrSBankSel2c, 1, 0.U, true.B)

    val addrTBankSel1c = ShiftRegister(addrTBankSel, 1, 1.U, true.B)
    val addrTBankSel2c = ShiftRegister(addrTBankSel1c, 1, 1.U, true.B)
    val addrTBankSel3c = ShiftRegister(addrTBankSel2c, 1, 1.U, true.B)

    val procState1c = ShiftRegister(procState, 1, false.B, true.B)
    val procState2c = ShiftRegister(procState1c, 1, false.B, true.B)
    val procState3c = ShiftRegister(procState2c, 1, false.B, true.B)

    val addrS1c = ShiftRegister(addrS(addrWidth - parallelCnt - 1, 0), 1, 0.U, true.B)
    val addrS2c = ShiftRegister(addrS1c, 1, 0.U, true.B)
    val addrS3c = ShiftRegister(addrS2c, 1, 0.U, true.B)

    val addrT1c = ShiftRegister(addrT(addrWidth - parallelCnt - 1, 0), 1, 0.U, true.B)
    val addrT2c = ShiftRegister(addrT1c, 1, 0.U, true.B)
    val addrT3c = ShiftRegister(addrT2c, 1, 0.U, true.B)

    val dataInSR = Mux(srcBuffer, io.readDataSram1Bank(addrSBankSel1c)(fftDataWidth + 1, 0), io.readDataSram0Bank(addrSBankSel1c)(fftDataWidth + 1, 0))
    val dataInSI = Mux(srcBuffer, io.readDataSram1Bank(addrSBankSel1c)(2 * (fftDataWidth + 2) - 1, fftDataWidth + 2), io.readDataSram0Bank(addrSBankSel1c)(2 * (fftDataWidth + 2) - 1, fftDataWidth + 2))

    val dataInTR = Mux(srcBuffer, io.readDataSram1Bank(addrTBankSel1c)(fftDataWidth + 1, 0), io.readDataSram0Bank(addrTBankSel1c)(fftDataWidth + 1, 0))
    val dataInTI = Mux(srcBuffer, io.readDataSram1Bank(addrTBankSel1c)(2 * (fftDataWidth + 2) - 1, fftDataWidth + 2), io.readDataSram0Bank(addrTBankSel1c)(2 * (fftDataWidth + 2) - 1, fftDataWidth + 2))

    val dataCalc = Module(new FFT3PipelineCalc)
    dataCalc.io.dataInSR := dataInSR
    dataCalc.io.dataInSI := dataInSI
    dataCalc.io.dataInTR := dataInTR
    dataCalc.io.dataInTI := dataInTI
    dataCalc.io.nk := radixCount(addrWidth - 1, 0)
    dataCalc.io.rShiftSym := phaseCount(0)
    dataCalc.io.isFFT := isFFT
    dataCalc.io.dataMode := ~phaseCount(0)
    dataCalc.io.state1c := procState1c
    dataCalc.io.state2c := procState2c
    val writeDataSRPre = dataCalc.io.dataOutSR3c
    val writeDataSIPre = dataCalc.io.dataOutSI3c
    val writeDataTRPre = Mux(phaseCount === 1.U, dataCalc.io.dataOutTR3c, dataCalc.io.dataOutTI3c)
    val writeDataTIPre = Mux(phaseCount === 1.U, ~dataCalc.io.dataOutTI3c + 1.U, ~dataCalc.io.dataOutTR3c + 1.U)

    val writeDataS = Cat(writeDataSIPre, writeDataSRPre)
    val writeDataT = Cat(writeDataTIPre, writeDataTRPre)

    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
        when((i.U === addrSBankSel3c) || (i.U === addrTBankSel3c)) {
            io.writeEnableSram0Bank(i) := srcBuffer & procState3c
            io.writeEnableSram0Bank(i) := srcBuffer & procState3c
            io.writeEnableSram1Bank(i) := !srcBuffer & procState3c
            io.writeEnableSram1Bank(i) := !srcBuffer & procState3c
        } .otherwise{
            io.writeEnableSram0Bank(i) := false.B
            io.writeEnableSram0Bank(i) := false.B
            io.writeEnableSram1Bank(i) := false.B
            io.writeEnableSram1Bank(i) := false.B
        }
    }

    when(srcBuffer === 0.U) {
        io.addrSram0Bank(addrSBankSel) := addrS(addrWidth - parallelCnt - 1, 0)
        io.addrSram0Bank(addrTBankSel) := addrT(addrWidth - parallelCnt - 1, 0)
        io.addrSram1Bank(addrSBankSel3c) := addrS3c
        io.addrSram1Bank(addrTBankSel3c) := addrT3c
    } .otherwise {
        io.addrSram0Bank(addrSBankSel3c) := addrS3c
        io.addrSram0Bank(addrTBankSel3c) := addrT3c
        io.addrSram1Bank(addrSBankSel) := addrS(addrWidth - parallelCnt - 1, 0)
        io.addrSram1Bank(addrTBankSel) := addrT(addrWidth - parallelCnt - 1, 0)
    }

    io.writeDataSram0Bank(addrSBankSel3c) := writeDataS
    io.writeDataSram0Bank(addrTBankSel3c) := writeDataT
    io.writeDataSram1Bank(addrSBankSel3c) := writeDataS
    io.writeDataSram1Bank(addrTBankSel3c) := writeDataT

    val donePre = (stateReg === procDone)
    val procDoneReg = RegNext(donePre, false.B)
    io.procDone := procDoneReg
}
