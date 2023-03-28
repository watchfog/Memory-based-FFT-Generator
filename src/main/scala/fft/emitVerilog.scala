package fft

import chisel3.stage.{ChiselGeneratorAnnotation,   ChiselStage}
import firrtl.options.TargetDirAnnotation
 
object emitTop extends App with DataConfig{  
  val myverilog = (new ChiselStage).emitVerilog(
    new FFTTop,
    Array("--target-dir", "Verilog", "--output-file", s"FFTTop.v")
  )
}
