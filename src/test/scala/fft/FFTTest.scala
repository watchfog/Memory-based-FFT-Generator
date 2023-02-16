import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import fft._
import scala.math._
import chisel3.util.log2Ceil
import chiseltest.simulator.WriteVcdAnnotation

class FFTEngineTest extends AnyFlatSpec with ChiselScalatestTester with DataConfig {
    val OutputDataFlow = false
    behavior of "FFTEngine"
    it should "calculate CFFT" in {
        test(new FFTEngine).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            //initialize
            for(i <- 0 to stageCnt by 1) {
                dut.io.fftRShiftP0(i).poke(false.B)
            }
            for(i <- 0 to 1 by 1) {
                dut.io.fftRShiftP1(i).poke(false.B)
            }
            dut.io.fftMode.poke(0.U) //calculate fft
            for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                dut.io.readDataSram0Bank(i).poke(0.U)
                dut.io.readDataSram1Bank(i).poke(0.U)
            }
            dut.io.fftEngineKick.poke(false.B)

            // dut.io.fftRShiftP0(1).poke(true.B)
            // dut.io.fftRShiftP0(3).poke(true.B)
            dut.clock.step()

            //kick
            dut.io.fftEngineKick.poke(true.B)
            dut.clock.step()
            dut.io.fftEngineKick.poke(false.B)

            //initialize sram
            var sram0bank = Array.ofDim[UInt](pow(2, parallelCnt).toInt, fftLength / pow(2, parallelCnt).toInt)
            var sram1bank = Array.ofDim[UInt](pow(2, parallelCnt).toInt, fftLength / pow(2, parallelCnt).toInt)
            var fftRefIn = new Array[Complex](fftLength)
            var fftRefOut = new Array[Complex](fftLength)

            def signalGenerator(n: Int): UInt = {
                val t: Double = n * 2.0 * Pi / fftLength.toDouble
                var temp = (1 * sin(t*4) + 1 * cos(t*4) + 2) * pow(2, 4)
                var tempU = round(temp.abs).U(32.W)
                fftRefIn(n) = new Complex(temp, 0)
                tempU
            }

            var bankSel = 0
            var bankAddr = 0
            var radixSum: Int = 0
            var radix: Int = 0
            for(radix <- 0 until fftLength) {
                // println(radix)
                for(i <- 0 until (addrWidth.toFloat / parallelCnt.toFloat).ceil.toInt){
                    radixSum += (radix & ((pow(2, parallelCnt).toInt - 1) << (i * parallelCnt))) >> (i * parallelCnt)
                    // println(s"$i")
                }
                bankSel = radixSum & (pow(2, parallelCnt).toInt - 1)
                bankAddr = radix & (pow(2, addrWidth - parallelCnt).toInt - 1)
                // println(s"radix:$radix $bankSel $bankAddr")
                sram0bank(bankSel)(bankAddr) = signalGenerator(radix)
                radixSum = 0
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

            fftRefOut = myfft(fftRefIn)
            var addrTemp = new Array[UInt](pow(2, parallelCnt).toInt)
            for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                addrTemp(i) = 0.U //initialize
            }

            def complexUInt2Complex(dataIn : UInt) : Complex = {
                var dataIPre = dataIn((fftDataWidth + 2) * 2 - 1, fftDataWidth + 2).litValue.toInt
                var dataRPre = dataIn(fftDataWidth + 1, 0).litValue.toInt
                var dataISign = dataIn((fftDataWidth + 2) * 2 - 1).litValue.toInt
                var dataRSign = dataIn(fftDataWidth + 1).litValue.toInt
                var dataI = if(dataISign == 1) dataIPre - pow(2, fftDataWidth + 2).toInt else dataIPre
                var dataR = if(dataRSign == 1) dataRPre - pow(2, fftDataWidth + 2).toInt else dataRPre
                new Complex(dataR, dataI)
            }
            
