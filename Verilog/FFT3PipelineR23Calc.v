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
  input  [5:0]  io_nk,
  input  [5:0]  io_twiLutCaseIndex,
  output [13:0] io_wR,
  output [13:0] io_wI
);
  wire  _idx_r_T_3 = io_nk[4] & |io_nk[3:0]; // @[FFTTwiddle.scala 36:43]
  wire [5:0] _idx_r_T_4 = ~io_nk; // @[FFTTwiddle.scala 36:80]
  wire [5:0] _idx_r_T_6 = _idx_r_T_4 + 6'h1; // @[FFTTwiddle.scala 36:87]
  wire [5:0] idx_r = io_nk[4] & |io_nk[3:0] ? _idx_r_T_6 : io_nk; // @[FFTTwiddle.scala 36:20]
  wire  chg_sign_flag_r = io_twiLutCaseIndex == 6'h2 ? ~_idx_r_T_3 : _idx_r_T_3; // @[FFTTwiddle.scala 48:30]
  wire  chg_sign_flag_i = io_twiLutCaseIndex == 6'h1 ? 1'h0 : 1'h1; // @[FFTTwiddle.scala 49:30]
  wire [13:0] _GEN_1 = 5'h1 == idx_r[4:0] ? $signed(14'shfec) : $signed(14'sh1000); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_2 = 5'h2 == idx_r[4:0] ? $signed(14'shfb1) : $signed(_GEN_1); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_3 = 5'h3 == idx_r[4:0] ? $signed(14'shf50) : $signed(_GEN_2); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_4 = 5'h4 == idx_r[4:0] ? $signed(14'shec8) : $signed(_GEN_3); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_5 = 5'h5 == idx_r[4:0] ? $signed(14'she1c) : $signed(_GEN_4); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_6 = 5'h6 == idx_r[4:0] ? $signed(14'shd4e) : $signed(_GEN_5); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_7 = 5'h7 == idx_r[4:0] ? $signed(14'shc5e) : $signed(_GEN_6); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_8 = 5'h8 == idx_r[4:0] ? $signed(14'shb50) : $signed(_GEN_7); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_9 = 5'h9 == idx_r[4:0] ? $signed(14'sha26) : $signed(_GEN_8); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_10 = 5'ha == idx_r[4:0] ? $signed(14'sh8e4) : $signed(_GEN_9); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_11 = 5'hb == idx_r[4:0] ? $signed(14'sh78b) : $signed(_GEN_10); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_12 = 5'hc == idx_r[4:0] ? $signed(14'sh61f) : $signed(_GEN_11); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_13 = 5'hd == idx_r[4:0] ? $signed(14'sh4a5) : $signed(_GEN_12); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_14 = 5'he == idx_r[4:0] ? $signed(14'sh31f) : $signed(_GEN_13); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_15 = 5'hf == idx_r[4:0] ? $signed(14'sh191) : $signed(_GEN_14); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_16 = 5'h10 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_15); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_17 = 5'h11 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_16); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_18 = 5'h12 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_17); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_19 = 5'h13 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_18); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_20 = 5'h14 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_19); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_21 = 5'h15 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_20); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_22 = 5'h16 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_21); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_23 = 5'h17 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_22); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_24 = 5'h18 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_23); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_25 = 5'h19 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_24); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_26 = 5'h1a == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_25); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_27 = 5'h1b == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_26); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_28 = 5'h1c == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_27); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_29 = 5'h1d == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_28); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_30 = 5'h1e == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_29); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _GEN_31 = 5'h1f == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_30); // @[FFTTwiddle.scala 51:{35,35}]
  wire [13:0] _io_wR_T_2 = 14'sh0 - $signed(_GEN_31); // @[FFTTwiddle.scala 51:35]
  wire [13:0] _GEN_33 = 5'h1 == idx_r[4:0] ? $signed(14'sh191) : $signed(14'sh0); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_34 = 5'h2 == idx_r[4:0] ? $signed(14'sh31f) : $signed(_GEN_33); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_35 = 5'h3 == idx_r[4:0] ? $signed(14'sh4a5) : $signed(_GEN_34); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_36 = 5'h4 == idx_r[4:0] ? $signed(14'sh61f) : $signed(_GEN_35); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_37 = 5'h5 == idx_r[4:0] ? $signed(14'sh78b) : $signed(_GEN_36); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_38 = 5'h6 == idx_r[4:0] ? $signed(14'sh8e4) : $signed(_GEN_37); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_39 = 5'h7 == idx_r[4:0] ? $signed(14'sha26) : $signed(_GEN_38); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_40 = 5'h8 == idx_r[4:0] ? $signed(14'shb50) : $signed(_GEN_39); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_41 = 5'h9 == idx_r[4:0] ? $signed(14'shc5e) : $signed(_GEN_40); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_42 = 5'ha == idx_r[4:0] ? $signed(14'shd4e) : $signed(_GEN_41); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_43 = 5'hb == idx_r[4:0] ? $signed(14'she1c) : $signed(_GEN_42); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_44 = 5'hc == idx_r[4:0] ? $signed(14'shec8) : $signed(_GEN_43); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_45 = 5'hd == idx_r[4:0] ? $signed(14'shf50) : $signed(_GEN_44); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_46 = 5'he == idx_r[4:0] ? $signed(14'shfb1) : $signed(_GEN_45); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_47 = 5'hf == idx_r[4:0] ? $signed(14'shfec) : $signed(_GEN_46); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_48 = 5'h10 == idx_r[4:0] ? $signed(14'sh1000) : $signed(_GEN_47); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_49 = 5'h11 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_48); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_50 = 5'h12 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_49); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_51 = 5'h13 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_50); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_52 = 5'h14 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_51); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_53 = 5'h15 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_52); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_54 = 5'h16 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_53); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_55 = 5'h17 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_54); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_56 = 5'h18 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_55); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_57 = 5'h19 == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_56); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_58 = 5'h1a == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_57); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_59 = 5'h1b == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_58); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_60 = 5'h1c == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_59); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_61 = 5'h1d == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_60); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_62 = 5'h1e == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_61); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _GEN_63 = 5'h1f == idx_r[4:0] ? $signed(14'sh0) : $signed(_GEN_62); // @[FFTTwiddle.scala 52:{35,35}]
  wire [13:0] _io_wI_T_2 = 14'sh0 - $signed(_GEN_63); // @[FFTTwiddle.scala 52:35]
  assign io_wR = chg_sign_flag_r ? $signed(_io_wR_T_2) : $signed(_GEN_31); // @[FFTTwiddle.scala 51:17]
  assign io_wI = chg_sign_flag_i ? $signed(_io_wI_T_2) : $signed(_GEN_63); // @[FFTTwiddle.scala 52:17]
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
  input  [3:0]  io_radixCount,
  input  [1:0]  io_calcMode,
  input         io_phaseCount,
  input         io_rShiftSym,
  input         io_isFFT,
  input         io_procMode,
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
  wire [5:0] twiddleUnits_0_io_nk; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_0_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_0_io_wR; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_0_io_wI; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_1_io_nk; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_1_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_1_io_wR; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_1_io_wI; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_2_io_nk; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_2_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_2_io_wR; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_2_io_wI; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_3_io_nk; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_3_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_3_io_wR; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_3_io_wI; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_4_io_nk; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_4_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_4_io_wR; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_4_io_wI; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_5_io_nk; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_5_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_5_io_wR; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_5_io_wI; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_6_io_nk; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_6_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_6_io_wR; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_6_io_wI; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_7_io_nk; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [5:0] twiddleUnits_7_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_7_io_wR; // @[FFT3PipelineR23Calc.scala 41:42]
  wire [13:0] twiddleUnits_7_io_wI; // @[FFT3PipelineR23Calc.scala 41:42]
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
  wire [1:0] twiLutCaseIdx1c = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  wire [1:0] twiLutIdxPre = ~io_phaseCount ? io_radixCount[1:0] : 2'h0; // @[Mux.scala 81:58]
  wire [4:0] _twiddleUnits_0_io_nk_T = 3'h1 * twiLutIdxPre; // @[FFT3PipelineR23Calc.scala 78:54]
  wire [2:0] _twiddleUnits_0_io_nk_T_1 = io_phaseCount * 2'h3; // @[FFT3PipelineR23Calc.scala 78:88]
  wire [11:0] _GEN_25 = {{7'd0}, _twiddleUnits_0_io_nk_T}; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [11:0] _twiddleUnits_0_io_nk_T_2 = _GEN_25 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [12:0] _twiddleUnits_0_io_nk_T_3 = {_twiddleUnits_0_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _twiddleUnits_1_io_nk_T = 3'h2 * twiLutIdxPre; // @[FFT3PipelineR23Calc.scala 78:54]
  wire [11:0] _GEN_26 = {{7'd0}, _twiddleUnits_1_io_nk_T}; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [11:0] _twiddleUnits_1_io_nk_T_2 = _GEN_26 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [12:0] _twiddleUnits_1_io_nk_T_3 = {_twiddleUnits_1_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _twiddleUnits_2_io_nk_T = 3'h3 * twiLutIdxPre; // @[FFT3PipelineR23Calc.scala 78:54]
  wire [11:0] _GEN_34 = {{7'd0}, _twiddleUnits_2_io_nk_T}; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [11:0] _twiddleUnits_2_io_nk_T_2 = _GEN_34 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [12:0] _twiddleUnits_2_io_nk_T_3 = {_twiddleUnits_2_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _twiddleUnits_3_io_nk_T = 3'h4 * twiLutIdxPre; // @[FFT3PipelineR23Calc.scala 78:54]
  wire [11:0] _GEN_35 = {{7'd0}, _twiddleUnits_3_io_nk_T}; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [11:0] _twiddleUnits_3_io_nk_T_2 = _GEN_35 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [12:0] _twiddleUnits_3_io_nk_T_3 = {_twiddleUnits_3_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _twiddleUnits_4_io_nk_T = 3'h5 * twiLutIdxPre; // @[FFT3PipelineR23Calc.scala 78:54]
  wire [11:0] _GEN_68 = {{7'd0}, _twiddleUnits_4_io_nk_T}; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [11:0] _twiddleUnits_4_io_nk_T_2 = _GEN_68 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [12:0] _twiddleUnits_4_io_nk_T_3 = {_twiddleUnits_4_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _twiddleUnits_5_io_nk_T = 3'h6 * twiLutIdxPre; // @[FFT3PipelineR23Calc.scala 78:54]
  wire [11:0] _GEN_69 = {{7'd0}, _twiddleUnits_5_io_nk_T}; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [11:0] _twiddleUnits_5_io_nk_T_2 = _GEN_69 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [12:0] _twiddleUnits_5_io_nk_T_3 = {_twiddleUnits_5_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _twiddleUnits_6_io_nk_T = 3'h7 * twiLutIdxPre; // @[FFT3PipelineR23Calc.scala 78:54]
  wire [11:0] _GEN_70 = {{7'd0}, _twiddleUnits_6_io_nk_T}; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [11:0] _twiddleUnits_6_io_nk_T_2 = _GEN_70 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 78:70]
  wire [12:0] _twiddleUnits_6_io_nk_T_3 = {_twiddleUnits_6_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _twiddleUnits_7_io_nk_T_2 = io_procMode ? {{1'd0}, io_radixCount} : 5'h8; // @[FFT3PipelineR23Calc.scala 84:33]
  wire [13:0] wI1c_8 = 14'sh0 - $signed(twiddleUnits_7_io_wR); // @[FFT3PipelineR23Calc.scala 90:16]
  reg [13:0] wR2c_0_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_0 = twiddleUnits_0_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 80:17]
  reg [13:0] wR2c_1_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_1 = twiddleUnits_1_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 80:17]
  reg [13:0] wR2c_2_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_2 = twiddleUnits_2_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 80:17]
  reg [13:0] wR2c_3_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_3 = twiddleUnits_3_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 80:17]
  reg [13:0] wR2c_4_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_4 = twiddleUnits_4_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 80:17]
  reg [13:0] wR2c_5_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_5 = twiddleUnits_5_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 80:17]
  reg [13:0] wR2c_6_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_6 = twiddleUnits_6_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 80:17]
  reg [13:0] wR2c_7_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_7 = twiddleUnits_7_io_wR; // @[FFT3PipelineR23Calc.scala 55:20 86:13]
  reg [13:0] wR2c_8_r; // @[Reg.scala 35:20]
  wire [13:0] wR1c_8 = twiddleUnits_7_io_wI; // @[FFT3PipelineR23Calc.scala 55:20 89:13]
  reg [13:0] wI2c_0_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_0 = twiddleUnits_0_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 81:17]
  reg [13:0] wI2c_1_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_1 = twiddleUnits_1_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 81:17]
  reg [13:0] wI2c_2_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_2 = twiddleUnits_2_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 81:17]
  reg [13:0] wI2c_3_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_3 = twiddleUnits_3_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 81:17]
  reg [13:0] wI2c_4_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_4 = twiddleUnits_4_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 81:17]
  reg [13:0] wI2c_5_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_5 = twiddleUnits_5_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 81:17]
  reg [13:0] wI2c_6_r; // @[Reg.scala 35:20]
  wire [13:0] wI1c_6 = twiddleUnits_6_io_wI; // @[FFT3PipelineR23Calc.scala 56:20 81:17]
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
  wire [15:0] data3cPrePre_5_im = $signed(data2c_5_im_r) + $signed(data2c_7_im_r); // @[FFT3PipelineR23Calc.scala 147:44]
  reg [15:0] data2c_1_re_r; // @[Reg.scala 35:20]
  reg [15:0] data2c_5_re_r; // @[Reg.scala 35:20]
  reg [15:0] data2c_7_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_5_re = $signed(data2c_5_re_r) + $signed(data2c_7_re_r); // @[FFT3PipelineR23Calc.scala 146:44]
  reg [15:0] data2c_0_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_0_re = $signed(dataIn1c_0_re) + $signed(dataIn1c_4_re); // @[FFT3PipelineR23Calc.scala 138:46]
  wire  _T_3 = io_calcMode == 2'h1; // @[FFT3PipelineR23Calc.scala 212:29]
  reg [15:0] data2c_0_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_0_im = $signed(dataIn1c_0_im) + $signed(dataIn1c_4_im); // @[FFT3PipelineR23Calc.scala 139:46]
  wire [15:0] data2cPrePre_1_re = $signed(dataIn1c_1_re) + $signed(dataIn1c_5_re); // @[FFT3PipelineR23Calc.scala 138:46]
  wire [15:0] data2cPrePre_1_im = $signed(dataIn1c_1_im) + $signed(dataIn1c_5_im); // @[FFT3PipelineR23Calc.scala 139:46]
  reg [15:0] data2c_2_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_2_re = $signed(dataIn1c_2_re) + $signed(dataIn1c_6_re); // @[FFT3PipelineR23Calc.scala 138:46]
  reg [15:0] data2c_2_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_2_im = $signed(dataIn1c_2_im) + $signed(dataIn1c_6_im); // @[FFT3PipelineR23Calc.scala 139:46]
  reg [15:0] data2c_3_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_3_re = $signed(dataIn1c_3_re) + $signed(dataIn1c_7_re); // @[FFT3PipelineR23Calc.scala 138:46]
  reg [15:0] data2c_3_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_3_im = $signed(dataIn1c_3_im) + $signed(dataIn1c_7_im); // @[FFT3PipelineR23Calc.scala 139:46]
  reg [15:0] data2c_4_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_4_re = $signed(dataIn1c_0_re) - $signed(dataIn1c_4_re); // @[FFT3PipelineR23Calc.scala 140:50]
  reg [15:0] data2c_4_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_4_im = $signed(dataIn1c_0_im) - $signed(dataIn1c_4_im); // @[FFT3PipelineR23Calc.scala 141:50]
  wire [15:0] data2cPrePre_5_re = $signed(dataIn1c_1_re) - $signed(dataIn1c_5_re); // @[FFT3PipelineR23Calc.scala 140:50]
  wire [15:0] data2cPrePre_5_im = $signed(dataIn1c_1_im) - $signed(dataIn1c_5_im); // @[FFT3PipelineR23Calc.scala 141:50]
  reg [15:0] data2c_6_re_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_6_im = $signed(dataIn1c_2_im) - $signed(dataIn1c_6_im); // @[FFT3PipelineR23Calc.scala 141:50]
  reg [15:0] data2c_6_im_r; // @[Reg.scala 35:20]
  wire [15:0] data2cPrePre_6_re = $signed(dataIn1c_2_re) - $signed(dataIn1c_6_re); // @[FFT3PipelineR23Calc.scala 140:50]
  wire [15:0] _data2cPre_6_im_T_2 = 16'sh0 - $signed(data2cPrePre_6_re); // @[FFT3PipelineR23Calc.scala 167:28]
  wire [15:0] data2cPrePre_7_im = $signed(dataIn1c_3_im) - $signed(dataIn1c_7_im); // @[FFT3PipelineR23Calc.scala 141:50]
  wire [15:0] data2cPrePre_7_re = $signed(dataIn1c_3_re) - $signed(dataIn1c_7_re); // @[FFT3PipelineR23Calc.scala 140:50]
  wire [15:0] _data2cPre_7_im_T_2 = 16'sh0 - $signed(data2cPrePre_7_re); // @[FFT3PipelineR23Calc.scala 170:28]
  reg [15:0] data3c_0_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_0_re = $signed(data2c_0_re_r) + $signed(data2c_2_re_r); // @[FFT3PipelineR23Calc.scala 146:44]
  wire [15:0] _GEN_133 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_0_re) : $signed(data2c_0_re_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_0_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_0_im = $signed(data2c_0_im_r) + $signed(data2c_2_im_r); // @[FFT3PipelineR23Calc.scala 147:44]
  wire [15:0] _GEN_132 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_0_im) : $signed(data2c_0_im_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_1_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_1_re = $signed(data2c_1_re_r) + $signed(data2c_3_re_r); // @[FFT3PipelineR23Calc.scala 146:44]
  wire [15:0] _GEN_99 = _T_3 & io_procMode ? $signed(multiplyUnits_7_io_product_re) : $signed(data2c_1_re_r); // @[FFT3PipelineR23Calc.scala 229:53 242:22 261:25]
  wire [15:0] _GEN_135 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_1_re) : $signed(_GEN_99); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_1_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_1_im = $signed(data2c_1_im_r) + $signed(data2c_3_im_r); // @[FFT3PipelineR23Calc.scala 147:44]
  wire [15:0] _data3cPre_1_im_T_2 = 16'sh0 - $signed(data2c_1_im_r); // @[FFT3PipelineR23Calc.scala 262:28]
  wire [15:0] _GEN_98 = _T_3 & io_procMode ? $signed(multiplyUnits_7_io_product_im) : $signed(_data3cPre_1_im_T_2); // @[FFT3PipelineR23Calc.scala 229:53 242:22 262:25]
  wire [15:0] _GEN_134 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_1_im) : $signed(_GEN_98); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_2_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_2_re = $signed(data2c_0_re_r) - $signed(data2c_2_re_r); // @[FFT3PipelineR23Calc.scala 148:48]
  wire [15:0] _GEN_137 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_2_re) : $signed(data2c_2_re_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_2_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_2_im = $signed(data2c_0_im_r) - $signed(data2c_2_im_r); // @[FFT3PipelineR23Calc.scala 149:48]
  wire [15:0] _GEN_136 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_2_im) : $signed(data2c_2_im_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_3_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_3_im = $signed(data2c_1_im_r) - $signed(data2c_3_im_r); // @[FFT3PipelineR23Calc.scala 149:48]
  wire [15:0] data3cPrePre_3_re = $signed(data2c_1_re_r) - $signed(data2c_3_re_r); // @[FFT3PipelineR23Calc.scala 148:48]
  wire [15:0] _GEN_139 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_3_re) : $signed(data2c_3_re_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_3_im_r; // @[Reg.scala 35:20]
  wire [15:0] _data3cPre_3_im_T_2 = 16'sh0 - $signed(data3cPrePre_3_re); // @[FFT3PipelineR23Calc.scala 178:28]
  wire [15:0] _GEN_138 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_3_im) : $signed(data2c_3_im_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_4_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_4_re = $signed(data2c_4_re_r) + $signed(data2c_6_re_r); // @[FFT3PipelineR23Calc.scala 146:44]
  wire [15:0] _GEN_141 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_4_re) : $signed(data2c_4_re_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_4_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_4_im = $signed(data2c_4_im_r) + $signed(data2c_6_im_r); // @[FFT3PipelineR23Calc.scala 147:44]
  wire [15:0] _GEN_140 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_4_im) : $signed(data2c_4_im_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_5_re_r; // @[Reg.scala 35:20]
  wire [15:0] _GEN_143 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_5_re) : $signed(data2c_5_re_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_5_im_r; // @[Reg.scala 35:20]
  wire [15:0] _GEN_142 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_5_im) : $signed(data2c_5_im_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_6_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_6_re = $signed(data2c_4_re_r) - $signed(data2c_6_re_r); // @[FFT3PipelineR23Calc.scala 148:48]
  wire [15:0] _GEN_145 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_6_re) : $signed(data2c_6_re_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_6_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_6_im = $signed(data2c_4_im_r) - $signed(data2c_6_im_r); // @[FFT3PipelineR23Calc.scala 149:48]
  wire [15:0] _GEN_144 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_6_im) : $signed(data2c_6_im_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_7_re_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_7_im = $signed(data2c_5_im_r) - $signed(data2c_7_im_r); // @[FFT3PipelineR23Calc.scala 149:48]
  wire [15:0] data3cPrePre_7_re = $signed(data2c_5_re_r) - $signed(data2c_7_re_r); // @[FFT3PipelineR23Calc.scala 148:48]
  wire [15:0] _GEN_147 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_7_re) : $signed(data2c_7_re_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  reg [15:0] data3c_7_im_r; // @[Reg.scala 35:20]
  wire [15:0] _data3cPre_7_im_T_2 = 16'sh0 - $signed(data3cPrePre_7_re); // @[FFT3PipelineR23Calc.scala 206:28]
  wire [15:0] _GEN_146 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data3cPrePre_7_im) : $signed(data2c_7_im_r); // @[FFT3PipelineR23Calc.scala 212:54 222:26]
  wire [15:0] dataOut3cPrePre_1_re = $signed(data3c_0_re_r) - $signed(data3c_1_re_r); // @[FFT3PipelineR23Calc.scala 156:51]
  wire [15:0] dataOut3cPrePre_1_im = $signed(data3c_0_im_r) - $signed(data3c_1_im_r); // @[FFT3PipelineR23Calc.scala 157:51]
  wire [15:0] dataOut3cPrePre_2_re = $signed(data3c_2_re_r) + $signed(data3c_3_re_r); // @[FFT3PipelineR23Calc.scala 154:47]
  wire [15:0] dataOut3cPrePre_2_im = $signed(data3c_2_im_r) + $signed(data3c_3_im_r); // @[FFT3PipelineR23Calc.scala 155:47]
  wire [15:0] dataOut3cPrePre_3_re = $signed(data3c_2_re_r) - $signed(data3c_3_re_r); // @[FFT3PipelineR23Calc.scala 156:51]
  wire [15:0] dataOut3cPrePre_3_im = $signed(data3c_2_im_r) - $signed(data3c_3_im_r); // @[FFT3PipelineR23Calc.scala 157:51]
  wire [15:0] dataOut3cPrePre_4_re = $signed(data3c_4_re_r) + $signed(data3c_5_re_r); // @[FFT3PipelineR23Calc.scala 154:47]
  wire [15:0] dataOut3cPrePre_4_im = $signed(data3c_4_im_r) + $signed(data3c_5_im_r); // @[FFT3PipelineR23Calc.scala 155:47]
  wire [15:0] dataOut3cPrePre_5_re = $signed(data3c_4_re_r) - $signed(data3c_5_re_r); // @[FFT3PipelineR23Calc.scala 156:51]
  wire [15:0] dataOut3cPrePre_5_im = $signed(data3c_4_im_r) - $signed(data3c_5_im_r); // @[FFT3PipelineR23Calc.scala 157:51]
  wire [15:0] dataOut3cPrePre_6_re = $signed(data3c_6_re_r) + $signed(data3c_7_re_r); // @[FFT3PipelineR23Calc.scala 154:47]
  wire [15:0] dataOut3cPrePre_6_im = $signed(data3c_6_im_r) + $signed(data3c_7_im_r); // @[FFT3PipelineR23Calc.scala 155:47]
  wire [15:0] dataOut3cPrePre_7_re = $signed(data3c_6_re_r) - $signed(data3c_7_re_r); // @[FFT3PipelineR23Calc.scala 156:51]
  wire [15:0] dataOut3cPrePre_7_im = $signed(data3c_6_im_r) - $signed(data3c_7_im_r); // @[FFT3PipelineR23Calc.scala 157:51]
  wire [15:0] _dataOut3cPre_1_T_im = io_phaseCount ? $signed(dataOut3cPrePre_1_im) : $signed(
    multiplyUnits_0_io_product_im); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_1_T_re = io_phaseCount ? $signed(dataOut3cPrePre_1_re) : $signed(
    multiplyUnits_0_io_product_re); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_2_T_im = io_phaseCount ? $signed(dataOut3cPrePre_2_im) : $signed(
    multiplyUnits_1_io_product_im); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_2_T_re = io_phaseCount ? $signed(dataOut3cPrePre_2_re) : $signed(
    multiplyUnits_1_io_product_re); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_3_T_im = io_phaseCount ? $signed(dataOut3cPrePre_3_im) : $signed(
    multiplyUnits_2_io_product_im); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_3_T_re = io_phaseCount ? $signed(dataOut3cPrePre_3_re) : $signed(
    multiplyUnits_2_io_product_re); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_4_T_im = io_phaseCount ? $signed(dataOut3cPrePre_4_im) : $signed(
    multiplyUnits_3_io_product_im); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_4_T_re = io_phaseCount ? $signed(dataOut3cPrePre_4_re) : $signed(
    multiplyUnits_3_io_product_re); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_5_T_im = io_phaseCount ? $signed(dataOut3cPrePre_5_im) : $signed(
    multiplyUnits_4_io_product_im); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_5_T_re = io_phaseCount ? $signed(dataOut3cPrePre_5_re) : $signed(
    multiplyUnits_4_io_product_re); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_6_T_im = io_phaseCount ? $signed(dataOut3cPrePre_6_im) : $signed(
    multiplyUnits_5_io_product_im); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_6_T_re = io_phaseCount ? $signed(dataOut3cPrePre_6_re) : $signed(
    multiplyUnits_5_io_product_re); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_7_T_im = io_phaseCount ? $signed(dataOut3cPrePre_7_im) : $signed(
    multiplyUnits_6_io_product_im); // @[FFT3PipelineR23Calc.scala 188:35]
  wire [15:0] _dataOut3cPre_7_T_re = io_phaseCount ? $signed(dataOut3cPrePre_7_re) : $signed(
    multiplyUnits_6_io_product_re); // @[FFT3PipelineR23Calc.scala 188:35]
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
  FFTTwiddle twiddleUnits_0 ( // @[FFT3PipelineR23Calc.scala 41:42]
    .io_nk(twiddleUnits_0_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_0_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_0_io_wR),
    .io_wI(twiddleUnits_0_io_wI)
  );
  FFTTwiddle twiddleUnits_1 ( // @[FFT3PipelineR23Calc.scala 41:42]
    .io_nk(twiddleUnits_1_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_1_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_1_io_wR),
    .io_wI(twiddleUnits_1_io_wI)
  );
  FFTTwiddle twiddleUnits_2 ( // @[FFT3PipelineR23Calc.scala 41:42]
    .io_nk(twiddleUnits_2_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_2_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_2_io_wR),
    .io_wI(twiddleUnits_2_io_wI)
  );
  FFTTwiddle twiddleUnits_3 ( // @[FFT3PipelineR23Calc.scala 41:42]
    .io_nk(twiddleUnits_3_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_3_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_3_io_wR),
    .io_wI(twiddleUnits_3_io_wI)
  );
  FFTTwiddle twiddleUnits_4 ( // @[FFT3PipelineR23Calc.scala 41:42]
    .io_nk(twiddleUnits_4_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_4_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_4_io_wR),
    .io_wI(twiddleUnits_4_io_wI)
  );
  FFTTwiddle twiddleUnits_5 ( // @[FFT3PipelineR23Calc.scala 41:42]
    .io_nk(twiddleUnits_5_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_5_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_5_io_wR),
    .io_wI(twiddleUnits_5_io_wI)
  );
  FFTTwiddle twiddleUnits_6 ( // @[FFT3PipelineR23Calc.scala 41:42]
    .io_nk(twiddleUnits_6_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_6_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_6_io_wR),
    .io_wI(twiddleUnits_6_io_wI)
  );
  FFTTwiddle twiddleUnits_7 ( // @[FFT3PipelineR23Calc.scala 41:42]
    .io_nk(twiddleUnits_7_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_7_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_7_io_wR),
    .io_wI(twiddleUnits_7_io_wI)
  );
  assign io_dataOut3c_0_im = $signed(data3c_0_im_r) + $signed(data3c_1_im_r); // @[FFT3PipelineR23Calc.scala 155:47]
  assign io_dataOut3c_0_re = $signed(data3c_0_re_r) + $signed(data3c_1_re_r); // @[FFT3PipelineR23Calc.scala 154:47]
  assign io_dataOut3c_1_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_1_T_im) : $signed(dataOut3cPrePre_1_im); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_1_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_1_T_re) : $signed(dataOut3cPrePre_1_re); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_2_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_2_T_im) : $signed(dataOut3cPrePre_2_im); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_2_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_2_T_re) : $signed(dataOut3cPrePre_2_re); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_3_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_3_T_im) : $signed(dataOut3cPrePre_3_im); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_3_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_3_T_re) : $signed(dataOut3cPrePre_3_re); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_4_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_4_T_im) : $signed(dataOut3cPrePre_4_im); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_4_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_4_T_re) : $signed(dataOut3cPrePre_4_re); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_5_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_5_T_im) : $signed(dataOut3cPrePre_5_im); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_5_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_5_T_re) : $signed(dataOut3cPrePre_5_re); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_6_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_6_T_im) : $signed(dataOut3cPrePre_6_im); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_6_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_6_T_re) : $signed(dataOut3cPrePre_6_re); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_7_im = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_7_T_im) : $signed(dataOut3cPrePre_7_im); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign io_dataOut3c_7_re = io_calcMode == 2'h3 ? $signed(_dataOut3cPre_7_T_re) : $signed(dataOut3cPrePre_7_re); // @[FFT3PipelineR23Calc.scala 160:31 188:29]
  assign multiplyUnits_0_io_data_im = $signed(data3c_0_im_r) - $signed(data3c_1_im_r); // @[FFT3PipelineR23Calc.scala 157:51]
  assign multiplyUnits_0_io_data_re = $signed(data3c_0_re_r) - $signed(data3c_1_re_r); // @[FFT3PipelineR23Calc.scala 156:51]
  assign multiplyUnits_0_io_wR = wR3c_3_r; // @[FFT3PipelineR23Calc.scala 101:12 59:20]
  assign multiplyUnits_0_io_wI = wI3c_3_r; // @[FFT3PipelineR23Calc.scala 105:12 60:20]
  assign multiplyUnits_1_io_data_im = $signed(data3c_2_im_r) + $signed(data3c_3_im_r); // @[FFT3PipelineR23Calc.scala 155:47]
  assign multiplyUnits_1_io_data_re = $signed(data3c_2_re_r) + $signed(data3c_3_re_r); // @[FFT3PipelineR23Calc.scala 154:47]
  assign multiplyUnits_1_io_wR = wR3c_1_r; // @[FFT3PipelineR23Calc.scala 101:12 59:20]
  assign multiplyUnits_1_io_wI = wI3c_1_r; // @[FFT3PipelineR23Calc.scala 105:12 60:20]
  assign multiplyUnits_2_io_data_im = $signed(data3c_2_im_r) - $signed(data3c_3_im_r); // @[FFT3PipelineR23Calc.scala 157:51]
  assign multiplyUnits_2_io_data_re = $signed(data3c_2_re_r) - $signed(data3c_3_re_r); // @[FFT3PipelineR23Calc.scala 156:51]
  assign multiplyUnits_2_io_wR = wR3c_5_r; // @[FFT3PipelineR23Calc.scala 101:12 59:20]
  assign multiplyUnits_2_io_wI = wI3c_5_r; // @[FFT3PipelineR23Calc.scala 105:12 60:20]
  assign multiplyUnits_3_io_data_im = $signed(data3c_4_im_r) + $signed(data3c_5_im_r); // @[FFT3PipelineR23Calc.scala 155:47]
  assign multiplyUnits_3_io_data_re = $signed(data3c_4_re_r) + $signed(data3c_5_re_r); // @[FFT3PipelineR23Calc.scala 154:47]
  assign multiplyUnits_3_io_wR = wR3c_0_r; // @[FFT3PipelineR23Calc.scala 101:12 59:20]
  assign multiplyUnits_3_io_wI = wI3c_0_r; // @[FFT3PipelineR23Calc.scala 105:12 60:20]
  assign multiplyUnits_4_io_data_im = $signed(data3c_4_im_r) - $signed(data3c_5_im_r); // @[FFT3PipelineR23Calc.scala 157:51]
  assign multiplyUnits_4_io_data_re = $signed(data3c_4_re_r) - $signed(data3c_5_re_r); // @[FFT3PipelineR23Calc.scala 156:51]
  assign multiplyUnits_4_io_wR = wR3c_4_r; // @[FFT3PipelineR23Calc.scala 101:12 59:20]
  assign multiplyUnits_4_io_wI = wI3c_4_r; // @[FFT3PipelineR23Calc.scala 105:12 60:20]
  assign multiplyUnits_5_io_data_im = $signed(data3c_6_im_r) + $signed(data3c_7_im_r); // @[FFT3PipelineR23Calc.scala 155:47]
  assign multiplyUnits_5_io_data_re = $signed(data3c_6_re_r) + $signed(data3c_7_re_r); // @[FFT3PipelineR23Calc.scala 154:47]
  assign multiplyUnits_5_io_wR = wR3c_2_r; // @[FFT3PipelineR23Calc.scala 101:12 59:20]
  assign multiplyUnits_5_io_wI = wI3c_2_r; // @[FFT3PipelineR23Calc.scala 105:12 60:20]
  assign multiplyUnits_6_io_data_im = $signed(data3c_6_im_r) - $signed(data3c_7_im_r); // @[FFT3PipelineR23Calc.scala 157:51]
  assign multiplyUnits_6_io_data_re = $signed(data3c_6_re_r) - $signed(data3c_7_re_r); // @[FFT3PipelineR23Calc.scala 156:51]
  assign multiplyUnits_6_io_wR = wR3c_6_r; // @[FFT3PipelineR23Calc.scala 101:12 59:20]
  assign multiplyUnits_6_io_wI = wI3c_6_r; // @[FFT3PipelineR23Calc.scala 105:12 60:20]
  assign multiplyUnits_7_io_data_im = io_procMode ? $signed(data2c_1_im_r) : $signed(data3cPrePre_5_im); // @[FFT3PipelineR23Calc.scala 114:36]
  assign multiplyUnits_7_io_data_re = io_procMode ? $signed(data2c_1_re_r) : $signed(data3cPrePre_5_re); // @[FFT3PipelineR23Calc.scala 114:36]
  assign multiplyUnits_7_io_wR = wR2c_7_r; // @[FFT3PipelineR23Calc.scala 57:20 93:12]
  assign multiplyUnits_7_io_wI = wI2c_7_r; // @[FFT3PipelineR23Calc.scala 58:20 97:12]
  assign multiplyUnits_8_io_data_im = $signed(data2c_5_im_r) - $signed(data2c_7_im_r); // @[FFT3PipelineR23Calc.scala 149:48]
  assign multiplyUnits_8_io_data_re = $signed(data2c_5_re_r) - $signed(data2c_7_re_r); // @[FFT3PipelineR23Calc.scala 148:48]
  assign multiplyUnits_8_io_wR = wR2c_8_r; // @[FFT3PipelineR23Calc.scala 57:20 93:12]
  assign multiplyUnits_8_io_wI = wI2c_8_r; // @[FFT3PipelineR23Calc.scala 58:20 97:12]
  assign twiddleUnits_0_io_nk = _twiddleUnits_0_io_nk_T_3[5:0]; // @[FFT3PipelineR23Calc.scala 78:105]
  assign twiddleUnits_0_io_twiLutCaseIndex = {{4'd0}, twiLutCaseIdx1c}; // @[FFT3PipelineR23Calc.scala 79:44]
  assign twiddleUnits_1_io_nk = _twiddleUnits_1_io_nk_T_3[5:0]; // @[FFT3PipelineR23Calc.scala 78:105]
  assign twiddleUnits_1_io_twiLutCaseIndex = {{4'd0}, twiLutCaseIdx1c}; // @[FFT3PipelineR23Calc.scala 79:44]
  assign twiddleUnits_2_io_nk = _twiddleUnits_2_io_nk_T_3[5:0]; // @[FFT3PipelineR23Calc.scala 78:105]
  assign twiddleUnits_2_io_twiLutCaseIndex = {{4'd0}, twiLutCaseIdx1c}; // @[FFT3PipelineR23Calc.scala 79:44]
  assign twiddleUnits_3_io_nk = _twiddleUnits_3_io_nk_T_3[5:0]; // @[FFT3PipelineR23Calc.scala 78:105]
  assign twiddleUnits_3_io_twiLutCaseIndex = {{4'd0}, twiLutCaseIdx1c}; // @[FFT3PipelineR23Calc.scala 79:44]
  assign twiddleUnits_4_io_nk = _twiddleUnits_4_io_nk_T_3[5:0]; // @[FFT3PipelineR23Calc.scala 78:105]
  assign twiddleUnits_4_io_twiLutCaseIndex = {{4'd0}, twiLutCaseIdx1c}; // @[FFT3PipelineR23Calc.scala 79:44]
  assign twiddleUnits_5_io_nk = _twiddleUnits_5_io_nk_T_3[5:0]; // @[FFT3PipelineR23Calc.scala 78:105]
  assign twiddleUnits_5_io_twiLutCaseIndex = {{4'd0}, twiLutCaseIdx1c}; // @[FFT3PipelineR23Calc.scala 79:44]
  assign twiddleUnits_6_io_nk = _twiddleUnits_6_io_nk_T_3[5:0]; // @[FFT3PipelineR23Calc.scala 78:105]
  assign twiddleUnits_6_io_twiLutCaseIndex = {{4'd0}, twiLutCaseIdx1c}; // @[FFT3PipelineR23Calc.scala 79:44]
  assign twiddleUnits_7_io_nk = {{1'd0}, _twiddleUnits_7_io_nk_T_2}; // @[FFT3PipelineR23Calc.scala 84:27]
  assign twiddleUnits_7_io_twiLutCaseIndex = {{4'd0}, twiLutCaseIdx1c}; // @[FFT3PipelineR23Calc.scala 85:40]
  always @(posedge clock) begin
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
      wR2c_7_r <= wR1c_7; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c_8_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c_8_r <= wR1c_8; // @[Reg.scala 36:22]
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
      wI2c_7_r <= wR1c_8; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c_8_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c_8_r <= wI1c_8; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_0_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR3c_0_r <= wR2c_0_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_1_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR3c_1_r <= wR2c_1_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_2_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR3c_2_r <= wR2c_2_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_3_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR3c_3_r <= wR2c_3_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_4_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR3c_4_r <= wR2c_4_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_5_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR3c_5_r <= wR2c_5_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR3c_6_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR3c_6_r <= wR2c_6_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_0_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI3c_0_r <= wI2c_0_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_1_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI3c_1_r <= wI2c_1_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_2_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI3c_2_r <= wI2c_2_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_3_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI3c_3_r <= wI2c_3_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_4_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI3c_4_r <= wI2c_4_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_5_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI3c_5_r <= wI2c_5_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI3c_6_r <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI3c_6_r <= wI2c_6_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_1_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_1_im_r <= data2cPrePre_1_im; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_1_im_r <= dataInRnd_1_im;
      end else begin
        data2c_1_im_r <= io_dataIn_1_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_5_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_5_im_r <= data2cPrePre_5_im; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_5_im_r <= dataInRnd_5_im;
      end else begin
        data2c_5_im_r <= io_dataIn_5_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_7_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_7_im_r <= _data2cPre_7_im_T_2; // @[FFT3PipelineR23Calc.scala 170:25]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_7_im_r <= dataInRnd_7_im;
      end else begin
        data2c_7_im_r <= io_dataIn_7_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_1_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_1_re_r <= data2cPrePre_1_re; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_1_re_r <= dataInRnd_1_re;
      end else begin
        data2c_1_re_r <= io_dataIn_1_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_5_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_5_re_r <= data2cPrePre_5_re; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_5_re_r <= dataInRnd_5_re;
      end else begin
        data2c_5_re_r <= io_dataIn_5_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_7_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_7_re_r <= data2cPrePre_7_im; // @[FFT3PipelineR23Calc.scala 169:25]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_7_re_r <= dataInRnd_7_re;
      end else begin
        data2c_7_re_r <= io_dataIn_7_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_0_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_0_re_r <= data2cPrePre_0_re; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_0_re_r <= dataInRnd_0_re;
      end else begin
        data2c_0_re_r <= io_dataIn_0_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_0_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_0_im_r <= data2cPrePre_0_im; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_0_im_r <= dataInRnd_0_im;
      end else begin
        data2c_0_im_r <= io_dataIn_0_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_2_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_2_re_r <= data2cPrePre_2_re; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_2_re_r <= dataInRnd_2_re;
      end else begin
        data2c_2_re_r <= io_dataIn_2_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_2_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_2_im_r <= data2cPrePre_2_im; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_2_im_r <= dataInRnd_2_im;
      end else begin
        data2c_2_im_r <= io_dataIn_2_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_3_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_3_re_r <= data2cPrePre_3_re; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_3_re_r <= dataInRnd_3_re;
      end else begin
        data2c_3_re_r <= io_dataIn_3_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_3_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_3_im_r <= data2cPrePre_3_im; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_3_im_r <= dataInRnd_3_im;
      end else begin
        data2c_3_im_r <= io_dataIn_3_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_4_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_4_re_r <= data2cPrePre_4_re; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_4_re_r <= dataInRnd_4_re;
      end else begin
        data2c_4_re_r <= io_dataIn_4_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_4_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_4_im_r <= data2cPrePre_4_im; // @[FFT3PipelineR23Calc.scala 163:26]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_4_im_r <= dataInRnd_4_im;
      end else begin
        data2c_4_im_r <= io_dataIn_4_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_6_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_6_re_r <= data2cPrePre_6_im; // @[FFT3PipelineR23Calc.scala 166:25]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_6_re_r <= dataInRnd_6_re;
      end else begin
        data2c_6_re_r <= io_dataIn_6_re;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data2c_6_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data2c_6_im_r <= _data2cPre_6_im_T_2; // @[FFT3PipelineR23Calc.scala 167:25]
      end else if (io_rShiftSym) begin // @[FFT3PipelineR23Calc.scala 51:27]
        data2c_6_im_r <= dataInRnd_6_im;
      end else begin
        data2c_6_im_r <= io_dataIn_6_im;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_0_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_0_re_r <= data3cPrePre_0_re; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_0_re_r <= data3cPrePre_0_re; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_0_re_r <= _GEN_133;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_0_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_0_im_r <= data3cPrePre_0_im; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_0_im_r <= data3cPrePre_0_im; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_0_im_r <= _GEN_132;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_1_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_1_re_r <= data3cPrePre_1_re; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_1_re_r <= data3cPrePre_1_re; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_1_re_r <= _GEN_135;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_1_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_1_im_r <= data3cPrePre_1_im; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_1_im_r <= data3cPrePre_1_im; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_1_im_r <= _GEN_134;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_2_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_2_re_r <= data3cPrePre_2_re; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_2_re_r <= data3cPrePre_2_re; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_2_re_r <= _GEN_137;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_2_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_2_im_r <= data3cPrePre_2_im; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_2_im_r <= data3cPrePre_2_im; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_2_im_r <= _GEN_136;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_3_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_3_re_r <= data3cPrePre_3_im; // @[FFT3PipelineR23Calc.scala 177:25]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_3_re_r <= data3cPrePre_3_im; // @[FFT3PipelineR23Calc.scala 202:25]
      end else begin
        data3c_3_re_r <= _GEN_139;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_3_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_3_im_r <= _data3cPre_3_im_T_2; // @[FFT3PipelineR23Calc.scala 178:25]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_3_im_r <= _data3cPre_3_im_T_2; // @[FFT3PipelineR23Calc.scala 203:25]
      end else begin
        data3c_3_im_r <= _GEN_138;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_4_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_4_re_r <= data3cPrePre_4_re; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_4_re_r <= data3cPrePre_4_re; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_4_re_r <= _GEN_141;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_4_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_4_im_r <= data3cPrePre_4_im; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_4_im_r <= data3cPrePre_4_im; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_4_im_r <= _GEN_140;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_5_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_5_re_r <= multiplyUnits_7_io_product_re; // @[FFT3PipelineR23Calc.scala 180:22]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_5_re_r <= data3cPrePre_5_re; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_5_re_r <= _GEN_143;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_5_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_5_im_r <= multiplyUnits_7_io_product_im; // @[FFT3PipelineR23Calc.scala 180:22]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_5_im_r <= data3cPrePre_5_im; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_5_im_r <= _GEN_142;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_6_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_6_re_r <= data3cPrePre_6_re; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_6_re_r <= data3cPrePre_6_re; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_6_re_r <= _GEN_145;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_6_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_6_im_r <= data3cPrePre_6_im; // @[FFT3PipelineR23Calc.scala 174:26]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_6_im_r <= data3cPrePre_6_im; // @[FFT3PipelineR23Calc.scala 199:26]
      end else begin
        data3c_6_im_r <= _GEN_144;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_7_re_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_7_re_r <= multiplyUnits_8_io_product_re; // @[FFT3PipelineR23Calc.scala 182:22]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_7_re_r <= data3cPrePre_7_im; // @[FFT3PipelineR23Calc.scala 205:25]
      end else begin
        data3c_7_re_r <= _GEN_147;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      data3c_7_im_r <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_calcMode == 2'h3) begin // @[FFT3PipelineR23Calc.scala 160:31]
        data3c_7_im_r <= multiplyUnits_8_io_product_im; // @[FFT3PipelineR23Calc.scala 182:22]
      end else if (io_calcMode == 2'h2) begin // @[FFT3PipelineR23Calc.scala 190:38]
        data3c_7_im_r <= _data3cPre_7_im_T_2; // @[FFT3PipelineR23Calc.scala 206:25]
      end else begin
        data3c_7_im_r <= _GEN_146;
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
  wR2c_0_r = _RAND_0[13:0];
  _RAND_1 = {1{`RANDOM}};
  wR2c_1_r = _RAND_1[13:0];
  _RAND_2 = {1{`RANDOM}};
  wR2c_2_r = _RAND_2[13:0];
  _RAND_3 = {1{`RANDOM}};
  wR2c_3_r = _RAND_3[13:0];
  _RAND_4 = {1{`RANDOM}};
  wR2c_4_r = _RAND_4[13:0];
  _RAND_5 = {1{`RANDOM}};
  wR2c_5_r = _RAND_5[13:0];
  _RAND_6 = {1{`RANDOM}};
  wR2c_6_r = _RAND_6[13:0];
  _RAND_7 = {1{`RANDOM}};
  wR2c_7_r = _RAND_7[13:0];
  _RAND_8 = {1{`RANDOM}};
  wR2c_8_r = _RAND_8[13:0];
  _RAND_9 = {1{`RANDOM}};
  wI2c_0_r = _RAND_9[13:0];
  _RAND_10 = {1{`RANDOM}};
  wI2c_1_r = _RAND_10[13:0];
  _RAND_11 = {1{`RANDOM}};
  wI2c_2_r = _RAND_11[13:0];
  _RAND_12 = {1{`RANDOM}};
  wI2c_3_r = _RAND_12[13:0];
  _RAND_13 = {1{`RANDOM}};
  wI2c_4_r = _RAND_13[13:0];
  _RAND_14 = {1{`RANDOM}};
  wI2c_5_r = _RAND_14[13:0];
  _RAND_15 = {1{`RANDOM}};
  wI2c_6_r = _RAND_15[13:0];
  _RAND_16 = {1{`RANDOM}};
  wI2c_7_r = _RAND_16[13:0];
  _RAND_17 = {1{`RANDOM}};
  wI2c_8_r = _RAND_17[13:0];
  _RAND_18 = {1{`RANDOM}};
  wR3c_0_r = _RAND_18[13:0];
  _RAND_19 = {1{`RANDOM}};
  wR3c_1_r = _RAND_19[13:0];
  _RAND_20 = {1{`RANDOM}};
  wR3c_2_r = _RAND_20[13:0];
  _RAND_21 = {1{`RANDOM}};
  wR3c_3_r = _RAND_21[13:0];
  _RAND_22 = {1{`RANDOM}};
  wR3c_4_r = _RAND_22[13:0];
  _RAND_23 = {1{`RANDOM}};
  wR3c_5_r = _RAND_23[13:0];
  _RAND_24 = {1{`RANDOM}};
  wR3c_6_r = _RAND_24[13:0];
  _RAND_25 = {1{`RANDOM}};
  wI3c_0_r = _RAND_25[13:0];
  _RAND_26 = {1{`RANDOM}};
  wI3c_1_r = _RAND_26[13:0];
  _RAND_27 = {1{`RANDOM}};
  wI3c_2_r = _RAND_27[13:0];
  _RAND_28 = {1{`RANDOM}};
  wI3c_3_r = _RAND_28[13:0];
  _RAND_29 = {1{`RANDOM}};
  wI3c_4_r = _RAND_29[13:0];
  _RAND_30 = {1{`RANDOM}};
  wI3c_5_r = _RAND_30[13:0];
  _RAND_31 = {1{`RANDOM}};
  wI3c_6_r = _RAND_31[13:0];
  _RAND_32 = {1{`RANDOM}};
  data2c_1_im_r = _RAND_32[15:0];
  _RAND_33 = {1{`RANDOM}};
  data2c_5_im_r = _RAND_33[15:0];
  _RAND_34 = {1{`RANDOM}};
  data2c_7_im_r = _RAND_34[15:0];
  _RAND_35 = {1{`RANDOM}};
  data2c_1_re_r = _RAND_35[15:0];
  _RAND_36 = {1{`RANDOM}};
  data2c_5_re_r = _RAND_36[15:0];
  _RAND_37 = {1{`RANDOM}};
  data2c_7_re_r = _RAND_37[15:0];
  _RAND_38 = {1{`RANDOM}};
  data2c_0_re_r = _RAND_38[15:0];
  _RAND_39 = {1{`RANDOM}};
  data2c_0_im_r = _RAND_39[15:0];
  _RAND_40 = {1{`RANDOM}};
  data2c_2_re_r = _RAND_40[15:0];
  _RAND_41 = {1{`RANDOM}};
  data2c_2_im_r = _RAND_41[15:0];
  _RAND_42 = {1{`RANDOM}};
  data2c_3_re_r = _RAND_42[15:0];
  _RAND_43 = {1{`RANDOM}};
  data2c_3_im_r = _RAND_43[15:0];
  _RAND_44 = {1{`RANDOM}};
  data2c_4_re_r = _RAND_44[15:0];
  _RAND_45 = {1{`RANDOM}};
  data2c_4_im_r = _RAND_45[15:0];
  _RAND_46 = {1{`RANDOM}};
  data2c_6_re_r = _RAND_46[15:0];
  _RAND_47 = {1{`RANDOM}};
  data2c_6_im_r = _RAND_47[15:0];
  _RAND_48 = {1{`RANDOM}};
  data3c_0_re_r = _RAND_48[15:0];
  _RAND_49 = {1{`RANDOM}};
  data3c_0_im_r = _RAND_49[15:0];
  _RAND_50 = {1{`RANDOM}};
  data3c_1_re_r = _RAND_50[15:0];
  _RAND_51 = {1{`RANDOM}};
  data3c_1_im_r = _RAND_51[15:0];
  _RAND_52 = {1{`RANDOM}};
  data3c_2_re_r = _RAND_52[15:0];
  _RAND_53 = {1{`RANDOM}};
  data3c_2_im_r = _RAND_53[15:0];
  _RAND_54 = {1{`RANDOM}};
  data3c_3_re_r = _RAND_54[15:0];
  _RAND_55 = {1{`RANDOM}};
  data3c_3_im_r = _RAND_55[15:0];
  _RAND_56 = {1{`RANDOM}};
  data3c_4_re_r = _RAND_56[15:0];
  _RAND_57 = {1{`RANDOM}};
  data3c_4_im_r = _RAND_57[15:0];
  _RAND_58 = {1{`RANDOM}};
  data3c_5_re_r = _RAND_58[15:0];
  _RAND_59 = {1{`RANDOM}};
  data3c_5_im_r = _RAND_59[15:0];
  _RAND_60 = {1{`RANDOM}};
  data3c_6_re_r = _RAND_60[15:0];
  _RAND_61 = {1{`RANDOM}};
  data3c_6_im_r = _RAND_61[15:0];
  _RAND_62 = {1{`RANDOM}};
  data3c_7_re_r = _RAND_62[15:0];
  _RAND_63 = {1{`RANDOM}};
  data3c_7_im_r = _RAND_63[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
