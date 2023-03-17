package fft

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.math._
import chisel3.util.log2Ceil
import chiseltest.simulator.WriteVcdAnnotation
import chiseltest.simulator.VerilatorBackendAnnotation
import chisel3.experimental.FixedPoint

class FFTR23Test extends AnyFreeSpec with ChiselScalatestTester with DataConfig {
    val OutputDataFlow = false

    def complexUInt2Complex(dataIn : UInt) : Complex = {
        var dataIPre = dataIn((fftDataWidth + 2) * 2 - 1, fftDataWidth + 2).litValue.toInt
        var dataRPre = dataIn(fftDataWidth + 1, 0).litValue.toInt
        var dataISign = dataIn((fftDataWidth + 2) * 2 - 1).litValue.toInt
        var dataRSign = dataIn(fftDataWidth + 1).litValue.toInt
        var dataI = if(dataISign == 1) dataIPre - pow(2, fftDataWidth + 2).toInt else dataIPre
        var dataR = if(dataRSign == 1) dataRPre - pow(2, fftDataWidth + 2).toInt else dataRPre
        new Complex(dataR, dataI)
    }

    def myfft(x: Array[Complex]): Array[Complex] = {
        require(x.length > 0 && (x.length & (x.length - 1)) == 0, "array size should be power of two")
        myfftP(x, 0, x.length, 1)
    }

    def myfftP(x: Array[Complex], start: Int, n: Int, stride: Int) : Array[Complex] = {
        if (n == 1)
        return Array(x(start))

        val X = myfftP(x, start, n / 2, 2 * stride) ++ myfftP(x, start + stride, n / 2, 2 * stride)

        for (k <- 0 until n / 2) {
        val t = X(k)
        val arg = -2 * math.Pi * k / n
        val c = new Complex(math.cos(arg), math.sin(arg)) * X(k + n / 2)
        X(k) = t + c
        X(k + n / 2) = t - c
        }
        X
    }

    def getBitsReverse(n: Int): Int = n match{
        case 0 => 0
        case 1 => 4
        case 2 => 2
        case 3 => 6
        case 4 => 1
        case 5 => 5
        case 6 => 3
        case 7 => 7
        case _ => 0
    }
    "R23FFT should calculate 8-point FFT in 3 cycles" in {
         test(new FFT3PipelineR23Calc).withAnnotations(Seq(WriteVcdAnnotation, VerilatorBackendAnnotation)) { dut =>
            var fftRefIn = new Array[Complex](fftLength)
            var fftRefOut = new Array[Complex](fftLength)
            Seq.tabulate(8) { i =>
                fftRefIn(i) = new Complex(sin(i * 3 * Pi / 8) * 256, 0)
                dut.io.dataIn(i).re.poke(FixedPoint.fromDouble(sin(i * 3 * Pi / 8) / 128, (fftDataWidth + 2).W, (fftDataWidth + 1).BP))
                dut.io.dataIn(i).im.poke(FixedPoint.fromDouble(0, (fftDataWidth + 2).W, (fftDataWidth + 1).BP))
            }
            // dut.io.twiLutIdx.poke(0.U)
            dut.io.calcMode.poke(3.U)
            dut.io.rShiftSym.poke(false.B)
            dut.io.isFFT.poke(true.B)
            dut.io.procMode.poke(false.B)
            dut.io.state1c.poke(true.B)
            dut.io.state2c.poke(true.B)

            dut.clock.step(5)

            fftRefOut = myfft(fftRefIn)
            Seq.tabulate(8) { i =>
                println(s"${i}: "  + complexUInt2Complex(dut.io.dataOut3c(getBitsReverse(i)).peek().litValue.U))
                println(s"Ref: "  + fftRefOut(i))
            }
        }
    }
}