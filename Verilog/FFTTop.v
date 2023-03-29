module FFTMultiply(
  input  [15:0] io_data_im,
  input  [15:0] io_data_re,
  input  [13:0] io_wR,
  input  [13:0] io_wI,
  output [15:0] io_product_im,
  output [15:0] io_product_re
);
  wire [15:0] _multS_T_2 = $signed(io_data_re) + $signed(io_data_im); // @[FFTMultiply.scala 15:29]
  wire [13:0] _multS_T_5 = $signed(io_wR) + $signed(io_wI); // @[FFTMultiply.scala 15:52]
  wire [29:0] multS = $signed(_multS_T_2) * $signed(_multS_T_5); // @[FFTMultiply.scala 15:43]
  wire [29:0] multR = $signed(io_data_re) * $signed(io_wR); // @[FFTMultiply.scala 16:28]
  wire [29:0] multI = $signed(io_data_im) * $signed(io_wI); // @[FFTMultiply.scala 17:28]
  wire [29:0] _io_product_re_T_2 = $signed(multR) - $signed(multI); // @[FFTMultiply.scala 19:28]
  wire [29:0] _io_product_im_T_2 = $signed(multS) - $signed(multR); // @[FFTMultiply.scala 20:28]
  wire [29:0] _io_product_im_T_5 = $signed(_io_product_im_T_2) - $signed(multI); // @[FFTMultiply.scala 20:36]
  wire [17:0] _GEN_0 = _io_product_im_T_5[29:12]; // @[FFTMultiply.scala 20:19]
  wire [17:0] _GEN_2 = _io_product_re_T_2[29:12]; // @[FFTMultiply.scala 19:19]
  assign io_product_im = _GEN_0[15:0]; // @[FFTMultiply.scala 20:19]
  assign io_product_re = _GEN_2[15:0]; // @[FFTMultiply.scala 19:19]
endmodule
module FFTMultiply_7(
  input  [15:0] io_data_im,
  input  [15:0] io_data_re,
  input  [13:0] io_wR,
  input  [13:0] io_wI,
  output [15:0] io_product_im,
  output [15:0] io_product_re
);
  wire [15:0] _multS_T_2 = $signed(io_data_re) + $signed(io_data_im); // @[FFTMultiply.scala 15:29]
  wire [13:0] _multS_T_5 = $signed(io_wR) + $signed(io_wI); // @[FFTMultiply.scala 15:52]
  wire [29:0] multS = $signed(_multS_T_2) * $signed(_multS_T_5); // @[FFTMultiply.scala 15:43]
  wire [29:0] multR = $signed(io_data_re) * $signed(io_wR); // @[FFTMultiply.scala 16:28]
  wire [29:0] multI = $signed(io_data_im) * $signed(io_wI); // @[FFTMultiply.scala 17:28]
  wire [29:0] _io_product_re_T_2 = $signed(multR) - $signed(multI); // @[FFTMultiply.scala 19:28]
  wire [29:0] _io_product_im_T_2 = $signed(multS) - $signed(multR); // @[FFTMultiply.scala 20:28]
  wire [29:0] _io_product_im_T_5 = $signed(_io_product_im_T_2) - $signed(multI); // @[FFTMultiply.scala 20:36]
  wire [17:0] _GEN_0 = _io_product_im_T_5[29:12]; // @[FFTMultiply.scala 20:19]
  wire [17:0] _GEN_2 = _io_product_re_T_2[29:12]; // @[FFTMultiply.scala 19:19]
  assign io_product_im = _GEN_0[15:0]; // @[FFTMultiply.scala 20:19]
  assign io_product_re = _GEN_2[15:0]; // @[FFTMultiply.scala 19:19]
