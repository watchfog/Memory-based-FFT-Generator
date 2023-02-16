package fft

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.math._
import chisel3.util.log2Ceil
import chiseltest.simulator.WriteVcdAnnotation

class FFTEngineTest extends AnyFreeSpec with ChiselScalatestTester with DataConfig {
    val OutputDataFlow = false
    "FFTEngine should calculate RFFT" in {
        test(new FFTEngine).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            //initialize
            for(i <- 0 to stageCnt by 1) {
                dut.io.fftRShiftP0(i).poke(false.B)
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
            var fftRefIn = new Array[Complex](fftLength * 2)
            var fftRefOut = new Array[Complex](fftLength * 2)
            // var fftRefIn = new Array[Complex](fftLength)
            // var fftRefOut = new Array[Complex](fftLength)

            def signalGenerator(n: Int): UInt = {
                val t: Double = n * 2.0 * Pi / fftLength.toDouble
                var temp1 = (1 * sin((t*2)*1) + 1 * cos((t*2)*2) + 2) * pow(2, 6)
                var temp2 = (1 * sin((t*2+1)*1) + 1 * cos((t*2+1)*2) + 2) * pow(2, 6)
                var tempU = (1 * round(temp2.abs) * pow(2, 16) + 1 * round(temp1.abs)).toLong.asUInt
                fftRefIn(2 * n) = new Complex(temp1, 0)
                fftRefIn(2 * n + 1) = new Complex(temp2, 0)
                // fftRefIn(n) = new Complex(temp1, temp2)
                // fftRefIn(n) = new Complex(0, temp1)
                tempU
            }

            var bankSel = 0
            var bankAddr = 0
            var radixSum: Int = 0
            var radix: Int = 0
            for(radix <- 0 until fftLength) {
                for(i <- 0 until (addrWidth.toFloat / parallelCnt.toFloat).ceil.toInt){
                    radixSum += (radix & ((pow(2, parallelCnt).toInt - 1) << (i * parallelCnt))) >> (i * parallelCnt)
                }
                bankSel = radixSum & (pow(2, parallelCnt).toInt - 1)
                bankAddr = radix & (pow(2, addrWidth - parallelCnt).toInt - 1)
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

            var rd0En = new Array[Boolean](pow(2, parallelCnt).toInt)
            for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                rd0En(i) = false //initialize
            }

            var rd1En = new Array[Boolean](pow(2, parallelCnt).toInt)
            for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                rd1En(i) = false //initialize
            }

            var wr0En = new Array[Boolean](pow(2, parallelCnt).toInt)
            for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                wr0En(i) = false //initialize
            }

            var wr1En = new Array[Boolean](pow(2, parallelCnt).toInt)
            for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                wr1En(i) = false //initialize
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
            
