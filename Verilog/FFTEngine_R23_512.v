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
  input  [9:0]  io_nk,
  input  [1:0]  io_twiLutCaseIndex,
  output [13:0] io_wR,
  output [13:0] io_wI
);
  wire [9:0] _idx_r_pre_T_1 = ~io_nk; // @[FFTTwiddle.scala 36:51]
  wire [9:0] _idx_r_pre_T_3 = _idx_r_pre_T_1 + 10'h1; // @[FFTTwiddle.scala 36:58]
  wire [9:0] _idx_r_pre_T_4 = io_nk[9] ? _idx_r_pre_T_3 : io_nk; // @[FFTTwiddle.scala 36:24]
  wire [8:0] idx_r_pre = _idx_r_pre_T_4[8:0]; // @[FFTTwiddle.scala 36:72]
  wire  _idx_r_T_3 = idx_r_pre[8] & |idx_r_pre[7:0]; // @[FFTTwiddle.scala 38:54]
  wire [8:0] _idx_r_T_4 = ~idx_r_pre; // @[FFTTwiddle.scala 38:98]
  wire [8:0] _idx_r_T_6 = _idx_r_T_4 + 9'h1; // @[FFTTwiddle.scala 38:109]
  wire [8:0] idx_r = idx_r_pre[8] & |idx_r_pre[7:0] ? _idx_r_T_6 : idx_r_pre; // @[FFTTwiddle.scala 38:20]
  wire  lut_chg_sign_flag_i = ~io_nk[9]; // @[FFTTwiddle.scala 46:31]
  wire  chg_sign_flag_r = io_twiLutCaseIndex == 2'h2 ? ~_idx_r_T_3 : _idx_r_T_3; // @[FFTTwiddle.scala 50:30]
  wire  chg_sign_flag_i = io_twiLutCaseIndex == 2'h1 ? ~lut_chg_sign_flag_i : lut_chg_sign_flag_i; // @[FFTTwiddle.scala 51:30]
  wire [13:0] _GEN_3 = 9'h3 == idx_r ? $signed(14'shfff) : $signed(14'sh1000); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_4 = 9'h4 == idx_r ? $signed(14'shfff) : $signed(_GEN_3); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_5 = 9'h5 == idx_r ? $signed(14'shffe) : $signed(_GEN_4); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_6 = 9'h6 == idx_r ? $signed(14'shffd) : $signed(_GEN_5); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_7 = 9'h7 == idx_r ? $signed(14'shffc) : $signed(_GEN_6); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_8 = 9'h8 == idx_r ? $signed(14'shffb) : $signed(_GEN_7); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_9 = 9'h9 == idx_r ? $signed(14'shffa) : $signed(_GEN_8); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_10 = 9'ha == idx_r ? $signed(14'shff8) : $signed(_GEN_9); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_11 = 9'hb == idx_r ? $signed(14'shff7) : $signed(_GEN_10); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_12 = 9'hc == idx_r ? $signed(14'shff5) : $signed(_GEN_11); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_13 = 9'hd == idx_r ? $signed(14'shff3) : $signed(_GEN_12); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_14 = 9'he == idx_r ? $signed(14'shff1) : $signed(_GEN_13); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_15 = 9'hf == idx_r ? $signed(14'shfef) : $signed(_GEN_14); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_16 = 9'h10 == idx_r ? $signed(14'shfec) : $signed(_GEN_15); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_17 = 9'h11 == idx_r ? $signed(14'shfea) : $signed(_GEN_16); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_18 = 9'h12 == idx_r ? $signed(14'shfe7) : $signed(_GEN_17); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_19 = 9'h13 == idx_r ? $signed(14'shfe4) : $signed(_GEN_18); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_20 = 9'h14 == idx_r ? $signed(14'shfe1) : $signed(_GEN_19); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_21 = 9'h15 == idx_r ? $signed(14'shfde) : $signed(_GEN_20); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_22 = 9'h16 == idx_r ? $signed(14'shfdb) : $signed(_GEN_21); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_23 = 9'h17 == idx_r ? $signed(14'shfd7) : $signed(_GEN_22); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_24 = 9'h18 == idx_r ? $signed(14'shfd4) : $signed(_GEN_23); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_25 = 9'h19 == idx_r ? $signed(14'shfd0) : $signed(_GEN_24); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_26 = 9'h1a == idx_r ? $signed(14'shfcc) : $signed(_GEN_25); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_27 = 9'h1b == idx_r ? $signed(14'shfc8) : $signed(_GEN_26); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_28 = 9'h1c == idx_r ? $signed(14'shfc4) : $signed(_GEN_27); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_29 = 9'h1d == idx_r ? $signed(14'shfbf) : $signed(_GEN_28); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_30 = 9'h1e == idx_r ? $signed(14'shfbb) : $signed(_GEN_29); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_31 = 9'h1f == idx_r ? $signed(14'shfb6) : $signed(_GEN_30); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_32 = 9'h20 == idx_r ? $signed(14'shfb1) : $signed(_GEN_31); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_33 = 9'h21 == idx_r ? $signed(14'shfac) : $signed(_GEN_32); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_34 = 9'h22 == idx_r ? $signed(14'shfa7) : $signed(_GEN_33); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_35 = 9'h23 == idx_r ? $signed(14'shfa2) : $signed(_GEN_34); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_36 = 9'h24 == idx_r ? $signed(14'shf9c) : $signed(_GEN_35); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_37 = 9'h25 == idx_r ? $signed(14'shf97) : $signed(_GEN_36); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_38 = 9'h26 == idx_r ? $signed(14'shf91) : $signed(_GEN_37); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_39 = 9'h27 == idx_r ? $signed(14'shf8b) : $signed(_GEN_38); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_40 = 9'h28 == idx_r ? $signed(14'shf85) : $signed(_GEN_39); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_41 = 9'h29 == idx_r ? $signed(14'shf7f) : $signed(_GEN_40); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_42 = 9'h2a == idx_r ? $signed(14'shf79) : $signed(_GEN_41); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_43 = 9'h2b == idx_r ? $signed(14'shf72) : $signed(_GEN_42); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_44 = 9'h2c == idx_r ? $signed(14'shf6c) : $signed(_GEN_43); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_45 = 9'h2d == idx_r ? $signed(14'shf65) : $signed(_GEN_44); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_46 = 9'h2e == idx_r ? $signed(14'shf5e) : $signed(_GEN_45); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_47 = 9'h2f == idx_r ? $signed(14'shf57) : $signed(_GEN_46); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_48 = 9'h30 == idx_r ? $signed(14'shf50) : $signed(_GEN_47); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_49 = 9'h31 == idx_r ? $signed(14'shf48) : $signed(_GEN_48); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_50 = 9'h32 == idx_r ? $signed(14'shf41) : $signed(_GEN_49); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_51 = 9'h33 == idx_r ? $signed(14'shf39) : $signed(_GEN_50); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_52 = 9'h34 == idx_r ? $signed(14'shf31) : $signed(_GEN_51); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_53 = 9'h35 == idx_r ? $signed(14'shf29) : $signed(_GEN_52); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_54 = 9'h36 == idx_r ? $signed(14'shf21) : $signed(_GEN_53); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_55 = 9'h37 == idx_r ? $signed(14'shf19) : $signed(_GEN_54); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_56 = 9'h38 == idx_r ? $signed(14'shf11) : $signed(_GEN_55); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_57 = 9'h39 == idx_r ? $signed(14'shf08) : $signed(_GEN_56); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_58 = 9'h3a == idx_r ? $signed(14'sheff) : $signed(_GEN_57); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_59 = 9'h3b == idx_r ? $signed(14'shef7) : $signed(_GEN_58); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_60 = 9'h3c == idx_r ? $signed(14'sheee) : $signed(_GEN_59); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_61 = 9'h3d == idx_r ? $signed(14'shee4) : $signed(_GEN_60); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_62 = 9'h3e == idx_r ? $signed(14'shedb) : $signed(_GEN_61); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_63 = 9'h3f == idx_r ? $signed(14'shed2) : $signed(_GEN_62); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_64 = 9'h40 == idx_r ? $signed(14'shec8) : $signed(_GEN_63); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_65 = 9'h41 == idx_r ? $signed(14'shebf) : $signed(_GEN_64); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_66 = 9'h42 == idx_r ? $signed(14'sheb5) : $signed(_GEN_65); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_67 = 9'h43 == idx_r ? $signed(14'sheab) : $signed(_GEN_66); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_68 = 9'h44 == idx_r ? $signed(14'shea1) : $signed(_GEN_67); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_69 = 9'h45 == idx_r ? $signed(14'she96) : $signed(_GEN_68); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_70 = 9'h46 == idx_r ? $signed(14'she8c) : $signed(_GEN_69); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_71 = 9'h47 == idx_r ? $signed(14'she81) : $signed(_GEN_70); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_72 = 9'h48 == idx_r ? $signed(14'she77) : $signed(_GEN_71); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_73 = 9'h49 == idx_r ? $signed(14'she6c) : $signed(_GEN_72); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_74 = 9'h4a == idx_r ? $signed(14'she61) : $signed(_GEN_73); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_75 = 9'h4b == idx_r ? $signed(14'she56) : $signed(_GEN_74); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_76 = 9'h4c == idx_r ? $signed(14'she4b) : $signed(_GEN_75); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_77 = 9'h4d == idx_r ? $signed(14'she3f) : $signed(_GEN_76); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_78 = 9'h4e == idx_r ? $signed(14'she34) : $signed(_GEN_77); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_79 = 9'h4f == idx_r ? $signed(14'she28) : $signed(_GEN_78); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_80 = 9'h50 == idx_r ? $signed(14'she1c) : $signed(_GEN_79); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_81 = 9'h51 == idx_r ? $signed(14'she10) : $signed(_GEN_80); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_82 = 9'h52 == idx_r ? $signed(14'she04) : $signed(_GEN_81); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_83 = 9'h53 == idx_r ? $signed(14'shdf8) : $signed(_GEN_82); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_84 = 9'h54 == idx_r ? $signed(14'shdec) : $signed(_GEN_83); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_85 = 9'h55 == idx_r ? $signed(14'shddf) : $signed(_GEN_84); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_86 = 9'h56 == idx_r ? $signed(14'shdd3) : $signed(_GEN_85); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_87 = 9'h57 == idx_r ? $signed(14'shdc6) : $signed(_GEN_86); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_88 = 9'h58 == idx_r ? $signed(14'shdb9) : $signed(_GEN_87); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_89 = 9'h59 == idx_r ? $signed(14'shdac) : $signed(_GEN_88); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_90 = 9'h5a == idx_r ? $signed(14'shd9f) : $signed(_GEN_89); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_91 = 9'h5b == idx_r ? $signed(14'shd92) : $signed(_GEN_90); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_92 = 9'h5c == idx_r ? $signed(14'shd85) : $signed(_GEN_91); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_93 = 9'h5d == idx_r ? $signed(14'shd77) : $signed(_GEN_92); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_94 = 9'h5e == idx_r ? $signed(14'shd69) : $signed(_GEN_93); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_95 = 9'h5f == idx_r ? $signed(14'shd5c) : $signed(_GEN_94); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_96 = 9'h60 == idx_r ? $signed(14'shd4e) : $signed(_GEN_95); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_97 = 9'h61 == idx_r ? $signed(14'shd40) : $signed(_GEN_96); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_98 = 9'h62 == idx_r ? $signed(14'shd32) : $signed(_GEN_97); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_99 = 9'h63 == idx_r ? $signed(14'shd23) : $signed(_GEN_98); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_100 = 9'h64 == idx_r ? $signed(14'shd15) : $signed(_GEN_99); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_101 = 9'h65 == idx_r ? $signed(14'shd06) : $signed(_GEN_100); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_102 = 9'h66 == idx_r ? $signed(14'shcf8) : $signed(_GEN_101); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_103 = 9'h67 == idx_r ? $signed(14'shce9) : $signed(_GEN_102); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_104 = 9'h68 == idx_r ? $signed(14'shcda) : $signed(_GEN_103); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_105 = 9'h69 == idx_r ? $signed(14'shccb) : $signed(_GEN_104); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_106 = 9'h6a == idx_r ? $signed(14'shcbc) : $signed(_GEN_105); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_107 = 9'h6b == idx_r ? $signed(14'shcac) : $signed(_GEN_106); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_108 = 9'h6c == idx_r ? $signed(14'shc9d) : $signed(_GEN_107); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_109 = 9'h6d == idx_r ? $signed(14'shc8e) : $signed(_GEN_108); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_110 = 9'h6e == idx_r ? $signed(14'shc7e) : $signed(_GEN_109); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_111 = 9'h6f == idx_r ? $signed(14'shc6e) : $signed(_GEN_110); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_112 = 9'h70 == idx_r ? $signed(14'shc5e) : $signed(_GEN_111); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_113 = 9'h71 == idx_r ? $signed(14'shc4e) : $signed(_GEN_112); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_114 = 9'h72 == idx_r ? $signed(14'shc3e) : $signed(_GEN_113); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_115 = 9'h73 == idx_r ? $signed(14'shc2e) : $signed(_GEN_114); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_116 = 9'h74 == idx_r ? $signed(14'shc1e) : $signed(_GEN_115); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_117 = 9'h75 == idx_r ? $signed(14'shc0d) : $signed(_GEN_116); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_118 = 9'h76 == idx_r ? $signed(14'shbfc) : $signed(_GEN_117); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_119 = 9'h77 == idx_r ? $signed(14'shbec) : $signed(_GEN_118); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_120 = 9'h78 == idx_r ? $signed(14'shbdb) : $signed(_GEN_119); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_121 = 9'h79 == idx_r ? $signed(14'shbca) : $signed(_GEN_120); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_122 = 9'h7a == idx_r ? $signed(14'shbb9) : $signed(_GEN_121); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_123 = 9'h7b == idx_r ? $signed(14'shba8) : $signed(_GEN_122); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_124 = 9'h7c == idx_r ? $signed(14'shb97) : $signed(_GEN_123); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_125 = 9'h7d == idx_r ? $signed(14'shb85) : $signed(_GEN_124); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_126 = 9'h7e == idx_r ? $signed(14'shb74) : $signed(_GEN_125); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_127 = 9'h7f == idx_r ? $signed(14'shb62) : $signed(_GEN_126); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_128 = 9'h80 == idx_r ? $signed(14'shb50) : $signed(_GEN_127); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_129 = 9'h81 == idx_r ? $signed(14'shb3e) : $signed(_GEN_128); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_130 = 9'h82 == idx_r ? $signed(14'shb2d) : $signed(_GEN_129); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_131 = 9'h83 == idx_r ? $signed(14'shb1b) : $signed(_GEN_130); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_132 = 9'h84 == idx_r ? $signed(14'shb08) : $signed(_GEN_131); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_133 = 9'h85 == idx_r ? $signed(14'shaf6) : $signed(_GEN_132); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_134 = 9'h86 == idx_r ? $signed(14'shae4) : $signed(_GEN_133); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_135 = 9'h87 == idx_r ? $signed(14'shad1) : $signed(_GEN_134); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_136 = 9'h88 == idx_r ? $signed(14'shabf) : $signed(_GEN_135); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_137 = 9'h89 == idx_r ? $signed(14'shaac) : $signed(_GEN_136); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_138 = 9'h8a == idx_r ? $signed(14'sha99) : $signed(_GEN_137); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_139 = 9'h8b == idx_r ? $signed(14'sha86) : $signed(_GEN_138); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_140 = 9'h8c == idx_r ? $signed(14'sha73) : $signed(_GEN_139); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_141 = 9'h8d == idx_r ? $signed(14'sha60) : $signed(_GEN_140); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_142 = 9'h8e == idx_r ? $signed(14'sha4d) : $signed(_GEN_141); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_143 = 9'h8f == idx_r ? $signed(14'sha3a) : $signed(_GEN_142); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_144 = 9'h90 == idx_r ? $signed(14'sha26) : $signed(_GEN_143); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_145 = 9'h91 == idx_r ? $signed(14'sha13) : $signed(_GEN_144); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_146 = 9'h92 == idx_r ? $signed(14'sh9ff) : $signed(_GEN_145); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_147 = 9'h93 == idx_r ? $signed(14'sh9ec) : $signed(_GEN_146); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_148 = 9'h94 == idx_r ? $signed(14'sh9d8) : $signed(_GEN_147); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_149 = 9'h95 == idx_r ? $signed(14'sh9c4) : $signed(_GEN_148); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_150 = 9'h96 == idx_r ? $signed(14'sh9b0) : $signed(_GEN_149); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_151 = 9'h97 == idx_r ? $signed(14'sh99c) : $signed(_GEN_150); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_152 = 9'h98 == idx_r ? $signed(14'sh988) : $signed(_GEN_151); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_153 = 9'h99 == idx_r ? $signed(14'sh974) : $signed(_GEN_152); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_154 = 9'h9a == idx_r ? $signed(14'sh95f) : $signed(_GEN_153); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_155 = 9'h9b == idx_r ? $signed(14'sh94b) : $signed(_GEN_154); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_156 = 9'h9c == idx_r ? $signed(14'sh937) : $signed(_GEN_155); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_157 = 9'h9d == idx_r ? $signed(14'sh922) : $signed(_GEN_156); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_158 = 9'h9e == idx_r ? $signed(14'sh90d) : $signed(_GEN_157); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_159 = 9'h9f == idx_r ? $signed(14'sh8f8) : $signed(_GEN_158); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_160 = 9'ha0 == idx_r ? $signed(14'sh8e4) : $signed(_GEN_159); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_161 = 9'ha1 == idx_r ? $signed(14'sh8cf) : $signed(_GEN_160); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_162 = 9'ha2 == idx_r ? $signed(14'sh8ba) : $signed(_GEN_161); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_163 = 9'ha3 == idx_r ? $signed(14'sh8a5) : $signed(_GEN_162); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_164 = 9'ha4 == idx_r ? $signed(14'sh88f) : $signed(_GEN_163); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_165 = 9'ha5 == idx_r ? $signed(14'sh87a) : $signed(_GEN_164); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_166 = 9'ha6 == idx_r ? $signed(14'sh865) : $signed(_GEN_165); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_167 = 9'ha7 == idx_r ? $signed(14'sh84f) : $signed(_GEN_166); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_168 = 9'ha8 == idx_r ? $signed(14'sh83a) : $signed(_GEN_167); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_169 = 9'ha9 == idx_r ? $signed(14'sh824) : $signed(_GEN_168); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_170 = 9'haa == idx_r ? $signed(14'sh80e) : $signed(_GEN_169); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_171 = 9'hab == idx_r ? $signed(14'sh7f9) : $signed(_GEN_170); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_172 = 9'hac == idx_r ? $signed(14'sh7e3) : $signed(_GEN_171); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_173 = 9'had == idx_r ? $signed(14'sh7cd) : $signed(_GEN_172); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_174 = 9'hae == idx_r ? $signed(14'sh7b7) : $signed(_GEN_173); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_175 = 9'haf == idx_r ? $signed(14'sh7a1) : $signed(_GEN_174); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_176 = 9'hb0 == idx_r ? $signed(14'sh78b) : $signed(_GEN_175); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_177 = 9'hb1 == idx_r ? $signed(14'sh775) : $signed(_GEN_176); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_178 = 9'hb2 == idx_r ? $signed(14'sh75e) : $signed(_GEN_177); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_179 = 9'hb3 == idx_r ? $signed(14'sh748) : $signed(_GEN_178); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_180 = 9'hb4 == idx_r ? $signed(14'sh732) : $signed(_GEN_179); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_181 = 9'hb5 == idx_r ? $signed(14'sh71b) : $signed(_GEN_180); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_182 = 9'hb6 == idx_r ? $signed(14'sh705) : $signed(_GEN_181); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_183 = 9'hb7 == idx_r ? $signed(14'sh6ee) : $signed(_GEN_182); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_184 = 9'hb8 == idx_r ? $signed(14'sh6d7) : $signed(_GEN_183); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_185 = 9'hb9 == idx_r ? $signed(14'sh6c1) : $signed(_GEN_184); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_186 = 9'hba == idx_r ? $signed(14'sh6aa) : $signed(_GEN_185); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_187 = 9'hbb == idx_r ? $signed(14'sh693) : $signed(_GEN_186); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_188 = 9'hbc == idx_r ? $signed(14'sh67c) : $signed(_GEN_187); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_189 = 9'hbd == idx_r ? $signed(14'sh665) : $signed(_GEN_188); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_190 = 9'hbe == idx_r ? $signed(14'sh64e) : $signed(_GEN_189); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_191 = 9'hbf == idx_r ? $signed(14'sh637) : $signed(_GEN_190); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_192 = 9'hc0 == idx_r ? $signed(14'sh61f) : $signed(_GEN_191); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_193 = 9'hc1 == idx_r ? $signed(14'sh608) : $signed(_GEN_192); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_194 = 9'hc2 == idx_r ? $signed(14'sh5f1) : $signed(_GEN_193); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_195 = 9'hc3 == idx_r ? $signed(14'sh5da) : $signed(_GEN_194); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_196 = 9'hc4 == idx_r ? $signed(14'sh5c2) : $signed(_GEN_195); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_197 = 9'hc5 == idx_r ? $signed(14'sh5ab) : $signed(_GEN_196); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_198 = 9'hc6 == idx_r ? $signed(14'sh593) : $signed(_GEN_197); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_199 = 9'hc7 == idx_r ? $signed(14'sh57c) : $signed(_GEN_198); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_200 = 9'hc8 == idx_r ? $signed(14'sh564) : $signed(_GEN_199); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_201 = 9'hc9 == idx_r ? $signed(14'sh54c) : $signed(_GEN_200); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_202 = 9'hca == idx_r ? $signed(14'sh534) : $signed(_GEN_201); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_203 = 9'hcb == idx_r ? $signed(14'sh51d) : $signed(_GEN_202); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_204 = 9'hcc == idx_r ? $signed(14'sh505) : $signed(_GEN_203); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_205 = 9'hcd == idx_r ? $signed(14'sh4ed) : $signed(_GEN_204); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_206 = 9'hce == idx_r ? $signed(14'sh4d5) : $signed(_GEN_205); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_207 = 9'hcf == idx_r ? $signed(14'sh4bd) : $signed(_GEN_206); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_208 = 9'hd0 == idx_r ? $signed(14'sh4a5) : $signed(_GEN_207); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_209 = 9'hd1 == idx_r ? $signed(14'sh48d) : $signed(_GEN_208); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_210 = 9'hd2 == idx_r ? $signed(14'sh475) : $signed(_GEN_209); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_211 = 9'hd3 == idx_r ? $signed(14'sh45d) : $signed(_GEN_210); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_212 = 9'hd4 == idx_r ? $signed(14'sh444) : $signed(_GEN_211); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_213 = 9'hd5 == idx_r ? $signed(14'sh42c) : $signed(_GEN_212); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_214 = 9'hd6 == idx_r ? $signed(14'sh414) : $signed(_GEN_213); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_215 = 9'hd7 == idx_r ? $signed(14'sh3fc) : $signed(_GEN_214); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_216 = 9'hd8 == idx_r ? $signed(14'sh3e3) : $signed(_GEN_215); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_217 = 9'hd9 == idx_r ? $signed(14'sh3cb) : $signed(_GEN_216); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_218 = 9'hda == idx_r ? $signed(14'sh3b2) : $signed(_GEN_217); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_219 = 9'hdb == idx_r ? $signed(14'sh39a) : $signed(_GEN_218); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_220 = 9'hdc == idx_r ? $signed(14'sh381) : $signed(_GEN_219); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_221 = 9'hdd == idx_r ? $signed(14'sh369) : $signed(_GEN_220); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_222 = 9'hde == idx_r ? $signed(14'sh350) : $signed(_GEN_221); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_223 = 9'hdf == idx_r ? $signed(14'sh338) : $signed(_GEN_222); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_224 = 9'he0 == idx_r ? $signed(14'sh31f) : $signed(_GEN_223); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_225 = 9'he1 == idx_r ? $signed(14'sh306) : $signed(_GEN_224); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_226 = 9'he2 == idx_r ? $signed(14'sh2ee) : $signed(_GEN_225); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_227 = 9'he3 == idx_r ? $signed(14'sh2d5) : $signed(_GEN_226); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_228 = 9'he4 == idx_r ? $signed(14'sh2bc) : $signed(_GEN_227); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_229 = 9'he5 == idx_r ? $signed(14'sh2a3) : $signed(_GEN_228); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_230 = 9'he6 == idx_r ? $signed(14'sh28b) : $signed(_GEN_229); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_231 = 9'he7 == idx_r ? $signed(14'sh272) : $signed(_GEN_230); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_232 = 9'he8 == idx_r ? $signed(14'sh259) : $signed(_GEN_231); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_233 = 9'he9 == idx_r ? $signed(14'sh240) : $signed(_GEN_232); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_234 = 9'hea == idx_r ? $signed(14'sh227) : $signed(_GEN_233); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_235 = 9'heb == idx_r ? $signed(14'sh20e) : $signed(_GEN_234); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_236 = 9'hec == idx_r ? $signed(14'sh1f5) : $signed(_GEN_235); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_237 = 9'hed == idx_r ? $signed(14'sh1dc) : $signed(_GEN_236); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_238 = 9'hee == idx_r ? $signed(14'sh1c3) : $signed(_GEN_237); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_239 = 9'hef == idx_r ? $signed(14'sh1aa) : $signed(_GEN_238); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_240 = 9'hf0 == idx_r ? $signed(14'sh191) : $signed(_GEN_239); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_241 = 9'hf1 == idx_r ? $signed(14'sh178) : $signed(_GEN_240); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_242 = 9'hf2 == idx_r ? $signed(14'sh15f) : $signed(_GEN_241); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_243 = 9'hf3 == idx_r ? $signed(14'sh146) : $signed(_GEN_242); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_244 = 9'hf4 == idx_r ? $signed(14'sh12d) : $signed(_GEN_243); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_245 = 9'hf5 == idx_r ? $signed(14'sh114) : $signed(_GEN_244); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_246 = 9'hf6 == idx_r ? $signed(14'shfb) : $signed(_GEN_245); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_247 = 9'hf7 == idx_r ? $signed(14'she2) : $signed(_GEN_246); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_248 = 9'hf8 == idx_r ? $signed(14'shc9) : $signed(_GEN_247); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_249 = 9'hf9 == idx_r ? $signed(14'shb0) : $signed(_GEN_248); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_250 = 9'hfa == idx_r ? $signed(14'sh97) : $signed(_GEN_249); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_251 = 9'hfb == idx_r ? $signed(14'sh7e) : $signed(_GEN_250); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_252 = 9'hfc == idx_r ? $signed(14'sh65) : $signed(_GEN_251); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_253 = 9'hfd == idx_r ? $signed(14'sh4b) : $signed(_GEN_252); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_254 = 9'hfe == idx_r ? $signed(14'sh32) : $signed(_GEN_253); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_255 = 9'hff == idx_r ? $signed(14'sh19) : $signed(_GEN_254); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_256 = 9'h100 == idx_r ? $signed(14'sh0) : $signed(_GEN_255); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _io_wR_T_2 = 14'sh0 - $signed(_GEN_256); // @[FFTTwiddle.scala 53:35]
  wire [13:0] _GEN_258 = 9'h1 == idx_r ? $signed(14'sh19) : $signed(14'sh0); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_259 = 9'h2 == idx_r ? $signed(14'sh32) : $signed(_GEN_258); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_260 = 9'h3 == idx_r ? $signed(14'sh4b) : $signed(_GEN_259); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_261 = 9'h4 == idx_r ? $signed(14'sh65) : $signed(_GEN_260); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_262 = 9'h5 == idx_r ? $signed(14'sh7e) : $signed(_GEN_261); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_263 = 9'h6 == idx_r ? $signed(14'sh97) : $signed(_GEN_262); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_264 = 9'h7 == idx_r ? $signed(14'shb0) : $signed(_GEN_263); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_265 = 9'h8 == idx_r ? $signed(14'shc9) : $signed(_GEN_264); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_266 = 9'h9 == idx_r ? $signed(14'she2) : $signed(_GEN_265); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_267 = 9'ha == idx_r ? $signed(14'shfb) : $signed(_GEN_266); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_268 = 9'hb == idx_r ? $signed(14'sh114) : $signed(_GEN_267); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_269 = 9'hc == idx_r ? $signed(14'sh12d) : $signed(_GEN_268); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_270 = 9'hd == idx_r ? $signed(14'sh146) : $signed(_GEN_269); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_271 = 9'he == idx_r ? $signed(14'sh15f) : $signed(_GEN_270); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_272 = 9'hf == idx_r ? $signed(14'sh178) : $signed(_GEN_271); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_273 = 9'h10 == idx_r ? $signed(14'sh191) : $signed(_GEN_272); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_274 = 9'h11 == idx_r ? $signed(14'sh1aa) : $signed(_GEN_273); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_275 = 9'h12 == idx_r ? $signed(14'sh1c3) : $signed(_GEN_274); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_276 = 9'h13 == idx_r ? $signed(14'sh1dc) : $signed(_GEN_275); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_277 = 9'h14 == idx_r ? $signed(14'sh1f5) : $signed(_GEN_276); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_278 = 9'h15 == idx_r ? $signed(14'sh20e) : $signed(_GEN_277); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_279 = 9'h16 == idx_r ? $signed(14'sh227) : $signed(_GEN_278); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_280 = 9'h17 == idx_r ? $signed(14'sh240) : $signed(_GEN_279); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_281 = 9'h18 == idx_r ? $signed(14'sh259) : $signed(_GEN_280); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_282 = 9'h19 == idx_r ? $signed(14'sh272) : $signed(_GEN_281); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_283 = 9'h1a == idx_r ? $signed(14'sh28b) : $signed(_GEN_282); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_284 = 9'h1b == idx_r ? $signed(14'sh2a3) : $signed(_GEN_283); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_285 = 9'h1c == idx_r ? $signed(14'sh2bc) : $signed(_GEN_284); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_286 = 9'h1d == idx_r ? $signed(14'sh2d5) : $signed(_GEN_285); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_287 = 9'h1e == idx_r ? $signed(14'sh2ee) : $signed(_GEN_286); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_288 = 9'h1f == idx_r ? $signed(14'sh306) : $signed(_GEN_287); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_289 = 9'h20 == idx_r ? $signed(14'sh31f) : $signed(_GEN_288); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_290 = 9'h21 == idx_r ? $signed(14'sh338) : $signed(_GEN_289); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_291 = 9'h22 == idx_r ? $signed(14'sh350) : $signed(_GEN_290); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_292 = 9'h23 == idx_r ? $signed(14'sh369) : $signed(_GEN_291); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_293 = 9'h24 == idx_r ? $signed(14'sh381) : $signed(_GEN_292); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_294 = 9'h25 == idx_r ? $signed(14'sh39a) : $signed(_GEN_293); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_295 = 9'h26 == idx_r ? $signed(14'sh3b2) : $signed(_GEN_294); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_296 = 9'h27 == idx_r ? $signed(14'sh3cb) : $signed(_GEN_295); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_297 = 9'h28 == idx_r ? $signed(14'sh3e3) : $signed(_GEN_296); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_298 = 9'h29 == idx_r ? $signed(14'sh3fc) : $signed(_GEN_297); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_299 = 9'h2a == idx_r ? $signed(14'sh414) : $signed(_GEN_298); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_300 = 9'h2b == idx_r ? $signed(14'sh42c) : $signed(_GEN_299); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_301 = 9'h2c == idx_r ? $signed(14'sh444) : $signed(_GEN_300); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_302 = 9'h2d == idx_r ? $signed(14'sh45d) : $signed(_GEN_301); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_303 = 9'h2e == idx_r ? $signed(14'sh475) : $signed(_GEN_302); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_304 = 9'h2f == idx_r ? $signed(14'sh48d) : $signed(_GEN_303); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_305 = 9'h30 == idx_r ? $signed(14'sh4a5) : $signed(_GEN_304); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_306 = 9'h31 == idx_r ? $signed(14'sh4bd) : $signed(_GEN_305); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_307 = 9'h32 == idx_r ? $signed(14'sh4d5) : $signed(_GEN_306); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_308 = 9'h33 == idx_r ? $signed(14'sh4ed) : $signed(_GEN_307); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_309 = 9'h34 == idx_r ? $signed(14'sh505) : $signed(_GEN_308); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_310 = 9'h35 == idx_r ? $signed(14'sh51d) : $signed(_GEN_309); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_311 = 9'h36 == idx_r ? $signed(14'sh534) : $signed(_GEN_310); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_312 = 9'h37 == idx_r ? $signed(14'sh54c) : $signed(_GEN_311); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_313 = 9'h38 == idx_r ? $signed(14'sh564) : $signed(_GEN_312); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_314 = 9'h39 == idx_r ? $signed(14'sh57c) : $signed(_GEN_313); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_315 = 9'h3a == idx_r ? $signed(14'sh593) : $signed(_GEN_314); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_316 = 9'h3b == idx_r ? $signed(14'sh5ab) : $signed(_GEN_315); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_317 = 9'h3c == idx_r ? $signed(14'sh5c2) : $signed(_GEN_316); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_318 = 9'h3d == idx_r ? $signed(14'sh5da) : $signed(_GEN_317); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_319 = 9'h3e == idx_r ? $signed(14'sh5f1) : $signed(_GEN_318); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_320 = 9'h3f == idx_r ? $signed(14'sh608) : $signed(_GEN_319); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_321 = 9'h40 == idx_r ? $signed(14'sh61f) : $signed(_GEN_320); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_322 = 9'h41 == idx_r ? $signed(14'sh637) : $signed(_GEN_321); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_323 = 9'h42 == idx_r ? $signed(14'sh64e) : $signed(_GEN_322); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_324 = 9'h43 == idx_r ? $signed(14'sh665) : $signed(_GEN_323); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_325 = 9'h44 == idx_r ? $signed(14'sh67c) : $signed(_GEN_324); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_326 = 9'h45 == idx_r ? $signed(14'sh693) : $signed(_GEN_325); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_327 = 9'h46 == idx_r ? $signed(14'sh6aa) : $signed(_GEN_326); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_328 = 9'h47 == idx_r ? $signed(14'sh6c1) : $signed(_GEN_327); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_329 = 9'h48 == idx_r ? $signed(14'sh6d7) : $signed(_GEN_328); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_330 = 9'h49 == idx_r ? $signed(14'sh6ee) : $signed(_GEN_329); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_331 = 9'h4a == idx_r ? $signed(14'sh705) : $signed(_GEN_330); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_332 = 9'h4b == idx_r ? $signed(14'sh71b) : $signed(_GEN_331); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_333 = 9'h4c == idx_r ? $signed(14'sh732) : $signed(_GEN_332); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_334 = 9'h4d == idx_r ? $signed(14'sh748) : $signed(_GEN_333); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_335 = 9'h4e == idx_r ? $signed(14'sh75e) : $signed(_GEN_334); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_336 = 9'h4f == idx_r ? $signed(14'sh775) : $signed(_GEN_335); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_337 = 9'h50 == idx_r ? $signed(14'sh78b) : $signed(_GEN_336); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_338 = 9'h51 == idx_r ? $signed(14'sh7a1) : $signed(_GEN_337); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_339 = 9'h52 == idx_r ? $signed(14'sh7b7) : $signed(_GEN_338); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_340 = 9'h53 == idx_r ? $signed(14'sh7cd) : $signed(_GEN_339); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_341 = 9'h54 == idx_r ? $signed(14'sh7e3) : $signed(_GEN_340); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_342 = 9'h55 == idx_r ? $signed(14'sh7f9) : $signed(_GEN_341); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_343 = 9'h56 == idx_r ? $signed(14'sh80e) : $signed(_GEN_342); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_344 = 9'h57 == idx_r ? $signed(14'sh824) : $signed(_GEN_343); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_345 = 9'h58 == idx_r ? $signed(14'sh83a) : $signed(_GEN_344); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_346 = 9'h59 == idx_r ? $signed(14'sh84f) : $signed(_GEN_345); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_347 = 9'h5a == idx_r ? $signed(14'sh865) : $signed(_GEN_346); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_348 = 9'h5b == idx_r ? $signed(14'sh87a) : $signed(_GEN_347); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_349 = 9'h5c == idx_r ? $signed(14'sh88f) : $signed(_GEN_348); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_350 = 9'h5d == idx_r ? $signed(14'sh8a5) : $signed(_GEN_349); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_351 = 9'h5e == idx_r ? $signed(14'sh8ba) : $signed(_GEN_350); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_352 = 9'h5f == idx_r ? $signed(14'sh8cf) : $signed(_GEN_351); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_353 = 9'h60 == idx_r ? $signed(14'sh8e4) : $signed(_GEN_352); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_354 = 9'h61 == idx_r ? $signed(14'sh8f8) : $signed(_GEN_353); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_355 = 9'h62 == idx_r ? $signed(14'sh90d) : $signed(_GEN_354); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_356 = 9'h63 == idx_r ? $signed(14'sh922) : $signed(_GEN_355); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_357 = 9'h64 == idx_r ? $signed(14'sh937) : $signed(_GEN_356); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_358 = 9'h65 == idx_r ? $signed(14'sh94b) : $signed(_GEN_357); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_359 = 9'h66 == idx_r ? $signed(14'sh95f) : $signed(_GEN_358); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_360 = 9'h67 == idx_r ? $signed(14'sh974) : $signed(_GEN_359); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_361 = 9'h68 == idx_r ? $signed(14'sh988) : $signed(_GEN_360); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_362 = 9'h69 == idx_r ? $signed(14'sh99c) : $signed(_GEN_361); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_363 = 9'h6a == idx_r ? $signed(14'sh9b0) : $signed(_GEN_362); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_364 = 9'h6b == idx_r ? $signed(14'sh9c4) : $signed(_GEN_363); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_365 = 9'h6c == idx_r ? $signed(14'sh9d8) : $signed(_GEN_364); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_366 = 9'h6d == idx_r ? $signed(14'sh9ec) : $signed(_GEN_365); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_367 = 9'h6e == idx_r ? $signed(14'sh9ff) : $signed(_GEN_366); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_368 = 9'h6f == idx_r ? $signed(14'sha13) : $signed(_GEN_367); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_369 = 9'h70 == idx_r ? $signed(14'sha26) : $signed(_GEN_368); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_370 = 9'h71 == idx_r ? $signed(14'sha3a) : $signed(_GEN_369); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_371 = 9'h72 == idx_r ? $signed(14'sha4d) : $signed(_GEN_370); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_372 = 9'h73 == idx_r ? $signed(14'sha60) : $signed(_GEN_371); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_373 = 9'h74 == idx_r ? $signed(14'sha73) : $signed(_GEN_372); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_374 = 9'h75 == idx_r ? $signed(14'sha86) : $signed(_GEN_373); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_375 = 9'h76 == idx_r ? $signed(14'sha99) : $signed(_GEN_374); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_376 = 9'h77 == idx_r ? $signed(14'shaac) : $signed(_GEN_375); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_377 = 9'h78 == idx_r ? $signed(14'shabf) : $signed(_GEN_376); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_378 = 9'h79 == idx_r ? $signed(14'shad1) : $signed(_GEN_377); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_379 = 9'h7a == idx_r ? $signed(14'shae4) : $signed(_GEN_378); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_380 = 9'h7b == idx_r ? $signed(14'shaf6) : $signed(_GEN_379); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_381 = 9'h7c == idx_r ? $signed(14'shb08) : $signed(_GEN_380); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_382 = 9'h7d == idx_r ? $signed(14'shb1b) : $signed(_GEN_381); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_383 = 9'h7e == idx_r ? $signed(14'shb2d) : $signed(_GEN_382); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_384 = 9'h7f == idx_r ? $signed(14'shb3e) : $signed(_GEN_383); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_385 = 9'h80 == idx_r ? $signed(14'shb50) : $signed(_GEN_384); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_386 = 9'h81 == idx_r ? $signed(14'shb62) : $signed(_GEN_385); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_387 = 9'h82 == idx_r ? $signed(14'shb74) : $signed(_GEN_386); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_388 = 9'h83 == idx_r ? $signed(14'shb85) : $signed(_GEN_387); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_389 = 9'h84 == idx_r ? $signed(14'shb97) : $signed(_GEN_388); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_390 = 9'h85 == idx_r ? $signed(14'shba8) : $signed(_GEN_389); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_391 = 9'h86 == idx_r ? $signed(14'shbb9) : $signed(_GEN_390); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_392 = 9'h87 == idx_r ? $signed(14'shbca) : $signed(_GEN_391); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_393 = 9'h88 == idx_r ? $signed(14'shbdb) : $signed(_GEN_392); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_394 = 9'h89 == idx_r ? $signed(14'shbec) : $signed(_GEN_393); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_395 = 9'h8a == idx_r ? $signed(14'shbfc) : $signed(_GEN_394); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_396 = 9'h8b == idx_r ? $signed(14'shc0d) : $signed(_GEN_395); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_397 = 9'h8c == idx_r ? $signed(14'shc1e) : $signed(_GEN_396); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_398 = 9'h8d == idx_r ? $signed(14'shc2e) : $signed(_GEN_397); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_399 = 9'h8e == idx_r ? $signed(14'shc3e) : $signed(_GEN_398); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_400 = 9'h8f == idx_r ? $signed(14'shc4e) : $signed(_GEN_399); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_401 = 9'h90 == idx_r ? $signed(14'shc5e) : $signed(_GEN_400); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_402 = 9'h91 == idx_r ? $signed(14'shc6e) : $signed(_GEN_401); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_403 = 9'h92 == idx_r ? $signed(14'shc7e) : $signed(_GEN_402); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_404 = 9'h93 == idx_r ? $signed(14'shc8e) : $signed(_GEN_403); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_405 = 9'h94 == idx_r ? $signed(14'shc9d) : $signed(_GEN_404); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_406 = 9'h95 == idx_r ? $signed(14'shcac) : $signed(_GEN_405); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_407 = 9'h96 == idx_r ? $signed(14'shcbc) : $signed(_GEN_406); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_408 = 9'h97 == idx_r ? $signed(14'shccb) : $signed(_GEN_407); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_409 = 9'h98 == idx_r ? $signed(14'shcda) : $signed(_GEN_408); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_410 = 9'h99 == idx_r ? $signed(14'shce9) : $signed(_GEN_409); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_411 = 9'h9a == idx_r ? $signed(14'shcf8) : $signed(_GEN_410); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_412 = 9'h9b == idx_r ? $signed(14'shd06) : $signed(_GEN_411); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_413 = 9'h9c == idx_r ? $signed(14'shd15) : $signed(_GEN_412); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_414 = 9'h9d == idx_r ? $signed(14'shd23) : $signed(_GEN_413); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_415 = 9'h9e == idx_r ? $signed(14'shd32) : $signed(_GEN_414); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_416 = 9'h9f == idx_r ? $signed(14'shd40) : $signed(_GEN_415); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_417 = 9'ha0 == idx_r ? $signed(14'shd4e) : $signed(_GEN_416); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_418 = 9'ha1 == idx_r ? $signed(14'shd5c) : $signed(_GEN_417); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_419 = 9'ha2 == idx_r ? $signed(14'shd69) : $signed(_GEN_418); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_420 = 9'ha3 == idx_r ? $signed(14'shd77) : $signed(_GEN_419); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_421 = 9'ha4 == idx_r ? $signed(14'shd85) : $signed(_GEN_420); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_422 = 9'ha5 == idx_r ? $signed(14'shd92) : $signed(_GEN_421); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_423 = 9'ha6 == idx_r ? $signed(14'shd9f) : $signed(_GEN_422); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_424 = 9'ha7 == idx_r ? $signed(14'shdac) : $signed(_GEN_423); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_425 = 9'ha8 == idx_r ? $signed(14'shdb9) : $signed(_GEN_424); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_426 = 9'ha9 == idx_r ? $signed(14'shdc6) : $signed(_GEN_425); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_427 = 9'haa == idx_r ? $signed(14'shdd3) : $signed(_GEN_426); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_428 = 9'hab == idx_r ? $signed(14'shddf) : $signed(_GEN_427); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_429 = 9'hac == idx_r ? $signed(14'shdec) : $signed(_GEN_428); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_430 = 9'had == idx_r ? $signed(14'shdf8) : $signed(_GEN_429); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_431 = 9'hae == idx_r ? $signed(14'she04) : $signed(_GEN_430); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_432 = 9'haf == idx_r ? $signed(14'she10) : $signed(_GEN_431); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_433 = 9'hb0 == idx_r ? $signed(14'she1c) : $signed(_GEN_432); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_434 = 9'hb1 == idx_r ? $signed(14'she28) : $signed(_GEN_433); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_435 = 9'hb2 == idx_r ? $signed(14'she34) : $signed(_GEN_434); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_436 = 9'hb3 == idx_r ? $signed(14'she3f) : $signed(_GEN_435); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_437 = 9'hb4 == idx_r ? $signed(14'she4b) : $signed(_GEN_436); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_438 = 9'hb5 == idx_r ? $signed(14'she56) : $signed(_GEN_437); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_439 = 9'hb6 == idx_r ? $signed(14'she61) : $signed(_GEN_438); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_440 = 9'hb7 == idx_r ? $signed(14'she6c) : $signed(_GEN_439); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_441 = 9'hb8 == idx_r ? $signed(14'she77) : $signed(_GEN_440); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_442 = 9'hb9 == idx_r ? $signed(14'she81) : $signed(_GEN_441); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_443 = 9'hba == idx_r ? $signed(14'she8c) : $signed(_GEN_442); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_444 = 9'hbb == idx_r ? $signed(14'she96) : $signed(_GEN_443); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_445 = 9'hbc == idx_r ? $signed(14'shea1) : $signed(_GEN_444); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_446 = 9'hbd == idx_r ? $signed(14'sheab) : $signed(_GEN_445); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_447 = 9'hbe == idx_r ? $signed(14'sheb5) : $signed(_GEN_446); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_448 = 9'hbf == idx_r ? $signed(14'shebf) : $signed(_GEN_447); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_449 = 9'hc0 == idx_r ? $signed(14'shec8) : $signed(_GEN_448); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_450 = 9'hc1 == idx_r ? $signed(14'shed2) : $signed(_GEN_449); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_451 = 9'hc2 == idx_r ? $signed(14'shedb) : $signed(_GEN_450); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_452 = 9'hc3 == idx_r ? $signed(14'shee4) : $signed(_GEN_451); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_453 = 9'hc4 == idx_r ? $signed(14'sheee) : $signed(_GEN_452); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_454 = 9'hc5 == idx_r ? $signed(14'shef7) : $signed(_GEN_453); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_455 = 9'hc6 == idx_r ? $signed(14'sheff) : $signed(_GEN_454); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_456 = 9'hc7 == idx_r ? $signed(14'shf08) : $signed(_GEN_455); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_457 = 9'hc8 == idx_r ? $signed(14'shf11) : $signed(_GEN_456); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_458 = 9'hc9 == idx_r ? $signed(14'shf19) : $signed(_GEN_457); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_459 = 9'hca == idx_r ? $signed(14'shf21) : $signed(_GEN_458); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_460 = 9'hcb == idx_r ? $signed(14'shf29) : $signed(_GEN_459); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_461 = 9'hcc == idx_r ? $signed(14'shf31) : $signed(_GEN_460); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_462 = 9'hcd == idx_r ? $signed(14'shf39) : $signed(_GEN_461); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_463 = 9'hce == idx_r ? $signed(14'shf41) : $signed(_GEN_462); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_464 = 9'hcf == idx_r ? $signed(14'shf48) : $signed(_GEN_463); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_465 = 9'hd0 == idx_r ? $signed(14'shf50) : $signed(_GEN_464); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_466 = 9'hd1 == idx_r ? $signed(14'shf57) : $signed(_GEN_465); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_467 = 9'hd2 == idx_r ? $signed(14'shf5e) : $signed(_GEN_466); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_468 = 9'hd3 == idx_r ? $signed(14'shf65) : $signed(_GEN_467); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_469 = 9'hd4 == idx_r ? $signed(14'shf6c) : $signed(_GEN_468); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_470 = 9'hd5 == idx_r ? $signed(14'shf72) : $signed(_GEN_469); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_471 = 9'hd6 == idx_r ? $signed(14'shf79) : $signed(_GEN_470); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_472 = 9'hd7 == idx_r ? $signed(14'shf7f) : $signed(_GEN_471); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_473 = 9'hd8 == idx_r ? $signed(14'shf85) : $signed(_GEN_472); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_474 = 9'hd9 == idx_r ? $signed(14'shf8b) : $signed(_GEN_473); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_475 = 9'hda == idx_r ? $signed(14'shf91) : $signed(_GEN_474); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_476 = 9'hdb == idx_r ? $signed(14'shf97) : $signed(_GEN_475); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_477 = 9'hdc == idx_r ? $signed(14'shf9c) : $signed(_GEN_476); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_478 = 9'hdd == idx_r ? $signed(14'shfa2) : $signed(_GEN_477); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_479 = 9'hde == idx_r ? $signed(14'shfa7) : $signed(_GEN_478); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_480 = 9'hdf == idx_r ? $signed(14'shfac) : $signed(_GEN_479); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_481 = 9'he0 == idx_r ? $signed(14'shfb1) : $signed(_GEN_480); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_482 = 9'he1 == idx_r ? $signed(14'shfb6) : $signed(_GEN_481); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_483 = 9'he2 == idx_r ? $signed(14'shfbb) : $signed(_GEN_482); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_484 = 9'he3 == idx_r ? $signed(14'shfbf) : $signed(_GEN_483); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_485 = 9'he4 == idx_r ? $signed(14'shfc4) : $signed(_GEN_484); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_486 = 9'he5 == idx_r ? $signed(14'shfc8) : $signed(_GEN_485); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_487 = 9'he6 == idx_r ? $signed(14'shfcc) : $signed(_GEN_486); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_488 = 9'he7 == idx_r ? $signed(14'shfd0) : $signed(_GEN_487); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_489 = 9'he8 == idx_r ? $signed(14'shfd4) : $signed(_GEN_488); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_490 = 9'he9 == idx_r ? $signed(14'shfd7) : $signed(_GEN_489); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_491 = 9'hea == idx_r ? $signed(14'shfdb) : $signed(_GEN_490); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_492 = 9'heb == idx_r ? $signed(14'shfde) : $signed(_GEN_491); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_493 = 9'hec == idx_r ? $signed(14'shfe1) : $signed(_GEN_492); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_494 = 9'hed == idx_r ? $signed(14'shfe4) : $signed(_GEN_493); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_495 = 9'hee == idx_r ? $signed(14'shfe7) : $signed(_GEN_494); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_496 = 9'hef == idx_r ? $signed(14'shfea) : $signed(_GEN_495); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_497 = 9'hf0 == idx_r ? $signed(14'shfec) : $signed(_GEN_496); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_498 = 9'hf1 == idx_r ? $signed(14'shfef) : $signed(_GEN_497); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_499 = 9'hf2 == idx_r ? $signed(14'shff1) : $signed(_GEN_498); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_500 = 9'hf3 == idx_r ? $signed(14'shff3) : $signed(_GEN_499); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_501 = 9'hf4 == idx_r ? $signed(14'shff5) : $signed(_GEN_500); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_502 = 9'hf5 == idx_r ? $signed(14'shff7) : $signed(_GEN_501); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_503 = 9'hf6 == idx_r ? $signed(14'shff8) : $signed(_GEN_502); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_504 = 9'hf7 == idx_r ? $signed(14'shffa) : $signed(_GEN_503); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_505 = 9'hf8 == idx_r ? $signed(14'shffb) : $signed(_GEN_504); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_506 = 9'hf9 == idx_r ? $signed(14'shffc) : $signed(_GEN_505); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_507 = 9'hfa == idx_r ? $signed(14'shffd) : $signed(_GEN_506); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_508 = 9'hfb == idx_r ? $signed(14'shffe) : $signed(_GEN_507); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_509 = 9'hfc == idx_r ? $signed(14'shfff) : $signed(_GEN_508); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_510 = 9'hfd == idx_r ? $signed(14'shfff) : $signed(_GEN_509); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_511 = 9'hfe == idx_r ? $signed(14'sh1000) : $signed(_GEN_510); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_512 = 9'hff == idx_r ? $signed(14'sh1000) : $signed(_GEN_511); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_513 = 9'h100 == idx_r ? $signed(14'sh1000) : $signed(_GEN_512); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _io_wI_T_2 = 14'sh0 - $signed(_GEN_513); // @[FFTTwiddle.scala 54:35]
  assign io_wR = chg_sign_flag_r ? $signed(_io_wR_T_2) : $signed(_GEN_256); // @[FFTTwiddle.scala 53:17]
  assign io_wI = chg_sign_flag_i ? $signed(_io_wI_T_2) : $signed(_GEN_513); // @[FFTTwiddle.scala 54:17]
endmodule
module FFTTwiddle_1(
  input  [8:0]  io_nk,
  input  [1:0]  io_twiLutCaseIndex,
  output [13:0] io_wR,
  output [13:0] io_wI
);
  wire [8:0] _idx_r_pre_T_1 = ~io_nk; // @[FFTTwiddle.scala 36:51]
  wire [8:0] _idx_r_pre_T_3 = _idx_r_pre_T_1 + 9'h1; // @[FFTTwiddle.scala 36:58]
  wire [8:0] _idx_r_pre_T_4 = io_nk[8] ? _idx_r_pre_T_3 : io_nk; // @[FFTTwiddle.scala 36:24]
  wire [7:0] idx_r_pre = _idx_r_pre_T_4[7:0]; // @[FFTTwiddle.scala 36:72]
  wire  _idx_r_T_3 = idx_r_pre[7] & |idx_r_pre[6:0]; // @[FFTTwiddle.scala 38:54]
  wire [7:0] _idx_r_T_4 = ~idx_r_pre; // @[FFTTwiddle.scala 38:98]
  wire [7:0] _idx_r_T_6 = _idx_r_T_4 + 8'h1; // @[FFTTwiddle.scala 38:109]
  wire [7:0] idx_r = idx_r_pre[7] & |idx_r_pre[6:0] ? _idx_r_T_6 : idx_r_pre; // @[FFTTwiddle.scala 38:20]
  wire  lut_chg_sign_flag_i = ~io_nk[8]; // @[FFTTwiddle.scala 46:31]
  wire  chg_sign_flag_r = io_twiLutCaseIndex == 2'h2 ? ~_idx_r_T_3 : _idx_r_T_3; // @[FFTTwiddle.scala 50:30]
  wire  chg_sign_flag_i = io_twiLutCaseIndex == 2'h1 ? ~lut_chg_sign_flag_i : lut_chg_sign_flag_i; // @[FFTTwiddle.scala 51:30]
  wire [13:0] _GEN_2 = 8'h2 == idx_r ? $signed(14'shfff) : $signed(14'sh1000); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_3 = 8'h3 == idx_r ? $signed(14'shffd) : $signed(_GEN_2); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_4 = 8'h4 == idx_r ? $signed(14'shffb) : $signed(_GEN_3); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_5 = 8'h5 == idx_r ? $signed(14'shff8) : $signed(_GEN_4); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_6 = 8'h6 == idx_r ? $signed(14'shff5) : $signed(_GEN_5); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_7 = 8'h7 == idx_r ? $signed(14'shff1) : $signed(_GEN_6); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_8 = 8'h8 == idx_r ? $signed(14'shfec) : $signed(_GEN_7); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_9 = 8'h9 == idx_r ? $signed(14'shfe7) : $signed(_GEN_8); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_10 = 8'ha == idx_r ? $signed(14'shfe1) : $signed(_GEN_9); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_11 = 8'hb == idx_r ? $signed(14'shfdb) : $signed(_GEN_10); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_12 = 8'hc == idx_r ? $signed(14'shfd4) : $signed(_GEN_11); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_13 = 8'hd == idx_r ? $signed(14'shfcc) : $signed(_GEN_12); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_14 = 8'he == idx_r ? $signed(14'shfc4) : $signed(_GEN_13); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_15 = 8'hf == idx_r ? $signed(14'shfbb) : $signed(_GEN_14); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_16 = 8'h10 == idx_r ? $signed(14'shfb1) : $signed(_GEN_15); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_17 = 8'h11 == idx_r ? $signed(14'shfa7) : $signed(_GEN_16); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_18 = 8'h12 == idx_r ? $signed(14'shf9c) : $signed(_GEN_17); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_19 = 8'h13 == idx_r ? $signed(14'shf91) : $signed(_GEN_18); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_20 = 8'h14 == idx_r ? $signed(14'shf85) : $signed(_GEN_19); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_21 = 8'h15 == idx_r ? $signed(14'shf79) : $signed(_GEN_20); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_22 = 8'h16 == idx_r ? $signed(14'shf6c) : $signed(_GEN_21); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_23 = 8'h17 == idx_r ? $signed(14'shf5e) : $signed(_GEN_22); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_24 = 8'h18 == idx_r ? $signed(14'shf50) : $signed(_GEN_23); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_25 = 8'h19 == idx_r ? $signed(14'shf41) : $signed(_GEN_24); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_26 = 8'h1a == idx_r ? $signed(14'shf31) : $signed(_GEN_25); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_27 = 8'h1b == idx_r ? $signed(14'shf21) : $signed(_GEN_26); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_28 = 8'h1c == idx_r ? $signed(14'shf11) : $signed(_GEN_27); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_29 = 8'h1d == idx_r ? $signed(14'sheff) : $signed(_GEN_28); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_30 = 8'h1e == idx_r ? $signed(14'sheee) : $signed(_GEN_29); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_31 = 8'h1f == idx_r ? $signed(14'shedb) : $signed(_GEN_30); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_32 = 8'h20 == idx_r ? $signed(14'shec8) : $signed(_GEN_31); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_33 = 8'h21 == idx_r ? $signed(14'sheb5) : $signed(_GEN_32); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_34 = 8'h22 == idx_r ? $signed(14'shea1) : $signed(_GEN_33); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_35 = 8'h23 == idx_r ? $signed(14'she8c) : $signed(_GEN_34); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_36 = 8'h24 == idx_r ? $signed(14'she77) : $signed(_GEN_35); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_37 = 8'h25 == idx_r ? $signed(14'she61) : $signed(_GEN_36); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_38 = 8'h26 == idx_r ? $signed(14'she4b) : $signed(_GEN_37); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_39 = 8'h27 == idx_r ? $signed(14'she34) : $signed(_GEN_38); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_40 = 8'h28 == idx_r ? $signed(14'she1c) : $signed(_GEN_39); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_41 = 8'h29 == idx_r ? $signed(14'she04) : $signed(_GEN_40); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_42 = 8'h2a == idx_r ? $signed(14'shdec) : $signed(_GEN_41); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_43 = 8'h2b == idx_r ? $signed(14'shdd3) : $signed(_GEN_42); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_44 = 8'h2c == idx_r ? $signed(14'shdb9) : $signed(_GEN_43); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_45 = 8'h2d == idx_r ? $signed(14'shd9f) : $signed(_GEN_44); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_46 = 8'h2e == idx_r ? $signed(14'shd85) : $signed(_GEN_45); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_47 = 8'h2f == idx_r ? $signed(14'shd69) : $signed(_GEN_46); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_48 = 8'h30 == idx_r ? $signed(14'shd4e) : $signed(_GEN_47); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_49 = 8'h31 == idx_r ? $signed(14'shd32) : $signed(_GEN_48); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_50 = 8'h32 == idx_r ? $signed(14'shd15) : $signed(_GEN_49); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_51 = 8'h33 == idx_r ? $signed(14'shcf8) : $signed(_GEN_50); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_52 = 8'h34 == idx_r ? $signed(14'shcda) : $signed(_GEN_51); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_53 = 8'h35 == idx_r ? $signed(14'shcbc) : $signed(_GEN_52); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_54 = 8'h36 == idx_r ? $signed(14'shc9d) : $signed(_GEN_53); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_55 = 8'h37 == idx_r ? $signed(14'shc7e) : $signed(_GEN_54); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_56 = 8'h38 == idx_r ? $signed(14'shc5e) : $signed(_GEN_55); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_57 = 8'h39 == idx_r ? $signed(14'shc3e) : $signed(_GEN_56); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_58 = 8'h3a == idx_r ? $signed(14'shc1e) : $signed(_GEN_57); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_59 = 8'h3b == idx_r ? $signed(14'shbfc) : $signed(_GEN_58); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_60 = 8'h3c == idx_r ? $signed(14'shbdb) : $signed(_GEN_59); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_61 = 8'h3d == idx_r ? $signed(14'shbb9) : $signed(_GEN_60); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_62 = 8'h3e == idx_r ? $signed(14'shb97) : $signed(_GEN_61); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_63 = 8'h3f == idx_r ? $signed(14'shb74) : $signed(_GEN_62); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_64 = 8'h40 == idx_r ? $signed(14'shb50) : $signed(_GEN_63); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_65 = 8'h41 == idx_r ? $signed(14'shb2d) : $signed(_GEN_64); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_66 = 8'h42 == idx_r ? $signed(14'shb08) : $signed(_GEN_65); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_67 = 8'h43 == idx_r ? $signed(14'shae4) : $signed(_GEN_66); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_68 = 8'h44 == idx_r ? $signed(14'shabf) : $signed(_GEN_67); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_69 = 8'h45 == idx_r ? $signed(14'sha99) : $signed(_GEN_68); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_70 = 8'h46 == idx_r ? $signed(14'sha73) : $signed(_GEN_69); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_71 = 8'h47 == idx_r ? $signed(14'sha4d) : $signed(_GEN_70); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_72 = 8'h48 == idx_r ? $signed(14'sha26) : $signed(_GEN_71); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_73 = 8'h49 == idx_r ? $signed(14'sh9ff) : $signed(_GEN_72); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_74 = 8'h4a == idx_r ? $signed(14'sh9d8) : $signed(_GEN_73); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_75 = 8'h4b == idx_r ? $signed(14'sh9b0) : $signed(_GEN_74); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_76 = 8'h4c == idx_r ? $signed(14'sh988) : $signed(_GEN_75); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_77 = 8'h4d == idx_r ? $signed(14'sh95f) : $signed(_GEN_76); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_78 = 8'h4e == idx_r ? $signed(14'sh937) : $signed(_GEN_77); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_79 = 8'h4f == idx_r ? $signed(14'sh90d) : $signed(_GEN_78); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_80 = 8'h50 == idx_r ? $signed(14'sh8e4) : $signed(_GEN_79); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_81 = 8'h51 == idx_r ? $signed(14'sh8ba) : $signed(_GEN_80); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_82 = 8'h52 == idx_r ? $signed(14'sh88f) : $signed(_GEN_81); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_83 = 8'h53 == idx_r ? $signed(14'sh865) : $signed(_GEN_82); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_84 = 8'h54 == idx_r ? $signed(14'sh83a) : $signed(_GEN_83); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_85 = 8'h55 == idx_r ? $signed(14'sh80e) : $signed(_GEN_84); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_86 = 8'h56 == idx_r ? $signed(14'sh7e3) : $signed(_GEN_85); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_87 = 8'h57 == idx_r ? $signed(14'sh7b7) : $signed(_GEN_86); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_88 = 8'h58 == idx_r ? $signed(14'sh78b) : $signed(_GEN_87); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_89 = 8'h59 == idx_r ? $signed(14'sh75e) : $signed(_GEN_88); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_90 = 8'h5a == idx_r ? $signed(14'sh732) : $signed(_GEN_89); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_91 = 8'h5b == idx_r ? $signed(14'sh705) : $signed(_GEN_90); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_92 = 8'h5c == idx_r ? $signed(14'sh6d7) : $signed(_GEN_91); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_93 = 8'h5d == idx_r ? $signed(14'sh6aa) : $signed(_GEN_92); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_94 = 8'h5e == idx_r ? $signed(14'sh67c) : $signed(_GEN_93); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_95 = 8'h5f == idx_r ? $signed(14'sh64e) : $signed(_GEN_94); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_96 = 8'h60 == idx_r ? $signed(14'sh61f) : $signed(_GEN_95); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_97 = 8'h61 == idx_r ? $signed(14'sh5f1) : $signed(_GEN_96); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_98 = 8'h62 == idx_r ? $signed(14'sh5c2) : $signed(_GEN_97); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_99 = 8'h63 == idx_r ? $signed(14'sh593) : $signed(_GEN_98); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_100 = 8'h64 == idx_r ? $signed(14'sh564) : $signed(_GEN_99); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_101 = 8'h65 == idx_r ? $signed(14'sh534) : $signed(_GEN_100); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_102 = 8'h66 == idx_r ? $signed(14'sh505) : $signed(_GEN_101); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_103 = 8'h67 == idx_r ? $signed(14'sh4d5) : $signed(_GEN_102); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_104 = 8'h68 == idx_r ? $signed(14'sh4a5) : $signed(_GEN_103); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_105 = 8'h69 == idx_r ? $signed(14'sh475) : $signed(_GEN_104); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_106 = 8'h6a == idx_r ? $signed(14'sh444) : $signed(_GEN_105); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_107 = 8'h6b == idx_r ? $signed(14'sh414) : $signed(_GEN_106); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_108 = 8'h6c == idx_r ? $signed(14'sh3e3) : $signed(_GEN_107); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_109 = 8'h6d == idx_r ? $signed(14'sh3b2) : $signed(_GEN_108); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_110 = 8'h6e == idx_r ? $signed(14'sh381) : $signed(_GEN_109); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_111 = 8'h6f == idx_r ? $signed(14'sh350) : $signed(_GEN_110); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_112 = 8'h70 == idx_r ? $signed(14'sh31f) : $signed(_GEN_111); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_113 = 8'h71 == idx_r ? $signed(14'sh2ee) : $signed(_GEN_112); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_114 = 8'h72 == idx_r ? $signed(14'sh2bc) : $signed(_GEN_113); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_115 = 8'h73 == idx_r ? $signed(14'sh28b) : $signed(_GEN_114); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_116 = 8'h74 == idx_r ? $signed(14'sh259) : $signed(_GEN_115); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_117 = 8'h75 == idx_r ? $signed(14'sh227) : $signed(_GEN_116); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_118 = 8'h76 == idx_r ? $signed(14'sh1f5) : $signed(_GEN_117); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_119 = 8'h77 == idx_r ? $signed(14'sh1c3) : $signed(_GEN_118); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_120 = 8'h78 == idx_r ? $signed(14'sh191) : $signed(_GEN_119); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_121 = 8'h79 == idx_r ? $signed(14'sh15f) : $signed(_GEN_120); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_122 = 8'h7a == idx_r ? $signed(14'sh12d) : $signed(_GEN_121); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_123 = 8'h7b == idx_r ? $signed(14'shfb) : $signed(_GEN_122); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_124 = 8'h7c == idx_r ? $signed(14'shc9) : $signed(_GEN_123); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_125 = 8'h7d == idx_r ? $signed(14'sh97) : $signed(_GEN_124); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_126 = 8'h7e == idx_r ? $signed(14'sh65) : $signed(_GEN_125); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_127 = 8'h7f == idx_r ? $signed(14'sh32) : $signed(_GEN_126); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_128 = 8'h80 == idx_r ? $signed(14'sh0) : $signed(_GEN_127); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _io_wR_T_2 = 14'sh0 - $signed(_GEN_128); // @[FFTTwiddle.scala 53:35]
  wire [13:0] _GEN_130 = 8'h1 == idx_r ? $signed(14'sh32) : $signed(14'sh0); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_131 = 8'h2 == idx_r ? $signed(14'sh65) : $signed(_GEN_130); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_132 = 8'h3 == idx_r ? $signed(14'sh97) : $signed(_GEN_131); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_133 = 8'h4 == idx_r ? $signed(14'shc9) : $signed(_GEN_132); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_134 = 8'h5 == idx_r ? $signed(14'shfb) : $signed(_GEN_133); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_135 = 8'h6 == idx_r ? $signed(14'sh12d) : $signed(_GEN_134); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_136 = 8'h7 == idx_r ? $signed(14'sh15f) : $signed(_GEN_135); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_137 = 8'h8 == idx_r ? $signed(14'sh191) : $signed(_GEN_136); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_138 = 8'h9 == idx_r ? $signed(14'sh1c3) : $signed(_GEN_137); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_139 = 8'ha == idx_r ? $signed(14'sh1f5) : $signed(_GEN_138); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_140 = 8'hb == idx_r ? $signed(14'sh227) : $signed(_GEN_139); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_141 = 8'hc == idx_r ? $signed(14'sh259) : $signed(_GEN_140); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_142 = 8'hd == idx_r ? $signed(14'sh28b) : $signed(_GEN_141); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_143 = 8'he == idx_r ? $signed(14'sh2bc) : $signed(_GEN_142); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_144 = 8'hf == idx_r ? $signed(14'sh2ee) : $signed(_GEN_143); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_145 = 8'h10 == idx_r ? $signed(14'sh31f) : $signed(_GEN_144); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_146 = 8'h11 == idx_r ? $signed(14'sh350) : $signed(_GEN_145); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_147 = 8'h12 == idx_r ? $signed(14'sh381) : $signed(_GEN_146); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_148 = 8'h13 == idx_r ? $signed(14'sh3b2) : $signed(_GEN_147); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_149 = 8'h14 == idx_r ? $signed(14'sh3e3) : $signed(_GEN_148); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_150 = 8'h15 == idx_r ? $signed(14'sh414) : $signed(_GEN_149); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_151 = 8'h16 == idx_r ? $signed(14'sh444) : $signed(_GEN_150); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_152 = 8'h17 == idx_r ? $signed(14'sh475) : $signed(_GEN_151); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_153 = 8'h18 == idx_r ? $signed(14'sh4a5) : $signed(_GEN_152); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_154 = 8'h19 == idx_r ? $signed(14'sh4d5) : $signed(_GEN_153); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_155 = 8'h1a == idx_r ? $signed(14'sh505) : $signed(_GEN_154); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_156 = 8'h1b == idx_r ? $signed(14'sh534) : $signed(_GEN_155); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_157 = 8'h1c == idx_r ? $signed(14'sh564) : $signed(_GEN_156); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_158 = 8'h1d == idx_r ? $signed(14'sh593) : $signed(_GEN_157); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_159 = 8'h1e == idx_r ? $signed(14'sh5c2) : $signed(_GEN_158); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_160 = 8'h1f == idx_r ? $signed(14'sh5f1) : $signed(_GEN_159); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_161 = 8'h20 == idx_r ? $signed(14'sh61f) : $signed(_GEN_160); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_162 = 8'h21 == idx_r ? $signed(14'sh64e) : $signed(_GEN_161); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_163 = 8'h22 == idx_r ? $signed(14'sh67c) : $signed(_GEN_162); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_164 = 8'h23 == idx_r ? $signed(14'sh6aa) : $signed(_GEN_163); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_165 = 8'h24 == idx_r ? $signed(14'sh6d7) : $signed(_GEN_164); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_166 = 8'h25 == idx_r ? $signed(14'sh705) : $signed(_GEN_165); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_167 = 8'h26 == idx_r ? $signed(14'sh732) : $signed(_GEN_166); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_168 = 8'h27 == idx_r ? $signed(14'sh75e) : $signed(_GEN_167); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_169 = 8'h28 == idx_r ? $signed(14'sh78b) : $signed(_GEN_168); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_170 = 8'h29 == idx_r ? $signed(14'sh7b7) : $signed(_GEN_169); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_171 = 8'h2a == idx_r ? $signed(14'sh7e3) : $signed(_GEN_170); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_172 = 8'h2b == idx_r ? $signed(14'sh80e) : $signed(_GEN_171); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_173 = 8'h2c == idx_r ? $signed(14'sh83a) : $signed(_GEN_172); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_174 = 8'h2d == idx_r ? $signed(14'sh865) : $signed(_GEN_173); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_175 = 8'h2e == idx_r ? $signed(14'sh88f) : $signed(_GEN_174); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_176 = 8'h2f == idx_r ? $signed(14'sh8ba) : $signed(_GEN_175); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_177 = 8'h30 == idx_r ? $signed(14'sh8e4) : $signed(_GEN_176); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_178 = 8'h31 == idx_r ? $signed(14'sh90d) : $signed(_GEN_177); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_179 = 8'h32 == idx_r ? $signed(14'sh937) : $signed(_GEN_178); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_180 = 8'h33 == idx_r ? $signed(14'sh95f) : $signed(_GEN_179); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_181 = 8'h34 == idx_r ? $signed(14'sh988) : $signed(_GEN_180); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_182 = 8'h35 == idx_r ? $signed(14'sh9b0) : $signed(_GEN_181); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_183 = 8'h36 == idx_r ? $signed(14'sh9d8) : $signed(_GEN_182); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_184 = 8'h37 == idx_r ? $signed(14'sh9ff) : $signed(_GEN_183); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_185 = 8'h38 == idx_r ? $signed(14'sha26) : $signed(_GEN_184); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_186 = 8'h39 == idx_r ? $signed(14'sha4d) : $signed(_GEN_185); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_187 = 8'h3a == idx_r ? $signed(14'sha73) : $signed(_GEN_186); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_188 = 8'h3b == idx_r ? $signed(14'sha99) : $signed(_GEN_187); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_189 = 8'h3c == idx_r ? $signed(14'shabf) : $signed(_GEN_188); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_190 = 8'h3d == idx_r ? $signed(14'shae4) : $signed(_GEN_189); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_191 = 8'h3e == idx_r ? $signed(14'shb08) : $signed(_GEN_190); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_192 = 8'h3f == idx_r ? $signed(14'shb2d) : $signed(_GEN_191); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_193 = 8'h40 == idx_r ? $signed(14'shb50) : $signed(_GEN_192); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_194 = 8'h41 == idx_r ? $signed(14'shb74) : $signed(_GEN_193); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_195 = 8'h42 == idx_r ? $signed(14'shb97) : $signed(_GEN_194); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_196 = 8'h43 == idx_r ? $signed(14'shbb9) : $signed(_GEN_195); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_197 = 8'h44 == idx_r ? $signed(14'shbdb) : $signed(_GEN_196); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_198 = 8'h45 == idx_r ? $signed(14'shbfc) : $signed(_GEN_197); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_199 = 8'h46 == idx_r ? $signed(14'shc1e) : $signed(_GEN_198); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_200 = 8'h47 == idx_r ? $signed(14'shc3e) : $signed(_GEN_199); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_201 = 8'h48 == idx_r ? $signed(14'shc5e) : $signed(_GEN_200); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_202 = 8'h49 == idx_r ? $signed(14'shc7e) : $signed(_GEN_201); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_203 = 8'h4a == idx_r ? $signed(14'shc9d) : $signed(_GEN_202); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_204 = 8'h4b == idx_r ? $signed(14'shcbc) : $signed(_GEN_203); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_205 = 8'h4c == idx_r ? $signed(14'shcda) : $signed(_GEN_204); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_206 = 8'h4d == idx_r ? $signed(14'shcf8) : $signed(_GEN_205); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_207 = 8'h4e == idx_r ? $signed(14'shd15) : $signed(_GEN_206); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_208 = 8'h4f == idx_r ? $signed(14'shd32) : $signed(_GEN_207); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_209 = 8'h50 == idx_r ? $signed(14'shd4e) : $signed(_GEN_208); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_210 = 8'h51 == idx_r ? $signed(14'shd69) : $signed(_GEN_209); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_211 = 8'h52 == idx_r ? $signed(14'shd85) : $signed(_GEN_210); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_212 = 8'h53 == idx_r ? $signed(14'shd9f) : $signed(_GEN_211); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_213 = 8'h54 == idx_r ? $signed(14'shdb9) : $signed(_GEN_212); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_214 = 8'h55 == idx_r ? $signed(14'shdd3) : $signed(_GEN_213); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_215 = 8'h56 == idx_r ? $signed(14'shdec) : $signed(_GEN_214); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_216 = 8'h57 == idx_r ? $signed(14'she04) : $signed(_GEN_215); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_217 = 8'h58 == idx_r ? $signed(14'she1c) : $signed(_GEN_216); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_218 = 8'h59 == idx_r ? $signed(14'she34) : $signed(_GEN_217); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_219 = 8'h5a == idx_r ? $signed(14'she4b) : $signed(_GEN_218); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_220 = 8'h5b == idx_r ? $signed(14'she61) : $signed(_GEN_219); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_221 = 8'h5c == idx_r ? $signed(14'she77) : $signed(_GEN_220); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_222 = 8'h5d == idx_r ? $signed(14'she8c) : $signed(_GEN_221); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_223 = 8'h5e == idx_r ? $signed(14'shea1) : $signed(_GEN_222); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_224 = 8'h5f == idx_r ? $signed(14'sheb5) : $signed(_GEN_223); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_225 = 8'h60 == idx_r ? $signed(14'shec8) : $signed(_GEN_224); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_226 = 8'h61 == idx_r ? $signed(14'shedb) : $signed(_GEN_225); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_227 = 8'h62 == idx_r ? $signed(14'sheee) : $signed(_GEN_226); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_228 = 8'h63 == idx_r ? $signed(14'sheff) : $signed(_GEN_227); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_229 = 8'h64 == idx_r ? $signed(14'shf11) : $signed(_GEN_228); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_230 = 8'h65 == idx_r ? $signed(14'shf21) : $signed(_GEN_229); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_231 = 8'h66 == idx_r ? $signed(14'shf31) : $signed(_GEN_230); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_232 = 8'h67 == idx_r ? $signed(14'shf41) : $signed(_GEN_231); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_233 = 8'h68 == idx_r ? $signed(14'shf50) : $signed(_GEN_232); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_234 = 8'h69 == idx_r ? $signed(14'shf5e) : $signed(_GEN_233); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_235 = 8'h6a == idx_r ? $signed(14'shf6c) : $signed(_GEN_234); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_236 = 8'h6b == idx_r ? $signed(14'shf79) : $signed(_GEN_235); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_237 = 8'h6c == idx_r ? $signed(14'shf85) : $signed(_GEN_236); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_238 = 8'h6d == idx_r ? $signed(14'shf91) : $signed(_GEN_237); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_239 = 8'h6e == idx_r ? $signed(14'shf9c) : $signed(_GEN_238); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_240 = 8'h6f == idx_r ? $signed(14'shfa7) : $signed(_GEN_239); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_241 = 8'h70 == idx_r ? $signed(14'shfb1) : $signed(_GEN_240); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_242 = 8'h71 == idx_r ? $signed(14'shfbb) : $signed(_GEN_241); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_243 = 8'h72 == idx_r ? $signed(14'shfc4) : $signed(_GEN_242); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_244 = 8'h73 == idx_r ? $signed(14'shfcc) : $signed(_GEN_243); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_245 = 8'h74 == idx_r ? $signed(14'shfd4) : $signed(_GEN_244); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_246 = 8'h75 == idx_r ? $signed(14'shfdb) : $signed(_GEN_245); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_247 = 8'h76 == idx_r ? $signed(14'shfe1) : $signed(_GEN_246); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_248 = 8'h77 == idx_r ? $signed(14'shfe7) : $signed(_GEN_247); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_249 = 8'h78 == idx_r ? $signed(14'shfec) : $signed(_GEN_248); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_250 = 8'h79 == idx_r ? $signed(14'shff1) : $signed(_GEN_249); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_251 = 8'h7a == idx_r ? $signed(14'shff5) : $signed(_GEN_250); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_252 = 8'h7b == idx_r ? $signed(14'shff8) : $signed(_GEN_251); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_253 = 8'h7c == idx_r ? $signed(14'shffb) : $signed(_GEN_252); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_254 = 8'h7d == idx_r ? $signed(14'shffd) : $signed(_GEN_253); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_255 = 8'h7e == idx_r ? $signed(14'shfff) : $signed(_GEN_254); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_256 = 8'h7f == idx_r ? $signed(14'sh1000) : $signed(_GEN_255); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_257 = 8'h80 == idx_r ? $signed(14'sh1000) : $signed(_GEN_256); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _io_wI_T_2 = 14'sh0 - $signed(_GEN_257); // @[FFTTwiddle.scala 54:35]
  assign io_wR = chg_sign_flag_r ? $signed(_io_wR_T_2) : $signed(_GEN_128); // @[FFTTwiddle.scala 53:17]
  assign io_wI = chg_sign_flag_i ? $signed(_io_wI_T_2) : $signed(_GEN_257); // @[FFTTwiddle.scala 54:17]
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
  input  [7:0]  io_radixCount,
  input  [1:0]  io_calcMode,
  input  [1:0]  io_phaseCount,
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
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
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
  wire [9:0] twiddleUnits_0_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_0_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_0_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_0_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [8:0] twiddleUnits_1_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_1_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_1_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_1_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [8:0] twiddleUnits_2_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_2_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_2_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_2_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [8:0] twiddleUnits_3_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_3_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_3_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_3_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [8:0] twiddleUnits_4_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_4_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_4_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_4_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [8:0] twiddleUnits_5_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_5_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_5_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_5_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [8:0] twiddleUnits_6_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
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
  wire [7:0] _twiLutIdxPre_T_1 = 2'h0 == io_phaseCount ? io_radixCount : 8'h0; // @[Mux.scala 81:58]
  wire [7:0] _twiLutIdxPre_T_3 = 2'h1 == io_phaseCount ? {{3'd0}, io_radixCount[7:3]} : _twiLutIdxPre_T_1; // @[Mux.scala 81:58]
  reg [5:0] twiLutIdxPre1c; // @[Reg.scala 35:20]
  wire [5:0] twiLutIdxPre = _twiLutIdxPre_T_3[5:0]; // @[FFT3PipelineR23Calc.scala 74:28 75:18]
  reg [7:0] radixCount1c; // @[Reg.scala 35:20]
  wire [8:0] _twiddleUnits_0_io_nk_T = 3'h1 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 80:81]
  wire [3:0] _twiddleUnits_0_io_nk_T_1 = io_phaseCount * 2'h3; // @[FFT3PipelineR23Calc.scala 80:117]
  wire [23:0] _GEN_0 = {{15'd0}, _twiddleUnits_0_io_nk_T}; // @[FFT3PipelineR23Calc.scala 80:99]
  wire [23:0] _twiddleUnits_0_io_nk_T_2 = _GEN_0 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 80:99]
  wire [24:0] _twiddleUnits_0_io_nk_T_3 = {_twiddleUnits_0_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [8:0] _twiddleUnits_1_io_nk_T = 3'h2 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [23:0] _GEN_27 = {{15'd0}, _twiddleUnits_1_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [23:0] _twiddleUnits_1_io_nk_T_2 = _GEN_27 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [8:0] _twiddleUnits_2_io_nk_T = 3'h3 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [23:0] _GEN_28 = {{15'd0}, _twiddleUnits_2_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [23:0] _twiddleUnits_2_io_nk_T_2 = _GEN_28 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [8:0] _twiddleUnits_3_io_nk_T = 3'h4 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [23:0] _GEN_36 = {{15'd0}, _twiddleUnits_3_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [23:0] _twiddleUnits_3_io_nk_T_2 = _GEN_36 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [8:0] _twiddleUnits_4_io_nk_T = 3'h5 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [23:0] _GEN_37 = {{15'd0}, _twiddleUnits_4_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [23:0] _twiddleUnits_4_io_nk_T_2 = _GEN_37 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [8:0] _twiddleUnits_5_io_nk_T = 3'h6 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [23:0] _GEN_70 = {{15'd0}, _twiddleUnits_5_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [23:0] _twiddleUnits_5_io_nk_T_2 = _GEN_70 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [8:0] _twiddleUnits_6_io_nk_T = 3'h7 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [23:0] _GEN_71 = {{15'd0}, _twiddleUnits_6_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [23:0] _twiddleUnits_6_io_nk_T_2 = _GEN_71 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
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
  wire  _T_4 = io_calcMode == 2'h1; // @[FFT3PipelineR23Calc.scala 218:29]
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
  wire [15:0] _GEN_101 = _T_4 & io_procMode ? $signed(multiplyUnits_7_io_product_re) : $signed(data2c_1_re_r); // @[FFT3PipelineR23Calc.scala 235:53 248:22 267:25]
  wire [15:0] _GEN_137 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data2c_1_re_r) : $signed(_GEN_101); // @[FFT3PipelineR23Calc.scala 218:54 228:26]
  reg [15:0] data3c_1_im_r; // @[Reg.scala 35:20]
  wire [15:0] data3cPrePre_1_im = $signed(data2c_1_im_r) + $signed(data2c_3_im_r); // @[FFT3PipelineR23Calc.scala 153:44]
  wire [15:0] _data3cPre_1_im_T_2 = 16'sh0 - $signed(data2c_1_im_r); // @[FFT3PipelineR23Calc.scala 268:28]
  wire [15:0] _GEN_100 = _T_4 & io_procMode ? $signed(multiplyUnits_7_io_product_im) : $signed(_data3cPre_1_im_T_2); // @[FFT3PipelineR23Calc.scala 235:53 248:22 268:25]
  wire [15:0] _GEN_136 = io_calcMode == 2'h1 & ~io_procMode ? $signed(data2c_1_im_r) : $signed(_GEN_100); // @[FFT3PipelineR23Calc.scala 218:54 228:26]
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
  FFTTwiddle_1 twiddleUnits_1 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_1_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_1_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_1_io_wR),
    .io_wI(twiddleUnits_1_io_wI)
  );
  FFTTwiddle_1 twiddleUnits_2 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_2_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_2_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_2_io_wR),
    .io_wI(twiddleUnits_2_io_wI)
  );
  FFTTwiddle_1 twiddleUnits_3 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_3_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_3_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_3_io_wR),
    .io_wI(twiddleUnits_3_io_wI)
  );
  FFTTwiddle_1 twiddleUnits_4 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_4_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_4_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_4_io_wR),
    .io_wI(twiddleUnits_4_io_wI)
  );
  FFTTwiddle_1 twiddleUnits_5 ( // @[FFT3PipelineR23Calc.scala 41:52]
    .io_nk(twiddleUnits_5_io_nk),
    .io_twiLutCaseIndex(twiddleUnits_5_io_twiLutCaseIndex),
    .io_wR(twiddleUnits_5_io_wR),
    .io_wI(twiddleUnits_5_io_wI)
  );
  FFTTwiddle_1 twiddleUnits_6 ( // @[FFT3PipelineR23Calc.scala 41:52]
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
  assign multiplyUnits_7_io_data_im = io_procMode ? $signed(data2c_1_im_r) : $signed(data3cPrePre_5_im); // @[FFT3PipelineR23Calc.scala 120:36]
  assign multiplyUnits_7_io_data_re = io_procMode ? $signed(data2c_1_re_r) : $signed(data3cPrePre_5_re); // @[FFT3PipelineR23Calc.scala 120:36]
  assign multiplyUnits_7_io_wR = io_procMode ? $signed(wR2c_0_r) : $signed(wR2c_7_r); // @[FFT3PipelineR23Calc.scala 121:34]
  assign multiplyUnits_7_io_wI = io_procMode ? $signed(wI2c_0_r) : $signed(wI2c_7_r); // @[FFT3PipelineR23Calc.scala 122:34]
  assign multiplyUnits_8_io_data_im = $signed(data2c_5_im_r) - $signed(data2c_7_im_r); // @[FFT3PipelineR23Calc.scala 155:48]
  assign multiplyUnits_8_io_data_re = $signed(data2c_5_re_r) - $signed(data2c_7_re_r); // @[FFT3PipelineR23Calc.scala 154:48]
  assign multiplyUnits_8_io_wR = wR2c_8_r; // @[FFT3PipelineR23Calc.scala 57:20 99:12]
  assign multiplyUnits_8_io_wI = wI2c_8_r; // @[FFT3PipelineR23Calc.scala 103:12 58:20]
  assign twiddleUnits_0_io_nk = io_procMode ? {{2'd0}, radixCount1c} : _twiddleUnits_0_io_nk_T_3[9:0]; // @[FFT3PipelineR23Calc.scala 80:33]
  assign twiddleUnits_0_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_1_io_nk = _twiddleUnits_1_io_nk_T_2[8:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_1_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_2_io_nk = _twiddleUnits_2_io_nk_T_2[8:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_2_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_3_io_nk = _twiddleUnits_3_io_nk_T_2[8:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_3_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_4_io_nk = _twiddleUnits_4_io_nk_T_2[8:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_4_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_5_io_nk = _twiddleUnits_5_io_nk_T_2[8:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_5_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_6_io_nk = _twiddleUnits_6_io_nk_T_2[8:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_6_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      twiLutIdxPre1c <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      twiLutIdxPre1c <= twiLutIdxPre;
    end
    if (reset) begin // @[Reg.scala 35:20]
      radixCount1c <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_procMode) begin // @[Reg.scala 36:18]
      radixCount1c <= io_radixCount; // @[Reg.scala 36:22]
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
        data3c_1_re_r <= _GEN_137;
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
  twiLutIdxPre1c = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  radixCount1c = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  wR2c_0_r = _RAND_2[13:0];
  _RAND_3 = {1{`RANDOM}};
  wR2c_1_r = _RAND_3[13:0];
  _RAND_4 = {1{`RANDOM}};
  wR2c_2_r = _RAND_4[13:0];
  _RAND_5 = {1{`RANDOM}};
  wR2c_3_r = _RAND_5[13:0];
  _RAND_6 = {1{`RANDOM}};
  wR2c_4_r = _RAND_6[13:0];
  _RAND_7 = {1{`RANDOM}};
  wR2c_5_r = _RAND_7[13:0];
  _RAND_8 = {1{`RANDOM}};
  wR2c_6_r = _RAND_8[13:0];
  _RAND_9 = {1{`RANDOM}};
  wR2c_7_r = _RAND_9[13:0];
  _RAND_10 = {1{`RANDOM}};
  wR2c_8_r = _RAND_10[13:0];
  _RAND_11 = {1{`RANDOM}};
  wI2c_0_r = _RAND_11[13:0];
  _RAND_12 = {1{`RANDOM}};
  wI2c_1_r = _RAND_12[13:0];
  _RAND_13 = {1{`RANDOM}};
  wI2c_2_r = _RAND_13[13:0];
  _RAND_14 = {1{`RANDOM}};
  wI2c_3_r = _RAND_14[13:0];
  _RAND_15 = {1{`RANDOM}};
  wI2c_4_r = _RAND_15[13:0];
  _RAND_16 = {1{`RANDOM}};
  wI2c_5_r = _RAND_16[13:0];
  _RAND_17 = {1{`RANDOM}};
  wI2c_6_r = _RAND_17[13:0];
  _RAND_18 = {1{`RANDOM}};
  wI2c_7_r = _RAND_18[13:0];
  _RAND_19 = {1{`RANDOM}};
  wI2c_8_r = _RAND_19[13:0];
  _RAND_20 = {1{`RANDOM}};
  wR3c_0_r = _RAND_20[13:0];
  _RAND_21 = {1{`RANDOM}};
  wR3c_1_r = _RAND_21[13:0];
  _RAND_22 = {1{`RANDOM}};
  wR3c_2_r = _RAND_22[13:0];
  _RAND_23 = {1{`RANDOM}};
  wR3c_3_r = _RAND_23[13:0];
  _RAND_24 = {1{`RANDOM}};
  wR3c_4_r = _RAND_24[13:0];
  _RAND_25 = {1{`RANDOM}};
  wR3c_5_r = _RAND_25[13:0];
  _RAND_26 = {1{`RANDOM}};
  wR3c_6_r = _RAND_26[13:0];
  _RAND_27 = {1{`RANDOM}};
  wI3c_0_r = _RAND_27[13:0];
  _RAND_28 = {1{`RANDOM}};
  wI3c_1_r = _RAND_28[13:0];
  _RAND_29 = {1{`RANDOM}};
  wI3c_2_r = _RAND_29[13:0];
  _RAND_30 = {1{`RANDOM}};
  wI3c_3_r = _RAND_30[13:0];
  _RAND_31 = {1{`RANDOM}};
  wI3c_4_r = _RAND_31[13:0];
  _RAND_32 = {1{`RANDOM}};
  wI3c_5_r = _RAND_32[13:0];
  _RAND_33 = {1{`RANDOM}};
  wI3c_6_r = _RAND_33[13:0];
  _RAND_34 = {1{`RANDOM}};
  data2c_1_im_r = _RAND_34[15:0];
  _RAND_35 = {1{`RANDOM}};
  data2c_5_im_r = _RAND_35[15:0];
  _RAND_36 = {1{`RANDOM}};
  data2c_7_im_r = _RAND_36[15:0];
  _RAND_37 = {1{`RANDOM}};
  data2c_1_re_r = _RAND_37[15:0];
  _RAND_38 = {1{`RANDOM}};
  data2c_5_re_r = _RAND_38[15:0];
  _RAND_39 = {1{`RANDOM}};
  data2c_7_re_r = _RAND_39[15:0];
  _RAND_40 = {1{`RANDOM}};
  data2c_0_re_r = _RAND_40[15:0];
  _RAND_41 = {1{`RANDOM}};
  data2c_0_im_r = _RAND_41[15:0];
  _RAND_42 = {1{`RANDOM}};
  data2c_2_re_r = _RAND_42[15:0];
  _RAND_43 = {1{`RANDOM}};
  data2c_2_im_r = _RAND_43[15:0];
  _RAND_44 = {1{`RANDOM}};
  data2c_3_re_r = _RAND_44[15:0];
  _RAND_45 = {1{`RANDOM}};
  data2c_3_im_r = _RAND_45[15:0];
  _RAND_46 = {1{`RANDOM}};
  data2c_4_re_r = _RAND_46[15:0];
  _RAND_47 = {1{`RANDOM}};
  data2c_4_im_r = _RAND_47[15:0];
  _RAND_48 = {1{`RANDOM}};
  data2c_6_re_r = _RAND_48[15:0];
  _RAND_49 = {1{`RANDOM}};
  data2c_6_im_r = _RAND_49[15:0];
  _RAND_50 = {1{`RANDOM}};
  data3c_0_re_r = _RAND_50[15:0];
  _RAND_51 = {1{`RANDOM}};
  data3c_0_im_r = _RAND_51[15:0];
  _RAND_52 = {1{`RANDOM}};
  data3c_1_re_r = _RAND_52[15:0];
  _RAND_53 = {1{`RANDOM}};
  data3c_1_im_r = _RAND_53[15:0];
  _RAND_54 = {1{`RANDOM}};
  data3c_2_re_r = _RAND_54[15:0];
  _RAND_55 = {1{`RANDOM}};
  data3c_2_im_r = _RAND_55[15:0];
  _RAND_56 = {1{`RANDOM}};
  data3c_3_re_r = _RAND_56[15:0];
  _RAND_57 = {1{`RANDOM}};
  data3c_3_im_r = _RAND_57[15:0];
  _RAND_58 = {1{`RANDOM}};
  data3c_4_re_r = _RAND_58[15:0];
  _RAND_59 = {1{`RANDOM}};
  data3c_4_im_r = _RAND_59[15:0];
  _RAND_60 = {1{`RANDOM}};
  data3c_5_re_r = _RAND_60[15:0];
  _RAND_61 = {1{`RANDOM}};
  data3c_5_im_r = _RAND_61[15:0];
  _RAND_62 = {1{`RANDOM}};
  data3c_6_re_r = _RAND_62[15:0];
  _RAND_63 = {1{`RANDOM}};
  data3c_6_im_r = _RAND_63[15:0];
  _RAND_64 = {1{`RANDOM}};
  data3c_7_re_r = _RAND_64[15:0];
  _RAND_65 = {1{`RANDOM}};
  data3c_7_im_r = _RAND_65[15:0];
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
  output [5:0]  io_addrSram0Bank_0,
  output [5:0]  io_addrSram0Bank_1,
  output [5:0]  io_addrSram0Bank_2,
  output [5:0]  io_addrSram0Bank_3,
  output [5:0]  io_addrSram0Bank_4,
  output [5:0]  io_addrSram0Bank_5,
  output [5:0]  io_addrSram0Bank_6,
  output [5:0]  io_addrSram0Bank_7,
  output [5:0]  io_addrSram1Bank_0,
  output [5:0]  io_addrSram1Bank_1,
  output [5:0]  io_addrSram1Bank_2,
  output [5:0]  io_addrSram1Bank_3,
  output [5:0]  io_addrSram1Bank_4,
  output [5:0]  io_addrSram1Bank_5,
  output [5:0]  io_addrSram1Bank_6,
  output [5:0]  io_addrSram1Bank_7,
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
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
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
  wire [7:0] fftCalc_io_radixCount; // @[FFTEngine.scala 362:25]
  wire [1:0] fftCalc_io_calcMode; // @[FFTEngine.scala 362:25]
  wire [1:0] fftCalc_io_phaseCount; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_rShiftSym; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_isFFT; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_procMode; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_state1c; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_state2c; // @[FFTEngine.scala 362:25]
  reg [2:0] stateReg; // @[FFTEngine.scala 46:27]
  reg [8:0] addrSProc; // @[FFTEngine.scala 48:29]
  reg [1:0] phaseCount; // @[FFTEngine.scala 50:29]
  wire  _T_2 = addrSProc == 9'h3f; // @[FFTEngine.scala 62:33]
  wire  _T_4 = addrSProc == 9'h3; // @[FFTEngine.scala 69:33]
  wire [2:0] _GEN_2 = addrSProc == 9'h3 ? 3'h3 : stateReg; // @[FFTEngine.scala 69:49 70:30 72:30]
  wire  _T_6 = phaseCount == 2'h2; // @[FFTEngine.scala 76:33]
  wire [2:0] _stateReg_T_1 = io_fftMode ? 3'h4 : 3'h7; // @[FFTEngine.scala 77:36]
  wire [2:0] _GEN_3 = phaseCount == 2'h2 ? _stateReg_T_1 : 3'h1; // @[FFTEngine.scala 76:50 77:30 79:30]
  wire  _T_8 = addrSProc == 9'hff; // @[FFTEngine.scala 83:33]
  wire [2:0] _GEN_4 = addrSProc == 9'hff ? 3'h5 : stateReg; // @[FFTEngine.scala 83:51 84:30 86:30]
  wire [2:0] _GEN_5 = _T_4 ? 3'h6 : stateReg; // @[FFTEngine.scala 90:50 91:30 93:30]
  wire  _T_12 = phaseCount == 2'h1; // @[FFTEngine.scala 97:33]
  wire [2:0] _stateReg_T_2 = io_fftMode ? 3'h7 : 3'h1; // @[FFTEngine.scala 98:36]
  wire [2:0] _GEN_6 = phaseCount == 2'h1 ? _stateReg_T_2 : 3'h4; // @[FFTEngine.scala 100:30 97:51 98:30]
  wire [2:0] _GEN_7 = 3'h7 == stateReg ? 3'h0 : stateReg; // @[FFTEngine.scala 104:26 53:26 46:27]
  wire [2:0] _GEN_8 = 3'h6 == stateReg ? _GEN_6 : _GEN_7; // @[FFTEngine.scala 53:26]
  wire [2:0] _GEN_9 = 3'h5 == stateReg ? _GEN_5 : _GEN_8; // @[FFTEngine.scala 53:26]
  wire [2:0] _GEN_10 = 3'h4 == stateReg ? _GEN_4 : _GEN_9; // @[FFTEngine.scala 53:26]
  wire [2:0] _GEN_11 = 3'h3 == stateReg ? _GEN_3 : _GEN_10; // @[FFTEngine.scala 53:26]
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
  wire  _radixInit_T_13 = stateReg == 3'h4 & _T_8; // @[FFTEngine.scala 149:28]
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
  wire [8:0] _radixCount_T_1 = addrSProc + 9'h1; // @[FFTEngine.scala 161:34]
  wire  _phaseInit_T_3 = _radixInit_T_9 & _T_6; // @[FFTEngine.scala 167:33]
  wire  _phaseInit_T_4 = _radixInit_T | _phaseInit_T_3; // @[FFTEngine.scala 166:45]
  wire  _phaseInit_T_7 = _radixInit_T_19 & _T_12; // @[FFTEngine.scala 168:31]
  wire  _phaseInit_T_8 = _phaseInit_T_4 | _phaseInit_T_7; // @[FFTEngine.scala 167:65]
  wire  phaseInit = _phaseInit_T_8 | _radixInit_T_21; // @[FFTEngine.scala 168:64]
  wire  phaseUp = _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 171:46]
  wire [1:0] _phaseCount_T_1 = phaseCount + 2'h1; // @[FFTEngine.scala 176:34]
  reg  srcBuffer; // @[FFTEngine.scala 181:28]
  wire  _srcBufferNext_T_3 = ~srcBuffer; // @[FFTEngine.scala 183:79]
  wire  srcBufferNext = phaseUp & ~srcBuffer; // @[FFTEngine.scala 183:77]
  wire  srcUp = _radixInit_T | _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 185:70]
  wire  readEnable = _radixInit_T_1 | _radixInit_T_11; // @[FFTEngine.scala 196:34]
  wire [8:0] _addrKernelPre_0_T_1 = {addrSProc[5:0],3'h0}; // @[Cat.scala 33:92]
  wire [8:0] _addrKernelPre_1_T_1 = {addrSProc[5:0],3'h1}; // @[Cat.scala 33:92]
  wire [8:0] _addrKernelPre_2_T_1 = {addrSProc[5:0],3'h2}; // @[Cat.scala 33:92]
  wire [8:0] _addrKernelPre_3_T_1 = {addrSProc[5:0],3'h3}; // @[Cat.scala 33:92]
  wire [8:0] _addrKernelPre_4_T_1 = {addrSProc[5:0],3'h4}; // @[Cat.scala 33:92]
  wire [8:0] _addrKernelPre_5_T_1 = {addrSProc[5:0],3'h5}; // @[Cat.scala 33:92]
  wire [8:0] _addrKernelPre_6_T_1 = {addrSProc[5:0],3'h6}; // @[Cat.scala 33:92]
  wire [8:0] _addrKernelPre_7_T_1 = {addrSProc[5:0],3'h7}; // @[Cat.scala 33:92]
  wire [2:0] _addrKernelPre_0_T_4 = {phaseCount, 1'h0}; // @[FFTEngine.scala 227:121]
  wire [2:0] _GEN_1401 = {{1'd0}, phaseCount}; // @[FFTEngine.scala 227:127]
  wire [2:0] _addrKernelPre_0_T_6 = _addrKernelPre_0_T_4 + _GEN_1401; // @[FFTEngine.scala 227:127]
  wire [17:0] _addrKernelPre_0_dataTemp_T = {3'h0,addrSProc[5:0],3'h0,addrSProc[5:0]}; // @[Cat.scala 33:92]
  wire [17:0] addrKernelPre_0_dataTemp = _addrKernelPre_0_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [17:0] _addrKernelPre_1_dataTemp_T = {3'h1,addrSProc[5:0],3'h1,addrSProc[5:0]}; // @[Cat.scala 33:92]
  wire [17:0] addrKernelPre_1_dataTemp = _addrKernelPre_1_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [17:0] _addrKernelPre_2_dataTemp_T = {3'h2,addrSProc[5:0],3'h2,addrSProc[5:0]}; // @[Cat.scala 33:92]
  wire [17:0] addrKernelPre_2_dataTemp = _addrKernelPre_2_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [17:0] _addrKernelPre_3_dataTemp_T = {3'h3,addrSProc[5:0],3'h3,addrSProc[5:0]}; // @[Cat.scala 33:92]
  wire [17:0] addrKernelPre_3_dataTemp = _addrKernelPre_3_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [17:0] _addrKernelPre_4_dataTemp_T = {3'h4,addrSProc[5:0],3'h4,addrSProc[5:0]}; // @[Cat.scala 33:92]
  wire [17:0] addrKernelPre_4_dataTemp = _addrKernelPre_4_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [17:0] _addrKernelPre_5_dataTemp_T = {3'h5,addrSProc[5:0],3'h5,addrSProc[5:0]}; // @[Cat.scala 33:92]
  wire [17:0] addrKernelPre_5_dataTemp = _addrKernelPre_5_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [17:0] _addrKernelPre_6_dataTemp_T = {3'h6,addrSProc[5:0],3'h6,addrSProc[5:0]}; // @[Cat.scala 33:92]
  wire [17:0] addrKernelPre_6_dataTemp = _addrKernelPre_6_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [17:0] _addrKernelPre_7_dataTemp_T = {3'h7,addrSProc[5:0],3'h7,addrSProc[5:0]}; // @[Cat.scala 33:92]
  wire [17:0] addrKernelPre_7_dataTemp = _addrKernelPre_7_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [8:0] addrKernelPre_0 = _T_6 ? _addrKernelPre_0_T_1 : addrKernelPre_0_dataTemp[8:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [8:0] addrKernelPre_1 = _T_6 ? _addrKernelPre_1_T_1 : addrKernelPre_1_dataTemp[8:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [8:0] addrKernelPre_2 = _T_6 ? _addrKernelPre_2_T_1 : addrKernelPre_2_dataTemp[8:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [8:0] addrKernelPre_3 = _T_6 ? _addrKernelPre_3_T_1 : addrKernelPre_3_dataTemp[8:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [8:0] addrKernelPre_4 = _T_6 ? _addrKernelPre_4_T_1 : addrKernelPre_4_dataTemp[8:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [8:0] addrKernelPre_5 = _T_6 ? _addrKernelPre_5_T_1 : addrKernelPre_5_dataTemp[8:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [8:0] addrKernelPre_6 = _T_6 ? _addrKernelPre_6_T_1 : addrKernelPre_6_dataTemp[8:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [8:0] addrKernelPre_7 = _T_6 ? _addrKernelPre_7_T_1 : addrKernelPre_7_dataTemp[8:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [8:0] _addrTProc_T = ~addrSProc; // @[FFTEngine.scala 235:22]
  wire [8:0] addrTProc = _addrTProc_T + 9'h1; // @[FFTEngine.scala 235:34]
  wire  addrIn_0_temp_0 = io_fftMode ? addrSProc[8] : addrSProc[0]; // @[FFTEngine.scala 200:26]
  wire  addrIn_0_temp_1 = io_fftMode ? addrSProc[7] : addrSProc[1]; // @[FFTEngine.scala 200:26]
  wire  addrIn_0_temp_2 = io_fftMode ? addrSProc[6] : addrSProc[2]; // @[FFTEngine.scala 200:26]
  wire  addrIn_0_temp_3 = io_fftMode ? addrSProc[5] : addrSProc[3]; // @[FFTEngine.scala 200:26]
  wire  addrIn_0_temp_4 = io_fftMode ? addrSProc[4] : addrSProc[4]; // @[FFTEngine.scala 200:26]
  wire  addrIn_0_temp_5 = io_fftMode ? addrSProc[3] : addrSProc[5]; // @[FFTEngine.scala 200:26]
  wire  addrIn_0_temp_6 = io_fftMode ? addrSProc[2] : addrSProc[6]; // @[FFTEngine.scala 200:26]
  wire  addrIn_0_temp_7 = io_fftMode ? addrSProc[1] : addrSProc[7]; // @[FFTEngine.scala 200:26]
  wire  addrIn_0_temp_8 = io_fftMode ? addrSProc[0] : addrSProc[8]; // @[FFTEngine.scala 200:26]
  wire [8:0] _addrIn_0_T = {addrIn_0_temp_8,addrIn_0_temp_7,addrIn_0_temp_6,addrIn_0_temp_5,addrIn_0_temp_4,
    addrIn_0_temp_3,addrIn_0_temp_2,addrIn_0_temp_1,addrIn_0_temp_0}; // @[FFTEngine.scala 201:23]
  wire [8:0] addrIn_0 = _radixInit_T_11 ? _addrIn_0_T : addrKernelPre_0; // @[FFTEngine.scala 240:29]
  wire  addrIn_1_temp_0 = io_fftMode ? addrTProc[8] : addrTProc[0]; // @[FFTEngine.scala 200:26]
  wire  addrIn_1_temp_1 = io_fftMode ? addrTProc[7] : addrTProc[1]; // @[FFTEngine.scala 200:26]
  wire  addrIn_1_temp_2 = io_fftMode ? addrTProc[6] : addrTProc[2]; // @[FFTEngine.scala 200:26]
  wire  addrIn_1_temp_3 = io_fftMode ? addrTProc[5] : addrTProc[3]; // @[FFTEngine.scala 200:26]
  wire  addrIn_1_temp_4 = io_fftMode ? addrTProc[4] : addrTProc[4]; // @[FFTEngine.scala 200:26]
  wire  addrIn_1_temp_5 = io_fftMode ? addrTProc[3] : addrTProc[5]; // @[FFTEngine.scala 200:26]
  wire  addrIn_1_temp_6 = io_fftMode ? addrTProc[2] : addrTProc[6]; // @[FFTEngine.scala 200:26]
  wire  addrIn_1_temp_7 = io_fftMode ? addrTProc[1] : addrTProc[7]; // @[FFTEngine.scala 200:26]
  wire  addrIn_1_temp_8 = io_fftMode ? addrTProc[0] : addrTProc[8]; // @[FFTEngine.scala 200:26]
  wire [8:0] _addrIn_1_T = {addrIn_1_temp_8,addrIn_1_temp_7,addrIn_1_temp_6,addrIn_1_temp_5,addrIn_1_temp_4,
    addrIn_1_temp_3,addrIn_1_temp_2,addrIn_1_temp_1,addrIn_1_temp_0}; // @[FFTEngine.scala 201:23]
  wire [8:0] addrIn_1 = _radixInit_T_11 ? _addrIn_1_T : addrKernelPre_1; // @[FFTEngine.scala 241:29]
  wire  sameAddr = addrIn_0 == addrIn_1; // @[FFTEngine.scala 248:30]
  reg [5:0] addrIn1c_0_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn2c_0_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn3c_0_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn1c_1_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn2c_1_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn3c_1_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn1c_2_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn2c_2_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn3c_2_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn1c_3_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn2c_3_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn3c_3_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn1c_4_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn2c_4_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn3c_4_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn1c_5_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn2c_5_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn3c_5_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn1c_6_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn2c_6_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn3c_6_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn1c_7_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn2c_7_r; // @[Reg.scala 35:20]
  reg [5:0] addrIn3c_7_r; // @[Reg.scala 35:20]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T = {{2'd0}, addrIn_0[8:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1410 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_2 = {{1'd0}, _GEN_1410}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_4 = {{5'd0}, addrIn_0[8:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1412 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_7 = _addrInBankSelKernelPrePre_sum_T_2[2:0] + _GEN_1412; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_8 = {{8'd0}, addrIn_0[8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1414 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_8[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_0_0 = _addrInBankSelKernelPrePre_sum_T_7 + _GEN_1414; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_11 = {{1'd0}, addrIn_0[8:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1416 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_13 = {{1'd0}, _GEN_1416}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_15 = {{4'd0}, addrIn_0[8:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1418 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_15[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_18 = _addrInBankSelKernelPrePre_sum_T_13[2:0] + _GEN_1418; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_19 = {{7'd0}, addrIn_0[8:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1420 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_19[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_0_1 = _addrInBankSelKernelPrePre_sum_T_18 + _GEN_1420; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1421 = {{2'd0}, addrIn_0[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_24 = {{1'd0}, _GEN_1421}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_26 = {{3'd0}, addrIn_0[8:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1423 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_26[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_29 = _addrInBankSelKernelPrePre_sum_T_24[2:0] + _GEN_1423; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_30 = {{6'd0}, addrIn_0[8:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1425 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_30[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_0_2 = _addrInBankSelKernelPrePre_sum_T_29 + _GEN_1425; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_33 = {{2'd0}, addrIn_1[8:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1427 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_33[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_35 = {{1'd0}, _GEN_1427}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_37 = {{5'd0}, addrIn_1[8:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1429 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_37[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_40 = _addrInBankSelKernelPrePre_sum_T_35[2:0] + _GEN_1429; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_41 = {{8'd0}, addrIn_1[8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1431 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_41[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_1_0 = _addrInBankSelKernelPrePre_sum_T_40 + _GEN_1431; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_44 = {{1'd0}, addrIn_1[8:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1433 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_44[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_46 = {{1'd0}, _GEN_1433}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_48 = {{4'd0}, addrIn_1[8:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1435 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_48[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_51 = _addrInBankSelKernelPrePre_sum_T_46[2:0] + _GEN_1435; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_52 = {{7'd0}, addrIn_1[8:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1437 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_52[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_1_1 = _addrInBankSelKernelPrePre_sum_T_51 + _GEN_1437; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1438 = {{2'd0}, addrIn_1[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_57 = {{1'd0}, _GEN_1438}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_59 = {{3'd0}, addrIn_1[8:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1440 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_59[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_62 = _addrInBankSelKernelPrePre_sum_T_57[2:0] + _GEN_1440; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_63 = {{6'd0}, addrIn_1[8:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1442 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_63[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_1_2 = _addrInBankSelKernelPrePre_sum_T_62 + _GEN_1442; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_66 = {{2'd0}, addrKernelPre_2[8:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1444 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_66[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_68 = {{1'd0}, _GEN_1444}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_70 = {{5'd0}, addrKernelPre_2[8:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1446 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_70[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_73 = _addrInBankSelKernelPrePre_sum_T_68[2:0] + _GEN_1446; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_74 = {{8'd0}, addrKernelPre_2[8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1448 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_74[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_2_0 = _addrInBankSelKernelPrePre_sum_T_73 + _GEN_1448; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_77 = {{1'd0}, addrKernelPre_2[8:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1450 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_77[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_79 = {{1'd0}, _GEN_1450}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_81 = {{4'd0}, addrKernelPre_2[8:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1452 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_81[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_84 = _addrInBankSelKernelPrePre_sum_T_79[2:0] + _GEN_1452; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_85 = {{7'd0}, addrKernelPre_2[8:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1454 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_85[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_2_1 = _addrInBankSelKernelPrePre_sum_T_84 + _GEN_1454; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1455 = {{2'd0}, addrKernelPre_2[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_90 = {{1'd0}, _GEN_1455}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_92 = {{3'd0}, addrKernelPre_2[8:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1457 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_92[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_95 = _addrInBankSelKernelPrePre_sum_T_90[2:0] + _GEN_1457; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_96 = {{6'd0}, addrKernelPre_2[8:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1459 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_96[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_2_2 = _addrInBankSelKernelPrePre_sum_T_95 + _GEN_1459; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_99 = {{2'd0}, addrKernelPre_3[8:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1461 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_99[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_101 = {{1'd0}, _GEN_1461}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_103 = {{5'd0}, addrKernelPre_3[8:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1463 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_103[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_106 = _addrInBankSelKernelPrePre_sum_T_101[2:0] + _GEN_1463; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_107 = {{8'd0}, addrKernelPre_3[8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1465 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_107[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_3_0 = _addrInBankSelKernelPrePre_sum_T_106 + _GEN_1465; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_110 = {{1'd0}, addrKernelPre_3[8:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1467 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_110[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_112 = {{1'd0}, _GEN_1467}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_114 = {{4'd0}, addrKernelPre_3[8:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1469 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_114[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_117 = _addrInBankSelKernelPrePre_sum_T_112[2:0] + _GEN_1469; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_118 = {{7'd0}, addrKernelPre_3[8:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1471 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_118[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_3_1 = _addrInBankSelKernelPrePre_sum_T_117 + _GEN_1471; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1472 = {{2'd0}, addrKernelPre_3[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_123 = {{1'd0}, _GEN_1472}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_125 = {{3'd0}, addrKernelPre_3[8:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1474 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_125[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_128 = _addrInBankSelKernelPrePre_sum_T_123[2:0] + _GEN_1474; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_129 = {{6'd0}, addrKernelPre_3[8:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1476 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_129[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_3_2 = _addrInBankSelKernelPrePre_sum_T_128 + _GEN_1476; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_132 = {{2'd0}, addrKernelPre_4[8:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1478 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_132[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_134 = {{1'd0}, _GEN_1478}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_136 = {{5'd0}, addrKernelPre_4[8:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1480 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_136[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_139 = _addrInBankSelKernelPrePre_sum_T_134[2:0] + _GEN_1480; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_140 = {{8'd0}, addrKernelPre_4[8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1482 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_140[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_4_0 = _addrInBankSelKernelPrePre_sum_T_139 + _GEN_1482; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_143 = {{1'd0}, addrKernelPre_4[8:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1484 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_143[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_145 = {{1'd0}, _GEN_1484}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_147 = {{4'd0}, addrKernelPre_4[8:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1486 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_147[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_150 = _addrInBankSelKernelPrePre_sum_T_145[2:0] + _GEN_1486; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_151 = {{7'd0}, addrKernelPre_4[8:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1488 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_151[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_4_1 = _addrInBankSelKernelPrePre_sum_T_150 + _GEN_1488; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1489 = {{2'd0}, addrKernelPre_4[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_156 = {{1'd0}, _GEN_1489}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_158 = {{3'd0}, addrKernelPre_4[8:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1491 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_158[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_161 = _addrInBankSelKernelPrePre_sum_T_156[2:0] + _GEN_1491; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_162 = {{6'd0}, addrKernelPre_4[8:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1493 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_162[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_4_2 = _addrInBankSelKernelPrePre_sum_T_161 + _GEN_1493; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_165 = {{2'd0}, addrKernelPre_5[8:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1495 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_165[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_167 = {{1'd0}, _GEN_1495}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_169 = {{5'd0}, addrKernelPre_5[8:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1497 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_169[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_172 = _addrInBankSelKernelPrePre_sum_T_167[2:0] + _GEN_1497; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_173 = {{8'd0}, addrKernelPre_5[8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1499 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_173[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_5_0 = _addrInBankSelKernelPrePre_sum_T_172 + _GEN_1499; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_176 = {{1'd0}, addrKernelPre_5[8:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1501 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_176[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_178 = {{1'd0}, _GEN_1501}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_180 = {{4'd0}, addrKernelPre_5[8:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1503 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_180[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_183 = _addrInBankSelKernelPrePre_sum_T_178[2:0] + _GEN_1503; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_184 = {{7'd0}, addrKernelPre_5[8:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1505 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_184[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_5_1 = _addrInBankSelKernelPrePre_sum_T_183 + _GEN_1505; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1506 = {{2'd0}, addrKernelPre_5[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_189 = {{1'd0}, _GEN_1506}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_191 = {{3'd0}, addrKernelPre_5[8:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1508 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_191[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_194 = _addrInBankSelKernelPrePre_sum_T_189[2:0] + _GEN_1508; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_195 = {{6'd0}, addrKernelPre_5[8:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1510 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_195[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_5_2 = _addrInBankSelKernelPrePre_sum_T_194 + _GEN_1510; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_198 = {{2'd0}, addrKernelPre_6[8:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1512 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_198[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_200 = {{1'd0}, _GEN_1512}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_202 = {{5'd0}, addrKernelPre_6[8:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1514 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_202[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_205 = _addrInBankSelKernelPrePre_sum_T_200[2:0] + _GEN_1514; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_206 = {{8'd0}, addrKernelPre_6[8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1516 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_206[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_6_0 = _addrInBankSelKernelPrePre_sum_T_205 + _GEN_1516; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_209 = {{1'd0}, addrKernelPre_6[8:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1518 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_209[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_211 = {{1'd0}, _GEN_1518}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_213 = {{4'd0}, addrKernelPre_6[8:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1520 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_213[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_216 = _addrInBankSelKernelPrePre_sum_T_211[2:0] + _GEN_1520; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_217 = {{7'd0}, addrKernelPre_6[8:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1522 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_217[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_6_1 = _addrInBankSelKernelPrePre_sum_T_216 + _GEN_1522; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1523 = {{2'd0}, addrKernelPre_6[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_222 = {{1'd0}, _GEN_1523}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_224 = {{3'd0}, addrKernelPre_6[8:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1525 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_224[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_227 = _addrInBankSelKernelPrePre_sum_T_222[2:0] + _GEN_1525; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_228 = {{6'd0}, addrKernelPre_6[8:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1527 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_228[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_6_2 = _addrInBankSelKernelPrePre_sum_T_227 + _GEN_1527; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_231 = {{2'd0}, addrKernelPre_7[8:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1529 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_231[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_233 = {{1'd0}, _GEN_1529}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_235 = {{5'd0}, addrKernelPre_7[8:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1531 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_235[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_238 = _addrInBankSelKernelPrePre_sum_T_233[2:0] + _GEN_1531; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_239 = {{8'd0}, addrKernelPre_7[8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1533 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_239[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_7_0 = _addrInBankSelKernelPrePre_sum_T_238 + _GEN_1533; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_242 = {{1'd0}, addrKernelPre_7[8:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1535 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_242[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_244 = {{1'd0}, _GEN_1535}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_246 = {{4'd0}, addrKernelPre_7[8:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1537 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_246[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_249 = _addrInBankSelKernelPrePre_sum_T_244[2:0] + _GEN_1537; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_250 = {{7'd0}, addrKernelPre_7[8:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1539 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_250[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_7_1 = _addrInBankSelKernelPrePre_sum_T_249 + _GEN_1539; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1540 = {{2'd0}, addrKernelPre_7[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_255 = {{1'd0}, _GEN_1540}; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_257 = {{3'd0}, addrKernelPre_7[8:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1542 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_257[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_260 = _addrInBankSelKernelPrePre_sum_T_255[2:0] + _GEN_1542; // @[FFTEngine.scala 261:107]
  wire [8:0] _addrInBankSelKernelPrePre_sum_T_261 = {{6'd0}, addrKernelPre_7[8:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1544 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_261[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_7_2 = _addrInBankSelKernelPrePre_sum_T_260 + _GEN_1544; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPre_T_1 = {{1'd0}, addrInBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_3 = {_addrInBankSelKernelPre_T_1[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1545 = {{1'd0}, addrInBankSelKernelPrePre_0_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_5 = _addrInBankSelKernelPre_T_3 + _GEN_1545; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_6 = {_addrInBankSelKernelPre_T_5, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1546 = {{2'd0}, addrInBankSelKernelPrePre_0_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_8 = _addrInBankSelKernelPre_T_6 + _GEN_1546; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_10 = {{1'd0}, addrInBankSelKernelPrePre_1_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_12 = {_addrInBankSelKernelPre_T_10[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1547 = {{1'd0}, addrInBankSelKernelPrePre_1_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_14 = _addrInBankSelKernelPre_T_12 + _GEN_1547; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_15 = {_addrInBankSelKernelPre_T_14, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1548 = {{2'd0}, addrInBankSelKernelPrePre_1_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_17 = _addrInBankSelKernelPre_T_15 + _GEN_1548; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_19 = {{1'd0}, addrInBankSelKernelPrePre_2_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_21 = {_addrInBankSelKernelPre_T_19[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1549 = {{1'd0}, addrInBankSelKernelPrePre_2_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_23 = _addrInBankSelKernelPre_T_21 + _GEN_1549; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_24 = {_addrInBankSelKernelPre_T_23, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1550 = {{2'd0}, addrInBankSelKernelPrePre_2_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_26 = _addrInBankSelKernelPre_T_24 + _GEN_1550; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_28 = {{1'd0}, addrInBankSelKernelPrePre_3_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_30 = {_addrInBankSelKernelPre_T_28[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1551 = {{1'd0}, addrInBankSelKernelPrePre_3_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_32 = _addrInBankSelKernelPre_T_30 + _GEN_1551; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_33 = {_addrInBankSelKernelPre_T_32, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1552 = {{2'd0}, addrInBankSelKernelPrePre_3_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_35 = _addrInBankSelKernelPre_T_33 + _GEN_1552; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_37 = {{1'd0}, addrInBankSelKernelPrePre_4_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_39 = {_addrInBankSelKernelPre_T_37[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1553 = {{1'd0}, addrInBankSelKernelPrePre_4_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_41 = _addrInBankSelKernelPre_T_39 + _GEN_1553; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_42 = {_addrInBankSelKernelPre_T_41, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1554 = {{2'd0}, addrInBankSelKernelPrePre_4_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_44 = _addrInBankSelKernelPre_T_42 + _GEN_1554; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_46 = {{1'd0}, addrInBankSelKernelPrePre_5_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_48 = {_addrInBankSelKernelPre_T_46[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1555 = {{1'd0}, addrInBankSelKernelPrePre_5_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_50 = _addrInBankSelKernelPre_T_48 + _GEN_1555; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_51 = {_addrInBankSelKernelPre_T_50, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1556 = {{2'd0}, addrInBankSelKernelPrePre_5_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_53 = _addrInBankSelKernelPre_T_51 + _GEN_1556; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_55 = {{1'd0}, addrInBankSelKernelPrePre_6_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_57 = {_addrInBankSelKernelPre_T_55[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1557 = {{1'd0}, addrInBankSelKernelPrePre_6_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_59 = _addrInBankSelKernelPre_T_57 + _GEN_1557; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_60 = {_addrInBankSelKernelPre_T_59, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1558 = {{2'd0}, addrInBankSelKernelPrePre_6_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_62 = _addrInBankSelKernelPre_T_60 + _GEN_1558; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_64 = {{1'd0}, addrInBankSelKernelPrePre_7_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_66 = {_addrInBankSelKernelPre_T_64[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1559 = {{1'd0}, addrInBankSelKernelPrePre_7_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_68 = _addrInBankSelKernelPre_T_66 + _GEN_1559; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_69 = {_addrInBankSelKernelPre_T_68, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1560 = {{2'd0}, addrInBankSelKernelPrePre_7_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_71 = _addrInBankSelKernelPre_T_69 + _GEN_1560; // @[FFTEngine.scala 267:142]
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
  wire  addrInBankSelProcPre__0 = addrIn_0[0] ^ addrIn_0[8]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre__1 = addrIn_0[1] ^ addrIn_0[7]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre__2 = addrIn_0[2] ^ addrIn_0[6]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_0 = {addrInBankSelProcPre__0,addrInBankSelProcPre__1,addrInBankSelProcPre__2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_1_0 = addrIn_1[0] ^ addrIn_1[8]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_1_1 = addrIn_1[1] ^ addrIn_1[7]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_1_2 = addrIn_1[2] ^ addrIn_1[6]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_1 = {addrInBankSelProcPre_1_0,addrInBankSelProcPre_1_1,addrInBankSelProcPre_1_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_2_0 = addrKernelPre_2[0] ^ addrKernelPre_2[8]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_2_1 = addrKernelPre_2[1] ^ addrKernelPre_2[7]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_2_2 = addrKernelPre_2[2] ^ addrKernelPre_2[6]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_2 = {addrInBankSelProcPre_2_0,addrInBankSelProcPre_2_1,addrInBankSelProcPre_2_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_3_0 = addrKernelPre_3[0] ^ addrKernelPre_3[8]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_3_1 = addrKernelPre_3[1] ^ addrKernelPre_3[7]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_3_2 = addrKernelPre_3[2] ^ addrKernelPre_3[6]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_3 = {addrInBankSelProcPre_3_0,addrInBankSelProcPre_3_1,addrInBankSelProcPre_3_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_4_0 = addrKernelPre_4[0] ^ addrKernelPre_4[8]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_4_1 = addrKernelPre_4[1] ^ addrKernelPre_4[7]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_4_2 = addrKernelPre_4[2] ^ addrKernelPre_4[6]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_4 = {addrInBankSelProcPre_4_0,addrInBankSelProcPre_4_1,addrInBankSelProcPre_4_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_5_0 = addrKernelPre_5[0] ^ addrKernelPre_5[8]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_5_1 = addrKernelPre_5[1] ^ addrKernelPre_5[7]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_5_2 = addrKernelPre_5[2] ^ addrKernelPre_5[6]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_5 = {addrInBankSelProcPre_5_0,addrInBankSelProcPre_5_1,addrInBankSelProcPre_5_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_6_0 = addrKernelPre_6[0] ^ addrKernelPre_6[8]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_6_1 = addrKernelPre_6[1] ^ addrKernelPre_6[7]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_6_2 = addrKernelPre_6[2] ^ addrKernelPre_6[6]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_6 = {addrInBankSelProcPre_6_0,addrInBankSelProcPre_6_1,addrInBankSelProcPre_6_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_7_0 = addrKernelPre_7[0] ^ addrKernelPre_7[8]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_7_1 = addrKernelPre_7[1] ^ addrKernelPre_7[7]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_7_2 = addrKernelPre_7[2] ^ addrKernelPre_7[6]; // @[FFTEngine.scala 296:57]
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
  wire [3:0] _GEN_72 = {{1'd0}, addrInBankSelKernel_4}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelKernel2c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel3c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel1c_5_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_75 = {{1'd0}, addrInBankSelKernel_5}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelKernel2c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel3c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel1c_6_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_78 = {{1'd0}, addrInBankSelKernel_6}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelKernel2c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel3c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelKernel1c_7_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_81 = {{1'd0}, addrInBankSelKernel_7}; // @[Reg.scala 36:18 35:20 36:22]
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
  wire [3:0] _GEN_96 = {{1'd0}, addrInBankSelProc_4}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelProc2c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc3c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc1c_5_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_99 = {{1'd0}, addrInBankSelProc_5}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelProc2c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc3c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc1c_6_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_102 = {{1'd0}, addrInBankSelProc_6}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelProc2c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc3c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc1c_7_r; // @[Reg.scala 35:20]
  wire [3:0] _GEN_105 = {{1'd0}, addrInBankSelProc_7}; // @[Reg.scala 36:18 35:20 36:22]
  reg [3:0] addrInBankSelProc2c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrInBankSelProc3c_7_r; // @[Reg.scala 35:20]
  reg  kernelState1c; // @[Reg.scala 35:20]
  reg  kernelState2c; // @[Reg.scala 35:20]
  reg  kernelState3c; // @[Reg.scala 35:20]
  reg  procState1c; // @[Reg.scala 35:20]
  reg  procState2c; // @[Reg.scala 35:20]
  reg  procState3c; // @[Reg.scala 35:20]
  reg  sameAddr1c; // @[Reg.scala 35:20]
  reg  sameAddr2c; // @[Reg.scala 35:20]
  reg  sameAddr3c; // @[Reg.scala 35:20]
  wire  _addrInBankSel_0_T_1 = phaseCount == 2'h0; // @[FFTEngine.scala 345:76]
  wire [2:0] _addrInBankSel_1_T = _radixInit_T_11 ? addrInBankSelProc_1 : addrInBankSelKernel_1; // @[FFTEngine.scala 343:36]
  wire [2:0] _addrInBankSel_1_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_1 :
    addrInBankSelKernel_1; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_1 = io_fftMode ? _addrInBankSel_1_T : _addrInBankSel_1_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_2_T = _radixInit_T_11 ? addrInBankSelProc_2 : addrInBankSelKernel_2; // @[FFTEngine.scala 343:36]
  wire [2:0] _addrInBankSel_2_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_2 :
    addrInBankSelKernel_2; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_2 = io_fftMode ? _addrInBankSel_2_T : _addrInBankSel_2_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_3_T = _radixInit_T_11 ? addrInBankSelProc_3 : addrInBankSelKernel_3; // @[FFTEngine.scala 343:36]
  wire [2:0] _addrInBankSel_3_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_3 :
    addrInBankSelKernel_3; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_3 = io_fftMode ? _addrInBankSel_3_T : _addrInBankSel_3_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_4_T = _radixInit_T_11 ? addrInBankSelProc_4 : addrInBankSelKernel_4; // @[FFTEngine.scala 343:36]
  wire [2:0] _addrInBankSel_4_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_4 :
    addrInBankSelKernel_4; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_4 = io_fftMode ? _addrInBankSel_4_T : _addrInBankSel_4_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_5_T = _radixInit_T_11 ? addrInBankSelProc_5 : addrInBankSelKernel_5; // @[FFTEngine.scala 343:36]
  wire [2:0] _addrInBankSel_5_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_5 :
    addrInBankSelKernel_5; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_5 = io_fftMode ? _addrInBankSel_5_T : _addrInBankSel_5_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_6_T = _radixInit_T_11 ? addrInBankSelProc_6 : addrInBankSelKernel_6; // @[FFTEngine.scala 343:36]
  wire [2:0] _addrInBankSel_6_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_6 :
    addrInBankSelKernel_6; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_6 = io_fftMode ? _addrInBankSel_6_T : _addrInBankSel_6_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
  wire [2:0] _addrInBankSel_7_T = _radixInit_T_11 ? addrInBankSelProc_7 : addrInBankSelKernel_7; // @[FFTEngine.scala 343:36]
  wire [2:0] _addrInBankSel_7_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0 ? addrInBankSelProc_7 :
    addrInBankSelKernel_7; // @[FFTEngine.scala 345:36]
  wire [2:0] addrInBankSel_7 = io_fftMode ? _addrInBankSel_7_T : _addrInBankSel_7_T_4; // @[FFTEngine.scala 342:21 343:30 345:30]
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
  wire [15:0] _GEN_134 = 3'h1 == addrInBankSel1c_0_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_135 = 3'h2 == addrInBankSel1c_0_r ? $signed(dataInPre_2_re) : $signed(_GEN_134); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_136 = 3'h3 == addrInBankSel1c_0_r ? $signed(dataInPre_3_re) : $signed(_GEN_135); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_137 = 3'h4 == addrInBankSel1c_0_r ? $signed(dataInPre_4_re) : $signed(_GEN_136); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_138 = 3'h5 == addrInBankSel1c_0_r ? $signed(dataInPre_5_re) : $signed(_GEN_137); // @[FFTEngine.scala 363:{29,29}]
  wire [15:0] _GEN_139 = 3'h6 == addrInBankSel1c_0_r ? $signed(dataInPre_6_re) : $signed(_GEN_138); // @[FFTEngine.scala 363:{29,29}]
  wire  _fftCalc_io_dataIn_0_im_T_1 = sameAddr1c & _T_12; // @[FFTEngine.scala 364:47]
  wire [15:0] _GEN_142 = 3'h1 == addrInBankSel1c_0_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_143 = 3'h2 == addrInBankSel1c_0_r ? $signed(dataInPre_2_im) : $signed(_GEN_142); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_144 = 3'h3 == addrInBankSel1c_0_r ? $signed(dataInPre_3_im) : $signed(_GEN_143); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_145 = 3'h4 == addrInBankSel1c_0_r ? $signed(dataInPre_4_im) : $signed(_GEN_144); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_146 = 3'h5 == addrInBankSel1c_0_r ? $signed(dataInPre_5_im) : $signed(_GEN_145); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_147 = 3'h6 == addrInBankSel1c_0_r ? $signed(dataInPre_6_im) : $signed(_GEN_146); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_148 = 3'h7 == addrInBankSel1c_0_r ? $signed(dataInPre_7_im) : $signed(_GEN_147); // @[FFTEngine.scala 364:{35,35}]
  wire [15:0] _GEN_150 = 3'h1 == addrInBankSel1c_1_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_151 = 3'h2 == addrInBankSel1c_1_r ? $signed(dataInPre_2_im) : $signed(_GEN_150); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_152 = 3'h3 == addrInBankSel1c_1_r ? $signed(dataInPre_3_im) : $signed(_GEN_151); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_153 = 3'h4 == addrInBankSel1c_1_r ? $signed(dataInPre_4_im) : $signed(_GEN_152); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_154 = 3'h5 == addrInBankSel1c_1_r ? $signed(dataInPre_5_im) : $signed(_GEN_153); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_155 = 3'h6 == addrInBankSel1c_1_r ? $signed(dataInPre_6_im) : $signed(_GEN_154); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_156 = 3'h7 == addrInBankSel1c_1_r ? $signed(dataInPre_7_im) : $signed(_GEN_155); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_158 = 3'h1 == addrInBankSel1c_1_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_159 = 3'h2 == addrInBankSel1c_1_r ? $signed(dataInPre_2_re) : $signed(_GEN_158); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_160 = 3'h3 == addrInBankSel1c_1_r ? $signed(dataInPre_3_re) : $signed(_GEN_159); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_161 = 3'h4 == addrInBankSel1c_1_r ? $signed(dataInPre_4_re) : $signed(_GEN_160); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_162 = 3'h5 == addrInBankSel1c_1_r ? $signed(dataInPre_5_re) : $signed(_GEN_161); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_163 = 3'h6 == addrInBankSel1c_1_r ? $signed(dataInPre_6_re) : $signed(_GEN_162); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_164 = 3'h7 == addrInBankSel1c_1_r ? $signed(dataInPre_7_re) : $signed(_GEN_163); // @[FFTEngine.scala 365:{35,35}]
  wire [15:0] _GEN_174 = 3'h1 == addrInBankSel1c_2_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_175 = 3'h2 == addrInBankSel1c_2_r ? $signed(dataInPre_2_re) : $signed(_GEN_174); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_176 = 3'h3 == addrInBankSel1c_2_r ? $signed(dataInPre_3_re) : $signed(_GEN_175); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_177 = 3'h4 == addrInBankSel1c_2_r ? $signed(dataInPre_4_re) : $signed(_GEN_176); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_178 = 3'h5 == addrInBankSel1c_2_r ? $signed(dataInPre_5_re) : $signed(_GEN_177); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_179 = 3'h6 == addrInBankSel1c_2_r ? $signed(dataInPre_6_re) : $signed(_GEN_178); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_182 = 3'h1 == addrInBankSel1c_2_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_183 = 3'h2 == addrInBankSel1c_2_r ? $signed(dataInPre_2_im) : $signed(_GEN_182); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_184 = 3'h3 == addrInBankSel1c_2_r ? $signed(dataInPre_3_im) : $signed(_GEN_183); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_185 = 3'h4 == addrInBankSel1c_2_r ? $signed(dataInPre_4_im) : $signed(_GEN_184); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_186 = 3'h5 == addrInBankSel1c_2_r ? $signed(dataInPre_5_im) : $signed(_GEN_185); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_187 = 3'h6 == addrInBankSel1c_2_r ? $signed(dataInPre_6_im) : $signed(_GEN_186); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_190 = 3'h1 == addrInBankSel1c_3_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_191 = 3'h2 == addrInBankSel1c_3_r ? $signed(dataInPre_2_re) : $signed(_GEN_190); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_192 = 3'h3 == addrInBankSel1c_3_r ? $signed(dataInPre_3_re) : $signed(_GEN_191); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_193 = 3'h4 == addrInBankSel1c_3_r ? $signed(dataInPre_4_re) : $signed(_GEN_192); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_194 = 3'h5 == addrInBankSel1c_3_r ? $signed(dataInPre_5_re) : $signed(_GEN_193); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_195 = 3'h6 == addrInBankSel1c_3_r ? $signed(dataInPre_6_re) : $signed(_GEN_194); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_198 = 3'h1 == addrInBankSel1c_3_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_199 = 3'h2 == addrInBankSel1c_3_r ? $signed(dataInPre_2_im) : $signed(_GEN_198); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_200 = 3'h3 == addrInBankSel1c_3_r ? $signed(dataInPre_3_im) : $signed(_GEN_199); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_201 = 3'h4 == addrInBankSel1c_3_r ? $signed(dataInPre_4_im) : $signed(_GEN_200); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_202 = 3'h5 == addrInBankSel1c_3_r ? $signed(dataInPre_5_im) : $signed(_GEN_201); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_203 = 3'h6 == addrInBankSel1c_3_r ? $signed(dataInPre_6_im) : $signed(_GEN_202); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_206 = 3'h1 == addrInBankSel1c_4_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_207 = 3'h2 == addrInBankSel1c_4_r ? $signed(dataInPre_2_re) : $signed(_GEN_206); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_208 = 3'h3 == addrInBankSel1c_4_r ? $signed(dataInPre_3_re) : $signed(_GEN_207); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_209 = 3'h4 == addrInBankSel1c_4_r ? $signed(dataInPre_4_re) : $signed(_GEN_208); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_210 = 3'h5 == addrInBankSel1c_4_r ? $signed(dataInPre_5_re) : $signed(_GEN_209); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_211 = 3'h6 == addrInBankSel1c_4_r ? $signed(dataInPre_6_re) : $signed(_GEN_210); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_214 = 3'h1 == addrInBankSel1c_4_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_215 = 3'h2 == addrInBankSel1c_4_r ? $signed(dataInPre_2_im) : $signed(_GEN_214); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_216 = 3'h3 == addrInBankSel1c_4_r ? $signed(dataInPre_3_im) : $signed(_GEN_215); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_217 = 3'h4 == addrInBankSel1c_4_r ? $signed(dataInPre_4_im) : $signed(_GEN_216); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_218 = 3'h5 == addrInBankSel1c_4_r ? $signed(dataInPre_5_im) : $signed(_GEN_217); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_219 = 3'h6 == addrInBankSel1c_4_r ? $signed(dataInPre_6_im) : $signed(_GEN_218); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_222 = 3'h1 == addrInBankSel1c_5_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_223 = 3'h2 == addrInBankSel1c_5_r ? $signed(dataInPre_2_re) : $signed(_GEN_222); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_224 = 3'h3 == addrInBankSel1c_5_r ? $signed(dataInPre_3_re) : $signed(_GEN_223); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_225 = 3'h4 == addrInBankSel1c_5_r ? $signed(dataInPre_4_re) : $signed(_GEN_224); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_226 = 3'h5 == addrInBankSel1c_5_r ? $signed(dataInPre_5_re) : $signed(_GEN_225); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_227 = 3'h6 == addrInBankSel1c_5_r ? $signed(dataInPre_6_re) : $signed(_GEN_226); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_230 = 3'h1 == addrInBankSel1c_5_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_231 = 3'h2 == addrInBankSel1c_5_r ? $signed(dataInPre_2_im) : $signed(_GEN_230); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_232 = 3'h3 == addrInBankSel1c_5_r ? $signed(dataInPre_3_im) : $signed(_GEN_231); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_233 = 3'h4 == addrInBankSel1c_5_r ? $signed(dataInPre_4_im) : $signed(_GEN_232); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_234 = 3'h5 == addrInBankSel1c_5_r ? $signed(dataInPre_5_im) : $signed(_GEN_233); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_235 = 3'h6 == addrInBankSel1c_5_r ? $signed(dataInPre_6_im) : $signed(_GEN_234); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_238 = 3'h1 == addrInBankSel1c_6_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_239 = 3'h2 == addrInBankSel1c_6_r ? $signed(dataInPre_2_re) : $signed(_GEN_238); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_240 = 3'h3 == addrInBankSel1c_6_r ? $signed(dataInPre_3_re) : $signed(_GEN_239); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_241 = 3'h4 == addrInBankSel1c_6_r ? $signed(dataInPre_4_re) : $signed(_GEN_240); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_242 = 3'h5 == addrInBankSel1c_6_r ? $signed(dataInPre_5_re) : $signed(_GEN_241); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_243 = 3'h6 == addrInBankSel1c_6_r ? $signed(dataInPre_6_re) : $signed(_GEN_242); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_246 = 3'h1 == addrInBankSel1c_6_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_247 = 3'h2 == addrInBankSel1c_6_r ? $signed(dataInPre_2_im) : $signed(_GEN_246); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_248 = 3'h3 == addrInBankSel1c_6_r ? $signed(dataInPre_3_im) : $signed(_GEN_247); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_249 = 3'h4 == addrInBankSel1c_6_r ? $signed(dataInPre_4_im) : $signed(_GEN_248); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_250 = 3'h5 == addrInBankSel1c_6_r ? $signed(dataInPre_5_im) : $signed(_GEN_249); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_251 = 3'h6 == addrInBankSel1c_6_r ? $signed(dataInPre_6_im) : $signed(_GEN_250); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_254 = 3'h1 == addrInBankSel1c_7_r ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_255 = 3'h2 == addrInBankSel1c_7_r ? $signed(dataInPre_2_re) : $signed(_GEN_254); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_256 = 3'h3 == addrInBankSel1c_7_r ? $signed(dataInPre_3_re) : $signed(_GEN_255); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_257 = 3'h4 == addrInBankSel1c_7_r ? $signed(dataInPre_4_re) : $signed(_GEN_256); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_258 = 3'h5 == addrInBankSel1c_7_r ? $signed(dataInPre_5_re) : $signed(_GEN_257); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_259 = 3'h6 == addrInBankSel1c_7_r ? $signed(dataInPre_6_re) : $signed(_GEN_258); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_262 = 3'h1 == addrInBankSel1c_7_r ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_263 = 3'h2 == addrInBankSel1c_7_r ? $signed(dataInPre_2_im) : $signed(_GEN_262); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_264 = 3'h3 == addrInBankSel1c_7_r ? $signed(dataInPre_3_im) : $signed(_GEN_263); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_265 = 3'h4 == addrInBankSel1c_7_r ? $signed(dataInPre_4_im) : $signed(_GEN_264); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_266 = 3'h5 == addrInBankSel1c_7_r ? $signed(dataInPre_5_im) : $signed(_GEN_265); // @[FFTEngine.scala 368:{30,30}]
  wire [15:0] _GEN_267 = 3'h6 == addrInBankSel1c_7_r ? $signed(dataInPre_6_im) : $signed(_GEN_266); // @[FFTEngine.scala 368:{30,30}]
  wire [8:0] _fftCalc_io_radixCount_T_2 = _radixInit_T_11 ? addrSProc : {{3'd0}, addrSProc[5:0]}; // @[FFTEngine.scala 370:33]
  wire  _GEN_270 = 2'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 371:{32,32}]
  wire  _GEN_271 = 2'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_270; // @[FFTEngine.scala 371:{32,32}]
  wire  _fftCalc_io_procMode_T_2 = _radixInit_T_11 | procState1c | procState2c | procState3c; // @[FFTEngine.scala 373:66]
  wire [1:0] _GEN_272 = _fftCalc_io_procMode_T_2 & _T_12 ? 2'h1 : 2'h3; // @[FFTEngine.scala 378:94 379:29 381:29]
  wire [1:0] _GEN_273 = _fftCalc_io_procMode_T_2 & _addrInBankSel_0_T_1 ? 2'h0 : _GEN_272; // @[FFTEngine.scala 376:94 377:29]
  wire [15:0] _writeDataPre3c_1_re_T_3 = 16'sh0 - $signed(fftCalc_io_dataOut3c_1_im); // @[FFTEngine.scala 389:137]
  wire [15:0] _writeDataPre3c_1_re_T_4 = io_fftMode ? $signed(fftCalc_io_dataOut3c_1_im) : $signed(
    _writeDataPre3c_1_re_T_3); // @[FFTEngine.scala 389:101]
  wire [15:0] _writeDataPre3c_1_re_T_5 = _T_12 ? $signed(fftCalc_io_dataOut3c_1_re) : $signed(_writeDataPre3c_1_re_T_4); // @[FFTEngine.scala 389:49]
  wire [15:0] writeDataPre3c_1_re = procState3c ? $signed(_writeDataPre3c_1_re_T_5) : $signed(fftCalc_io_dataOut3c_1_re)
    ; // @[FFTEngine.scala 389:32]
  wire [15:0] _writeDataPre3c_1_im_T_6 = 16'sh0 - $signed(fftCalc_io_dataOut3c_1_re); // @[FFTEngine.scala 390:110]
  wire [15:0] _writeDataPre3c_1_im_T_7 = io_fftMode ? $signed(_writeDataPre3c_1_im_T_6) : $signed(
    fftCalc_io_dataOut3c_1_re); // @[FFTEngine.scala 390:102]
  wire [15:0] _writeDataPre3c_1_im_T_8 = _T_12 ? $signed(_writeDataPre3c_1_re_T_3) : $signed(_writeDataPre3c_1_im_T_7); // @[FFTEngine.scala 390:49]
  wire [15:0] writeDataPre3c_1_im = procState3c ? $signed(_writeDataPre3c_1_im_T_8) : $signed(fftCalc_io_dataOut3c_1_im)
    ; // @[FFTEngine.scala 390:32]
  wire  _addrInBankSel3c_0_T_1 = kernelState3c & _T_6; // @[FFTEngine.scala 398:68]
  wire [3:0] _addrInBankSel3c_0_T_3 = procState3c | kernelState3c & _T_6 ? addrInBankSelProc3c_0_r :
    addrInBankSelKernel3c_0_r; // @[FFTEngine.scala 398:38]
  wire [3:0] _addrInBankSel3c_0_T_4 = procState3c ? addrInBankSelProc3c_0_r : addrInBankSelKernel3c_0_r; // @[FFTEngine.scala 400:38]
  wire [3:0] addrInBankSel3c_0 = io_fftMode ? _addrInBankSel3c_0_T_3 : _addrInBankSel3c_0_T_4; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_1_T_3 = procState3c | kernelState3c & _T_6 ? addrInBankSelProc3c_1_r :
    addrInBankSelKernel3c_1_r; // @[FFTEngine.scala 398:38]
  wire [3:0] _addrInBankSel3c_1_T_4 = procState3c ? addrInBankSelProc3c_1_r : addrInBankSelKernel3c_1_r; // @[FFTEngine.scala 400:38]
  wire [3:0] addrInBankSel3c_1 = io_fftMode ? _addrInBankSel3c_1_T_3 : _addrInBankSel3c_1_T_4; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_2_T_3 = procState3c | kernelState3c & _T_6 ? addrInBankSelProc3c_2_r :
    addrInBankSelKernel3c_2_r; // @[FFTEngine.scala 398:38]
  wire [3:0] _addrInBankSel3c_2_T_4 = procState3c ? addrInBankSelProc3c_2_r : addrInBankSelKernel3c_2_r; // @[FFTEngine.scala 400:38]
  wire [3:0] addrInBankSel3c_2 = io_fftMode ? _addrInBankSel3c_2_T_3 : _addrInBankSel3c_2_T_4; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_3_T_3 = procState3c | kernelState3c & _T_6 ? addrInBankSelProc3c_3_r :
    addrInBankSelKernel3c_3_r; // @[FFTEngine.scala 398:38]
  wire [3:0] _addrInBankSel3c_3_T_4 = procState3c ? addrInBankSelProc3c_3_r : addrInBankSelKernel3c_3_r; // @[FFTEngine.scala 400:38]
  wire [3:0] addrInBankSel3c_3 = io_fftMode ? _addrInBankSel3c_3_T_3 : _addrInBankSel3c_3_T_4; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_4_T_3 = procState3c | kernelState3c & _T_6 ? addrInBankSelProc3c_4_r :
    addrInBankSelKernel3c_4_r; // @[FFTEngine.scala 398:38]
  wire [3:0] _addrInBankSel3c_4_T_4 = procState3c ? addrInBankSelProc3c_4_r : addrInBankSelKernel3c_4_r; // @[FFTEngine.scala 400:38]
  wire [3:0] addrInBankSel3c_4 = io_fftMode ? _addrInBankSel3c_4_T_3 : _addrInBankSel3c_4_T_4; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_5_T_3 = procState3c | kernelState3c & _T_6 ? addrInBankSelProc3c_5_r :
    addrInBankSelKernel3c_5_r; // @[FFTEngine.scala 398:38]
  wire [3:0] _addrInBankSel3c_5_T_4 = procState3c ? addrInBankSelProc3c_5_r : addrInBankSelKernel3c_5_r; // @[FFTEngine.scala 400:38]
  wire [3:0] addrInBankSel3c_5 = io_fftMode ? _addrInBankSel3c_5_T_3 : _addrInBankSel3c_5_T_4; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_6_T_3 = procState3c | kernelState3c & _T_6 ? addrInBankSelProc3c_6_r :
    addrInBankSelKernel3c_6_r; // @[FFTEngine.scala 398:38]
  wire [3:0] _addrInBankSel3c_6_T_4 = procState3c ? addrInBankSelProc3c_6_r : addrInBankSelKernel3c_6_r; // @[FFTEngine.scala 400:38]
  wire [3:0] addrInBankSel3c_6 = io_fftMode ? _addrInBankSel3c_6_T_3 : _addrInBankSel3c_6_T_4; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire [3:0] _addrInBankSel3c_7_T_3 = procState3c | kernelState3c & _T_6 ? addrInBankSelProc3c_7_r :
    addrInBankSelKernel3c_7_r; // @[FFTEngine.scala 398:38]
  wire [3:0] _addrInBankSel3c_7_T_4 = procState3c ? addrInBankSelProc3c_7_r : addrInBankSelKernel3c_7_r; // @[FFTEngine.scala 400:38]
  wire [3:0] addrInBankSel3c_7 = io_fftMode ? _addrInBankSel3c_7_T_3 : _addrInBankSel3c_7_T_4; // @[FFTEngine.scala 397:21 398:32 400:32]
  wire  _GEN_283 = (4'h0 == addrInBankSelProc3c_0_r | 4'h0 == addrInBankSelProc3c_1_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 406:84 407:44 410:44]
  wire  _GEN_284 = (4'h0 == addrInBankSelProc3c_0_r | 4'h0 == addrInBankSelProc3c_1_r) & (_srcBufferNext_T_3 &
    procState3c); // @[FFTEngine.scala 406:84 408:44 411:44]
  wire  _GEN_287 = (4'h1 == addrInBankSelProc3c_0_r | 4'h1 == addrInBankSelProc3c_1_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 406:84 407:44 410:44]
  wire  _GEN_288 = (4'h1 == addrInBankSelProc3c_0_r | 4'h1 == addrInBankSelProc3c_1_r) & (_srcBufferNext_T_3 &
    procState3c); // @[FFTEngine.scala 406:84 408:44 411:44]
  wire  _GEN_291 = (4'h2 == addrInBankSelProc3c_0_r | 4'h2 == addrInBankSelProc3c_1_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 406:84 407:44 410:44]
  wire  _GEN_292 = (4'h2 == addrInBankSelProc3c_0_r | 4'h2 == addrInBankSelProc3c_1_r) & (_srcBufferNext_T_3 &
    procState3c); // @[FFTEngine.scala 406:84 408:44 411:44]
  wire  _GEN_295 = (4'h3 == addrInBankSelProc3c_0_r | 4'h3 == addrInBankSelProc3c_1_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 406:84 407:44 410:44]
  wire  _GEN_296 = (4'h3 == addrInBankSelProc3c_0_r | 4'h3 == addrInBankSelProc3c_1_r) & (_srcBufferNext_T_3 &
    procState3c); // @[FFTEngine.scala 406:84 408:44 411:44]
  wire  _GEN_299 = (4'h4 == addrInBankSelProc3c_0_r | 4'h4 == addrInBankSelProc3c_1_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 406:84 407:44 410:44]
  wire  _GEN_300 = (4'h4 == addrInBankSelProc3c_0_r | 4'h4 == addrInBankSelProc3c_1_r) & (_srcBufferNext_T_3 &
    procState3c); // @[FFTEngine.scala 406:84 408:44 411:44]
  wire  _GEN_303 = (4'h5 == addrInBankSelProc3c_0_r | 4'h5 == addrInBankSelProc3c_1_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 406:84 407:44 410:44]
  wire  _GEN_304 = (4'h5 == addrInBankSelProc3c_0_r | 4'h5 == addrInBankSelProc3c_1_r) & (_srcBufferNext_T_3 &
    procState3c); // @[FFTEngine.scala 406:84 408:44 411:44]
  wire  _GEN_307 = (4'h6 == addrInBankSelProc3c_0_r | 4'h6 == addrInBankSelProc3c_1_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 406:84 407:44 410:44]
  wire  _GEN_308 = (4'h6 == addrInBankSelProc3c_0_r | 4'h6 == addrInBankSelProc3c_1_r) & (_srcBufferNext_T_3 &
    procState3c); // @[FFTEngine.scala 406:84 408:44 411:44]
  wire  _GEN_311 = (4'h7 == addrInBankSelProc3c_0_r | 4'h7 == addrInBankSelProc3c_1_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 406:84 407:44 410:44]
  wire  _GEN_312 = (4'h7 == addrInBankSelProc3c_0_r | 4'h7 == addrInBankSelProc3c_1_r) & (_srcBufferNext_T_3 &
    procState3c); // @[FFTEngine.scala 406:84 408:44 411:44]
  wire [5:0] _GEN_379 = ~_radixInit_T_11 ? addrIn_0[5:0] : addrIn_0[5:0]; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_395 = 3'h0 == addrInBankSel_1 ? addrIn_1[5:0] : _GEN_379; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_396 = 3'h1 == addrInBankSel_1 ? addrIn_1[5:0] : _GEN_379; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_397 = 3'h2 == addrInBankSel_1 ? addrIn_1[5:0] : _GEN_379; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_398 = 3'h3 == addrInBankSel_1 ? addrIn_1[5:0] : _GEN_379; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_399 = 3'h4 == addrInBankSel_1 ? addrIn_1[5:0] : _GEN_379; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_400 = 3'h5 == addrInBankSel_1 ? addrIn_1[5:0] : _GEN_379; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_401 = 3'h6 == addrInBankSel_1 ? addrIn_1[5:0] : _GEN_379; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_402 = 3'h7 == addrInBankSel_1 ? addrIn_1[5:0] : _GEN_379; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_411 = _srcBufferNext_T_3 ? _GEN_395 : _GEN_379; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_412 = _srcBufferNext_T_3 ? _GEN_396 : _GEN_379; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_413 = _srcBufferNext_T_3 ? _GEN_397 : _GEN_379; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_414 = _srcBufferNext_T_3 ? _GEN_398 : _GEN_379; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_415 = _srcBufferNext_T_3 ? _GEN_399 : _GEN_379; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_416 = _srcBufferNext_T_3 ? _GEN_400 : _GEN_379; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_417 = _srcBufferNext_T_3 ? _GEN_401 : _GEN_379; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_418 = _srcBufferNext_T_3 ? _GEN_402 : _GEN_379; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_419 = _srcBufferNext_T_3 ? _GEN_379 : _GEN_395; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_420 = _srcBufferNext_T_3 ? _GEN_379 : _GEN_396; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_421 = _srcBufferNext_T_3 ? _GEN_379 : _GEN_397; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_422 = _srcBufferNext_T_3 ? _GEN_379 : _GEN_398; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_423 = _srcBufferNext_T_3 ? _GEN_379 : _GEN_399; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_424 = _srcBufferNext_T_3 ? _GEN_379 : _GEN_400; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_425 = _srcBufferNext_T_3 ? _GEN_379 : _GEN_401; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_426 = _srcBufferNext_T_3 ? _GEN_379 : _GEN_402; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_459 = ~_radixInit_T_11 ? _GEN_411 : _GEN_411; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_460 = ~_radixInit_T_11 ? _GEN_412 : _GEN_412; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_461 = ~_radixInit_T_11 ? _GEN_413 : _GEN_413; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_462 = ~_radixInit_T_11 ? _GEN_414 : _GEN_414; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_463 = ~_radixInit_T_11 ? _GEN_415 : _GEN_415; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_464 = ~_radixInit_T_11 ? _GEN_416 : _GEN_416; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_465 = ~_radixInit_T_11 ? _GEN_417 : _GEN_417; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_466 = ~_radixInit_T_11 ? _GEN_418 : _GEN_418; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_467 = ~_radixInit_T_11 ? _GEN_419 : _GEN_419; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_468 = ~_radixInit_T_11 ? _GEN_420 : _GEN_420; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_469 = ~_radixInit_T_11 ? _GEN_421 : _GEN_421; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_470 = ~_radixInit_T_11 ? _GEN_422 : _GEN_422; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_471 = ~_radixInit_T_11 ? _GEN_423 : _GEN_423; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_472 = ~_radixInit_T_11 ? _GEN_424 : _GEN_424; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_473 = ~_radixInit_T_11 ? _GEN_425 : _GEN_425; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_474 = ~_radixInit_T_11 ? _GEN_426 : _GEN_426; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_475 = 3'h0 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_459; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_476 = 3'h1 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_460; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_477 = 3'h2 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_461; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_478 = 3'h3 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_462; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_479 = 3'h4 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_463; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_480 = 3'h5 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_464; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_481 = 3'h6 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_465; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_482 = 3'h7 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_466; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_483 = 3'h0 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_467; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_484 = 3'h1 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_468; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_485 = 3'h2 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_469; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_486 = 3'h3 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_470; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_487 = 3'h4 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_471; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_488 = 3'h5 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_472; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_489 = 3'h6 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_473; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_490 = 3'h7 == addrInBankSel_2 ? addrKernelPre_2[5:0] : _GEN_474; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_491 = _srcBufferNext_T_3 ? _GEN_475 : _GEN_459; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_492 = _srcBufferNext_T_3 ? _GEN_476 : _GEN_460; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_493 = _srcBufferNext_T_3 ? _GEN_477 : _GEN_461; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_494 = _srcBufferNext_T_3 ? _GEN_478 : _GEN_462; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_495 = _srcBufferNext_T_3 ? _GEN_479 : _GEN_463; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_496 = _srcBufferNext_T_3 ? _GEN_480 : _GEN_464; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_497 = _srcBufferNext_T_3 ? _GEN_481 : _GEN_465; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_498 = _srcBufferNext_T_3 ? _GEN_482 : _GEN_466; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_499 = _srcBufferNext_T_3 ? _GEN_467 : _GEN_483; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_500 = _srcBufferNext_T_3 ? _GEN_468 : _GEN_484; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_501 = _srcBufferNext_T_3 ? _GEN_469 : _GEN_485; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_502 = _srcBufferNext_T_3 ? _GEN_470 : _GEN_486; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_503 = _srcBufferNext_T_3 ? _GEN_471 : _GEN_487; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_504 = _srcBufferNext_T_3 ? _GEN_472 : _GEN_488; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_505 = _srcBufferNext_T_3 ? _GEN_473 : _GEN_489; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_506 = _srcBufferNext_T_3 ? _GEN_474 : _GEN_490; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_507 = ~_radixInit_T_11 ? _GEN_491 : _GEN_459; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_508 = ~_radixInit_T_11 ? _GEN_492 : _GEN_460; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_509 = ~_radixInit_T_11 ? _GEN_493 : _GEN_461; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_510 = ~_radixInit_T_11 ? _GEN_494 : _GEN_462; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_511 = ~_radixInit_T_11 ? _GEN_495 : _GEN_463; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_512 = ~_radixInit_T_11 ? _GEN_496 : _GEN_464; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_513 = ~_radixInit_T_11 ? _GEN_497 : _GEN_465; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_514 = ~_radixInit_T_11 ? _GEN_498 : _GEN_466; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_515 = ~_radixInit_T_11 ? _GEN_499 : _GEN_467; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_516 = ~_radixInit_T_11 ? _GEN_500 : _GEN_468; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_517 = ~_radixInit_T_11 ? _GEN_501 : _GEN_469; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_518 = ~_radixInit_T_11 ? _GEN_502 : _GEN_470; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_519 = ~_radixInit_T_11 ? _GEN_503 : _GEN_471; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_520 = ~_radixInit_T_11 ? _GEN_504 : _GEN_472; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_521 = ~_radixInit_T_11 ? _GEN_505 : _GEN_473; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_522 = ~_radixInit_T_11 ? _GEN_506 : _GEN_474; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_523 = 3'h0 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_507; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_524 = 3'h1 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_508; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_525 = 3'h2 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_509; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_526 = 3'h3 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_510; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_527 = 3'h4 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_511; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_528 = 3'h5 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_512; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_529 = 3'h6 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_513; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_530 = 3'h7 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_514; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_531 = 3'h0 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_515; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_532 = 3'h1 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_516; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_533 = 3'h2 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_517; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_534 = 3'h3 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_518; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_535 = 3'h4 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_519; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_536 = 3'h5 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_520; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_537 = 3'h6 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_521; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_538 = 3'h7 == addrInBankSel_3 ? addrKernelPre_3[5:0] : _GEN_522; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_539 = _srcBufferNext_T_3 ? _GEN_523 : _GEN_507; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_540 = _srcBufferNext_T_3 ? _GEN_524 : _GEN_508; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_541 = _srcBufferNext_T_3 ? _GEN_525 : _GEN_509; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_542 = _srcBufferNext_T_3 ? _GEN_526 : _GEN_510; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_543 = _srcBufferNext_T_3 ? _GEN_527 : _GEN_511; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_544 = _srcBufferNext_T_3 ? _GEN_528 : _GEN_512; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_545 = _srcBufferNext_T_3 ? _GEN_529 : _GEN_513; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_546 = _srcBufferNext_T_3 ? _GEN_530 : _GEN_514; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_547 = _srcBufferNext_T_3 ? _GEN_515 : _GEN_531; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_548 = _srcBufferNext_T_3 ? _GEN_516 : _GEN_532; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_549 = _srcBufferNext_T_3 ? _GEN_517 : _GEN_533; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_550 = _srcBufferNext_T_3 ? _GEN_518 : _GEN_534; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_551 = _srcBufferNext_T_3 ? _GEN_519 : _GEN_535; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_552 = _srcBufferNext_T_3 ? _GEN_520 : _GEN_536; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_553 = _srcBufferNext_T_3 ? _GEN_521 : _GEN_537; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_554 = _srcBufferNext_T_3 ? _GEN_522 : _GEN_538; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_555 = ~_radixInit_T_11 ? _GEN_539 : _GEN_507; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_556 = ~_radixInit_T_11 ? _GEN_540 : _GEN_508; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_557 = ~_radixInit_T_11 ? _GEN_541 : _GEN_509; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_558 = ~_radixInit_T_11 ? _GEN_542 : _GEN_510; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_559 = ~_radixInit_T_11 ? _GEN_543 : _GEN_511; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_560 = ~_radixInit_T_11 ? _GEN_544 : _GEN_512; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_561 = ~_radixInit_T_11 ? _GEN_545 : _GEN_513; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_562 = ~_radixInit_T_11 ? _GEN_546 : _GEN_514; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_563 = ~_radixInit_T_11 ? _GEN_547 : _GEN_515; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_564 = ~_radixInit_T_11 ? _GEN_548 : _GEN_516; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_565 = ~_radixInit_T_11 ? _GEN_549 : _GEN_517; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_566 = ~_radixInit_T_11 ? _GEN_550 : _GEN_518; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_567 = ~_radixInit_T_11 ? _GEN_551 : _GEN_519; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_568 = ~_radixInit_T_11 ? _GEN_552 : _GEN_520; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_569 = ~_radixInit_T_11 ? _GEN_553 : _GEN_521; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_570 = ~_radixInit_T_11 ? _GEN_554 : _GEN_522; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_571 = 3'h0 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_555; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_572 = 3'h1 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_556; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_573 = 3'h2 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_557; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_574 = 3'h3 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_558; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_575 = 3'h4 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_559; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_576 = 3'h5 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_560; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_577 = 3'h6 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_561; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_578 = 3'h7 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_562; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_579 = 3'h0 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_563; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_580 = 3'h1 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_564; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_581 = 3'h2 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_565; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_582 = 3'h3 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_566; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_583 = 3'h4 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_567; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_584 = 3'h5 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_568; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_585 = 3'h6 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_569; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_586 = 3'h7 == addrInBankSel_4 ? addrKernelPre_4[5:0] : _GEN_570; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_587 = _srcBufferNext_T_3 ? _GEN_571 : _GEN_555; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_588 = _srcBufferNext_T_3 ? _GEN_572 : _GEN_556; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_589 = _srcBufferNext_T_3 ? _GEN_573 : _GEN_557; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_590 = _srcBufferNext_T_3 ? _GEN_574 : _GEN_558; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_591 = _srcBufferNext_T_3 ? _GEN_575 : _GEN_559; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_592 = _srcBufferNext_T_3 ? _GEN_576 : _GEN_560; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_593 = _srcBufferNext_T_3 ? _GEN_577 : _GEN_561; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_594 = _srcBufferNext_T_3 ? _GEN_578 : _GEN_562; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_595 = _srcBufferNext_T_3 ? _GEN_563 : _GEN_579; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_596 = _srcBufferNext_T_3 ? _GEN_564 : _GEN_580; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_597 = _srcBufferNext_T_3 ? _GEN_565 : _GEN_581; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_598 = _srcBufferNext_T_3 ? _GEN_566 : _GEN_582; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_599 = _srcBufferNext_T_3 ? _GEN_567 : _GEN_583; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_600 = _srcBufferNext_T_3 ? _GEN_568 : _GEN_584; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_601 = _srcBufferNext_T_3 ? _GEN_569 : _GEN_585; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_602 = _srcBufferNext_T_3 ? _GEN_570 : _GEN_586; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_603 = ~_radixInit_T_11 ? _GEN_587 : _GEN_555; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_604 = ~_radixInit_T_11 ? _GEN_588 : _GEN_556; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_605 = ~_radixInit_T_11 ? _GEN_589 : _GEN_557; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_606 = ~_radixInit_T_11 ? _GEN_590 : _GEN_558; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_607 = ~_radixInit_T_11 ? _GEN_591 : _GEN_559; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_608 = ~_radixInit_T_11 ? _GEN_592 : _GEN_560; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_609 = ~_radixInit_T_11 ? _GEN_593 : _GEN_561; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_610 = ~_radixInit_T_11 ? _GEN_594 : _GEN_562; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_611 = ~_radixInit_T_11 ? _GEN_595 : _GEN_563; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_612 = ~_radixInit_T_11 ? _GEN_596 : _GEN_564; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_613 = ~_radixInit_T_11 ? _GEN_597 : _GEN_565; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_614 = ~_radixInit_T_11 ? _GEN_598 : _GEN_566; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_615 = ~_radixInit_T_11 ? _GEN_599 : _GEN_567; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_616 = ~_radixInit_T_11 ? _GEN_600 : _GEN_568; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_617 = ~_radixInit_T_11 ? _GEN_601 : _GEN_569; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_618 = ~_radixInit_T_11 ? _GEN_602 : _GEN_570; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_619 = 3'h0 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_603; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_620 = 3'h1 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_604; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_621 = 3'h2 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_605; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_622 = 3'h3 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_606; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_623 = 3'h4 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_607; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_624 = 3'h5 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_608; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_625 = 3'h6 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_609; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_626 = 3'h7 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_610; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_627 = 3'h0 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_611; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_628 = 3'h1 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_612; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_629 = 3'h2 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_613; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_630 = 3'h3 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_614; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_631 = 3'h4 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_615; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_632 = 3'h5 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_616; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_633 = 3'h6 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_617; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_634 = 3'h7 == addrInBankSel_5 ? addrKernelPre_5[5:0] : _GEN_618; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_635 = _srcBufferNext_T_3 ? _GEN_619 : _GEN_603; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_636 = _srcBufferNext_T_3 ? _GEN_620 : _GEN_604; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_637 = _srcBufferNext_T_3 ? _GEN_621 : _GEN_605; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_638 = _srcBufferNext_T_3 ? _GEN_622 : _GEN_606; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_639 = _srcBufferNext_T_3 ? _GEN_623 : _GEN_607; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_640 = _srcBufferNext_T_3 ? _GEN_624 : _GEN_608; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_641 = _srcBufferNext_T_3 ? _GEN_625 : _GEN_609; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_642 = _srcBufferNext_T_3 ? _GEN_626 : _GEN_610; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_643 = _srcBufferNext_T_3 ? _GEN_611 : _GEN_627; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_644 = _srcBufferNext_T_3 ? _GEN_612 : _GEN_628; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_645 = _srcBufferNext_T_3 ? _GEN_613 : _GEN_629; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_646 = _srcBufferNext_T_3 ? _GEN_614 : _GEN_630; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_647 = _srcBufferNext_T_3 ? _GEN_615 : _GEN_631; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_648 = _srcBufferNext_T_3 ? _GEN_616 : _GEN_632; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_649 = _srcBufferNext_T_3 ? _GEN_617 : _GEN_633; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_650 = _srcBufferNext_T_3 ? _GEN_618 : _GEN_634; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_651 = ~_radixInit_T_11 ? _GEN_635 : _GEN_603; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_652 = ~_radixInit_T_11 ? _GEN_636 : _GEN_604; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_653 = ~_radixInit_T_11 ? _GEN_637 : _GEN_605; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_654 = ~_radixInit_T_11 ? _GEN_638 : _GEN_606; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_655 = ~_radixInit_T_11 ? _GEN_639 : _GEN_607; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_656 = ~_radixInit_T_11 ? _GEN_640 : _GEN_608; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_657 = ~_radixInit_T_11 ? _GEN_641 : _GEN_609; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_658 = ~_radixInit_T_11 ? _GEN_642 : _GEN_610; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_659 = ~_radixInit_T_11 ? _GEN_643 : _GEN_611; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_660 = ~_radixInit_T_11 ? _GEN_644 : _GEN_612; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_661 = ~_radixInit_T_11 ? _GEN_645 : _GEN_613; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_662 = ~_radixInit_T_11 ? _GEN_646 : _GEN_614; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_663 = ~_radixInit_T_11 ? _GEN_647 : _GEN_615; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_664 = ~_radixInit_T_11 ? _GEN_648 : _GEN_616; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_665 = ~_radixInit_T_11 ? _GEN_649 : _GEN_617; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_666 = ~_radixInit_T_11 ? _GEN_650 : _GEN_618; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_667 = 3'h0 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_651; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_668 = 3'h1 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_652; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_669 = 3'h2 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_653; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_670 = 3'h3 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_654; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_671 = 3'h4 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_655; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_672 = 3'h5 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_656; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_673 = 3'h6 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_657; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_674 = 3'h7 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_658; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_675 = 3'h0 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_659; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_676 = 3'h1 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_660; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_677 = 3'h2 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_661; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_678 = 3'h3 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_662; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_679 = 3'h4 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_663; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_680 = 3'h5 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_664; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_681 = 3'h6 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_665; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_682 = 3'h7 == addrInBankSel_6 ? addrKernelPre_6[5:0] : _GEN_666; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_683 = _srcBufferNext_T_3 ? _GEN_667 : _GEN_651; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_684 = _srcBufferNext_T_3 ? _GEN_668 : _GEN_652; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_685 = _srcBufferNext_T_3 ? _GEN_669 : _GEN_653; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_686 = _srcBufferNext_T_3 ? _GEN_670 : _GEN_654; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_687 = _srcBufferNext_T_3 ? _GEN_671 : _GEN_655; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_688 = _srcBufferNext_T_3 ? _GEN_672 : _GEN_656; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_689 = _srcBufferNext_T_3 ? _GEN_673 : _GEN_657; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_690 = _srcBufferNext_T_3 ? _GEN_674 : _GEN_658; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_691 = _srcBufferNext_T_3 ? _GEN_659 : _GEN_675; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_692 = _srcBufferNext_T_3 ? _GEN_660 : _GEN_676; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_693 = _srcBufferNext_T_3 ? _GEN_661 : _GEN_677; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_694 = _srcBufferNext_T_3 ? _GEN_662 : _GEN_678; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_695 = _srcBufferNext_T_3 ? _GEN_663 : _GEN_679; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_696 = _srcBufferNext_T_3 ? _GEN_664 : _GEN_680; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_697 = _srcBufferNext_T_3 ? _GEN_665 : _GEN_681; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_698 = _srcBufferNext_T_3 ? _GEN_666 : _GEN_682; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_699 = ~_radixInit_T_11 ? _GEN_683 : _GEN_651; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_700 = ~_radixInit_T_11 ? _GEN_684 : _GEN_652; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_701 = ~_radixInit_T_11 ? _GEN_685 : _GEN_653; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_702 = ~_radixInit_T_11 ? _GEN_686 : _GEN_654; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_703 = ~_radixInit_T_11 ? _GEN_687 : _GEN_655; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_704 = ~_radixInit_T_11 ? _GEN_688 : _GEN_656; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_705 = ~_radixInit_T_11 ? _GEN_689 : _GEN_657; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_706 = ~_radixInit_T_11 ? _GEN_690 : _GEN_658; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_707 = ~_radixInit_T_11 ? _GEN_691 : _GEN_659; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_708 = ~_radixInit_T_11 ? _GEN_692 : _GEN_660; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_709 = ~_radixInit_T_11 ? _GEN_693 : _GEN_661; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_710 = ~_radixInit_T_11 ? _GEN_694 : _GEN_662; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_711 = ~_radixInit_T_11 ? _GEN_695 : _GEN_663; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_712 = ~_radixInit_T_11 ? _GEN_696 : _GEN_664; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_713 = ~_radixInit_T_11 ? _GEN_697 : _GEN_665; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_714 = ~_radixInit_T_11 ? _GEN_698 : _GEN_666; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_715 = 3'h0 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_699; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_716 = 3'h1 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_700; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_717 = 3'h2 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_701; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_718 = 3'h3 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_702; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_719 = 3'h4 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_703; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_720 = 3'h5 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_704; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_721 = 3'h6 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_705; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_722 = 3'h7 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_706; // @[FFTEngine.scala 422:{52,52}]
  wire [5:0] _GEN_723 = 3'h0 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_707; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_724 = 3'h1 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_708; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_725 = 3'h2 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_709; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_726 = 3'h3 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_710; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_727 = 3'h4 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_711; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_728 = 3'h5 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_712; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_729 = 3'h6 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_713; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_730 = 3'h7 == addrInBankSel_7 ? addrKernelPre_7[5:0] : _GEN_714; // @[FFTEngine.scala 424:{52,52}]
  wire [5:0] _GEN_731 = _srcBufferNext_T_3 ? _GEN_715 : _GEN_699; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_732 = _srcBufferNext_T_3 ? _GEN_716 : _GEN_700; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_733 = _srcBufferNext_T_3 ? _GEN_717 : _GEN_701; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_734 = _srcBufferNext_T_3 ? _GEN_718 : _GEN_702; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_735 = _srcBufferNext_T_3 ? _GEN_719 : _GEN_703; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_736 = _srcBufferNext_T_3 ? _GEN_720 : _GEN_704; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_737 = _srcBufferNext_T_3 ? _GEN_721 : _GEN_705; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_738 = _srcBufferNext_T_3 ? _GEN_722 : _GEN_706; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_739 = _srcBufferNext_T_3 ? _GEN_707 : _GEN_723; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_740 = _srcBufferNext_T_3 ? _GEN_708 : _GEN_724; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_741 = _srcBufferNext_T_3 ? _GEN_709 : _GEN_725; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_742 = _srcBufferNext_T_3 ? _GEN_710 : _GEN_726; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_743 = _srcBufferNext_T_3 ? _GEN_711 : _GEN_727; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_744 = _srcBufferNext_T_3 ? _GEN_712 : _GEN_728; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_745 = _srcBufferNext_T_3 ? _GEN_713 : _GEN_729; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_746 = _srcBufferNext_T_3 ? _GEN_714 : _GEN_730; // @[FFTEngine.scala 421:37]
  wire [5:0] _GEN_747 = ~_radixInit_T_11 ? _GEN_731 : _GEN_699; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_748 = ~_radixInit_T_11 ? _GEN_732 : _GEN_700; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_749 = ~_radixInit_T_11 ? _GEN_733 : _GEN_701; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_750 = ~_radixInit_T_11 ? _GEN_734 : _GEN_702; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_751 = ~_radixInit_T_11 ? _GEN_735 : _GEN_703; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_752 = ~_radixInit_T_11 ? _GEN_736 : _GEN_704; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_753 = ~_radixInit_T_11 ? _GEN_737 : _GEN_705; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_754 = ~_radixInit_T_11 ? _GEN_738 : _GEN_706; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_755 = ~_radixInit_T_11 ? _GEN_739 : _GEN_707; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_756 = ~_radixInit_T_11 ? _GEN_740 : _GEN_708; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_757 = ~_radixInit_T_11 ? _GEN_741 : _GEN_709; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_758 = ~_radixInit_T_11 ? _GEN_742 : _GEN_710; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_759 = ~_radixInit_T_11 ? _GEN_743 : _GEN_711; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_760 = ~_radixInit_T_11 ? _GEN_744 : _GEN_712; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_761 = ~_radixInit_T_11 ? _GEN_745 : _GEN_713; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_762 = ~_radixInit_T_11 ? _GEN_746 : _GEN_714; // @[FFTEngine.scala 420:26]
  wire [5:0] _GEN_763 = 3'h0 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_755; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_764 = 3'h1 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_756; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_765 = 3'h2 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_757; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_766 = 3'h3 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_758; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_767 = 3'h4 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_759; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_768 = 3'h5 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_760; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_769 = 3'h6 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_761; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_770 = 3'h7 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_762; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_771 = 3'h0 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_747; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_772 = 3'h1 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_748; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_773 = 3'h2 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_749; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_774 = 3'h3 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_750; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_775 = 3'h4 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_751; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_776 = 3'h5 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_752; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_777 = 3'h6 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_753; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_778 = 3'h7 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_754; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_779 = _srcBufferNext_T_3 ? _GEN_763 : _GEN_755; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_780 = _srcBufferNext_T_3 ? _GEN_764 : _GEN_756; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_781 = _srcBufferNext_T_3 ? _GEN_765 : _GEN_757; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_782 = _srcBufferNext_T_3 ? _GEN_766 : _GEN_758; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_783 = _srcBufferNext_T_3 ? _GEN_767 : _GEN_759; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_784 = _srcBufferNext_T_3 ? _GEN_768 : _GEN_760; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_785 = _srcBufferNext_T_3 ? _GEN_769 : _GEN_761; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_786 = _srcBufferNext_T_3 ? _GEN_770 : _GEN_762; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_787 = _srcBufferNext_T_3 ? _GEN_747 : _GEN_771; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_788 = _srcBufferNext_T_3 ? _GEN_748 : _GEN_772; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_789 = _srcBufferNext_T_3 ? _GEN_749 : _GEN_773; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_790 = _srcBufferNext_T_3 ? _GEN_750 : _GEN_774; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_791 = _srcBufferNext_T_3 ? _GEN_751 : _GEN_775; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_792 = _srcBufferNext_T_3 ? _GEN_752 : _GEN_776; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_793 = _srcBufferNext_T_3 ? _GEN_753 : _GEN_777; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_794 = _srcBufferNext_T_3 ? _GEN_754 : _GEN_778; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_827 = ~procState3c ? _GEN_779 : _GEN_779; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_828 = ~procState3c ? _GEN_780 : _GEN_780; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_829 = ~procState3c ? _GEN_781 : _GEN_781; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_830 = ~procState3c ? _GEN_782 : _GEN_782; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_831 = ~procState3c ? _GEN_783 : _GEN_783; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_832 = ~procState3c ? _GEN_784 : _GEN_784; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_833 = ~procState3c ? _GEN_785 : _GEN_785; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_834 = ~procState3c ? _GEN_786 : _GEN_786; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_835 = ~procState3c ? _GEN_787 : _GEN_787; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_836 = ~procState3c ? _GEN_788 : _GEN_788; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_837 = ~procState3c ? _GEN_789 : _GEN_789; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_838 = ~procState3c ? _GEN_790 : _GEN_790; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_839 = ~procState3c ? _GEN_791 : _GEN_791; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_840 = ~procState3c ? _GEN_792 : _GEN_792; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_841 = ~procState3c ? _GEN_793 : _GEN_793; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_842 = ~procState3c ? _GEN_794 : _GEN_794; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_843 = 3'h0 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_827; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_844 = 3'h1 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_828; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_845 = 3'h2 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_829; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_846 = 3'h3 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_830; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_847 = 3'h4 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_831; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_848 = 3'h5 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_832; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_849 = 3'h6 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_833; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_850 = 3'h7 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_834; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_851 = 3'h0 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_835; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_852 = 3'h1 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_836; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_853 = 3'h2 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_837; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_854 = 3'h3 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_838; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_855 = 3'h4 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_839; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_856 = 3'h5 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_840; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_857 = 3'h6 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_841; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_858 = 3'h7 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_842; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_859 = _srcBufferNext_T_3 ? _GEN_843 : _GEN_827; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_860 = _srcBufferNext_T_3 ? _GEN_844 : _GEN_828; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_861 = _srcBufferNext_T_3 ? _GEN_845 : _GEN_829; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_862 = _srcBufferNext_T_3 ? _GEN_846 : _GEN_830; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_863 = _srcBufferNext_T_3 ? _GEN_847 : _GEN_831; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_864 = _srcBufferNext_T_3 ? _GEN_848 : _GEN_832; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_865 = _srcBufferNext_T_3 ? _GEN_849 : _GEN_833; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_866 = _srcBufferNext_T_3 ? _GEN_850 : _GEN_834; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_867 = _srcBufferNext_T_3 ? _GEN_835 : _GEN_851; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_868 = _srcBufferNext_T_3 ? _GEN_836 : _GEN_852; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_869 = _srcBufferNext_T_3 ? _GEN_837 : _GEN_853; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_870 = _srcBufferNext_T_3 ? _GEN_838 : _GEN_854; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_871 = _srcBufferNext_T_3 ? _GEN_839 : _GEN_855; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_872 = _srcBufferNext_T_3 ? _GEN_840 : _GEN_856; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_873 = _srcBufferNext_T_3 ? _GEN_841 : _GEN_857; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_874 = _srcBufferNext_T_3 ? _GEN_842 : _GEN_858; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_907 = ~procState3c ? _GEN_859 : _GEN_859; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_908 = ~procState3c ? _GEN_860 : _GEN_860; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_909 = ~procState3c ? _GEN_861 : _GEN_861; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_910 = ~procState3c ? _GEN_862 : _GEN_862; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_911 = ~procState3c ? _GEN_863 : _GEN_863; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_912 = ~procState3c ? _GEN_864 : _GEN_864; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_913 = ~procState3c ? _GEN_865 : _GEN_865; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_914 = ~procState3c ? _GEN_866 : _GEN_866; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_915 = ~procState3c ? _GEN_867 : _GEN_867; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_916 = ~procState3c ? _GEN_868 : _GEN_868; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_917 = ~procState3c ? _GEN_869 : _GEN_869; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_918 = ~procState3c ? _GEN_870 : _GEN_870; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_919 = ~procState3c ? _GEN_871 : _GEN_871; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_920 = ~procState3c ? _GEN_872 : _GEN_872; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_921 = ~procState3c ? _GEN_873 : _GEN_873; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_922 = ~procState3c ? _GEN_874 : _GEN_874; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_923 = 3'h0 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_907; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_924 = 3'h1 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_908; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_925 = 3'h2 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_909; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_926 = 3'h3 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_910; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_927 = 3'h4 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_911; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_928 = 3'h5 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_912; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_929 = 3'h6 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_913; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_930 = 3'h7 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_914; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_931 = 3'h0 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_915; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_932 = 3'h1 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_916; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_933 = 3'h2 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_917; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_934 = 3'h3 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_918; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_935 = 3'h4 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_919; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_936 = 3'h5 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_920; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_937 = 3'h6 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_921; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_938 = 3'h7 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_922; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_939 = _srcBufferNext_T_3 ? _GEN_923 : _GEN_907; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_940 = _srcBufferNext_T_3 ? _GEN_924 : _GEN_908; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_941 = _srcBufferNext_T_3 ? _GEN_925 : _GEN_909; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_942 = _srcBufferNext_T_3 ? _GEN_926 : _GEN_910; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_943 = _srcBufferNext_T_3 ? _GEN_927 : _GEN_911; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_944 = _srcBufferNext_T_3 ? _GEN_928 : _GEN_912; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_945 = _srcBufferNext_T_3 ? _GEN_929 : _GEN_913; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_946 = _srcBufferNext_T_3 ? _GEN_930 : _GEN_914; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_947 = _srcBufferNext_T_3 ? _GEN_915 : _GEN_931; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_948 = _srcBufferNext_T_3 ? _GEN_916 : _GEN_932; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_949 = _srcBufferNext_T_3 ? _GEN_917 : _GEN_933; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_950 = _srcBufferNext_T_3 ? _GEN_918 : _GEN_934; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_951 = _srcBufferNext_T_3 ? _GEN_919 : _GEN_935; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_952 = _srcBufferNext_T_3 ? _GEN_920 : _GEN_936; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_953 = _srcBufferNext_T_3 ? _GEN_921 : _GEN_937; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_954 = _srcBufferNext_T_3 ? _GEN_922 : _GEN_938; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_955 = ~procState3c ? _GEN_939 : _GEN_907; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_956 = ~procState3c ? _GEN_940 : _GEN_908; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_957 = ~procState3c ? _GEN_941 : _GEN_909; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_958 = ~procState3c ? _GEN_942 : _GEN_910; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_959 = ~procState3c ? _GEN_943 : _GEN_911; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_960 = ~procState3c ? _GEN_944 : _GEN_912; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_961 = ~procState3c ? _GEN_945 : _GEN_913; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_962 = ~procState3c ? _GEN_946 : _GEN_914; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_963 = ~procState3c ? _GEN_947 : _GEN_915; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_964 = ~procState3c ? _GEN_948 : _GEN_916; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_965 = ~procState3c ? _GEN_949 : _GEN_917; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_966 = ~procState3c ? _GEN_950 : _GEN_918; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_967 = ~procState3c ? _GEN_951 : _GEN_919; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_968 = ~procState3c ? _GEN_952 : _GEN_920; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_969 = ~procState3c ? _GEN_953 : _GEN_921; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_970 = ~procState3c ? _GEN_954 : _GEN_922; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_971 = 3'h0 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_955; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_972 = 3'h1 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_956; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_973 = 3'h2 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_957; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_974 = 3'h3 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_958; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_975 = 3'h4 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_959; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_976 = 3'h5 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_960; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_977 = 3'h6 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_961; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_978 = 3'h7 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_962; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_979 = 3'h0 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_963; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_980 = 3'h1 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_964; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_981 = 3'h2 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_965; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_982 = 3'h3 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_966; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_983 = 3'h4 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_967; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_984 = 3'h5 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_968; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_985 = 3'h6 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_969; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_986 = 3'h7 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_970; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_987 = _srcBufferNext_T_3 ? _GEN_971 : _GEN_955; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_988 = _srcBufferNext_T_3 ? _GEN_972 : _GEN_956; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_989 = _srcBufferNext_T_3 ? _GEN_973 : _GEN_957; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_990 = _srcBufferNext_T_3 ? _GEN_974 : _GEN_958; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_991 = _srcBufferNext_T_3 ? _GEN_975 : _GEN_959; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_992 = _srcBufferNext_T_3 ? _GEN_976 : _GEN_960; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_993 = _srcBufferNext_T_3 ? _GEN_977 : _GEN_961; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_994 = _srcBufferNext_T_3 ? _GEN_978 : _GEN_962; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_995 = _srcBufferNext_T_3 ? _GEN_963 : _GEN_979; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_996 = _srcBufferNext_T_3 ? _GEN_964 : _GEN_980; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_997 = _srcBufferNext_T_3 ? _GEN_965 : _GEN_981; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_998 = _srcBufferNext_T_3 ? _GEN_966 : _GEN_982; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_999 = _srcBufferNext_T_3 ? _GEN_967 : _GEN_983; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1000 = _srcBufferNext_T_3 ? _GEN_968 : _GEN_984; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1001 = _srcBufferNext_T_3 ? _GEN_969 : _GEN_985; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1002 = _srcBufferNext_T_3 ? _GEN_970 : _GEN_986; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1003 = ~procState3c ? _GEN_987 : _GEN_955; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1004 = ~procState3c ? _GEN_988 : _GEN_956; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1005 = ~procState3c ? _GEN_989 : _GEN_957; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1006 = ~procState3c ? _GEN_990 : _GEN_958; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1007 = ~procState3c ? _GEN_991 : _GEN_959; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1008 = ~procState3c ? _GEN_992 : _GEN_960; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1009 = ~procState3c ? _GEN_993 : _GEN_961; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1010 = ~procState3c ? _GEN_994 : _GEN_962; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1011 = ~procState3c ? _GEN_995 : _GEN_963; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1012 = ~procState3c ? _GEN_996 : _GEN_964; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1013 = ~procState3c ? _GEN_997 : _GEN_965; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1014 = ~procState3c ? _GEN_998 : _GEN_966; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1015 = ~procState3c ? _GEN_999 : _GEN_967; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1016 = ~procState3c ? _GEN_1000 : _GEN_968; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1017 = ~procState3c ? _GEN_1001 : _GEN_969; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1018 = ~procState3c ? _GEN_1002 : _GEN_970; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1019 = 3'h0 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1003; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1020 = 3'h1 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1004; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1021 = 3'h2 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1005; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1022 = 3'h3 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1006; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1023 = 3'h4 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1007; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1024 = 3'h5 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1008; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1025 = 3'h6 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1009; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1026 = 3'h7 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1010; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1027 = 3'h0 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1011; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1028 = 3'h1 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1012; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1029 = 3'h2 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1013; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1030 = 3'h3 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1014; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1031 = 3'h4 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1015; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1032 = 3'h5 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1016; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1033 = 3'h6 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1017; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1034 = 3'h7 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_1018; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1035 = _srcBufferNext_T_3 ? _GEN_1019 : _GEN_1003; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1036 = _srcBufferNext_T_3 ? _GEN_1020 : _GEN_1004; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1037 = _srcBufferNext_T_3 ? _GEN_1021 : _GEN_1005; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1038 = _srcBufferNext_T_3 ? _GEN_1022 : _GEN_1006; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1039 = _srcBufferNext_T_3 ? _GEN_1023 : _GEN_1007; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1040 = _srcBufferNext_T_3 ? _GEN_1024 : _GEN_1008; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1041 = _srcBufferNext_T_3 ? _GEN_1025 : _GEN_1009; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1042 = _srcBufferNext_T_3 ? _GEN_1026 : _GEN_1010; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1043 = _srcBufferNext_T_3 ? _GEN_1011 : _GEN_1027; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1044 = _srcBufferNext_T_3 ? _GEN_1012 : _GEN_1028; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1045 = _srcBufferNext_T_3 ? _GEN_1013 : _GEN_1029; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1046 = _srcBufferNext_T_3 ? _GEN_1014 : _GEN_1030; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1047 = _srcBufferNext_T_3 ? _GEN_1015 : _GEN_1031; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1048 = _srcBufferNext_T_3 ? _GEN_1016 : _GEN_1032; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1049 = _srcBufferNext_T_3 ? _GEN_1017 : _GEN_1033; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1050 = _srcBufferNext_T_3 ? _GEN_1018 : _GEN_1034; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1051 = ~procState3c ? _GEN_1035 : _GEN_1003; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1052 = ~procState3c ? _GEN_1036 : _GEN_1004; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1053 = ~procState3c ? _GEN_1037 : _GEN_1005; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1054 = ~procState3c ? _GEN_1038 : _GEN_1006; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1055 = ~procState3c ? _GEN_1039 : _GEN_1007; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1056 = ~procState3c ? _GEN_1040 : _GEN_1008; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1057 = ~procState3c ? _GEN_1041 : _GEN_1009; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1058 = ~procState3c ? _GEN_1042 : _GEN_1010; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1059 = ~procState3c ? _GEN_1043 : _GEN_1011; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1060 = ~procState3c ? _GEN_1044 : _GEN_1012; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1061 = ~procState3c ? _GEN_1045 : _GEN_1013; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1062 = ~procState3c ? _GEN_1046 : _GEN_1014; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1063 = ~procState3c ? _GEN_1047 : _GEN_1015; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1064 = ~procState3c ? _GEN_1048 : _GEN_1016; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1065 = ~procState3c ? _GEN_1049 : _GEN_1017; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1066 = ~procState3c ? _GEN_1050 : _GEN_1018; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1067 = 3'h0 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1051; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1068 = 3'h1 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1052; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1069 = 3'h2 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1053; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1070 = 3'h3 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1054; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1071 = 3'h4 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1055; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1072 = 3'h5 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1056; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1073 = 3'h6 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1057; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1074 = 3'h7 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1058; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1075 = 3'h0 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1059; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1076 = 3'h1 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1060; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1077 = 3'h2 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1061; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1078 = 3'h3 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1062; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1079 = 3'h4 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1063; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1080 = 3'h5 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1064; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1081 = 3'h6 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1065; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1082 = 3'h7 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1066; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1083 = _srcBufferNext_T_3 ? _GEN_1067 : _GEN_1051; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1084 = _srcBufferNext_T_3 ? _GEN_1068 : _GEN_1052; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1085 = _srcBufferNext_T_3 ? _GEN_1069 : _GEN_1053; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1086 = _srcBufferNext_T_3 ? _GEN_1070 : _GEN_1054; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1087 = _srcBufferNext_T_3 ? _GEN_1071 : _GEN_1055; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1088 = _srcBufferNext_T_3 ? _GEN_1072 : _GEN_1056; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1089 = _srcBufferNext_T_3 ? _GEN_1073 : _GEN_1057; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1090 = _srcBufferNext_T_3 ? _GEN_1074 : _GEN_1058; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1091 = _srcBufferNext_T_3 ? _GEN_1059 : _GEN_1075; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1092 = _srcBufferNext_T_3 ? _GEN_1060 : _GEN_1076; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1093 = _srcBufferNext_T_3 ? _GEN_1061 : _GEN_1077; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1094 = _srcBufferNext_T_3 ? _GEN_1062 : _GEN_1078; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1095 = _srcBufferNext_T_3 ? _GEN_1063 : _GEN_1079; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1096 = _srcBufferNext_T_3 ? _GEN_1064 : _GEN_1080; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1097 = _srcBufferNext_T_3 ? _GEN_1065 : _GEN_1081; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1098 = _srcBufferNext_T_3 ? _GEN_1066 : _GEN_1082; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1099 = ~procState3c ? _GEN_1083 : _GEN_1051; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1100 = ~procState3c ? _GEN_1084 : _GEN_1052; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1101 = ~procState3c ? _GEN_1085 : _GEN_1053; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1102 = ~procState3c ? _GEN_1086 : _GEN_1054; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1103 = ~procState3c ? _GEN_1087 : _GEN_1055; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1104 = ~procState3c ? _GEN_1088 : _GEN_1056; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1105 = ~procState3c ? _GEN_1089 : _GEN_1057; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1106 = ~procState3c ? _GEN_1090 : _GEN_1058; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1107 = ~procState3c ? _GEN_1091 : _GEN_1059; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1108 = ~procState3c ? _GEN_1092 : _GEN_1060; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1109 = ~procState3c ? _GEN_1093 : _GEN_1061; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1110 = ~procState3c ? _GEN_1094 : _GEN_1062; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1111 = ~procState3c ? _GEN_1095 : _GEN_1063; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1112 = ~procState3c ? _GEN_1096 : _GEN_1064; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1113 = ~procState3c ? _GEN_1097 : _GEN_1065; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1114 = ~procState3c ? _GEN_1098 : _GEN_1066; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1115 = 3'h0 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1099; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1116 = 3'h1 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1100; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1117 = 3'h2 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1101; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1118 = 3'h3 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1102; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1119 = 3'h4 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1103; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1120 = 3'h5 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1104; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1121 = 3'h6 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1105; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1122 = 3'h7 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1106; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1123 = 3'h0 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1107; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1124 = 3'h1 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1108; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1125 = 3'h2 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1109; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1126 = 3'h3 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1110; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1127 = 3'h4 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1111; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1128 = 3'h5 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1112; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1129 = 3'h6 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1113; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1130 = 3'h7 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1114; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1131 = _srcBufferNext_T_3 ? _GEN_1115 : _GEN_1099; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1132 = _srcBufferNext_T_3 ? _GEN_1116 : _GEN_1100; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1133 = _srcBufferNext_T_3 ? _GEN_1117 : _GEN_1101; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1134 = _srcBufferNext_T_3 ? _GEN_1118 : _GEN_1102; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1135 = _srcBufferNext_T_3 ? _GEN_1119 : _GEN_1103; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1136 = _srcBufferNext_T_3 ? _GEN_1120 : _GEN_1104; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1137 = _srcBufferNext_T_3 ? _GEN_1121 : _GEN_1105; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1138 = _srcBufferNext_T_3 ? _GEN_1122 : _GEN_1106; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1139 = _srcBufferNext_T_3 ? _GEN_1107 : _GEN_1123; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1140 = _srcBufferNext_T_3 ? _GEN_1108 : _GEN_1124; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1141 = _srcBufferNext_T_3 ? _GEN_1109 : _GEN_1125; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1142 = _srcBufferNext_T_3 ? _GEN_1110 : _GEN_1126; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1143 = _srcBufferNext_T_3 ? _GEN_1111 : _GEN_1127; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1144 = _srcBufferNext_T_3 ? _GEN_1112 : _GEN_1128; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1145 = _srcBufferNext_T_3 ? _GEN_1113 : _GEN_1129; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1146 = _srcBufferNext_T_3 ? _GEN_1114 : _GEN_1130; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1147 = ~procState3c ? _GEN_1131 : _GEN_1099; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1148 = ~procState3c ? _GEN_1132 : _GEN_1100; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1149 = ~procState3c ? _GEN_1133 : _GEN_1101; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1150 = ~procState3c ? _GEN_1134 : _GEN_1102; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1151 = ~procState3c ? _GEN_1135 : _GEN_1103; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1152 = ~procState3c ? _GEN_1136 : _GEN_1104; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1153 = ~procState3c ? _GEN_1137 : _GEN_1105; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1154 = ~procState3c ? _GEN_1138 : _GEN_1106; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1155 = ~procState3c ? _GEN_1139 : _GEN_1107; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1156 = ~procState3c ? _GEN_1140 : _GEN_1108; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1157 = ~procState3c ? _GEN_1141 : _GEN_1109; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1158 = ~procState3c ? _GEN_1142 : _GEN_1110; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1159 = ~procState3c ? _GEN_1143 : _GEN_1111; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1160 = ~procState3c ? _GEN_1144 : _GEN_1112; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1161 = ~procState3c ? _GEN_1145 : _GEN_1113; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1162 = ~procState3c ? _GEN_1146 : _GEN_1114; // @[FFTEngine.scala 438:28]
  wire [5:0] _GEN_1163 = 3'h0 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1147; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1164 = 3'h1 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1148; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1165 = 3'h2 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1149; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1166 = 3'h3 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1150; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1167 = 3'h4 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1151; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1168 = 3'h5 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1152; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1169 = 3'h6 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1153; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1170 = 3'h7 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1154; // @[FFTEngine.scala 440:{54,54}]
  wire [5:0] _GEN_1171 = 3'h0 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1155; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1172 = 3'h1 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1156; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1173 = 3'h2 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1157; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1174 = 3'h3 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1158; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1175 = 3'h4 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1159; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1176 = 3'h5 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1160; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1177 = 3'h6 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1161; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1178 = 3'h7 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1162; // @[FFTEngine.scala 442:{54,54}]
  wire [5:0] _GEN_1179 = _srcBufferNext_T_3 ? _GEN_1163 : _GEN_1147; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1180 = _srcBufferNext_T_3 ? _GEN_1164 : _GEN_1148; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1181 = _srcBufferNext_T_3 ? _GEN_1165 : _GEN_1149; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1182 = _srcBufferNext_T_3 ? _GEN_1166 : _GEN_1150; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1183 = _srcBufferNext_T_3 ? _GEN_1167 : _GEN_1151; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1184 = _srcBufferNext_T_3 ? _GEN_1168 : _GEN_1152; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1185 = _srcBufferNext_T_3 ? _GEN_1169 : _GEN_1153; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1186 = _srcBufferNext_T_3 ? _GEN_1170 : _GEN_1154; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1187 = _srcBufferNext_T_3 ? _GEN_1155 : _GEN_1171; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1188 = _srcBufferNext_T_3 ? _GEN_1156 : _GEN_1172; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1189 = _srcBufferNext_T_3 ? _GEN_1157 : _GEN_1173; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1190 = _srcBufferNext_T_3 ? _GEN_1158 : _GEN_1174; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1191 = _srcBufferNext_T_3 ? _GEN_1159 : _GEN_1175; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1192 = _srcBufferNext_T_3 ? _GEN_1160 : _GEN_1176; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1193 = _srcBufferNext_T_3 ? _GEN_1161 : _GEN_1177; // @[FFTEngine.scala 439:37]
  wire [5:0] _GEN_1194 = _srcBufferNext_T_3 ? _GEN_1162 : _GEN_1178; // @[FFTEngine.scala 439:37]
  wire [15:0] writeDataPre3c_0_re = fftCalc_io_dataOut3c_0_re; // @[FFTEngine.scala 387:30 388:23]
  wire [14:0] _writeData3c_0_re_T = writeDataPre3c_0_re[15:1]; // @[FFTEngine.scala 463:55]
  wire [14:0] _writeData3c_0_im_T = writeDataPre3c_1_re[15:1]; // @[FFTEngine.scala 464:55]
  wire [15:0] _GEN_1211 = ~io_fftMode & _T_12 ? $signed({{1{_writeData3c_0_re_T[14]}},_writeData3c_0_re_T}) : $signed(
    writeDataPre3c_0_re); // @[FFTEngine.scala 462:51 463:31 467:28]
  wire [15:0] writeDataPre3c_0_im = fftCalc_io_dataOut3c_0_im; // @[FFTEngine.scala 387:30 388:23]
  wire [15:0] _GEN_1212 = ~io_fftMode & _T_12 ? $signed({{1{_writeData3c_0_im_T[14]}},_writeData3c_0_im_T}) : $signed(
    writeDataPre3c_0_im); // @[FFTEngine.scala 462:51 464:31 467:28]
  wire [15:0] _GEN_1216 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeDataPre3c_1_re) : $signed(_GEN_1212); // @[FFTEngine.scala 458:43 460:31]
  wire [15:0] writeData3c_0_im = sameAddr3c ? $signed(_GEN_1216) : $signed(writeDataPre3c_0_im); // @[FFTEngine.scala 457:22 471:24]
  wire [15:0] _GEN_1213 = ~io_fftMode & _T_12 ? $signed(writeData3c_0_im) : $signed(writeDataPre3c_1_im); // @[FFTEngine.scala 462:51 465:28 468:28]
  wire [15:0] _GEN_1215 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeDataPre3c_0_re) : $signed(_GEN_1211); // @[FFTEngine.scala 458:43 459:31]
  wire [15:0] writeData3c_0_re = sameAddr3c ? $signed(_GEN_1215) : $signed(writeDataPre3c_0_re); // @[FFTEngine.scala 457:22 471:24]
  wire [15:0] _GEN_1214 = ~io_fftMode & _T_12 ? $signed(writeData3c_0_re) : $signed(writeDataPre3c_1_re); // @[FFTEngine.scala 462:51 465:28 468:28]
  wire [15:0] _GEN_1217 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeData3c_0_im) : $signed(_GEN_1213); // @[FFTEngine.scala 458:43 461:28]
  wire [15:0] _GEN_1218 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeData3c_0_re) : $signed(_GEN_1214); // @[FFTEngine.scala 458:43 461:28]
  wire [15:0] _writeData3c_1_im_T_2 = 16'sh0 - $signed(writeDataPre3c_1_im); // @[FFTEngine.scala 474:34]
  wire [15:0] _GEN_1220 = _addrInBankSel3c_0_T_1 & addrInBankSel3c_1 == 4'h4 & addrIn3c_1_r == 6'h1 ? $signed(
    _writeData3c_1_im_T_2) : $signed(writeDataPre3c_1_im); // @[FFTEngine.scala 472:121 474:31 477:31]
  wire [15:0] _io_writeDataSram0Bank_0_T = sameAddr3c ? $signed(_GEN_1215) : $signed(writeDataPre3c_0_re); // @[FFTEngine.scala 488:60]
  wire [15:0] _io_writeDataSram0Bank_0_T_1 = sameAddr3c ? $signed(_GEN_1216) : $signed(writeDataPre3c_0_im); // @[FFTEngine.scala 488:60]
  wire [31:0] _io_writeDataSram0Bank_0_T_2 = {_io_writeDataSram0Bank_0_T_1,_io_writeDataSram0Bank_0_T}; // @[FFTEngine.scala 488:60]
  wire  _T_182 = 4'h0 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_3 = sameAddr3c ? $signed(_GEN_1218) : $signed(writeDataPre3c_1_re); // @[FFTEngine.scala 491:60]
  wire [15:0] _io_writeDataSram0Bank_0_T_4 = sameAddr3c ? $signed(_GEN_1217) : $signed(_GEN_1220); // @[FFTEngine.scala 491:60]
  wire [31:0] _io_writeDataSram0Bank_0_T_5 = {_io_writeDataSram0Bank_0_T_4,_io_writeDataSram0Bank_0_T_3}; // @[FFTEngine.scala 491:60]
  wire [31:0] _GEN_1227 = 4'h0 == addrInBankSel3c_0 ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 487:46 488:42]
  wire [31:0] _GEN_1231 = _T_182 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_14 = {fftCalc_io_dataOut3c_2_im,fftCalc_io_dataOut3c_2_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1233 = 4'h0 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1231; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_17 = {fftCalc_io_dataOut3c_3_im,fftCalc_io_dataOut3c_3_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1235 = 4'h0 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1233; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_20 = {fftCalc_io_dataOut3c_4_im,fftCalc_io_dataOut3c_4_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1237 = 4'h0 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1235; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_23 = {fftCalc_io_dataOut3c_5_im,fftCalc_io_dataOut3c_5_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1239 = 4'h0 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1237; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_26 = {fftCalc_io_dataOut3c_6_im,fftCalc_io_dataOut3c_6_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1241 = 4'h0 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1239; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_29 = {fftCalc_io_dataOut3c_7_im,fftCalc_io_dataOut3c_7_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1243 = 4'h0 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1241; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_192 = 4'h1 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1249 = 4'h1 == addrInBankSel3c_0 ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 487:46 488:42]
  wire [31:0] _GEN_1253 = _T_192 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1255 = 4'h1 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1253; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1257 = 4'h1 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1255; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1259 = 4'h1 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1257; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1261 = 4'h1 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1259; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1263 = 4'h1 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1261; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1265 = 4'h1 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1263; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_202 = 4'h2 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1271 = 4'h2 == addrInBankSel3c_0 ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 487:46 488:42]
  wire [31:0] _GEN_1275 = _T_202 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1277 = 4'h2 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1275; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1279 = 4'h2 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1277; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1281 = 4'h2 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1279; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1283 = 4'h2 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1281; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1285 = 4'h2 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1283; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1287 = 4'h2 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1285; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_212 = 4'h3 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1293 = 4'h3 == addrInBankSel3c_0 ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 487:46 488:42]
  wire [31:0] _GEN_1297 = _T_212 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1299 = 4'h3 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1297; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1301 = 4'h3 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1299; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1303 = 4'h3 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1301; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1305 = 4'h3 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1303; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1307 = 4'h3 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1305; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1309 = 4'h3 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1307; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_222 = 4'h4 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1315 = 4'h4 == addrInBankSel3c_0 ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 487:46 488:42]
  wire [31:0] _GEN_1319 = _T_222 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1321 = 4'h4 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1319; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1323 = 4'h4 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1321; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1325 = 4'h4 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1323; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1327 = 4'h4 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1325; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1329 = 4'h4 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1327; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1331 = 4'h4 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1329; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_232 = 4'h5 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1337 = 4'h5 == addrInBankSel3c_0 ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 487:46 488:42]
  wire [31:0] _GEN_1341 = _T_232 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1343 = 4'h5 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1341; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1345 = 4'h5 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1343; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1347 = 4'h5 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1345; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1349 = 4'h5 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1347; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1351 = 4'h5 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1349; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1353 = 4'h5 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1351; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_242 = 4'h6 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1359 = 4'h6 == addrInBankSel3c_0 ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 487:46 488:42]
  wire [31:0] _GEN_1363 = _T_242 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1365 = 4'h6 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1363; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1367 = 4'h6 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1365; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1369 = 4'h6 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1367; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1371 = 4'h6 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1369; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1373 = 4'h6 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1371; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1375 = 4'h6 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1373; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_252 = 4'h7 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1381 = 4'h7 == addrInBankSel3c_0 ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 487:46 488:42]
  wire [31:0] _GEN_1385 = _T_252 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1387 = 4'h7 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1385; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1389 = 4'h7 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1387; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1391 = 4'h7 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1389; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1393 = 4'h7 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1391; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1395 = 4'h7 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1393; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1397 = 4'h7 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1395; // @[FFTEngine.scala 496:50 497:46]
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
    .io_procMode(fftCalc_io_procMode),
    .io_state1c(fftCalc_io_state1c),
    .io_state2c(fftCalc_io_state2c)
  );
  assign io_readEnableSram0Bank_0 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_1 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_2 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_3 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_4 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_5 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_6 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram0Bank_7 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 335:49]
  assign io_readEnableSram1Bank_0 = readEnable & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_1 = readEnable & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_2 = readEnable & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_3 = readEnable & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_4 = readEnable & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_5 = readEnable & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_6 = readEnable & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_readEnableSram1Bank_7 = readEnable & srcBuffer; // @[FFTEngine.scala 336:49]
  assign io_writeDataSram0Bank_0 = procState3c ? _GEN_1227 : _GEN_1243; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram0Bank_1 = procState3c ? _GEN_1249 : _GEN_1265; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram0Bank_2 = procState3c ? _GEN_1271 : _GEN_1287; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram0Bank_3 = procState3c ? _GEN_1293 : _GEN_1309; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram0Bank_4 = procState3c ? _GEN_1315 : _GEN_1331; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram0Bank_5 = procState3c ? _GEN_1337 : _GEN_1353; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram0Bank_6 = procState3c ? _GEN_1359 : _GEN_1375; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram0Bank_7 = procState3c ? _GEN_1381 : _GEN_1397; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram1Bank_0 = procState3c ? _GEN_1227 : _GEN_1243; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram1Bank_1 = procState3c ? _GEN_1249 : _GEN_1265; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram1Bank_2 = procState3c ? _GEN_1271 : _GEN_1287; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram1Bank_3 = procState3c ? _GEN_1293 : _GEN_1309; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram1Bank_4 = procState3c ? _GEN_1315 : _GEN_1331; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram1Bank_5 = procState3c ? _GEN_1337 : _GEN_1353; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram1Bank_6 = procState3c ? _GEN_1359 : _GEN_1375; // @[FFTEngine.scala 486:26]
  assign io_writeDataSram1Bank_7 = procState3c ? _GEN_1381 : _GEN_1397; // @[FFTEngine.scala 486:26]
  assign io_writeEnableSram0Bank_0 = procState3c ? _GEN_283 : srcBuffer & kernelState3c; // @[FFTEngine.scala 405:26 414:40]
  assign io_writeEnableSram0Bank_1 = procState3c ? _GEN_287 : srcBuffer & kernelState3c; // @[FFTEngine.scala 405:26 414:40]
  assign io_writeEnableSram0Bank_2 = procState3c ? _GEN_291 : srcBuffer & kernelState3c; // @[FFTEngine.scala 405:26 414:40]
  assign io_writeEnableSram0Bank_3 = procState3c ? _GEN_295 : srcBuffer & kernelState3c; // @[FFTEngine.scala 405:26 414:40]
  assign io_writeEnableSram0Bank_4 = procState3c ? _GEN_299 : srcBuffer & kernelState3c; // @[FFTEngine.scala 405:26 414:40]
  assign io_writeEnableSram0Bank_5 = procState3c ? _GEN_303 : srcBuffer & kernelState3c; // @[FFTEngine.scala 405:26 414:40]
  assign io_writeEnableSram0Bank_6 = procState3c ? _GEN_307 : srcBuffer & kernelState3c; // @[FFTEngine.scala 405:26 414:40]
  assign io_writeEnableSram0Bank_7 = procState3c ? _GEN_311 : srcBuffer & kernelState3c; // @[FFTEngine.scala 405:26 414:40]
  assign io_writeEnableSram1Bank_0 = procState3c ? _GEN_284 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 405:26 415:40]
  assign io_writeEnableSram1Bank_1 = procState3c ? _GEN_288 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 405:26 415:40]
  assign io_writeEnableSram1Bank_2 = procState3c ? _GEN_292 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 405:26 415:40]
  assign io_writeEnableSram1Bank_3 = procState3c ? _GEN_296 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 405:26 415:40]
  assign io_writeEnableSram1Bank_4 = procState3c ? _GEN_300 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 405:26 415:40]
  assign io_writeEnableSram1Bank_5 = procState3c ? _GEN_304 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 405:26 415:40]
  assign io_writeEnableSram1Bank_6 = procState3c ? _GEN_308 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 405:26 415:40]
  assign io_writeEnableSram1Bank_7 = procState3c ? _GEN_312 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 405:26 415:40]
  assign io_addrSram0Bank_0 = ~procState3c ? _GEN_1187 : _GEN_1155; // @[FFTEngine.scala 438:28]
  assign io_addrSram0Bank_1 = ~procState3c ? _GEN_1188 : _GEN_1156; // @[FFTEngine.scala 438:28]
  assign io_addrSram0Bank_2 = ~procState3c ? _GEN_1189 : _GEN_1157; // @[FFTEngine.scala 438:28]
  assign io_addrSram0Bank_3 = ~procState3c ? _GEN_1190 : _GEN_1158; // @[FFTEngine.scala 438:28]
  assign io_addrSram0Bank_4 = ~procState3c ? _GEN_1191 : _GEN_1159; // @[FFTEngine.scala 438:28]
  assign io_addrSram0Bank_5 = ~procState3c ? _GEN_1192 : _GEN_1160; // @[FFTEngine.scala 438:28]
  assign io_addrSram0Bank_6 = ~procState3c ? _GEN_1193 : _GEN_1161; // @[FFTEngine.scala 438:28]
  assign io_addrSram0Bank_7 = ~procState3c ? _GEN_1194 : _GEN_1162; // @[FFTEngine.scala 438:28]
  assign io_addrSram1Bank_0 = ~procState3c ? _GEN_1179 : _GEN_1147; // @[FFTEngine.scala 438:28]
  assign io_addrSram1Bank_1 = ~procState3c ? _GEN_1180 : _GEN_1148; // @[FFTEngine.scala 438:28]
  assign io_addrSram1Bank_2 = ~procState3c ? _GEN_1181 : _GEN_1149; // @[FFTEngine.scala 438:28]
  assign io_addrSram1Bank_3 = ~procState3c ? _GEN_1182 : _GEN_1150; // @[FFTEngine.scala 438:28]
  assign io_addrSram1Bank_4 = ~procState3c ? _GEN_1183 : _GEN_1151; // @[FFTEngine.scala 438:28]
  assign io_addrSram1Bank_5 = ~procState3c ? _GEN_1184 : _GEN_1152; // @[FFTEngine.scala 438:28]
  assign io_addrSram1Bank_6 = ~procState3c ? _GEN_1185 : _GEN_1153; // @[FFTEngine.scala 438:28]
  assign io_addrSram1Bank_7 = ~procState3c ? _GEN_1186 : _GEN_1154; // @[FFTEngine.scala 438:28]
  assign io_fftDone = fftDoneReg; // @[FFTEngine.scala 506:16]
  assign fftCalc_clock = clock;
  assign fftCalc_reset = reset;
  assign fftCalc_io_dataIn_0_im = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_148); // @[FFTEngine.scala 364:35]
  assign fftCalc_io_dataIn_0_re = 3'h7 == addrInBankSel1c_0_r ? $signed(dataInPre_7_re) : $signed(_GEN_139); // @[FFTEngine.scala 363:{29,29}]
  assign fftCalc_io_dataIn_1_im = _fftCalc_io_dataIn_0_im_T_1 ? $signed(16'sh0) : $signed(_GEN_156); // @[FFTEngine.scala 366:35]
  assign fftCalc_io_dataIn_1_re = _fftCalc_io_dataIn_0_im_T_1 ? $signed(_GEN_156) : $signed(_GEN_164); // @[FFTEngine.scala 365:35]
  assign fftCalc_io_dataIn_2_im = 3'h7 == addrInBankSel1c_2_r ? $signed(dataInPre_7_im) : $signed(_GEN_187); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_2_re = 3'h7 == addrInBankSel1c_2_r ? $signed(dataInPre_7_re) : $signed(_GEN_179); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_3_im = 3'h7 == addrInBankSel1c_3_r ? $signed(dataInPre_7_im) : $signed(_GEN_203); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_3_re = 3'h7 == addrInBankSel1c_3_r ? $signed(dataInPre_7_re) : $signed(_GEN_195); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_4_im = 3'h7 == addrInBankSel1c_4_r ? $signed(dataInPre_7_im) : $signed(_GEN_219); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_4_re = 3'h7 == addrInBankSel1c_4_r ? $signed(dataInPre_7_re) : $signed(_GEN_211); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_5_im = 3'h7 == addrInBankSel1c_5_r ? $signed(dataInPre_7_im) : $signed(_GEN_235); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_5_re = 3'h7 == addrInBankSel1c_5_r ? $signed(dataInPre_7_re) : $signed(_GEN_227); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_6_im = 3'h7 == addrInBankSel1c_6_r ? $signed(dataInPre_7_im) : $signed(_GEN_251); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_6_re = 3'h7 == addrInBankSel1c_6_r ? $signed(dataInPre_7_re) : $signed(_GEN_243); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_7_im = 3'h7 == addrInBankSel1c_7_r ? $signed(dataInPre_7_im) : $signed(_GEN_267); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_dataIn_7_re = 3'h7 == addrInBankSel1c_7_r ? $signed(dataInPre_7_re) : $signed(_GEN_259); // @[FFTEngine.scala 368:{30,30}]
  assign fftCalc_io_radixCount = _fftCalc_io_radixCount_T_2[7:0]; // @[FFTEngine.scala 370:27]
  assign fftCalc_io_calcMode = (_radixInit_T_1 | kernelState1c | kernelState2c | kernelState3c) & _T_6 ? 2'h3 : _GEN_273
    ; // @[FFTEngine.scala 374:103 375:29]
  assign fftCalc_io_phaseCount = phaseCount; // @[FFTEngine.scala 383:27]
  assign fftCalc_io_rShiftSym = kernelState1c ? _GEN_271 : phaseCount[0]; // @[FFTEngine.scala 371:32]
  assign fftCalc_io_isFFT = io_fftMode; // @[FFTEngine.scala 372:22]
  assign fftCalc_io_procMode = _radixInit_T_11 | procState1c | procState2c | procState3c; // @[FFTEngine.scala 373:66]
  assign fftCalc_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 384:41]
  assign fftCalc_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 385:41]
  always @(posedge clock) begin
    if (reset) begin // @[FFTEngine.scala 46:27]
      stateReg <= 3'h0; // @[FFTEngine.scala 46:27]
    end else if (3'h0 == stateReg) begin // @[FFTEngine.scala 53:26]
      if (io_fftEngineKick) begin // @[FFTEngine.scala 55:40]
        if (io_fftMode) begin // @[FFTEngine.scala 56:36]
          stateReg <= 3'h1;
        end else begin
          stateReg <= 3'h4;
        end
      end
    end else if (3'h1 == stateReg) begin // @[FFTEngine.scala 53:26]
      if (addrSProc == 9'h3f) begin // @[FFTEngine.scala 62:50]
        stateReg <= 3'h2; // @[FFTEngine.scala 63:30]
      end
    end else if (3'h2 == stateReg) begin // @[FFTEngine.scala 53:26]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_11;
    end
    if (reset) begin // @[FFTEngine.scala 48:29]
      addrSProc <= 9'h0; // @[FFTEngine.scala 48:29]
    end else if (radixInit) begin // @[FFTEngine.scala 158:21]
      addrSProc <= 9'h0; // @[FFTEngine.scala 159:20]
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
      addrIn1c_0_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_0_r <= addrIn_0[5:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_0_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_0_r <= addrIn1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_0_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_0_r <= addrIn2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_1_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_1_r <= addrIn_1[5:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_1_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_1_r <= addrIn1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_1_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_1_r <= addrIn2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_2_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_2_r <= addrKernelPre_2[5:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_2_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_2_r <= addrIn1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_2_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_2_r <= addrIn2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_3_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_3_r <= addrKernelPre_3[5:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_3_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_3_r <= addrIn1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_3_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_3_r <= addrIn2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_4_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_4_r <= addrKernelPre_4[5:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_4_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_4_r <= addrIn1c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_4_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_4_r <= addrIn2c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_5_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_5_r <= addrKernelPre_5[5:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_5_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_5_r <= addrIn1c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_5_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_5_r <= addrIn2c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_6_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_6_r <= addrKernelPre_6[5:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_6_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_6_r <= addrIn1c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_6_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_6_r <= addrIn2c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_7_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_7_r <= addrKernelPre_7[5:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_7_r <= 6'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_7_r <= addrIn1c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_7_r <= 6'h0; // @[Reg.scala 35:20]
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
      addrInBankSelKernel1c_4_r <= _GEN_72;
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
      addrInBankSelKernel1c_5_r <= _GEN_75;
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
      addrInBankSelKernel1c_6_r <= _GEN_78;
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
      addrInBankSelKernel1c_7_r <= _GEN_81;
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
      addrInBankSelProc1c_4_r <= _GEN_96;
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
      addrInBankSelProc1c_5_r <= _GEN_99;
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
      addrInBankSelProc1c_6_r <= _GEN_102;
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
      addrInBankSelProc1c_7_r <= _GEN_105;
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
      procState1c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      procState1c <= _radixInit_T_11;
    end
    if (reset) begin // @[Reg.scala 35:20]
      procState2c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      procState2c <= procState1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      procState3c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      procState3c <= procState2c;
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
      if (_radixInit_T_11) begin // @[FFTEngine.scala 343:36]
        addrInBankSel1c_0_r <= addrInBankSelProc_0;
      end else begin
        addrInBankSel1c_0_r <= addrInBankSelKernel_0;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_0_r <= addrInBankSelProc_0;
    end else begin
      addrInBankSel1c_0_r <= addrInBankSelKernel_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_1_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 343:36]
        addrInBankSel1c_1_r <= addrInBankSelProc_1;
      end else begin
        addrInBankSel1c_1_r <= addrInBankSelKernel_1;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_1_r <= addrInBankSelProc_1;
    end else begin
      addrInBankSel1c_1_r <= addrInBankSelKernel_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_2_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 343:36]
        addrInBankSel1c_2_r <= addrInBankSelProc_2;
      end else begin
        addrInBankSel1c_2_r <= addrInBankSelKernel_2;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_2_r <= addrInBankSelProc_2;
    end else begin
      addrInBankSel1c_2_r <= addrInBankSelKernel_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_3_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 343:36]
        addrInBankSel1c_3_r <= addrInBankSelProc_3;
      end else begin
        addrInBankSel1c_3_r <= addrInBankSelKernel_3;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_3_r <= addrInBankSelProc_3;
    end else begin
      addrInBankSel1c_3_r <= addrInBankSelKernel_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_4_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 343:36]
        addrInBankSel1c_4_r <= addrInBankSelProc_4;
      end else begin
        addrInBankSel1c_4_r <= addrInBankSelKernel_4;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_4_r <= addrInBankSelProc_4;
    end else begin
      addrInBankSel1c_4_r <= addrInBankSelKernel_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_5_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 343:36]
        addrInBankSel1c_5_r <= addrInBankSelProc_5;
      end else begin
        addrInBankSel1c_5_r <= addrInBankSelKernel_5;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_5_r <= addrInBankSelProc_5;
    end else begin
      addrInBankSel1c_5_r <= addrInBankSelKernel_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_6_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 343:36]
        addrInBankSel1c_6_r <= addrInBankSelProc_6;
      end else begin
        addrInBankSel1c_6_r <= addrInBankSelKernel_6;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
      addrInBankSel1c_6_r <= addrInBankSelProc_6;
    end else begin
      addrInBankSel1c_6_r <= addrInBankSelKernel_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrInBankSel1c_7_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 342:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 343:36]
        addrInBankSel1c_7_r <= addrInBankSelProc_7;
      end else begin
        addrInBankSel1c_7_r <= addrInBankSelKernel_7;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 345:36]
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
  addrSProc = _RAND_1[8:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  srcBuffer = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrIn1c_0_r = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  addrIn2c_0_r = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  addrIn3c_0_r = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  addrIn1c_1_r = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  addrIn2c_1_r = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  addrIn3c_1_r = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  addrIn1c_2_r = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  addrIn2c_2_r = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  addrIn3c_2_r = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  addrIn1c_3_r = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  addrIn2c_3_r = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  addrIn3c_3_r = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  addrIn1c_4_r = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  addrIn2c_4_r = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  addrIn3c_4_r = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  addrIn1c_5_r = _RAND_19[5:0];
  _RAND_20 = {1{`RANDOM}};
  addrIn2c_5_r = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  addrIn3c_5_r = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  addrIn1c_6_r = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  addrIn2c_6_r = _RAND_23[5:0];
  _RAND_24 = {1{`RANDOM}};
  addrIn3c_6_r = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  addrIn1c_7_r = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  addrIn2c_7_r = _RAND_26[5:0];
  _RAND_27 = {1{`RANDOM}};
  addrIn3c_7_r = _RAND_27[5:0];
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
  procState1c = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  procState2c = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  procState3c = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  sameAddr1c = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  sameAddr2c = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  sameAddr3c = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  addrInBankSel1c_0_r = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  addrInBankSel1c_1_r = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  addrInBankSel1c_2_r = _RAND_87[2:0];
  _RAND_88 = {1{`RANDOM}};
  addrInBankSel1c_3_r = _RAND_88[2:0];
  _RAND_89 = {1{`RANDOM}};
  addrInBankSel1c_4_r = _RAND_89[2:0];
  _RAND_90 = {1{`RANDOM}};
  addrInBankSel1c_5_r = _RAND_90[2:0];
  _RAND_91 = {1{`RANDOM}};
  addrInBankSel1c_6_r = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  addrInBankSel1c_7_r = _RAND_92[2:0];
  _RAND_93 = {1{`RANDOM}};
  fftDoneReg = _RAND_93[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
