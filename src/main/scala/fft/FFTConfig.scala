package fft

import chisel3.util.log2Ceil
import scala.math._

trait DataConfig{
    val needProc = true //need Proc stage and twiddle LUT for RFFT/HSIFFT
    val fftLength = 128 //must be 2^n and greater than 8
    val fftDataWidth = 14 //only tested 14 and above, thought it will work
    val twiddleDataWidth = 12 //tested 14 and 12, thought it will work
    val parallelCnt = 1 //2^(parallelCnt - 1) calc units only 1-4 was implemented
    val addrWidth = log2Ceil(fftLength) //how many bits is addr
    val stageCnt = addrWidth - 1 // how many stage
    val midBankSel = pow(2, parallelCnt - 1).toInt //parameter for RFFT
}



