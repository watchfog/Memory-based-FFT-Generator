package fft

import chisel3.stage.{ChiselGeneratorAnnotation,   ChiselStage}
import firrtl.options.TargetDirAnnotation
 
object emitEngine extends App {  
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog", "--full-stacktrace"),
    Seq(ChiselGeneratorAnnotation(() => new FFT3PipelineR23Calc()),
      TargetDirAnnotation("Verilog"))
  )
}
