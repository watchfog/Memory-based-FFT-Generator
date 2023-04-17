package fft

import chisel3._
import chisel3.util._
import chisel3.experimental._
import scala.math._

class FFTTop extends Module with DataConfig{
    val io = IO(new Bundle{
        val fftDone = Output(Bool())
        val fftEngineKick = Input(Bool())
        val fftMode = Input(Bool())
        val fftRShiftP0 = Input(Vec(stageCnt + 1, Bool()))
        val externalMode = Input(Bool())
        
        val readDataSram0Bank = Output(Vec(pow(2, parallelCnt).toInt, UInt((2 * (fftDataWidth + 2)).W)))
        val readDataSram1Bank = Output(Vec(pow(2, parallelCnt).toInt, UInt((2 * (fftDataWidth + 2)).W)))

        val readEnableSram0Bank = Input(Vec(pow(2, parallelCnt).toInt, Bool()))
        val readEnableSram1Bank = Input(Vec(pow(2, parallelCnt).toInt, Bool()))

        val writeDataSram0Bank = Input(Vec(pow(2, parallelCnt).toInt, UInt((2 * (fftDataWidth + 2)).W)))
        val writeDataSram1Bank = Input(Vec(pow(2, parallelCnt).toInt, UInt((2 * (fftDataWidth + 2)).W)))

        val writeEnableSram0Bank = Input(Vec(pow(2, parallelCnt).toInt, Bool()))
        val writeEnableSram1Bank = Input(Vec(pow(2, parallelCnt).toInt, Bool()))

        val addrSram0Bank = Input(Vec(pow(2, parallelCnt).toInt, UInt((addrWidth - parallelCnt).W)))
        val addrSram1Bank = Input(Vec(pow(2, parallelCnt).toInt, UInt((addrWidth - parallelCnt).W)))  
    })
    val fftEngine = Module(new FFTEngine)
    val fftSram0 = Seq.fill(pow(2, parallelCnt).toInt)(Module(new FFTSram))
    val fftSram1 = Seq.fill(pow(2, parallelCnt).toInt)(Module(new FFTSram))
    Seq.tabulate(pow(2, parallelCnt).toInt) { i =>
        fftEngine.io.readDataSram0Bank(i) := fftSram0(i).io.dataOut
        fftEngine.io.readDataSram1Bank(i) := fftSram1(i).io.dataOut
        io.readDataSram0Bank(i) := fftSram0(i).io.dataOut
        io.readDataSram1Bank(i) := fftSram1(i).io.dataOut

        fftSram0(i).io.readEnable := Mux(io.externalMode, io.readEnableSram0Bank(i), fftEngine.io.readEnableSram0Bank(i))
        fftSram1(i).io.readEnable := Mux(io.externalMode, io.readEnableSram1Bank(i), fftEngine.io.readEnableSram1Bank(i))
        fftSram0(i).io.dataIn := Mux(io.externalMode, io.writeDataSram0Bank(i), fftEngine.io.writeDataSram0Bank(i))
        fftSram1(i).io.dataIn := Mux(io.externalMode, io.writeDataSram1Bank(i), fftEngine.io.writeDataSram1Bank(i))
        fftSram0(i).io.writeEnable := Mux(io.externalMode, io.writeEnableSram0Bank(i), fftEngine.io.writeEnableSram0Bank(i))
        fftSram1(i).io.writeEnable := Mux(io.externalMode, io.writeEnableSram1Bank(i), fftEngine.io.writeEnableSram1Bank(i))
        fftSram0(i).io.addr := Mux(io.externalMode, io.addrSram0Bank(i), fftEngine.io.addrSram0Bank(i))
        fftSram1(i).io.addr := Mux(io.externalMode, io.addrSram1Bank(i), fftEngine.io.addrSram1Bank(i))
    }
    io.fftDone := fftEngine.io.fftDone
    fftEngine.io.fftEngineKick := io.fftEngineKick
    fftEngine.io.fftMode := io.fftMode
    fftEngine.io.fftRShiftP0 := io.fftRShiftP0
}