endmodule
module FFTTwiddle(
  input  [6:0]  io_nk,
  input  [1:0]  io_twiLutCaseIndex,
  output [13:0] io_wR,
  output [13:0] io_wI
);
  wire [6:0] _idx_r_pre_T_1 = ~io_nk; // @[FFTTwiddle.scala 36:51]
  wire [6:0] _idx_r_pre_T_3 = _idx_r_pre_T_1 + 7'h1; // @[FFTTwiddle.scala 36:58]
  wire [6:0] _idx_r_pre_T_4 = io_nk[6] ? _idx_r_pre_T_3 : io_nk; // @[FFTTwiddle.scala 36:24]
  wire [5:0] idx_r_pre = _idx_r_pre_T_4[5:0]; // @[FFTTwiddle.scala 36:72]
  wire  _idx_r_T_3 = idx_r_pre[5] & |idx_r_pre[4:0]; // @[FFTTwiddle.scala 38:54]
  wire [5:0] _idx_r_T_4 = ~idx_r_pre; // @[FFTTwiddle.scala 38:98]
  wire [5:0] _idx_r_T_6 = _idx_r_T_4 + 6'h1; // @[FFTTwiddle.scala 38:109]
  wire [5:0] idx_r = idx_r_pre[5] & |idx_r_pre[4:0] ? _idx_r_T_6 : idx_r_pre; // @[FFTTwiddle.scala 38:20]
  wire  lut_chg_sign_flag_i = ~io_nk[6]; // @[FFTTwiddle.scala 46:31]
  wire  chg_sign_flag_r = io_twiLutCaseIndex == 2'h2 ? ~_idx_r_T_3 : _idx_r_T_3; // @[FFTTwiddle.scala 50:30]
  wire  chg_sign_flag_i = io_twiLutCaseIndex == 2'h1 ? ~lut_chg_sign_flag_i : lut_chg_sign_flag_i; // @[FFTTwiddle.scala 51:30]
  wire [13:0] _GEN_1 = 6'h1 == idx_r ? $signed(14'shffb) : $signed(14'sh1000); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_2 = 6'h2 == idx_r ? $signed(14'shfec) : $signed(_GEN_1); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_3 = 6'h3 == idx_r ? $signed(14'shfd4) : $signed(_GEN_2); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_4 = 6'h4 == idx_r ? $signed(14'shfb1) : $signed(_GEN_3); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_5 = 6'h5 == idx_r ? $signed(14'shf85) : $signed(_GEN_4); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_6 = 6'h6 == idx_r ? $signed(14'shf50) : $signed(_GEN_5); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_7 = 6'h7 == idx_r ? $signed(14'shf11) : $signed(_GEN_6); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_8 = 6'h8 == idx_r ? $signed(14'shec8) : $signed(_GEN_7); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_9 = 6'h9 == idx_r ? $signed(14'she77) : $signed(_GEN_8); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_10 = 6'ha == idx_r ? $signed(14'she1c) : $signed(_GEN_9); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_11 = 6'hb == idx_r ? $signed(14'shdb9) : $signed(_GEN_10); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_12 = 6'hc == idx_r ? $signed(14'shd4e) : $signed(_GEN_11); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_13 = 6'hd == idx_r ? $signed(14'shcda) : $signed(_GEN_12); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_14 = 6'he == idx_r ? $signed(14'shc5e) : $signed(_GEN_13); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_15 = 6'hf == idx_r ? $signed(14'shbdb) : $signed(_GEN_14); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_16 = 6'h10 == idx_r ? $signed(14'shb50) : $signed(_GEN_15); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_17 = 6'h11 == idx_r ? $signed(14'shabf) : $signed(_GEN_16); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_18 = 6'h12 == idx_r ? $signed(14'sha26) : $signed(_GEN_17); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_19 = 6'h13 == idx_r ? $signed(14'sh988) : $signed(_GEN_18); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_20 = 6'h14 == idx_r ? $signed(14'sh8e4) : $signed(_GEN_19); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_21 = 6'h15 == idx_r ? $signed(14'sh83a) : $signed(_GEN_20); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_22 = 6'h16 == idx_r ? $signed(14'sh78b) : $signed(_GEN_21); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_23 = 6'h17 == idx_r ? $signed(14'sh6d7) : $signed(_GEN_22); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_24 = 6'h18 == idx_r ? $signed(14'sh61f) : $signed(_GEN_23); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_25 = 6'h19 == idx_r ? $signed(14'sh564) : $signed(_GEN_24); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_26 = 6'h1a == idx_r ? $signed(14'sh4a5) : $signed(_GEN_25); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_27 = 6'h1b == idx_r ? $signed(14'sh3e3) : $signed(_GEN_26); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_28 = 6'h1c == idx_r ? $signed(14'sh31f) : $signed(_GEN_27); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_29 = 6'h1d == idx_r ? $signed(14'sh259) : $signed(_GEN_28); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_30 = 6'h1e == idx_r ? $signed(14'sh191) : $signed(_GEN_29); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_31 = 6'h1f == idx_r ? $signed(14'shc9) : $signed(_GEN_30); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_32 = 6'h20 == idx_r ? $signed(14'sh0) : $signed(_GEN_31); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _io_wR_T_2 = 14'sh0 - $signed(_GEN_32); // @[FFTTwiddle.scala 53:35]
  wire [13:0] _GEN_34 = 6'h1 == idx_r ? $signed(14'shc9) : $signed(14'sh0); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_35 = 6'h2 == idx_r ? $signed(14'sh191) : $signed(_GEN_34); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_36 = 6'h3 == idx_r ? $signed(14'sh259) : $signed(_GEN_35); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_37 = 6'h4 == idx_r ? $signed(14'sh31f) : $signed(_GEN_36); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_38 = 6'h5 == idx_r ? $signed(14'sh3e3) : $signed(_GEN_37); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_39 = 6'h6 == idx_r ? $signed(14'sh4a5) : $signed(_GEN_38); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_40 = 6'h7 == idx_r ? $signed(14'sh564) : $signed(_GEN_39); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_41 = 6'h8 == idx_r ? $signed(14'sh61f) : $signed(_GEN_40); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_42 = 6'h9 == idx_r ? $signed(14'sh6d7) : $signed(_GEN_41); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_43 = 6'ha == idx_r ? $signed(14'sh78b) : $signed(_GEN_42); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_44 = 6'hb == idx_r ? $signed(14'sh83a) : $signed(_GEN_43); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_45 = 6'hc == idx_r ? $signed(14'sh8e4) : $signed(_GEN_44); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_46 = 6'hd == idx_r ? $signed(14'sh988) : $signed(_GEN_45); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_47 = 6'he == idx_r ? $signed(14'sha26) : $signed(_GEN_46); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_48 = 6'hf == idx_r ? $signed(14'shabf) : $signed(_GEN_47); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_49 = 6'h10 == idx_r ? $signed(14'shb50) : $signed(_GEN_48); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_50 = 6'h11 == idx_r ? $signed(14'shbdb) : $signed(_GEN_49); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_51 = 6'h12 == idx_r ? $signed(14'shc5e) : $signed(_GEN_50); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_52 = 6'h13 == idx_r ? $signed(14'shcda) : $signed(_GEN_51); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_53 = 6'h14 == idx_r ? $signed(14'shd4e) : $signed(_GEN_52); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_54 = 6'h15 == idx_r ? $signed(14'shdb9) : $signed(_GEN_53); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_55 = 6'h16 == idx_r ? $signed(14'she1c) : $signed(_GEN_54); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_56 = 6'h17 == idx_r ? $signed(14'she77) : $signed(_GEN_55); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_57 = 6'h18 == idx_r ? $signed(14'shec8) : $signed(_GEN_56); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_58 = 6'h19 == idx_r ? $signed(14'shf11) : $signed(_GEN_57); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_59 = 6'h1a == idx_r ? $signed(14'shf50) : $signed(_GEN_58); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_60 = 6'h1b == idx_r ? $signed(14'shf85) : $signed(_GEN_59); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_61 = 6'h1c == idx_r ? $signed(14'shfb1) : $signed(_GEN_60); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_62 = 6'h1d == idx_r ? $signed(14'shfd4) : $signed(_GEN_61); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_63 = 6'h1e == idx_r ? $signed(14'shfec) : $signed(_GEN_62); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_64 = 6'h1f == idx_r ? $signed(14'shffb) : $signed(_GEN_63); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_65 = 6'h20 == idx_r ? $signed(14'sh1000) : $signed(_GEN_64); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _io_wI_T_2 = 14'sh0 - $signed(_GEN_65); // @[FFTTwiddle.scala 54:35]
  assign io_wR = chg_sign_flag_r ? $signed(_io_wR_T_2) : $signed(_GEN_32); // @[FFTTwiddle.scala 53:17]
  assign io_wI = chg_sign_flag_i ? $signed(_io_wI_T_2) : $signed(_GEN_65); // @[FFTTwiddle.scala 54:17]
endmodule
module FFT3PipelineR23Calc(
  input         clock,
  input         reset,
  input  [15:0] io_dataIn_0_im,
  input  [15:0] io_dataIn_0_re,
  input  [15:0] io_dataIn_1_im,
  input  [15:0] io_dataIn_1_re,
  input  [15:0] io_dataIn_2_im,
  input  [15:0] io_dataIn_2_re,
  input  [15:0] io_dataIn_3_im,
  input  [15:0] io_dataIn_3_re,
  input  [15:0] io_dataIn_4_im,
  input  [15:0] io_dataIn_4_re,
  input  [15:0] io_dataIn_5_im,
  input  [15:0] io_dataIn_5_re,
  input  [15:0] io_dataIn_6_im,
  input  [15:0] io_dataIn_6_re,
  input  [15:0] io_dataIn_7_im,
  input  [15:0] io_dataIn_7_re,
  output [15:0] io_dataOut3c_0_im,
  output [15:0] io_dataOut3c_0_re,
  output [15:0] io_dataOut3c_1_im,
  output [15:0] io_dataOut3c_1_re,
  output [15:0] io_dataOut3c_2_im,
  output [15:0] io_dataOut3c_2_re,
  output [15:0] io_dataOut3c_3_im,
  output [15:0] io_dataOut3c_3_re,
  output [15:0] io_dataOut3c_4_im,
  output [15:0] io_dataOut3c_4_re,
  output [15:0] io_dataOut3c_5_im,
  output [15:0] io_dataOut3c_5_re,
  output [15:0] io_dataOut3c_6_im,
  output [15:0] io_dataOut3c_6_re,
  output [15:0] io_dataOut3c_7_im,
  output [15:0] io_dataOut3c_7_re,
  input  [5:0]  io_radixCount,
  input  [1:0]  io_calcMode,
  input  [1:0]  io_phaseCount,
  input         io_rShiftSym,
  input         io_isFFT,
  input         io_state1c,
  input         io_state2c
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] multiplyUnits_0_io_data_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_0_io_data_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_0_io_wR; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_0_io_wI; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_0_io_product_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_0_io_product_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_1_io_data_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_1_io_data_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_1_io_wR; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_1_io_wI; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_1_io_product_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_1_io_product_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_2_io_data_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_2_io_data_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_2_io_wR; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_2_io_wI; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_2_io_product_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_2_io_product_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_3_io_data_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_3_io_data_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_3_io_wR; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_3_io_wI; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_3_io_product_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_3_io_product_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_4_io_data_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_4_io_data_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_4_io_wR; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_4_io_wI; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_4_io_product_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_4_io_product_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_5_io_data_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_5_io_data_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_5_io_wR; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_5_io_wI; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_5_io_product_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_5_io_product_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_6_io_data_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_6_io_data_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_6_io_wR; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_6_io_wI; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_6_io_product_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_6_io_product_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_7_io_data_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_7_io_data_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_7_io_wR; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_7_io_wI; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_7_io_product_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_7_io_product_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_8_io_data_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_8_io_data_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_8_io_wR; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [13:0] multiplyUnits_8_io_wI; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_8_io_product_im; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [15:0] multiplyUnits_8_io_product_re; // @[FFT3PipelineR23Calc.scala 40:43]
  wire [6:0] twiddleUnits_0_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_0_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_0_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_0_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [6:0] twiddleUnits_1_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_1_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_1_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_1_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [6:0] twiddleUnits_2_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_2_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_2_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_2_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [6:0] twiddleUnits_3_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_3_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_3_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_3_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [6:0] twiddleUnits_4_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_4_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_4_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_4_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [6:0] twiddleUnits_5_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_5_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_5_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_5_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [6:0] twiddleUnits_6_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_6_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_6_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_6_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire  lastPhase = io_phaseCount == 2'h2; // @[FFT3PipelineR23Calc.scala 38:35]
  wire [15:0] _dataInRnd_0_re_T_2 = {io_dataIn_0_re[15],io_dataIn_0_re[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_0_re_T_5 = {15'h0,io_dataIn_0_re[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_0_re = _dataInRnd_0_re_T_2 + _dataInRnd_0_re_T_5; // @[FFT3PipelineR23Calc.scala 45:174]
  wire [15:0] _dataInRnd_0_im_T_2 = {io_dataIn_0_im[15],io_dataIn_0_im[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_0_im_T_5 = {15'h0,io_dataIn_0_im[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_0_im = _dataInRnd_0_im_T_2 + _dataInRnd_0_im_T_5; // @[FFT3PipelineR23Calc.scala 46:174]
  wire [15:0] _dataInRnd_1_re_T_2 = {io_dataIn_1_re[15],io_dataIn_1_re[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_1_re_T_5 = {15'h0,io_dataIn_1_re[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_1_re = _dataInRnd_1_re_T_2 + _dataInRnd_1_re_T_5; // @[FFT3PipelineR23Calc.scala 45:174]
  wire [15:0] _dataInRnd_1_im_T_2 = {io_dataIn_1_im[15],io_dataIn_1_im[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_1_im_T_5 = {15'h0,io_dataIn_1_im[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_1_im = _dataInRnd_1_im_T_2 + _dataInRnd_1_im_T_5; // @[FFT3PipelineR23Calc.scala 46:174]
  wire [15:0] _dataInRnd_2_re_T_2 = {io_dataIn_2_re[15],io_dataIn_2_re[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_2_re_T_5 = {15'h0,io_dataIn_2_re[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_2_re = _dataInRnd_2_re_T_2 + _dataInRnd_2_re_T_5; // @[FFT3PipelineR23Calc.scala 45:174]
  wire [15:0] _dataInRnd_2_im_T_2 = {io_dataIn_2_im[15],io_dataIn_2_im[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_2_im_T_5 = {15'h0,io_dataIn_2_im[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_2_im = _dataInRnd_2_im_T_2 + _dataInRnd_2_im_T_5; // @[FFT3PipelineR23Calc.scala 46:174]
  wire [15:0] _dataInRnd_3_re_T_2 = {io_dataIn_3_re[15],io_dataIn_3_re[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_3_re_T_5 = {15'h0,io_dataIn_3_re[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_3_re = _dataInRnd_3_re_T_2 + _dataInRnd_3_re_T_5; // @[FFT3PipelineR23Calc.scala 45:174]
  wire [15:0] _dataInRnd_3_im_T_2 = {io_dataIn_3_im[15],io_dataIn_3_im[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_3_im_T_5 = {15'h0,io_dataIn_3_im[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_3_im = _dataInRnd_3_im_T_2 + _dataInRnd_3_im_T_5; // @[FFT3PipelineR23Calc.scala 46:174]
  wire [15:0] _dataInRnd_4_re_T_2 = {io_dataIn_4_re[15],io_dataIn_4_re[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_4_re_T_5 = {15'h0,io_dataIn_4_re[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_4_re = _dataInRnd_4_re_T_2 + _dataInRnd_4_re_T_5; // @[FFT3PipelineR23Calc.scala 45:174]
  wire [15:0] _dataInRnd_4_im_T_2 = {io_dataIn_4_im[15],io_dataIn_4_im[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_4_im_T_5 = {15'h0,io_dataIn_4_im[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_4_im = _dataInRnd_4_im_T_2 + _dataInRnd_4_im_T_5; // @[FFT3PipelineR23Calc.scala 46:174]
  wire [15:0] _dataInRnd_5_re_T_2 = {io_dataIn_5_re[15],io_dataIn_5_re[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_5_re_T_5 = {15'h0,io_dataIn_5_re[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_5_re = _dataInRnd_5_re_T_2 + _dataInRnd_5_re_T_5; // @[FFT3PipelineR23Calc.scala 45:174]
  wire [15:0] _dataInRnd_5_im_T_2 = {io_dataIn_5_im[15],io_dataIn_5_im[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_5_im_T_5 = {15'h0,io_dataIn_5_im[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_5_im = _dataInRnd_5_im_T_2 + _dataInRnd_5_im_T_5; // @[FFT3PipelineR23Calc.scala 46:174]
  wire [15:0] _dataInRnd_6_re_T_2 = {io_dataIn_6_re[15],io_dataIn_6_re[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_6_re_T_5 = {15'h0,io_dataIn_6_re[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_6_re = _dataInRnd_6_re_T_2 + _dataInRnd_6_re_T_5; // @[FFT3PipelineR23Calc.scala 45:174]
  wire [15:0] _dataInRnd_6_im_T_2 = {io_dataIn_6_im[15],io_dataIn_6_im[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_6_im_T_5 = {15'h0,io_dataIn_6_im[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_6_im = _dataInRnd_6_im_T_2 + _dataInRnd_6_im_T_5; // @[FFT3PipelineR23Calc.scala 46:174]
  wire [15:0] _dataInRnd_7_re_T_2 = {io_dataIn_7_re[15],io_dataIn_7_re[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_7_re_T_5 = {15'h0,io_dataIn_7_re[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_7_re = _dataInRnd_7_re_T_2 + _dataInRnd_7_re_T_5; // @[FFT3PipelineR23Calc.scala 45:174]
  wire [15:0] _dataInRnd_7_im_T_2 = {io_dataIn_7_im[15],io_dataIn_7_im[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInRnd_7_im_T_5 = {15'h0,io_dataIn_7_im[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInRnd_7_im = _dataInRnd_7_im_T_2 + _dataInRnd_7_im_T_5; // @[FFT3PipelineR23Calc.scala 46:174]
  wire [15:0] dataIn1c_0_im = io_rShiftSym ? $signed(dataInRnd_0_im) : $signed(io_dataIn_0_im); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_0_re = io_rShiftSym ? $signed(dataInRnd_0_re) : $signed(io_dataIn_0_re); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_1_im = io_rShiftSym ? $signed(dataInRnd_1_im) : $signed(io_dataIn_1_im); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_1_re = io_rShiftSym ? $signed(dataInRnd_1_re) : $signed(io_dataIn_1_re); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_2_im = io_rShiftSym ? $signed(dataInRnd_2_im) : $signed(io_dataIn_2_im); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_2_re = io_rShiftSym ? $signed(dataInRnd_2_re) : $signed(io_dataIn_2_re); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_3_im = io_rShiftSym ? $signed(dataInRnd_3_im) : $signed(io_dataIn_3_im); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_3_re = io_rShiftSym ? $signed(dataInRnd_3_re) : $signed(io_dataIn_3_re); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_4_im = io_rShiftSym ? $signed(dataInRnd_4_im) : $signed(io_dataIn_4_im); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_4_re = io_rShiftSym ? $signed(dataInRnd_4_re) : $signed(io_dataIn_4_re); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_5_im = io_rShiftSym ? $signed(dataInRnd_5_im) : $signed(io_dataIn_5_im); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_5_re = io_rShiftSym ? $signed(dataInRnd_5_re) : $signed(io_dataIn_5_re); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_6_im = io_rShiftSym ? $signed(dataInRnd_6_im) : $signed(io_dataIn_6_im); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_6_re = io_rShiftSym ? $signed(dataInRnd_6_re) : $signed(io_dataIn_6_re); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_7_im = io_rShiftSym ? $signed(dataInRnd_7_im) : $signed(io_dataIn_7_im); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [15:0] dataIn1c_7_re = io_rShiftSym ? $signed(dataInRnd_7_re) : $signed(io_dataIn_7_re); // @[FFT3PipelineR23Calc.scala 51:27]
  wire [5:0] _twiLutIdxPre_T_1 = 2'h0 == io_phaseCount ? io_radixCount : 6'h0; // @[Mux.scala 81:58]
  wire [5:0] _twiLutIdxPre_T_3 = 2'h1 == io_phaseCount ? {{3'd0}, io_radixCount[5:3]} : _twiLutIdxPre_T_1; // @[Mux.scala 81:58]
  reg [3:0] twiLutIdxPre1c; // @[Reg.scala 35:20]
  wire [3:0] twiLutIdxPre = _twiLutIdxPre_T_3[3:0]; // @[FFT3PipelineR23Calc.scala 74:28 75:18]
  wire [6:0] _twiddleUnits_0_io_nk_T = 3'h1 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 80:81]
  wire [3:0] _twiddleUnits_0_io_nk_T_1 = io_phaseCount * 2'h3; // @[FFT3PipelineR23Calc.scala 80:117]
  wire [21:0] _GEN_0 = {{15'd0}, _twiddleUnits_0_io_nk_T}; // @[FFT3PipelineR23Calc.scala 80:99]
  wire [21:0] _twiddleUnits_0_io_nk_T_2 = _GEN_0 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 80:99]
  wire [22:0] _twiddleUnits_0_io_nk_T_3 = {_twiddleUnits_0_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [6:0] _twiddleUnits_1_io_nk_T = 3'h2 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [21:0] _GEN_1 = {{15'd0}, _twiddleUnits_1_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [21:0] _twiddleUnits_1_io_nk_T_2 = _GEN_1 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [6:0] _twiddleUnits_2_io_nk_T = 3'h3 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [21:0] _GEN_27 = {{15'd0}, _twiddleUnits_2_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [21:0] _twiddleUnits_2_io_nk_T_2 = _GEN_27 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [6:0] _twiddleUnits_3_io_nk_T = 3'h4 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [21:0] _GEN_28 = {{15'd0}, _twiddleUnits_3_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [21:0] _twiddleUnits_3_io_nk_T_2 = _GEN_28 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [6:0] _twiddleUnits_4_io_nk_T = 3'h5 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [21:0] _GEN_36 = {{15'd0}, _twiddleUnits_4_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [21:0] _twiddleUnits_4_io_nk_T_2 = _GEN_36 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [6:0] _twiddleUnits_5_io_nk_T = 3'h6 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [21:0] _GEN_37 = {{15'd0}, _twiddleUnits_5_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [21:0] _twiddleUnits_5_io_nk_T_2 = _GEN_37 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [6:0] _twiddleUnits_6_io_nk_T = 3'h7 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [21:0] _GEN_70 = {{15'd0}, _twiddleUnits_6_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [21:0] _twiddleUnits_6_io_nk_T_2 = _GEN_70 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [13:0] wI1c_8 = 14'sh0 - 14'shb50; // @[FFT3PipelineR23Calc.scala 96:16]
  reg [13:0] wR2c_0_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_0 = twiddleUnits_0_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 82:13]
  reg [13:0] wR2c_1_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_1 = twiddleUnits_1_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 88:17]
  reg [13:0] wR2c_2_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_2 = twiddleUnits_2_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 88:17]
  reg [13:0] wR2c_3_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_3 = twiddleUnits_3_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 88:17]
  reg [13:0] wR2c_4_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_4 = twiddleUnits_4_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 88:17]
  reg [13:0] wR2c_5_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_5 = twiddleUnits_5_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 88:17]
  reg [13:0] wR2c_6_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_6 = twiddleUnits_6_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 88:17]
  reg [13:0] wR2c_7_r; // @[Reg.scala 35:20]
  reg [13:0] wR2c_8_r; // @[Reg.scala 35:20]
  reg [13:0] wI2c_0_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_0 = twiddleUnits_0_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 83:13]
  reg [13:0] wI2c_1_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_1 = twiddleUnits_1_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 89:17]
  reg [13:0] wI2c_2_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_2 = twiddleUnits_2_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 89:17]
  reg [13:0] wI2c_3_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_3 = twiddleUnits_3_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 89:17]
  reg [13:0] wI2c_4_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_4 = twiddleUnits_4_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 89:17]
  reg [13:0] wI2c_5_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_5 = twiddleUnits_5_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 89:17]
  reg [13:0] wI2c_6_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_6 = twiddleUnits_6_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 89:17]
  reg [13:0] wI2c_7_r; // @[Reg.scala 35:20]
  reg [13:0] wI2c_8_r; // @[Reg.scala 35:20]
  reg [13:0] wR3c_0_r; // @[Reg.scala 35:20]
  reg [13:0] wR3c_1_r; // @[Reg.scala 35:20]
  reg [13:0] wR3c_2_r; // @[Reg.scala 35:20]
  reg [13:0] wR3c_3_r; // @[Reg.scala 35:20]
  reg [13:0] wR3c_4_r; // @[Reg.scala 35:20]
  reg [13:0] wR3c_5_r; // @[Reg.scala 35:20]
  reg [13:0] wR3c_6_r; // @[Reg.scala 35:20]
  reg [13:0] wI3c_0_r; // @[Reg.scala 35:20]
  reg [13:0] wI3c_1_r; // @[Reg.scala 35:20]
  reg [13:0] wI3c_2_r; // @[Reg.scala 35:20]
  reg [13:0] wI3c_3_r; // @[Reg.scala 35:20]
  reg [13:0] wI3c_4_r; // @[Reg.scala 35:20]
  reg [13:0] wI3c_5_r; // @[Reg.scala 35:20]
  reg [13:0] wI3c_6_r; // @[Reg.scala 35:20]
  reg [15:0] data2c_1_im_r; // @[Reg.scala 35:20]
  reg [15:0] data2c_5_im_r; // @[Reg.scala 35:20]
  reg [15:0] data2c_7_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_5_im = $signed(data2c_5_im_r) + $signed(data2c_7_im_r); // @[FFT3PipelineR23Calc.scala 153:44]
  reg [15:0] data2c_1_re_r; // @[Reg.scala 35:20]
  reg [15:0] data2c_5_re_r; // @[Reg.scala 35:20]
  reg [15:0] data2c_7_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_5_re = $signed(data2c_5_re_r) + $signed(data2c_7_re_r); // @[FFT3PipelineR23Calc.scala 152:44]
  reg [15:0] data2c_0_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_0_re = $signed(dataIn1c_0_re) + $signed(dataIn1c_4_re); // @[FFT3PipelineR23Calc.scala 144:46]
  reg [15:0] data2c_0_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_0_im = $signed(dataIn1c_0_im) + $signed(dataIn1c_4_im); // @[FFT3PipelineR23Calc.scala 145:46]
  wire [15:0] data2cPrePre_1_re = $signed(dataIn1c_1_re) + $signed(dataIn1c_5_re); // @[FFT3PipelineR23Calc.scala 144:46]
  wire [15:0] data2cPrePre_1_im = $signed(dataIn1c_1_im) + $signed(dataIn1c_5_im); // @[FFT3PipelineR23Calc.scala 145:46]
  reg [15:0] data2c_2_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_2_re = $signed(dataIn1c_2_re) + $signed(dataIn1c_6_re); // @[FFT3PipelineR23Calc.scala 144:46]
  reg [15:0] data2c_2_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_2_im = $signed(dataIn1c_2_im) + $signed(dataIn1c_6_im); // @[FFT3PipelineR23Calc.scala 145:46]
  reg [15:0] data2c_3_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_3_re = $signed(dataIn1c_3_re) + $signed(dataIn1c_7_re); // @[FFT3PipelineR23Calc.scala 144:46]
  reg [15:0] data2c_3_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_3_im = $signed(dataIn1c_3_im) + $signed(dataIn1c_7_im); // @[FFT3PipelineR23Calc.scala 145:46]
  reg [15:0] data2c_4_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_4_re = $signed(dataIn1c_0_re) - $signed(dataIn1c_4_re); // @[FFT3PipelineR23Calc.scala 146:50]
  reg [15:0] data2c_4_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_4_im = $signed(dataIn1c_0_im) - $signed(dataIn1c_4_im); // @[FFT3PipelineR23Calc.scala 147:50]
  wire [15:0] data2cPrePre_5_re = $signed(dataIn1c_1_re) - $signed(dataIn1c_5_re); // @[FFT3PipelineR23Calc.scala 146:50]
  wire [15:0] data2cPrePre_5_im = $signed(dataIn1c_1_im) - $signed(dataIn1c_5_im); // @[FFT3PipelineR23Calc.scala 147:50]
  reg [15:0] data2c_6_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_6_im = $signed(dataIn1c_2_im) - $signed(dataIn1c_6_im); // @[FFT3PipelineR23Calc.scala 147:50]
  reg [15:0] data2c_6_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_6_re = $signed(dataIn1c_2_re) - $signed(dataIn1c_6_re); // @[FFT3PipelineR23Calc.scala 146:50]
  wire [15:0] _data2cPre_6_im_T_2 = 16'sh0 - $signed(data2cPrePre_6_re); // @[FFT3PipelineR23Calc.scala 173:28]
  wire [15:0] data2cPrePre_7_im = $signed(dataIn1c_3_im) - $signed(dataIn1c_7_im); // @[FFT3PipelineR23Calc.scala 147:50]
  wire [15:0] data2cPrePre_7_re = $signed(dataIn1c_3_re) - $signed(dataIn1c_7_re); // @[FFT3PipelineR23Calc.scala 146:50]
  wire [15:0] _data2cPre_7_im_T_2 = 16'sh0 - $signed(data2cPrePre_7_re); // @[FFT3PipelineR23Calc.scala 176:28]
  reg [15:0] data3c_0_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_0_re = $signed(data2c_0_re_r) + $signed(data2c_2_re_r); // @[FFT3PipelineR23Calc.scala 152:44]
  reg [15:0] data3c_0_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_0_im = $signed(data2c_0_im_r) + $signed(data2c_2_im_r); // @[FFT3PipelineR23Calc.scala 153:44]
  reg [15:0] data3c_1_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_1_re = $signed(data2c_1_re_r) + $signed(data2c_3_re_r); // @[FFT3PipelineR23Calc.scala 152:44]
  reg [15:0] data3c_1_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_1_im = $signed(data2c_1_im_r) + $signed(data2c_3_im_r); // @[FFT3PipelineR23Calc.scala 153:44]
  wire [15:0] _data3cPre_1_im_T_2 = 16'sh0 - $signed(data2c_1_im_r); // @[FFT3PipelineR23Calc.scala 268:28]
  wire [15:0] _GEN_136 = io_calcMode == 2'h1 ? $signed(data2c_1_im_r) : $signed(_data3cPre_1_im_T_2); // @[FFT3PipelineR23Calc.scala 218:54 228:26]
  reg [15:0] data3c_2_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_2_re = $signed(data2c_0_re_r) - $signed(data2c_2_re_r); // @[FFT3PipelineR23Calc.scala 154:48]
  reg [15:0] data3c_2_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_2_im = $signed(data2c_0_im_r) - $signed(data2c_2_im_r); // @[FFT3PipelineR23Calc.scala 155:48]
  reg [15:0] data3c_3_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_3_im = $signed(data2c_1_im_r) - $signed(data2c_3_im_r); // @[FFT3PipelineR23Calc.scala 155:48]
  reg [15:0] data3c_3_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_3_re = $signed(data2c_1_re_r) - $signed(data2c_3_re_r); // @[FFT3PipelineR23Calc.scala 154:48]
  wire [15:0] _data3cPre_3_im_T_2 = 16'sh0 - $signed(data3cPrePre_3_re); // @[FFT3PipelineR23Calc.scala 184:28]
  reg [15:0] data3c_4_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_4_re = $signed(data2c_4_re_r) + $signed(data2c_6_re_r); // @[FFT3PipelineR23Calc.scala 152:44]
  reg [15:0] data3c_4_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_4_im = $signed(data2c_4_im_r) + $signed(data2c_6_im_r); // @[FFT3PipelineR23Calc.scala 153:44]
  reg [15:0] data3c_5_re_r; // @[Reg.scala 35:20]
  reg [15:0] data3c_5_im_r; // @[Reg.scala 35:20]
  reg [15:0] data3c_6_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_6_re = $signed(data2c_4_re_r) - $signed(data2c_6_re_r); // @[FFT3PipelineR23Calc.scala 154:48]
  reg [15:0] data3c_6_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_6_im = $signed(data2c_4_im_r) - $signed(data2c_6_im_r); // @[FFT3PipelineR23Calc.scala 155:48]
  reg [15:0] data3c_7_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_7_im = $signed(data2c_5_im_r) - $signed(data2c_7_im_r); // @[FFT3PipelineR23Calc.scala 155:48]
  reg [15:0] data3c_7_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_7_re = $signed(data2c_5_re_r) - $signed(data2c_7_re_r); // @[FFT3PipelineR23Calc.scala 154:48]
  wire [15:0] _data3cPre_7_im_T_2 = 16'sh0 - $signed(data3cPrePre_7_re); // @[FFT3PipelineR23Calc.scala 212:28]
  wire [15:0] dataOut3cPrePre_1_re = $signed(data3c_0_re_r) - $signed(data3c_1_re_r); // @[FFT3PipelineR23Calc.scala 162:51]
  wire [15:0] dataOut3cPrePre_1_im = $signed(data3c_0_im_r) - $signed(data3c_1_im_r); // @[FFT3PipelineR23Calc.scala 163:51]
  wire [15:0] dataOut3cPrePre_2_re = $signed(data3c_2_re_r) + $signed(data3c_3_re_r); // @[FFT3PipelineR23Calc.scala 160:47]
  wire [15:0] dataOut3cPrePre_2_im = $signed(data3c_2_im_r) + $signed(data3c_3_im_r); // @[FFT3PipelineR23Calc.scala 161:47]
  wire [15:0] dataOut3cPrePre_3_re = $signed(data3c_2_re_r) - $signed(data3c_3_re_r); // @[FFT3PipelineR23Calc.scala 162:51]
  wire [15:0] dataOut3cPrePre_3_im = $signed(data3c_2_im_r) - $signed(data3c_3_im_r); // @[FFT3PipelineR23Calc.scala 163:51]
  wire [15:0] dataOut3cPrePre_4_re = $signed(data3c_4_re_r) + $signed(data3c_5_re_r); // @[FFT3PipelineR23Calc.scala 160:47]
  wire [15:0] dataOut3cPrePre_4_im = $signed(data3c_4_im_r) + $signed(data3c_5_im_r); // @[FFT3PipelineR23Calc.scala 161:47]
  wire [15:0] dataOut3cPrePre_5_re = $signed(data3c_4_re_r) - $signed(data3c_5_re_r); // @[FFT3PipelineR23Calc.scala 162:51]
  wire [15:0] dataOut3cPrePre_5_im = $signed(data3c_4_im_r) - $signed(data3c_5_im_r); // @[FFT3PipelineR23Calc.scala 163:51]
  wire [15:0] dataOut3cPrePre_6_re = $signed(data3c_6_re_r) + $signed(data3c_7_re_r); // @[FFT3PipelineR23Calc.scala 160:47]
  wire [15:0] dataOut3cPrePre_6_im = $signed(data3c_6_im_r) + $signed(data3c_7_im_r); // @[FFT3PipelineR23Calc.scala 161:47]
  wire [15:0] dataOut3cPrePre_7_re = $signed(data3c_6_re_r) - $signed(data3c_7_re_r); // @[FFT3PipelineR23Calc.scala 162:51]
  wire [15:0] dataOut3cPrePre_7_im = $signed(data3c_6_im_r) - $signed(data3c_7_im_r); // @[FFT3PipelineR23Calc.scala 163:51]
  wire [15:0] _dataOut3cPre_1_T_im = lastPhase ? $signed(dataOut3cPrePre_1_im) : $signed(multiplyUnits_0_io_product_im); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_1_T_re = lastPhase ? $signed(dataOut3cPrePre_1_re) : $signed(multiplyUnits_0_io_product_re); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_2_T_im = lastPhase ? $signed(dataOut3cPrePre_2_im) : $signed(multiplyUnits_1_io_product_im); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_2_T_re = lastPhase ? $signed(dataOut3cPrePre_2_re) : $signed(multiplyUnits_1_io_product_re); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_3_T_im = lastPhase ? $signed(dataOut3cPrePre_3_im) : $signed(multiplyUnits_2_io_product_im); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_3_T_re = lastPhase ? $signed(dataOut3cPrePre_3_re) : $signed(multiplyUnits_2_io_product_re); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_4_T_im = lastPhase ? $signed(dataOut3cPrePre_4_im) : $signed(multiplyUnits_3_io_product_im); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_4_T_re = lastPhase ? $signed(dataOut3cPrePre_4_re) : $signed(multiplyUnits_3_io_product_re); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_5_T_im = lastPhase ? $signed(dataOut3cPrePre_5_im) : $signed(multiplyUnits_4_io_product_im); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_5_T_re = lastPhase ? $signed(dataOut3cPrePre_5_re) : $signed(multiplyUnits_4_io_product_re); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_6_T_im = lastPhase ? $signed(dataOut3cPrePre_6_im) : $signed(multiplyUnits_5_io_product_im); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_6_T_re = lastPhase ? $signed(dataOut3cPrePre_6_re) : $signed(multiplyUnits_5_io_product_re); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_7_T_im = lastPhase ? $signed(dataOut3cPrePre_7_im) : $signed(multiplyUnits_6_io_product_im); // @[FFT3PipelineR23Calc.scala 194:35]
  wire [15:0] _dataOut3cPre_7_T_re = lastPhase ? $signed(dataOut3cPrePre_7_re) : $signed(multiplyUnits_6_io_product_re); // @[FFT3PipelineR23Calc.scala 194:35]
  FFTMultiply multiplyUnits_0 ( // @[FFT3PipelineR23Calc.scala 40:43]
    .io_data_im(multiplyUnits_0_io_data_im),
    .io_data_re(multiplyUnits_0_io_data_re),
    .io_wR(multiplyUnits_0_io_wR),
    .io_wI(multiplyUnits_0_io_wI),
    .io_product_im(multiplyUnits_0_io_product_im),
    .io_product_re(multiplyUnits_0_io_product_re)
  );
  FFTMultiply multiplyUnits_1 ( // @[FFT3PipelineR23Calc.scala 40:43]
    .io_data_im(multiplyUnits_1_io_data_im),
    .io_data_re(multiplyUnits_1_io_data_re),
    .io_wR(multiplyUnits_1_io_wR),
    .io_wI(multiplyUnits_1_io_wI),
    .io_product_im(multiplyUnits_1_io_product_im),
    .io_product_re(multiplyUnits_1_io_product_re)
  );
  FFTMultiply multiplyUnits_2 ( // @[FFT3PipelineR23Calc.scala 40:43]
    .io_data_im(multiplyUnits_2_io_data_im),
    .io_data_re(multiplyUnits_2_io_data_re),
    .io_wR(multiplyUnits_2_io_wR),
    .io_wI(multiplyUnits_2_io_wI),
    .io_product_im(multiplyUnits_2_io_product_im),
    .io_product_re(multiplyUnits_2_io_product_re)
  );
  FFTMultiply multiplyUnits_3 ( // @[FFT3PipelineR23Calc.scala 40:43]
    .io_data_im(multiplyUnits_3_io_data_im),
    .io_data_re(multiplyUnits_3_io_data_re),
    .io_wR(multiplyUnits_3_io_wR),
    .io_wI(multiplyUnits_3_io_wI),
    .io_product_im(multiplyUnits_3_io_product_im),
    .io_product_re(multiplyUnits_3_io_product_re)
  );
  FFTMultiply multiplyUnits_4 ( // @[FFT3PipelineR23Calc.scala 40:43]
    .io_data_im(multiplyUnits_4_io_data_im),
    .io_data_re(multiplyUnits_4_io_data_re),
    .io_wR(multiplyUnits_4_io_wR),
    .io_wI(multiplyUnits_4_io_wI),
    .io_product_im(multiplyUnits_4_io_product_im),
    .io_product_re(multiplyUnits_4_io_product_re)
  );
  FFTMultiply multiplyUnits_5 ( // @[FFT3PipelineR23Calc.scala 40:43]
    .io_data_im(multiplyUnits_5_io_data_im),
    .io_data_re(multiplyUnits_5_io_data_re),
    .io_wR(multiplyUnits_5_io_wR),
    .io_wI(multiplyUnits_5_io_wI),
    .io_product_im(multiplyUnits_5_io_product_im),
    .io_product_re(multiplyUnits_5_io_product_re)
  );
  FFTMultiply multiplyUnits_6 ( // @[FFT3PipelineR23Calc.scala 40:43]
    .io_data_im(multiplyUnits_6_io_data_im),
    .io_data_re(multiplyUnits_6_io_data_re),
    .io_wR(multiplyUnits_6_io_wR),
    .io_wI(multiplyUnits_6_io_wI),
    .io_product_im(multiplyUnits_6_io_product_im),
    .io_product_re(multiplyUnits_6_io_product_re)
  );
  FFTMultiply_7 multiplyUnits_7 ( // @[FFT3PipelineR23Calc.scala 40:43]
    .io_data_im(multiplyUnits_7_io_data_im),
    .io_data_re(multiplyUnits_7_io_data_re),
    .io_wR(multiplyUnits_7_io_wR),
    .io_wI(multiplyUnits_7_io_wI),
    .io_product_im(multiplyUnits_7_io_product_im),
    .io_product_re(multiplyUnits_7_io_product_re)
  );
  FFTMultiply_7 multiplyUnits_8 ( // @[FFT3PipelineR23Calc.scala 40:43]
    .io_data_im(multiplyUnits_8_io_data_im),
    .io_data_re(multiplyUnits_8_io_data_re),
    .io_wR(multiplyUnits_8_io_wR),
    .io_wI(multiplyUnits_8_io_wI),
    .io_product_im(multiplyUnits_8_io_product_im),
    .io_product_re(multiplyUnits_8_io_product_re)
  );
  FFTTwiddle twiddleUnits_0 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_0_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_0_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_0_io_wR),
    .io_wI(twiddleUnits_0_io_wI)
  );
  FFTTwiddle twiddleUnits_1 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_1_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_1_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_1_io_wR),
    .io_wI(twiddleUnits_1_io_wI)
  );
  FFTTwiddle twiddleUnits_2 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_2_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_2_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_2_io_wR),
    .io_wI(twiddleUnits_2_io_wI)
  );
  FFTTwiddle twiddleUnits_3 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_3_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_3_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_3_io_wR),
    .io_wI(twiddleUnits_3_io_wI)
  );
  FFTTwiddle twiddleUnits_4 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_4_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_4_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_4_io_wR),
    .io_wI(twiddleUnits_4_io_wI)
  );
  FFTTwiddle twiddleUnits_5 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_5_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_5_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_5_io_wR),
    .io_wI(twiddleUnits_5_io_wI)
  );
  FFTTwiddle twiddleUnits_6 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_6_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_6_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_6_io_wR),
    .io_wI(twiddleUnits_6_io_wI)
  );
  assign io_dataOut3c_0_im = $signed(data3c_0_im_r) + $signed(data3c_1_im_r); // @[FFT3PipelineR23Calc.scala 161:47]
  assign io_dataOut3c_0_re = $signed(data3c_0_re_r) + $signed(data3c_1_re_r); // @[FFT3PipelineR23Calc.scala 160:47]
  assign io_dataOut3c_1_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_1_T_im) : $signed(dataOut3cPrePre_1_im); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_1_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_1_T_re) : $signed(dataOut3cPrePre_1_re); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_2_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_2_T_im) : $signed(dataOut3cPrePre_2_im); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_2_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_2_T_re) : $signed(dataOut3cPrePre_2_re); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_3_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_3_T_im) : $signed(dataOut3cPrePre_3_im); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_3_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_3_T_re) : $signed(dataOut3cPrePre_3_re); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_4_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_4_T_im) : $signed(dataOut3cPrePre_4_im); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_4_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_4_T_re) : $signed(dataOut3cPrePre_4_re); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_5_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_5_T_im) : $signed(dataOut3cPrePre_5_im); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_5_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_5_T_re) : $signed(dataOut3cPrePre_5_re); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_6_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_6_T_im) : $signed(dataOut3cPrePre_6_im); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_6_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_6_T_re) : $signed(dataOut3cPrePre_6_re); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_7_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_7_T_im) : $signed(dataOut3cPrePre_7_im); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign io_dataOut3c_7_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_7_T_re) : $signed(dataOut3cPrePre_7_re); // @[FFT3PipelineR23Calc.scala 166:31 194:29]
  assign multiplyUnits_0_io_data_im = $signed(data3c_0_im_r) - $signed(data3c_1_im_r); // @[FFT3PipelineR23Calc.scala 163:51]
  assign multiplyUnits_0_io_data_re = $signed(data3c_0_re_r) - $signed(data3c_1_re_r); // @[FFT3PipelineR23Calc.scala 162:51]
  assign multiplyUnits_0_io_wR = wR3c_3_r; // @[FFT3PipelineR23Calc.scala 107:12 59:20]
  assign multiplyUnits_0_io_wI = wI3c_3_r; // @[FFT3PipelineR23Calc.scala 111:12 60:20]
  assign multiplyUnits_1_io_data_im = $signed(data3c_2_im_r) + $signed(data3c_3_im_r); // @[FFT3PipelineR23Calc.scala 161:47]
  assign multiplyUnits_1_io_data_re = $signed(data3c_2_re_r) + $signed(data3c_3_re_r); // @[FFT3PipelineR23Calc.scala 160:47]
  assign multiplyUnits_1_io_wR = wR3c_1_r; // @[FFT3PipelineR23Calc.scala 107:12 59:20]
  assign multiplyUnits_1_io_wI = wI3c_1_r; // @[FFT3PipelineR23Calc.scala 111:12 60:20]
  assign multiplyUnits_2_io_data_im = $signed(data3c_2_im_r) - $signed(data3c_3_im_r); // @[FFT3PipelineR23Calc.scala 163:51]
  assign multiplyUnits_2_io_data_re = $signed(data3c_2_re_r) - $signed(data3c_3_re_r); // @[FFT3PipelineR23Calc.scala 162:51]
  assign multiplyUnits_2_io_wR = wR3c_5_r; // @[FFT3PipelineR23Calc.scala 107:12 59:20]
  assign multiplyUnits_2_io_wI = wI3c_5_r; // @[FFT3PipelineR23Calc.scala 111:12 60:20]
  assign multiplyUnits_3_io_data_im = $signed(data3c_4_im_r) + $signed(data3c_5_im_r); // @[FFT3PipelineR23Calc.scala 161:47]
  assign multiplyUnits_3_io_data_re = $signed(data3c_4_re_r) + $signed(data3c_5_re_r); // @[FFT3PipelineR23Calc.scala 160:47]
  assign multiplyUnits_3_io_wR = wR3c_0_r; // @[FFT3PipelineR23Calc.scala 107:12 59:20]
  assign multiplyUnits_3_io_wI = wI3c_0_r; // @[FFT3PipelineR23Calc.scala 111:12 60:20]
  assign multiplyUnits_4_io_data_im = $signed(data3c_4_im_r) - $signed(data3c_5_im_r); // @[FFT3PipelineR23Calc.scala 163:51]
  assign multiplyUnits_4_io_data_re = $signed(data3c_4_re_r) - $signed(data3c_5_re_r); // @[FFT3PipelineR23Calc.scala 162:51]
  assign multiplyUnits_4_io_wR = wR3c_4_r; // @[FFT3PipelineR23Calc.scala 107:12 59:20]
  assign multiplyUnits_4_io_wI = wI3c_4_r; // @[FFT3PipelineR23Calc.scala 111:12 60:20]
  assign multiplyUnits_5_io_data_im = $signed(data3c_6_im_r) + $signed(data3c_7_im_r); // @[FFT3PipelineR23Calc.scala 161:47]
  assign multiplyUnits_5_io_data_re = $signed(data3c_6_re_r) + $signed(data3c_7_re_r); // @[FFT3PipelineR23Calc.scala 160:47]
  assign multiplyUnits_5_io_wR = wR3c_2_r; // @[FFT3PipelineR23Calc.scala 107:12 59:20]
  assign multiplyUnits_5_io_wI = wI3c_2_r; // @[FFT3PipelineR23Calc.scala 111:12 60:20]
  assign multiplyUnits_6_io_data_im = $signed(data3c_6_im_r) - $signed(data3c_7_im_r); // @[FFT3PipelineR23Calc.scala 163:51]
  assign multiplyUnits_6_io_data_re = $signed(data3c_6_re_r) - $signed(data3c_7_re_r); // @[FFT3PipelineR23Calc.scala 162:51]
  assign multiplyUnits_6_io_wR = wR3c_6_r; // @[FFT3PipelineR23Calc.scala 107:12 59:20]
  assign multiplyUnits_6_io_wI = wI3c_6_r; // @[FFT3PipelineR23Calc.scala 111:12 60:20]
  assign multiplyUnits_7_io_data_im = $signed(data2c_5_im_r) + $signed(data2c_7_im_r); // @[FFT3PipelineR23Calc.scala 153:44]
  assign multiplyUnits_7_io_data_re = $signed(data2c_5_re_r) + $signed(data2c_7_re_r); // @[FFT3PipelineR23Calc.scala 152:44]
  assign multiplyUnits_7_io_wR = wR2c_7_r; // @[FFT3PipelineR23Calc.scala 121:34]
  assign multiplyUnits_7_io_wI = wI2c_7_r; // @[FFT3PipelineR23Calc.scala 122:34]
  assign multiplyUnits_8_io_data_im = $signed(data2c_5_im_r) - $signed(data2c_7_im_r); // @[FFT3PipelineR23Calc.scala 155:48]
  assign multiplyUnits_8_io_data_re = $signed(data2c_5_re_r) - $signed(data2c_7_re_r); // @[FFT3PipelineR23Calc.scala 154:48]
  assign multiplyUnits_8_io_wR = wR2c_8_r; // @[FFT3PipelineR23Calc.scala 57:20 99:12]
  assign multiplyUnits_8_io_wI = wI2c_8_r; // @[FFT3PipelineR23Calc.scala 103:12 58:20]
  assign twiddleUnits_0_io_nk = _twiddleUnits_0_io_nk_T_3[6:0]; // @[FFT3PipelineR23Calc.scala 80:27]
  assign twiddleUnits_0_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_1_io_nk = _twiddleUnits_1_io_nk_T_2[6:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_1_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_2_io_nk = _twiddleUnits_2_io_nk_T_2[6:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_2_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_3_io_nk = _twiddleUnits_3_io_nk_T_2[6:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_3_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_4_io_nk = _twiddleUnits_4_io_nk_T_2[6:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_4_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_5_io_nk = _twiddleUnits_5_io_nk_T_2[6:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_5_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_6_io_nk = _twiddleUnits_6_io_nk_T_2[6:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_6_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      twiLutIdxPre1c <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      twiLutIdxPre1c <= twiLutIdxPre;
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_0_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_0_r <= wR1c_0; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_1_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_1_r <= wR1c_1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_2_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_2_r <= wR1c_2; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_3_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_3_r <= wR1c_3; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_4_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_4_r <= wR1c_4; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_5_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_5_r <= wR1c_5; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_6_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_6_r <= wR1c_6; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_7_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_7_r <= 14'shb50; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_8_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_8_r <= -14'shb50; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_0_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_0_r <= wI1c_0; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_1_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_1_r <= wI1c_1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_2_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_2_r <= wI1c_2; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_3_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_3_r <= wI1c_3; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_4_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_4_r <= wI1c_4; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_5_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_5_r <= wI1c_5; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_6_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_6_r <= wI1c_6; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_7_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_7_r <= -14'shb50; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_8_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_8_r <= wI1c_8; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_0_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wR3c_0_r <= wR2c_0_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_1_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wR3c_1_r <= wR2c_1_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_2_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wR3c_2_r <= wR2c_2_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_3_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wR3c_3_r <= wR2c_3_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_4_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wR3c_4_r <= wR2c_4_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_5_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wR3c_5_r <= wR2c_5_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_6_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wR3c_6_r <= wR2c_6_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_0_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wI3c_0_r <= wI2c_0_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_1_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wI3c_1_r <= wI2c_1_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_2_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wI3c_2_r <= wI2c_2_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_3_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wI3c_3_r <= wI2c_3_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_4_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wI3c_4_r <= wI2c_4_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_5_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wI3c_5_r <= wI2c_5_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_6_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      wI3c_6_r <= wI2c_6_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_1_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_1_im_r <= data2cPrePre_1_im; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_1_im_r <= dataInRnd_1_im;
      end else begin
        data2c_1_im_r <= io_dataIn_1_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_5_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_5_im_r <= data2cPrePre_5_im; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_5_im_r <= dataInRnd_5_im;
      end else begin
        data2c_5_im_r <= io_dataIn_5_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_7_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_7_im_r <= _data2cPre_7_im_T_2; // @[FFT3PipelineR23Calc.scala 176:25]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_7_im_r <= dataInRnd_7_im;
      end else begin
        data2c_7_im_r <= io_dataIn_7_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_1_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_1_re_r <= data2cPrePre_1_re; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_1_re_r <= dataInRnd_1_re;
      end else begin
        data2c_1_re_r <= io_dataIn_1_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_5_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_5_re_r <= data2cPrePre_5_re; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_5_re_r <= dataInRnd_5_re;
      end else begin
        data2c_5_re_r <= io_dataIn_5_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_7_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_7_re_r <= data2cPrePre_7_im; // @[FFT3PipelineR23Calc.scala 175:25]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_7_re_r <= dataInRnd_7_re;
      end else begin
        data2c_7_re_r <= io_dataIn_7_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_0_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_0_re_r <= data2cPrePre_0_re; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_0_re_r <= dataInRnd_0_re;
      end else begin
        data2c_0_re_r <= io_dataIn_0_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_0_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_0_im_r <= data2cPrePre_0_im; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_0_im_r <= dataInRnd_0_im;
      end else begin
        data2c_0_im_r <= io_dataIn_0_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_2_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_2_re_r <= data2cPrePre_2_re; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_2_re_r <= dataInRnd_2_re;
      end else begin
        data2c_2_re_r <= io_dataIn_2_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_2_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_2_im_r <= data2cPrePre_2_im; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_2_im_r <= dataInRnd_2_im;
      end else begin
        data2c_2_im_r <= io_dataIn_2_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_3_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_3_re_r <= data2cPrePre_3_re; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_3_re_r <= dataInRnd_3_re;
      end else begin
        data2c_3_re_r <= io_dataIn_3_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_3_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_3_im_r <= data2cPrePre_3_im; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_3_im_r <= dataInRnd_3_im;
      end else begin
        data2c_3_im_r <= io_dataIn_3_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_4_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_4_re_r <= data2cPrePre_4_re; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_4_re_r <= dataInRnd_4_re;
      end else begin
        data2c_4_re_r <= io_dataIn_4_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_4_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_4_im_r <= data2cPrePre_4_im; // @[FFT3PipelineR23Calc.scala 169:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_4_im_r <= dataInRnd_4_im;
      end else begin
        data2c_4_im_r <= io_dataIn_4_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_6_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_6_re_r <= data2cPrePre_6_im; // @[FFT3PipelineR23Calc.scala 172:25]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_6_re_r <= dataInRnd_6_re;
      end else begin
        data2c_6_re_r <= io_dataIn_6_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_6_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data2c_6_im_r <= _data2cPre_6_im_T_2; // @[FFT3PipelineR23Calc.scala 173:25]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_6_im_r <= dataInRnd_6_im;
      end else begin
        data2c_6_im_r <= io_dataIn_6_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_0_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_0_re_r <= data3cPrePre_0_re; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_0_re_r <= data3cPrePre_0_re; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_0_re_r <= data2c_0_re_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_0_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_0_im_r <= data3cPrePre_0_im; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_0_im_r <= data3cPrePre_0_im; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_0_im_r <= data2c_0_im_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_1_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_1_re_r <= data3cPrePre_1_re; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_1_re_r <= data3cPrePre_1_re; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_1_re_r <= data2c_1_re_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_1_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_1_im_r <= data3cPrePre_1_im; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_1_im_r <= data3cPrePre_1_im; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_1_im_r <= _GEN_136;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_2_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_2_re_r <= data3cPrePre_2_re; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_2_re_r <= data3cPrePre_2_re; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_2_re_r <= data2c_2_re_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_2_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_2_im_r <= data3cPrePre_2_im; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_2_im_r <= data3cPrePre_2_im; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_2_im_r <= data2c_2_im_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_3_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_3_re_r <= data3cPrePre_3_im; // @[FFT3PipelineR23Calc.scala 183:25]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_3_re_r <= data3cPrePre_3_im; // @[FFT3PipelineR23Calc.scala 208:25]
      end else begin
        data3c_3_re_r <= data2c_3_re_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_3_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_3_im_r <= _data3cPre_3_im_T_2; // @[FFT3PipelineR23Calc.scala 184:25]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_3_im_r <= _data3cPre_3_im_T_2; // @[FFT3PipelineR23Calc.scala 209:25]
      end else begin
        data3c_3_im_r <= data2c_3_im_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_4_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_4_re_r <= data3cPrePre_4_re; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_4_re_r <= data3cPrePre_4_re; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_4_re_r <= data2c_4_re_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_4_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_4_im_r <= data3cPrePre_4_im; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_4_im_r <= data3cPrePre_4_im; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_4_im_r <= data2c_4_im_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_5_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_5_re_r <= multiplyUnits_7_io_product_re; // @[FFT3PipelineR23Calc.scala 186:22]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_5_re_r <= data3cPrePre_5_re; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_5_re_r <= data2c_5_re_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_5_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_5_im_r <= multiplyUnits_7_io_product_im; // @[FFT3PipelineR23Calc.scala 186:22]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_5_im_r <= data3cPrePre_5_im; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_5_im_r <= data2c_5_im_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_6_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_6_re_r <= data3cPrePre_6_re; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_6_re_r <= data3cPrePre_6_re; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_6_re_r <= data2c_6_re_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_6_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_6_im_r <= data3cPrePre_6_im; // @[FFT3PipelineR23Calc.scala 180:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_6_im_r <= data3cPrePre_6_im; // @[FFT3PipelineR23Calc.scala 205:26]
      end else begin
        data3c_6_im_r <= data2c_6_im_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_7_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_7_re_r <= multiplyUnits_8_io_product_re; // @[FFT3PipelineR23Calc.scala 188:22]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_7_re_r <= data3cPrePre_7_im; // @[FFT3PipelineR23Calc.scala 211:25]
      end else begin
        data3c_7_re_r <= data2c_7_re_r;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_7_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 166:31]
        data3c_7_im_r <= multiplyUnits_8_io_product_im; // @[FFT3PipelineR23Calc.scala 188:22]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 196:38]
        data3c_7_im_r <= _data3cPre_7_im_T_2; // @[FFT3PipelineR23Calc.scala 212:25]
      end else begin
        data3c_7_im_r <= data2c_7_im_r;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  twiLutIdxPre1c = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  wR2c_0_r = _RAND_1[13:0];
  _RAND_2 = {1{`RANDOM}};
  wR2c_1_r = _RAND_2[13:0];
  _RAND_3 = {1{`RANDOM}};
  wR2c_2_r = _RAND_3[13:0];
  _RAND_4 = {1{`RANDOM}};
  wR2c_3_r = _RAND_4[13:0];
  _RAND_5 = {1{`RANDOM}};
  wR2c_4_r = _RAND_5[13:0];
  _RAND_6 = {1{`RANDOM}};
  wR2c_5_r = _RAND_6[13:0];
  _RAND_7 = {1{`RANDOM}};
  wR2c_6_r = _RAND_7[13:0];
  _RAND_8 = {1{`RANDOM}};
  wR2c_7_r = _RAND_8[13:0];
  _RAND_9 = {1{`RANDOM}};
  wR2c_8_r = _RAND_9[13:0];
  _RAND_10 = {1{`RANDOM}};
  wI2c_0_r = _RAND_10[13:0];
  _RAND_11 = {1{`RANDOM}};
  wI2c_1_r = _RAND_11[13:0];
  _RAND_12 = {1{`RANDOM}};
  wI2c_2_r = _RAND_12[13:0];
  _RAND_13 = {1{`RANDOM}};
  wI2c_3_r = _RAND_13[13:0];
  _RAND_14 = {1{`RANDOM}};
  wI2c_4_r = _RAND_14[13:0];
  _RAND_15 = {1{`RANDOM}};
  wI2c_5_r = _RAND_15[13:0];
  _RAND_16 = {1{`RANDOM}};
  wI2c_6_r = _RAND_16[13:0];
  _RAND_17 = {1{`RANDOM}};
  wI2c_7_r = _RAND_17[13:0];
  _RAND_18 = {1{`RANDOM}};
  wI2c_8_r = _RAND_18[13:0];
  _RAND_19 = {1{`RANDOM}};
  wR3c_0_r = _RAND_19[13:0];
  _RAND_20 = {1{`RANDOM}};
  wR3c_1_r = _RAND_20[13:0];
  _RAND_21 = {1{`RANDOM}};
  wR3c_2_r = _RAND_21[13:0];
  _RAND_22 = {1{`RANDOM}};
  wR3c_3_r = _RAND_22[13:0];
  _RAND_23 = {1{`RANDOM}};
  wR3c_4_r = _RAND_23[13:0];
  _RAND_24 = {1{`RANDOM}};
  wR3c_5_r = _RAND_24[13:0];
  _RAND_25 = {1{`RANDOM}};
  wR3c_6_r = _RAND_25[13:0];
  _RAND_26 = {1{`RANDOM}};
  wI3c_0_r = _RAND_26[13:0];
  _RAND_27 = {1{`RANDOM}};
  wI3c_1_r = _RAND_27[13:0];
  _RAND_28 = {1{`RANDOM}};
  wI3c_2_r = _RAND_28[13:0];
  _RAND_29 = {1{`RANDOM}};
  wI3c_3_r = _RAND_29[13:0];
  _RAND_30 = {1{`RANDOM}};
  wI3c_4_r = _RAND_30[13:0];
  _RAND_31 = {1{`RANDOM}};
  wI3c_5_r = _RAND_31[13:0];
  _RAND_32 = {1{`RANDOM}};
  wI3c_6_r = _RAND_32[13:0];
  _RAND_33 = {1{`RANDOM}};
  data2c_1_im_r = _RAND_33[15:0];
  _RAND_34 = {1{`RANDOM}};
  data2c_5_im_r = _RAND_34[15:0];
  _RAND_35 = {1{`RANDOM}};
  data2c_7_im_r = _RAND_35[15:0];
  _RAND_36 = {1{`RANDOM}};
  data2c_1_re_r = _RAND_36[15:0];
  _RAND_37 = {1{`RANDOM}};
  data2c_5_re_r = _RAND_37[15:0];
  _RAND_38 = {1{`RANDOM}};
  data2c_7_re_r = _RAND_38[15:0];
  _RAND_39 = {1{`RANDOM}};
  data2c_0_re_r = _RAND_39[15:0];
  _RAND_40 = {1{`RANDOM}};
  data2c_0_im_r = _RAND_40[15:0];
  _RAND_41 = {1{`RANDOM}};
  data2c_2_re_r = _RAND_41[15:0];
  _RAND_42 = {1{`RANDOM}};
  data2c_2_im_r = _RAND_42[15:0];
  _RAND_43 = {1{`RANDOM}};
  data2c_3_re_r = _RAND_43[15:0];
  _RAND_44 = {1{`RANDOM}};
  data2c_3_im_r = _RAND_44[15:0];
  _RAND_45 = {1{`RANDOM}};
  data2c_4_re_r = _RAND_45[15:0];
  _RAND_46 = {1{`RANDOM}};
  data2c_4_im_r = _RAND_46[15:0];
  _RAND_47 = {1{`RANDOM}};
  data2c_6_re_r = _RAND_47[15:0];
  _RAND_48 = {1{`RANDOM}};
  data2c_6_im_r = _RAND_48[15:0];
  _RAND_49 = {1{`RANDOM}};
  data3c_0_re_r = _RAND_49[15:0];
  _RAND_50 = {1{`RANDOM}};
  data3c_0_im_r = _RAND_50[15:0];
  _RAND_51 = {1{`RANDOM}};
  data3c_1_re_r = _RAND_51[15:0];
  _RAND_52 = {1{`RANDOM}};
  data3c_1_im_r = _RAND_52[15:0];
  _RAND_53 = {1{`RANDOM}};
  data3c_2_re_r = _RAND_53[15:0];
  _RAND_54 = {1{`RANDOM}};
  data3c_2_im_r = _RAND_54[15:0];
  _RAND_55 = {1{`RANDOM}};
  data3c_3_re_r = _RAND_55[15:0];
  _RAND_56 = {1{`RANDOM}};
  data3c_3_im_r = _RAND_56[15:0];
  _RAND_57 = {1{`RANDOM}};
  data3c_4_re_r = _RAND_57[15:0];
  _RAND_58 = {1{`RANDOM}};
  data3c_4_im_r = _RAND_58[15:0];
  _RAND_59 = {1{`RANDOM}};
  data3c_5_re_r = _RAND_59[15:0];
  _RAND_60 = {1{`RANDOM}};
  data3c_5_im_r = _RAND_60[15:0];
  _RAND_61 = {1{`RANDOM}};
  data3c_6_re_r = _RAND_61[15:0];
  _RAND_62 = {1{`RANDOM}};
  data3c_6_im_r = _RAND_62[15:0];
  _RAND_63 = {1{`RANDOM}};
  data3c_7_re_r = _RAND_63[15:0];
  _RAND_64 = {1{`RANDOM}};
  data3c_7_im_r = _RAND_64[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFTEngine(
  input         clock,
  input         reset,
  input  [31:0] io_readDataSram0Bank_0,
  input  [31:0] io_readDataSram0Bank_1,
  input  [31:0] io_readDataSram0Bank_2,
  input  [31:0] io_readDataSram0Bank_3,
  input  [31:0] io_readDataSram0Bank_4,
  input  [31:0] io_readDataSram0Bank_5,
  input  [31:0] io_readDataSram0Bank_6,
  input  [31:0] io_readDataSram0Bank_7,
  input  [31:0] io_readDataSram1Bank_0,
  input  [31:0] io_readDataSram1Bank_1,
  input  [31:0] io_readDataSram1Bank_2,
  input  [31:0] io_readDataSram1Bank_3,
  input  [31:0] io_readDataSram1Bank_4,
  input  [31:0] io_readDataSram1Bank_5,
  input  [31:0] io_readDataSram1Bank_6,
  input  [31:0] io_readDataSram1Bank_7,
  output        io_readEnableSram0Bank_0,
  output        io_readEnableSram0Bank_1,
  output        io_readEnableSram0Bank_2,
  output        io_readEnableSram0Bank_3,
  output        io_readEnableSram0Bank_4,
  output        io_readEnableSram0Bank_5,
  output        io_readEnableSram0Bank_6,
  output        io_readEnableSram0Bank_7,
  output        io_readEnableSram1Bank_0,
  output        io_readEnableSram1Bank_1,
  output        io_readEnableSram1Bank_2,
  output        io_readEnableSram1Bank_3,
  output        io_readEnableSram1Bank_4,
  output        io_readEnableSram1Bank_5,
  output        io_readEnableSram1Bank_6,
  output        io_readEnableSram1Bank_7,
  output [31:0] io_writeDataSram0Bank_0,
  output [31:0] io_writeDataSram0Bank_1,
  output [31:0] io_writeDataSram0Bank_2,
  output [31:0] io_writeDataSram0Bank_3,
  output [31:0] io_writeDataSram0Bank_4,
  output [31:0] io_writeDataSram0Bank_5,
  output [31:0] io_writeDataSram0Bank_6,
  output [31:0] io_writeDataSram0Bank_7,
  output [31:0] io_writeDataSram1Bank_0,
  output [31:0] io_writeDataSram1Bank_1,
  output [31:0] io_writeDataSram1Bank_2,
  output [31:0] io_writeDataSram1Bank_3,
  output [31:0] io_writeDataSram1Bank_4,
  output [31:0] io_writeDataSram1Bank_5,
  output [31:0] io_writeDataSram1Bank_6,
  output [31:0] io_writeDataSram1Bank_7,
  output        io_writeEnableSram0Bank_0,
  output        io_writeEnableSram0Bank_1,
  output        io_writeEnableSram0Bank_2,
  output        io_writeEnableSram0Bank_3,
  output        io_writeEnableSram0Bank_4,
  output        io_writeEnableSram0Bank_5,
  output        io_writeEnableSram0Bank_6,
  output        io_writeEnableSram0Bank_7,
  output        io_writeEnableSram1Bank_0,
  output        io_writeEnableSram1Bank_1,
  output        io_writeEnableSram1Bank_2,
  output        io_writeEnableSram1Bank_3,
  output        io_writeEnableSram1Bank_4,
  output        io_writeEnableSram1Bank_5,
  output        io_writeEnableSram1Bank_6,
  output        io_writeEnableSram1Bank_7,
  output [3:0]  io_addrSram0Bank_0,
  output [3:0]  io_addrSram0Bank_1,
  output [3:0]  io_addrSram0Bank_2,
  output [3:0]  io_addrSram0Bank_3,
  output [3:0]  io_addrSram0Bank_4,
  output [3:0]  io_addrSram0Bank_5,
  output [3:0]  io_addrSram0Bank_6,
  output [3:0]  io_addrSram0Bank_7,
  output [3:0]  io_addrSram1Bank_0,
  output [3:0]  io_addrSram1Bank_1,
  output [3:0]  io_addrSram1Bank_2,
  output [3:0]  io_addrSram1Bank_3,
  output [3:0]  io_addrSram1Bank_4,
  output [3:0]  io_addrSram1Bank_5,
  output [3:0]  io_addrSram1Bank_6,
  output [3:0]  io_addrSram1Bank_7,
  output        io_fftDone,
  input         io_fftEngineKick,
  input         io_fftMode,
  input         io_fftRShiftP0_0,
  input         io_fftRShiftP0_1,
  input         io_fftRShiftP0_2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
`endif // RANDOMIZE_REG_INIT
  wire  fftCalc_clock; // @[FFTEngine.scala 362:25]
  wire  fftCalc_reset; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_0_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_0_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_1_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_1_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_2_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_2_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_3_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_3_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_4_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_4_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_5_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_5_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_6_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_6_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_7_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataIn_7_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_0_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_0_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_1_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_1_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_2_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_2_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_3_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_3_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_4_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_4_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_5_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_5_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_6_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_6_re; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_7_im; // @[FFTEngine.scala 362:25]
  wire [15:0] fftCalc_io_dataOut3c_7_re; // @[FFTEngine.scala 362:25]
  wire [5:0] fftCalc_io_radixCount; // @[FFTEngine.scala 362:25]
  wire [1:0] fftCalc_io_calcMode; // @[FFTEngine.scala 362:25]
  wire [1:0] fftCalc_io_phaseCount; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_rShiftSym; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_isFFT; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_state1c; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_state2c; // @[FFTEngine.scala 362:25]
  reg [2:0] stateReg; // @[FFTEngine.scala 46:27]
  reg [6:0] addrSProc; // @[FFTEngine.scala 48:29]
  reg [1:0] phaseCount; // @[FFTEngine.scala 50:29]
  wire  _T_2 = addrSProc == 7'hf; // @[FFTEngine.scala 117:33]
  wire  _T_4 = addrSProc == 7'h3; // @[FFTEngine.scala 124:33]
  wire [2:0] _GEN_2 = addrSProc == 7'h3 ? 3'h3 : stateReg; // @[FFTEngine.scala 124:49 125:30 127:30]
  wire  _T_6 = phaseCount == 2'h2; // @[FFTEngine.scala 131:33]
  wire [2:0] _GEN_3 = phaseCount == 2'h2 ? 3'h7 : 3'h1; // @[FFTEngine.scala 131:50 132:30 134:30]
  wire [2:0] _GEN_4 = 3'h7 == stateReg ? 3'h0 : stateReg; // @[FFTEngine.scala 108:26 138:26 46:27]
  wire [2:0] _GEN_5 = 3'h3 == stateReg ? _GEN_3 : _GEN_4; // @[FFTEngine.scala 108:26]
  wire  _radixInit_T = stateReg == 3'h0; // @[FFTEngine.scala 145:31]
  wire  _radixInit_T_1 = stateReg == 3'h1; // @[FFTEngine.scala 146:16]
  wire  _radixInit_T_3 = stateReg == 3'h1 & _T_2; // @[FFTEngine.scala 146:30]
  wire  _radixInit_T_4 = stateReg == 3'h0 | _radixInit_T_3; // @[FFTEngine.scala 145:45]
  wire  _radixInit_T_5 = stateReg == 3'h2; // @[FFTEngine.scala 147:16]
  wire  _radixInit_T_7 = stateReg == 3'h2 & _T_4; // @[FFTEngine.scala 147:31]
  wire  _radixInit_T_8 = _radixInit_T_4 | _radixInit_T_7; // @[FFTEngine.scala 146:63]
  wire  _radixInit_T_9 = stateReg == 3'h3; // @[FFTEngine.scala 148:15]
  wire  _radixInit_T_10 = _radixInit_T_8 | _radixInit_T_9; // @[FFTEngine.scala 147:63]
  wire  _radixInit_T_11 = stateReg == 3'h4; // @[FFTEngine.scala 149:16]
  wire  _radixInit_T_13 = stateReg == 3'h4 & addrSProc == 7'h3f; // @[FFTEngine.scala 149:28]
  wire  _radixInit_T_14 = _radixInit_T_10 | _radixInit_T_13; // @[FFTEngine.scala 148:32]
  wire  _radixInit_T_15 = stateReg == 3'h5; // @[FFTEngine.scala 150:16]
  wire  _radixInit_T_17 = stateReg == 3'h5 & _T_4; // @[FFTEngine.scala 150:29]
  wire  _radixInit_T_18 = _radixInit_T_14 | _radixInit_T_17; // @[FFTEngine.scala 149:62]
  wire  _radixInit_T_19 = stateReg == 3'h6; // @[FFTEngine.scala 151:15]
  wire  _radixInit_T_20 = _radixInit_T_18 | _radixInit_T_19; // @[FFTEngine.scala 150:62]
  wire  _radixInit_T_21 = stateReg == 3'h7; // @[FFTEngine.scala 152:15]
  wire  radixInit = _radixInit_T_20 | _radixInit_T_21; // @[FFTEngine.scala 151:30]
  wire  _radixUp_T_4 = _radixInit_T_1 | _radixInit_T_5 | _radixInit_T_11; // @[FFTEngine.scala 154:70]
  wire  radixUp = _radixUp_T_4 | _radixInit_T_15; // @[FFTEngine.scala 155:27]
  wire [6:0] _radixCount_T_1 = addrSProc + 7'h1; // @[FFTEngine.scala 161:34]
  wire  _phaseInit_T_3 = _radixInit_T_9 & _T_6; // @[FFTEngine.scala 167:33]
  wire  _phaseInit_T_4 = _radixInit_T | _phaseInit_T_3; // @[FFTEngine.scala 166:45]
  wire  _phaseInit_T_6 = phaseCount == 2'h1; // @[FFTEngine.scala 168:45]
  wire  _phaseInit_T_7 = _radixInit_T_19 & phaseCount == 2'h1; // @[FFTEngine.scala 168:31]
  wire  _phaseInit_T_8 = _phaseInit_T_4 | _phaseInit_T_7; // @[FFTEngine.scala 167:65]
  wire  phaseInit = _phaseInit_T_8 | _radixInit_T_21; // @[FFTEngine.scala 168:64]
  wire  phaseUp = _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 171:46]
  wire [1:0] _phaseCount_T_1 = phaseCount + 2'h1; // @[FFTEngine.scala 176:34]
  reg  srcBuffer; // @[FFTEngine.scala 181:28]
  wire  _srcBufferNext_T_3 = ~srcBuffer; // @[FFTEngine.scala 183:79]
  wire  srcBufferNext = phaseUp & ~srcBuffer; // @[FFTEngine.scala 183:77]
  wire  srcUp = _radixInit_T | _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 185:70]
  wire [6:0] _addrKernelPre_0_T_1 = {addrSProc[3:0],3'h0}; // @[Cat.scala 33:92]
  wire [6:0] _addrKernelPre_1_T_1 = {addrSProc[3:0],3'h1}; // @[Cat.scala 33:92]
  wire [6:0] _addrKernelPre_2_T_1 = {addrSProc[3:0],3'h2}; // @[Cat.scala 33:92]
  wire [6:0] _addrKernelPre_3_T_1 = {addrSProc[3:0],3'h3}; // @[Cat.scala 33:92]
  wire [6:0] _addrKernelPre_4_T_1 = {addrSProc[3:0],3'h4}; // @[Cat.scala 33:92]
  wire [6:0] _addrKernelPre_5_T_1 = {addrSProc[3:0],3'h5}; // @[Cat.scala 33:92]
  wire [6:0] _addrKernelPre_6_T_1 = {addrSProc[3:0],3'h6}; // @[Cat.scala 33:92]
  wire [6:0] _addrKernelPre_7_T_1 = {addrSProc[3:0],3'h7}; // @[Cat.scala 33:92]
  wire [2:0] _addrKernelPre_0_T_4 = {phaseCount, 1'h0}; // @[FFTEngine.scala 227:121]
  wire [2:0] _GEN_1395 = {{1'd0}, phaseCount}; // @[FFTEngine.scala 227:127]
  wire [2:0] _addrKernelPre_0_T_6 = _addrKernelPre_0_T_4 + _GEN_1395; // @[FFTEngine.scala 227:127]
  wire [13:0] _addrKernelPre_0_dataTemp_T = {3'h0,addrSProc[3:0],3'h0,addrSProc[3:0]}; // @[Cat.scala 33:92]
  wire [13:0] addrKernelPre_0_dataTemp = _addrKernelPre_0_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [13:0] _addrKernelPre_1_dataTemp_T = {3'h1,addrSProc[3:0],3'h1,addrSProc[3:0]}; // @[Cat.scala 33:92]
  wire [13:0] addrKernelPre_1_dataTemp = _addrKernelPre_1_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [13:0] _addrKernelPre_2_dataTemp_T = {3'h2,addrSProc[3:0],3'h2,addrSProc[3:0]}; // @[Cat.scala 33:92]
  wire [13:0] addrKernelPre_2_dataTemp = _addrKernelPre_2_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [13:0] _addrKernelPre_3_dataTemp_T = {3'h3,addrSProc[3:0],3'h3,addrSProc[3:0]}; // @[Cat.scala 33:92]
  wire [13:0] addrKernelPre_3_dataTemp = _addrKernelPre_3_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [13:0] _addrKernelPre_4_dataTemp_T = {3'h4,addrSProc[3:0],3'h4,addrSProc[3:0]}; // @[Cat.scala 33:92]
  wire [13:0] addrKernelPre_4_dataTemp = _addrKernelPre_4_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [13:0] _addrKernelPre_5_dataTemp_T = {3'h5,addrSProc[3:0],3'h5,addrSProc[3:0]}; // @[Cat.scala 33:92]
  wire [13:0] addrKernelPre_5_dataTemp = _addrKernelPre_5_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [13:0] _addrKernelPre_6_dataTemp_T = {3'h6,addrSProc[3:0],3'h6,addrSProc[3:0]}; // @[Cat.scala 33:92]
  wire [13:0] addrKernelPre_6_dataTemp = _addrKernelPre_6_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [13:0] _addrKernelPre_7_dataTemp_T = {3'h7,addrSProc[3:0],3'h7,addrSProc[3:0]}; // @[Cat.scala 33:92]
  wire [13:0] addrKernelPre_7_dataTemp = _addrKernelPre_7_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [6:0] addrKernelPre_0 = _T_6 ? _addrKernelPre_0_T_1 : addrKernelPre_0_dataTemp[6:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [6:0] addrKernelPre_1 = _T_6 ? _addrKernelPre_1_T_1 : addrKernelPre_1_dataTemp[6:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [6:0] addrKernelPre_2 = _T_6 ? _addrKernelPre_2_T_1 : addrKernelPre_2_dataTemp[6:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [6:0] addrKernelPre_3 = _T_6 ? _addrKernelPre_3_T_1 : addrKernelPre_3_dataTemp[6:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [6:0] addrKernelPre_4 = _T_6 ? _addrKernelPre_4_T_1 : addrKernelPre_4_dataTemp[6:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [6:0] addrKernelPre_5 = _T_6 ? _addrKernelPre_5_T_1 : addrKernelPre_5_dataTemp[6:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [6:0] addrKernelPre_6 = _T_6 ? _addrKernelPre_6_T_1 : addrKernelPre_6_dataTemp[6:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [6:0] addrKernelPre_7 = _T_6 ? _addrKernelPre_7_T_1 : addrKernelPre_7_dataTemp[6:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire  sameAddr = addrKernelPre_0 == addrKernelPre_1; // @[FFTEngine.scala 248:30]
  reg [3:0] addrIn1c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn2c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn3c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn1c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn2c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn3c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn1c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn2c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn3c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn1c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn2c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn3c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn1c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn2c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn3c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn1c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn2c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn3c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn1c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn2c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn3c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn1c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn2c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrIn3c_7_r; // @[Reg.scala 35:20]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T = {{2'd0}, addrKernelPre_0[6:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1404 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_2 = {{1'd0}, _GEN_1404}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_4 = {{5'd0}, addrKernelPre_0[6:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1406 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_0_0 = _addrInBankSelKernelPrePre_sum_T_2[2:0] + _GEN_1406; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_7 = {{1'd0}, addrKernelPre_0[6:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1408 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_7[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_9 = {{1'd0}, _GEN_1408}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_11 = {{4'd0}, addrKernelPre_0[6:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1410 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_0_1 = _addrInBankSelKernelPrePre_sum_T_9[2:0] + _GEN_1410; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1411 = {{2'd0}, addrKernelPre_0[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_16 = {{1'd0}, _GEN_1411}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_18 = {{3'd0}, addrKernelPre_0[6:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1413 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_18[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_21 = _addrInBankSelKernelPrePre_sum_T_16[2:0] + _GEN_1413; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_22 = {{6'd0}, addrKernelPre_0[6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1415 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_22[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_0_2 = _addrInBankSelKernelPrePre_sum_T_21 + _GEN_1415; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_25 = {{2'd0}, addrKernelPre_1[6:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1417 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_25[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_27 = {{1'd0}, _GEN_1417}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_29 = {{5'd0}, addrKernelPre_1[6:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1419 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_29[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_1_0 = _addrInBankSelKernelPrePre_sum_T_27[2:0] + _GEN_1419; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_32 = {{1'd0}, addrKernelPre_1[6:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1421 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_32[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_34 = {{1'd0}, _GEN_1421}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_36 = {{4'd0}, addrKernelPre_1[6:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1423 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_36[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_1_1 = _addrInBankSelKernelPrePre_sum_T_34[2:0] + _GEN_1423; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1424 = {{2'd0}, addrKernelPre_1[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_41 = {{1'd0}, _GEN_1424}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_43 = {{3'd0}, addrKernelPre_1[6:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1426 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_43[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_46 = _addrInBankSelKernelPrePre_sum_T_41[2:0] + _GEN_1426; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_47 = {{6'd0}, addrKernelPre_1[6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1428 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_47[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_1_2 = _addrInBankSelKernelPrePre_sum_T_46 + _GEN_1428; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_50 = {{2'd0}, addrKernelPre_2[6:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1430 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_50[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_52 = {{1'd0}, _GEN_1430}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_54 = {{5'd0}, addrKernelPre_2[6:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1432 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_54[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_2_0 = _addrInBankSelKernelPrePre_sum_T_52[2:0] + _GEN_1432; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_57 = {{1'd0}, addrKernelPre_2[6:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1434 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_57[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_59 = {{1'd0}, _GEN_1434}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_61 = {{4'd0}, addrKernelPre_2[6:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1436 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_61[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_2_1 = _addrInBankSelKernelPrePre_sum_T_59[2:0] + _GEN_1436; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1437 = {{2'd0}, addrKernelPre_2[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_66 = {{1'd0}, _GEN_1437}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_68 = {{3'd0}, addrKernelPre_2[6:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1439 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_68[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_71 = _addrInBankSelKernelPrePre_sum_T_66[2:0] + _GEN_1439; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_72 = {{6'd0}, addrKernelPre_2[6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1441 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_72[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_2_2 = _addrInBankSelKernelPrePre_sum_T_71 + _GEN_1441; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_75 = {{2'd0}, addrKernelPre_3[6:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1443 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_75[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_77 = {{1'd0}, _GEN_1443}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_79 = {{5'd0}, addrKernelPre_3[6:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1445 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_79[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_3_0 = _addrInBankSelKernelPrePre_sum_T_77[2:0] + _GEN_1445; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_82 = {{1'd0}, addrKernelPre_3[6:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1447 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_82[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_84 = {{1'd0}, _GEN_1447}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_86 = {{4'd0}, addrKernelPre_3[6:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1449 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_86[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_3_1 = _addrInBankSelKernelPrePre_sum_T_84[2:0] + _GEN_1449; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1450 = {{2'd0}, addrKernelPre_3[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_91 = {{1'd0}, _GEN_1450}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_93 = {{3'd0}, addrKernelPre_3[6:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1452 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_93[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_96 = _addrInBankSelKernelPrePre_sum_T_91[2:0] + _GEN_1452; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_97 = {{6'd0}, addrKernelPre_3[6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1454 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_97[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_3_2 = _addrInBankSelKernelPrePre_sum_T_96 + _GEN_1454; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_100 = {{2'd0}, addrKernelPre_4[6:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1456 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_100[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_102 = {{1'd0}, _GEN_1456}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_104 = {{5'd0}, addrKernelPre_4[6:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1458 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_104[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_4_0 = _addrInBankSelKernelPrePre_sum_T_102[2:0] + _GEN_1458; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_107 = {{1'd0}, addrKernelPre_4[6:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1460 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_107[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_109 = {{1'd0}, _GEN_1460}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_111 = {{4'd0}, addrKernelPre_4[6:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1462 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_111[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_4_1 = _addrInBankSelKernelPrePre_sum_T_109[2:0] + _GEN_1462; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1463 = {{2'd0}, addrKernelPre_4[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_116 = {{1'd0}, _GEN_1463}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_118 = {{3'd0}, addrKernelPre_4[6:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1465 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_118[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_121 = _addrInBankSelKernelPrePre_sum_T_116[2:0] + _GEN_1465; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_122 = {{6'd0}, addrKernelPre_4[6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1467 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_122[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_4_2 = _addrInBankSelKernelPrePre_sum_T_121 + _GEN_1467; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_125 = {{2'd0}, addrKernelPre_5[6:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1469 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_125[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_127 = {{1'd0}, _GEN_1469}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_129 = {{5'd0}, addrKernelPre_5[6:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1471 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_129[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_5_0 = _addrInBankSelKernelPrePre_sum_T_127[2:0] + _GEN_1471; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_132 = {{1'd0}, addrKernelPre_5[6:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1473 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_132[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_134 = {{1'd0}, _GEN_1473}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_136 = {{4'd0}, addrKernelPre_5[6:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1475 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_136[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_5_1 = _addrInBankSelKernelPrePre_sum_T_134[2:0] + _GEN_1475; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1476 = {{2'd0}, addrKernelPre_5[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_141 = {{1'd0}, _GEN_1476}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_143 = {{3'd0}, addrKernelPre_5[6:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1478 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_143[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_146 = _addrInBankSelKernelPrePre_sum_T_141[2:0] + _GEN_1478; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_147 = {{6'd0}, addrKernelPre_5[6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1480 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_147[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_5_2 = _addrInBankSelKernelPrePre_sum_T_146 + _GEN_1480; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_150 = {{2'd0}, addrKernelPre_6[6:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1482 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_150[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_152 = {{1'd0}, _GEN_1482}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_154 = {{5'd0}, addrKernelPre_6[6:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1484 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_154[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_6_0 = _addrInBankSelKernelPrePre_sum_T_152[2:0] + _GEN_1484; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_157 = {{1'd0}, addrKernelPre_6[6:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1486 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_157[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_159 = {{1'd0}, _GEN_1486}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_161 = {{4'd0}, addrKernelPre_6[6:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1488 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_161[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_6_1 = _addrInBankSelKernelPrePre_sum_T_159[2:0] + _GEN_1488; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1489 = {{2'd0}, addrKernelPre_6[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_166 = {{1'd0}, _GEN_1489}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_168 = {{3'd0}, addrKernelPre_6[6:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1491 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_168[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_171 = _addrInBankSelKernelPrePre_sum_T_166[2:0] + _GEN_1491; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_172 = {{6'd0}, addrKernelPre_6[6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1493 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_172[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_6_2 = _addrInBankSelKernelPrePre_sum_T_171 + _GEN_1493; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_175 = {{2'd0}, addrKernelPre_7[6:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1495 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_175[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_177 = {{1'd0}, _GEN_1495}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_179 = {{5'd0}, addrKernelPre_7[6:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1497 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_179[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_7_0 = _addrInBankSelKernelPrePre_sum_T_177[2:0] + _GEN_1497; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_182 = {{1'd0}, addrKernelPre_7[6:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1499 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_182[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_184 = {{1'd0}, _GEN_1499}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_186 = {{4'd0}, addrKernelPre_7[6:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1501 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_186[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_7_1 = _addrInBankSelKernelPrePre_sum_T_184[2:0] + _GEN_1501; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1502 = {{2'd0}, addrKernelPre_7[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_191 = {{1'd0}, _GEN_1502}; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_193 = {{3'd0}, addrKernelPre_7[6:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1504 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_193[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_196 = _addrInBankSelKernelPrePre_sum_T_191[2:0] + _GEN_1504; // @[FFTEngine.scala 261:107]
  wire [6:0] _addrInBankSelKernelPrePre_sum_T_197 = {{6'd0}, addrKernelPre_7[6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1506 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_197[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_7_2 = _addrInBankSelKernelPrePre_sum_T_196 + _GEN_1506; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPre_T_1 = {{1'd0}, addrInBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_3 = {_addrInBankSelKernelPre_T_1[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1507 = {{1'd0}, addrInBankSelKernelPrePre_0_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_5 = _addrInBankSelKernelPre_T_3 + _GEN_1507; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_6 = {_addrInBankSelKernelPre_T_5, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1508 = {{2'd0}, addrInBankSelKernelPrePre_0_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_8 = _addrInBankSelKernelPre_T_6 + _GEN_1508; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_10 = {{1'd0}, addrInBankSelKernelPrePre_1_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_12 = {_addrInBankSelKernelPre_T_10[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1509 = {{1'd0}, addrInBankSelKernelPrePre_1_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_14 = _addrInBankSelKernelPre_T_12 + _GEN_1509; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_15 = {_addrInBankSelKernelPre_T_14, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1510 = {{2'd0}, addrInBankSelKernelPrePre_1_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_17 = _addrInBankSelKernelPre_T_15 + _GEN_1510; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_19 = {{1'd0}, addrInBankSelKernelPrePre_2_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_21 = {_addrInBankSelKernelPre_T_19[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1511 = {{1'd0}, addrInBankSelKernelPrePre_2_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_23 = _addrInBankSelKernelPre_T_21 + _GEN_1511; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_24 = {_addrInBankSelKernelPre_T_23, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1512 = {{2'd0}, addrInBankSelKernelPrePre_2_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_26 = _addrInBankSelKernelPre_T_24 + _GEN_1512; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_28 = {{1'd0}, addrInBankSelKernelPrePre_3_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_30 = {_addrInBankSelKernelPre_T_28[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1513 = {{1'd0}, addrInBankSelKernelPrePre_3_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_32 = _addrInBankSelKernelPre_T_30 + _GEN_1513; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_33 = {_addrInBankSelKernelPre_T_32, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1514 = {{2'd0}, addrInBankSelKernelPrePre_3_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_35 = _addrInBankSelKernelPre_T_33 + _GEN_1514; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_37 = {{1'd0}, addrInBankSelKernelPrePre_4_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_39 = {_addrInBankSelKernelPre_T_37[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1515 = {{1'd0}, addrInBankSelKernelPrePre_4_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_41 = _addrInBankSelKernelPre_T_39 + _GEN_1515; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_42 = {_addrInBankSelKernelPre_T_41, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1516 = {{2'd0}, addrInBankSelKernelPrePre_4_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_44 = _addrInBankSelKernelPre_T_42 + _GEN_1516; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_46 = {{1'd0}, addrInBankSelKernelPrePre_5_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_48 = {_addrInBankSelKernelPre_T_46[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1517 = {{1'd0}, addrInBankSelKernelPrePre_5_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_50 = _addrInBankSelKernelPre_T_48 + _GEN_1517; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_51 = {_addrInBankSelKernelPre_T_50, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1518 = {{2'd0}, addrInBankSelKernelPrePre_5_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_53 = _addrInBankSelKernelPre_T_51 + _GEN_1518; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_55 = {{1'd0}, addrInBankSelKernelPrePre_6_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_57 = {_addrInBankSelKernelPre_T_55[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1519 = {{1'd0}, addrInBankSelKernelPrePre_6_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_59 = _addrInBankSelKernelPre_T_57 + _GEN_1519; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_60 = {_addrInBankSelKernelPre_T_59, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1520 = {{2'd0}, addrInBankSelKernelPrePre_6_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_62 = _addrInBankSelKernelPre_T_60 + _GEN_1520; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_64 = {{1'd0}, addrInBankSelKernelPrePre_7_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_66 = {_addrInBankSelKernelPre_T_64[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1521 = {{1'd0}, addrInBankSelKernelPrePre_7_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_68 = _addrInBankSelKernelPre_T_66 + _GEN_1521; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_69 = {_addrInBankSelKernelPre_T_68, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1522 = {{2'd0}, addrInBankSelKernelPrePre_7_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_71 = _addrInBankSelKernelPre_T_69 + _GEN_1522; // @[FFTEngine.scala 267:142]
  wire [2:0] addrInBankSelKernelPre_0 = _addrInBankSelKernelPre_T_8[2:0]; // @[FFTEngine.scala 267:158]
  wire [2:0] addrInBankSelKernelPre_1 = _addrInBankSelKernelPre_T_17[2:0]; // @[FFTEngine.scala 267:158]
  wire [2:0] addrInBankSelKernelPre_2 = _addrInBankSelKernelPre_T_26[2:0]; // @[FFTEngine.scala 267:158]
  wire [2:0] addrInBankSelKernelPre_3 = _addrInBankSelKernelPre_T_35[2:0]; // @[FFTEngine.scala 267:158]
  wire [2:0] addrInBankSelKernelPre_4 = _addrInBankSelKernelPre_T_44[2:0]; // @[FFTEngine.scala 267:158]
  wire [2:0] addrInBankSelKernelPre_5 = _addrInBankSelKernelPre_T_53[2:0]; // @[FFTEngine.scala 267:158]
  wire [2:0] addrInBankSelKernelPre_6 = _addrInBankSelKernelPre_T_62[2:0]; // @[FFTEngine.scala 267:158]
  wire [2:0] addrInBankSelKernelPre_7 = _addrInBankSelKernelPre_T_71[2:0]; // @[FFTEngine.scala 267:158]
  wire [2:0] addrInBankSelKernel_0 = _radixInit_T_1 ? addrInBankSelKernelPre_0 : 3'h0; // @[FFTEngine.scala 272:27 273:36 275:36]
  wire [2:0] addrInBankSelKernel_1 = _radixInit_T_1 ? addrInBankSelKernelPre_1 : 3'h1; // @[FFTEngine.scala 272:27 273:36 275:36]
  wire [2:0] addrInBankSelKernel_2 = _radixInit_T_1 ? addrInBankSelKernelPre_2 : 3'h2; // @[FFTEngine.scala 272:27 273:36 275:36]
  wire [2:0] addrInBankSelKernel_3 = _radixInit_T_1 ? addrInBankSelKernelPre_3 : 3'h3; // @[FFTEngine.scala 272:27 273:36 275:36]
  wire [2:0] addrInBankSelKernel_4 = _radixInit_T_1 ? addrInBankSelKernelPre_4 : 3'h4; // @[FFTEngine.scala 272:27 273:36 275:36]
  wire [2:0] addrInBankSelKernel_5 = _radixInit_T_1 ? addrInBankSelKernelPre_5 : 3'h5; // @[FFTEngine.scala 272:27 273:36 275:36]
  wire [2:0] addrInBankSelKernel_6 = _radixInit_T_1 ? addrInBankSelKernelPre_6 : 3'h6; // @[FFTEngine.scala 272:27 273:36 275:36]
  wire [2:0] addrInBankSelKernel_7 = _radixInit_T_1 ? addrInBankSelKernelPre_7 : 3'h7; // @[FFTEngine.scala 272:27 273:36 275:36]
  wire  addrInBankSelProcPre__0 = addrKernelPre_0[0] ^ addrKernelPre_0[6]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre__1 = addrKernelPre_0[1] ^ addrKernelPre_0[5]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre__2 = addrKernelPre_0[2] ^ addrKernelPre_0[4]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_0 = {addrInBankSelProcPre__0,addrInBankSelProcPre__1,addrInBankSelProcPre__2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_1_0 = addrKernelPre_1[0] ^ addrKernelPre_1[6]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_1_1 = addrKernelPre_1[1] ^ addrKernelPre_1[5]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_1_2 = addrKernelPre_1[2] ^ addrKernelPre_1[4]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_1 = {addrInBankSelProcPre_1_0,addrInBankSelProcPre_1_1,addrInBankSelProcPre_1_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_2_0 = addrKernelPre_2[0] ^ addrKernelPre_2[6]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_2_1 = addrKernelPre_2[1] ^ addrKernelPre_2[5]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_2_2 = addrKernelPre_2[2] ^ addrKernelPre_2[4]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_2 = {addrInBankSelProcPre_2_0,addrInBankSelProcPre_2_1,addrInBankSelProcPre_2_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_3_0 = addrKernelPre_3[0] ^ addrKernelPre_3[6]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_3_1 = addrKernelPre_3[1] ^ addrKernelPre_3[5]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_3_2 = addrKernelPre_3[2] ^ addrKernelPre_3[4]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_3 = {addrInBankSelProcPre_3_0,addrInBankSelProcPre_3_1,addrInBankSelProcPre_3_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_4_0 = addrKernelPre_4[0] ^ addrKernelPre_4[6]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_4_1 = addrKernelPre_4[1] ^ addrKernelPre_4[5]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_4_2 = addrKernelPre_4[2] ^ addrKernelPre_4[4]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_4 = {addrInBankSelProcPre_4_0,addrInBankSelProcPre_4_1,addrInBankSelProcPre_4_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_5_0 = addrKernelPre_5[0] ^ addrKernelPre_5[6]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_5_1 = addrKernelPre_5[1] ^ addrKernelPre_5[5]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_5_2 = addrKernelPre_5[2] ^ addrKernelPre_5[4]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_5 = {addrInBankSelProcPre_5_0,addrInBankSelProcPre_5_1,addrInBankSelProcPre_5_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_6_0 = addrKernelPre_6[0] ^ addrKernelPre_6[6]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_6_1 = addrKernelPre_6[1] ^ addrKernelPre_6[5]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_6_2 = addrKernelPre_6[2] ^ addrKernelPre_6[4]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_6 = {addrInBankSelProcPre_6_0,addrInBankSelProcPre_6_1,addrInBankSelProcPre_6_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_7_0 = addrKernelPre_7[0] ^ addrKernelPre_7[6]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_7_1 = addrKernelPre_7[1] ^ addrKernelPre_7[5]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_7_2 = addrKernelPre_7[2] ^ addrKernelPre_7[4]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_7 = {addrInBankSelProcPre_7_0,addrInBankSelProcPre_7_1,addrInBankSelProcPre_7_2}; // @[Cat.scala 33:92]
  reg [2:0] addrInBankSelKernel1c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel2c_0_r; // @[Reg.scala 35:20]
  wire [3:0] addrInBankSelKernel1c_0 = {{1'd0}, addrInBankSelKernel1c_0_r}; // @[FFTEngine.scala 302:37 307:34]
  reg [3:0] addrInBankSelKernel3c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSelKernel1c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel2c_1_r; // @[Reg.scala 35:20]
  wire [3:0] addrInBankSelKernel1c_1 = {{1'd0}, addrInBankSelKernel1c_1_r}; // @[FFTEngine.scala 302:37 307:34]
  reg [3:0] addrInBankSelKernel3c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSelKernel1c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel2c_2_r; // @[Reg.scala 35:20]
  wire [3:0] addrInBankSelKernel1c_2 = {{1'd0}, addrInBankSelKernel1c_2_r}; // @[FFTEngine.scala 302:37 307:34]
  reg [3:0] addrInBankSelKernel3c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSelKernel1c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel2c_3_r; // @[Reg.scala 35:20]
  wire [3:0] addrInBankSelKernel1c_3 = {{1'd0}, addrInBankSelKernel1c_3_r}; // @[FFTEngine.scala 302:37 307:34]
  reg [3:0] addrInBankSelKernel3c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel1c_4_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_66 = {{1'd0}, addrInBankSelKernel_4}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelKernel2c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel3c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel1c_5_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_69 = {{1'd0}, addrInBankSelKernel_5}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelKernel2c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel3c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel1c_6_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_72 = {{1'd0}, addrInBankSelKernel_6}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelKernel2c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel3c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel1c_7_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_75 = {{1'd0}, addrInBankSelKernel_7}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelKernel2c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel3c_7_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSelProc1c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc2c_0_r; // @[Reg.scala 35:20]
  wire [3:0] addrInBankSelProc1c_0 = {{1'd0}, addrInBankSelProc1c_0_r}; // @[FFTEngine.scala 312:35 317:32]
  reg [3:0] addrInBankSelProc3c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSelProc1c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc2c_1_r; // @[Reg.scala 35:20]
  wire [3:0] addrInBankSelProc1c_1 = {{1'd0}, addrInBankSelProc1c_1_r}; // @[FFTEngine.scala 312:35 317:32]
  reg [3:0] addrInBankSelProc3c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSelProc1c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc2c_2_r; // @[Reg.scala 35:20]
  wire [3:0] addrInBankSelProc1c_2 = {{1'd0}, addrInBankSelProc1c_2_r}; // @[FFTEngine.scala 312:35 317:32]
  reg [3:0] addrInBankSelProc3c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSelProc1c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc2c_3_r; // @[Reg.scala 35:20]
  wire [3:0] addrInBankSelProc1c_3 = {{1'd0}, addrInBankSelProc1c_3_r}; // @[FFTEngine.scala 312:35 317:32]
  reg [3:0] addrInBankSelProc3c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc1c_4_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_90 = {{1'd0}, addrInBankSelProc_4}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelProc2c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc3c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc1c_5_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_93 = {{1'd0}, addrInBankSelProc_5}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelProc2c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc3c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc1c_6_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_96 = {{1'd0}, addrInBankSelProc_6}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelProc2c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc3c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc1c_7_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_99 = {{1'd0}, addrInBankSelProc_7}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelProc2c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc3c_7_r; // @[Reg.scala 35:20]
  reg  kernelState1c; // @[Reg.scala 35:20]
  reg  kernelState2c; // @[Reg.scala 35:20]
  reg  kernelState3c; // @[Reg.scala 35:20]
  reg  sameAddr1c; // @[Reg.scala 35:20]
  reg  sameAddr2c; // @[Reg.scala 35:20]
  reg  sameAddr3c; // @[Reg.scala 35:20]
  wire  _addrInBankSel_0_T_1 = phaseCount == 2'h0; // @[FFTEngine.scala 345:76]
  wire [2:0] _addrInBankSel_1_T_4 = _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_1 : addrInBankSelKernel_1; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_1 = io_fftMode ? addrInBankSelKernel_1 : _addrInBankSel_1_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_2_T_4 = _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_2 : addrInBankSelKernel_2; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_2 = io_fftMode ? addrInBankSelKernel_2 : _addrInBankSel_2_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_3_T_4 = _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_3 : addrInBankSelKernel_3; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_3 = io_fftMode ? addrInBankSelKernel_3 : _addrInBankSel_3_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_4_T_4 = _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_4 : addrInBankSelKernel_4; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_4 = io_fftMode ? addrInBankSelKernel_4 : _addrInBankSel_4_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_5_T_4 = _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_5 : addrInBankSelKernel_5; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_5 = io_fftMode ? addrInBankSelKernel_5 : _addrInBankSel_5_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_6_T_4 = _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_6 : addrInBankSelKernel_6; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_6 = io_fftMode ? addrInBankSelKernel_6 : _addrInBankSel_6_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_7_T_4 = _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_7 : addrInBankSelKernel_7; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_7 = io_fftMode ? addrInBankSelKernel_7 : _addrInBankSel_7_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [15:0] _dataInPre_0_T_1 = io_readDataSram1Bank_0[15:0]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_0_T_3 = io_readDataSram1Bank_0[31:16]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_0_T_5 = io_readDataSram0Bank_0[15:0]; // @[FFTEngine.scala 352:121]
  wire [15:0] _dataInPre_0_T_7 = io_readDataSram0Bank_0[31:16]; // @[FFTEngine.scala 352:121]
  wire [15:0] dataInPre_0_im = srcBuffer ? $signed(_dataInPre_0_T_3) : $signed(_dataInPre_0_T_7); // @[FFTEngine.scala 352:28]
  wire [15:0] dataInPre_0_re = srcBuffer ? $signed(_dataInPre_0_T_1) : $signed(_dataInPre_0_T_5); // @[FFTEngine.scala 352:28]
  wire [15:0] _dataInPre_1_T_1 = io_readDataSram1Bank_1[15:0]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_1_T_3 = io_readDataSram1Bank_1[31:16]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_1_T_5 = io_readDataSram0Bank_1[15:0]; // @[FFTEngine.scala 352:121]
  wire [15:0] _dataInPre_1_T_7 = io_readDataSram0Bank_1[31:16]; // @[FFTEngine.scala 352:121]
  wire [15:0] dataInPre_1_im = srcBuffer ? $signed(_dataInPre_1_T_3) : $signed(_dataInPre_1_T_7); // @[FFTEngine.scala 352:28]
  wire [15:0] dataInPre_1_re = srcBuffer ? $signed(_dataInPre_1_T_1) : $signed(_dataInPre_1_T_5); // @[FFTEngine.scala 352:28]
  wire [15:0] _dataInPre_2_T_1 = io_readDataSram1Bank_2[15:0]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_2_T_3 = io_readDataSram1Bank_2[31:16]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_2_T_5 = io_readDataSram0Bank_2[15:0]; // @[FFTEngine.scala 352:121]
  wire [15:0] _dataInPre_2_T_7 = io_readDataSram0Bank_2[31:16]; // @[FFTEngine.scala 352:121]
  wire [15:0] dataInPre_2_im = srcBuffer ? $signed(_dataInPre_2_T_3) : $signed(_dataInPre_2_T_7); // @[FFTEngine.scala 352:28]
  wire [15:0] dataInPre_2_re = srcBuffer ? $signed(_dataInPre_2_T_1) : $signed(_dataInPre_2_T_5); // @[FFTEngine.scala 352:28]
  wire [15:0] _dataInPre_3_T_1 = io_readDataSram1Bank_3[15:0]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_3_T_3 = io_readDataSram1Bank_3[31:16]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_3_T_5 = io_readDataSram0Bank_3[15:0]; // @[FFTEngine.scala 352:121]
  wire [15:0] _dataInPre_3_T_7 = io_readDataSram0Bank_3[31:16]; // @[FFTEngine.scala 352:121]
  wire [15:0] dataInPre_3_im = srcBuffer ? $signed(_dataInPre_3_T_3) : $signed(_dataInPre_3_T_7); // @[FFTEngine.scala 352:28]
  wire [15:0] dataInPre_3_re = srcBuffer ? $signed(_dataInPre_3_T_1) : $signed(_dataInPre_3_T_5); // @[FFTEngine.scala 352:28]
  wire [15:0] _dataInPre_4_T_1 = io_readDataSram1Bank_4[15:0]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_4_T_3 = io_readDataSram1Bank_4[31:16]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_4_T_5 = io_readDataSram0Bank_4[15:0]; // @[FFTEngine.scala 352:121]
  wire [15:0] _dataInPre_4_T_7 = io_readDataSram0Bank_4[31:16]; // @[FFTEngine.scala 352:121]
  wire [15:0] dataInPre_4_im = srcBuffer ? $signed(_dataInPre_4_T_3) : $signed(_dataInPre_4_T_7); // @[FFTEngine.scala 352:28]
  wire [15:0] dataInPre_4_re = srcBuffer ? $signed(_dataInPre_4_T_1) : $signed(_dataInPre_4_T_5); // @[FFTEngine.scala 352:28]
  wire [15:0] _dataInPre_5_T_1 = io_readDataSram1Bank_5[15:0]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_5_T_3 = io_readDataSram1Bank_5[31:16]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_5_T_5 = io_readDataSram0Bank_5[15:0]; // @[FFTEngine.scala 352:121]
  wire [15:0] _dataInPre_5_T_7 = io_readDataSram0Bank_5[31:16]; // @[FFTEngine.scala 352:121]
  wire [15:0] dataInPre_5_im = srcBuffer ? $signed(_dataInPre_5_T_3) : $signed(_dataInPre_5_T_7); // @[FFTEngine.scala 352:28]
  wire [15:0] dataInPre_5_re = srcBuffer ? $signed(_dataInPre_5_T_1) : $signed(_dataInPre_5_T_5); // @[FFTEngine.scala 352:28]
  wire [15:0] _dataInPre_6_T_1 = io_readDataSram1Bank_6[15:0]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_6_T_3 = io_readDataSram1Bank_6[31:16]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_6_T_5 = io_readDataSram0Bank_6[15:0]; // @[FFTEngine.scala 352:121]
  wire [15:0] _dataInPre_6_T_7 = io_readDataSram0Bank_6[31:16]; // @[FFTEngine.scala 352:121]
  wire [15:0] dataInPre_6_im = srcBuffer ? $signed(_dataInPre_6_T_3) : $signed(_dataInPre_6_T_7); // @[FFTEngine.scala 352:28]
  wire [15:0] dataInPre_6_re = srcBuffer ? $signed(_dataInPre_6_T_1) : $signed(_dataInPre_6_T_5); // @[FFTEngine.scala 352:28]
  wire [15:0] _dataInPre_7_T_1 = io_readDataSram1Bank_7[15:0]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_7_T_3 = io_readDataSram1Bank_7[31:16]; // @[FFTEngine.scala 352:72]
  wire [15:0] _dataInPre_7_T_5 = io_readDataSram0Bank_7[15:0]; // @[FFTEngine.scala 352:121]
  wire [15:0] _dataInPre_7_T_7 = io_readDataSram0Bank_7[31:16]; // @[FFTEngine.scala 352:121]
  wire [15:0] dataInPre_7_im = srcBuffer ? $signed(_dataInPre_7_T_3) : $signed(_dataInPre_7_T_7); // @[FFTEngine.scala 352:28]
  wire [15:0] dataInPre_7_re = srcBuffer ? $signed(_dataInPre_7_T_1) : $signed(_dataInPre_7_T_5); // @[FFTEngine.scala 352:28]
  reg [2:0] addrInBankSel1c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSel1c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSel1c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSel1c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSel1c_4_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSel1c_5_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSel1c_6_r; // @[Reg.scala 35:20]
  reg [2:0] addrInBankSel1c_7_r; // @[Reg.scala 35:20]
  wire [15:0] _GEN_128 = 3'h1 == addrInBankSel1c_0_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_129 = 3'h2 == addrInBankSel1c_0_r ? $signed(dataInPre_2_re) : $signed(_GEN_128); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_130 = 3'h3 == addrInBankSel1c_0_r ? $signed(dataInPre_3_re) : $signed(_GEN_129); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_131 = 3'h4 == addrInBankSel1c_0_r ? $signed(dataInPre_4_re) : $signed(_GEN_130); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_132 = 3'h5 == addrInBankSel1c_0_r ? $signed(dataInPre_5_re) : $signed(_GEN_131); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_133 = 3'h6 == addrInBankSel1c_0_r ? $signed(dataInPre_6_re) : $signed(_GEN_132); // @[FFTEngine.scala 363:{29,29}]
  wire  _fftCalc_io_dataIn_0_im_T_1 = sameAddr1c & _phaseInit_T_6; // @[FFTEngine.scala 364:47]
  wire [15:0] _GEN_136 = 3'h1 == addrInBankSel1c_0_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_137 = 3'h2 == addrInBankSel1c_0_r ? $signed(dataInPre_2_im) : $signed(_GEN_136); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_138 = 3'h3 == addrInBankSel1c_0_r ? $signed(dataInPre_3_im) : $signed(_GEN_137); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_139 = 3'h4 == addrInBankSel1c_0_r ? $signed(dataInPre_4_im) : $signed(_GEN_138); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_140 = 3'h5 == addrInBankSel1c_0_r ? $signed(dataInPre_5_im) : $signed(_GEN_139); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_141 = 3'h6 == addrInBankSel1c_0_r ? $signed(dataInPre_6_im) : $signed(_GEN_140); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_142 = 3'h7 == addrInBankSel1c_0_r ? $signed(dataInPre_7_im) : $signed(_GEN_141); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_144 = 3'h1 == addrInBankSel1c_1_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_145 = 3'h2 == addrInBankSel1c_1_r ? $signed(dataInPre_2_im) : $signed(_GEN_144); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_146 = 3'h3 == addrInBankSel1c_1_r ? $signed(dataInPre_3_im) : $signed(_GEN_145); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_147 = 3'h4 == addrInBankSel1c_1_r ? $signed(dataInPre_4_im) : $signed(_GEN_146); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_148 = 3'h5 == addrInBankSel1c_1_r ? $signed(dataInPre_5_im) : $signed(_GEN_147); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_149 = 3'h6 == addrInBankSel1c_1_r ? $signed(dataInPre_6_im) : $signed(_GEN_148); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_150 = 3'h7 == addrInBankSel1c_1_r ? $signed(dataInPre_7_im) : $signed(_GEN_149); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_152 = 3'h1 == addrInBankSel1c_1_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_153 = 3'h2 == addrInBankSel1c_1_r ? $signed(dataInPre_2_re) : $signed(_GEN_152); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_154 = 3'h3 == addrInBankSel1c_1_r ? $signed(dataInPre_3_re) : $signed(_GEN_153); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_155 = 3'h4 == addrInBankSel1c_1_r ? $signed(dataInPre_4_re) : $signed(_GEN_154); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_156 = 3'h5 == addrInBankSel1c_1_r ? $signed(dataInPre_5_re) : $signed(_GEN_155); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_157 = 3'h6 == addrInBankSel1c_1_r ? $signed(dataInPre_6_re) : $signed(_GEN_156); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_158 = 3'h7 == addrInBankSel1c_1_r ? $signed(dataInPre_7_re) : $signed(_GEN_157); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_168 = 3'h1 == addrInBankSel1c_2_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_169 = 3'h2 == addrInBankSel1c_2_r ? $signed(dataInPre_2_re) : $signed(_GEN_168); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_170 = 3'h3 == addrInBankSel1c_2_r ? $signed(dataInPre_3_re) : $signed(_GEN_169); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_171 = 3'h4 == addrInBankSel1c_2_r ? $signed(dataInPre_4_re) : $signed(_GEN_170); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_172 = 3'h5 == addrInBankSel1c_2_r ? $signed(dataInPre_5_re) : $signed(_GEN_171); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_173 = 3'h6 == addrInBankSel1c_2_r ? $signed(dataInPre_6_re) : $signed(_GEN_172); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_176 = 3'h1 == addrInBankSel1c_2_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_177 = 3'h2 == addrInBankSel1c_2_r ? $signed(dataInPre_2_im) : $signed(_GEN_176); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_178 = 3'h3 == addrInBankSel1c_2_r ? $signed(dataInPre_3_im) : $signed(_GEN_177); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_179 = 3'h4 == addrInBankSel1c_2_r ? $signed(dataInPre_4_im) : $signed(_GEN_178); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_180 = 3'h5 == addrInBankSel1c_2_r ? $signed(dataInPre_5_im) : $signed(_GEN_179); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_181 = 3'h6 == addrInBankSel1c_2_r ? $signed(dataInPre_6_im) : $signed(_GEN_180); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_184 = 3'h1 == addrInBankSel1c_3_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_185 = 3'h2 == addrInBankSel1c_3_r ? $signed(dataInPre_2_re) : $signed(_GEN_184); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_186 = 3'h3 == addrInBankSel1c_3_r ? $signed(dataInPre_3_re) : $signed(_GEN_185); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_187 = 3'h4 == addrInBankSel1c_3_r ? $signed(dataInPre_4_re) : $signed(_GEN_186); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_188 = 3'h5 == addrInBankSel1c_3_r ? $signed(dataInPre_5_re) : $signed(_GEN_187); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_189 = 3'h6 == addrInBankSel1c_3_r ? $signed(dataInPre_6_re) : $signed(_GEN_188); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_192 = 3'h1 == addrInBankSel1c_3_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_193 = 3'h2 == addrInBankSel1c_3_r ? $signed(dataInPre_2_im) : $signed(_GEN_192); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_194 = 3'h3 == addrInBankSel1c_3_r ? $signed(dataInPre_3_im) : $signed(_GEN_193); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_195 = 3'h4 == addrInBankSel1c_3_r ? $signed(dataInPre_4_im) : $signed(_GEN_194); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_196 = 3'h5 == addrInBankSel1c_3_r ? $signed(dataInPre_5_im) : $signed(_GEN_195); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_197 = 3'h6 == addrInBankSel1c_3_r ? $signed(dataInPre_6_im) : $signed(_GEN_196); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_200 = 3'h1 == addrInBankSel1c_4_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_201 = 3'h2 == addrInBankSel1c_4_r ? $signed(dataInPre_2_re) : $signed(_GEN_200); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_202 = 3'h3 == addrInBankSel1c_4_r ? $signed(dataInPre_3_re) : $signed(_GEN_201); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_203 = 3'h4 == addrInBankSel1c_4_r ? $signed(dataInPre_4_re) : $signed(_GEN_202); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_204 = 3'h5 == addrInBankSel1c_4_r ? $signed(dataInPre_5_re) : $signed(_GEN_203); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_205 = 3'h6 == addrInBankSel1c_4_r ? $signed(dataInPre_6_re) : $signed(_GEN_204); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_208 = 3'h1 == addrInBankSel1c_4_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_209 = 3'h2 == addrInBankSel1c_4_r ? $signed(dataInPre_2_im) : $signed(_GEN_208); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_210 = 3'h3 == addrInBankSel1c_4_r ? $signed(dataInPre_3_im) : $signed(_GEN_209); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_211 = 3'h4 == addrInBankSel1c_4_r ? $signed(dataInPre_4_im) : $signed(_GEN_210); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_212 = 3'h5 == addrInBankSel1c_4_r ? $signed(dataInPre_5_im) : $signed(_GEN_211); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_213 = 3'h6 == addrInBankSel1c_4_r ? $signed(dataInPre_6_im) : $signed(_GEN_212); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_216 = 3'h1 == addrInBankSel1c_5_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_217 = 3'h2 == addrInBankSel1c_5_r ? $signed(dataInPre_2_re) : $signed(_GEN_216); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_218 = 3'h3 == addrInBankSel1c_5_r ? $signed(dataInPre_3_re) : $signed(_GEN_217); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_219 = 3'h4 == addrInBankSel1c_5_r ? $signed(dataInPre_4_re) : $signed(_GEN_218); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_220 = 3'h5 == addrInBankSel1c_5_r ? $signed(dataInPre_5_re) : $signed(_GEN_219); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_221 = 3'h6 == addrInBankSel1c_5_r ? $signed(dataInPre_6_re) : $signed(_GEN_220); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_224 = 3'h1 == addrInBankSel1c_5_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_225 = 3'h2 == addrInBankSel1c_5_r ? $signed(dataInPre_2_im) : $signed(_GEN_224); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_226 = 3'h3 == addrInBankSel1c_5_r ? $signed(dataInPre_3_im) : $signed(_GEN_225); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_227 = 3'h4 == addrInBankSel1c_5_r ? $signed(dataInPre_4_im) : $signed(_GEN_226); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_228 = 3'h5 == addrInBankSel1c_5_r ? $signed(dataInPre_5_im) : $signed(_GEN_227); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_229 = 3'h6 == addrInBankSel1c_5_r ? $signed(dataInPre_6_im) : $signed(_GEN_228); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_232 = 3'h1 == addrInBankSel1c_6_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_233 = 3'h2 == addrInBankSel1c_6_r ? $signed(dataInPre_2_re) : $signed(_GEN_232); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_234 = 3'h3 == addrInBankSel1c_6_r ? $signed(dataInPre_3_re) : $signed(_GEN_233); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_235 = 3'h4 == addrInBankSel1c_6_r ? $signed(dataInPre_4_re) : $signed(_GEN_234); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_236 = 3'h5 == addrInBankSel1c_6_r ? $signed(dataInPre_5_re) : $signed(_GEN_235); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_237 = 3'h6 == addrInBankSel1c_6_r ? $signed(dataInPre_6_re) : $signed(_GEN_236); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_240 = 3'h1 == addrInBankSel1c_6_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_241 = 3'h2 == addrInBankSel1c_6_r ? $signed(dataInPre_2_im) : $signed(_GEN_240); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_242 = 3'h3 == addrInBankSel1c_6_r ? $signed(dataInPre_3_im) : $signed(_GEN_241); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_243 = 3'h4 == addrInBankSel1c_6_r ? $signed(dataInPre_4_im) : $signed(_GEN_242); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_244 = 3'h5 == addrInBankSel1c_6_r ? $signed(dataInPre_5_im) : $signed(_GEN_243); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_245 = 3'h6 == addrInBankSel1c_6_r ? $signed(dataInPre_6_im) : $signed(_GEN_244); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_248 = 3'h1 == addrInBankSel1c_7_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_249 = 3'h2 == addrInBankSel1c_7_r ? $signed(dataInPre_2_re) : $signed(_GEN_248); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_250 = 3'h3 == addrInBankSel1c_7_r ? $signed(dataInPre_3_re) : $signed(_GEN_249); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_251 = 3'h4 == addrInBankSel1c_7_r ? $signed(dataInPre_4_re) : $signed(_GEN_250); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_252 = 3'h5 == addrInBankSel1c_7_r ? $signed(dataInPre_5_re) : $signed(_GEN_251); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_253 = 3'h6 == addrInBankSel1c_7_r ? $signed(dataInPre_6_re) : $signed(_GEN_252); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_256 = 3'h1 == addrInBankSel1c_7_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_257 = 3'h2 == addrInBankSel1c_7_r ? $signed(dataInPre_2_im) : $signed(_GEN_256); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_258 = 3'h3 == addrInBankSel1c_7_r ? $signed(dataInPre_3_im) : $signed(_GEN_257); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_259 = 3'h4 == addrInBankSel1c_7_r ? $signed(dataInPre_4_im) : $signed(_GEN_258); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_260 = 3'h5 == addrInBankSel1c_7_r ? $signed(dataInPre_5_im) : $signed(_GEN_259); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_261 = 3'h6 == addrInBankSel1c_7_r ? $signed(dataInPre_6_im) : $signed(_GEN_260); // @[FFTEngine.scala 368:{30,30}]
  wire [6:0] _fftCalc_io_radixCount_T_2 = {{3'd0}, addrSProc[3:0]}; // @[FFTEngine.scala 370:33]
  wire  _GEN_264 = 2'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 371:{32,32}]
  wire  _GEN_265 = 2'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_264; // @[FFTEngine.scala 371:{32,32}]
  wire [15:0] writeDataPre3c_1_re = fftCalc_io_dataOut3c_1_re; // @[FFTEngine.scala 389:32]
  wire [15:0] writeDataPre3c_1_im = fftCalc_io_dataOut3c_1_im; // @[FFTEngine.scala 390:32]
  wire  _addrInBankSel3c_0_T_1 = kernelState3c & _T_6; // @[FFTEngine.scala 398:68]
  wire [3:0] _addrInBankSel3c_0_T_3 = kernelState3c & _T_6 ? addrInBankSelProc3c_0_r : addrInBankSelKernel3c_0_r; // @[FFTEngine.scala 398:38]
  wire [3:0] addrInBankSel3c_0 = io_fftMode ? _addrInBankSel3c_0_T_3 : addrInBankSelKernel3c_0_r; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_1_T_3 = kernelState3c & _T_6 ? addrInBankSelProc3c_1_r : addrInBankSelKernel3c_1_r; // @[FFTEngine.scala 398:38]
  wire [3:0] addrInBankSel3c_1 = io_fftMode ? _addrInBankSel3c_1_T_3 : addrInBankSelKernel3c_1_r; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_2_T_3 = kernelState3c & _T_6 ? addrInBankSelProc3c_2_r : addrInBankSelKernel3c_2_r; // @[FFTEngine.scala 398:38]
  wire [3:0] addrInBankSel3c_2 = io_fftMode ? _addrInBankSel3c_2_T_3 : addrInBankSelKernel3c_2_r; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_3_T_3 = kernelState3c & _T_6 ? addrInBankSelProc3c_3_r : addrInBankSelKernel3c_3_r; // @[FFTEngine.scala 398:38]
  wire [3:0] addrInBankSel3c_3 = io_fftMode ? _addrInBankSel3c_3_T_3 : addrInBankSelKernel3c_3_r; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_4_T_3 = kernelState3c & _T_6 ? addrInBankSelProc3c_4_r : addrInBankSelKernel3c_4_r; // @[FFTEngine.scala 398:38]
  wire [3:0] addrInBankSel3c_4 = io_fftMode ? _addrInBankSel3c_4_T_3 : addrInBankSelKernel3c_4_r; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_5_T_3 = kernelState3c & _T_6 ? addrInBankSelProc3c_5_r : addrInBankSelKernel3c_5_r; // @[FFTEngine.scala 398:38]
  wire [3:0] addrInBankSel3c_5 = io_fftMode ? _addrInBankSel3c_5_T_3 : addrInBankSelKernel3c_5_r; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_6_T_3 = kernelState3c & _T_6 ? addrInBankSelProc3c_6_r : addrInBankSelKernel3c_6_r; // @[FFTEngine.scala 398:38]
  wire [3:0] addrInBankSel3c_6 = io_fftMode ? _addrInBankSel3c_6_T_3 : addrInBankSelKernel3c_6_r; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_7_T_3 = kernelState3c & _T_6 ? addrInBankSelProc3c_7_r : addrInBankSelKernel3c_7_r; // @[FFTEngine.scala 398:38]
  wire [3:0] addrInBankSel3c_7 = io_fftMode ? _addrInBankSel3c_7_T_3 : addrInBankSelKernel3c_7_r; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _GEN_389 = 3'h0 == addrInBankSel_1 ? addrKernelPre_1[3:0] : addrKernelPre_0[3:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_390 = 3'h1 == addrInBankSel_1 ? addrKernelPre_1[3:0] : addrKernelPre_0[3:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_391 = 3'h2 == addrInBankSel_1 ? addrKernelPre_1[3:0] : addrKernelPre_0[3:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_392 = 3'h3 == addrInBankSel_1 ? addrKernelPre_1[3:0] : addrKernelPre_0[3:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_393 = 3'h4 == addrInBankSel_1 ? addrKernelPre_1[3:0] : addrKernelPre_0[3:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_394 = 3'h5 == addrInBankSel_1 ? addrKernelPre_1[3:0] : addrKernelPre_0[3:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_395 = 3'h6 == addrInBankSel_1 ? addrKernelPre_1[3:0] : addrKernelPre_0[3:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_396 = 3'h7 == addrInBankSel_1 ? addrKernelPre_1[3:0] : addrKernelPre_0[3:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_405 = _srcBufferNext_T_3 ? _GEN_389 : addrKernelPre_0[3:0]; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_406 = _srcBufferNext_T_3 ? _GEN_390 : addrKernelPre_0[3:0]; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_407 = _srcBufferNext_T_3 ? _GEN_391 : addrKernelPre_0[3:0]; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_408 = _srcBufferNext_T_3 ? _GEN_392 : addrKernelPre_0[3:0]; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_409 = _srcBufferNext_T_3 ? _GEN_393 : addrKernelPre_0[3:0]; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_410 = _srcBufferNext_T_3 ? _GEN_394 : addrKernelPre_0[3:0]; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_411 = _srcBufferNext_T_3 ? _GEN_395 : addrKernelPre_0[3:0]; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_412 = _srcBufferNext_T_3 ? _GEN_396 : addrKernelPre_0[3:0]; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_413 = _srcBufferNext_T_3 ? addrKernelPre_0[3:0] : _GEN_389; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_414 = _srcBufferNext_T_3 ? addrKernelPre_0[3:0] : _GEN_390; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_415 = _srcBufferNext_T_3 ? addrKernelPre_0[3:0] : _GEN_391; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_416 = _srcBufferNext_T_3 ? addrKernelPre_0[3:0] : _GEN_392; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_417 = _srcBufferNext_T_3 ? addrKernelPre_0[3:0] : _GEN_393; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_418 = _srcBufferNext_T_3 ? addrKernelPre_0[3:0] : _GEN_394; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_419 = _srcBufferNext_T_3 ? addrKernelPre_0[3:0] : _GEN_395; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_420 = _srcBufferNext_T_3 ? addrKernelPre_0[3:0] : _GEN_396; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_469 = 3'h0 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_405; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_470 = 3'h1 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_406; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_471 = 3'h2 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_407; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_472 = 3'h3 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_408; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_473 = 3'h4 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_409; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_474 = 3'h5 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_410; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_475 = 3'h6 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_411; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_476 = 3'h7 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_412; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_477 = 3'h0 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_413; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_478 = 3'h1 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_414; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_479 = 3'h2 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_415; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_480 = 3'h3 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_416; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_481 = 3'h4 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_417; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_482 = 3'h5 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_418; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_483 = 3'h6 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_419; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_484 = 3'h7 == addrInBankSel_2 ? addrKernelPre_2[3:0] : _GEN_420; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_485 = _srcBufferNext_T_3 ? _GEN_469 : _GEN_405; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_486 = _srcBufferNext_T_3 ? _GEN_470 : _GEN_406; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_487 = _srcBufferNext_T_3 ? _GEN_471 : _GEN_407; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_488 = _srcBufferNext_T_3 ? _GEN_472 : _GEN_408; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_489 = _srcBufferNext_T_3 ? _GEN_473 : _GEN_409; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_490 = _srcBufferNext_T_3 ? _GEN_474 : _GEN_410; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_491 = _srcBufferNext_T_3 ? _GEN_475 : _GEN_411; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_492 = _srcBufferNext_T_3 ? _GEN_476 : _GEN_412; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_493 = _srcBufferNext_T_3 ? _GEN_413 : _GEN_477; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_494 = _srcBufferNext_T_3 ? _GEN_414 : _GEN_478; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_495 = _srcBufferNext_T_3 ? _GEN_415 : _GEN_479; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_496 = _srcBufferNext_T_3 ? _GEN_416 : _GEN_480; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_497 = _srcBufferNext_T_3 ? _GEN_417 : _GEN_481; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_498 = _srcBufferNext_T_3 ? _GEN_418 : _GEN_482; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_499 = _srcBufferNext_T_3 ? _GEN_419 : _GEN_483; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_500 = _srcBufferNext_T_3 ? _GEN_420 : _GEN_484; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_517 = 3'h0 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_485; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_518 = 3'h1 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_486; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_519 = 3'h2 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_487; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_520 = 3'h3 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_488; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_521 = 3'h4 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_489; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_522 = 3'h5 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_490; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_523 = 3'h6 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_491; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_524 = 3'h7 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_492; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_525 = 3'h0 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_493; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_526 = 3'h1 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_494; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_527 = 3'h2 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_495; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_528 = 3'h3 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_496; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_529 = 3'h4 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_497; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_530 = 3'h5 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_498; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_531 = 3'h6 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_499; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_532 = 3'h7 == addrInBankSel_3 ? addrKernelPre_3[3:0] : _GEN_500; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_533 = _srcBufferNext_T_3 ? _GEN_517 : _GEN_485; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_534 = _srcBufferNext_T_3 ? _GEN_518 : _GEN_486; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_535 = _srcBufferNext_T_3 ? _GEN_519 : _GEN_487; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_536 = _srcBufferNext_T_3 ? _GEN_520 : _GEN_488; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_537 = _srcBufferNext_T_3 ? _GEN_521 : _GEN_489; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_538 = _srcBufferNext_T_3 ? _GEN_522 : _GEN_490; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_539 = _srcBufferNext_T_3 ? _GEN_523 : _GEN_491; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_540 = _srcBufferNext_T_3 ? _GEN_524 : _GEN_492; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_541 = _srcBufferNext_T_3 ? _GEN_493 : _GEN_525; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_542 = _srcBufferNext_T_3 ? _GEN_494 : _GEN_526; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_543 = _srcBufferNext_T_3 ? _GEN_495 : _GEN_527; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_544 = _srcBufferNext_T_3 ? _GEN_496 : _GEN_528; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_545 = _srcBufferNext_T_3 ? _GEN_497 : _GEN_529; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_546 = _srcBufferNext_T_3 ? _GEN_498 : _GEN_530; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_547 = _srcBufferNext_T_3 ? _GEN_499 : _GEN_531; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_548 = _srcBufferNext_T_3 ? _GEN_500 : _GEN_532; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_565 = 3'h0 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_533; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_566 = 3'h1 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_534; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_567 = 3'h2 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_535; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_568 = 3'h3 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_536; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_569 = 3'h4 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_537; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_570 = 3'h5 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_538; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_571 = 3'h6 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_539; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_572 = 3'h7 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_540; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_573 = 3'h0 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_541; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_574 = 3'h1 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_542; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_575 = 3'h2 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_543; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_576 = 3'h3 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_544; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_577 = 3'h4 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_545; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_578 = 3'h5 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_546; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_579 = 3'h6 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_547; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_580 = 3'h7 == addrInBankSel_4 ? addrKernelPre_4[3:0] : _GEN_548; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_581 = _srcBufferNext_T_3 ? _GEN_565 : _GEN_533; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_582 = _srcBufferNext_T_3 ? _GEN_566 : _GEN_534; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_583 = _srcBufferNext_T_3 ? _GEN_567 : _GEN_535; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_584 = _srcBufferNext_T_3 ? _GEN_568 : _GEN_536; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_585 = _srcBufferNext_T_3 ? _GEN_569 : _GEN_537; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_586 = _srcBufferNext_T_3 ? _GEN_570 : _GEN_538; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_587 = _srcBufferNext_T_3 ? _GEN_571 : _GEN_539; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_588 = _srcBufferNext_T_3 ? _GEN_572 : _GEN_540; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_589 = _srcBufferNext_T_3 ? _GEN_541 : _GEN_573; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_590 = _srcBufferNext_T_3 ? _GEN_542 : _GEN_574; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_591 = _srcBufferNext_T_3 ? _GEN_543 : _GEN_575; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_592 = _srcBufferNext_T_3 ? _GEN_544 : _GEN_576; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_593 = _srcBufferNext_T_3 ? _GEN_545 : _GEN_577; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_594 = _srcBufferNext_T_3 ? _GEN_546 : _GEN_578; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_595 = _srcBufferNext_T_3 ? _GEN_547 : _GEN_579; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_596 = _srcBufferNext_T_3 ? _GEN_548 : _GEN_580; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_613 = 3'h0 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_581; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_614 = 3'h1 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_582; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_615 = 3'h2 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_583; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_616 = 3'h3 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_584; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_617 = 3'h4 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_585; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_618 = 3'h5 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_586; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_619 = 3'h6 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_587; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_620 = 3'h7 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_588; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_621 = 3'h0 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_589; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_622 = 3'h1 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_590; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_623 = 3'h2 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_591; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_624 = 3'h3 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_592; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_625 = 3'h4 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_593; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_626 = 3'h5 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_594; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_627 = 3'h6 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_595; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_628 = 3'h7 == addrInBankSel_5 ? addrKernelPre_5[3:0] : _GEN_596; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_629 = _srcBufferNext_T_3 ? _GEN_613 : _GEN_581; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_630 = _srcBufferNext_T_3 ? _GEN_614 : _GEN_582; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_631 = _srcBufferNext_T_3 ? _GEN_615 : _GEN_583; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_632 = _srcBufferNext_T_3 ? _GEN_616 : _GEN_584; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_633 = _srcBufferNext_T_3 ? _GEN_617 : _GEN_585; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_634 = _srcBufferNext_T_3 ? _GEN_618 : _GEN_586; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_635 = _srcBufferNext_T_3 ? _GEN_619 : _GEN_587; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_636 = _srcBufferNext_T_3 ? _GEN_620 : _GEN_588; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_637 = _srcBufferNext_T_3 ? _GEN_589 : _GEN_621; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_638 = _srcBufferNext_T_3 ? _GEN_590 : _GEN_622; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_639 = _srcBufferNext_T_3 ? _GEN_591 : _GEN_623; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_640 = _srcBufferNext_T_3 ? _GEN_592 : _GEN_624; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_641 = _srcBufferNext_T_3 ? _GEN_593 : _GEN_625; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_642 = _srcBufferNext_T_3 ? _GEN_594 : _GEN_626; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_643 = _srcBufferNext_T_3 ? _GEN_595 : _GEN_627; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_644 = _srcBufferNext_T_3 ? _GEN_596 : _GEN_628; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_661 = 3'h0 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_629; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_662 = 3'h1 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_630; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_663 = 3'h2 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_631; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_664 = 3'h3 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_632; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_665 = 3'h4 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_633; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_666 = 3'h5 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_634; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_667 = 3'h6 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_635; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_668 = 3'h7 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_636; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_669 = 3'h0 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_637; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_670 = 3'h1 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_638; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_671 = 3'h2 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_639; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_672 = 3'h3 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_640; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_673 = 3'h4 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_641; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_674 = 3'h5 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_642; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_675 = 3'h6 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_643; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_676 = 3'h7 == addrInBankSel_6 ? addrKernelPre_6[3:0] : _GEN_644; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_677 = _srcBufferNext_T_3 ? _GEN_661 : _GEN_629; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_678 = _srcBufferNext_T_3 ? _GEN_662 : _GEN_630; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_679 = _srcBufferNext_T_3 ? _GEN_663 : _GEN_631; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_680 = _srcBufferNext_T_3 ? _GEN_664 : _GEN_632; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_681 = _srcBufferNext_T_3 ? _GEN_665 : _GEN_633; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_682 = _srcBufferNext_T_3 ? _GEN_666 : _GEN_634; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_683 = _srcBufferNext_T_3 ? _GEN_667 : _GEN_635; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_684 = _srcBufferNext_T_3 ? _GEN_668 : _GEN_636; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_685 = _srcBufferNext_T_3 ? _GEN_637 : _GEN_669; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_686 = _srcBufferNext_T_3 ? _GEN_638 : _GEN_670; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_687 = _srcBufferNext_T_3 ? _GEN_639 : _GEN_671; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_688 = _srcBufferNext_T_3 ? _GEN_640 : _GEN_672; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_689 = _srcBufferNext_T_3 ? _GEN_641 : _GEN_673; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_690 = _srcBufferNext_T_3 ? _GEN_642 : _GEN_674; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_691 = _srcBufferNext_T_3 ? _GEN_643 : _GEN_675; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_692 = _srcBufferNext_T_3 ? _GEN_644 : _GEN_676; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_709 = 3'h0 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_677; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_710 = 3'h1 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_678; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_711 = 3'h2 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_679; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_712 = 3'h3 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_680; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_713 = 3'h4 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_681; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_714 = 3'h5 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_682; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_715 = 3'h6 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_683; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_716 = 3'h7 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_684; // @[FFTEngine.scala 422:{52,52}]
  wire [3:0] _GEN_717 = 3'h0 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_685; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_718 = 3'h1 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_686; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_719 = 3'h2 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_687; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_720 = 3'h3 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_688; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_721 = 3'h4 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_689; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_722 = 3'h5 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_690; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_723 = 3'h6 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_691; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_724 = 3'h7 == addrInBankSel_7 ? addrKernelPre_7[3:0] : _GEN_692; // @[FFTEngine.scala 424:{52,52}]
  wire [3:0] _GEN_725 = _srcBufferNext_T_3 ? _GEN_709 : _GEN_677; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_726 = _srcBufferNext_T_3 ? _GEN_710 : _GEN_678; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_727 = _srcBufferNext_T_3 ? _GEN_711 : _GEN_679; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_728 = _srcBufferNext_T_3 ? _GEN_712 : _GEN_680; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_729 = _srcBufferNext_T_3 ? _GEN_713 : _GEN_681; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_730 = _srcBufferNext_T_3 ? _GEN_714 : _GEN_682; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_731 = _srcBufferNext_T_3 ? _GEN_715 : _GEN_683; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_732 = _srcBufferNext_T_3 ? _GEN_716 : _GEN_684; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_733 = _srcBufferNext_T_3 ? _GEN_685 : _GEN_717; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_734 = _srcBufferNext_T_3 ? _GEN_686 : _GEN_718; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_735 = _srcBufferNext_T_3 ? _GEN_687 : _GEN_719; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_736 = _srcBufferNext_T_3 ? _GEN_688 : _GEN_720; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_737 = _srcBufferNext_T_3 ? _GEN_689 : _GEN_721; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_738 = _srcBufferNext_T_3 ? _GEN_690 : _GEN_722; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_739 = _srcBufferNext_T_3 ? _GEN_691 : _GEN_723; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_740 = _srcBufferNext_T_3 ? _GEN_692 : _GEN_724; // @[FFTEngine.scala 421:37]
  wire [3:0] _GEN_757 = 3'h0 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_733; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_758 = 3'h1 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_734; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_759 = 3'h2 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_735; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_760 = 3'h3 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_736; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_761 = 3'h4 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_737; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_762 = 3'h5 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_738; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_763 = 3'h6 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_739; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_764 = 3'h7 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_740; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_765 = 3'h0 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_725; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_766 = 3'h1 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_726; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_767 = 3'h2 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_727; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_768 = 3'h3 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_728; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_769 = 3'h4 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_729; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_770 = 3'h5 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_730; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_771 = 3'h6 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_731; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_772 = 3'h7 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_732; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_773 = _srcBufferNext_T_3 ? _GEN_757 : _GEN_733; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_774 = _srcBufferNext_T_3 ? _GEN_758 : _GEN_734; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_775 = _srcBufferNext_T_3 ? _GEN_759 : _GEN_735; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_776 = _srcBufferNext_T_3 ? _GEN_760 : _GEN_736; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_777 = _srcBufferNext_T_3 ? _GEN_761 : _GEN_737; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_778 = _srcBufferNext_T_3 ? _GEN_762 : _GEN_738; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_779 = _srcBufferNext_T_3 ? _GEN_763 : _GEN_739; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_780 = _srcBufferNext_T_3 ? _GEN_764 : _GEN_740; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_781 = _srcBufferNext_T_3 ? _GEN_725 : _GEN_765; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_782 = _srcBufferNext_T_3 ? _GEN_726 : _GEN_766; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_783 = _srcBufferNext_T_3 ? _GEN_727 : _GEN_767; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_784 = _srcBufferNext_T_3 ? _GEN_728 : _GEN_768; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_785 = _srcBufferNext_T_3 ? _GEN_729 : _GEN_769; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_786 = _srcBufferNext_T_3 ? _GEN_730 : _GEN_770; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_787 = _srcBufferNext_T_3 ? _GEN_731 : _GEN_771; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_788 = _srcBufferNext_T_3 ? _GEN_732 : _GEN_772; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_837 = 3'h0 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_773; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_838 = 3'h1 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_774; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_839 = 3'h2 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_775; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_840 = 3'h3 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_776; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_841 = 3'h4 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_777; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_842 = 3'h5 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_778; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_843 = 3'h6 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_779; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_844 = 3'h7 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_780; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_845 = 3'h0 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_781; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_846 = 3'h1 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_782; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_847 = 3'h2 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_783; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_848 = 3'h3 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_784; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_849 = 3'h4 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_785; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_850 = 3'h5 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_786; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_851 = 3'h6 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_787; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_852 = 3'h7 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_788; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_853 = _srcBufferNext_T_3 ? _GEN_837 : _GEN_773; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_854 = _srcBufferNext_T_3 ? _GEN_838 : _GEN_774; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_855 = _srcBufferNext_T_3 ? _GEN_839 : _GEN_775; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_856 = _srcBufferNext_T_3 ? _GEN_840 : _GEN_776; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_857 = _srcBufferNext_T_3 ? _GEN_841 : _GEN_777; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_858 = _srcBufferNext_T_3 ? _GEN_842 : _GEN_778; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_859 = _srcBufferNext_T_3 ? _GEN_843 : _GEN_779; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_860 = _srcBufferNext_T_3 ? _GEN_844 : _GEN_780; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_861 = _srcBufferNext_T_3 ? _GEN_781 : _GEN_845; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_862 = _srcBufferNext_T_3 ? _GEN_782 : _GEN_846; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_863 = _srcBufferNext_T_3 ? _GEN_783 : _GEN_847; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_864 = _srcBufferNext_T_3 ? _GEN_784 : _GEN_848; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_865 = _srcBufferNext_T_3 ? _GEN_785 : _GEN_849; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_866 = _srcBufferNext_T_3 ? _GEN_786 : _GEN_850; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_867 = _srcBufferNext_T_3 ? _GEN_787 : _GEN_851; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_868 = _srcBufferNext_T_3 ? _GEN_788 : _GEN_852; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_917 = 3'h0 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_853; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_918 = 3'h1 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_854; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_919 = 3'h2 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_855; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_920 = 3'h3 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_856; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_921 = 3'h4 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_857; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_922 = 3'h5 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_858; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_923 = 3'h6 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_859; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_924 = 3'h7 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_860; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_925 = 3'h0 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_861; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_926 = 3'h1 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_862; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_927 = 3'h2 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_863; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_928 = 3'h3 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_864; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_929 = 3'h4 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_865; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_930 = 3'h5 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_866; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_931 = 3'h6 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_867; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_932 = 3'h7 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_868; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_933 = _srcBufferNext_T_3 ? _GEN_917 : _GEN_853; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_934 = _srcBufferNext_T_3 ? _GEN_918 : _GEN_854; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_935 = _srcBufferNext_T_3 ? _GEN_919 : _GEN_855; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_936 = _srcBufferNext_T_3 ? _GEN_920 : _GEN_856; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_937 = _srcBufferNext_T_3 ? _GEN_921 : _GEN_857; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_938 = _srcBufferNext_T_3 ? _GEN_922 : _GEN_858; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_939 = _srcBufferNext_T_3 ? _GEN_923 : _GEN_859; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_940 = _srcBufferNext_T_3 ? _GEN_924 : _GEN_860; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_941 = _srcBufferNext_T_3 ? _GEN_861 : _GEN_925; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_942 = _srcBufferNext_T_3 ? _GEN_862 : _GEN_926; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_943 = _srcBufferNext_T_3 ? _GEN_863 : _GEN_927; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_944 = _srcBufferNext_T_3 ? _GEN_864 : _GEN_928; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_945 = _srcBufferNext_T_3 ? _GEN_865 : _GEN_929; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_946 = _srcBufferNext_T_3 ? _GEN_866 : _GEN_930; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_947 = _srcBufferNext_T_3 ? _GEN_867 : _GEN_931; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_948 = _srcBufferNext_T_3 ? _GEN_868 : _GEN_932; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_965 = 3'h0 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_933; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_966 = 3'h1 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_934; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_967 = 3'h2 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_935; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_968 = 3'h3 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_936; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_969 = 3'h4 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_937; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_970 = 3'h5 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_938; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_971 = 3'h6 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_939; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_972 = 3'h7 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_940; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_973 = 3'h0 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_941; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_974 = 3'h1 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_942; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_975 = 3'h2 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_943; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_976 = 3'h3 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_944; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_977 = 3'h4 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_945; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_978 = 3'h5 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_946; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_979 = 3'h6 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_947; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_980 = 3'h7 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_948; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_981 = _srcBufferNext_T_3 ? _GEN_965 : _GEN_933; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_982 = _srcBufferNext_T_3 ? _GEN_966 : _GEN_934; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_983 = _srcBufferNext_T_3 ? _GEN_967 : _GEN_935; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_984 = _srcBufferNext_T_3 ? _GEN_968 : _GEN_936; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_985 = _srcBufferNext_T_3 ? _GEN_969 : _GEN_937; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_986 = _srcBufferNext_T_3 ? _GEN_970 : _GEN_938; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_987 = _srcBufferNext_T_3 ? _GEN_971 : _GEN_939; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_988 = _srcBufferNext_T_3 ? _GEN_972 : _GEN_940; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_989 = _srcBufferNext_T_3 ? _GEN_941 : _GEN_973; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_990 = _srcBufferNext_T_3 ? _GEN_942 : _GEN_974; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_991 = _srcBufferNext_T_3 ? _GEN_943 : _GEN_975; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_992 = _srcBufferNext_T_3 ? _GEN_944 : _GEN_976; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_993 = _srcBufferNext_T_3 ? _GEN_945 : _GEN_977; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_994 = _srcBufferNext_T_3 ? _GEN_946 : _GEN_978; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_995 = _srcBufferNext_T_3 ? _GEN_947 : _GEN_979; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_996 = _srcBufferNext_T_3 ? _GEN_948 : _GEN_980; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1013 = 3'h0 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_981; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1014 = 3'h1 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_982; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1015 = 3'h2 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_983; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1016 = 3'h3 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_984; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1017 = 3'h4 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_985; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1018 = 3'h5 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_986; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1019 = 3'h6 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_987; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1020 = 3'h7 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_988; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1021 = 3'h0 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_989; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1022 = 3'h1 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_990; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1023 = 3'h2 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_991; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1024 = 3'h3 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_992; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1025 = 3'h4 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_993; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1026 = 3'h5 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_994; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1027 = 3'h6 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_995; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1028 = 3'h7 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_996; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1029 = _srcBufferNext_T_3 ? _GEN_1013 : _GEN_981; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1030 = _srcBufferNext_T_3 ? _GEN_1014 : _GEN_982; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1031 = _srcBufferNext_T_3 ? _GEN_1015 : _GEN_983; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1032 = _srcBufferNext_T_3 ? _GEN_1016 : _GEN_984; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1033 = _srcBufferNext_T_3 ? _GEN_1017 : _GEN_985; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1034 = _srcBufferNext_T_3 ? _GEN_1018 : _GEN_986; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1035 = _srcBufferNext_T_3 ? _GEN_1019 : _GEN_987; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1036 = _srcBufferNext_T_3 ? _GEN_1020 : _GEN_988; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1037 = _srcBufferNext_T_3 ? _GEN_989 : _GEN_1021; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1038 = _srcBufferNext_T_3 ? _GEN_990 : _GEN_1022; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1039 = _srcBufferNext_T_3 ? _GEN_991 : _GEN_1023; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1040 = _srcBufferNext_T_3 ? _GEN_992 : _GEN_1024; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1041 = _srcBufferNext_T_3 ? _GEN_993 : _GEN_1025; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1042 = _srcBufferNext_T_3 ? _GEN_994 : _GEN_1026; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1043 = _srcBufferNext_T_3 ? _GEN_995 : _GEN_1027; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1044 = _srcBufferNext_T_3 ? _GEN_996 : _GEN_1028; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1061 = 3'h0 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1029; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1062 = 3'h1 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1030; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1063 = 3'h2 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1031; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1064 = 3'h3 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1032; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1065 = 3'h4 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1033; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1066 = 3'h5 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1034; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1067 = 3'h6 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1035; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1068 = 3'h7 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1036; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1069 = 3'h0 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1037; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1070 = 3'h1 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1038; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1071 = 3'h2 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1039; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1072 = 3'h3 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1040; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1073 = 3'h4 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1041; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1074 = 3'h5 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1042; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1075 = 3'h6 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1043; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1076 = 3'h7 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1044; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1077 = _srcBufferNext_T_3 ? _GEN_1061 : _GEN_1029; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1078 = _srcBufferNext_T_3 ? _GEN_1062 : _GEN_1030; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1079 = _srcBufferNext_T_3 ? _GEN_1063 : _GEN_1031; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1080 = _srcBufferNext_T_3 ? _GEN_1064 : _GEN_1032; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1081 = _srcBufferNext_T_3 ? _GEN_1065 : _GEN_1033; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1082 = _srcBufferNext_T_3 ? _GEN_1066 : _GEN_1034; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1083 = _srcBufferNext_T_3 ? _GEN_1067 : _GEN_1035; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1084 = _srcBufferNext_T_3 ? _GEN_1068 : _GEN_1036; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1085 = _srcBufferNext_T_3 ? _GEN_1037 : _GEN_1069; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1086 = _srcBufferNext_T_3 ? _GEN_1038 : _GEN_1070; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1087 = _srcBufferNext_T_3 ? _GEN_1039 : _GEN_1071; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1088 = _srcBufferNext_T_3 ? _GEN_1040 : _GEN_1072; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1089 = _srcBufferNext_T_3 ? _GEN_1041 : _GEN_1073; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1090 = _srcBufferNext_T_3 ? _GEN_1042 : _GEN_1074; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1091 = _srcBufferNext_T_3 ? _GEN_1043 : _GEN_1075; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1092 = _srcBufferNext_T_3 ? _GEN_1044 : _GEN_1076; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1109 = 3'h0 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1077; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1110 = 3'h1 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1078; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1111 = 3'h2 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1079; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1112 = 3'h3 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1080; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1113 = 3'h4 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1081; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1114 = 3'h5 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1082; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1115 = 3'h6 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1083; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1116 = 3'h7 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1084; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1117 = 3'h0 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1085; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1118 = 3'h1 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1086; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1119 = 3'h2 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1087; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1120 = 3'h3 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1088; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1121 = 3'h4 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1089; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1122 = 3'h5 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1090; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1123 = 3'h6 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1091; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1124 = 3'h7 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1092; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1125 = _srcBufferNext_T_3 ? _GEN_1109 : _GEN_1077; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1126 = _srcBufferNext_T_3 ? _GEN_1110 : _GEN_1078; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1127 = _srcBufferNext_T_3 ? _GEN_1111 : _GEN_1079; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1128 = _srcBufferNext_T_3 ? _GEN_1112 : _GEN_1080; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1129 = _srcBufferNext_T_3 ? _GEN_1113 : _GEN_1081; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1130 = _srcBufferNext_T_3 ? _GEN_1114 : _GEN_1082; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1131 = _srcBufferNext_T_3 ? _GEN_1115 : _GEN_1083; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1132 = _srcBufferNext_T_3 ? _GEN_1116 : _GEN_1084; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1133 = _srcBufferNext_T_3 ? _GEN_1085 : _GEN_1117; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1134 = _srcBufferNext_T_3 ? _GEN_1086 : _GEN_1118; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1135 = _srcBufferNext_T_3 ? _GEN_1087 : _GEN_1119; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1136 = _srcBufferNext_T_3 ? _GEN_1088 : _GEN_1120; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1137 = _srcBufferNext_T_3 ? _GEN_1089 : _GEN_1121; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1138 = _srcBufferNext_T_3 ? _GEN_1090 : _GEN_1122; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1139 = _srcBufferNext_T_3 ? _GEN_1091 : _GEN_1123; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1140 = _srcBufferNext_T_3 ? _GEN_1092 : _GEN_1124; // @[FFTEngine.scala 439:37]
  wire [3:0] _GEN_1157 = 3'h0 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1125; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1158 = 3'h1 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1126; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1159 = 3'h2 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1127; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1160 = 3'h3 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1128; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1161 = 3'h4 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1129; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1162 = 3'h5 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1130; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1163 = 3'h6 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1131; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1164 = 3'h7 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1132; // @[FFTEngine.scala 440:{54,54}]
  wire [3:0] _GEN_1165 = 3'h0 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1133; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1166 = 3'h1 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1134; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1167 = 3'h2 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1135; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1168 = 3'h3 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1136; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1169 = 3'h4 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1137; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1170 = 3'h5 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1138; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1171 = 3'h6 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1139; // @[FFTEngine.scala 442:{54,54}]
  wire [3:0] _GEN_1172 = 3'h7 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1140; // @[FFTEngine.scala 442:{54,54}]
  wire [15:0] writeDataPre3c_0_re = fftCalc_io_dataOut3c_0_re; // @[FFTEngine.scala 387:30 388:23]
  wire [14:0] _writeData3c_0_re_T = writeDataPre3c_0_re[15:1]; // @[FFTEngine.scala 463:55]
  wire [14:0] _writeData3c_0_im_T = writeDataPre3c_1_re[15:1]; // @[FFTEngine.scala 464:55]
  wire [15:0] _GEN_1205 = ~io_fftMode & _phaseInit_T_6 ? $signed({{1{_writeData3c_0_re_T[14]}},_writeData3c_0_re_T}) :
    $signed(writeDataPre3c_0_re); // @[FFTEngine.scala 462:51 463:31 467:28]
  wire [15:0] writeDataPre3c_0_im = fftCalc_io_dataOut3c_0_im; // @[FFTEngine.scala 387:30 388:23]
  wire [15:0] _GEN_1206 = ~io_fftMode & _phaseInit_T_6 ? $signed({{1{_writeData3c_0_im_T[14]}},_writeData3c_0_im_T}) :
    $signed(writeDataPre3c_0_im); // @[FFTEngine.scala 462:51 464:31 467:28]
  wire [15:0] _GEN_1210 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeDataPre3c_1_re) : $signed(_GEN_1206); // @[FFTEngine.scala 458:43 460:31]
  wire [15:0] writeData3c_0_im = sameAddr3c ? $signed(_GEN_1210) : $signed(writeDataPre3c_0_im); // @[FFTEngine.scala 457:22 471:24]
  wire [15:0] _GEN_1207 = ~io_fftMode & _phaseInit_T_6 ? $signed(writeData3c_0_im) : $signed(writeDataPre3c_1_im); // @[FFTEngine.scala 462:51 465:28 468:28]
  wire [15:0] _GEN_1209 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeDataPre3c_0_re) : $signed(_GEN_1205); // @[FFTEngine.scala 458:43 459:31]
  wire [15:0] writeData3c_0_re = sameAddr3c ? $signed(_GEN_1209) : $signed(writeDataPre3c_0_re); // @[FFTEngine.scala 457:22 471:24]
  wire [15:0] _GEN_1208 = ~io_fftMode & _phaseInit_T_6 ? $signed(writeData3c_0_re) : $signed(writeDataPre3c_1_re); // @[FFTEngine.scala 462:51 465:28 468:28]
  wire [15:0] _GEN_1211 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeData3c_0_im) : $signed(_GEN_1207); // @[FFTEngine.scala 458:43 461:28]
  wire [15:0] _GEN_1212 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeData3c_0_re) : $signed(_GEN_1208); // @[FFTEngine.scala 458:43 461:28]
  wire [15:0] _writeData3c_1_im_T_2 = 16'sh0 - $signed(writeDataPre3c_1_im); // @[FFTEngine.scala 474:34]
  wire [15:0] _GEN_1214 = _addrInBankSel3c_0_T_1 & addrInBankSel3c_1 == 4'h4 & addrIn3c_1_r == 4'h1 ? $signed(
    _writeData3c_1_im_T_2) : $signed(writeDataPre3c_1_im); // @[FFTEngine.scala 472:121 474:31 477:31]
  wire [15:0] _io_writeDataSram0Bank_0_T = sameAddr3c ? $signed(_GEN_1209) : $signed(writeDataPre3c_0_re); // @[FFTEngine.scala 488:60]
  wire [15:0] _io_writeDataSram0Bank_0_T_1 = sameAddr3c ? $signed(_GEN_1210) : $signed(writeDataPre3c_0_im); // @[FFTEngine.scala 488:60]
  wire [31:0] _io_writeDataSram0Bank_0_T_2 = {_io_writeDataSram0Bank_0_T_1,_io_writeDataSram0Bank_0_T}; // @[FFTEngine.scala 488:60]
  wire  _T_176 = 4'h0 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_3 = sameAddr3c ? $signed(_GEN_1212) : $signed(writeDataPre3c_1_re); // @[FFTEngine.scala 491:60]
  wire [15:0] _io_writeDataSram0Bank_0_T_4 = sameAddr3c ? $signed(_GEN_1211) : $signed(_GEN_1214); // @[FFTEngine.scala 491:60]
  wire [31:0] _io_writeDataSram0Bank_0_T_5 = {_io_writeDataSram0Bank_0_T_4,_io_writeDataSram0Bank_0_T_3}; // @[FFTEngine.scala 491:60]
  wire [31:0] _GEN_1225 = _T_176 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_14 = {fftCalc_io_dataOut3c_2_im,fftCalc_io_dataOut3c_2_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1227 = 4'h0 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1225; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_17 = {fftCalc_io_dataOut3c_3_im,fftCalc_io_dataOut3c_3_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1229 = 4'h0 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1227; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_20 = {fftCalc_io_dataOut3c_4_im,fftCalc_io_dataOut3c_4_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1231 = 4'h0 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1229; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_23 = {fftCalc_io_dataOut3c_5_im,fftCalc_io_dataOut3c_5_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1233 = 4'h0 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1231; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_26 = {fftCalc_io_dataOut3c_6_im,fftCalc_io_dataOut3c_6_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1235 = 4'h0 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1233; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_29 = {fftCalc_io_dataOut3c_7_im,fftCalc_io_dataOut3c_7_re}; // @[FFTEngine.scala 497:64]
  wire  _T_186 = 4'h1 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1247 = _T_186 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1249 = 4'h1 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1247; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1251 = 4'h1 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1249; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1253 = 4'h1 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1251; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1255 = 4'h1 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1253; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1257 = 4'h1 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1255; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_196 = 4'h2 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1269 = _T_196 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1271 = 4'h2 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1269; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1273 = 4'h2 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1271; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1275 = 4'h2 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1273; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1277 = 4'h2 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1275; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1279 = 4'h2 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1277; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_206 = 4'h3 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1291 = _T_206 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1293 = 4'h3 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1291; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1295 = 4'h3 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1293; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1297 = 4'h3 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1295; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1299 = 4'h3 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1297; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1301 = 4'h3 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1299; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_216 = 4'h4 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1313 = _T_216 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1315 = 4'h4 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1313; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1317 = 4'h4 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1315; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1319 = 4'h4 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1317; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1321 = 4'h4 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1319; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1323 = 4'h4 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1321; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_226 = 4'h5 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1335 = _T_226 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1337 = 4'h5 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1335; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1339 = 4'h5 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1337; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1341 = 4'h5 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1339; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1343 = 4'h5 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1341; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1345 = 4'h5 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1343; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_236 = 4'h6 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1357 = _T_236 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1359 = 4'h6 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1357; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1361 = 4'h6 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1359; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1363 = 4'h6 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1361; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1365 = 4'h6 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1363; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1367 = 4'h6 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1365; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_246 = 4'h7 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1379 = _T_246 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1381 = 4'h7 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1379; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1383 = 4'h7 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1381; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1385 = 4'h7 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1383; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1387 = 4'h7 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1385; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1389 = 4'h7 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1387; // @[FFTEngine.scala 496:50 497:46]
  reg  fftDoneReg; // @[FFTEngine.scala 505:29]
  FFT3PipelineR23Calc fftCalc ( // @[FFTEngine.scala 362:25]
    .clock(fftCalc_clock),
    .reset(fftCalc_reset),
    .io_dataIn_0_im(fftCalc_io_dataIn_0_im),
    .io_dataIn_0_re(fftCalc_io_dataIn_0_re),
    .io_dataIn_1_im(fftCalc_io_dataIn_1_im),
    .io_dataIn_1_re(fftCalc_io_dataIn_1_re),
    .io_dataIn_2_im(fftCalc_io_dataIn_2_im),
    .io_dataIn_2_re(fftCalc_io_dataIn_2_re),
    .io_dataIn_3_im(fftCalc_io_dataIn_3_im),
    .io_dataIn_3_re(fftCalc_io_dataIn_3_re),
    .io_dataIn_4_im(fftCalc_io_dataIn_4_im),
    .io_dataIn_4_re(fftCalc_io_dataIn_4_re),
    .io_dataIn_5_im(fftCalc_io_dataIn_5_im),
    .io_dataIn_5_re(fftCalc_io_dataIn_5_re),
    .io_dataIn_6_im(fftCalc_io_dataIn_6_im),
    .io_dataIn_6_re(fftCalc_io_dataIn_6_re),
    .io_dataIn_7_im(fftCalc_io_dataIn_7_im),
    .io_dataIn_7_re(fftCalc_io_dataIn_7_re),
    .io_dataOut3c_0_im(fftCalc_io_dataOut3c_0_im),
    .io_dataOut3c_0_re(fftCalc_io_dataOut3c_0_re),
    .io_dataOut3c_1_im(fftCalc_io_dataOut3c_1_im),
    .io_dataOut3c_1_re(fftCalc_io_dataOut3c_1_re),
    .io_dataOut3c_2_im(fftCalc_io_dataOut3c_2_im),
    .io_dataOut3c_2_re(fftCalc_io_dataOut3c_2_re),
    .io_dataOut3c_3_im(fftCalc_io_dataOut3c_3_im),
    .io_dataOut3c_3_re(fftCalc_io_dataOut3c_3_re),
    .io_dataOut3c_4_im(fftCalc_io_dataOut3c_4_im),
    .io_dataOut3c_4_re(fftCalc_io_dataOut3c_4_re),
    .io_dataOut3c_5_im(fftCalc_io_dataOut3c_5_im),
    .io_dataOut3c_5_re(fftCalc_io_dataOut3c_5_re),
    .io_dataOut3c_6_im(fftCalc_io_dataOut3c_6_im),
    .io_dataOut3c_6_re(fftCalc_io_dataOut3c_6_re),
    .io_dataOut3c_7_im(fftCalc_io_dataOut3c_7_im),
    .io_dataOut3c_7_re(fftCalc_io_dataOut3c_7_re),
    .io_radixCount(fftCalc_io_radixCount),
    .io_calcMode(fftCalc_io_calcMode),
    .io_phaseCount(fftCalc_io_phaseCount),
    .io_rShiftSym(fftCalc_io_rShiftSym),
    .io_isFFT(fftCalc_io_isFFT),
    .io_state1c(fftCalc_io_state1c),
    .io_state2c(fftCalc_io_state2c)
  );
  assign io_readEnableSram0Bank_0 = _radixInit_T_1 & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_1 = _radixInit_T_1 & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_2 = _radixInit_T_1 & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_3 = _radixInit_T_1 & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_4 = _radixInit_T_1 & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_5 = _radixInit_T_1 & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_6 = _radixInit_T_1 & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_7 = _radixInit_T_1 & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram1Bank_0 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_1 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_2 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_3 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_4 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_5 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_6 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_7 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_writeDataSram0Bank_0 = 4'h0 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1235; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_1 = 4'h1 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1257; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_2 = 4'h2 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1279; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_3 = 4'h3 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1301; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_4 = 4'h4 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1323; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_5 = 4'h5 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1345; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_6 = 4'h6 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1367; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_7 = 4'h7 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1389; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram1Bank_0 = 4'h0 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1235; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_1 = 4'h1 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1257; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_2 = 4'h2 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1279; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_3 = 4'h3 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1301; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_4 = 4'h4 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1323; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_5 = 4'h5 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1345; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_6 = 4'h6 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1367; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_7 = 4'h7 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1389; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeEnableSram0Bank_0 = srcBuffer & kernelState3c; // @[FFTEngine.scala 414:53]
  assign io_writeEnableSram0Bank_1 = srcBuffer & kernelState3c; // @[FFTEngine.scala 414:53]
  assign io_writeEnableSram0Bank_2 = srcBuffer & kernelState3c; // @[FFTEngine.scala 414:53]
  assign io_writeEnableSram0Bank_3 = srcBuffer & kernelState3c; // @[FFTEngine.scala 414:53]
  assign io_writeEnableSram0Bank_4 = srcBuffer & kernelState3c; // @[FFTEngine.scala 414:53]
  assign io_writeEnableSram0Bank_5 = srcBuffer & kernelState3c; // @[FFTEngine.scala 414:53]
  assign io_writeEnableSram0Bank_6 = srcBuffer & kernelState3c; // @[FFTEngine.scala 414:53]
  assign io_writeEnableSram0Bank_7 = srcBuffer & kernelState3c; // @[FFTEngine.scala 414:53]
  assign io_writeEnableSram1Bank_0 = _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 415:54]
  assign io_writeEnableSram1Bank_1 = _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 415:54]
  assign io_writeEnableSram1Bank_2 = _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 415:54]
  assign io_writeEnableSram1Bank_3 = _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 415:54]
  assign io_writeEnableSram1Bank_4 = _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 415:54]
  assign io_writeEnableSram1Bank_5 = _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 415:54]
  assign io_writeEnableSram1Bank_6 = _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 415:54]
  assign io_writeEnableSram1Bank_7 = _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 415:54]
  assign io_addrSram0Bank_0 = _srcBufferNext_T_3 ? _GEN_1133 : _GEN_1165; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_1 = _srcBufferNext_T_3 ? _GEN_1134 : _GEN_1166; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_2 = _srcBufferNext_T_3 ? _GEN_1135 : _GEN_1167; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_3 = _srcBufferNext_T_3 ? _GEN_1136 : _GEN_1168; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_4 = _srcBufferNext_T_3 ? _GEN_1137 : _GEN_1169; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_5 = _srcBufferNext_T_3 ? _GEN_1138 : _GEN_1170; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_6 = _srcBufferNext_T_3 ? _GEN_1139 : _GEN_1171; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_7 = _srcBufferNext_T_3 ? _GEN_1140 : _GEN_1172; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_0 = _srcBufferNext_T_3 ? _GEN_1157 : _GEN_1125; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_1 = _srcBufferNext_T_3 ? _GEN_1158 : _GEN_1126; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_2 = _srcBufferNext_T_3 ? _GEN_1159 : _GEN_1127; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_3 = _srcBufferNext_T_3 ? _GEN_1160 : _GEN_1128; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_4 = _srcBufferNext_T_3 ? _GEN_1161 : _GEN_1129; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_5 = _srcBufferNext_T_3 ? _GEN_1162 : _GEN_1130; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_6 = _srcBufferNext_T_3 ? _GEN_1163 : _GEN_1131; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_7 = _srcBufferNext_T_3 ? _GEN_1164 : _GEN_1132; // @[FFTEngine.scala 439:37]
  assign io_fftDone = fftDoneReg; // @[FFTEngine.scala 506:16]
  assign fftCalc_clock = clock;
  assign fftCalc_reset = reset;
  assign fftCalc_io_dataIn_0_im = sameAddr1c & _phaseInit_T_6 ? $signed(16'sh0) : $signed(_GEN_142); // @[FFTEngine.scala 364:35]
  assign fftCalc_io_dataIn_0_re = 3'h7 == addrInBankSel1c_0_r ? $signed(dataInPre_7_re) : $signed(_GEN_133); // @[FFTEngine.scala 363:{29,29}]
  assign fftCalc_io_dataIn_1_im = _fftCalc_io_dataIn_0_im_T_1 ? $signed(16'sh0) : $signed(_GEN_150); // @[FFTEngine.scala 366:35]
  assign fftCalc_io_dataIn_1_re = _fftCalc_io_dataIn_0_im_T_1 ? $signed(_GEN_150) : $signed(_GEN_158); // @[FFTEngine.scala 365:35]
  assign fftCalc_io_dataIn_2_im = 3'h7 == addrInBankSel1c_2_r ? $signed(dataInPre_7_im) : $signed(_GEN_181); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_2_re = 3'h7 == addrInBankSel1c_2_r ? $signed(dataInPre_7_re) : $signed(_GEN_173); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_3_im = 3'h7 == addrInBankSel1c_3_r ? $signed(dataInPre_7_im) : $signed(_GEN_197); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_3_re = 3'h7 == addrInBankSel1c_3_r ? $signed(dataInPre_7_re) : $signed(_GEN_189); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_4_im = 3'h7 == addrInBankSel1c_4_r ? $signed(dataInPre_7_im) : $signed(_GEN_213); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_4_re = 3'h7 == addrInBankSel1c_4_r ? $signed(dataInPre_7_re) : $signed(_GEN_205); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_5_im = 3'h7 == addrInBankSel1c_5_r ? $signed(dataInPre_7_im) : $signed(_GEN_229); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_5_re = 3'h7 == addrInBankSel1c_5_r ? $signed(dataInPre_7_re) : $signed(_GEN_221); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_6_im = 3'h7 == addrInBankSel1c_6_r ? $signed(dataInPre_7_im) : $signed(_GEN_245); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_6_re = 3'h7 == addrInBankSel1c_6_r ? $signed(dataInPre_7_re) : $signed(_GEN_237); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_7_im = 3'h7 == addrInBankSel1c_7_r ? $signed(dataInPre_7_im) : $signed(_GEN_261); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_7_re = 3'h7 == addrInBankSel1c_7_r ? $signed(dataInPre_7_re) : $signed(_GEN_253); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_radixCount = _fftCalc_io_radixCount_T_2[5:0]; // @[FFTEngine.scala 370:27]
  assign fftCalc_io_calcMode = (_radixInit_T_1 | kernelState1c | kernelState2c | kernelState3c) & _T_6 ? 2'h1 : 2'h3; // @[FFTEngine.scala 374:103 375:29]
  assign fftCalc_io_phaseCount = phaseCount; // @[FFTEngine.scala 383:27]
  assign fftCalc_io_rShiftSym = kernelState1c ? _GEN_265 : phaseCount[0]; // @[FFTEngine.scala 371:32]
  assign fftCalc_io_isFFT = io_fftMode; // @[FFTEngine.scala 372:22]
  assign fftCalc_io_state1c = kernelState1c; // @[FFTEngine.scala 384:41]
  assign fftCalc_io_state2c = kernelState2c; // @[FFTEngine.scala 385:41]
  always @(posedge clock) begin
    if (reset) begin // @[FFTEngine.scala 46:27]
      stateReg <= 3'h0; // @[FFTEngine.scala 46:27]
    end else if (3'h0 == stateReg) begin // @[FFTEngine.scala 108:26]
      if (io_fftEngineKick) begin // @[FFTEngine.scala 110:40]
        stateReg <= 3'h1; // @[FFTEngine.scala 111:30]
      end
    end else if (3'h1 == stateReg) begin // @[FFTEngine.scala 108:26]
      if (addrSProc == 7'hf) begin // @[FFTEngine.scala 117:50]
        stateReg <= 3'h2; // @[FFTEngine.scala 118:30]
      end
    end else if (3'h2 == stateReg) begin // @[FFTEngine.scala 108:26]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_5;
    end
    if (reset) begin // @[FFTEngine.scala 48:29]
      addrSProc <= 7'h0; // @[FFTEngine.scala 48:29]
    end else if (radixInit) begin // @[FFTEngine.scala 158:21]
      addrSProc <= 7'h0; // @[FFTEngine.scala 159:20]
    end else if (radixUp) begin // @[FFTEngine.scala 160:26]
      addrSProc <= _radixCount_T_1; // @[FFTEngine.scala 161:20]
    end
    if (reset) begin // @[FFTEngine.scala 50:29]
      phaseCount <= 2'h0; // @[FFTEngine.scala 50:29]
    end else if (phaseInit) begin // @[FFTEngine.scala 173:21]
      phaseCount <= 2'h0; // @[FFTEngine.scala 174:20]
    end else if (phaseUp) begin // @[FFTEngine.scala 175:26]
      phaseCount <= _phaseCount_T_1; // @[FFTEngine.scala 176:20]
    end
    if (reset) begin // @[FFTEngine.scala 181:28]
      srcBuffer <= 1'h0; // @[FFTEngine.scala 181:28]
    end else if (srcUp) begin // @[FFTEngine.scala 187:17]
      srcBuffer <= srcBufferNext; // @[FFTEngine.scala 188:19]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_0_r <= addrKernelPre_0[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_0_r <= addrIn1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_0_r <= addrIn2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_1_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_1_r <= addrKernelPre_1[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_1_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_1_r <= addrIn1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_1_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_1_r <= addrIn2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_2_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_2_r <= addrKernelPre_2[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_2_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_2_r <= addrIn1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_2_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_2_r <= addrIn2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_3_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_3_r <= addrKernelPre_3[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_3_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_3_r <= addrIn1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_3_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_3_r <= addrIn2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_4_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_4_r <= addrKernelPre_4[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_4_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_4_r <= addrIn1c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_4_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_4_r <= addrIn2c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_5_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_5_r <= addrKernelPre_5[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_5_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_5_r <= addrIn1c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_5_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_5_r <= addrIn2c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_6_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_6_r <= addrKernelPre_6[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_6_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_6_r <= addrIn1c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_6_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_6_r <= addrIn2c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_7_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_7_r <= addrKernelPre_7[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_7_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_7_r <= addrIn1c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_7_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_7_r <= addrIn2c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel1c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 272:27]
      addrInBankSelKernel1c_0_r <= addrInBankSelKernelPre_0; // @[FFTEngine.scala 273:36]
    end else begin
      addrInBankSelKernel1c_0_r <= 3'h0; // @[FFTEngine.scala 275:36]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel2c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel2c_0_r <= addrInBankSelKernel1c_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel3c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel3c_0_r <= addrInBankSelKernel2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel1c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 272:27]
      addrInBankSelKernel1c_1_r <= addrInBankSelKernelPre_1; // @[FFTEngine.scala 273:36]
    end else begin
      addrInBankSelKernel1c_1_r <= 3'h1; // @[FFTEngine.scala 275:36]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel2c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel2c_1_r <= addrInBankSelKernel1c_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel3c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel3c_1_r <= addrInBankSelKernel2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel1c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 272:27]
      addrInBankSelKernel1c_2_r <= addrInBankSelKernelPre_2; // @[FFTEngine.scala 273:36]
    end else begin
      addrInBankSelKernel1c_2_r <= 3'h2; // @[FFTEngine.scala 275:36]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel2c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel2c_2_r <= addrInBankSelKernel1c_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel3c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel3c_2_r <= addrInBankSelKernel2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel1c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 272:27]
      addrInBankSelKernel1c_3_r <= addrInBankSelKernelPre_3; // @[FFTEngine.scala 273:36]
    end else begin
      addrInBankSelKernel1c_3_r <= 3'h3; // @[FFTEngine.scala 275:36]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel2c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel2c_3_r <= addrInBankSelKernel1c_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel3c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel3c_3_r <= addrInBankSelKernel2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel1c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel1c_4_r <= _GEN_66;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel2c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel2c_4_r <= addrInBankSelKernel1c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel3c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel3c_4_r <= addrInBankSelKernel2c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel1c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel1c_5_r <= _GEN_69;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel2c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel2c_5_r <= addrInBankSelKernel1c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel3c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel3c_5_r <= addrInBankSelKernel2c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel1c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel1c_6_r <= _GEN_72;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel2c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel2c_6_r <= addrInBankSelKernel1c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel3c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel3c_6_r <= addrInBankSelKernel2c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel1c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel1c_7_r <= _GEN_75;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel2c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel2c_7_r <= addrInBankSelKernel1c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelKernel3c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelKernel3c_7_r <= addrInBankSelKernel2c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc1c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc1c_0_r <= addrInBankSelProc_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc2c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc2c_0_r <= addrInBankSelProc1c_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc3c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc3c_0_r <= addrInBankSelProc2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc1c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc1c_1_r <= addrInBankSelProc_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc2c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc2c_1_r <= addrInBankSelProc1c_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc3c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc3c_1_r <= addrInBankSelProc2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc1c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc1c_2_r <= addrInBankSelProc_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc2c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc2c_2_r <= addrInBankSelProc1c_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc3c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc3c_2_r <= addrInBankSelProc2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc1c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc1c_3_r <= addrInBankSelProc_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc2c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc2c_3_r <= addrInBankSelProc1c_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc3c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc3c_3_r <= addrInBankSelProc2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc1c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc1c_4_r <= _GEN_90;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc2c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc2c_4_r <= addrInBankSelProc1c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc3c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc3c_4_r <= addrInBankSelProc2c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc1c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc1c_5_r <= _GEN_93;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc2c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc2c_5_r <= addrInBankSelProc1c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc3c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc3c_5_r <= addrInBankSelProc2c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc1c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc1c_6_r <= _GEN_96;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc2c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc2c_6_r <= addrInBankSelProc1c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc3c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc3c_6_r <= addrInBankSelProc2c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc1c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc1c_7_r <= _GEN_99;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc2c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc2c_7_r <= addrInBankSelProc1c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSelProc3c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrInBankSelProc3c_7_r <= addrInBankSelProc2c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      kernelState1c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      kernelState1c <= _radixInit_T_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      kernelState2c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      kernelState2c <= kernelState1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      kernelState3c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      kernelState3c <= kernelState2c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      sameAddr1c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      sameAddr1c <= sameAddr;
    end
    if (reset) begin // @[Reg.scala 35:20]
      sameAddr2c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      sameAddr2c <= sameAddr1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      sameAddr3c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      sameAddr3c <= sameAddr2c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      addrInBankSel1c_0_r <= addrInBankSelKernel_0; // @[FFTEngine.scala 343:30]
    end else if (_radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_0_r <= addrInBankSelProc_0;
    end else begin
      addrInBankSel1c_0_r <= addrInBankSelKernel_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_1_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      addrInBankSel1c_1_r <= addrInBankSelKernel_1; // @[FFTEngine.scala 343:30]
    end else if (_radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_1_r <= addrInBankSelProc_1;
    end else begin
      addrInBankSel1c_1_r <= addrInBankSelKernel_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_2_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      addrInBankSel1c_2_r <= addrInBankSelKernel_2; // @[FFTEngine.scala 343:30]
    end else if (_radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_2_r <= addrInBankSelProc_2;
    end else begin
      addrInBankSel1c_2_r <= addrInBankSelKernel_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_3_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      addrInBankSel1c_3_r <= addrInBankSelKernel_3; // @[FFTEngine.scala 343:30]
    end else if (_radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_3_r <= addrInBankSelProc_3;
    end else begin
      addrInBankSel1c_3_r <= addrInBankSelKernel_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_4_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      addrInBankSel1c_4_r <= addrInBankSelKernel_4; // @[FFTEngine.scala 343:30]
    end else if (_radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_4_r <= addrInBankSelProc_4;
    end else begin
      addrInBankSel1c_4_r <= addrInBankSelKernel_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_5_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      addrInBankSel1c_5_r <= addrInBankSelKernel_5; // @[FFTEngine.scala 343:30]
    end else if (_radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_5_r <= addrInBankSelProc_5;
    end else begin
      addrInBankSel1c_5_r <= addrInBankSelKernel_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_6_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      addrInBankSel1c_6_r <= addrInBankSelKernel_6; // @[FFTEngine.scala 343:30]
    end else if (_radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_6_r <= addrInBankSelProc_6;
    end else begin
      addrInBankSel1c_6_r <= addrInBankSelKernel_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_7_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      addrInBankSel1c_7_r <= addrInBankSelKernel_7; // @[FFTEngine.scala 343:30]
    end else if (_radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_7_r <= addrInBankSelProc_7;
    end else begin
      addrInBankSel1c_7_r <= addrInBankSelKernel_7;
    end
    if (reset) begin // @[FFTEngine.scala 505:29]
      fftDoneReg <= 1'h0; // @[FFTEngine.scala 505:29]
    end else begin
      fftDoneReg <= _radixInit_T_21; // @[FFTEngine.scala 505:29]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  addrSProc = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  srcBuffer = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrIn1c_0_r = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  addrIn2c_0_r = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  addrIn3c_0_r = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  addrIn1c_1_r = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  addrIn2c_1_r = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  addrIn3c_1_r = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  addrIn1c_2_r = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  addrIn2c_2_r = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  addrIn3c_2_r = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  addrIn1c_3_r = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  addrIn2c_3_r = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  addrIn3c_3_r = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  addrIn1c_4_r = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  addrIn2c_4_r = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  addrIn3c_4_r = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  addrIn1c_5_r = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  addrIn2c_5_r = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  addrIn3c_5_r = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  addrIn1c_6_r = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  addrIn2c_6_r = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  addrIn3c_6_r = _RAND_24[3:0];
  _RAND_25 = {1{`RANDOM}};
  addrIn1c_7_r = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  addrIn2c_7_r = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  addrIn3c_7_r = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  addrInBankSelKernel1c_0_r = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  addrInBankSelKernel2c_0_r = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  addrInBankSelKernel3c_0_r = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  addrInBankSelKernel1c_1_r = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  addrInBankSelKernel2c_1_r = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  addrInBankSelKernel3c_1_r = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  addrInBankSelKernel1c_2_r = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  addrInBankSelKernel2c_2_r = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  addrInBankSelKernel3c_2_r = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  addrInBankSelKernel1c_3_r = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  addrInBankSelKernel2c_3_r = _RAND_38[3:0];
  _RAND_39 = {1{`RANDOM}};
  addrInBankSelKernel3c_3_r = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  addrInBankSelKernel1c_4_r = _RAND_40[3:0];
  _RAND_41 = {1{`RANDOM}};
  addrInBankSelKernel2c_4_r = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  addrInBankSelKernel3c_4_r = _RAND_42[3:0];
  _RAND_43 = {1{`RANDOM}};
  addrInBankSelKernel1c_5_r = _RAND_43[3:0];
  _RAND_44 = {1{`RANDOM}};
  addrInBankSelKernel2c_5_r = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  addrInBankSelKernel3c_5_r = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  addrInBankSelKernel1c_6_r = _RAND_46[3:0];
  _RAND_47 = {1{`RANDOM}};
  addrInBankSelKernel2c_6_r = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  addrInBankSelKernel3c_6_r = _RAND_48[3:0];
  _RAND_49 = {1{`RANDOM}};
  addrInBankSelKernel1c_7_r = _RAND_49[3:0];
  _RAND_50 = {1{`RANDOM}};
  addrInBankSelKernel2c_7_r = _RAND_50[3:0];
  _RAND_51 = {1{`RANDOM}};
  addrInBankSelKernel3c_7_r = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  addrInBankSelProc1c_0_r = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  addrInBankSelProc2c_0_r = _RAND_53[3:0];
  _RAND_54 = {1{`RANDOM}};
  addrInBankSelProc3c_0_r = _RAND_54[3:0];
  _RAND_55 = {1{`RANDOM}};
  addrInBankSelProc1c_1_r = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  addrInBankSelProc2c_1_r = _RAND_56[3:0];
  _RAND_57 = {1{`RANDOM}};
  addrInBankSelProc3c_1_r = _RAND_57[3:0];
  _RAND_58 = {1{`RANDOM}};
  addrInBankSelProc1c_2_r = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  addrInBankSelProc2c_2_r = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  addrInBankSelProc3c_2_r = _RAND_60[3:0];
  _RAND_61 = {1{`RANDOM}};
  addrInBankSelProc1c_3_r = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  addrInBankSelProc2c_3_r = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  addrInBankSelProc3c_3_r = _RAND_63[3:0];
  _RAND_64 = {1{`RANDOM}};
  addrInBankSelProc1c_4_r = _RAND_64[3:0];
  _RAND_65 = {1{`RANDOM}};
  addrInBankSelProc2c_4_r = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  addrInBankSelProc3c_4_r = _RAND_66[3:0];
  _RAND_67 = {1{`RANDOM}};
  addrInBankSelProc1c_5_r = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  addrInBankSelProc2c_5_r = _RAND_68[3:0];
  _RAND_69 = {1{`RANDOM}};
  addrInBankSelProc3c_5_r = _RAND_69[3:0];
  _RAND_70 = {1{`RANDOM}};
  addrInBankSelProc1c_6_r = _RAND_70[3:0];
  _RAND_71 = {1{`RANDOM}};
  addrInBankSelProc2c_6_r = _RAND_71[3:0];
  _RAND_72 = {1{`RANDOM}};
  addrInBankSelProc3c_6_r = _RAND_72[3:0];
  _RAND_73 = {1{`RANDOM}};
  addrInBankSelProc1c_7_r = _RAND_73[3:0];
  _RAND_74 = {1{`RANDOM}};
  addrInBankSelProc2c_7_r = _RAND_74[3:0];
  _RAND_75 = {1{`RANDOM}};
  addrInBankSelProc3c_7_r = _RAND_75[3:0];
  _RAND_76 = {1{`RANDOM}};
  kernelState1c = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  kernelState2c = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  kernelState3c = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  sameAddr1c = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  sameAddr2c = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  sameAddr3c = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  addrInBankSel1c_0_r = _RAND_82[2:0];
  _RAND_83 = {1{`RANDOM}};
  addrInBankSel1c_1_r = _RAND_83[2:0];
  _RAND_84 = {1{`RANDOM}};
  addrInBankSel1c_2_r = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  addrInBankSel1c_3_r = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  addrInBankSel1c_4_r = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  addrInBankSel1c_5_r = _RAND_87[2:0];
  _RAND_88 = {1{`RANDOM}};
  addrInBankSel1c_6_r = _RAND_88[2:0];
  _RAND_89 = {1{`RANDOM}};
  addrInBankSel1c_7_r = _RAND_89[2:0];
  _RAND_90 = {1{`RANDOM}};
  fftDoneReg = _RAND_90[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFTSram(
  input         clock,
  input         io_readEnable,
  input         io_writeEnable,
  input  [3:0]  io_addr,
  input  [31:0] io_dataIn,
  output [31:0] io_dataOut
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:15]; // @[FFTSram.scala 16:24]
  wire  mem_rdwrPort_r_en; // @[FFTSram.scala 16:24]
  wire [3:0] mem_rdwrPort_r_addr; // @[FFTSram.scala 16:24]
  wire [31:0] mem_rdwrPort_r_data; // @[FFTSram.scala 16:24]
  wire [31:0] mem_rdwrPort_w_data; // @[FFTSram.scala 16:24]
  wire [3:0] mem_rdwrPort_w_addr; // @[FFTSram.scala 16:24]
  wire  mem_rdwrPort_w_mask; // @[FFTSram.scala 16:24]
  wire  mem_rdwrPort_w_en; // @[FFTSram.scala 16:24]
  reg  mem_rdwrPort_r_en_pipe_0;
  reg [3:0] mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_en = mem_rdwrPort_r_en_pipe_0;
  assign mem_rdwrPort_r_addr = mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_data = mem[mem_rdwrPort_r_addr]; // @[FFTSram.scala 16:24]
  assign mem_rdwrPort_w_data = io_dataIn;
  assign mem_rdwrPort_w_addr = io_addr;
  assign mem_rdwrPort_w_mask = io_writeEnable;
  assign mem_rdwrPort_w_en = io_readEnable & (io_readEnable & io_writeEnable);
  assign io_dataOut = mem_rdwrPort_r_data; // @[FFTSram.scala 20:27 21:34]
  always @(posedge clock) begin
    if (mem_rdwrPort_w_en & mem_rdwrPort_w_mask) begin
      mem[mem_rdwrPort_w_addr] <= mem_rdwrPort_w_data; // @[FFTSram.scala 16:24]
    end
    mem_rdwrPort_r_en_pipe_0 <= io_readEnable & ~(io_readEnable & io_writeEnable);
    if (io_readEnable & ~(io_readEnable & io_writeEnable)) begin
      mem_rdwrPort_r_addr_pipe_0 <= io_addr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_rdwrPort_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_rdwrPort_r_addr_pipe_0 = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFTTop(
  input         clock,
  input         reset,
  output        io_fftDone,
  input         io_fftEngineKick,
  input         io_fftMode,
  input         io_fftRShiftP0_0,
  input         io_fftRShiftP0_1,
  input         io_fftRShiftP0_2,
  input         io_externalMode,
  output [31:0] io_readDataSram0Bank_0,
  output [31:0] io_readDataSram0Bank_1,
  output [31:0] io_readDataSram0Bank_2,
  output [31:0] io_readDataSram0Bank_3,
  output [31:0] io_readDataSram0Bank_4,
  output [31:0] io_readDataSram0Bank_5,
  output [31:0] io_readDataSram0Bank_6,
  output [31:0] io_readDataSram0Bank_7,
  output [31:0] io_readDataSram1Bank_0,
  output [31:0] io_readDataSram1Bank_1,
  output [31:0] io_readDataSram1Bank_2,
  output [31:0] io_readDataSram1Bank_3,
  output [31:0] io_readDataSram1Bank_4,
  output [31:0] io_readDataSram1Bank_5,
  output [31:0] io_readDataSram1Bank_6,
  output [31:0] io_readDataSram1Bank_7,
  input         io_readEnableSram0Bank_0,
  input         io_readEnableSram0Bank_1,
  input         io_readEnableSram0Bank_2,
  input         io_readEnableSram0Bank_3,
  input         io_readEnableSram0Bank_4,
  input         io_readEnableSram0Bank_5,
  input         io_readEnableSram0Bank_6,
  input         io_readEnableSram0Bank_7,
  input         io_readEnableSram1Bank_0,
  input         io_readEnableSram1Bank_1,
  input         io_readEnableSram1Bank_2,
  input         io_readEnableSram1Bank_3,
  input         io_readEnableSram1Bank_4,
  input         io_readEnableSram1Bank_5,
  input         io_readEnableSram1Bank_6,
  input         io_readEnableSram1Bank_7,
  input  [31:0] io_writeDataSram0Bank_0,
  input  [31:0] io_writeDataSram0Bank_1,
  input  [31:0] io_writeDataSram0Bank_2,
  input  [31:0] io_writeDataSram0Bank_3,
  input  [31:0] io_writeDataSram0Bank_4,
  input  [31:0] io_writeDataSram0Bank_5,
  input  [31:0] io_writeDataSram0Bank_6,
  input  [31:0] io_writeDataSram0Bank_7,
  input  [31:0] io_writeDataSram1Bank_0,
  input  [31:0] io_writeDataSram1Bank_1,
  input  [31:0] io_writeDataSram1Bank_2,
  input  [31:0] io_writeDataSram1Bank_3,
  input  [31:0] io_writeDataSram1Bank_4,
  input  [31:0] io_writeDataSram1Bank_5,
  input  [31:0] io_writeDataSram1Bank_6,
  input  [31:0] io_writeDataSram1Bank_7,
  input         io_writeEnableSram0Bank_0,
  input         io_writeEnableSram0Bank_1,
  input         io_writeEnableSram0Bank_2,
  input         io_writeEnableSram0Bank_3,
  input         io_writeEnableSram0Bank_4,
  input         io_writeEnableSram0Bank_5,
  input         io_writeEnableSram0Bank_6,
  input         io_writeEnableSram0Bank_7,
  input         io_writeEnableSram1Bank_0,
  input         io_writeEnableSram1Bank_1,
  input         io_writeEnableSram1Bank_2,
  input         io_writeEnableSram1Bank_3,
  input         io_writeEnableSram1Bank_4,
  input         io_writeEnableSram1Bank_5,
  input         io_writeEnableSram1Bank_6,
  input         io_writeEnableSram1Bank_7,
  input  [3:0]  io_addrSram0Bank_0,
  input  [3:0]  io_addrSram0Bank_1,
  input  [3:0]  io_addrSram0Bank_2,
  input  [3:0]  io_addrSram0Bank_3,
  input  [3:0]  io_addrSram0Bank_4,
  input  [3:0]  io_addrSram0Bank_5,
  input  [3:0]  io_addrSram0Bank_6,
  input  [3:0]  io_addrSram0Bank_7,
  input  [3:0]  io_addrSram1Bank_0,
  input  [3:0]  io_addrSram1Bank_1,
  input  [3:0]  io_addrSram1Bank_2,
  input  [3:0]  io_addrSram1Bank_3,
  input  [3:0]  io_addrSram1Bank_4,
  input  [3:0]  io_addrSram1Bank_5,
  input  [3:0]  io_addrSram1Bank_6,
  input  [3:0]  io_addrSram1Bank_7
);
  wire  fftEngine_clock; // @[FFTTop.scala 31:27]
  wire  fftEngine_reset; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram0Bank_0; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram0Bank_1; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram0Bank_2; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram0Bank_3; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram0Bank_4; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram0Bank_5; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram0Bank_6; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram0Bank_7; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram1Bank_0; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram1Bank_1; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram1Bank_2; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram1Bank_3; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram1Bank_4; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram1Bank_5; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram1Bank_6; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_readDataSram1Bank_7; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram0Bank_0; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram0Bank_1; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram0Bank_2; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram0Bank_3; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram0Bank_4; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram0Bank_5; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram0Bank_6; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram0Bank_7; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram1Bank_0; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram1Bank_1; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram1Bank_2; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram1Bank_3; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram1Bank_4; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram1Bank_5; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram1Bank_6; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_readEnableSram1Bank_7; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram0Bank_0; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram0Bank_1; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram0Bank_2; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram0Bank_3; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram0Bank_4; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram0Bank_5; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram0Bank_6; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram0Bank_7; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram1Bank_0; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram1Bank_1; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram1Bank_2; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram1Bank_3; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram1Bank_4; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram1Bank_5; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram1Bank_6; // @[FFTTop.scala 31:27]
  wire [31:0] fftEngine_io_writeDataSram1Bank_7; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram0Bank_0; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram0Bank_1; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram0Bank_2; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram0Bank_3; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram0Bank_4; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram0Bank_5; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram0Bank_6; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram0Bank_7; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram1Bank_0; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram1Bank_1; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram1Bank_2; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram1Bank_3; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram1Bank_4; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram1Bank_5; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram1Bank_6; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_writeEnableSram1Bank_7; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram0Bank_0; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram0Bank_1; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram0Bank_2; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram0Bank_3; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram0Bank_4; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram0Bank_5; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram0Bank_6; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram0Bank_7; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram1Bank_0; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram1Bank_1; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram1Bank_2; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram1Bank_3; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram1Bank_4; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram1Bank_5; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram1Bank_6; // @[FFTTop.scala 31:27]
  wire [3:0] fftEngine_io_addrSram1Bank_7; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_fftDone; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_fftEngineKick; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_fftMode; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_fftRShiftP0_0; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_fftRShiftP0_1; // @[FFTTop.scala 31:27]
  wire  fftEngine_io_fftRShiftP0_2; // @[FFTTop.scala 31:27]
  wire  fftSram0_0_clock; // @[FFTTop.scala 32:62]
  wire  fftSram0_0_io_readEnable; // @[FFTTop.scala 32:62]
  wire  fftSram0_0_io_writeEnable; // @[FFTTop.scala 32:62]
  wire [3:0] fftSram0_0_io_addr; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_0_io_dataIn; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_0_io_dataOut; // @[FFTTop.scala 32:62]
  wire  fftSram0_1_clock; // @[FFTTop.scala 32:62]
  wire  fftSram0_1_io_readEnable; // @[FFTTop.scala 32:62]
  wire  fftSram0_1_io_writeEnable; // @[FFTTop.scala 32:62]
  wire [3:0] fftSram0_1_io_addr; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_1_io_dataIn; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_1_io_dataOut; // @[FFTTop.scala 32:62]
  wire  fftSram0_2_clock; // @[FFTTop.scala 32:62]
  wire  fftSram0_2_io_readEnable; // @[FFTTop.scala 32:62]
  wire  fftSram0_2_io_writeEnable; // @[FFTTop.scala 32:62]
  wire [3:0] fftSram0_2_io_addr; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_2_io_dataIn; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_2_io_dataOut; // @[FFTTop.scala 32:62]
  wire  fftSram0_3_clock; // @[FFTTop.scala 32:62]
  wire  fftSram0_3_io_readEnable; // @[FFTTop.scala 32:62]
  wire  fftSram0_3_io_writeEnable; // @[FFTTop.scala 32:62]
  wire [3:0] fftSram0_3_io_addr; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_3_io_dataIn; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_3_io_dataOut; // @[FFTTop.scala 32:62]
  wire  fftSram0_4_clock; // @[FFTTop.scala 32:62]
  wire  fftSram0_4_io_readEnable; // @[FFTTop.scala 32:62]
  wire  fftSram0_4_io_writeEnable; // @[FFTTop.scala 32:62]
  wire [3:0] fftSram0_4_io_addr; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_4_io_dataIn; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_4_io_dataOut; // @[FFTTop.scala 32:62]
  wire  fftSram0_5_clock; // @[FFTTop.scala 32:62]
  wire  fftSram0_5_io_readEnable; // @[FFTTop.scala 32:62]
  wire  fftSram0_5_io_writeEnable; // @[FFTTop.scala 32:62]
  wire [3:0] fftSram0_5_io_addr; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_5_io_dataIn; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_5_io_dataOut; // @[FFTTop.scala 32:62]
  wire  fftSram0_6_clock; // @[FFTTop.scala 32:62]
  wire  fftSram0_6_io_readEnable; // @[FFTTop.scala 32:62]
  wire  fftSram0_6_io_writeEnable; // @[FFTTop.scala 32:62]
  wire [3:0] fftSram0_6_io_addr; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_6_io_dataIn; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_6_io_dataOut; // @[FFTTop.scala 32:62]
  wire  fftSram0_7_clock; // @[FFTTop.scala 32:62]
  wire  fftSram0_7_io_readEnable; // @[FFTTop.scala 32:62]
  wire  fftSram0_7_io_writeEnable; // @[FFTTop.scala 32:62]
  wire [3:0] fftSram0_7_io_addr; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_7_io_dataIn; // @[FFTTop.scala 32:62]
  wire [31:0] fftSram0_7_io_dataOut; // @[FFTTop.scala 32:62]
  wire  fftSram1_0_clock; // @[FFTTop.scala 33:62]
  wire  fftSram1_0_io_readEnable; // @[FFTTop.scala 33:62]
  wire  fftSram1_0_io_writeEnable; // @[FFTTop.scala 33:62]
  wire [3:0] fftSram1_0_io_addr; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_0_io_dataIn; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_0_io_dataOut; // @[FFTTop.scala 33:62]
  wire  fftSram1_1_clock; // @[FFTTop.scala 33:62]
  wire  fftSram1_1_io_readEnable; // @[FFTTop.scala 33:62]
  wire  fftSram1_1_io_writeEnable; // @[FFTTop.scala 33:62]
  wire [3:0] fftSram1_1_io_addr; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_1_io_dataIn; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_1_io_dataOut; // @[FFTTop.scala 33:62]
  wire  fftSram1_2_clock; // @[FFTTop.scala 33:62]
  wire  fftSram1_2_io_readEnable; // @[FFTTop.scala 33:62]
  wire  fftSram1_2_io_writeEnable; // @[FFTTop.scala 33:62]
  wire [3:0] fftSram1_2_io_addr; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_2_io_dataIn; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_2_io_dataOut; // @[FFTTop.scala 33:62]
  wire  fftSram1_3_clock; // @[FFTTop.scala 33:62]
  wire  fftSram1_3_io_readEnable; // @[FFTTop.scala 33:62]
  wire  fftSram1_3_io_writeEnable; // @[FFTTop.scala 33:62]
  wire [3:0] fftSram1_3_io_addr; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_3_io_dataIn; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_3_io_dataOut; // @[FFTTop.scala 33:62]
  wire  fftSram1_4_clock; // @[FFTTop.scala 33:62]
  wire  fftSram1_4_io_readEnable; // @[FFTTop.scala 33:62]
  wire  fftSram1_4_io_writeEnable; // @[FFTTop.scala 33:62]
  wire [3:0] fftSram1_4_io_addr; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_4_io_dataIn; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_4_io_dataOut; // @[FFTTop.scala 33:62]
  wire  fftSram1_5_clock; // @[FFTTop.scala 33:62]
  wire  fftSram1_5_io_readEnable; // @[FFTTop.scala 33:62]
  wire  fftSram1_5_io_writeEnable; // @[FFTTop.scala 33:62]
  wire [3:0] fftSram1_5_io_addr; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_5_io_dataIn; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_5_io_dataOut; // @[FFTTop.scala 33:62]
  wire  fftSram1_6_clock; // @[FFTTop.scala 33:62]
  wire  fftSram1_6_io_readEnable; // @[FFTTop.scala 33:62]
  wire  fftSram1_6_io_writeEnable; // @[FFTTop.scala 33:62]
  wire [3:0] fftSram1_6_io_addr; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_6_io_dataIn; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_6_io_dataOut; // @[FFTTop.scala 33:62]
  wire  fftSram1_7_clock; // @[FFTTop.scala 33:62]
  wire  fftSram1_7_io_readEnable; // @[FFTTop.scala 33:62]
  wire  fftSram1_7_io_writeEnable; // @[FFTTop.scala 33:62]
  wire [3:0] fftSram1_7_io_addr; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_7_io_dataIn; // @[FFTTop.scala 33:62]
  wire [31:0] fftSram1_7_io_dataOut; // @[FFTTop.scala 33:62]
  FFTEngine fftEngine ( // @[FFTTop.scala 31:27]
    .clock(fftEngine_clock),
    .reset(fftEngine_reset),
    .io_readDataSram0Bank_0(fftEngine_io_readDataSram0Bank_0),
    .io_readDataSram0Bank_1(fftEngine_io_readDataSram0Bank_1),
    .io_readDataSram0Bank_2(fftEngine_io_readDataSram0Bank_2),
    .io_readDataSram0Bank_3(fftEngine_io_readDataSram0Bank_3),
    .io_readDataSram0Bank_4(fftEngine_io_readDataSram0Bank_4),
    .io_readDataSram0Bank_5(fftEngine_io_readDataSram0Bank_5),
    .io_readDataSram0Bank_6(fftEngine_io_readDataSram0Bank_6),
    .io_readDataSram0Bank_7(fftEngine_io_readDataSram0Bank_7),
    .io_readDataSram1Bank_0(fftEngine_io_readDataSram1Bank_0),
    .io_readDataSram1Bank_1(fftEngine_io_readDataSram1Bank_1),
    .io_readDataSram1Bank_2(fftEngine_io_readDataSram1Bank_2),
    .io_readDataSram1Bank_3(fftEngine_io_readDataSram1Bank_3),
    .io_readDataSram1Bank_4(fftEngine_io_readDataSram1Bank_4),
    .io_readDataSram1Bank_5(fftEngine_io_readDataSram1Bank_5),
    .io_readDataSram1Bank_6(fftEngine_io_readDataSram1Bank_6),
    .io_readDataSram1Bank_7(fftEngine_io_readDataSram1Bank_7),
    .io_readEnableSram0Bank_0(fftEngine_io_readEnableSram0Bank_0),
    .io_readEnableSram0Bank_1(fftEngine_io_readEnableSram0Bank_1),
    .io_readEnableSram0Bank_2(fftEngine_io_readEnableSram0Bank_2),
    .io_readEnableSram0Bank_3(fftEngine_io_readEnableSram0Bank_3),
    .io_readEnableSram0Bank_4(fftEngine_io_readEnableSram0Bank_4),
    .io_readEnableSram0Bank_5(fftEngine_io_readEnableSram0Bank_5),
    .io_readEnableSram0Bank_6(fftEngine_io_readEnableSram0Bank_6),
    .io_readEnableSram0Bank_7(fftEngine_io_readEnableSram0Bank_7),
    .io_readEnableSram1Bank_0(fftEngine_io_readEnableSram1Bank_0),
    .io_readEnableSram1Bank_1(fftEngine_io_readEnableSram1Bank_1),
    .io_readEnableSram1Bank_2(fftEngine_io_readEnableSram1Bank_2),
    .io_readEnableSram1Bank_3(fftEngine_io_readEnableSram1Bank_3),
    .io_readEnableSram1Bank_4(fftEngine_io_readEnableSram1Bank_4),
    .io_readEnableSram1Bank_5(fftEngine_io_readEnableSram1Bank_5),
    .io_readEnableSram1Bank_6(fftEngine_io_readEnableSram1Bank_6),
    .io_readEnableSram1Bank_7(fftEngine_io_readEnableSram1Bank_7),
    .io_writeDataSram0Bank_0(fftEngine_io_writeDataSram0Bank_0),
    .io_writeDataSram0Bank_1(fftEngine_io_writeDataSram0Bank_1),
    .io_writeDataSram0Bank_2(fftEngine_io_writeDataSram0Bank_2),
    .io_writeDataSram0Bank_3(fftEngine_io_writeDataSram0Bank_3),
    .io_writeDataSram0Bank_4(fftEngine_io_writeDataSram0Bank_4),
    .io_writeDataSram0Bank_5(fftEngine_io_writeDataSram0Bank_5),
    .io_writeDataSram0Bank_6(fftEngine_io_writeDataSram0Bank_6),
    .io_writeDataSram0Bank_7(fftEngine_io_writeDataSram0Bank_7),
    .io_writeDataSram1Bank_0(fftEngine_io_writeDataSram1Bank_0),
    .io_writeDataSram1Bank_1(fftEngine_io_writeDataSram1Bank_1),
    .io_writeDataSram1Bank_2(fftEngine_io_writeDataSram1Bank_2),
    .io_writeDataSram1Bank_3(fftEngine_io_writeDataSram1Bank_3),
    .io_writeDataSram1Bank_4(fftEngine_io_writeDataSram1Bank_4),
    .io_writeDataSram1Bank_5(fftEngine_io_writeDataSram1Bank_5),
    .io_writeDataSram1Bank_6(fftEngine_io_writeDataSram1Bank_6),
    .io_writeDataSram1Bank_7(fftEngine_io_writeDataSram1Bank_7),
    .io_writeEnableSram0Bank_0(fftEngine_io_writeEnableSram0Bank_0),
    .io_writeEnableSram0Bank_1(fftEngine_io_writeEnableSram0Bank_1),
    .io_writeEnableSram0Bank_2(fftEngine_io_writeEnableSram0Bank_2),
    .io_writeEnableSram0Bank_3(fftEngine_io_writeEnableSram0Bank_3),
    .io_writeEnableSram0Bank_4(fftEngine_io_writeEnableSram0Bank_4),
    .io_writeEnableSram0Bank_5(fftEngine_io_writeEnableSram0Bank_5),
    .io_writeEnableSram0Bank_6(fftEngine_io_writeEnableSram0Bank_6),
    .io_writeEnableSram0Bank_7(fftEngine_io_writeEnableSram0Bank_7),
    .io_writeEnableSram1Bank_0(fftEngine_io_writeEnableSram1Bank_0),
    .io_writeEnableSram1Bank_1(fftEngine_io_writeEnableSram1Bank_1),
    .io_writeEnableSram1Bank_2(fftEngine_io_writeEnableSram1Bank_2),
    .io_writeEnableSram1Bank_3(fftEngine_io_writeEnableSram1Bank_3),
    .io_writeEnableSram1Bank_4(fftEngine_io_writeEnableSram1Bank_4),
    .io_writeEnableSram1Bank_5(fftEngine_io_writeEnableSram1Bank_5),
    .io_writeEnableSram1Bank_6(fftEngine_io_writeEnableSram1Bank_6),
    .io_writeEnableSram1Bank_7(fftEngine_io_writeEnableSram1Bank_7),
    .io_addrSram0Bank_0(fftEngine_io_addrSram0Bank_0),
    .io_addrSram0Bank_1(fftEngine_io_addrSram0Bank_1),
    .io_addrSram0Bank_2(fftEngine_io_addrSram0Bank_2),
    .io_addrSram0Bank_3(fftEngine_io_addrSram0Bank_3),
    .io_addrSram0Bank_4(fftEngine_io_addrSram0Bank_4),
    .io_addrSram0Bank_5(fftEngine_io_addrSram0Bank_5),
    .io_addrSram0Bank_6(fftEngine_io_addrSram0Bank_6),
    .io_addrSram0Bank_7(fftEngine_io_addrSram0Bank_7),
    .io_addrSram1Bank_0(fftEngine_io_addrSram1Bank_0),
    .io_addrSram1Bank_1(fftEngine_io_addrSram1Bank_1),
    .io_addrSram1Bank_2(fftEngine_io_addrSram1Bank_2),
    .io_addrSram1Bank_3(fftEngine_io_addrSram1Bank_3),
    .io_addrSram1Bank_4(fftEngine_io_addrSram1Bank_4),
    .io_addrSram1Bank_5(fftEngine_io_addrSram1Bank_5),
    .io_addrSram1Bank_6(fftEngine_io_addrSram1Bank_6),
    .io_addrSram1Bank_7(fftEngine_io_addrSram1Bank_7),
    .io_fftDone(fftEngine_io_fftDone),
    .io_fftEngineKick(fftEngine_io_fftEngineKick),
    .io_fftMode(fftEngine_io_fftMode),
    .io_fftRShiftP0_0(fftEngine_io_fftRShiftP0_0),
    .io_fftRShiftP0_1(fftEngine_io_fftRShiftP0_1),
    .io_fftRShiftP0_2(fftEngine_io_fftRShiftP0_2)
  );
  FFTSram fftSram0_0 ( // @[FFTTop.scala 32:62]
    .clock(fftSram0_0_clock),
    .io_readEnable(fftSram0_0_io_readEnable),
    .io_writeEnable(fftSram0_0_io_writeEnable),
    .io_addr(fftSram0_0_io_addr),
    .io_dataIn(fftSram0_0_io_dataIn),
    .io_dataOut(fftSram0_0_io_dataOut)
  );
  FFTSram fftSram0_1 ( // @[FFTTop.scala 32:62]
    .clock(fftSram0_1_clock),
    .io_readEnable(fftSram0_1_io_readEnable),
    .io_writeEnable(fftSram0_1_io_writeEnable),
    .io_addr(fftSram0_1_io_addr),
    .io_dataIn(fftSram0_1_io_dataIn),
    .io_dataOut(fftSram0_1_io_dataOut)
  );
  FFTSram fftSram0_2 ( // @[FFTTop.scala 32:62]
    .clock(fftSram0_2_clock),
    .io_readEnable(fftSram0_2_io_readEnable),
    .io_writeEnable(fftSram0_2_io_writeEnable),
    .io_addr(fftSram0_2_io_addr),
    .io_dataIn(fftSram0_2_io_dataIn),
    .io_dataOut(fftSram0_2_io_dataOut)
  );
  FFTSram fftSram0_3 ( // @[FFTTop.scala 32:62]
    .clock(fftSram0_3_clock),
    .io_readEnable(fftSram0_3_io_readEnable),
    .io_writeEnable(fftSram0_3_io_writeEnable),
    .io_addr(fftSram0_3_io_addr),
    .io_dataIn(fftSram0_3_io_dataIn),
    .io_dataOut(fftSram0_3_io_dataOut)
  );
  FFTSram fftSram0_4 ( // @[FFTTop.scala 32:62]
    .clock(fftSram0_4_clock),
    .io_readEnable(fftSram0_4_io_readEnable),
    .io_writeEnable(fftSram0_4_io_writeEnable),
    .io_addr(fftSram0_4_io_addr),
    .io_dataIn(fftSram0_4_io_dataIn),
    .io_dataOut(fftSram0_4_io_dataOut)
  );
  FFTSram fftSram0_5 ( // @[FFTTop.scala 32:62]
    .clock(fftSram0_5_clock),
    .io_readEnable(fftSram0_5_io_readEnable),
    .io_writeEnable(fftSram0_5_io_writeEnable),
    .io_addr(fftSram0_5_io_addr),
    .io_dataIn(fftSram0_5_io_dataIn),
    .io_dataOut(fftSram0_5_io_dataOut)
  );
  FFTSram fftSram0_6 ( // @[FFTTop.scala 32:62]
    .clock(fftSram0_6_clock),
    .io_readEnable(fftSram0_6_io_readEnable),
    .io_writeEnable(fftSram0_6_io_writeEnable),
    .io_addr(fftSram0_6_io_addr),
    .io_dataIn(fftSram0_6_io_dataIn),
    .io_dataOut(fftSram0_6_io_dataOut)
  );
  FFTSram fftSram0_7 ( // @[FFTTop.scala 32:62]
    .clock(fftSram0_7_clock),
    .io_readEnable(fftSram0_7_io_readEnable),
    .io_writeEnable(fftSram0_7_io_writeEnable),
    .io_addr(fftSram0_7_io_addr),
    .io_dataIn(fftSram0_7_io_dataIn),
    .io_dataOut(fftSram0_7_io_dataOut)
  );
  FFTSram fftSram1_0 ( // @[FFTTop.scala 33:62]
    .clock(fftSram1_0_clock),
    .io_readEnable(fftSram1_0_io_readEnable),
    .io_writeEnable(fftSram1_0_io_writeEnable),
    .io_addr(fftSram1_0_io_addr),
    .io_dataIn(fftSram1_0_io_dataIn),
    .io_dataOut(fftSram1_0_io_dataOut)
  );
  FFTSram fftSram1_1 ( // @[FFTTop.scala 33:62]
    .clock(fftSram1_1_clock),
    .io_readEnable(fftSram1_1_io_readEnable),
    .io_writeEnable(fftSram1_1_io_writeEnable),
    .io_addr(fftSram1_1_io_addr),
    .io_dataIn(fftSram1_1_io_dataIn),
    .io_dataOut(fftSram1_1_io_dataOut)
  );
  FFTSram fftSram1_2 ( // @[FFTTop.scala 33:62]
    .clock(fftSram1_2_clock),
    .io_readEnable(fftSram1_2_io_readEnable),
    .io_writeEnable(fftSram1_2_io_writeEnable),
    .io_addr(fftSram1_2_io_addr),
    .io_dataIn(fftSram1_2_io_dataIn),
    .io_dataOut(fftSram1_2_io_dataOut)
  );
  FFTSram fftSram1_3 ( // @[FFTTop.scala 33:62]
    .clock(fftSram1_3_clock),
    .io_readEnable(fftSram1_3_io_readEnable),
    .io_writeEnable(fftSram1_3_io_writeEnable),
    .io_addr(fftSram1_3_io_addr),
    .io_dataIn(fftSram1_3_io_dataIn),
    .io_dataOut(fftSram1_3_io_dataOut)
  );
  FFTSram fftSram1_4 ( // @[FFTTop.scala 33:62]
    .clock(fftSram1_4_clock),
    .io_readEnable(fftSram1_4_io_readEnable),
    .io_writeEnable(fftSram1_4_io_writeEnable),
    .io_addr(fftSram1_4_io_addr),
    .io_dataIn(fftSram1_4_io_dataIn),
    .io_dataOut(fftSram1_4_io_dataOut)
  );
  FFTSram fftSram1_5 ( // @[FFTTop.scala 33:62]
    .clock(fftSram1_5_clock),
    .io_readEnable(fftSram1_5_io_readEnable),
    .io_writeEnable(fftSram1_5_io_writeEnable),
    .io_addr(fftSram1_5_io_addr),
    .io_dataIn(fftSram1_5_io_dataIn),
    .io_dataOut(fftSram1_5_io_dataOut)
  );
  FFTSram fftSram1_6 ( // @[FFTTop.scala 33:62]
    .clock(fftSram1_6_clock),
    .io_readEnable(fftSram1_6_io_readEnable),
    .io_writeEnable(fftSram1_6_io_writeEnable),
    .io_addr(fftSram1_6_io_addr),
    .io_dataIn(fftSram1_6_io_dataIn),
    .io_dataOut(fftSram1_6_io_dataOut)
  );
  FFTSram fftSram1_7 ( // @[FFTTop.scala 33:62]
    .clock(fftSram1_7_clock),
    .io_readEnable(fftSram1_7_io_readEnable),
    .io_writeEnable(fftSram1_7_io_writeEnable),
    .io_addr(fftSram1_7_io_addr),
    .io_dataIn(fftSram1_7_io_dataIn),
    .io_dataOut(fftSram1_7_io_dataOut)
  );
  assign io_fftDone = fftEngine_io_fftDone; // @[FFTTop.scala 49:16]
  assign io_readDataSram0Bank_0 = fftSram0_0_io_dataOut; // @[FFTTop.scala 37:33]
  assign io_readDataSram0Bank_1 = fftSram0_1_io_dataOut; // @[FFTTop.scala 37:33]
  assign io_readDataSram0Bank_2 = fftSram0_2_io_dataOut; // @[FFTTop.scala 37:33]
  assign io_readDataSram0Bank_3 = fftSram0_3_io_dataOut; // @[FFTTop.scala 37:33]
  assign io_readDataSram0Bank_4 = fftSram0_4_io_dataOut; // @[FFTTop.scala 37:33]
  assign io_readDataSram0Bank_5 = fftSram0_5_io_dataOut; // @[FFTTop.scala 37:33]
  assign io_readDataSram0Bank_6 = fftSram0_6_io_dataOut; // @[FFTTop.scala 37:33]
  assign io_readDataSram0Bank_7 = fftSram0_7_io_dataOut; // @[FFTTop.scala 37:33]
  assign io_readDataSram1Bank_0 = fftSram1_0_io_dataOut; // @[FFTTop.scala 38:33]
  assign io_readDataSram1Bank_1 = fftSram1_1_io_dataOut; // @[FFTTop.scala 38:33]
  assign io_readDataSram1Bank_2 = fftSram1_2_io_dataOut; // @[FFTTop.scala 38:33]
  assign io_readDataSram1Bank_3 = fftSram1_3_io_dataOut; // @[FFTTop.scala 38:33]
  assign io_readDataSram1Bank_4 = fftSram1_4_io_dataOut; // @[FFTTop.scala 38:33]
  assign io_readDataSram1Bank_5 = fftSram1_5_io_dataOut; // @[FFTTop.scala 38:33]
  assign io_readDataSram1Bank_6 = fftSram1_6_io_dataOut; // @[FFTTop.scala 38:33]
  assign io_readDataSram1Bank_7 = fftSram1_7_io_dataOut; // @[FFTTop.scala 38:33]
  assign fftEngine_clock = clock;
  assign fftEngine_reset = reset;
  assign fftEngine_io_readDataSram0Bank_0 = fftSram0_0_io_dataOut; // @[FFTTop.scala 35:43]
  assign fftEngine_io_readDataSram0Bank_1 = fftSram0_1_io_dataOut; // @[FFTTop.scala 35:43]
  assign fftEngine_io_readDataSram0Bank_2 = fftSram0_2_io_dataOut; // @[FFTTop.scala 35:43]
  assign fftEngine_io_readDataSram0Bank_3 = fftSram0_3_io_dataOut; // @[FFTTop.scala 35:43]
  assign fftEngine_io_readDataSram0Bank_4 = fftSram0_4_io_dataOut; // @[FFTTop.scala 35:43]
  assign fftEngine_io_readDataSram0Bank_5 = fftSram0_5_io_dataOut; // @[FFTTop.scala 35:43]
  assign fftEngine_io_readDataSram0Bank_6 = fftSram0_6_io_dataOut; // @[FFTTop.scala 35:43]
  assign fftEngine_io_readDataSram0Bank_7 = fftSram0_7_io_dataOut; // @[FFTTop.scala 35:43]
  assign fftEngine_io_readDataSram1Bank_0 = fftSram1_0_io_dataOut; // @[FFTTop.scala 36:43]
  assign fftEngine_io_readDataSram1Bank_1 = fftSram1_1_io_dataOut; // @[FFTTop.scala 36:43]
  assign fftEngine_io_readDataSram1Bank_2 = fftSram1_2_io_dataOut; // @[FFTTop.scala 36:43]
  assign fftEngine_io_readDataSram1Bank_3 = fftSram1_3_io_dataOut; // @[FFTTop.scala 36:43]
  assign fftEngine_io_readDataSram1Bank_4 = fftSram1_4_io_dataOut; // @[FFTTop.scala 36:43]
  assign fftEngine_io_readDataSram1Bank_5 = fftSram1_5_io_dataOut; // @[FFTTop.scala 36:43]
  assign fftEngine_io_readDataSram1Bank_6 = fftSram1_6_io_dataOut; // @[FFTTop.scala 36:43]
  assign fftEngine_io_readDataSram1Bank_7 = fftSram1_7_io_dataOut; // @[FFTTop.scala 36:43]
  assign fftEngine_io_fftEngineKick = io_fftEngineKick; // @[FFTTop.scala 50:32]
  assign fftEngine_io_fftMode = io_fftMode; // @[FFTTop.scala 51:26]
  assign fftEngine_io_fftRShiftP0_0 = io_fftRShiftP0_0; // @[FFTTop.scala 52:30]
  assign fftEngine_io_fftRShiftP0_1 = io_fftRShiftP0_1; // @[FFTTop.scala 52:30]
  assign fftEngine_io_fftRShiftP0_2 = io_fftRShiftP0_2; // @[FFTTop.scala 52:30]
  assign fftSram0_0_clock = clock;
  assign fftSram0_0_io_readEnable = io_externalMode ? io_readEnableSram0Bank_0 : fftEngine_io_readEnableSram0Bank_0; // @[FFTTop.scala 40:41]
  assign fftSram0_0_io_writeEnable = io_externalMode ? io_writeEnableSram0Bank_0 : fftEngine_io_writeEnableSram0Bank_0; // @[FFTTop.scala 44:42]
  assign fftSram0_0_io_addr = io_externalMode ? io_addrSram0Bank_0 : fftEngine_io_addrSram0Bank_0; // @[FFTTop.scala 46:35]
  assign fftSram0_0_io_dataIn = io_externalMode ? io_writeDataSram0Bank_0 : fftEngine_io_writeDataSram0Bank_0; // @[FFTTop.scala 42:37]
  assign fftSram0_1_clock = clock;
  assign fftSram0_1_io_readEnable = io_externalMode ? io_readEnableSram0Bank_1 : fftEngine_io_readEnableSram0Bank_1; // @[FFTTop.scala 40:41]
  assign fftSram0_1_io_writeEnable = io_externalMode ? io_writeEnableSram0Bank_1 : fftEngine_io_writeEnableSram0Bank_1; // @[FFTTop.scala 44:42]
  assign fftSram0_1_io_addr = io_externalMode ? io_addrSram0Bank_1 : fftEngine_io_addrSram0Bank_1; // @[FFTTop.scala 46:35]
  assign fftSram0_1_io_dataIn = io_externalMode ? io_writeDataSram0Bank_1 : fftEngine_io_writeDataSram0Bank_1; // @[FFTTop.scala 42:37]
  assign fftSram0_2_clock = clock;
  assign fftSram0_2_io_readEnable = io_externalMode ? io_readEnableSram0Bank_2 : fftEngine_io_readEnableSram0Bank_2; // @[FFTTop.scala 40:41]
  assign fftSram0_2_io_writeEnable = io_externalMode ? io_writeEnableSram0Bank_2 : fftEngine_io_writeEnableSram0Bank_2; // @[FFTTop.scala 44:42]
  assign fftSram0_2_io_addr = io_externalMode ? io_addrSram0Bank_2 : fftEngine_io_addrSram0Bank_2; // @[FFTTop.scala 46:35]
  assign fftSram0_2_io_dataIn = io_externalMode ? io_writeDataSram0Bank_2 : fftEngine_io_writeDataSram0Bank_2; // @[FFTTop.scala 42:37]
  assign fftSram0_3_clock = clock;
  assign fftSram0_3_io_readEnable = io_externalMode ? io_readEnableSram0Bank_3 : fftEngine_io_readEnableSram0Bank_3; // @[FFTTop.scala 40:41]
  assign fftSram0_3_io_writeEnable = io_externalMode ? io_writeEnableSram0Bank_3 : fftEngine_io_writeEnableSram0Bank_3; // @[FFTTop.scala 44:42]
  assign fftSram0_3_io_addr = io_externalMode ? io_addrSram0Bank_3 : fftEngine_io_addrSram0Bank_3; // @[FFTTop.scala 46:35]
  assign fftSram0_3_io_dataIn = io_externalMode ? io_writeDataSram0Bank_3 : fftEngine_io_writeDataSram0Bank_3; // @[FFTTop.scala 42:37]
  assign fftSram0_4_clock = clock;
  assign fftSram0_4_io_readEnable = io_externalMode ? io_readEnableSram0Bank_4 : fftEngine_io_readEnableSram0Bank_4; // @[FFTTop.scala 40:41]
  assign fftSram0_4_io_writeEnable = io_externalMode ? io_writeEnableSram0Bank_4 : fftEngine_io_writeEnableSram0Bank_4; // @[FFTTop.scala 44:42]
  assign fftSram0_4_io_addr = io_externalMode ? io_addrSram0Bank_4 : fftEngine_io_addrSram0Bank_4; // @[FFTTop.scala 46:35]
  assign fftSram0_4_io_dataIn = io_externalMode ? io_writeDataSram0Bank_4 : fftEngine_io_writeDataSram0Bank_4; // @[FFTTop.scala 42:37]
  assign fftSram0_5_clock = clock;
  assign fftSram0_5_io_readEnable = io_externalMode ? io_readEnableSram0Bank_5 : fftEngine_io_readEnableSram0Bank_5; // @[FFTTop.scala 40:41]
  assign fftSram0_5_io_writeEnable = io_externalMode ? io_writeEnableSram0Bank_5 : fftEngine_io_writeEnableSram0Bank_5; // @[FFTTop.scala 44:42]
  assign fftSram0_5_io_addr = io_externalMode ? io_addrSram0Bank_5 : fftEngine_io_addrSram0Bank_5; // @[FFTTop.scala 46:35]
  assign fftSram0_5_io_dataIn = io_externalMode ? io_writeDataSram0Bank_5 : fftEngine_io_writeDataSram0Bank_5; // @[FFTTop.scala 42:37]
  assign fftSram0_6_clock = clock;
  assign fftSram0_6_io_readEnable = io_externalMode ? io_readEnableSram0Bank_6 : fftEngine_io_readEnableSram0Bank_6; // @[FFTTop.scala 40:41]
  assign fftSram0_6_io_writeEnable = io_externalMode ? io_writeEnableSram0Bank_6 : fftEngine_io_writeEnableSram0Bank_6; // @[FFTTop.scala 44:42]
  assign fftSram0_6_io_addr = io_externalMode ? io_addrSram0Bank_6 : fftEngine_io_addrSram0Bank_6; // @[FFTTop.scala 46:35]
  assign fftSram0_6_io_dataIn = io_externalMode ? io_writeDataSram0Bank_6 : fftEngine_io_writeDataSram0Bank_6; // @[FFTTop.scala 42:37]
  assign fftSram0_7_clock = clock;
  assign fftSram0_7_io_readEnable = io_externalMode ? io_readEnableSram0Bank_7 : fftEngine_io_readEnableSram0Bank_7; // @[FFTTop.scala 40:41]
  assign fftSram0_7_io_writeEnable = io_externalMode ? io_writeEnableSram0Bank_7 : fftEngine_io_writeEnableSram0Bank_7; // @[FFTTop.scala 44:42]
  assign fftSram0_7_io_addr = io_externalMode ? io_addrSram0Bank_7 : fftEngine_io_addrSram0Bank_7; // @[FFTTop.scala 46:35]
  assign fftSram0_7_io_dataIn = io_externalMode ? io_writeDataSram0Bank_7 : fftEngine_io_writeDataSram0Bank_7; // @[FFTTop.scala 42:37]
  assign fftSram1_0_clock = clock;
  assign fftSram1_0_io_readEnable = io_externalMode ? io_readEnableSram1Bank_0 : fftEngine_io_readEnableSram1Bank_0; // @[FFTTop.scala 41:41]
  assign fftSram1_0_io_writeEnable = io_externalMode ? io_writeEnableSram1Bank_0 : fftEngine_io_writeEnableSram1Bank_0; // @[FFTTop.scala 45:42]
  assign fftSram1_0_io_addr = io_externalMode ? io_addrSram1Bank_0 : fftEngine_io_addrSram1Bank_0; // @[FFTTop.scala 47:35]
  assign fftSram1_0_io_dataIn = io_externalMode ? io_writeDataSram1Bank_0 : fftEngine_io_writeDataSram1Bank_0; // @[FFTTop.scala 43:37]
  assign fftSram1_1_clock = clock;
  assign fftSram1_1_io_readEnable = io_externalMode ? io_readEnableSram1Bank_1 : fftEngine_io_readEnableSram1Bank_1; // @[FFTTop.scala 41:41]
  assign fftSram1_1_io_writeEnable = io_externalMode ? io_writeEnableSram1Bank_1 : fftEngine_io_writeEnableSram1Bank_1; // @[FFTTop.scala 45:42]
  assign fftSram1_1_io_addr = io_externalMode ? io_addrSram1Bank_1 : fftEngine_io_addrSram1Bank_1; // @[FFTTop.scala 47:35]
  assign fftSram1_1_io_dataIn = io_externalMode ? io_writeDataSram1Bank_1 : fftEngine_io_writeDataSram1Bank_1; // @[FFTTop.scala 43:37]
  assign fftSram1_2_clock = clock;
  assign fftSram1_2_io_readEnable = io_externalMode ? io_readEnableSram1Bank_2 : fftEngine_io_readEnableSram1Bank_2; // @[FFTTop.scala 41:41]
  assign fftSram1_2_io_writeEnable = io_externalMode ? io_writeEnableSram1Bank_2 : fftEngine_io_writeEnableSram1Bank_2; // @[FFTTop.scala 45:42]
  assign fftSram1_2_io_addr = io_externalMode ? io_addrSram1Bank_2 : fftEngine_io_addrSram1Bank_2; // @[FFTTop.scala 47:35]
  assign fftSram1_2_io_dataIn = io_externalMode ? io_writeDataSram1Bank_2 : fftEngine_io_writeDataSram1Bank_2; // @[FFTTop.scala 43:37]
  assign fftSram1_3_clock = clock;
  assign fftSram1_3_io_readEnable = io_externalMode ? io_readEnableSram1Bank_3 : fftEngine_io_readEnableSram1Bank_3; // @[FFTTop.scala 41:41]
  assign fftSram1_3_io_writeEnable = io_externalMode ? io_writeEnableSram1Bank_3 : fftEngine_io_writeEnableSram1Bank_3; // @[FFTTop.scala 45:42]
  assign fftSram1_3_io_addr = io_externalMode ? io_addrSram1Bank_3 : fftEngine_io_addrSram1Bank_3; // @[FFTTop.scala 47:35]
  assign fftSram1_3_io_dataIn = io_externalMode ? io_writeDataSram1Bank_3 : fftEngine_io_writeDataSram1Bank_3; // @[FFTTop.scala 43:37]
  assign fftSram1_4_clock = clock;
  assign fftSram1_4_io_readEnable = io_externalMode ? io_readEnableSram1Bank_4 : fftEngine_io_readEnableSram1Bank_4; // @[FFTTop.scala 41:41]
  assign fftSram1_4_io_writeEnable = io_externalMode ? io_writeEnableSram1Bank_4 : fftEngine_io_writeEnableSram1Bank_4; // @[FFTTop.scala 45:42]
  assign fftSram1_4_io_addr = io_externalMode ? io_addrSram1Bank_4 : fftEngine_io_addrSram1Bank_4; // @[FFTTop.scala 47:35]
  assign fftSram1_4_io_dataIn = io_externalMode ? io_writeDataSram1Bank_4 : fftEngine_io_writeDataSram1Bank_4; // @[FFTTop.scala 43:37]
  assign fftSram1_5_clock = clock;
  assign fftSram1_5_io_readEnable = io_externalMode ? io_readEnableSram1Bank_5 : fftEngine_io_readEnableSram1Bank_5; // @[FFTTop.scala 41:41]
  assign fftSram1_5_io_writeEnable = io_externalMode ? io_writeEnableSram1Bank_5 : fftEngine_io_writeEnableSram1Bank_5; // @[FFTTop.scala 45:42]
  assign fftSram1_5_io_addr = io_externalMode ? io_addrSram1Bank_5 : fftEngine_io_addrSram1Bank_5; // @[FFTTop.scala 47:35]
  assign fftSram1_5_io_dataIn = io_externalMode ? io_writeDataSram1Bank_5 : fftEngine_io_writeDataSram1Bank_5; // @[FFTTop.scala 43:37]
  assign fftSram1_6_clock = clock;
  assign fftSram1_6_io_readEnable = io_externalMode ? io_readEnableSram1Bank_6 : fftEngine_io_readEnableSram1Bank_6; // @[FFTTop.scala 41:41]
  assign fftSram1_6_io_writeEnable = io_externalMode ? io_writeEnableSram1Bank_6 : fftEngine_io_writeEnableSram1Bank_6; // @[FFTTop.scala 45:42]
  assign fftSram1_6_io_addr = io_externalMode ? io_addrSram1Bank_6 : fftEngine_io_addrSram1Bank_6; // @[FFTTop.scala 47:35]
  assign fftSram1_6_io_dataIn = io_externalMode ? io_writeDataSram1Bank_6 : fftEngine_io_writeDataSram1Bank_6; // @[FFTTop.scala 43:37]
  assign fftSram1_7_clock = clock;
  assign fftSram1_7_io_readEnable = io_externalMode ? io_readEnableSram1Bank_7 : fftEngine_io_readEnableSram1Bank_7; // @[FFTTop.scala 41:41]
  assign fftSram1_7_io_writeEnable = io_externalMode ? io_writeEnableSram1Bank_7 : fftEngine_io_writeEnableSram1Bank_7; // @[FFTTop.scala 45:42]
  assign fftSram1_7_io_addr = io_externalMode ? io_addrSram1Bank_7 : fftEngine_io_addrSram1Bank_7; // @[FFTTop.scala 47:35]
  assign fftSram1_7_io_dataIn = io_externalMode ? io_writeDataSram1Bank_7 : fftEngine_io_writeDataSram1Bank_7; // @[FFTTop.scala 43:37]
endmodule
