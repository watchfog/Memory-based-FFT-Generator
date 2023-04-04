package fft

import chisel3.stage.{ChiselGeneratorAnnotation,   ChiselStage}
import firrtl.options.TargetDirAnnotation
 
object emitTop extends App with DataConfig{  
  val myverilog = (new ChiselStage).emitVerilog(
    new FFTTop(),
    Array("--target-dir", "Verilog", "--output-file", s"FFTTop_R23_${fftLength}.v")
  )
}

object emitEngine extends App with DataConfig{  
  val myverilog = (new ChiselStage).emitVerilog(
    new FFTEngine(),
    Array("--target-dir", "Verilog", "--output-file", s"FFTEngine_R23_${fftLength}.v")
  )
}

