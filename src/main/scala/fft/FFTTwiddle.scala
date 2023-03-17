package fft

import chisel3._
import chisel3.util._
import scala.math._
import chisel3.experimental.FixedPoint

class FFTTwiddle extends RawModule with DataConfig{
    val io = IO(new Bundle {
        val nk = Input(UInt((addrWidth + 1).W))
        val twiLutCaseIndex = Input(UInt((addrWidth + 1).W))
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
   
    val twi_cos_tb1_p10_pre = cosGen(fftLength / 2)
    val twi_sin_tb1_p10_pre = sinGen(fftLength / 2)

    val twi_cos_tb1_p10 = VecInit(twi_cos_tb1_p10_pre ++ Seq.fill(fftLength / 2 - 1)(FixedPoint(0, (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP)))
    val twi_sin_tb1_p10 = VecInit(twi_sin_tb1_p10_pre ++ Seq.fill(fftLength / 2 - 1)(FixedPoint(0, (twiddleDataWidth + 2).W, (twiddleDataWidth + 0).BP)))

    val idx_r = Mux((io.nk(addrWidth - 1) & io.nk(addrWidth - 1 - 1, 0).orR), (~io.nk + 1.U), io.nk)
    
    val lut_chg_sign_flag_r = io.nk(addrWidth - 1) & (io.nk(addrWidth - 1 - 1, 0).orR)

    val lut_w_r = twi_cos_tb1_p10(idx_r)

    val idx_i = idx_r(addrWidth - 1, 0)

    val lut_chg_sign_flag_i = true.B

    val lut_w_i = twi_sin_tb1_p10(idx_i)

    val chg_sign_flag_r = Mux((io.twiLutCaseIndex === 2.U), !lut_chg_sign_flag_r, lut_chg_sign_flag_r)
    val chg_sign_flag_i = Mux((io.twiLutCaseIndex === 1.U), !lut_chg_sign_flag_i, lut_chg_sign_flag_i)

    io.wR := Mux(chg_sign_flag_r, -lut_w_r, lut_w_r)
    io.wI := Mux(chg_sign_flag_i, -lut_w_i, lut_w_i)
}
