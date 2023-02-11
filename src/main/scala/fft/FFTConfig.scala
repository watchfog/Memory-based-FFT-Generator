package fft

import chisel3.util.log2Ceil

trait DataConfig{
    val fftLength = 256
    val fftDataWidth = 14
    val parallelCnt = 3
    val addrWidth = log2Ceil(fftLength)
    val stageCnt = addrWidth - 1
}
