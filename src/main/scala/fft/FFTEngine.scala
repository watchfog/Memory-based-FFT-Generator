package fft

import chisel3._
import chisel3.util._
import chisel3.experimental._
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
    })

    val FFTCycleVal = (fftLength / pow(2, parallelCnt).toInt - 1).U
    val FFTLatency = 3.U
    val FFTPhaseVal = stageCnt.U
    val FFTPhaseValM1 = (stageCnt - 1).U

    val ProcCycleVal = (fftLength / 2 - 1).U
    val ProcLatency = 3.U
    val ProcPhaseVal = 1.U
    
    val waitKick :: kernelPP :: kernelPPL :: kernelPPGap :: procPP :: procPPL :: procPPGap :: fftDone :: Nil = Enum(8)

    val isFFT = io.fftMode

    val stateReg = RegInit(waitKick)

    val radixCount = RegInit(0.U((log2Ceil(fftLength)).W))

    val phaseCount = RegInit(0.U(log2Ceil(stageCnt + 1).W))

    if(needProc) {
        switch(stateReg) {
            is(waitKick) {
                    when(io.fftEngineKick) {
                        stateReg := Mux(isFFT, kernelPP, procPP)
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
                    stateReg := Mux(isFFT, procPP, fftDone)
                } .otherwise{
                    stateReg := kernelPP
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
                    stateReg := Mux(isFFT, fftDone, kernelPP)
                } .otherwise{
                    stateReg := procPP
                }
            }
            is(fftDone) {
                stateReg := waitKick
            }
        }
    } else {
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
                    stateReg := Mux(isFFT, procPP, fftDone)
                } .otherwise{
                    stateReg := kernelPP
                }
            }
            is(fftDone) {
                stateReg := waitKick
            }
        }
    }
    
    val radixInit = (stateReg === waitKick) |
    ((stateReg === kernelPP) && (radixCount === FFTCycleVal)) |
    ((stateReg === kernelPPL) && (radixCount === FFTLatency)) |
    (stateReg === kernelPPGap) |
    ((stateReg === procPP) && (radixCount === ProcCycleVal)) |
    ((stateReg === procPPL) && (radixCount === ProcLatency)) |
    (stateReg === procPPGap) |
    (stateReg === fftDone)

    val radixUp = (stateReg === kernelPP) | (stateReg === kernelPPL) |
    (stateReg === procPP) | (stateReg === procPPL)


    when(radixInit) {
        radixCount := 0.U
    } .elsewhen(radixUp) {
        radixCount := radixCount + 1.U
    } .otherwise {
        radixCount := radixCount
    }

    val phaseInit = (stateReg === waitKick) |
    ((stateReg === kernelPPGap) & (phaseCount === FFTPhaseVal)) |
    ((stateReg === procPPGap) & (phaseCount === ProcPhaseVal)) |
    (stateReg === fftDone)

    val phaseUp = (stateReg === kernelPPGap) | (stateReg === procPPGap)

    when(phaseInit) {
        phaseCount := 0.U
    } .elsewhen(phaseUp) {
        phaseCount := phaseCount + 1.U
    } .otherwise {
        phaseCount := phaseCount
    }

    val srcBuffer = RegInit(false.B)

    val srcBufferNext = (stateReg === kernelPPGap | stateReg === procPPGap) & !srcBuffer

    val srcUp = (stateReg === waitKick) | (stateReg === kernelPPGap) | (stateReg === procPPGap)

    when(srcUp) {
        srcBuffer := srcBufferNext
    } .otherwise {
        srcBuffer := srcBuffer
    }

    val kernelState = (stateReg === kernelPP)
    val procState = (stateReg === procPP)

    val readEnable = kernelState | procState

    val radixCountTemp = radixCount(radixCount.getWidth - parallelCnt - 1, 0)

    def myBitReverse(widthIn: Int, sel: Bool, in: UInt): UInt = {
        val temp = (0 until widthIn by 1)
            .map(i => Mux(sel, in(widthIn - 1 - i), in(i)))
        VecInit(temp).asUInt
    }

    val nk = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    if (parallelCnt == 1) {
        nk := (0 until pow(2, parallelCnt - 1).toInt).map(i => radixCount(radixCount.getWidth - parallelCnt - 1, 0) & ~(Cat(0.U(1.W), VecInit(Seq.fill(stageCnt)(1.U(1.W))).asUInt) >> phaseCount))
    } else if(parallelCnt == 2) {
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                nk(i) := Cat(i.U, radixCount(radixCount.getWidth - parallelCnt - 1, 0))
            }
        } .otherwise {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                nk(i) := Cat(radixCount(radixCount.getWidth - parallelCnt - 1, 0), i.U((parallelCnt - 1).W)) & ~(Cat(0.U(1.W), VecInit(Seq.fill(stageCnt)(1.U(1.W))).asUInt) >> phaseCount)
            }
        }
    } else if(parallelCnt == 3) {
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                nk(i) := Cat(i.U, radixCount(radixCount.getWidth - parallelCnt - 1, 0))
            }
        } .elsewhen(phaseCount === FFTPhaseValM1) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                if(fftLength == 16) {
                    nk(i) := Cat(i.U, 0.U(1.W))
                } else {
                    nk(i) := Cat(i.U, radixCount(radixCount.getWidth - parallelCnt - 1, 1), 0.U(1.W))
                }
                
            }
        } .otherwise {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                nk(i) := Cat(radixCount(radixCount.getWidth - 1 - 1, 0), i.U((parallelCnt - 1).W)) & ~(Cat(0.U(1.W), VecInit(Seq.fill(stageCnt)(1.U(1.W))).asUInt) >> phaseCount)
            }
        } 
    } else if(parallelCnt == 4) {
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                nk(i) := Cat(i.U, radixCount(radixCount.getWidth - parallelCnt - 1, 0))
            }
        } .elsewhen(phaseCount === FFTPhaseValM1) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                if(fftLength == 16) {
                    nk(i) := Cat(i.U, 0.U(1.W))
                } else {
                    nk(i) := Cat(i.U, radixCount(radixCount.getWidth - parallelCnt - 1, 1), 0.U(1.W))
                }
                
            }
        } .elsewhen(phaseCount === FFTPhaseValM1 - 1.U) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                    nk(i) := Cat(i.U, radixCount(radixCount.getWidth - parallelCnt - 1, 2), 0.U(2.W))
            }
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

    val addrSKernelPre = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTKernelPre = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    if (parallelCnt == 1) {
        addrSKernelPre := (0 until 1 by 1).map(i => Cat(radixCountTemp, 0.U(1.W))).map(i => cyclicShiftL(i, phaseCount))
        addrTKernelPre := (0 until 1 by 1).map(i => Cat(radixCountTemp, 1.U(1.W))).map(i => cyclicShiftL(i, phaseCount))
    } else if(parallelCnt == 2){
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSKernelPre(i) := Cat(0.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp)
                addrTKernelPre(i) := Cat(1.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp)
            }
        } .otherwise {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSKernelPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 0.U(1.W)), phaseCount)
                addrTKernelPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 1.U(1.W)), phaseCount)
            }
        }
    } else if(parallelCnt == 3){
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSKernelPre(i) := cyclicShiftR(Cat(0.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 0.U)
                addrTKernelPre(i) := cyclicShiftR(Cat(1.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 0.U) 
            }
        } .elsewhen(phaseCount === FFTPhaseValM1) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSKernelPre(i) := cyclicShiftR(Cat(0.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 1.U)
                addrTKernelPre(i) := cyclicShiftR(Cat(1.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 1.U)
            } 
        } .otherwise {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSKernelPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 0.U(1.W)), phaseCount)
                addrTKernelPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 1.U(1.W)), phaseCount)
            }
        }
    } else if(parallelCnt == 4){
        when(phaseCount === FFTPhaseVal) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSKernelPre(i) := cyclicShiftR(Cat(0.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 0.U)
                addrTKernelPre(i) := cyclicShiftR(Cat(1.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 0.U) 
            }
        } .elsewhen(phaseCount === FFTPhaseValM1) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSKernelPre(i) := cyclicShiftR(Cat(0.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 1.U)
                addrTKernelPre(i) := cyclicShiftR(Cat(1.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 1.U)
            } 
        } .elsewhen(phaseCount === (FFTPhaseValM1 - 1.U)) {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSKernelPre(i) := cyclicShiftR(Cat(0.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 2.U)
                addrTKernelPre(i) := cyclicShiftR(Cat(1.U(1.W), i.U((parallelCnt - 1).W), radixCountTemp), 2.U)
            } 
        }.otherwise {
            for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
                addrSKernelPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 0.U(1.W)), phaseCount)
                addrTKernelPre(i) := cyclicShiftL(Cat(radixCountTemp, i.U((parallelCnt - 1).W), 1.U(1.W)), phaseCount)
            }
        }
    }

    val addrSProc = radixCount
    val addrTProc = (~radixCount + 1.U)(addrWidth - 1, 0)

    val addrS = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt(addrWidth.W)))
    val addrT = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt(addrWidth.W)))
    for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        if(i == 0) {
            addrS(i) := Mux(procState, myBitReverse(addrWidth, isFFT, addrSProc), myBitReverse(addrWidth, true.B, addrSKernelPre(i)))
            addrT(i) := Mux(procState, myBitReverse(addrWidth, isFFT, addrTProc), myBitReverse(addrWidth, true.B, addrTKernelPre(i)))
        } else {
            addrS(i) := myBitReverse(addrWidth, true.B, addrSKernelPre(i))
            addrT(i) := myBitReverse(addrWidth, true.B, addrTKernelPre(i))
        }
    }

    val sameAddr = addrS(0) === addrT(0)

    def getBitSeqSum(dataIn: UInt, gap: Int, start: Int): UInt = {
        val sum = (start until dataIn.getWidth by gap).map(_.asUInt).fold(0.U(parallelCnt.W))((x, y) => x + dataIn(y))
        sum
    }

    val addrSBankSelKernelPrePre = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => (0 until parallelCnt by 1).map(j => getBitSeqSum(addrS(i), parallelCnt, parallelCnt - 1 - j)))

    val addrSBankSelKernelPre = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => addrSBankSelKernelPrePre(i).fold(0.U)((x, y) => (x << 1) + y)).map(j => j(parallelCnt - 1, 0))

    val addrSBankSelKernel = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt(parallelCnt.W)))

    val addrTBankSelKernelPrePre = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => (0 until parallelCnt by 1).map(j => getBitSeqSum(addrT(i), parallelCnt, parallelCnt - 1 - j)))

    val addrTBankSelKernelPre = (0 until pow(2, parallelCnt - 1).toInt by 1).map(i => addrTBankSelKernelPrePre(i).fold(0.U)((x, y) => (x << 1) + y)).map(j => j(parallelCnt - 1, 0))

    val addrTBankSelKernel = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt(parallelCnt.W)))
    
    for (i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        when(kernelState) {
            addrSBankSelKernel(i) := addrSBankSelKernelPre(i)
            addrTBankSelKernel(i) := addrTBankSelKernelPre(i)
        } .otherwise {
            addrSBankSelKernel(i) := (i * 2).U(parallelCnt.W)
            addrTBankSelKernel(i) := (i * 2 + 1).U(parallelCnt.W)
        }
    }
    
    val addrSBankSelProc = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTBankSelProc = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    for(i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        val addrSBankSelProcPre = Wire(Vec(parallelCnt, UInt(1.W)))
        val addrTBankSelProcPre = Wire(Vec(parallelCnt, UInt(1.W)))
        for(j <- 0 until parallelCnt) {
            addrSBankSelProcPre(j) := addrS(i)(j) ^ addrS(i)(addrWidth - 1 - j)
            addrTBankSelProcPre(j) := addrT(i)(j) ^ addrT(i)(addrWidth - 1 - j)
        }
        addrSBankSelProc(i) := addrSBankSelProcPre.reduce((x, y) => Cat(x, y))
        addrTBankSelProc(i) := addrTBankSelProcPre.reduce((x, y) => Cat(x, y))
    }

    val addrSBankSelKernel1c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrSBankSelKernel2c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrSBankSelKernel3c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTBankSelKernel1c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTBankSelKernel2c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTBankSelKernel3c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    for (i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        addrSBankSelKernel1c(i) := ShiftRegister(addrSBankSelKernel(i), 1, (i * 2).U, true.B)
        addrSBankSelKernel2c(i) := ShiftRegister(addrSBankSelKernel1c(i), 1, (i * 2).U, true.B)
        addrSBankSelKernel3c(i) := ShiftRegister(addrSBankSelKernel2c(i), 1, (i * 2).U, true.B)
        addrTBankSelKernel1c(i) := ShiftRegister(addrTBankSelKernel(i), 1, (i * 2 + 1).U, true.B)
        addrTBankSelKernel2c(i) := ShiftRegister(addrTBankSelKernel1c(i), 1, (i * 2 + 1).U, true.B)
        addrTBankSelKernel3c(i) := ShiftRegister(addrTBankSelKernel2c(i), 1, (i * 2 + 1).U, true.B)
    }

    val addrSBankSelProc1c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrSBankSelProc2c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrSBankSelProc3c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTBankSelProc1c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTBankSelProc2c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))
    val addrTBankSelProc3c = Wire(Vec(pow(2, parallelCnt - 1).toInt, UInt()))

    for (i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        addrSBankSelProc1c(i) := ShiftRegister(addrSBankSelProc(i), 1, (i * 2).U, true.B)
        addrSBankSelProc2c(i) := ShiftRegister(addrSBankSelProc1c(i), 1, (i * 2).U, true.B)
        addrSBankSelProc3c(i) := ShiftRegister(addrSBankSelProc2c(i), 1, (i * 2).U, true.B)
        addrTBankSelProc1c(i) := ShiftRegister(addrTBankSelProc(i), 1, (i * 2 + 1).U, true.B)
        addrTBankSelProc2c(i) := ShiftRegister(addrTBankSelProc1c(i), 1, (i * 2 + 1).U, true.B)
        addrTBankSelProc3c(i) := ShiftRegister(addrTBankSelProc2c(i), 1, (i * 2 + 1).U, true.B)
    }

    val kernelState1c = ShiftRegister(kernelState, 1, false.B, true.B)
    val kernelState2c = ShiftRegister(kernelState1c, 1, false.B, true.B)
    val kernelState3c = ShiftRegister(kernelState2c, 1, false.B, true.B)

    val procState1c = ShiftRegister(procState, 1, false.B, true.B)
    val procState2c = ShiftRegister(procState1c, 1, false.B, true.B)
    val procState3c = ShiftRegister(procState2c, 1, false.B, true.B)

    val sameAddr1c = ShiftRegister(sameAddr, 1, false.B, true.B)
    val sameAddr2c = ShiftRegister(sameAddr1c, 1, false.B, true.B)
    val sameAddr3c = ShiftRegister(sameAddr2c, 1, false.B, true.B)

    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
        io.readEnableSram0Bank(i) := readEnable & !srcBuffer
        io.readEnableSram1Bank(i) := readEnable & srcBuffer
    }

    val dataInPre = Wire(Vec(pow(2, parallelCnt).toInt, new MyComplex()))

    for (i <- 0 until pow(2, parallelCnt).toInt by 1) {
        dataInPre(i) := Mux(srcBuffer, io.readDataSram1Bank(i).asTypeOf(new MyComplex), io.readDataSram0Bank(i).asTypeOf(new MyComplex))
    }

    for (i <- 0 until pow(2, parallelCnt - 1).toInt by 1) {
        val addrS1c = ShiftRegister(addrS(i)(addrWidth - parallelCnt - 1, 0), 1, 0.U, true.B)
        val addrS2c = ShiftRegister(addrS1c, 1, 0.U, true.B)
        val addrS3c = ShiftRegister(addrS2c, 1, 0.U, true.B)

        val addrT1c = ShiftRegister(addrT(i)(addrWidth - parallelCnt - 1, 0), 1, 0.U, true.B)
        val addrT2c = ShiftRegister(addrT1c, 1, 0.U, true.B)
        val addrT3c = ShiftRegister(addrT2c, 1, 0.U, true.B)

        val addrSBankSel = Wire(UInt())
        val addrTBankSel = Wire(UInt())

        if(i == 0) {
            addrSBankSel := Mux(kernelState, addrSBankSelKernel(i), addrSBankSelProc(i))
            addrTBankSel := Mux(kernelState, addrTBankSelKernel(i), addrTBankSelProc(i))
        } else {
            addrSBankSel := addrSBankSelKernel(i)
            addrTBankSel := addrTBankSelKernel(i)
        }

        when(isFFT) {
            addrSBankSel := Mux(procState, addrSBankSelProc(i), addrSBankSelKernel(i))
            addrTBankSel := Mux(procState, addrTBankSelProc(i), addrTBankSelKernel(i))
        } .otherwise {
            addrSBankSel := Mux(procState | (kernelState && phaseCount === 0.U), addrSBankSelProc(i), addrSBankSelKernel(i))
            addrTBankSel := Mux(procState | (kernelState && phaseCount === 0.U), addrTBankSelProc(i), addrTBankSelKernel(i))
        }

        val addrSBankSel1c = ShiftRegister(addrSBankSel, 1, 0.U, true.B)
        val addrTBankSel1c = ShiftRegister(addrTBankSel, 1, 1.U, true.B)

        val fftCalc = Module(new FFT3PipelineCalc(i))
        fftCalc.io.dataInSR := dataInPre(addrSBankSel1c).re
        fftCalc.io.dataInSI := Mux(sameAddr1c && phaseCount === 1.U, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), dataInPre(addrSBankSel1c).im)
        fftCalc.io.dataInTR := Mux(sameAddr1c && phaseCount === 1.U, dataInPre(addrTBankSel1c).im, dataInPre(addrTBankSel1c).re)
        fftCalc.io.dataInTI := Mux(sameAddr1c && phaseCount === 1.U, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), dataInPre(addrTBankSel1c).im)
        if(i == 0) {
            fftCalc.io.nk := Mux(procState, radixCount(addrWidth - 1, 0), Cat(nk(i)(addrWidth - 1 - 1, 0), 0.U(1.W)))
        } else {
            fftCalc.io.nk := nk(i)(addrWidth - 1 - 1, 0)
        }
        fftCalc.io.rShiftSym := Mux(kernelState1c, io.fftRShiftP0(phaseCount), phaseCount(0))
        fftCalc.io.isFFT := isFFT
        fftCalc.io.procMode := (~phaseCount(0) && procState2c)
        fftCalc.io.state1c := kernelState1c | procState1c
        fftCalc.io.state2c := kernelState2c | procState2c
        val writeDataSRPre3c = fftCalc.io.dataOutSR3c
        val writeDataSIPre3c = fftCalc.io.dataOutSI3c
        val writeDataTRPre3c = Mux(procState3c, Mux(phaseCount === 1.U, fftCalc.io.dataOutTR3c, Mux(isFFT, fftCalc.io.dataOutTI3c, -fftCalc.io.dataOutTI3c)), fftCalc.io.dataOutTR3c)
        val writeDataTIPre3c = Mux(procState3c, Mux(phaseCount === 1.U, -fftCalc.io.dataOutTI3c, Mux(isFFT, -fftCalc.io.dataOutTR3c, fftCalc.io.dataOutTR3c)), fftCalc.io.dataOutTI3c)
    
        val addrSBankSel3c = Wire(UInt())
        val addrTBankSel3c = Wire(UInt())

        when(isFFT) {
            addrSBankSel3c := Mux(procState3c | (kernelState3c && phaseCount === FFTPhaseVal), addrSBankSelProc3c(i), addrSBankSelKernel3c(i))
            addrTBankSel3c := Mux(procState3c | (kernelState3c && phaseCount === FFTPhaseVal), addrTBankSelProc3c(i), addrTBankSelKernel3c(i))
        } .otherwise {
            addrSBankSel3c := Mux(procState3c, addrSBankSelProc3c(i), addrSBankSelKernel3c(i))
            addrTBankSel3c := Mux(procState3c, addrTBankSelProc3c(i), addrTBankSelKernel3c(i))
        }

        if(i == 0) {
            for(j <- 0 until pow(2, parallelCnt).toInt by 1) {
                when(procState3c){
                    when((j.U === addrSBankSelProc3c(0)) || (j.U === addrTBankSelProc3c(0))) {
                        io.writeEnableSram0Bank(j) := srcBuffer & procState3c
                        io.writeEnableSram1Bank(j) := !srcBuffer & procState3c
                    } .otherwise {
                        io.writeEnableSram0Bank(j) := false.B
                        io.writeEnableSram1Bank(j) := false.B
                    }
                } .otherwise {
                    io.writeEnableSram0Bank(j) := srcBuffer & kernelState3c
                    io.writeEnableSram1Bank(j) := !srcBuffer & kernelState3c
                }
            }
        }

        when(!procState) {
            when(srcBuffer === 0.U) {
                io.addrSram0Bank(addrTBankSel) := addrT(i)(addrWidth - parallelCnt - 1, 0)
                io.addrSram0Bank(addrSBankSel) := addrS(i)(addrWidth - parallelCnt - 1, 0)
            } .otherwise {
                io.addrSram1Bank(addrTBankSel) := addrT(i)(addrWidth - parallelCnt - 1, 0)
                io.addrSram1Bank(addrSBankSel) := addrS(i)(addrWidth - parallelCnt - 1, 0)
            }
        } .otherwise {
            if(i == 0) {
                    when(srcBuffer === 0.U) {
                        io.addrSram0Bank(addrTBankSel) := addrT(i)(addrWidth - parallelCnt - 1, 0)
                        io.addrSram0Bank(addrSBankSel) := addrS(i)(addrWidth - parallelCnt - 1, 0)
                    } .otherwise {
                        io.addrSram1Bank(addrTBankSel) := addrT(i)(addrWidth - parallelCnt - 1, 0)
                        io.addrSram1Bank(addrSBankSel) := addrS(i)(addrWidth - parallelCnt - 1, 0)
                    }
            }
        }

        when(!procState3c) {
            when(srcBuffer === 0.U) {
                io.addrSram1Bank(addrTBankSel3c) := addrT3c
                io.addrSram1Bank(addrSBankSel3c) := addrS3c
            } .otherwise {
                io.addrSram0Bank(addrTBankSel3c) := addrT3c
                io.addrSram0Bank(addrSBankSel3c) := addrS3c
            }
        } .otherwise {
            if(i == 0) {
                when(srcBuffer === 0.U) {
                    io.addrSram1Bank(addrTBankSel3c) := addrT3c
                    io.addrSram1Bank(addrSBankSel3c) := addrS3c
                } .otherwise {
                    io.addrSram0Bank(addrTBankSel3c) := addrT3c
                    io.addrSram0Bank(addrSBankSel3c) := addrS3c
                }
            }
        }


        val writeDataS3c = Wire(new MyComplex())
        val writeDataT3c = Wire(new MyComplex())

        when(sameAddr3c) {
            when(isFFT && phaseCount === 0.U) {
                writeDataS3c.re := writeDataSRPre3c //G0 at real and H0 at image
                writeDataS3c.im := writeDataTRPre3c
                writeDataT3c := writeDataS3c
            } .elsewhen(!isFFT && phaseCount === 1.U) {
                writeDataS3c.re := writeDataSRPre3c >> 1
                writeDataS3c.im := writeDataTRPre3c >> 1
                writeDataT3c := writeDataS3c
            } .otherwise {
                writeDataS3c.re := writeDataSRPre3c
                writeDataS3c.im := writeDataSIPre3c
                writeDataT3c.re := writeDataTRPre3c
                writeDataT3c.im := writeDataTIPre3c
            }
        } .elsewhen(kernelState3c && phaseCount === FFTPhaseVal && addrTBankSel3c === midBankSel.U && addrT3c === 1.U) {
            writeDataS3c.re := writeDataSRPre3c
            writeDataS3c.im := writeDataSIPre3c
            writeDataT3c.re := writeDataTRPre3c
            writeDataT3c.im := -writeDataTIPre3c
        } .otherwise{
            writeDataS3c.re := writeDataSRPre3c
            writeDataS3c.im := writeDataSIPre3c
            writeDataT3c.re := writeDataTRPre3c
            writeDataT3c.im := writeDataTIPre3c
        }

        for(j <- 0 until pow(2, parallelCnt).toInt by 1) {
            when(procState3c){
                if(i == 0) {
                    when(j.U === addrSBankSel3c) {
                        io.writeDataSram0Bank(j) := writeDataS3c.asUInt
                        io.writeDataSram1Bank(j) := writeDataS3c.asUInt
                    } .elsewhen(j.U === addrTBankSel3c) {
                        io.writeDataSram0Bank(j) := writeDataT3c.asUInt
                        io.writeDataSram1Bank(j) := writeDataT3c.asUInt
                    }
                }
            } .otherwise {
                when(j.U === addrSBankSel3c) {
                    io.writeDataSram0Bank(j) := writeDataS3c.asUInt
                    io.writeDataSram1Bank(j) := writeDataS3c.asUInt
                } .elsewhen(j.U === addrTBankSel3c) {
                    io.writeDataSram0Bank(j) := writeDataT3c.asUInt
                    io.writeDataSram1Bank(j) := writeDataT3c.asUInt
                }
            }
        }
    }

    val donePre = (stateReg === fftDone)
    val fftDoneReg = RegNext(donePre, false.B)
    io.fftDone := fftDoneReg
}
