package fft

import chisel3.util.log2Ceil
import scala.math._

trait DataConfig{
    val needProc = true
    val fftLength = 128
    val fftDataWidth = 14
    val twiddleDataWidth = 12
    val parallelCnt = 1
    val addrWidth = log2Ceil(fftLength)
    val stageCnt = addrWidth - 1
    val midBankSel = pow(2, parallelCnt - 1).toInt
}