            //test addr
            for(phase <- 0 until log2Ceil(fftLength)) {
            // for(phase <- 0 until 1) {
                println("Phase" + phase)
                println("----------------------------")
                //first step, no valid input
                if(phase % 2 == 0) { //srcBuffer = 0
                    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                        if(OutputDataFlow) println("Wait for addr")
                        addrTemp(i) = dut.io.addrSram0Bank(i).peek()
                    }
                } else {
                    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                        if(OutputDataFlow) println("Wait for addr")
                        addrTemp(i) = dut.io.addrSram1Bank(i).peek()
                    }
                }
                if(OutputDataFlow) println("----------------------------")
                dut.clock.step()

                //no output
                for(radix <- 0 until 2) {
                    if(phase % 2 == 0) { //srcBuffer = 0
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            dut.io.readDataSram0Bank(i).poke(sram0bank(i)(addrTemp(i).litValue.toInt))
                            if(OutputDataFlow) println("Sram0 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow) println("Sram0 bank" + i + " data is " + complexUInt2Complex(sram0bank(i)(addrTemp(i).litValue.toInt)))
                            if(OutputDataFlow) println("Wait for data out")
                            addrTemp(i) = dut.io.addrSram0Bank(i).peek()
                        }
                    } else {
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            dut.io.readDataSram1Bank(i).poke(sram1bank(i)(addrTemp(i).litValue.toInt))
                            if(OutputDataFlow) println("Sram1 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow) println("Sram1 bank" + i + " data is " + complexUInt2Complex(sram1bank(i)(addrTemp(i).litValue.toInt)))
                            if(OutputDataFlow) println("Wait for data out")
                            addrTemp(i) = dut.io.addrSram1Bank(i).peek()
                        }
                    }
                    if(OutputDataFlow) println("----------------------------")
                    dut.clock.step()
                }
                //start output
                for(radix <- 3 to fftLength / pow(2, parallelCnt).toInt) {
                    if(phase % 2 == 0) { //srcbuffer = 0
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            dut.io.readDataSram0Bank(i).poke(sram0bank(i)(addrTemp(i).litValue.toInt)) //read data from sram0
                            if(OutputDataFlow) println("Sram0 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow) println("Sram0 bank" + i + " data is " + complexUInt2Complex(sram0bank(i)(addrTemp(i).litValue.toInt)))
                            addrTemp(i) = dut.io.addrSram0Bank(i).peek()
                        }
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            sram1bank(i)(dut.io.addrSram1Bank(i).peek().litValue.toInt) = dut.io.writeDataSram1Bank(i).peek() //write to sram1
                            if(OutputDataFlow) println("Sram1 bank" + i + " addr is " + dut.io.addrSram1Bank(i).peek())
                            if(OutputDataFlow) println("Sram1 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram1Bank(i).peek()))
                        }
                    } else {
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            dut.io.readDataSram1Bank(i).poke(sram1bank(i)(addrTemp(i).litValue.toInt)) //read data from sram1
                            if(OutputDataFlow) println("Sram1 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow) println("Sram1 bank" + i + " data is " + complexUInt2Complex(sram1bank(i)(addrTemp(i).litValue.toInt)))
                            addrTemp(i) = dut.io.addrSram1Bank(i).peek()
                        }
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            sram0bank(i)(dut.io.addrSram0Bank(i).peek().litValue.toInt) = dut.io.writeDataSram0Bank(i).peek() //write to sram0
                            if(OutputDataFlow) println("Sram0 bank" + i + " addr is " + dut.io.addrSram0Bank(i).peek())
                            if(OutputDataFlow) println("Sram0 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram0Bank(i).peek()))
                        }
                    }
                    if(OutputDataFlow) println("----------------------------")
                    dut.clock.step()
                }
                //stop input
                for(radix <- 0 until 2) {
                    if(phase % 2 == 0) { //srcBuffer = 0
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(OutputDataFlow) println("No input now")
                            sram1bank(i)(dut.io.addrSram1Bank(i).peek().litValue.toInt) = dut.io.writeDataSram1Bank(i).peek()
                            if(OutputDataFlow) println("Sram1 bank" + i + " addr is " + dut.io.addrSram1Bank(i).peek())
                            if(OutputDataFlow) println("Sram1 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram1Bank(i).peek()))
                        }
                    } else {
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(OutputDataFlow) println("No input now")
                            sram0bank(i)(dut.io.addrSram0Bank(i).peek().litValue.toInt) = dut.io.writeDataSram0Bank(i).peek()
                            if(OutputDataFlow) println("Sram0 bank" + i + " addr is " + dut.io.addrSram0Bank(i).peek())
                            if(OutputDataFlow) println("Sram0 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram0Bank(i).peek()))
                        }
                    }
                    if(OutputDataFlow) println("----------------------------")
                    dut.clock.step()
                }
                dut.clock.step(2)
            }

            var fftDiffAbsSum = 0.0
            var fftCmSum = 0.0
            //output data
            for(radix <- 0 until fftLength) {
                var radixUInt = radix.U
                var radixReverse = (0 until addrWidth).fold(0)((x, y) => x * 2 + radixUInt(y).litValue.toInt)

                for(i <- 0 until (addrWidth.toFloat / parallelCnt.toFloat).ceil.toInt){
                    radixSum += (radixReverse & ((pow(2, parallelCnt).toInt - 1) << (i * parallelCnt))) >> (i * parallelCnt)
                }
                bankSel = radixSum & (pow(2, parallelCnt).toInt - 1)
                bankAddr = radixReverse & (pow(2, addrWidth - parallelCnt).toInt - 1)
                radixSum = 0

                var sramData = 0.U
                if(stageCnt % 2 == 1) {
                    sramData = sram0bank(bankSel)(bankAddr)
                } else {
                    sramData = sram1bank(bankSel)(bankAddr)
                }

                if(radix <= fftLength / 2) {
                    var fftOut = complexUInt2Complex(sramData)
                    var fftDiffAbsR = (fftOut.re - fftRefOut(radix).re).abs
                    var fftDiffAbsI = (fftOut.im - fftRefOut(radix).im).abs
                    var fftCmR = fftOut.re + fftRefOut(radix).re
                    var fftCmI = fftOut.im + fftRefOut(radix).im
                    fftDiffAbsSum = fftDiffAbsSum + fftDiffAbsR + fftDiffAbsI
                    fftCmSum = fftCmSum + fftCmR + fftCmI
                }

                println(s"$radix: " + complexUInt2Complex(sramData))
                println(s"Ref: "  + fftRefOut(radix))
            }
            var smape = fftDiffAbsSum / fftCmSum * 100
            println("SMAPE: " + smape + "%")
        }
    }
}

class Complex(val re: Double, val im: Double) {
  def +(rhs: Complex) = new Complex(re + rhs.re, im + rhs.im)
  def -(rhs: Complex) = new Complex(re - rhs.re, im - rhs.im)
  def *(rhs: Complex) = new Complex(re * rhs.re - im * rhs.im, rhs.re * im + re * rhs.im)

  def magnitude = Math.hypot(re, im)
  def phase = Math.atan2(im, re)

  override def toString = {
    val rePre = s"${round(re)} "
    val imPre = if(im < 0) s"- ${round(im.abs)}i" else s"+ ${round(im)}i"
    rePre + imPre
  }
}
