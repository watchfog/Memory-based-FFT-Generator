package fft

import chisel3.util.log2Ceil
import scala.math._

trait DataConfig{
    val needProc = true //need Proc stage and twiddle LUT for RFFT/HSIFFT
    val fftLength = 128 //must be 2^n and greater than 8
    val fftDataWidth = 14 //only tested 14 and above, thought it will work
    val twiddleDataWidth = 12 //tested 14 and 12, thought it will work
    val parallelCnt = 3 //2^(parallelCnt - 1) calc units, in case this is r-2^3, take 8 data in like 4 r-2 calc units, parallelCnt is 3
    val addrWidth = log2Ceil(fftLength) //how many bits is addr
    val stageCnt = (addrWidth / 3.0).ceil.round.toInt - 1 // how many stage, r-2^3 need to / 3
    val lastStageMode = if(addrWidth % 3 == 0) 3 else addrWidth % 3 //using r2 r2^2 or r2^3 for last stage in r-2^3 FFT
    val midBankSel = pow(2, parallelCnt - 1).toInt //parameter for RFFT
}
