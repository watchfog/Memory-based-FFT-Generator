package fft

import chisel3._
import chisel3.util._
import scala.math._
import chisel3.experimental.FixedPoint

class FFTTwiddle extends RawModule with DataConfig{
    val io = IO(new Bundle {
        val nk = Input(UInt((addrWidth + 1).W))
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
   
    val twi_cos_tb1_p10_pre = cosGen(fftLength / 2)
    val twi_sin_tb1_p10_pre = sinGen(fftLength / 2)

    val twi_cos_tb1_p10 = VecInit(twi_cos_tb1_p10_pre)
    val twi_sin_tb1_p10 = VecInit(twi_sin_tb1_p10_pre)

    val idx_r_pre = Mux(io.nk(addrWidth), (~io.nk + 1.U), io.nk)(addrWidth - 1, 0)

    val idx_r = Mux((idx_r_pre(addrWidth - 1) & idx_r_pre(addrWidth - 2, 0).orR), (~idx_r_pre + 1.U), idx_r_pre)(addrWidth - 1, 0)
    
    val lut_chg_sign_flag_r = idx_r_pre(addrWidth - 1) & idx_r_pre(addrWidth - 2, 0).orR

    val lut_w_r = twi_cos_tb1_p10(idx_r)

    val idx_i = idx_r(addrWidth - 1, 0)

    val lut_chg_sign_flag_i = !io.nk(addrWidth)

    val lut_w_i = twi_sin_tb1_p10(idx_i)

    val chg_sign_flag_r = Mux((io.twiLutCaseIndex === 2.U), !lut_chg_sign_flag_r, lut_chg_sign_flag_r)
    val chg_sign_flag_i = Mux((io.twiLutCaseIndex === 1.U), !lut_chg_sign_flag_i, lut_chg_sign_flag_i)

    io.wR := Mux(chg_sign_flag_r, -lut_w_r, lut_w_r)
    io.wI := Mux(chg_sign_flag_i, -lut_w_i, lut_w_i)
}
