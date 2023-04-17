package fft

import chisel3._
import chisel3.util._
import scala.math._
import chisel3.experimental.FixedPoint

class FFTTwiddle(mode: Int) extends RawModule with DataConfig{ //0 for proc
    val io = IO(new Bundle {
        val nk = Input(UInt((addrWidth + 1 - mode).W))
        val twiLutCaseIndex = Input(UInt(2.W))
        val wR = Output(FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP))
        val wI = Output(FixedPoint((twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP))
    })

    def cosGen(k: Int): Seq[FixedPoint] = {
        val times = (0 to k by 1)
            .map(i => (i * Pi) / (2 * k).toDouble)
        val inits = times.map(t => FixedPoint.fromDouble(cos(t), (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP))
        inits
    }

    def sinGen(k: Int): Seq[FixedPoint] = {
        val times = (0 to k by 1)
            .map(i => (i * Pi) / (2 * k).toDouble)
        val inits = times.map(t => FixedPoint.fromDouble(sin(t), (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP))
        inits
    }

    val twiCosTable = VecInit(cosGen(fftLength / (if(mode == 0) 2 else 4)))
    val twiSinTable = VecInit(sinGen(fftLength / (if(mode == 0) 2 else 4)))

    val indexRPre = Mux(io.nk(addrWidth - mode), (~io.nk + 1.U), io.nk)(addrWidth - mode - 1, 0)

    val indexR = Mux((indexRPre(addrWidth - mode - 1) & indexRPre(addrWidth - mode - 2, 0).orR), (~indexRPre + 1.U), indexRPre)(addrWidth - mode - 1, 0)
    
    val lutSignFlagR = indexRPre(addrWidth - mode - 1) & indexRPre(addrWidth - mode - 2, 0).orR

    val lutWR = twi_cos_tb1_p10(idx_r)

    val indexI = idx_r(addrWidth - mode - 1, 0)

    val lutSignFlagI = !io.nk(addrWidth - mode)

    val lutWI = twi_sin_tb1_p10(indexI)

    val signFlagR = Mux((io.twiLutCaseIndex === 2.U), !lutSignFlagR, lutSignFlagR)
    val signFlagI = Mux((io.twiLutCaseIndex === 1.U), !lutSignFlagI, lutSignFlagI)

    io.wR := Mux(signFlagR, -lutWR, lutWR)
    io.wI := Mux(signFlagI, -lutWI, lutWI)
}