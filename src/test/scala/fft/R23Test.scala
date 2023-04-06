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
            var fftRefIn = new Array[Complex](8)
            var fftRefOut = new Array[Complex](8)
            Seq.tabulate(8) { i =>
                fftRefIn(i) = new Complex(sin(i * 4 * Pi / 8) * 256, 0)
                dut.io.dataIn(i).re.poke(FixedPoint.fromDouble(sin(i * 4 * Pi / 8) / 128, (fftDataWidth + 2).W, (fftDataWidth + 1).BP))
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
    
    "FFTEngine with R23 should calculate CFFT" in {
        test(new FFTEngine).withAnnotations(Seq(WriteVcdAnnotation, VerilatorBackendAnnotation)) { dut =>
            //initialize
            for(i <- 0 to stageCnt by 1) {
                dut.io.fftRShiftP0(i).poke(false.B)
            }
            dut.io.fftMode.poke(true.B) //calculate fft
            for(i <- 0 until pow(2, parallelCnt).toInt by 1) {
                dut.io.readDataSram0Bank(i).poke(0.U)
                dut.io.readDataSram1Bank(i).poke(0.U)
            }
            dut.io.fftEngineKick.poke(false.B)

            dut.io.fftRShiftP0(1).poke(true.B)
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
            var fftRefInS1 = new Array[Complex](fftLength)
            var fftRefInS2 = new Array[Complex](fftLength)
            var fftRefInS3 = new Array[Complex](fftLength)
            var fftRefOut = new Array[Complex](fftLength * 2)
            var temp1 = new Array[Complex](8)
            var temp2 = new Array[Complex](8)
            var temp3 = new Array[Complex](8)

            def getWNK(k: Int, n: Int): Complex = {
                val arg = -2 * math.Pi * k / n
                val wnk = new Complex(math.cos(arg), math.sin(arg))
                wnk
            }

            def signalGenerator(n: Int): UInt = {
                val n1 = 2 * n
                val n2 = 2 * n + 1
                val t1: Double = n1 * 2.0 * Pi / fftLength.toDouble
                val t2: Double = n2 * 2.0 * Pi / fftLength.toDouble
                var temp1 = (1 * sin(2 * t1) + 1 * cos(2 * t1) + 1 * sin(4 * t1) + 1 * cos(4 * t1) + 2) * pow(2, 6) * 1.1
                var temp2 = (1 * sin(2 * t2) + 1 * cos(2 * t2) + 1 * sin(4 * t2) + 1 * cos(4 * t2) + 2) * pow(2, 6) * 1.1
                var tempU = (1 * round(temp2.abs) * pow(2, fftDataWidth + 2) + 1 * round(temp1.abs)).toLong.asUInt
                fftRefIn(2 * n) = new Complex(temp1.abs, 0)
                fftRefIn(2 * n + 1) = new Complex(temp2.abs, 0)
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

            // Seq.tabulate(256) { i =>
            //     // if(i == 32) {
            //     //     Seq.tabulate(8) { j =>
            //     //         println(s"dataIn ${i + j * 256} ${fftRefIn(i + j * 256)}")
            //     //     }
            //     // }
            //     Seq.tabulate(4) { j =>
            //         temp1(j) = fftRefIn(i + j * 256) + fftRefIn(i + (j + 4) * 256)
            //         temp1(j + 4) = fftRefIn(i + j * 256) - fftRefIn(i + (j + 4) * 256)
            //     }
            //     temp1(6) *= new Complex(0, -1)
            //     temp1(7) *= new Complex(0, -1)
            //     // if(i == 32) {
            //     //     Seq.tabulate(8) { j =>
            //     //         println(s"data2c ${temp1(j)}")
            //     //     }
            //     // }
            //     Seq(0, 1, 4, 5).foreach { j =>
            //         temp2(j) = temp1(j) + temp1(j + 2)
            //         temp2(j + 2) = temp1(j) - temp1(j + 2)
            //     }
            //     temp2(3) *= new Complex(0, -1)
            //     temp2(5) *= getWNK(1, 8)
            //     temp2(7) *= getWNK(3, 8)
            //     // if(i == 32) {
            //     //     Seq.tabulate(8) { j =>
            //     //         println(s"data3c ${temp2(j)}")
            //     //     }
            //     // }
            //     Seq(0, 2, 4, 6).foreach { j =>
            //         temp3(j) = temp2(j) + temp2(j + 1)
            //         temp3(j + 1) = temp2(j) - temp2(j + 1)
            //     }
            //     // if(i == 32) {
            //     //     Seq.tabulate(8) { j =>
            //     //         println(s"dataOutPre ${temp3(j)}")
            //     //     }
            //     // }
            //     Seq.tabulate(8) { j =>
            //         temp3(j) *= getWNK(getBitsReverse(j) * i, 2048)
            //     }
            //     // if(i == 32) {
            //     //     Seq.tabulate(8) { j =>
            //     //         println(s"dataOut ${temp3(j)}")
            //     //     }
            //     // }
            //     Seq.tabulate(8) { j =>
            //         fftRefInS1(i + j * 256) = temp3(j)
            //     }
            // }

            // Seq.tabulate(32){ group =>
            //     Seq.tabulate(8) { i =>
            //         // if(group == 0 && i == 4) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"dataIn ${group + i * 256 + j * 32} ${fftRefInS1(group + i * 256 + j * 32)}")
            //         //     }
            //         // }
            //         Seq.tabulate(4) { j =>
            //             temp1(j) = fftRefInS1(group + i * 256 + j * 32) + fftRefInS1(group + i * 256 + (j + 4) * 32)
            //             temp1(j + 4) = fftRefInS1(group + i * 256 + j * 32) - fftRefInS1(group + i * 256 + (j + 4) * 32)
            //         }
            //         temp1(6) *= new Complex(0, -1)
            //         temp1(7) *= new Complex(0, -1)
            //         // if(group == 0 && i == 4) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"data2c ${temp1(j)}")
            //         //     }
            //         // }
            //         Seq(0, 1, 4, 5).foreach { j =>
            //             temp2(j) = temp1(j) + temp1(j + 2)
            //             temp2(j + 2) = temp1(j) - temp1(j + 2)
            //         }
            //         temp2(3) *= new Complex(0, -1)
            //         temp2(5) *= getWNK(1, 8)
            //         temp2(7) *= getWNK(3, 8)
            //         // if(group == 0 && i == 4) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"data3c ${temp2(j)}")
            //         //     }
            //         // }
            //         Seq(0, 2, 4, 6).foreach { j =>
            //             temp3(j) = temp2(j) + temp2(j + 1)
            //             temp3(j + 1) = temp2(j) - temp2(j + 1)
            //         }
            //         // if(group == 0 && i == 4) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"dataOutPre ${temp3(j)}")
            //         //     }
            //         // }
            //         Seq.tabulate(8) { j =>
            //             temp3(j) *= getWNK(getBitsReverse(j) * group, 256)
            //         }
            //         // if(group == 0 && i == 4) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"dataOut ${temp3(j)}")
            //         //     }
            //         // }
            //         Seq.tabulate(8) { j =>
            //             fftRefInS2(group + i * 256 + j * 32) = temp3(j)
            //         }
            //     }
            // }

            // Seq.tabulate(4){ group =>
            //     Seq.tabulate(64) { i =>
            //         // if(group == 0 && i == 55) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"dataIn ${group + i * 32 + j * 4} ${fftRefInS2(group + i * 32 + j * 4)}")
            //         //     }
            //         // }
            //         Seq.tabulate(4) { j =>
            //             temp1(j) = fftRefInS2(group + i * 32 + j * 4) + fftRefInS2(group + i * 32 + (j + 4) * 4)
            //             temp1(j + 4) = fftRefInS2(group + i * 32 + j * 4) - fftRefInS2(group + i * 32 + (j + 4) * 4)
            //         }
            //         temp1(6) *= new Complex(0, -1)
            //         temp1(7) *= new Complex(0, -1)
            //         // if(group == 0 && i == 55) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"data2c ${temp1(j)}")
            //         //     }
            //         // }
            //         Seq(0, 1, 4, 5).foreach { j =>
            //             temp2(j) = temp1(j) + temp1(j + 2)
            //             temp2(j + 2) = temp1(j) - temp1(j + 2)
            //         }
            //         temp2(3) *= new Complex(0, -1)
            //         temp2(5) *= getWNK(1, 8)
            //         temp2(7) *= getWNK(3, 8)
            //         // if(group == 0 && i == 55) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"data3c ${temp2(j)}")
            //         //     }
            //         // }
            //         Seq(0, 2, 4, 6).foreach { j =>
            //             temp3(j) = temp2(j) + temp2(j + 1)
            //             temp3(j + 1) = temp2(j) - temp2(j + 1)
            //         }
            //         // if(group == 0 && i == 55) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"dataOutPre ${temp3(j)}")
            //         //     }
            //         // }
            //         Seq.tabulate(8) { j =>
            //             temp3(j) *= getWNK(getBitsReverse(j) * group, 32)
            //         }
            //         // if(group == 0 && i == 55) {
            //         //     Seq.tabulate(8) { j =>
            //         //         println(s"dataOut ${temp3(j)}")
            //         //     }
            //         // }
            //         Seq.tabulate(8) { j =>
            //             fftRefInS3(group + i * 32 + j * 4) = temp3(j)
            //         }
            //     }
            // }

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
            
            for(phase <- 0 to stageCnt) {
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

                // if(phase == 2) {
                //     var radixSum = 0
                //     var sramData = 0.U
                //     var fftDiffAbsSum = 0.0
                //     var fftCmSum = 0.0
                //     for(radix <- 0 until fftLength) {
                //         for(i <- 0 until (addrWidth.toFloat / parallelCnt.toFloat).ceil.toInt){
                //             radixSum += (radix & ((pow(2, parallelCnt).toInt - 1) << (i * parallelCnt))) >> (i * parallelCnt)
                //         }
                //         val bankSel = radixSum & (pow(2, parallelCnt).toInt - 1)
                //         val bankAddr = radix & (pow(2, addrWidth - parallelCnt).toInt - 1)
                //         radixSum = 0
                //         sramData = sram1bank(bankSel)(bankAddr)
                //         var fftOut = complexUInt2Complex(sramData)
                //         var fftDiffAbsR = (fftOut.re - fftRefInS3(radix).re).abs
                //         var fftDiffAbsI = (fftOut.im - fftRefInS3(radix).im).abs
                //         var fftCmR = fftOut.re.abs + fftRefInS3(radix).re.abs
                //         var fftCmI = fftOut.im.abs + fftRefInS3(radix).im.abs
                //         fftDiffAbsSum = fftDiffAbsSum + fftDiffAbsR + fftDiffAbsI
                //         fftCmSum = fftCmSum + fftCmR + fftCmI 
                //         println(s"$radix: $fftOut")
                //         if(fftDiffAbsR + fftDiffAbsI > 20) println(s"error $radix: $fftOut")
                //         println(s"Ref: "  + fftRefInS3(radix))
                //     }
                //     var smape = fftDiffAbsSum / fftCmSum * 100
                //     println("SMAPE: " + smape + "%")
                // }
            }

            for(phase <- 0 until 2) {
                println("ProcPhase" + phase)
                println("----------------------------")
                //first step, no valid input
                if((phase + stageCnt + 1) % 2 == 0) { //srcBuffer = 0
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
                    if((phase + stageCnt + 1) % 2 == 0) { //srcBuffer = 0
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
                    if((phase + stageCnt + 1) % 2 == 0) { //srcbuffer = 0
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
                    if((phase + stageCnt + 1) % 2 == 0) { //srcBuffer = 0
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

            
            var fftDiffSquareSum = 0.0
            var fftRefSquareSum = 0.0
            //output data
            for(radix <- 1 until fftLength) {
                var radixUInt = radix.U
                var radixReverse = (0 until addrWidth).fold(0)((x, y) => x * 2 + radixUInt(y).litValue.toInt)
                var radixUIntReverse = radixReverse.U

                if(fftLength == 8){
                    radixSum = radixReverse
                } else if(fftLength == 16) {
                    radixSum = (radixUIntReverse(0).litValue.toInt + radixUIntReverse(3).litValue.toInt) % 2 * 4 + 
                            (radixUIntReverse(1).litValue.toInt + radixUIntReverse(2).litValue.toInt) % 2 * 2 + 
                            (radixUIntReverse(0).litValue.toInt + radixUIntReverse(2).litValue.toInt) % 2
                } else if(fftLength == 32) {
                    radixSum = (radixUIntReverse(0).litValue.toInt + radixUIntReverse(4).litValue.toInt) % 2 * 4 + 
                            (radixUIntReverse(1).litValue.toInt + radixUIntReverse(3).litValue.toInt) % 2 * 2 + 
                            radixUIntReverse(2).litValue.toInt
                } else {
                    radixSum = (0 until parallelCnt).fold(0)((x, y) => x * 2 + (radixUIntReverse(y).litValue.toInt + radixUIntReverse(addrWidth - 1 - y).litValue.toInt) % 2)
                }

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

                var fftOut = complexUInt2Complex(sramData) * new Complex(2, 0)
                // var fftDiffAbsR = (fftOut.re - fftRefOut(radix).re).abs
                // var fftDiffAbsI = (fftOut.im - fftRefOut(radix).im).abs
                // var fftCmR = fftOut.re.abs + fftRefOut(radix).re.abs
                // var fftCmI = fftOut.im.abs + fftRefOut(radix).im.abs
                // fftDiffAbsSum = fftDiffAbsSum + fftDiffAbsR + fftDiffAbsI
                // fftCmSum = fftCmSum + fftCmR + fftCmI 

                // println(s"$radix: " + fftOut)
                // println(s"Ref: "  + new Complex(fftRefOut(radix).re, fftRefOut(radix).im))

                var fftDiff = fftOut - fftRefOut(radix)
                fftDiffSquareSum = fftDiff.re * fftDiff.re + fftDiff.im * fftDiff.im + fftDiffSquareSum
                fftRefSquareSum = fftRefOut(radix).re * fftRefOut(radix).re + fftRefOut(radix).im * fftRefOut(radix).im + fftRefSquareSum

                println(s"$radix: " + fftOut)
                println(s"Ref: "  + fftRefOut(radix))
            }
            var sqnr = 10 * log10(fftRefSquareSum / fftDiffSquareSum)
            println(s"SQNR: $sqnr dB")
            // var smape = fftDiffAbsSum / fftCmSum * 100
            // println("SMAPE: " + smape + "%")
        }
    }
}