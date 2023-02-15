package fft

import chisel3._
import chisel3.util._
import scala.math._

class FFTRTop extends Module with DataConfig{
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
        
        val fftTopDone = Output(Bool())
        val fftTopKick = Input(Bool())
        val fftMode = Input(Bool())

        val fftRShiftP0 = Input(Vec(stageCnt + 1, Bool()))
    })

    val fftEngine = Module(new FFTEngine)
    val fftProc = Module(new FFTDataProcess)

    val isFFT = !io.fftMode

    val waitKick :: kickEngine :: waitEngine :: kickProc :: waitProc :: fftTopDone :: Nil = Enum(6)

    val stateReg = RegInit(waitKick)

    switch(stateReg) {
        is(waitKick) {
            when(io.fftTopKick) {
                stateReg := Mux(isFFT, kickEngine, kickProc)
            } .otherwise {
                stateReg := stateReg
            }
        }
        is(kickEngine) {
            stateReg := waitEngine
        }
        is(waitEngine) {
            when(fftEngine.io.fftDone) {
                stateReg := Mux(isFFT, kickProc, fftTopDone)
            } .otherwise{
                stateReg := stateReg
            }
        }
        is(kickProc) {
            stateReg := waitProc
        }
        is(waitProc) {
            when(fftProc.io.procDone) {
                stateReg := Mux(isFFT, fftTopDone, kickEngine)
            } .otherwise{
                stateReg := stateReg
            }
        }
        is(fftTopDone) {
            stateReg := waitKick
        }
    }

    fftEngine.io.fftEngineKick := stateReg === kickEngine
    fftProc.io.procKick := stateReg === kickProc

    fftEngine.io.fftMode := io.fftMode
    fftProc.io.fftMode := io.fftMode

    fftEngine.io.fftRShiftP0 := io.fftRShiftP0

    when(stateReg === waitProc || stateReg === kickProc) {
        fftProc.io.readDataSram0Bank := io.readDataSram0Bank
        fftProc.io.readDataSram1Bank := io.readDataSram1Bank

        io.readEnableSram0Bank := fftProc.io.readEnableSram0Bank
        io.readEnableSram1Bank := fftProc.io.readEnableSram1Bank

        io.writeDataSram0Bank := fftProc.io.writeDataSram0Bank
        io.writeDataSram1Bank := fftProc.io.writeDataSram1Bank

        io.writeEnableSram0Bank := fftProc.io.writeEnableSram0Bank
        io.writeEnableSram1Bank := fftProc.io.writeEnableSram1Bank

        io.addrSram0Bank := fftProc.io.addrSram0Bank
        io.addrSram1Bank := fftProc.io.addrSram1Bank
    } .otherwise {
        fftEngine.io.readDataSram0Bank := io.readDataSram0Bank
        fftEngine.io.readDataSram1Bank := io.readDataSram1Bank

        io.readEnableSram0Bank := fftEngine.io.readEnableSram0Bank
        io.readEnableSram1Bank := fftEngine.io.readEnableSram1Bank

        io.writeDataSram0Bank := fftEngine.io.writeDataSram0Bank
        io.writeDataSram1Bank := fftEngine.io.writeDataSram1Bank

        io.writeEnableSram0Bank := fftEngine.io.writeEnableSram0Bank
        io.writeEnableSram1Bank := fftEngine.io.writeEnableSram1Bank

        io.addrSram0Bank := fftEngine.io.addrSram0Bank
        io.addrSram1Bank := fftEngine.io.addrSram1Bank
    }

    io.fftTopDone := stateReg === fftTopDone
}