package fft

import chisel3._
import chisel3.util._
import scala.math._

class FFTEngine extends Module with DataConfig{
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
        
        val fftDone = Output(Bool())
        val fftEngineKick = Input(Bool())
        val fftMode = Input(Bool())

        val fftRShiftP0 = Input(Vec(stageCnt + 1, Bool()))
        val fftRShiftP1 = Input(Vec(2, Bool()))
    })

    val FFTCycleVal = (fftLength / pow(2, parallelCnt).toInt - 1).U
    val FFTLatency = 3.U
    val FFTPhaseVal = stageCnt.U
    val FFTPhaseValM1 = (stageCnt - 1).U

    val waitKick :: kernelPP :: kernelPPL :: kernelPPGap :: fftDone :: Nil = Enum(5)

    val isFFT = !io.fftMode

    val stateReg = RegInit(waitKick)

    val radixCount = RegInit(0.U((log2Ceil(fftLength) - parallelCnt + 1).W))

    val phaseCount = RegInit(0.U(log2Ceil(stageCnt + 1).W))

    switch(stateReg) {
        is(waitKick) {
            when(io.fftEngineKick) {
                stateReg := kernelPP
            } .otherwise {
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
                stateReg := kernelPP
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

    val radixUp = (stateReg === kernelPP) | (stateReg === kernelPPL)

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

    def myBitReverse(widthIn: Int, sel: Bool, in: UInt): Seq[Bool] = {
        val temp = (0 until widthIn by 1)
            .map(i => Mux(sel, in(widthIn - 1 - i), in(i)))
        temp
    }

    val nk = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    if (parallelCnt == 1) {
        nk := (0 until pow(2, parallelCnt - 1).toInt).map(i => radixCount(radixCount.getWidth - 1 - 1, 0) & ~(Cat(0.U(1.W), VecInit(Seq.fill(stageCnt)(1.U(1.W))).asUInt) >> phaseCount))
    } else if(parallelCnt == 2){
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                nk(i) := Cat(i.U, radixCount(radixCount.getWidth - 1 - 1, 0))
            }
        } .otherwise {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                nk(i) := Cat(radixCount(radixCount.getWidth - 1 - 1, 0), i.U((parallelCnt - 1).W)) & ~(Cat(0.U(1.W), VecInit(Seq.fill(stageCnt)(1.U(1.W))).asUInt) >> phaseCount)
            }
        }
    } else {
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                nk(i) := Cat(i.U, radixCount(radixCount.getWidth - 1 - 1, 0))
            }
        } .elsewhen(phaseCount === FFTPhaseValM1) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                if(stageCnt == 16) {
                    nk(i) := Cat(i.U, 0.U(1.W))
                } else {
                    nk(i) := Cat(i.U, radixCount(radixCount.getWidth - 1 - 1, 1), 0.U(1.W))
                }
                
            }
            //TODO error
        } .otherwise {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                nk(i) := Cat(radixCount(radixCount.getWidth - 1 - 1, 0), i.U((parallelCnt - 1).W)) & ~(Cat(0.U(1.W), VecInit(Seq.fill(stageCnt)(1.U(1.W))).asUInt) >> phaseCount)
            }
        } 
    }

    def cyclicShiftL(data: UInt, n: UInt): UInt ={
        val dataTemp = Cat(data, data) << n
        dataTemp(2 * data.getWidth - 1, data.getWidth)
    }

    def cyclicShiftR(data: UInt, n: UInt): UInt ={
        val dataTemp = Cat(data, data) >> n
        dataTemp(data.getWidth - 1, 0)
    }

    val addrSPre = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTPre = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    if (parallelCnt == 1) {
        addrSPre := (0 until 1 by 1).map(i => Cat(radixCountTemp, 0.U(1.W))).map(i => cyclicShiftL(i, phaseCount))
        addrTPre := (0 until 1 by 1).map(i => Cat(radixCountTemp, 1.U(1.W))).map(i => cyclicShiftL(i, phaseCount))
    } else if(parallelCnt == 2){
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSPre(i) := Cat(0.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp)
                addrTPre(i) := Cat(1.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp)
            }
        } .otherwise {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 0.U(1.W)), phaseCount)
                addrTPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 1.U(1.W)), phaseCount)
            }
        }
    } else{
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSPre(i) := Cat(0.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp)
                addrTPre(i) := Cat(1.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp)
            }
        } .elsewhen(phaseCount === FFTPhaseValM1) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSPre(i) := cyclicShiftR(Cat(0.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 1.U)
                addrTPre(i) := cyclicShiftR(Cat(1.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 1.U)
            } 
        } .otherwise {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 0.U(1.W)), phaseCount)
                addrTPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 1.U(1.W)), phaseCount)
            }
        }
    }

    val addrS = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => VecInit(myBitReverse(addrWidth, true.B, addrSPre(i))).asUInt)
    val addrT = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => VecInit(myBitReverse(addrWidth, true.B, addrTPre(i))).asUInt)

    def getBitSeqSum(dataIn: UInt, gap: Int, start: Int): UInt = {
        val sum = (start until dataIn.getWidth by gap).map(_.asUInt).fold(0.U(parallelCnt.W))((x, y) => x + dataIn(y))
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

        val fftCalc = Module(new FFT3PipelineCalc)
        fftCalc.io.dataInSR := dataInRPre(addrSBankSel1c(i))
        fftCalc.io.dataInSI := dataInIPre(addrSBankSel1c(i))
        fftCalc.io.dataInTR := dataInRPre(addrTBankSel1c(i))
        fftCalc.io.dataInTI := dataInIPre(addrTBankSel1c(i))
        fftCalc.io.nk := nk(i)
        fftCalc.io.rShiftSym := io.fftRShiftP0(phaseCount)
        fftCalc.io.isFFT := isFFT
        fftCalc.io.dataMode := false.B
        fftCalc.io.state1c := kernelState1c
        fftCalc.io.state2c := kernelState2c
        val writeDataSPre = Cat(fftCalc.io.dataOutSI3c, fftCalc.io.dataOutSR3c)
        val writeDataTPre = Cat(fftCalc.io.dataOutTI3c, fftCalc.io.dataOutTR3c)
    
        io.writeEnableSram0Bank(addrSBankSel3c(i)) := srcBuffer & kernelState3c
        io.writeEnableSram0Bank(addrTBankSel3c(i)) := srcBuffer & kernelState3c
        io.writeEnableSram1Bank(addrSBankSel3c(i)) := !srcBuffer & kernelState3c
        io.writeEnableSram1Bank(addrTBankSel3c(i)) := !srcBuffer & kernelState3c

        when(srcBuffer === 0.U) {
            io.addrSram0Bank(addrSBankSel(i)) := addrS(i)(addrWidth - parallelCnt - 1, 0)
            io.addrSram0Bank(addrTBankSel(i)) := addrT(i)(addrWidth - parallelCnt - 1, 0)
            io.addrSram1Bank(addrSBankSel3c(i)) := addrS3c
            io.addrSram1Bank(addrTBankSel3c(i)) := addrT3c
        } .otherwise {
            io.addrSram0Bank(addrSBankSel3c(i)) := addrS3c
            io.addrSram0Bank(addrTBankSel3c(i)) := addrT3c
            io.addrSram1Bank(addrSBankSel(i)) := addrS(i)(addrWidth - parallelCnt - 1, 0)
            io.addrSram1Bank(addrTBankSel(i)) := addrT(i)(addrWidth - parallelCnt - 1, 0)
        }

        io.writeDataSram0Bank(addrSBankSel3c(i)) := writeDataSPre
        io.writeDataSram0Bank(addrTBankSel3c(i)) := writeDataTPre
        io.writeDataSram1Bank(addrSBankSel3c(i)) := writeDataSPre
        io.writeDataSram1Bank(addrTBankSel3c(i)) := writeDataTPre
    }

    val donePre = (stateReg === fftDone)
    val fftDoneReg = RegNext(donePre, false.B)
    io.fftDone := fftDoneReg
}
