package fft

import chisel3._
import chisel3.util._
import scala.math._

class FFTTwiddle extends RawModule with DataConfig{
    val io = IO(new Bundle {
        val nk = Input(UInt(addrWidth.W))
        val twiLutCaseIndex = Input(UInt(2.W))
        val wR = Output(UInt(12.W))
        val wI = Output(UInt(12.W))
    })

    def cosGen(k: Int): Seq[UInt] = {
        val times = (0 to k by 1)
            .map(i => (i * Pi) / (2 * k).toDouble)
        val inits = times.map(t => round(cos(t) * 1024).asUInt(12.W))
        inits
    }

    def sinGen(k: Int): Seq[UInt] = {
        val times = (0 to k by 1)
            .map(i => (i * Pi) / (2 * k).toDouble)
        val inits = times.map(t => round(sin(t) * 1024).asUInt(12.W))
        inits
    }
   
    val twi_cos_tb1_p10_pre = cosGen(fftLength / 2)
    val twi_sin_tb1_p10_pre = sinGen(fftLength / 2)

    val twi_cos_tb1_p10 = VecInit(twi_cos_tb1_p10_pre ++ Seq.fill(fftLength / 2 - 1)(0.U(12.W)))
    val twi_sin_tb1_p10 = VecInit(twi_sin_tb1_p10_pre ++ Seq.fill(fftLength / 2 - 1)(0.U(12.W)))

    val idx_r = Mux((io.nk(addrWidth - 1) & io.nk(addrWidth - 1 - 1, 0).orR), (~io.nk + 1.U), io.nk)
    
    val lut_chg_sign_flag_r = io.nk(addrWidth - 1) & (io.nk(addrWidth - 1 - 1, 0).orR)

    val lut_w_r = twi_cos_tb1_p10(idx_r)

    val idx_i = idx_r(addrWidth - 1, 0)

    val lut_chg_sign_flag_i = true.B

    val lut_w_i = twi_sin_tb1_p10(idx_i)

    val chg_sign_flag_r = Mux((io.twi_lut_case_idx === 2.U), !lut_chg_sign_flag_r, lut_chg_sign_flag_r)
    val chg_sign_flag_i = Mux((io.twi_lut_case_idx === 1.U), !lut_chg_sign_flag_i, lut_chg_sign_flag_i)

    io.w_r := Mux(chg_sign_flag_r, (~lut_w_r + 1.U), lut_w_r)
    io.w_i := Mux(chg_sign_flag_i, (~lut_w_i + 1.U), lut_w_i)
}
