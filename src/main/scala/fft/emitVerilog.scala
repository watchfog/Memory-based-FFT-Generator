package fft

import chisel3.stage.{ChiselGeneratorAnnotation,   ChiselStage}
import firrtl.options.TargetDirAnnotation
import scala.math.pow
 
object emitTop extends App with DataConfig{  
  val myverilog = (new ChiselStage).emitVerilog(
    new FFTTop,
    Array("--target-dir", "Verilog", "--output-file", s"FFTTop.v")
  )
}

object emitEngine extends App with DataConfig{  
  val myverilog = (new ChiselStage).emitVerilog(
    new FFTEngine(),
    Array("--target-dir", "Verilog", "--output-file", s"FFTEngine_R2_${pow(2, parallelCnt - 1).toInt}_${fftLength}.v")
  )
}