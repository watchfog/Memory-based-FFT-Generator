package fft

import chisel3.util.log2Ceil

trait DataConfig{
    val fftLength = 16
    val fftDataWidth = 14
    val parallelCnt = 1
    val addrWidth = log2Ceil(fftLength)
    val stageCnt = addrWidth - 1
}
