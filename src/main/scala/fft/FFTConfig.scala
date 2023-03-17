package fft

import chisel3.util.log2Ceil
import scala.math._

trait DataConfig{
    val fftLength = 8
    val fftDataWidth = 14
    val twiddleDataWidth = 12
    val parallelCnt = 3 // as it's radix-2^3
    val addrWidth = log2Ceil(fftLength)
    val stageCnt = if(addrWidth % 3 == 0) addrWidth / 3 else addrWidth / 3 + 1
    val midBankSel = pow(2, parallelCnt - 1).toInt
}
