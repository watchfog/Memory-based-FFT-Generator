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
                    stateReg := fftDone
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
    val procState = if(needProc) (stateReg === procPP) else false.B

    val readEnable = kernelState | procState

    def myBitReverse(widthIn: Int, sel: Bool, in: UInt): UInt = {
        val temp = (0 until widthIn by 1)
            .map(i => Mux(sel, in(widthIn - 1 - i), in(i)))
        VecInit(temp).asUInt
    }

    def cyclicShiftL(data: UInt, n: UInt): UInt ={
        val dataTemp = Cat(data, data) << n
        dataTemp(2 * data.getWidth - 1, data.getWidth)
    }

    def cyclicShiftR(data: UInt, n: UInt): UInt ={
        val dataTemp = Cat(data, data) >> n
        dataTemp(data.getWidth - 1, 0)
    }

    val addrKernelPre = Wire(Vec(pow(2, parallelCnt).toInt, UInt()))

    when(phaseCount === FFTPhaseVal) {
        Seq.tabulate(8) { i =>
            if(fftLength != 8) {
                addrKernelPre(i) := Cat(radixCount(addrWidth - parallelCnt - 1, 0), i.U(3.W)) //01234567 8910...
            } else {
                addrKernelPre(i) := i.U(3.W) // 1 phase only, need extra support
            }
        }
    } .otherwise{
        Seq.tabulate(8) { i =>
            if(fftLength != 8) {
                addrKernelPre(i) := cyclicShiftR(Cat(i.U(3.W), radixCount(addrWidth - parallelCnt - 1, 0)), (phaseCount << 1) + phaseCount) // 3 * phaseCount
            } else {
                addrKernelPre(i) := i.U(3.W) // 1 phase only, need extra support
            }
        }
    }

    val addrSProc = radixCount
    val addrTProc = (~radixCount + 1.U)(addrWidth - 1, 0)

    val addrIn = Wire(Vec(pow(2, parallelCnt).toInt, UInt(addrWidth.W)))
    Seq.range(0, 4).foreach { i =>
        if(i == 0) {
            addrIn(0) := Mux(procState, myBitReverse(addrWidth, isFFT, addrSProc), addrKernelPre(0))
            addrIn(1) := Mux(procState, myBitReverse(addrWidth, isFFT, addrTProc), addrKernelPre(1))
        } else {
            addrIn(i * 2) := addrKernelPre(i * 2)
            addrIn(i * 2 + 1) := addrKernelPre(i * 2 + 1)
        }
    }

    val sameAddr = addrIn(0) === addrIn(1)

    val addrIn1c = Wire(Vec(pow(2, parallelCnt).toInt, UInt((addrWidth - parallelCnt).W)))
    val addrIn2c = Wire(Vec(pow(2, parallelCnt).toInt, UInt((addrWidth - parallelCnt).W)))
    val addrIn3c = Wire(Vec(pow(2, parallelCnt).toInt, UInt((addrWidth - parallelCnt).W)))

    Seq.tabulate(pow(2, parallelCnt).toInt) { i =>
        addrIn1c(i) := ShiftRegister(addrIn(i)(addrWidth - parallelCnt - 1, 0), 1, 0.U, true.B)
        addrIn2c(i) := ShiftRegister(addrIn1c(i), 1, 0.U, true.B)
        addrIn3c(i) := ShiftRegister(addrIn2c(i), 1, 0.U, true.B)
    }

    def getBitSeqSum(dataIn: UInt, gap: Int, start: Int): UInt = {
        val sum = (start until dataIn.getWidth by gap).map(_.asUInt).fold(0.U(parallelCnt.W))((x, y) => x + dataIn(y))
        sum
    }

    val addrInBankSelKernelPrePre = (0 until pow(2, parallelCnt).toInt by 1).map(i => (0 until parallelCnt by 1).map(j => getBitSeqSum(addrIn(i), parallelCnt, parallelCnt - 1 - j)))

    val addrInBankSelKernelPre = (0 until pow(2, parallelCnt).toInt by 1).map(i => addrInBankSelKernelPrePre(i).fold(0.U)((x, y) => (x << 1) + y)).map(j => j(parallelCnt - 1, 0))

    val addrInBankSelKernel = Wire(Vec(pow(2, parallelCnt).toInt, UInt(parallelCnt.W)))
    
    for (i <- 0 until pow(2, parallelCnt).toInt by 1) {
        when(kernelState) {
            addrInBankSelKernel(i) := addrInBankSelKernelPre(i)
        } .otherwise {
            addrInBankSelKernel(i) := i.U(parallelCnt.W)
        }
    }

    val addrInBankSelProc = Wire(Vec(pow(2, 3).toInt, UInt()))
    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
        val addrInBankSelProcPre = Wire(Vec(parallelCnt, UInt(1.W)))
        if(fftLength == 8) { //special cases
            addrInBankSelProcPre(0) := addrIn(i)(0)
            addrInBankSelProcPre(1) := addrIn(i)(1)
            addrInBankSelProcPre(2) := addrIn(i)(2)
        } else if(fftLength == 16) {
            addrInBankSelProcPre(0) := addrIn(i)(0) ^ addrIn(i)(addrWidth - 1 - 0) //0 3
            addrInBankSelProcPre(1) := addrIn(i)(1) ^ addrIn(i)(addrWidth - 1 - 1) //1 2
            addrInBankSelProcPre(2) := addrIn(i)(2) ^ addrIn(i)(0)
        } else if(fftLength == 32) {
            addrInBankSelProcPre(0) := addrIn(i)(0) ^ addrIn(i)(addrWidth - 1 - 0) //0 4
            addrInBankSelProcPre(1) := addrIn(i)(1) ^ addrIn(i)(addrWidth - 1 - 1) //1 3
            addrInBankSelProcPre(2) := addrIn(i)(2)
        } else {
            for(j <- 0 until parallelCnt) {
                addrInBankSelProcPre(j) := addrIn(i)(j) ^ addrIn(i)(addrWidth - 1 - j)
            }
        }
        addrInBankSelProc(i) := addrInBankSelProcPre.reduce((x, y) => Cat(x, y))
    }

    val addrInBankSelKernel1c = Wire(Vec(pow(2, parallelCnt).toInt, UInt()))
    val addrInBankSelKernel2c = Wire(Vec(pow(2, parallelCnt).toInt, UInt()))
    val addrInBankSelKernel3c = Wire(Vec(pow(2, parallelCnt).toInt, UInt()))

    for (i <- 0 until pow(2, parallelCnt).toInt by 1) {
        addrInBankSelKernel1c(i) := ShiftRegister(addrInBankSelKernel(i), 1, (i * 2).U, true.B)
        addrInBankSelKernel2c(i) := ShiftRegister(addrInBankSelKernel1c(i), 1, (i * 2).U, true.B)
        addrInBankSelKernel3c(i) := ShiftRegister(addrInBankSelKernel2c(i), 1, (i * 2).U, true.B)
    }

    val addrInBankSelProc1c = Wire(Vec(pow(2, parallelCnt).toInt, UInt()))
    val addrInBankSelProc2c = Wire(Vec(pow(2, parallelCnt).toInt, UInt()))
    val addrInBankSelProc3c = Wire(Vec(pow(2, parallelCnt).toInt, UInt()))

    for (i <- 0 until pow(2, parallelCnt).toInt by 1) {
        addrInBankSelProc1c(i) := ShiftRegister(addrInBankSelProc(i), 1, (i * 2).U, true.B)
        addrInBankSelProc2c(i) := ShiftRegister(addrInBankSelProc1c(i), 1, (i * 2).U, true.B)
        addrInBankSelProc3c(i) := ShiftRegister(addrInBankSelProc2c(i), 1, (i * 2).U, true.B)
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

    val addrInBankSel = Wire(Vec(8, UInt()))

    Seq.tabulate(8) { i =>
        when(isFFT) {
            addrInBankSel(i) := Mux(procState, addrInBankSelProc(i), addrInBankSelKernel(i))
        } .otherwise {
            addrInBankSel(i) := Mux(procState | (kernelState && phaseCount === 0.U), addrInBankSelProc(i), addrInBankSelKernel(i))
        }
    }

    val dataInPre = Wire(Vec(pow(2, parallelCnt).toInt, new MyComplex()))

    for (i <- 0 until pow(2, parallelCnt).toInt by 1) {
        dataInPre(i) := Mux(srcBuffer, io.readDataSram1Bank(i).asTypeOf(new MyComplex), io.readDataSram0Bank(i).asTypeOf(new MyComplex))
    }

    //TODO change to R23

    val addrInBankSel1c = Wire(Vec(8, UInt()))
    Seq.tabulate(8) { i =>
        addrInBankSel1c(i) := ShiftRegister(addrInBankSel(i), 1, 0.U, true.B)
    }
        
    val fftCalc = Module(new FFT3PipelineR23Calc)
    fftCalc.io.dataIn(0).re := dataInPre(addrInBankSel1c(0)).re
    fftCalc.io.dataIn(0).im := Mux(sameAddr1c && phaseCount === 1.U, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), dataInPre(addrInBankSel1c(0)).im)
    fftCalc.io.dataIn(1).re := Mux(sameAddr1c && phaseCount === 1.U, dataInPre(addrInBankSel1c(1)).im, dataInPre(addrInBankSel1c(1)).re)
    fftCalc.io.dataIn(1).im := Mux(sameAddr1c && phaseCount === 1.U, FixedPoint(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP), dataInPre(addrInBankSel1c(1)).im)
    Seq.range(2, 8).foreach { i =>
        fftCalc.io.dataIn(i) := dataInPre(addrInBankSel1c(i))
    }
    fftCalc.io.radixCount := Mux(procState, radixCount(addrWidth - 1, 0), radixCount(addrWidth - 3 - 1, 0))
    fftCalc.io.rShiftSym := Mux(kernelState1c, io.fftRShiftP0(phaseCount), phaseCount(0))
    fftCalc.io.isFFT := isFFT
    fftCalc.io.procMode := procState | procState1c | procState2c | procState3c
    when((kernelState | kernelState1c | kernelState2c | kernelState3c) && phaseCount === FFTPhaseVal) {
        fftCalc.io.calcMode := lastStageMode.U
    } .elsewhen((procState | procState1c | procState2c | procState3c) && phaseCount === 0.U) {
        fftCalc.io.calcMode := 0.U
    } .elsewhen((procState | procState1c | procState2c | procState3c) && phaseCount === 1.U) {
        fftCalc.io.calcMode := 1.U
    } .otherwise{
        fftCalc.io.calcMode := 3.U
    }
    fftCalc.io.phaseCount := phaseCount
    fftCalc.io.state1c := kernelState1c | procState1c
    fftCalc.io.state2c := kernelState2c | procState2c

    val writeDataPre3c = Wire(Vec(8, new MyComplex()))
    writeDataPre3c(0) := fftCalc.io.dataOut3c(0)
    writeDataPre3c(1).re := Mux(procState3c, Mux(phaseCount === 1.U, fftCalc.io.dataOut3c(1).re, Mux(isFFT, fftCalc.io.dataOut3c(1).im, -fftCalc.io.dataOut3c(1).im)), fftCalc.io.dataOut3c(1).re)
    writeDataPre3c(1).im := Mux(procState3c, Mux(phaseCount === 1.U, -fftCalc.io.dataOut3c(1).im, Mux(isFFT, -fftCalc.io.dataOut3c(1).re, fftCalc.io.dataOut3c(1).re)), fftCalc.io.dataOut3c(1).im)
    Seq.range(2, 8).foreach { i =>
        writeDataPre3c(i) := fftCalc.io.dataOut3c(i)
    }

    val addrInBankSel3c = Wire(Vec(8, UInt()))
    Seq.tabulate(8) { i =>
        when(isFFT) {
            addrInBankSel3c(i) := Mux(procState3c | (kernelState3c && phaseCount === FFTPhaseVal), addrInBankSelProc3c(i), addrInBankSelKernel3c(i))
        } .otherwise {
            addrInBankSel3c(i) := Mux(procState3c, addrInBankSelProc3c(i), addrInBankSelKernel3c(i))
        }
    }

    Seq.tabulate(8) { i =>
        when(procState3c){
            when(i.U === addrInBankSelProc3c(0) || i.U === addrInBankSelProc3c(1)) {
                io.writeEnableSram0Bank(i) := srcBuffer & procState3c
                io.writeEnableSram1Bank(i) := !srcBuffer & procState3c
            } .otherwise {
                io.writeEnableSram0Bank(i) := false.B
                io.writeEnableSram1Bank(i) := false.B
            }
        } .otherwise {
            io.writeEnableSram0Bank(i) := srcBuffer & kernelState3c
            io.writeEnableSram1Bank(i) := !srcBuffer & kernelState3c
        }
    }

    Seq.tabulate(8) { i =>
        when(!procState) {
            when(srcBuffer === 0.U) {
                io.addrSram0Bank(addrInBankSel(i)) := addrIn(i)(addrWidth - parallelCnt - 1, 0)
            } .otherwise {
                io.addrSram1Bank(addrInBankSel(i)) := addrIn(i)(addrWidth - parallelCnt - 1, 0)
            }
        } .otherwise {
            if(i == 0 || i == 1) {
                when(srcBuffer === 0.U) {
                    io.addrSram0Bank(addrInBankSel(i)) := addrIn(i)(addrWidth - parallelCnt - 1, 0)
                } .otherwise {
                    io.addrSram1Bank(addrInBankSel(i)) := addrIn(i)(addrWidth - parallelCnt - 1, 0)
                }
            }
        }
    }

    Seq.tabulate(8) { i =>
        when(!procState3c) {
            when(srcBuffer === 0.U) {
                io.addrSram1Bank(addrInBankSel3c(i)) := addrIn3c(i)
            } .otherwise {
                io.addrSram0Bank(addrInBankSel3c(i)) := addrIn3c(i)
            }
        } .otherwise {
            if(i == 0 || i == 1) {
                when(srcBuffer === 0.U) {
                    io.addrSram1Bank(addrInBankSel3c(i)) := addrIn3c(i)
                } .otherwise {
                    io.addrSram0Bank(addrInBankSel3c(i)) := addrIn3c(i)
                }
            }
        }
    }

    val writeData3c = Wire(Vec(8, new MyComplex()))

    when(sameAddr3c) {
        when(isFFT && phaseCount === 0.U) {
            writeData3c(0).re := writeDataPre3c(0).re //G0 at real and H0 at image
            writeData3c(0).im := writeDataPre3c(1).re
            writeData3c(1) := writeData3c(0)
        } .elsewhen(!isFFT && phaseCount === 1.U) {
            writeData3c(0).re := writeDataPre3c(0).re >> 1
            writeData3c(0).im := writeDataPre3c(1).re >> 1
            writeData3c(1) := writeData3c(0)
        } .otherwise {
            writeData3c(0) := writeDataPre3c(0)
            writeData3c(1) := writeDataPre3c(1)
        }
    } .otherwise {
        writeData3c(0) := writeDataPre3c(0)
        when(kernelState3c && phaseCount === FFTPhaseVal && addrInBankSel3c(1) === midBankSel.U && addrIn3c(1) === 1.U) {
            writeData3c(1).re := writeDataPre3c(1).re
            writeData3c(1).im := -writeDataPre3c(1).im
        } .otherwise{
            writeData3c(1).re := writeDataPre3c(1).re
            writeData3c(1).im := writeDataPre3c(1).im
        }
    }

    Seq.range(2, 8).foreach{ i =>
        writeData3c(i) := writeDataPre3c(i)
    }

    Seq.tabulate(8) { i =>
        when(procState3c){
            when(i.U === addrInBankSel3c(0)) {
                io.writeDataSram0Bank(i) := writeData3c(0).asUInt
                io.writeDataSram1Bank(i) := writeData3c(0).asUInt
            } .elsewhen(i.U === addrInBankSel3c(1)) {
                io.writeDataSram0Bank(i) := writeData3c(1).asUInt
                io.writeDataSram1Bank(i) := writeData3c(1).asUInt
            }
        } .otherwise {
            Seq.tabulate(8) { j =>
                when(i.U === addrInBankSel3c(j)) {
                    io.writeDataSram0Bank(i) := writeData3c(j).asUInt
                    io.writeDataSram1Bank(i) := writeData3c(j).asUInt
                }
            }
        }
    }

    val donePre = (stateReg === fftDone)
    val fftDoneReg = RegNext(donePre, false.B)
    io.fftDone := fftDoneReg
}
