package fft

import chisel3.stage.{ChiselGeneratorAnnotation,   ChiselStage}
import firrtl.options.TargetDirAnnotation
 
object emitTop extends App with DataConfig{  
  val myverilog = (new ChiselStage).emitVerilog(
    new FFTMultiply(),
    Array("--target-dir", "Verilog", "--output-file", s"FFTMultiply.v")
  )
}

object emitEngine extends App {  
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog", "--full-stacktrace"),
    Seq(ChiselGeneratorAnnotation(() => new FFTEngine()),
      TargetDirAnnotation("Verilog"))
  )
}

object emitSram extends App {  
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog", "--full-stacktrace"),
    Seq(ChiselGeneratorAnnotation(() => new FFTSram()),
      TargetDirAnnotation("Verilog"))
  )
}