            for(phase <- 0 until log2Ceil(fftLength)) {
                println("KernelPhase" + phase)
                println("----------------------------")
                //first step, no valid input
                if(phase % 2 == 0) { //srcBuffer = 0
                    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                        if(OutputDataFlow) println("Wait for addr")
                        addrTemp(i) = dut.io.addrSram0Bank(i).peek()
                        rd0En(i) = dut.io.readEnableSram0Bank(i).peek().litValue.toInt == 1
                    }
                } else {
                    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                        if(OutputDataFlow) println("Wait for addr")
                        addrTemp(i) = dut.io.addrSram1Bank(i).peek()
                        rd1En(i) = dut.io.readEnableSram1Bank(i).peek().litValue.toInt == 1
                    }
                }
                if(OutputDataFlow) println("----------------------------")
                dut.clock.step()

                //no output
                for(radix <- 0 until 2) {
                    if(phase % 2 == 0) { //srcBuffer = 0
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(rd0En(i)) dut.io.readDataSram0Bank(i).poke(sram0bank(i)(addrTemp(i).litValue.toInt))
                            if(OutputDataFlow) println("Sram0 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow) println("Sram0 bank" + i + " data is " + complexUInt2Complex(sram0bank(i)(addrTemp(i).litValue.toInt)))
                            if(OutputDataFlow) println("Wait for data out")
                            addrTemp(i) = dut.io.addrSram0Bank(i).peek()
                            rd0En(i) = dut.io.readEnableSram0Bank(i).peek().litValue.toInt == 1
                        }
                    } else {
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(rd1En(i)) dut.io.readDataSram1Bank(i).poke(sram1bank(i)(addrTemp(i).litValue.toInt))
                            if(OutputDataFlow) println("Sram1 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow) println("Sram1 bank" + i + " data is " + complexUInt2Complex(sram1bank(i)(addrTemp(i).litValue.toInt)))
                            if(OutputDataFlow) println("Wait for data out")
                            addrTemp(i) = dut.io.addrSram1Bank(i).peek()
                            rd1En(i) = dut.io.readEnableSram1Bank(i).peek().litValue.toInt == 1
                        }
                    }
                    if(OutputDataFlow) println("----------------------------")
                    dut.clock.step()
                }
                //start output
                for(radix <- 3 to fftLength / pow(2, parallelCnt).toInt) {
                    if(phase % 2 == 0) { //srcbuffer = 0
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            wr1En(i) = dut.io.writeEnableSram1Bank(i).peek().litValue.toInt == 1
                            if(rd0En(i)) dut.io.readDataSram0Bank(i).poke(sram0bank(i)(addrTemp(i).litValue.toInt)) //read data from sram0
                            if(OutputDataFlow) println("Sram0 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow) println("Sram0 bank" + i + " data is " + complexUInt2Complex(sram0bank(i)(addrTemp(i).litValue.toInt)))
                            addrTemp(i) = dut.io.addrSram0Bank(i).peek()
                            rd0En(i) = dut.io.readEnableSram0Bank(i).peek().litValue.toInt == 1
                        }
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(wr1En(i)) sram1bank(i)(dut.io.addrSram1Bank(i).peek().litValue.toInt) = dut.io.writeDataSram1Bank(i).peek() //write to sram1
                            if(OutputDataFlow) println("Sram1 bank" + i + " addr is " + dut.io.addrSram1Bank(i).peek())
                            if(OutputDataFlow) println("Sram1 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram1Bank(i).peek()))
                        }
                    } else {
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            wr0En(i) = dut.io.writeEnableSram0Bank(i).peek().litValue.toInt == 1
                            if(rd1En(i)) dut.io.readDataSram1Bank(i).poke(sram1bank(i)(addrTemp(i).litValue.toInt)) //read data from sram1
                            if(OutputDataFlow) println("Sram1 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow) println("Sram1 bank" + i + " data is " + complexUInt2Complex(sram1bank(i)(addrTemp(i).litValue.toInt)))
                            addrTemp(i) = dut.io.addrSram1Bank(i).peek()
                            rd1En(i) = dut.io.readEnableSram1Bank(i).peek().litValue.toInt == 1
                        }
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(wr0En(i)) sram0bank(i)(dut.io.addrSram0Bank(i).peek().litValue.toInt) = dut.io.writeDataSram0Bank(i).peek() //write to sram0
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
                            wr1En(i) = dut.io.writeEnableSram1Bank(i).peek().litValue.toInt == 1
                            if(OutputDataFlow) println("No input now")
                            if(wr1En(i)) sram1bank(i)(dut.io.addrSram1Bank(i).peek().litValue.toInt) = dut.io.writeDataSram1Bank(i).peek()
                            if(OutputDataFlow) println("Sram1 bank" + i + " addr is " + dut.io.addrSram1Bank(i).peek())
                            if(OutputDataFlow) println("Sram1 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram1Bank(i).peek()))
                        }
                    } else {
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            wr0En(i) = dut.io.writeEnableSram0Bank(i).peek().litValue.toInt == 1
                            if(OutputDataFlow) println("No input now")
                            if(wr0En(i)) sram0bank(i)(dut.io.addrSram0Bank(i).peek().litValue.toInt) = dut.io.writeDataSram0Bank(i).peek()
                            if(OutputDataFlow) println("Sram0 bank" + i + " addr is " + dut.io.addrSram0Bank(i).peek())
                            if(OutputDataFlow) println("Sram0 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram0Bank(i).peek()))
                        }
                    }
                    if(OutputDataFlow) println("----------------------------")
                    dut.clock.step()
                }
                dut.clock.step(2)
            }

            for(phase <- 0 until 2) {
                println("ProcPhase" + phase)
                println("----------------------------")
                //first step, no valid input
                if((phase + log2Ceil(fftLength)) % 2 == 0) { //srcBuffer = 0
                    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                        if(OutputDataFlow) println("Wait for addr")
                        addrTemp(i) = dut.io.addrSram0Bank(i).peek()
                        rd0En(i) = dut.io.readEnableSram0Bank(i).peek().litValue.toInt == 1
                    }
                } else {
                    for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                        if(OutputDataFlow) println("Wait for addr")
                        addrTemp(i) = dut.io.addrSram1Bank(i).peek()
                        rd1En(i) = dut.io.readEnableSram1Bank(i).peek().litValue.toInt == 1
                    }
                }
                if(OutputDataFlow) println("----------------------------")
                dut.clock.step()

                //no output
                for(radix <- 0 until 2) {
                    if((phase + log2Ceil(fftLength)) % 2 == 0) { //srcBuffer = 0
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(rd0En(i)) dut.io.readDataSram0Bank(i).poke(sram0bank(i)(addrTemp(i).litValue.toInt))
                            if(OutputDataFlow && rd0En(i)) println("Sram0 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow && rd0En(i)) println("Sram0 bank" + i + " data is " + complexUInt2Complex(sram0bank(i)(addrTemp(i).litValue.toInt)))
                            if(OutputDataFlow && rd0En(i)) println("Wait for data out")
                            addrTemp(i) = dut.io.addrSram0Bank(i).peek()
                            rd0En(i) = dut.io.readEnableSram0Bank(i).peek().litValue.toInt == 1
                        }
                    } else {
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(rd1En(i)) dut.io.readDataSram1Bank(i).poke(sram1bank(i)(addrTemp(i).litValue.toInt))
                            if(OutputDataFlow && rd1En(i)) println("Sram1 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow && rd1En(i)) println("Sram1 bank" + i + " data is " + complexUInt2Complex(sram1bank(i)(addrTemp(i).litValue.toInt)))
                            if(OutputDataFlow && rd1En(i)) println("Wait for data out")
                            addrTemp(i) = dut.io.addrSram1Bank(i).peek()
                            rd1En(i) = dut.io.readEnableSram1Bank(i).peek().litValue.toInt == 1
                        }
                    }
                    if(OutputDataFlow) println("----------------------------")
                    dut.clock.step()
                }
                //start output
                for(radix <- 3 to fftLength / 2) {
                    if((phase + log2Ceil(fftLength)) % 2 == 0) { //srcbuffer = 0
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            wr1En(i) = dut.io.writeEnableSram1Bank(i).peek().litValue.toInt == 1
                            if(rd0En(i)) dut.io.readDataSram0Bank(i).poke(sram0bank(i)(addrTemp(i).litValue.toInt)) //read data from sram0
                            if(OutputDataFlow && rd0En(i)) println("Sram0 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow && rd0En(i)) println("Sram0 bank" + i + " data is " + complexUInt2Complex(sram0bank(i)(addrTemp(i).litValue.toInt)))
                            addrTemp(i) = dut.io.addrSram0Bank(i).peek()
                            rd0En(i) = dut.io.readEnableSram0Bank(i).peek().litValue.toInt == 1
                        }
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(wr1En(i)) sram1bank(i)(dut.io.addrSram1Bank(i).peek().litValue.toInt) = dut.io.writeDataSram1Bank(i).peek() //write to sram1
                            if(OutputDataFlow && wr1En(i)) println("Sram1 bank" + i + " addr is " + dut.io.addrSram1Bank(i).peek())
                            if(OutputDataFlow && wr1En(i)) println("Sram1 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram1Bank(i).peek()))
                        }
                    } else {
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            wr0En(i) = dut.io.writeEnableSram0Bank(i).peek().litValue.toInt == 1
                            if(rd1En(i)) dut.io.readDataSram1Bank(i).poke(sram1bank(i)(addrTemp(i).litValue.toInt)) //read data from sram1
                            if(OutputDataFlow && rd1En(i)) println("Sram1 bank" + i + " addr is " + addrTemp(i))
                            if(OutputDataFlow && rd1En(i)) println("Sram1 bank" + i + " data is " + complexUInt2Complex(sram1bank(i)(addrTemp(i).litValue.toInt)))
                            addrTemp(i) = dut.io.addrSram1Bank(i).peek()
                            rd1En(i) = dut.io.readEnableSram1Bank(i).peek().litValue.toInt == 1
                        }
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            if(wr0En(i)) sram0bank(i)(dut.io.addrSram0Bank(i).peek().litValue.toInt) = dut.io.writeDataSram0Bank(i).peek() //write to sram0
                            if(OutputDataFlow && wr0En(i)) println("Sram0 bank" + i + " addr is " + dut.io.addrSram0Bank(i).peek())
                            if(OutputDataFlow && wr0En(i)) println("Sram0 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram0Bank(i).peek()))
                        }
                    }
                    if(OutputDataFlow) println("----------------------------")
                    dut.clock.step()
                }
                //stop input
                for(radix <- 0 until 2) {
                    if((phase + log2Ceil(fftLength)) % 2 == 0) { //srcBuffer = 0
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            wr1En(i) = dut.io.writeEnableSram1Bank(i).peek().litValue.toInt == 1
                            if(OutputDataFlow && wr1En(i)) println("No input now")
                            if(wr1En(i)) sram1bank(i)(dut.io.addrSram1Bank(i).peek().litValue.toInt) = dut.io.writeDataSram1Bank(i).peek()
                            if(OutputDataFlow && wr1En(i)) println("Sram1 bank" + i + " addr is " + dut.io.addrSram1Bank(i).peek())
                            if(OutputDataFlow && wr1En(i)) println("Sram1 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram1Bank(i).peek()))
                        }
                    } else {
                        for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                            wr0En(i) = dut.io.writeEnableSram0Bank(i).peek().litValue.toInt == 1
                            if(OutputDataFlow && wr0En(i)) println("No input now")
                            if(wr0En(i)) sram0bank(i)(dut.io.addrSram0Bank(i).peek().litValue.toInt) = dut.io.writeDataSram0Bank(i).peek()
                            if(OutputDataFlow && wr0En(i)) println("Sram0 bank" + i + " addr is " + dut.io.addrSram0Bank(i).peek())
                            if(OutputDataFlow && wr0En(i)) println("Sram0 bank" + i + " data is " + complexUInt2Complex(dut.io.writeDataSram0Bank(i).peek()))
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
                var radixUIntReverse = radixReverse.U

                radixSum = (0 until parallelCnt).fold(0)((x, y) => x * 2 + (radixUIntReverse(y).litValue.toInt + radixUIntReverse(addrWidth - 1 -y).litValue.toInt) % 2)

                bankSel = radixSum & (pow(2, parallelCnt).toInt - 1)
                bankAddr = radixReverse & (pow(2, addrWidth - parallelCnt).toInt - 1)
                radixSum = 0
                // println(s"$bankSel $bankAddr")
                var sramData = 0.U
                if(stageCnt % 2 == 1) {
                    sramData = sram0bank(bankSel)(bankAddr)
                } else {
                    sramData = sram1bank(bankSel)(bankAddr)
                }

                var fftOut = complexUInt2Complex(sramData)
                var fftDiffAbsR = (fftOut.re - fftRefOut(radix).re).abs
                var fftDiffAbsI = (fftOut.im - fftRefOut(radix).im).abs
                var fftCmR = fftOut.re + fftRefOut(radix).re
                var fftCmI = fftOut.im + fftRefOut(radix).im
                fftDiffAbsSum = fftDiffAbsSum + fftDiffAbsR + fftDiffAbsI
                fftCmSum = fftCmSum + fftCmR + fftCmI

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
