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
  input  [10:0] io_nk,
  input  [1:0]  io_twiLutCaseIndex,
  output [13:0] io_wR,
  output [13:0] io_wI
);
  wire [10:0] _idx_r_pre_T_1 = ~io_nk; // @[FFTTwiddle.scala 36:51]
  wire [10:0] _idx_r_pre_T_3 = _idx_r_pre_T_1 + 11'h1; // @[FFTTwiddle.scala 36:58]
  wire [10:0] _idx_r_pre_T_4 = io_nk[10] ? _idx_r_pre_T_3 : io_nk; // @[FFTTwiddle.scala 36:24]
  wire [9:0] idx_r_pre = _idx_r_pre_T_4[9:0]; // @[FFTTwiddle.scala 36:72]
  wire  _idx_r_T_3 = idx_r_pre[9] & |idx_r_pre[8:0]; // @[FFTTwiddle.scala 38:54]
  wire [9:0] _idx_r_T_4 = ~idx_r_pre; // @[FFTTwiddle.scala 38:98]
  wire [9:0] _idx_r_T_6 = _idx_r_T_4 + 10'h1; // @[FFTTwiddle.scala 38:109]
  wire [9:0] idx_r = idx_r_pre[9] & |idx_r_pre[8:0] ? _idx_r_T_6 : idx_r_pre; // @[FFTTwiddle.scala 38:20]
  wire  lut_chg_sign_flag_i = ~io_nk[10]; // @[FFTTwiddle.scala 46:31]
  wire  chg_sign_flag_r = io_twiLutCaseIndex == 2'h2 ? ~_idx_r_T_3 : _idx_r_T_3; // @[FFTTwiddle.scala 50:30]
  wire  chg_sign_flag_i = io_twiLutCaseIndex == 2'h1 ? ~lut_chg_sign_flag_i : lut_chg_sign_flag_i; // @[FFTTwiddle.scala 51:30]
  wire [13:0] _GEN_6 = 10'h6 == idx_r ? $signed(14'shfff) : $signed(14'sh1000); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_7 = 10'h7 == idx_r ? $signed(14'shfff) : $signed(_GEN_6); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_8 = 10'h8 == idx_r ? $signed(14'shfff) : $signed(_GEN_7); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_9 = 10'h9 == idx_r ? $signed(14'shffe) : $signed(_GEN_8); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_10 = 10'ha == idx_r ? $signed(14'shffe) : $signed(_GEN_9); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_11 = 10'hb == idx_r ? $signed(14'shffe) : $signed(_GEN_10); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_12 = 10'hc == idx_r ? $signed(14'shffd) : $signed(_GEN_11); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_13 = 10'hd == idx_r ? $signed(14'shffd) : $signed(_GEN_12); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_14 = 10'he == idx_r ? $signed(14'shffc) : $signed(_GEN_13); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_15 = 10'hf == idx_r ? $signed(14'shffc) : $signed(_GEN_14); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_16 = 10'h10 == idx_r ? $signed(14'shffb) : $signed(_GEN_15); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_17 = 10'h11 == idx_r ? $signed(14'shffa) : $signed(_GEN_16); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_18 = 10'h12 == idx_r ? $signed(14'shffa) : $signed(_GEN_17); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_19 = 10'h13 == idx_r ? $signed(14'shff9) : $signed(_GEN_18); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_20 = 10'h14 == idx_r ? $signed(14'shff8) : $signed(_GEN_19); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_21 = 10'h15 == idx_r ? $signed(14'shff8) : $signed(_GEN_20); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_22 = 10'h16 == idx_r ? $signed(14'shff7) : $signed(_GEN_21); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_23 = 10'h17 == idx_r ? $signed(14'shff6) : $signed(_GEN_22); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_24 = 10'h18 == idx_r ? $signed(14'shff5) : $signed(_GEN_23); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_25 = 10'h19 == idx_r ? $signed(14'shff4) : $signed(_GEN_24); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_26 = 10'h1a == idx_r ? $signed(14'shff3) : $signed(_GEN_25); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_27 = 10'h1b == idx_r ? $signed(14'shff2) : $signed(_GEN_26); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_28 = 10'h1c == idx_r ? $signed(14'shff1) : $signed(_GEN_27); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_29 = 10'h1d == idx_r ? $signed(14'shff0) : $signed(_GEN_28); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_30 = 10'h1e == idx_r ? $signed(14'shfef) : $signed(_GEN_29); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_31 = 10'h1f == idx_r ? $signed(14'shfed) : $signed(_GEN_30); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_32 = 10'h20 == idx_r ? $signed(14'shfec) : $signed(_GEN_31); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_33 = 10'h21 == idx_r ? $signed(14'shfeb) : $signed(_GEN_32); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_34 = 10'h22 == idx_r ? $signed(14'shfea) : $signed(_GEN_33); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_35 = 10'h23 == idx_r ? $signed(14'shfe8) : $signed(_GEN_34); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_36 = 10'h24 == idx_r ? $signed(14'shfe7) : $signed(_GEN_35); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_37 = 10'h25 == idx_r ? $signed(14'shfe6) : $signed(_GEN_36); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_38 = 10'h26 == idx_r ? $signed(14'shfe4) : $signed(_GEN_37); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_39 = 10'h27 == idx_r ? $signed(14'shfe3) : $signed(_GEN_38); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_40 = 10'h28 == idx_r ? $signed(14'shfe1) : $signed(_GEN_39); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_41 = 10'h29 == idx_r ? $signed(14'shfe0) : $signed(_GEN_40); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_42 = 10'h2a == idx_r ? $signed(14'shfde) : $signed(_GEN_41); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_43 = 10'h2b == idx_r ? $signed(14'shfdc) : $signed(_GEN_42); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_44 = 10'h2c == idx_r ? $signed(14'shfdb) : $signed(_GEN_43); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_45 = 10'h2d == idx_r ? $signed(14'shfd9) : $signed(_GEN_44); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_46 = 10'h2e == idx_r ? $signed(14'shfd7) : $signed(_GEN_45); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_47 = 10'h2f == idx_r ? $signed(14'shfd5) : $signed(_GEN_46); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_48 = 10'h30 == idx_r ? $signed(14'shfd4) : $signed(_GEN_47); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_49 = 10'h31 == idx_r ? $signed(14'shfd2) : $signed(_GEN_48); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_50 = 10'h32 == idx_r ? $signed(14'shfd0) : $signed(_GEN_49); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_51 = 10'h33 == idx_r ? $signed(14'shfce) : $signed(_GEN_50); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_52 = 10'h34 == idx_r ? $signed(14'shfcc) : $signed(_GEN_51); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_53 = 10'h35 == idx_r ? $signed(14'shfca) : $signed(_GEN_52); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_54 = 10'h36 == idx_r ? $signed(14'shfc8) : $signed(_GEN_53); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_55 = 10'h37 == idx_r ? $signed(14'shfc6) : $signed(_GEN_54); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_56 = 10'h38 == idx_r ? $signed(14'shfc4) : $signed(_GEN_55); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_57 = 10'h39 == idx_r ? $signed(14'shfc2) : $signed(_GEN_56); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_58 = 10'h3a == idx_r ? $signed(14'shfbf) : $signed(_GEN_57); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_59 = 10'h3b == idx_r ? $signed(14'shfbd) : $signed(_GEN_58); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_60 = 10'h3c == idx_r ? $signed(14'shfbb) : $signed(_GEN_59); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_61 = 10'h3d == idx_r ? $signed(14'shfb8) : $signed(_GEN_60); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_62 = 10'h3e == idx_r ? $signed(14'shfb6) : $signed(_GEN_61); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_63 = 10'h3f == idx_r ? $signed(14'shfb4) : $signed(_GEN_62); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_64 = 10'h40 == idx_r ? $signed(14'shfb1) : $signed(_GEN_63); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_65 = 10'h41 == idx_r ? $signed(14'shfaf) : $signed(_GEN_64); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_66 = 10'h42 == idx_r ? $signed(14'shfac) : $signed(_GEN_65); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_67 = 10'h43 == idx_r ? $signed(14'shfaa) : $signed(_GEN_66); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_68 = 10'h44 == idx_r ? $signed(14'shfa7) : $signed(_GEN_67); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_69 = 10'h45 == idx_r ? $signed(14'shfa5) : $signed(_GEN_68); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_70 = 10'h46 == idx_r ? $signed(14'shfa2) : $signed(_GEN_69); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_71 = 10'h47 == idx_r ? $signed(14'shf9f) : $signed(_GEN_70); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_72 = 10'h48 == idx_r ? $signed(14'shf9c) : $signed(_GEN_71); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_73 = 10'h49 == idx_r ? $signed(14'shf9a) : $signed(_GEN_72); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_74 = 10'h4a == idx_r ? $signed(14'shf97) : $signed(_GEN_73); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_75 = 10'h4b == idx_r ? $signed(14'shf94) : $signed(_GEN_74); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_76 = 10'h4c == idx_r ? $signed(14'shf91) : $signed(_GEN_75); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_77 = 10'h4d == idx_r ? $signed(14'shf8e) : $signed(_GEN_76); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_78 = 10'h4e == idx_r ? $signed(14'shf8b) : $signed(_GEN_77); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_79 = 10'h4f == idx_r ? $signed(14'shf88) : $signed(_GEN_78); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_80 = 10'h50 == idx_r ? $signed(14'shf85) : $signed(_GEN_79); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_81 = 10'h51 == idx_r ? $signed(14'shf82) : $signed(_GEN_80); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_82 = 10'h52 == idx_r ? $signed(14'shf7f) : $signed(_GEN_81); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_83 = 10'h53 == idx_r ? $signed(14'shf7c) : $signed(_GEN_82); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_84 = 10'h54 == idx_r ? $signed(14'shf79) : $signed(_GEN_83); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_85 = 10'h55 == idx_r ? $signed(14'shf76) : $signed(_GEN_84); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_86 = 10'h56 == idx_r ? $signed(14'shf72) : $signed(_GEN_85); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_87 = 10'h57 == idx_r ? $signed(14'shf6f) : $signed(_GEN_86); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_88 = 10'h58 == idx_r ? $signed(14'shf6c) : $signed(_GEN_87); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_89 = 10'h59 == idx_r ? $signed(14'shf68) : $signed(_GEN_88); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_90 = 10'h5a == idx_r ? $signed(14'shf65) : $signed(_GEN_89); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_91 = 10'h5b == idx_r ? $signed(14'shf61) : $signed(_GEN_90); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_92 = 10'h5c == idx_r ? $signed(14'shf5e) : $signed(_GEN_91); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_93 = 10'h5d == idx_r ? $signed(14'shf5a) : $signed(_GEN_92); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_94 = 10'h5e == idx_r ? $signed(14'shf57) : $signed(_GEN_93); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_95 = 10'h5f == idx_r ? $signed(14'shf53) : $signed(_GEN_94); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_96 = 10'h60 == idx_r ? $signed(14'shf50) : $signed(_GEN_95); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_97 = 10'h61 == idx_r ? $signed(14'shf4c) : $signed(_GEN_96); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_98 = 10'h62 == idx_r ? $signed(14'shf48) : $signed(_GEN_97); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_99 = 10'h63 == idx_r ? $signed(14'shf45) : $signed(_GEN_98); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_100 = 10'h64 == idx_r ? $signed(14'shf41) : $signed(_GEN_99); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_101 = 10'h65 == idx_r ? $signed(14'shf3d) : $signed(_GEN_100); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_102 = 10'h66 == idx_r ? $signed(14'shf39) : $signed(_GEN_101); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_103 = 10'h67 == idx_r ? $signed(14'shf35) : $signed(_GEN_102); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_104 = 10'h68 == idx_r ? $signed(14'shf31) : $signed(_GEN_103); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_105 = 10'h69 == idx_r ? $signed(14'shf2d) : $signed(_GEN_104); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_106 = 10'h6a == idx_r ? $signed(14'shf29) : $signed(_GEN_105); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_107 = 10'h6b == idx_r ? $signed(14'shf25) : $signed(_GEN_106); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_108 = 10'h6c == idx_r ? $signed(14'shf21) : $signed(_GEN_107); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_109 = 10'h6d == idx_r ? $signed(14'shf1d) : $signed(_GEN_108); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_110 = 10'h6e == idx_r ? $signed(14'shf19) : $signed(_GEN_109); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_111 = 10'h6f == idx_r ? $signed(14'shf15) : $signed(_GEN_110); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_112 = 10'h70 == idx_r ? $signed(14'shf11) : $signed(_GEN_111); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_113 = 10'h71 == idx_r ? $signed(14'shf0c) : $signed(_GEN_112); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_114 = 10'h72 == idx_r ? $signed(14'shf08) : $signed(_GEN_113); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_115 = 10'h73 == idx_r ? $signed(14'shf04) : $signed(_GEN_114); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_116 = 10'h74 == idx_r ? $signed(14'sheff) : $signed(_GEN_115); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_117 = 10'h75 == idx_r ? $signed(14'shefb) : $signed(_GEN_116); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_118 = 10'h76 == idx_r ? $signed(14'shef7) : $signed(_GEN_117); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_119 = 10'h77 == idx_r ? $signed(14'shef2) : $signed(_GEN_118); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_120 = 10'h78 == idx_r ? $signed(14'sheee) : $signed(_GEN_119); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_121 = 10'h79 == idx_r ? $signed(14'shee9) : $signed(_GEN_120); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_122 = 10'h7a == idx_r ? $signed(14'shee4) : $signed(_GEN_121); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_123 = 10'h7b == idx_r ? $signed(14'shee0) : $signed(_GEN_122); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_124 = 10'h7c == idx_r ? $signed(14'shedb) : $signed(_GEN_123); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_125 = 10'h7d == idx_r ? $signed(14'shed6) : $signed(_GEN_124); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_126 = 10'h7e == idx_r ? $signed(14'shed2) : $signed(_GEN_125); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_127 = 10'h7f == idx_r ? $signed(14'shecd) : $signed(_GEN_126); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_128 = 10'h80 == idx_r ? $signed(14'shec8) : $signed(_GEN_127); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_129 = 10'h81 == idx_r ? $signed(14'shec3) : $signed(_GEN_128); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_130 = 10'h82 == idx_r ? $signed(14'shebf) : $signed(_GEN_129); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_131 = 10'h83 == idx_r ? $signed(14'sheba) : $signed(_GEN_130); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_132 = 10'h84 == idx_r ? $signed(14'sheb5) : $signed(_GEN_131); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_133 = 10'h85 == idx_r ? $signed(14'sheb0) : $signed(_GEN_132); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_134 = 10'h86 == idx_r ? $signed(14'sheab) : $signed(_GEN_133); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_135 = 10'h87 == idx_r ? $signed(14'shea6) : $signed(_GEN_134); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_136 = 10'h88 == idx_r ? $signed(14'shea1) : $signed(_GEN_135); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_137 = 10'h89 == idx_r ? $signed(14'she9b) : $signed(_GEN_136); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_138 = 10'h8a == idx_r ? $signed(14'she96) : $signed(_GEN_137); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_139 = 10'h8b == idx_r ? $signed(14'she91) : $signed(_GEN_138); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_140 = 10'h8c == idx_r ? $signed(14'she8c) : $signed(_GEN_139); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_141 = 10'h8d == idx_r ? $signed(14'she87) : $signed(_GEN_140); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_142 = 10'h8e == idx_r ? $signed(14'she81) : $signed(_GEN_141); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_143 = 10'h8f == idx_r ? $signed(14'she7c) : $signed(_GEN_142); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_144 = 10'h90 == idx_r ? $signed(14'she77) : $signed(_GEN_143); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_145 = 10'h91 == idx_r ? $signed(14'she71) : $signed(_GEN_144); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_146 = 10'h92 == idx_r ? $signed(14'she6c) : $signed(_GEN_145); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_147 = 10'h93 == idx_r ? $signed(14'she66) : $signed(_GEN_146); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_148 = 10'h94 == idx_r ? $signed(14'she61) : $signed(_GEN_147); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_149 = 10'h95 == idx_r ? $signed(14'she5b) : $signed(_GEN_148); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_150 = 10'h96 == idx_r ? $signed(14'she56) : $signed(_GEN_149); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_151 = 10'h97 == idx_r ? $signed(14'she50) : $signed(_GEN_150); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_152 = 10'h98 == idx_r ? $signed(14'she4b) : $signed(_GEN_151); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_153 = 10'h99 == idx_r ? $signed(14'she45) : $signed(_GEN_152); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_154 = 10'h9a == idx_r ? $signed(14'she3f) : $signed(_GEN_153); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_155 = 10'h9b == idx_r ? $signed(14'she3a) : $signed(_GEN_154); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_156 = 10'h9c == idx_r ? $signed(14'she34) : $signed(_GEN_155); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_157 = 10'h9d == idx_r ? $signed(14'she2e) : $signed(_GEN_156); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_158 = 10'h9e == idx_r ? $signed(14'she28) : $signed(_GEN_157); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_159 = 10'h9f == idx_r ? $signed(14'she22) : $signed(_GEN_158); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_160 = 10'ha0 == idx_r ? $signed(14'she1c) : $signed(_GEN_159); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_161 = 10'ha1 == idx_r ? $signed(14'she16) : $signed(_GEN_160); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_162 = 10'ha2 == idx_r ? $signed(14'she10) : $signed(_GEN_161); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_163 = 10'ha3 == idx_r ? $signed(14'she0a) : $signed(_GEN_162); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_164 = 10'ha4 == idx_r ? $signed(14'she04) : $signed(_GEN_163); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_165 = 10'ha5 == idx_r ? $signed(14'shdfe) : $signed(_GEN_164); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_166 = 10'ha6 == idx_r ? $signed(14'shdf8) : $signed(_GEN_165); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_167 = 10'ha7 == idx_r ? $signed(14'shdf2) : $signed(_GEN_166); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_168 = 10'ha8 == idx_r ? $signed(14'shdec) : $signed(_GEN_167); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_169 = 10'ha9 == idx_r ? $signed(14'shde6) : $signed(_GEN_168); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_170 = 10'haa == idx_r ? $signed(14'shddf) : $signed(_GEN_169); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_171 = 10'hab == idx_r ? $signed(14'shdd9) : $signed(_GEN_170); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_172 = 10'hac == idx_r ? $signed(14'shdd3) : $signed(_GEN_171); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_173 = 10'had == idx_r ? $signed(14'shdcc) : $signed(_GEN_172); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_174 = 10'hae == idx_r ? $signed(14'shdc6) : $signed(_GEN_173); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_175 = 10'haf == idx_r ? $signed(14'shdc0) : $signed(_GEN_174); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_176 = 10'hb0 == idx_r ? $signed(14'shdb9) : $signed(_GEN_175); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_177 = 10'hb1 == idx_r ? $signed(14'shdb3) : $signed(_GEN_176); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_178 = 10'hb2 == idx_r ? $signed(14'shdac) : $signed(_GEN_177); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_179 = 10'hb3 == idx_r ? $signed(14'shda6) : $signed(_GEN_178); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_180 = 10'hb4 == idx_r ? $signed(14'shd9f) : $signed(_GEN_179); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_181 = 10'hb5 == idx_r ? $signed(14'shd99) : $signed(_GEN_180); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_182 = 10'hb6 == idx_r ? $signed(14'shd92) : $signed(_GEN_181); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_183 = 10'hb7 == idx_r ? $signed(14'shd8b) : $signed(_GEN_182); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_184 = 10'hb8 == idx_r ? $signed(14'shd85) : $signed(_GEN_183); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_185 = 10'hb9 == idx_r ? $signed(14'shd7e) : $signed(_GEN_184); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_186 = 10'hba == idx_r ? $signed(14'shd77) : $signed(_GEN_185); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_187 = 10'hbb == idx_r ? $signed(14'shd70) : $signed(_GEN_186); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_188 = 10'hbc == idx_r ? $signed(14'shd69) : $signed(_GEN_187); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_189 = 10'hbd == idx_r ? $signed(14'shd62) : $signed(_GEN_188); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_190 = 10'hbe == idx_r ? $signed(14'shd5c) : $signed(_GEN_189); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_191 = 10'hbf == idx_r ? $signed(14'shd55) : $signed(_GEN_190); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_192 = 10'hc0 == idx_r ? $signed(14'shd4e) : $signed(_GEN_191); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_193 = 10'hc1 == idx_r ? $signed(14'shd47) : $signed(_GEN_192); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_194 = 10'hc2 == idx_r ? $signed(14'shd40) : $signed(_GEN_193); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_195 = 10'hc3 == idx_r ? $signed(14'shd39) : $signed(_GEN_194); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_196 = 10'hc4 == idx_r ? $signed(14'shd32) : $signed(_GEN_195); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_197 = 10'hc5 == idx_r ? $signed(14'shd2a) : $signed(_GEN_196); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_198 = 10'hc6 == idx_r ? $signed(14'shd23) : $signed(_GEN_197); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_199 = 10'hc7 == idx_r ? $signed(14'shd1c) : $signed(_GEN_198); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_200 = 10'hc8 == idx_r ? $signed(14'shd15) : $signed(_GEN_199); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_201 = 10'hc9 == idx_r ? $signed(14'shd0e) : $signed(_GEN_200); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_202 = 10'hca == idx_r ? $signed(14'shd06) : $signed(_GEN_201); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_203 = 10'hcb == idx_r ? $signed(14'shcff) : $signed(_GEN_202); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_204 = 10'hcc == idx_r ? $signed(14'shcf8) : $signed(_GEN_203); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_205 = 10'hcd == idx_r ? $signed(14'shcf0) : $signed(_GEN_204); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_206 = 10'hce == idx_r ? $signed(14'shce9) : $signed(_GEN_205); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_207 = 10'hcf == idx_r ? $signed(14'shce1) : $signed(_GEN_206); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_208 = 10'hd0 == idx_r ? $signed(14'shcda) : $signed(_GEN_207); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_209 = 10'hd1 == idx_r ? $signed(14'shcd2) : $signed(_GEN_208); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_210 = 10'hd2 == idx_r ? $signed(14'shccb) : $signed(_GEN_209); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_211 = 10'hd3 == idx_r ? $signed(14'shcc3) : $signed(_GEN_210); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_212 = 10'hd4 == idx_r ? $signed(14'shcbc) : $signed(_GEN_211); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_213 = 10'hd5 == idx_r ? $signed(14'shcb4) : $signed(_GEN_212); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_214 = 10'hd6 == idx_r ? $signed(14'shcac) : $signed(_GEN_213); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_215 = 10'hd7 == idx_r ? $signed(14'shca5) : $signed(_GEN_214); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_216 = 10'hd8 == idx_r ? $signed(14'shc9d) : $signed(_GEN_215); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_217 = 10'hd9 == idx_r ? $signed(14'shc95) : $signed(_GEN_216); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_218 = 10'hda == idx_r ? $signed(14'shc8e) : $signed(_GEN_217); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_219 = 10'hdb == idx_r ? $signed(14'shc86) : $signed(_GEN_218); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_220 = 10'hdc == idx_r ? $signed(14'shc7e) : $signed(_GEN_219); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_221 = 10'hdd == idx_r ? $signed(14'shc76) : $signed(_GEN_220); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_222 = 10'hde == idx_r ? $signed(14'shc6e) : $signed(_GEN_221); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_223 = 10'hdf == idx_r ? $signed(14'shc66) : $signed(_GEN_222); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_224 = 10'he0 == idx_r ? $signed(14'shc5e) : $signed(_GEN_223); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_225 = 10'he1 == idx_r ? $signed(14'shc56) : $signed(_GEN_224); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_226 = 10'he2 == idx_r ? $signed(14'shc4e) : $signed(_GEN_225); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_227 = 10'he3 == idx_r ? $signed(14'shc46) : $signed(_GEN_226); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_228 = 10'he4 == idx_r ? $signed(14'shc3e) : $signed(_GEN_227); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_229 = 10'he5 == idx_r ? $signed(14'shc36) : $signed(_GEN_228); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_230 = 10'he6 == idx_r ? $signed(14'shc2e) : $signed(_GEN_229); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_231 = 10'he7 == idx_r ? $signed(14'shc26) : $signed(_GEN_230); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_232 = 10'he8 == idx_r ? $signed(14'shc1e) : $signed(_GEN_231); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_233 = 10'he9 == idx_r ? $signed(14'shc15) : $signed(_GEN_232); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_234 = 10'hea == idx_r ? $signed(14'shc0d) : $signed(_GEN_233); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_235 = 10'heb == idx_r ? $signed(14'shc05) : $signed(_GEN_234); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_236 = 10'hec == idx_r ? $signed(14'shbfc) : $signed(_GEN_235); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_237 = 10'hed == idx_r ? $signed(14'shbf4) : $signed(_GEN_236); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_238 = 10'hee == idx_r ? $signed(14'shbec) : $signed(_GEN_237); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_239 = 10'hef == idx_r ? $signed(14'shbe3) : $signed(_GEN_238); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_240 = 10'hf0 == idx_r ? $signed(14'shbdb) : $signed(_GEN_239); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_241 = 10'hf1 == idx_r ? $signed(14'shbd2) : $signed(_GEN_240); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_242 = 10'hf2 == idx_r ? $signed(14'shbca) : $signed(_GEN_241); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_243 = 10'hf3 == idx_r ? $signed(14'shbc1) : $signed(_GEN_242); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_244 = 10'hf4 == idx_r ? $signed(14'shbb9) : $signed(_GEN_243); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_245 = 10'hf5 == idx_r ? $signed(14'shbb0) : $signed(_GEN_244); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_246 = 10'hf6 == idx_r ? $signed(14'shba8) : $signed(_GEN_245); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_247 = 10'hf7 == idx_r ? $signed(14'shb9f) : $signed(_GEN_246); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_248 = 10'hf8 == idx_r ? $signed(14'shb97) : $signed(_GEN_247); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_249 = 10'hf9 == idx_r ? $signed(14'shb8e) : $signed(_GEN_248); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_250 = 10'hfa == idx_r ? $signed(14'shb85) : $signed(_GEN_249); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_251 = 10'hfb == idx_r ? $signed(14'shb7c) : $signed(_GEN_250); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_252 = 10'hfc == idx_r ? $signed(14'shb74) : $signed(_GEN_251); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_253 = 10'hfd == idx_r ? $signed(14'shb6b) : $signed(_GEN_252); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_254 = 10'hfe == idx_r ? $signed(14'shb62) : $signed(_GEN_253); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_255 = 10'hff == idx_r ? $signed(14'shb59) : $signed(_GEN_254); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_256 = 10'h100 == idx_r ? $signed(14'shb50) : $signed(_GEN_255); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_257 = 10'h101 == idx_r ? $signed(14'shb47) : $signed(_GEN_256); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_258 = 10'h102 == idx_r ? $signed(14'shb3e) : $signed(_GEN_257); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_259 = 10'h103 == idx_r ? $signed(14'shb36) : $signed(_GEN_258); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_260 = 10'h104 == idx_r ? $signed(14'shb2d) : $signed(_GEN_259); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_261 = 10'h105 == idx_r ? $signed(14'shb24) : $signed(_GEN_260); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_262 = 10'h106 == idx_r ? $signed(14'shb1b) : $signed(_GEN_261); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_263 = 10'h107 == idx_r ? $signed(14'shb11) : $signed(_GEN_262); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_264 = 10'h108 == idx_r ? $signed(14'shb08) : $signed(_GEN_263); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_265 = 10'h109 == idx_r ? $signed(14'shaff) : $signed(_GEN_264); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_266 = 10'h10a == idx_r ? $signed(14'shaf6) : $signed(_GEN_265); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_267 = 10'h10b == idx_r ? $signed(14'shaed) : $signed(_GEN_266); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_268 = 10'h10c == idx_r ? $signed(14'shae4) : $signed(_GEN_267); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_269 = 10'h10d == idx_r ? $signed(14'shadb) : $signed(_GEN_268); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_270 = 10'h10e == idx_r ? $signed(14'shad1) : $signed(_GEN_269); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_271 = 10'h10f == idx_r ? $signed(14'shac8) : $signed(_GEN_270); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_272 = 10'h110 == idx_r ? $signed(14'shabf) : $signed(_GEN_271); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_273 = 10'h111 == idx_r ? $signed(14'shab5) : $signed(_GEN_272); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_274 = 10'h112 == idx_r ? $signed(14'shaac) : $signed(_GEN_273); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_275 = 10'h113 == idx_r ? $signed(14'shaa3) : $signed(_GEN_274); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_276 = 10'h114 == idx_r ? $signed(14'sha99) : $signed(_GEN_275); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_277 = 10'h115 == idx_r ? $signed(14'sha90) : $signed(_GEN_276); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_278 = 10'h116 == idx_r ? $signed(14'sha86) : $signed(_GEN_277); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_279 = 10'h117 == idx_r ? $signed(14'sha7d) : $signed(_GEN_278); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_280 = 10'h118 == idx_r ? $signed(14'sha73) : $signed(_GEN_279); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_281 = 10'h119 == idx_r ? $signed(14'sha6a) : $signed(_GEN_280); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_282 = 10'h11a == idx_r ? $signed(14'sha60) : $signed(_GEN_281); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_283 = 10'h11b == idx_r ? $signed(14'sha57) : $signed(_GEN_282); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_284 = 10'h11c == idx_r ? $signed(14'sha4d) : $signed(_GEN_283); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_285 = 10'h11d == idx_r ? $signed(14'sha44) : $signed(_GEN_284); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_286 = 10'h11e == idx_r ? $signed(14'sha3a) : $signed(_GEN_285); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_287 = 10'h11f == idx_r ? $signed(14'sha30) : $signed(_GEN_286); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_288 = 10'h120 == idx_r ? $signed(14'sha26) : $signed(_GEN_287); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_289 = 10'h121 == idx_r ? $signed(14'sha1d) : $signed(_GEN_288); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_290 = 10'h122 == idx_r ? $signed(14'sha13) : $signed(_GEN_289); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_291 = 10'h123 == idx_r ? $signed(14'sha09) : $signed(_GEN_290); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_292 = 10'h124 == idx_r ? $signed(14'sh9ff) : $signed(_GEN_291); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_293 = 10'h125 == idx_r ? $signed(14'sh9f6) : $signed(_GEN_292); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_294 = 10'h126 == idx_r ? $signed(14'sh9ec) : $signed(_GEN_293); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_295 = 10'h127 == idx_r ? $signed(14'sh9e2) : $signed(_GEN_294); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_296 = 10'h128 == idx_r ? $signed(14'sh9d8) : $signed(_GEN_295); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_297 = 10'h129 == idx_r ? $signed(14'sh9ce) : $signed(_GEN_296); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_298 = 10'h12a == idx_r ? $signed(14'sh9c4) : $signed(_GEN_297); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_299 = 10'h12b == idx_r ? $signed(14'sh9ba) : $signed(_GEN_298); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_300 = 10'h12c == idx_r ? $signed(14'sh9b0) : $signed(_GEN_299); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_301 = 10'h12d == idx_r ? $signed(14'sh9a6) : $signed(_GEN_300); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_302 = 10'h12e == idx_r ? $signed(14'sh99c) : $signed(_GEN_301); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_303 = 10'h12f == idx_r ? $signed(14'sh992) : $signed(_GEN_302); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_304 = 10'h130 == idx_r ? $signed(14'sh988) : $signed(_GEN_303); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_305 = 10'h131 == idx_r ? $signed(14'sh97e) : $signed(_GEN_304); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_306 = 10'h132 == idx_r ? $signed(14'sh974) : $signed(_GEN_305); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_307 = 10'h133 == idx_r ? $signed(14'sh96a) : $signed(_GEN_306); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_308 = 10'h134 == idx_r ? $signed(14'sh95f) : $signed(_GEN_307); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_309 = 10'h135 == idx_r ? $signed(14'sh955) : $signed(_GEN_308); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_310 = 10'h136 == idx_r ? $signed(14'sh94b) : $signed(_GEN_309); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_311 = 10'h137 == idx_r ? $signed(14'sh941) : $signed(_GEN_310); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_312 = 10'h138 == idx_r ? $signed(14'sh937) : $signed(_GEN_311); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_313 = 10'h139 == idx_r ? $signed(14'sh92c) : $signed(_GEN_312); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_314 = 10'h13a == idx_r ? $signed(14'sh922) : $signed(_GEN_313); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_315 = 10'h13b == idx_r ? $signed(14'sh918) : $signed(_GEN_314); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_316 = 10'h13c == idx_r ? $signed(14'sh90d) : $signed(_GEN_315); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_317 = 10'h13d == idx_r ? $signed(14'sh903) : $signed(_GEN_316); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_318 = 10'h13e == idx_r ? $signed(14'sh8f8) : $signed(_GEN_317); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_319 = 10'h13f == idx_r ? $signed(14'sh8ee) : $signed(_GEN_318); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_320 = 10'h140 == idx_r ? $signed(14'sh8e4) : $signed(_GEN_319); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_321 = 10'h141 == idx_r ? $signed(14'sh8d9) : $signed(_GEN_320); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_322 = 10'h142 == idx_r ? $signed(14'sh8cf) : $signed(_GEN_321); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_323 = 10'h143 == idx_r ? $signed(14'sh8c4) : $signed(_GEN_322); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_324 = 10'h144 == idx_r ? $signed(14'sh8ba) : $signed(_GEN_323); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_325 = 10'h145 == idx_r ? $signed(14'sh8af) : $signed(_GEN_324); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_326 = 10'h146 == idx_r ? $signed(14'sh8a5) : $signed(_GEN_325); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_327 = 10'h147 == idx_r ? $signed(14'sh89a) : $signed(_GEN_326); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_328 = 10'h148 == idx_r ? $signed(14'sh88f) : $signed(_GEN_327); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_329 = 10'h149 == idx_r ? $signed(14'sh885) : $signed(_GEN_328); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_330 = 10'h14a == idx_r ? $signed(14'sh87a) : $signed(_GEN_329); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_331 = 10'h14b == idx_r ? $signed(14'sh86f) : $signed(_GEN_330); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_332 = 10'h14c == idx_r ? $signed(14'sh865) : $signed(_GEN_331); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_333 = 10'h14d == idx_r ? $signed(14'sh85a) : $signed(_GEN_332); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_334 = 10'h14e == idx_r ? $signed(14'sh84f) : $signed(_GEN_333); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_335 = 10'h14f == idx_r ? $signed(14'sh845) : $signed(_GEN_334); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_336 = 10'h150 == idx_r ? $signed(14'sh83a) : $signed(_GEN_335); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_337 = 10'h151 == idx_r ? $signed(14'sh82f) : $signed(_GEN_336); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_338 = 10'h152 == idx_r ? $signed(14'sh824) : $signed(_GEN_337); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_339 = 10'h153 == idx_r ? $signed(14'sh819) : $signed(_GEN_338); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_340 = 10'h154 == idx_r ? $signed(14'sh80e) : $signed(_GEN_339); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_341 = 10'h155 == idx_r ? $signed(14'sh804) : $signed(_GEN_340); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_342 = 10'h156 == idx_r ? $signed(14'sh7f9) : $signed(_GEN_341); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_343 = 10'h157 == idx_r ? $signed(14'sh7ee) : $signed(_GEN_342); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_344 = 10'h158 == idx_r ? $signed(14'sh7e3) : $signed(_GEN_343); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_345 = 10'h159 == idx_r ? $signed(14'sh7d8) : $signed(_GEN_344); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_346 = 10'h15a == idx_r ? $signed(14'sh7cd) : $signed(_GEN_345); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_347 = 10'h15b == idx_r ? $signed(14'sh7c2) : $signed(_GEN_346); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_348 = 10'h15c == idx_r ? $signed(14'sh7b7) : $signed(_GEN_347); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_349 = 10'h15d == idx_r ? $signed(14'sh7ac) : $signed(_GEN_348); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_350 = 10'h15e == idx_r ? $signed(14'sh7a1) : $signed(_GEN_349); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_351 = 10'h15f == idx_r ? $signed(14'sh796) : $signed(_GEN_350); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_352 = 10'h160 == idx_r ? $signed(14'sh78b) : $signed(_GEN_351); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_353 = 10'h161 == idx_r ? $signed(14'sh780) : $signed(_GEN_352); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_354 = 10'h162 == idx_r ? $signed(14'sh775) : $signed(_GEN_353); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_355 = 10'h163 == idx_r ? $signed(14'sh76a) : $signed(_GEN_354); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_356 = 10'h164 == idx_r ? $signed(14'sh75e) : $signed(_GEN_355); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_357 = 10'h165 == idx_r ? $signed(14'sh753) : $signed(_GEN_356); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_358 = 10'h166 == idx_r ? $signed(14'sh748) : $signed(_GEN_357); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_359 = 10'h167 == idx_r ? $signed(14'sh73d) : $signed(_GEN_358); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_360 = 10'h168 == idx_r ? $signed(14'sh732) : $signed(_GEN_359); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_361 = 10'h169 == idx_r ? $signed(14'sh726) : $signed(_GEN_360); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_362 = 10'h16a == idx_r ? $signed(14'sh71b) : $signed(_GEN_361); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_363 = 10'h16b == idx_r ? $signed(14'sh710) : $signed(_GEN_362); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_364 = 10'h16c == idx_r ? $signed(14'sh705) : $signed(_GEN_363); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_365 = 10'h16d == idx_r ? $signed(14'sh6f9) : $signed(_GEN_364); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_366 = 10'h16e == idx_r ? $signed(14'sh6ee) : $signed(_GEN_365); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_367 = 10'h16f == idx_r ? $signed(14'sh6e3) : $signed(_GEN_366); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_368 = 10'h170 == idx_r ? $signed(14'sh6d7) : $signed(_GEN_367); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_369 = 10'h171 == idx_r ? $signed(14'sh6cc) : $signed(_GEN_368); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_370 = 10'h172 == idx_r ? $signed(14'sh6c1) : $signed(_GEN_369); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_371 = 10'h173 == idx_r ? $signed(14'sh6b5) : $signed(_GEN_370); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_372 = 10'h174 == idx_r ? $signed(14'sh6aa) : $signed(_GEN_371); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_373 = 10'h175 == idx_r ? $signed(14'sh69e) : $signed(_GEN_372); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_374 = 10'h176 == idx_r ? $signed(14'sh693) : $signed(_GEN_373); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_375 = 10'h177 == idx_r ? $signed(14'sh687) : $signed(_GEN_374); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_376 = 10'h178 == idx_r ? $signed(14'sh67c) : $signed(_GEN_375); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_377 = 10'h179 == idx_r ? $signed(14'sh670) : $signed(_GEN_376); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_378 = 10'h17a == idx_r ? $signed(14'sh665) : $signed(_GEN_377); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_379 = 10'h17b == idx_r ? $signed(14'sh659) : $signed(_GEN_378); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_380 = 10'h17c == idx_r ? $signed(14'sh64e) : $signed(_GEN_379); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_381 = 10'h17d == idx_r ? $signed(14'sh642) : $signed(_GEN_380); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_382 = 10'h17e == idx_r ? $signed(14'sh637) : $signed(_GEN_381); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_383 = 10'h17f == idx_r ? $signed(14'sh62b) : $signed(_GEN_382); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_384 = 10'h180 == idx_r ? $signed(14'sh61f) : $signed(_GEN_383); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_385 = 10'h181 == idx_r ? $signed(14'sh614) : $signed(_GEN_384); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_386 = 10'h182 == idx_r ? $signed(14'sh608) : $signed(_GEN_385); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_387 = 10'h183 == idx_r ? $signed(14'sh5fd) : $signed(_GEN_386); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_388 = 10'h184 == idx_r ? $signed(14'sh5f1) : $signed(_GEN_387); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_389 = 10'h185 == idx_r ? $signed(14'sh5e5) : $signed(_GEN_388); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_390 = 10'h186 == idx_r ? $signed(14'sh5da) : $signed(_GEN_389); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_391 = 10'h187 == idx_r ? $signed(14'sh5ce) : $signed(_GEN_390); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_392 = 10'h188 == idx_r ? $signed(14'sh5c2) : $signed(_GEN_391); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_393 = 10'h189 == idx_r ? $signed(14'sh5b6) : $signed(_GEN_392); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_394 = 10'h18a == idx_r ? $signed(14'sh5ab) : $signed(_GEN_393); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_395 = 10'h18b == idx_r ? $signed(14'sh59f) : $signed(_GEN_394); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_396 = 10'h18c == idx_r ? $signed(14'sh593) : $signed(_GEN_395); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_397 = 10'h18d == idx_r ? $signed(14'sh587) : $signed(_GEN_396); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_398 = 10'h18e == idx_r ? $signed(14'sh57c) : $signed(_GEN_397); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_399 = 10'h18f == idx_r ? $signed(14'sh570) : $signed(_GEN_398); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_400 = 10'h190 == idx_r ? $signed(14'sh564) : $signed(_GEN_399); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_401 = 10'h191 == idx_r ? $signed(14'sh558) : $signed(_GEN_400); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_402 = 10'h192 == idx_r ? $signed(14'sh54c) : $signed(_GEN_401); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_403 = 10'h193 == idx_r ? $signed(14'sh540) : $signed(_GEN_402); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_404 = 10'h194 == idx_r ? $signed(14'sh534) : $signed(_GEN_403); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_405 = 10'h195 == idx_r ? $signed(14'sh529) : $signed(_GEN_404); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_406 = 10'h196 == idx_r ? $signed(14'sh51d) : $signed(_GEN_405); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_407 = 10'h197 == idx_r ? $signed(14'sh511) : $signed(_GEN_406); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_408 = 10'h198 == idx_r ? $signed(14'sh505) : $signed(_GEN_407); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_409 = 10'h199 == idx_r ? $signed(14'sh4f9) : $signed(_GEN_408); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_410 = 10'h19a == idx_r ? $signed(14'sh4ed) : $signed(_GEN_409); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_411 = 10'h19b == idx_r ? $signed(14'sh4e1) : $signed(_GEN_410); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_412 = 10'h19c == idx_r ? $signed(14'sh4d5) : $signed(_GEN_411); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_413 = 10'h19d == idx_r ? $signed(14'sh4c9) : $signed(_GEN_412); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_414 = 10'h19e == idx_r ? $signed(14'sh4bd) : $signed(_GEN_413); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_415 = 10'h19f == idx_r ? $signed(14'sh4b1) : $signed(_GEN_414); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_416 = 10'h1a0 == idx_r ? $signed(14'sh4a5) : $signed(_GEN_415); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_417 = 10'h1a1 == idx_r ? $signed(14'sh499) : $signed(_GEN_416); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_418 = 10'h1a2 == idx_r ? $signed(14'sh48d) : $signed(_GEN_417); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_419 = 10'h1a3 == idx_r ? $signed(14'sh481) : $signed(_GEN_418); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_420 = 10'h1a4 == idx_r ? $signed(14'sh475) : $signed(_GEN_419); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_421 = 10'h1a5 == idx_r ? $signed(14'sh469) : $signed(_GEN_420); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_422 = 10'h1a6 == idx_r ? $signed(14'sh45d) : $signed(_GEN_421); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_423 = 10'h1a7 == idx_r ? $signed(14'sh451) : $signed(_GEN_422); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_424 = 10'h1a8 == idx_r ? $signed(14'sh444) : $signed(_GEN_423); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_425 = 10'h1a9 == idx_r ? $signed(14'sh438) : $signed(_GEN_424); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_426 = 10'h1aa == idx_r ? $signed(14'sh42c) : $signed(_GEN_425); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_427 = 10'h1ab == idx_r ? $signed(14'sh420) : $signed(_GEN_426); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_428 = 10'h1ac == idx_r ? $signed(14'sh414) : $signed(_GEN_427); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_429 = 10'h1ad == idx_r ? $signed(14'sh408) : $signed(_GEN_428); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_430 = 10'h1ae == idx_r ? $signed(14'sh3fc) : $signed(_GEN_429); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_431 = 10'h1af == idx_r ? $signed(14'sh3ef) : $signed(_GEN_430); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_432 = 10'h1b0 == idx_r ? $signed(14'sh3e3) : $signed(_GEN_431); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_433 = 10'h1b1 == idx_r ? $signed(14'sh3d7) : $signed(_GEN_432); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_434 = 10'h1b2 == idx_r ? $signed(14'sh3cb) : $signed(_GEN_433); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_435 = 10'h1b3 == idx_r ? $signed(14'sh3bf) : $signed(_GEN_434); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_436 = 10'h1b4 == idx_r ? $signed(14'sh3b2) : $signed(_GEN_435); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_437 = 10'h1b5 == idx_r ? $signed(14'sh3a6) : $signed(_GEN_436); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_438 = 10'h1b6 == idx_r ? $signed(14'sh39a) : $signed(_GEN_437); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_439 = 10'h1b7 == idx_r ? $signed(14'sh38e) : $signed(_GEN_438); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_440 = 10'h1b8 == idx_r ? $signed(14'sh381) : $signed(_GEN_439); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_441 = 10'h1b9 == idx_r ? $signed(14'sh375) : $signed(_GEN_440); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_442 = 10'h1ba == idx_r ? $signed(14'sh369) : $signed(_GEN_441); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_443 = 10'h1bb == idx_r ? $signed(14'sh35d) : $signed(_GEN_442); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_444 = 10'h1bc == idx_r ? $signed(14'sh350) : $signed(_GEN_443); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_445 = 10'h1bd == idx_r ? $signed(14'sh344) : $signed(_GEN_444); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_446 = 10'h1be == idx_r ? $signed(14'sh338) : $signed(_GEN_445); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_447 = 10'h1bf == idx_r ? $signed(14'sh32b) : $signed(_GEN_446); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_448 = 10'h1c0 == idx_r ? $signed(14'sh31f) : $signed(_GEN_447); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_449 = 10'h1c1 == idx_r ? $signed(14'sh313) : $signed(_GEN_448); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_450 = 10'h1c2 == idx_r ? $signed(14'sh306) : $signed(_GEN_449); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_451 = 10'h1c3 == idx_r ? $signed(14'sh2fa) : $signed(_GEN_450); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_452 = 10'h1c4 == idx_r ? $signed(14'sh2ee) : $signed(_GEN_451); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_453 = 10'h1c5 == idx_r ? $signed(14'sh2e1) : $signed(_GEN_452); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_454 = 10'h1c6 == idx_r ? $signed(14'sh2d5) : $signed(_GEN_453); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_455 = 10'h1c7 == idx_r ? $signed(14'sh2c9) : $signed(_GEN_454); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_456 = 10'h1c8 == idx_r ? $signed(14'sh2bc) : $signed(_GEN_455); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_457 = 10'h1c9 == idx_r ? $signed(14'sh2b0) : $signed(_GEN_456); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_458 = 10'h1ca == idx_r ? $signed(14'sh2a3) : $signed(_GEN_457); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_459 = 10'h1cb == idx_r ? $signed(14'sh297) : $signed(_GEN_458); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_460 = 10'h1cc == idx_r ? $signed(14'sh28b) : $signed(_GEN_459); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_461 = 10'h1cd == idx_r ? $signed(14'sh27e) : $signed(_GEN_460); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_462 = 10'h1ce == idx_r ? $signed(14'sh272) : $signed(_GEN_461); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_463 = 10'h1cf == idx_r ? $signed(14'sh265) : $signed(_GEN_462); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_464 = 10'h1d0 == idx_r ? $signed(14'sh259) : $signed(_GEN_463); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_465 = 10'h1d1 == idx_r ? $signed(14'sh24d) : $signed(_GEN_464); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_466 = 10'h1d2 == idx_r ? $signed(14'sh240) : $signed(_GEN_465); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_467 = 10'h1d3 == idx_r ? $signed(14'sh234) : $signed(_GEN_466); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_468 = 10'h1d4 == idx_r ? $signed(14'sh227) : $signed(_GEN_467); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_469 = 10'h1d5 == idx_r ? $signed(14'sh21b) : $signed(_GEN_468); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_470 = 10'h1d6 == idx_r ? $signed(14'sh20e) : $signed(_GEN_469); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_471 = 10'h1d7 == idx_r ? $signed(14'sh202) : $signed(_GEN_470); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_472 = 10'h1d8 == idx_r ? $signed(14'sh1f5) : $signed(_GEN_471); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_473 = 10'h1d9 == idx_r ? $signed(14'sh1e9) : $signed(_GEN_472); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_474 = 10'h1da == idx_r ? $signed(14'sh1dc) : $signed(_GEN_473); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_475 = 10'h1db == idx_r ? $signed(14'sh1d0) : $signed(_GEN_474); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_476 = 10'h1dc == idx_r ? $signed(14'sh1c3) : $signed(_GEN_475); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_477 = 10'h1dd == idx_r ? $signed(14'sh1b7) : $signed(_GEN_476); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_478 = 10'h1de == idx_r ? $signed(14'sh1aa) : $signed(_GEN_477); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_479 = 10'h1df == idx_r ? $signed(14'sh19e) : $signed(_GEN_478); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_480 = 10'h1e0 == idx_r ? $signed(14'sh191) : $signed(_GEN_479); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_481 = 10'h1e1 == idx_r ? $signed(14'sh185) : $signed(_GEN_480); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_482 = 10'h1e2 == idx_r ? $signed(14'sh178) : $signed(_GEN_481); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_483 = 10'h1e3 == idx_r ? $signed(14'sh16c) : $signed(_GEN_482); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_484 = 10'h1e4 == idx_r ? $signed(14'sh15f) : $signed(_GEN_483); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_485 = 10'h1e5 == idx_r ? $signed(14'sh153) : $signed(_GEN_484); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_486 = 10'h1e6 == idx_r ? $signed(14'sh146) : $signed(_GEN_485); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_487 = 10'h1e7 == idx_r ? $signed(14'sh13a) : $signed(_GEN_486); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_488 = 10'h1e8 == idx_r ? $signed(14'sh12d) : $signed(_GEN_487); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_489 = 10'h1e9 == idx_r ? $signed(14'sh121) : $signed(_GEN_488); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_490 = 10'h1ea == idx_r ? $signed(14'sh114) : $signed(_GEN_489); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_491 = 10'h1eb == idx_r ? $signed(14'sh108) : $signed(_GEN_490); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_492 = 10'h1ec == idx_r ? $signed(14'shfb) : $signed(_GEN_491); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_493 = 10'h1ed == idx_r ? $signed(14'shef) : $signed(_GEN_492); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_494 = 10'h1ee == idx_r ? $signed(14'she2) : $signed(_GEN_493); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_495 = 10'h1ef == idx_r ? $signed(14'shd6) : $signed(_GEN_494); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_496 = 10'h1f0 == idx_r ? $signed(14'shc9) : $signed(_GEN_495); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_497 = 10'h1f1 == idx_r ? $signed(14'shbc) : $signed(_GEN_496); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_498 = 10'h1f2 == idx_r ? $signed(14'shb0) : $signed(_GEN_497); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_499 = 10'h1f3 == idx_r ? $signed(14'sha3) : $signed(_GEN_498); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_500 = 10'h1f4 == idx_r ? $signed(14'sh97) : $signed(_GEN_499); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_501 = 10'h1f5 == idx_r ? $signed(14'sh8a) : $signed(_GEN_500); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_502 = 10'h1f6 == idx_r ? $signed(14'sh7e) : $signed(_GEN_501); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_503 = 10'h1f7 == idx_r ? $signed(14'sh71) : $signed(_GEN_502); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_504 = 10'h1f8 == idx_r ? $signed(14'sh65) : $signed(_GEN_503); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_505 = 10'h1f9 == idx_r ? $signed(14'sh58) : $signed(_GEN_504); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_506 = 10'h1fa == idx_r ? $signed(14'sh4b) : $signed(_GEN_505); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_507 = 10'h1fb == idx_r ? $signed(14'sh3f) : $signed(_GEN_506); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_508 = 10'h1fc == idx_r ? $signed(14'sh32) : $signed(_GEN_507); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_509 = 10'h1fd == idx_r ? $signed(14'sh26) : $signed(_GEN_508); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_510 = 10'h1fe == idx_r ? $signed(14'sh19) : $signed(_GEN_509); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_511 = 10'h1ff == idx_r ? $signed(14'shd) : $signed(_GEN_510); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_512 = 10'h200 == idx_r ? $signed(14'sh0) : $signed(_GEN_511); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _io_wR_T_2 = 14'sh0 - $signed(_GEN_512); // @[FFTTwiddle.scala 53:35]
  wire [13:0] _GEN_514 = 10'h1 == idx_r ? $signed(14'shd) : $signed(14'sh0); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_515 = 10'h2 == idx_r ? $signed(14'sh19) : $signed(_GEN_514); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_516 = 10'h3 == idx_r ? $signed(14'sh26) : $signed(_GEN_515); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_517 = 10'h4 == idx_r ? $signed(14'sh32) : $signed(_GEN_516); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_518 = 10'h5 == idx_r ? $signed(14'sh3f) : $signed(_GEN_517); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_519 = 10'h6 == idx_r ? $signed(14'sh4b) : $signed(_GEN_518); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_520 = 10'h7 == idx_r ? $signed(14'sh58) : $signed(_GEN_519); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_521 = 10'h8 == idx_r ? $signed(14'sh65) : $signed(_GEN_520); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_522 = 10'h9 == idx_r ? $signed(14'sh71) : $signed(_GEN_521); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_523 = 10'ha == idx_r ? $signed(14'sh7e) : $signed(_GEN_522); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_524 = 10'hb == idx_r ? $signed(14'sh8a) : $signed(_GEN_523); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_525 = 10'hc == idx_r ? $signed(14'sh97) : $signed(_GEN_524); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_526 = 10'hd == idx_r ? $signed(14'sha3) : $signed(_GEN_525); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_527 = 10'he == idx_r ? $signed(14'shb0) : $signed(_GEN_526); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_528 = 10'hf == idx_r ? $signed(14'shbc) : $signed(_GEN_527); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_529 = 10'h10 == idx_r ? $signed(14'shc9) : $signed(_GEN_528); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_530 = 10'h11 == idx_r ? $signed(14'shd6) : $signed(_GEN_529); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_531 = 10'h12 == idx_r ? $signed(14'she2) : $signed(_GEN_530); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_532 = 10'h13 == idx_r ? $signed(14'shef) : $signed(_GEN_531); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_533 = 10'h14 == idx_r ? $signed(14'shfb) : $signed(_GEN_532); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_534 = 10'h15 == idx_r ? $signed(14'sh108) : $signed(_GEN_533); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_535 = 10'h16 == idx_r ? $signed(14'sh114) : $signed(_GEN_534); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_536 = 10'h17 == idx_r ? $signed(14'sh121) : $signed(_GEN_535); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_537 = 10'h18 == idx_r ? $signed(14'sh12d) : $signed(_GEN_536); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_538 = 10'h19 == idx_r ? $signed(14'sh13a) : $signed(_GEN_537); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_539 = 10'h1a == idx_r ? $signed(14'sh146) : $signed(_GEN_538); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_540 = 10'h1b == idx_r ? $signed(14'sh153) : $signed(_GEN_539); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_541 = 10'h1c == idx_r ? $signed(14'sh15f) : $signed(_GEN_540); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_542 = 10'h1d == idx_r ? $signed(14'sh16c) : $signed(_GEN_541); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_543 = 10'h1e == idx_r ? $signed(14'sh178) : $signed(_GEN_542); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_544 = 10'h1f == idx_r ? $signed(14'sh185) : $signed(_GEN_543); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_545 = 10'h20 == idx_r ? $signed(14'sh191) : $signed(_GEN_544); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_546 = 10'h21 == idx_r ? $signed(14'sh19e) : $signed(_GEN_545); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_547 = 10'h22 == idx_r ? $signed(14'sh1aa) : $signed(_GEN_546); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_548 = 10'h23 == idx_r ? $signed(14'sh1b7) : $signed(_GEN_547); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_549 = 10'h24 == idx_r ? $signed(14'sh1c3) : $signed(_GEN_548); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_550 = 10'h25 == idx_r ? $signed(14'sh1d0) : $signed(_GEN_549); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_551 = 10'h26 == idx_r ? $signed(14'sh1dc) : $signed(_GEN_550); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_552 = 10'h27 == idx_r ? $signed(14'sh1e9) : $signed(_GEN_551); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_553 = 10'h28 == idx_r ? $signed(14'sh1f5) : $signed(_GEN_552); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_554 = 10'h29 == idx_r ? $signed(14'sh202) : $signed(_GEN_553); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_555 = 10'h2a == idx_r ? $signed(14'sh20e) : $signed(_GEN_554); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_556 = 10'h2b == idx_r ? $signed(14'sh21b) : $signed(_GEN_555); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_557 = 10'h2c == idx_r ? $signed(14'sh227) : $signed(_GEN_556); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_558 = 10'h2d == idx_r ? $signed(14'sh234) : $signed(_GEN_557); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_559 = 10'h2e == idx_r ? $signed(14'sh240) : $signed(_GEN_558); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_560 = 10'h2f == idx_r ? $signed(14'sh24d) : $signed(_GEN_559); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_561 = 10'h30 == idx_r ? $signed(14'sh259) : $signed(_GEN_560); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_562 = 10'h31 == idx_r ? $signed(14'sh265) : $signed(_GEN_561); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_563 = 10'h32 == idx_r ? $signed(14'sh272) : $signed(_GEN_562); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_564 = 10'h33 == idx_r ? $signed(14'sh27e) : $signed(_GEN_563); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_565 = 10'h34 == idx_r ? $signed(14'sh28b) : $signed(_GEN_564); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_566 = 10'h35 == idx_r ? $signed(14'sh297) : $signed(_GEN_565); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_567 = 10'h36 == idx_r ? $signed(14'sh2a3) : $signed(_GEN_566); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_568 = 10'h37 == idx_r ? $signed(14'sh2b0) : $signed(_GEN_567); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_569 = 10'h38 == idx_r ? $signed(14'sh2bc) : $signed(_GEN_568); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_570 = 10'h39 == idx_r ? $signed(14'sh2c9) : $signed(_GEN_569); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_571 = 10'h3a == idx_r ? $signed(14'sh2d5) : $signed(_GEN_570); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_572 = 10'h3b == idx_r ? $signed(14'sh2e1) : $signed(_GEN_571); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_573 = 10'h3c == idx_r ? $signed(14'sh2ee) : $signed(_GEN_572); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_574 = 10'h3d == idx_r ? $signed(14'sh2fa) : $signed(_GEN_573); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_575 = 10'h3e == idx_r ? $signed(14'sh306) : $signed(_GEN_574); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_576 = 10'h3f == idx_r ? $signed(14'sh313) : $signed(_GEN_575); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_577 = 10'h40 == idx_r ? $signed(14'sh31f) : $signed(_GEN_576); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_578 = 10'h41 == idx_r ? $signed(14'sh32b) : $signed(_GEN_577); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_579 = 10'h42 == idx_r ? $signed(14'sh338) : $signed(_GEN_578); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_580 = 10'h43 == idx_r ? $signed(14'sh344) : $signed(_GEN_579); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_581 = 10'h44 == idx_r ? $signed(14'sh350) : $signed(_GEN_580); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_582 = 10'h45 == idx_r ? $signed(14'sh35d) : $signed(_GEN_581); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_583 = 10'h46 == idx_r ? $signed(14'sh369) : $signed(_GEN_582); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_584 = 10'h47 == idx_r ? $signed(14'sh375) : $signed(_GEN_583); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_585 = 10'h48 == idx_r ? $signed(14'sh381) : $signed(_GEN_584); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_586 = 10'h49 == idx_r ? $signed(14'sh38e) : $signed(_GEN_585); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_587 = 10'h4a == idx_r ? $signed(14'sh39a) : $signed(_GEN_586); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_588 = 10'h4b == idx_r ? $signed(14'sh3a6) : $signed(_GEN_587); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_589 = 10'h4c == idx_r ? $signed(14'sh3b2) : $signed(_GEN_588); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_590 = 10'h4d == idx_r ? $signed(14'sh3bf) : $signed(_GEN_589); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_591 = 10'h4e == idx_r ? $signed(14'sh3cb) : $signed(_GEN_590); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_592 = 10'h4f == idx_r ? $signed(14'sh3d7) : $signed(_GEN_591); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_593 = 10'h50 == idx_r ? $signed(14'sh3e3) : $signed(_GEN_592); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_594 = 10'h51 == idx_r ? $signed(14'sh3ef) : $signed(_GEN_593); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_595 = 10'h52 == idx_r ? $signed(14'sh3fc) : $signed(_GEN_594); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_596 = 10'h53 == idx_r ? $signed(14'sh408) : $signed(_GEN_595); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_597 = 10'h54 == idx_r ? $signed(14'sh414) : $signed(_GEN_596); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_598 = 10'h55 == idx_r ? $signed(14'sh420) : $signed(_GEN_597); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_599 = 10'h56 == idx_r ? $signed(14'sh42c) : $signed(_GEN_598); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_600 = 10'h57 == idx_r ? $signed(14'sh438) : $signed(_GEN_599); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_601 = 10'h58 == idx_r ? $signed(14'sh444) : $signed(_GEN_600); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_602 = 10'h59 == idx_r ? $signed(14'sh451) : $signed(_GEN_601); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_603 = 10'h5a == idx_r ? $signed(14'sh45d) : $signed(_GEN_602); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_604 = 10'h5b == idx_r ? $signed(14'sh469) : $signed(_GEN_603); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_605 = 10'h5c == idx_r ? $signed(14'sh475) : $signed(_GEN_604); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_606 = 10'h5d == idx_r ? $signed(14'sh481) : $signed(_GEN_605); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_607 = 10'h5e == idx_r ? $signed(14'sh48d) : $signed(_GEN_606); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_608 = 10'h5f == idx_r ? $signed(14'sh499) : $signed(_GEN_607); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_609 = 10'h60 == idx_r ? $signed(14'sh4a5) : $signed(_GEN_608); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_610 = 10'h61 == idx_r ? $signed(14'sh4b1) : $signed(_GEN_609); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_611 = 10'h62 == idx_r ? $signed(14'sh4bd) : $signed(_GEN_610); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_612 = 10'h63 == idx_r ? $signed(14'sh4c9) : $signed(_GEN_611); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_613 = 10'h64 == idx_r ? $signed(14'sh4d5) : $signed(_GEN_612); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_614 = 10'h65 == idx_r ? $signed(14'sh4e1) : $signed(_GEN_613); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_615 = 10'h66 == idx_r ? $signed(14'sh4ed) : $signed(_GEN_614); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_616 = 10'h67 == idx_r ? $signed(14'sh4f9) : $signed(_GEN_615); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_617 = 10'h68 == idx_r ? $signed(14'sh505) : $signed(_GEN_616); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_618 = 10'h69 == idx_r ? $signed(14'sh511) : $signed(_GEN_617); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_619 = 10'h6a == idx_r ? $signed(14'sh51d) : $signed(_GEN_618); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_620 = 10'h6b == idx_r ? $signed(14'sh529) : $signed(_GEN_619); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_621 = 10'h6c == idx_r ? $signed(14'sh534) : $signed(_GEN_620); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_622 = 10'h6d == idx_r ? $signed(14'sh540) : $signed(_GEN_621); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_623 = 10'h6e == idx_r ? $signed(14'sh54c) : $signed(_GEN_622); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_624 = 10'h6f == idx_r ? $signed(14'sh558) : $signed(_GEN_623); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_625 = 10'h70 == idx_r ? $signed(14'sh564) : $signed(_GEN_624); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_626 = 10'h71 == idx_r ? $signed(14'sh570) : $signed(_GEN_625); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_627 = 10'h72 == idx_r ? $signed(14'sh57c) : $signed(_GEN_626); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_628 = 10'h73 == idx_r ? $signed(14'sh587) : $signed(_GEN_627); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_629 = 10'h74 == idx_r ? $signed(14'sh593) : $signed(_GEN_628); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_630 = 10'h75 == idx_r ? $signed(14'sh59f) : $signed(_GEN_629); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_631 = 10'h76 == idx_r ? $signed(14'sh5ab) : $signed(_GEN_630); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_632 = 10'h77 == idx_r ? $signed(14'sh5b6) : $signed(_GEN_631); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_633 = 10'h78 == idx_r ? $signed(14'sh5c2) : $signed(_GEN_632); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_634 = 10'h79 == idx_r ? $signed(14'sh5ce) : $signed(_GEN_633); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_635 = 10'h7a == idx_r ? $signed(14'sh5da) : $signed(_GEN_634); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_636 = 10'h7b == idx_r ? $signed(14'sh5e5) : $signed(_GEN_635); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_637 = 10'h7c == idx_r ? $signed(14'sh5f1) : $signed(_GEN_636); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_638 = 10'h7d == idx_r ? $signed(14'sh5fd) : $signed(_GEN_637); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_639 = 10'h7e == idx_r ? $signed(14'sh608) : $signed(_GEN_638); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_640 = 10'h7f == idx_r ? $signed(14'sh614) : $signed(_GEN_639); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_641 = 10'h80 == idx_r ? $signed(14'sh61f) : $signed(_GEN_640); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_642 = 10'h81 == idx_r ? $signed(14'sh62b) : $signed(_GEN_641); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_643 = 10'h82 == idx_r ? $signed(14'sh637) : $signed(_GEN_642); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_644 = 10'h83 == idx_r ? $signed(14'sh642) : $signed(_GEN_643); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_645 = 10'h84 == idx_r ? $signed(14'sh64e) : $signed(_GEN_644); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_646 = 10'h85 == idx_r ? $signed(14'sh659) : $signed(_GEN_645); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_647 = 10'h86 == idx_r ? $signed(14'sh665) : $signed(_GEN_646); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_648 = 10'h87 == idx_r ? $signed(14'sh670) : $signed(_GEN_647); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_649 = 10'h88 == idx_r ? $signed(14'sh67c) : $signed(_GEN_648); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_650 = 10'h89 == idx_r ? $signed(14'sh687) : $signed(_GEN_649); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_651 = 10'h8a == idx_r ? $signed(14'sh693) : $signed(_GEN_650); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_652 = 10'h8b == idx_r ? $signed(14'sh69e) : $signed(_GEN_651); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_653 = 10'h8c == idx_r ? $signed(14'sh6aa) : $signed(_GEN_652); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_654 = 10'h8d == idx_r ? $signed(14'sh6b5) : $signed(_GEN_653); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_655 = 10'h8e == idx_r ? $signed(14'sh6c1) : $signed(_GEN_654); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_656 = 10'h8f == idx_r ? $signed(14'sh6cc) : $signed(_GEN_655); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_657 = 10'h90 == idx_r ? $signed(14'sh6d7) : $signed(_GEN_656); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_658 = 10'h91 == idx_r ? $signed(14'sh6e3) : $signed(_GEN_657); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_659 = 10'h92 == idx_r ? $signed(14'sh6ee) : $signed(_GEN_658); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_660 = 10'h93 == idx_r ? $signed(14'sh6f9) : $signed(_GEN_659); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_661 = 10'h94 == idx_r ? $signed(14'sh705) : $signed(_GEN_660); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_662 = 10'h95 == idx_r ? $signed(14'sh710) : $signed(_GEN_661); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_663 = 10'h96 == idx_r ? $signed(14'sh71b) : $signed(_GEN_662); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_664 = 10'h97 == idx_r ? $signed(14'sh726) : $signed(_GEN_663); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_665 = 10'h98 == idx_r ? $signed(14'sh732) : $signed(_GEN_664); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_666 = 10'h99 == idx_r ? $signed(14'sh73d) : $signed(_GEN_665); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_667 = 10'h9a == idx_r ? $signed(14'sh748) : $signed(_GEN_666); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_668 = 10'h9b == idx_r ? $signed(14'sh753) : $signed(_GEN_667); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_669 = 10'h9c == idx_r ? $signed(14'sh75e) : $signed(_GEN_668); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_670 = 10'h9d == idx_r ? $signed(14'sh76a) : $signed(_GEN_669); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_671 = 10'h9e == idx_r ? $signed(14'sh775) : $signed(_GEN_670); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_672 = 10'h9f == idx_r ? $signed(14'sh780) : $signed(_GEN_671); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_673 = 10'ha0 == idx_r ? $signed(14'sh78b) : $signed(_GEN_672); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_674 = 10'ha1 == idx_r ? $signed(14'sh796) : $signed(_GEN_673); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_675 = 10'ha2 == idx_r ? $signed(14'sh7a1) : $signed(_GEN_674); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_676 = 10'ha3 == idx_r ? $signed(14'sh7ac) : $signed(_GEN_675); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_677 = 10'ha4 == idx_r ? $signed(14'sh7b7) : $signed(_GEN_676); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_678 = 10'ha5 == idx_r ? $signed(14'sh7c2) : $signed(_GEN_677); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_679 = 10'ha6 == idx_r ? $signed(14'sh7cd) : $signed(_GEN_678); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_680 = 10'ha7 == idx_r ? $signed(14'sh7d8) : $signed(_GEN_679); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_681 = 10'ha8 == idx_r ? $signed(14'sh7e3) : $signed(_GEN_680); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_682 = 10'ha9 == idx_r ? $signed(14'sh7ee) : $signed(_GEN_681); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_683 = 10'haa == idx_r ? $signed(14'sh7f9) : $signed(_GEN_682); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_684 = 10'hab == idx_r ? $signed(14'sh804) : $signed(_GEN_683); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_685 = 10'hac == idx_r ? $signed(14'sh80e) : $signed(_GEN_684); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_686 = 10'had == idx_r ? $signed(14'sh819) : $signed(_GEN_685); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_687 = 10'hae == idx_r ? $signed(14'sh824) : $signed(_GEN_686); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_688 = 10'haf == idx_r ? $signed(14'sh82f) : $signed(_GEN_687); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_689 = 10'hb0 == idx_r ? $signed(14'sh83a) : $signed(_GEN_688); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_690 = 10'hb1 == idx_r ? $signed(14'sh845) : $signed(_GEN_689); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_691 = 10'hb2 == idx_r ? $signed(14'sh84f) : $signed(_GEN_690); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_692 = 10'hb3 == idx_r ? $signed(14'sh85a) : $signed(_GEN_691); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_693 = 10'hb4 == idx_r ? $signed(14'sh865) : $signed(_GEN_692); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_694 = 10'hb5 == idx_r ? $signed(14'sh86f) : $signed(_GEN_693); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_695 = 10'hb6 == idx_r ? $signed(14'sh87a) : $signed(_GEN_694); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_696 = 10'hb7 == idx_r ? $signed(14'sh885) : $signed(_GEN_695); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_697 = 10'hb8 == idx_r ? $signed(14'sh88f) : $signed(_GEN_696); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_698 = 10'hb9 == idx_r ? $signed(14'sh89a) : $signed(_GEN_697); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_699 = 10'hba == idx_r ? $signed(14'sh8a5) : $signed(_GEN_698); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_700 = 10'hbb == idx_r ? $signed(14'sh8af) : $signed(_GEN_699); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_701 = 10'hbc == idx_r ? $signed(14'sh8ba) : $signed(_GEN_700); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_702 = 10'hbd == idx_r ? $signed(14'sh8c4) : $signed(_GEN_701); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_703 = 10'hbe == idx_r ? $signed(14'sh8cf) : $signed(_GEN_702); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_704 = 10'hbf == idx_r ? $signed(14'sh8d9) : $signed(_GEN_703); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_705 = 10'hc0 == idx_r ? $signed(14'sh8e4) : $signed(_GEN_704); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_706 = 10'hc1 == idx_r ? $signed(14'sh8ee) : $signed(_GEN_705); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_707 = 10'hc2 == idx_r ? $signed(14'sh8f8) : $signed(_GEN_706); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_708 = 10'hc3 == idx_r ? $signed(14'sh903) : $signed(_GEN_707); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_709 = 10'hc4 == idx_r ? $signed(14'sh90d) : $signed(_GEN_708); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_710 = 10'hc5 == idx_r ? $signed(14'sh918) : $signed(_GEN_709); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_711 = 10'hc6 == idx_r ? $signed(14'sh922) : $signed(_GEN_710); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_712 = 10'hc7 == idx_r ? $signed(14'sh92c) : $signed(_GEN_711); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_713 = 10'hc8 == idx_r ? $signed(14'sh937) : $signed(_GEN_712); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_714 = 10'hc9 == idx_r ? $signed(14'sh941) : $signed(_GEN_713); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_715 = 10'hca == idx_r ? $signed(14'sh94b) : $signed(_GEN_714); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_716 = 10'hcb == idx_r ? $signed(14'sh955) : $signed(_GEN_715); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_717 = 10'hcc == idx_r ? $signed(14'sh95f) : $signed(_GEN_716); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_718 = 10'hcd == idx_r ? $signed(14'sh96a) : $signed(_GEN_717); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_719 = 10'hce == idx_r ? $signed(14'sh974) : $signed(_GEN_718); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_720 = 10'hcf == idx_r ? $signed(14'sh97e) : $signed(_GEN_719); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_721 = 10'hd0 == idx_r ? $signed(14'sh988) : $signed(_GEN_720); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_722 = 10'hd1 == idx_r ? $signed(14'sh992) : $signed(_GEN_721); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_723 = 10'hd2 == idx_r ? $signed(14'sh99c) : $signed(_GEN_722); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_724 = 10'hd3 == idx_r ? $signed(14'sh9a6) : $signed(_GEN_723); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_725 = 10'hd4 == idx_r ? $signed(14'sh9b0) : $signed(_GEN_724); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_726 = 10'hd5 == idx_r ? $signed(14'sh9ba) : $signed(_GEN_725); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_727 = 10'hd6 == idx_r ? $signed(14'sh9c4) : $signed(_GEN_726); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_728 = 10'hd7 == idx_r ? $signed(14'sh9ce) : $signed(_GEN_727); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_729 = 10'hd8 == idx_r ? $signed(14'sh9d8) : $signed(_GEN_728); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_730 = 10'hd9 == idx_r ? $signed(14'sh9e2) : $signed(_GEN_729); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_731 = 10'hda == idx_r ? $signed(14'sh9ec) : $signed(_GEN_730); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_732 = 10'hdb == idx_r ? $signed(14'sh9f6) : $signed(_GEN_731); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_733 = 10'hdc == idx_r ? $signed(14'sh9ff) : $signed(_GEN_732); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_734 = 10'hdd == idx_r ? $signed(14'sha09) : $signed(_GEN_733); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_735 = 10'hde == idx_r ? $signed(14'sha13) : $signed(_GEN_734); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_736 = 10'hdf == idx_r ? $signed(14'sha1d) : $signed(_GEN_735); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_737 = 10'he0 == idx_r ? $signed(14'sha26) : $signed(_GEN_736); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_738 = 10'he1 == idx_r ? $signed(14'sha30) : $signed(_GEN_737); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_739 = 10'he2 == idx_r ? $signed(14'sha3a) : $signed(_GEN_738); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_740 = 10'he3 == idx_r ? $signed(14'sha44) : $signed(_GEN_739); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_741 = 10'he4 == idx_r ? $signed(14'sha4d) : $signed(_GEN_740); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_742 = 10'he5 == idx_r ? $signed(14'sha57) : $signed(_GEN_741); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_743 = 10'he6 == idx_r ? $signed(14'sha60) : $signed(_GEN_742); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_744 = 10'he7 == idx_r ? $signed(14'sha6a) : $signed(_GEN_743); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_745 = 10'he8 == idx_r ? $signed(14'sha73) : $signed(_GEN_744); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_746 = 10'he9 == idx_r ? $signed(14'sha7d) : $signed(_GEN_745); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_747 = 10'hea == idx_r ? $signed(14'sha86) : $signed(_GEN_746); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_748 = 10'heb == idx_r ? $signed(14'sha90) : $signed(_GEN_747); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_749 = 10'hec == idx_r ? $signed(14'sha99) : $signed(_GEN_748); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_750 = 10'hed == idx_r ? $signed(14'shaa3) : $signed(_GEN_749); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_751 = 10'hee == idx_r ? $signed(14'shaac) : $signed(_GEN_750); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_752 = 10'hef == idx_r ? $signed(14'shab5) : $signed(_GEN_751); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_753 = 10'hf0 == idx_r ? $signed(14'shabf) : $signed(_GEN_752); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_754 = 10'hf1 == idx_r ? $signed(14'shac8) : $signed(_GEN_753); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_755 = 10'hf2 == idx_r ? $signed(14'shad1) : $signed(_GEN_754); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_756 = 10'hf3 == idx_r ? $signed(14'shadb) : $signed(_GEN_755); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_757 = 10'hf4 == idx_r ? $signed(14'shae4) : $signed(_GEN_756); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_758 = 10'hf5 == idx_r ? $signed(14'shaed) : $signed(_GEN_757); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_759 = 10'hf6 == idx_r ? $signed(14'shaf6) : $signed(_GEN_758); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_760 = 10'hf7 == idx_r ? $signed(14'shaff) : $signed(_GEN_759); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_761 = 10'hf8 == idx_r ? $signed(14'shb08) : $signed(_GEN_760); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_762 = 10'hf9 == idx_r ? $signed(14'shb11) : $signed(_GEN_761); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_763 = 10'hfa == idx_r ? $signed(14'shb1b) : $signed(_GEN_762); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_764 = 10'hfb == idx_r ? $signed(14'shb24) : $signed(_GEN_763); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_765 = 10'hfc == idx_r ? $signed(14'shb2d) : $signed(_GEN_764); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_766 = 10'hfd == idx_r ? $signed(14'shb36) : $signed(_GEN_765); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_767 = 10'hfe == idx_r ? $signed(14'shb3e) : $signed(_GEN_766); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_768 = 10'hff == idx_r ? $signed(14'shb47) : $signed(_GEN_767); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_769 = 10'h100 == idx_r ? $signed(14'shb50) : $signed(_GEN_768); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_770 = 10'h101 == idx_r ? $signed(14'shb59) : $signed(_GEN_769); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_771 = 10'h102 == idx_r ? $signed(14'shb62) : $signed(_GEN_770); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_772 = 10'h103 == idx_r ? $signed(14'shb6b) : $signed(_GEN_771); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_773 = 10'h104 == idx_r ? $signed(14'shb74) : $signed(_GEN_772); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_774 = 10'h105 == idx_r ? $signed(14'shb7c) : $signed(_GEN_773); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_775 = 10'h106 == idx_r ? $signed(14'shb85) : $signed(_GEN_774); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_776 = 10'h107 == idx_r ? $signed(14'shb8e) : $signed(_GEN_775); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_777 = 10'h108 == idx_r ? $signed(14'shb97) : $signed(_GEN_776); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_778 = 10'h109 == idx_r ? $signed(14'shb9f) : $signed(_GEN_777); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_779 = 10'h10a == idx_r ? $signed(14'shba8) : $signed(_GEN_778); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_780 = 10'h10b == idx_r ? $signed(14'shbb0) : $signed(_GEN_779); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_781 = 10'h10c == idx_r ? $signed(14'shbb9) : $signed(_GEN_780); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_782 = 10'h10d == idx_r ? $signed(14'shbc1) : $signed(_GEN_781); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_783 = 10'h10e == idx_r ? $signed(14'shbca) : $signed(_GEN_782); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_784 = 10'h10f == idx_r ? $signed(14'shbd2) : $signed(_GEN_783); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_785 = 10'h110 == idx_r ? $signed(14'shbdb) : $signed(_GEN_784); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_786 = 10'h111 == idx_r ? $signed(14'shbe3) : $signed(_GEN_785); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_787 = 10'h112 == idx_r ? $signed(14'shbec) : $signed(_GEN_786); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_788 = 10'h113 == idx_r ? $signed(14'shbf4) : $signed(_GEN_787); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_789 = 10'h114 == idx_r ? $signed(14'shbfc) : $signed(_GEN_788); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_790 = 10'h115 == idx_r ? $signed(14'shc05) : $signed(_GEN_789); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_791 = 10'h116 == idx_r ? $signed(14'shc0d) : $signed(_GEN_790); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_792 = 10'h117 == idx_r ? $signed(14'shc15) : $signed(_GEN_791); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_793 = 10'h118 == idx_r ? $signed(14'shc1e) : $signed(_GEN_792); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_794 = 10'h119 == idx_r ? $signed(14'shc26) : $signed(_GEN_793); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_795 = 10'h11a == idx_r ? $signed(14'shc2e) : $signed(_GEN_794); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_796 = 10'h11b == idx_r ? $signed(14'shc36) : $signed(_GEN_795); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_797 = 10'h11c == idx_r ? $signed(14'shc3e) : $signed(_GEN_796); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_798 = 10'h11d == idx_r ? $signed(14'shc46) : $signed(_GEN_797); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_799 = 10'h11e == idx_r ? $signed(14'shc4e) : $signed(_GEN_798); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_800 = 10'h11f == idx_r ? $signed(14'shc56) : $signed(_GEN_799); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_801 = 10'h120 == idx_r ? $signed(14'shc5e) : $signed(_GEN_800); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_802 = 10'h121 == idx_r ? $signed(14'shc66) : $signed(_GEN_801); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_803 = 10'h122 == idx_r ? $signed(14'shc6e) : $signed(_GEN_802); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_804 = 10'h123 == idx_r ? $signed(14'shc76) : $signed(_GEN_803); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_805 = 10'h124 == idx_r ? $signed(14'shc7e) : $signed(_GEN_804); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_806 = 10'h125 == idx_r ? $signed(14'shc86) : $signed(_GEN_805); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_807 = 10'h126 == idx_r ? $signed(14'shc8e) : $signed(_GEN_806); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_808 = 10'h127 == idx_r ? $signed(14'shc95) : $signed(_GEN_807); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_809 = 10'h128 == idx_r ? $signed(14'shc9d) : $signed(_GEN_808); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_810 = 10'h129 == idx_r ? $signed(14'shca5) : $signed(_GEN_809); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_811 = 10'h12a == idx_r ? $signed(14'shcac) : $signed(_GEN_810); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_812 = 10'h12b == idx_r ? $signed(14'shcb4) : $signed(_GEN_811); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_813 = 10'h12c == idx_r ? $signed(14'shcbc) : $signed(_GEN_812); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_814 = 10'h12d == idx_r ? $signed(14'shcc3) : $signed(_GEN_813); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_815 = 10'h12e == idx_r ? $signed(14'shccb) : $signed(_GEN_814); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_816 = 10'h12f == idx_r ? $signed(14'shcd2) : $signed(_GEN_815); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_817 = 10'h130 == idx_r ? $signed(14'shcda) : $signed(_GEN_816); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_818 = 10'h131 == idx_r ? $signed(14'shce1) : $signed(_GEN_817); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_819 = 10'h132 == idx_r ? $signed(14'shce9) : $signed(_GEN_818); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_820 = 10'h133 == idx_r ? $signed(14'shcf0) : $signed(_GEN_819); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_821 = 10'h134 == idx_r ? $signed(14'shcf8) : $signed(_GEN_820); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_822 = 10'h135 == idx_r ? $signed(14'shcff) : $signed(_GEN_821); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_823 = 10'h136 == idx_r ? $signed(14'shd06) : $signed(_GEN_822); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_824 = 10'h137 == idx_r ? $signed(14'shd0e) : $signed(_GEN_823); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_825 = 10'h138 == idx_r ? $signed(14'shd15) : $signed(_GEN_824); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_826 = 10'h139 == idx_r ? $signed(14'shd1c) : $signed(_GEN_825); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_827 = 10'h13a == idx_r ? $signed(14'shd23) : $signed(_GEN_826); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_828 = 10'h13b == idx_r ? $signed(14'shd2a) : $signed(_GEN_827); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_829 = 10'h13c == idx_r ? $signed(14'shd32) : $signed(_GEN_828); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_830 = 10'h13d == idx_r ? $signed(14'shd39) : $signed(_GEN_829); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_831 = 10'h13e == idx_r ? $signed(14'shd40) : $signed(_GEN_830); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_832 = 10'h13f == idx_r ? $signed(14'shd47) : $signed(_GEN_831); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_833 = 10'h140 == idx_r ? $signed(14'shd4e) : $signed(_GEN_832); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_834 = 10'h141 == idx_r ? $signed(14'shd55) : $signed(_GEN_833); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_835 = 10'h142 == idx_r ? $signed(14'shd5c) : $signed(_GEN_834); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_836 = 10'h143 == idx_r ? $signed(14'shd62) : $signed(_GEN_835); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_837 = 10'h144 == idx_r ? $signed(14'shd69) : $signed(_GEN_836); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_838 = 10'h145 == idx_r ? $signed(14'shd70) : $signed(_GEN_837); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_839 = 10'h146 == idx_r ? $signed(14'shd77) : $signed(_GEN_838); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_840 = 10'h147 == idx_r ? $signed(14'shd7e) : $signed(_GEN_839); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_841 = 10'h148 == idx_r ? $signed(14'shd85) : $signed(_GEN_840); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_842 = 10'h149 == idx_r ? $signed(14'shd8b) : $signed(_GEN_841); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_843 = 10'h14a == idx_r ? $signed(14'shd92) : $signed(_GEN_842); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_844 = 10'h14b == idx_r ? $signed(14'shd99) : $signed(_GEN_843); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_845 = 10'h14c == idx_r ? $signed(14'shd9f) : $signed(_GEN_844); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_846 = 10'h14d == idx_r ? $signed(14'shda6) : $signed(_GEN_845); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_847 = 10'h14e == idx_r ? $signed(14'shdac) : $signed(_GEN_846); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_848 = 10'h14f == idx_r ? $signed(14'shdb3) : $signed(_GEN_847); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_849 = 10'h150 == idx_r ? $signed(14'shdb9) : $signed(_GEN_848); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_850 = 10'h151 == idx_r ? $signed(14'shdc0) : $signed(_GEN_849); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_851 = 10'h152 == idx_r ? $signed(14'shdc6) : $signed(_GEN_850); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_852 = 10'h153 == idx_r ? $signed(14'shdcc) : $signed(_GEN_851); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_853 = 10'h154 == idx_r ? $signed(14'shdd3) : $signed(_GEN_852); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_854 = 10'h155 == idx_r ? $signed(14'shdd9) : $signed(_GEN_853); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_855 = 10'h156 == idx_r ? $signed(14'shddf) : $signed(_GEN_854); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_856 = 10'h157 == idx_r ? $signed(14'shde6) : $signed(_GEN_855); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_857 = 10'h158 == idx_r ? $signed(14'shdec) : $signed(_GEN_856); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_858 = 10'h159 == idx_r ? $signed(14'shdf2) : $signed(_GEN_857); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_859 = 10'h15a == idx_r ? $signed(14'shdf8) : $signed(_GEN_858); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_860 = 10'h15b == idx_r ? $signed(14'shdfe) : $signed(_GEN_859); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_861 = 10'h15c == idx_r ? $signed(14'she04) : $signed(_GEN_860); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_862 = 10'h15d == idx_r ? $signed(14'she0a) : $signed(_GEN_861); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_863 = 10'h15e == idx_r ? $signed(14'she10) : $signed(_GEN_862); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_864 = 10'h15f == idx_r ? $signed(14'she16) : $signed(_GEN_863); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_865 = 10'h160 == idx_r ? $signed(14'she1c) : $signed(_GEN_864); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_866 = 10'h161 == idx_r ? $signed(14'she22) : $signed(_GEN_865); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_867 = 10'h162 == idx_r ? $signed(14'she28) : $signed(_GEN_866); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_868 = 10'h163 == idx_r ? $signed(14'she2e) : $signed(_GEN_867); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_869 = 10'h164 == idx_r ? $signed(14'she34) : $signed(_GEN_868); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_870 = 10'h165 == idx_r ? $signed(14'she3a) : $signed(_GEN_869); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_871 = 10'h166 == idx_r ? $signed(14'she3f) : $signed(_GEN_870); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_872 = 10'h167 == idx_r ? $signed(14'she45) : $signed(_GEN_871); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_873 = 10'h168 == idx_r ? $signed(14'she4b) : $signed(_GEN_872); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_874 = 10'h169 == idx_r ? $signed(14'she50) : $signed(_GEN_873); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_875 = 10'h16a == idx_r ? $signed(14'she56) : $signed(_GEN_874); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_876 = 10'h16b == idx_r ? $signed(14'she5b) : $signed(_GEN_875); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_877 = 10'h16c == idx_r ? $signed(14'she61) : $signed(_GEN_876); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_878 = 10'h16d == idx_r ? $signed(14'she66) : $signed(_GEN_877); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_879 = 10'h16e == idx_r ? $signed(14'she6c) : $signed(_GEN_878); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_880 = 10'h16f == idx_r ? $signed(14'she71) : $signed(_GEN_879); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_881 = 10'h170 == idx_r ? $signed(14'she77) : $signed(_GEN_880); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_882 = 10'h171 == idx_r ? $signed(14'she7c) : $signed(_GEN_881); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_883 = 10'h172 == idx_r ? $signed(14'she81) : $signed(_GEN_882); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_884 = 10'h173 == idx_r ? $signed(14'she87) : $signed(_GEN_883); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_885 = 10'h174 == idx_r ? $signed(14'she8c) : $signed(_GEN_884); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_886 = 10'h175 == idx_r ? $signed(14'she91) : $signed(_GEN_885); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_887 = 10'h176 == idx_r ? $signed(14'she96) : $signed(_GEN_886); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_888 = 10'h177 == idx_r ? $signed(14'she9b) : $signed(_GEN_887); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_889 = 10'h178 == idx_r ? $signed(14'shea1) : $signed(_GEN_888); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_890 = 10'h179 == idx_r ? $signed(14'shea6) : $signed(_GEN_889); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_891 = 10'h17a == idx_r ? $signed(14'sheab) : $signed(_GEN_890); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_892 = 10'h17b == idx_r ? $signed(14'sheb0) : $signed(_GEN_891); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_893 = 10'h17c == idx_r ? $signed(14'sheb5) : $signed(_GEN_892); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_894 = 10'h17d == idx_r ? $signed(14'sheba) : $signed(_GEN_893); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_895 = 10'h17e == idx_r ? $signed(14'shebf) : $signed(_GEN_894); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_896 = 10'h17f == idx_r ? $signed(14'shec3) : $signed(_GEN_895); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_897 = 10'h180 == idx_r ? $signed(14'shec8) : $signed(_GEN_896); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_898 = 10'h181 == idx_r ? $signed(14'shecd) : $signed(_GEN_897); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_899 = 10'h182 == idx_r ? $signed(14'shed2) : $signed(_GEN_898); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_900 = 10'h183 == idx_r ? $signed(14'shed6) : $signed(_GEN_899); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_901 = 10'h184 == idx_r ? $signed(14'shedb) : $signed(_GEN_900); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_902 = 10'h185 == idx_r ? $signed(14'shee0) : $signed(_GEN_901); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_903 = 10'h186 == idx_r ? $signed(14'shee4) : $signed(_GEN_902); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_904 = 10'h187 == idx_r ? $signed(14'shee9) : $signed(_GEN_903); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_905 = 10'h188 == idx_r ? $signed(14'sheee) : $signed(_GEN_904); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_906 = 10'h189 == idx_r ? $signed(14'shef2) : $signed(_GEN_905); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_907 = 10'h18a == idx_r ? $signed(14'shef7) : $signed(_GEN_906); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_908 = 10'h18b == idx_r ? $signed(14'shefb) : $signed(_GEN_907); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_909 = 10'h18c == idx_r ? $signed(14'sheff) : $signed(_GEN_908); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_910 = 10'h18d == idx_r ? $signed(14'shf04) : $signed(_GEN_909); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_911 = 10'h18e == idx_r ? $signed(14'shf08) : $signed(_GEN_910); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_912 = 10'h18f == idx_r ? $signed(14'shf0c) : $signed(_GEN_911); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_913 = 10'h190 == idx_r ? $signed(14'shf11) : $signed(_GEN_912); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_914 = 10'h191 == idx_r ? $signed(14'shf15) : $signed(_GEN_913); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_915 = 10'h192 == idx_r ? $signed(14'shf19) : $signed(_GEN_914); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_916 = 10'h193 == idx_r ? $signed(14'shf1d) : $signed(_GEN_915); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_917 = 10'h194 == idx_r ? $signed(14'shf21) : $signed(_GEN_916); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_918 = 10'h195 == idx_r ? $signed(14'shf25) : $signed(_GEN_917); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_919 = 10'h196 == idx_r ? $signed(14'shf29) : $signed(_GEN_918); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_920 = 10'h197 == idx_r ? $signed(14'shf2d) : $signed(_GEN_919); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_921 = 10'h198 == idx_r ? $signed(14'shf31) : $signed(_GEN_920); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_922 = 10'h199 == idx_r ? $signed(14'shf35) : $signed(_GEN_921); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_923 = 10'h19a == idx_r ? $signed(14'shf39) : $signed(_GEN_922); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_924 = 10'h19b == idx_r ? $signed(14'shf3d) : $signed(_GEN_923); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_925 = 10'h19c == idx_r ? $signed(14'shf41) : $signed(_GEN_924); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_926 = 10'h19d == idx_r ? $signed(14'shf45) : $signed(_GEN_925); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_927 = 10'h19e == idx_r ? $signed(14'shf48) : $signed(_GEN_926); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_928 = 10'h19f == idx_r ? $signed(14'shf4c) : $signed(_GEN_927); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_929 = 10'h1a0 == idx_r ? $signed(14'shf50) : $signed(_GEN_928); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_930 = 10'h1a1 == idx_r ? $signed(14'shf53) : $signed(_GEN_929); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_931 = 10'h1a2 == idx_r ? $signed(14'shf57) : $signed(_GEN_930); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_932 = 10'h1a3 == idx_r ? $signed(14'shf5a) : $signed(_GEN_931); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_933 = 10'h1a4 == idx_r ? $signed(14'shf5e) : $signed(_GEN_932); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_934 = 10'h1a5 == idx_r ? $signed(14'shf61) : $signed(_GEN_933); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_935 = 10'h1a6 == idx_r ? $signed(14'shf65) : $signed(_GEN_934); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_936 = 10'h1a7 == idx_r ? $signed(14'shf68) : $signed(_GEN_935); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_937 = 10'h1a8 == idx_r ? $signed(14'shf6c) : $signed(_GEN_936); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_938 = 10'h1a9 == idx_r ? $signed(14'shf6f) : $signed(_GEN_937); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_939 = 10'h1aa == idx_r ? $signed(14'shf72) : $signed(_GEN_938); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_940 = 10'h1ab == idx_r ? $signed(14'shf76) : $signed(_GEN_939); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_941 = 10'h1ac == idx_r ? $signed(14'shf79) : $signed(_GEN_940); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_942 = 10'h1ad == idx_r ? $signed(14'shf7c) : $signed(_GEN_941); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_943 = 10'h1ae == idx_r ? $signed(14'shf7f) : $signed(_GEN_942); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_944 = 10'h1af == idx_r ? $signed(14'shf82) : $signed(_GEN_943); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_945 = 10'h1b0 == idx_r ? $signed(14'shf85) : $signed(_GEN_944); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_946 = 10'h1b1 == idx_r ? $signed(14'shf88) : $signed(_GEN_945); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_947 = 10'h1b2 == idx_r ? $signed(14'shf8b) : $signed(_GEN_946); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_948 = 10'h1b3 == idx_r ? $signed(14'shf8e) : $signed(_GEN_947); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_949 = 10'h1b4 == idx_r ? $signed(14'shf91) : $signed(_GEN_948); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_950 = 10'h1b5 == idx_r ? $signed(14'shf94) : $signed(_GEN_949); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_951 = 10'h1b6 == idx_r ? $signed(14'shf97) : $signed(_GEN_950); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_952 = 10'h1b7 == idx_r ? $signed(14'shf9a) : $signed(_GEN_951); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_953 = 10'h1b8 == idx_r ? $signed(14'shf9c) : $signed(_GEN_952); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_954 = 10'h1b9 == idx_r ? $signed(14'shf9f) : $signed(_GEN_953); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_955 = 10'h1ba == idx_r ? $signed(14'shfa2) : $signed(_GEN_954); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_956 = 10'h1bb == idx_r ? $signed(14'shfa5) : $signed(_GEN_955); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_957 = 10'h1bc == idx_r ? $signed(14'shfa7) : $signed(_GEN_956); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_958 = 10'h1bd == idx_r ? $signed(14'shfaa) : $signed(_GEN_957); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_959 = 10'h1be == idx_r ? $signed(14'shfac) : $signed(_GEN_958); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_960 = 10'h1bf == idx_r ? $signed(14'shfaf) : $signed(_GEN_959); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_961 = 10'h1c0 == idx_r ? $signed(14'shfb1) : $signed(_GEN_960); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_962 = 10'h1c1 == idx_r ? $signed(14'shfb4) : $signed(_GEN_961); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_963 = 10'h1c2 == idx_r ? $signed(14'shfb6) : $signed(_GEN_962); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_964 = 10'h1c3 == idx_r ? $signed(14'shfb8) : $signed(_GEN_963); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_965 = 10'h1c4 == idx_r ? $signed(14'shfbb) : $signed(_GEN_964); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_966 = 10'h1c5 == idx_r ? $signed(14'shfbd) : $signed(_GEN_965); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_967 = 10'h1c6 == idx_r ? $signed(14'shfbf) : $signed(_GEN_966); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_968 = 10'h1c7 == idx_r ? $signed(14'shfc2) : $signed(_GEN_967); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_969 = 10'h1c8 == idx_r ? $signed(14'shfc4) : $signed(_GEN_968); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_970 = 10'h1c9 == idx_r ? $signed(14'shfc6) : $signed(_GEN_969); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_971 = 10'h1ca == idx_r ? $signed(14'shfc8) : $signed(_GEN_970); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_972 = 10'h1cb == idx_r ? $signed(14'shfca) : $signed(_GEN_971); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_973 = 10'h1cc == idx_r ? $signed(14'shfcc) : $signed(_GEN_972); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_974 = 10'h1cd == idx_r ? $signed(14'shfce) : $signed(_GEN_973); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_975 = 10'h1ce == idx_r ? $signed(14'shfd0) : $signed(_GEN_974); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_976 = 10'h1cf == idx_r ? $signed(14'shfd2) : $signed(_GEN_975); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_977 = 10'h1d0 == idx_r ? $signed(14'shfd4) : $signed(_GEN_976); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_978 = 10'h1d1 == idx_r ? $signed(14'shfd5) : $signed(_GEN_977); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_979 = 10'h1d2 == idx_r ? $signed(14'shfd7) : $signed(_GEN_978); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_980 = 10'h1d3 == idx_r ? $signed(14'shfd9) : $signed(_GEN_979); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_981 = 10'h1d4 == idx_r ? $signed(14'shfdb) : $signed(_GEN_980); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_982 = 10'h1d5 == idx_r ? $signed(14'shfdc) : $signed(_GEN_981); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_983 = 10'h1d6 == idx_r ? $signed(14'shfde) : $signed(_GEN_982); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_984 = 10'h1d7 == idx_r ? $signed(14'shfe0) : $signed(_GEN_983); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_985 = 10'h1d8 == idx_r ? $signed(14'shfe1) : $signed(_GEN_984); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_986 = 10'h1d9 == idx_r ? $signed(14'shfe3) : $signed(_GEN_985); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_987 = 10'h1da == idx_r ? $signed(14'shfe4) : $signed(_GEN_986); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_988 = 10'h1db == idx_r ? $signed(14'shfe6) : $signed(_GEN_987); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_989 = 10'h1dc == idx_r ? $signed(14'shfe7) : $signed(_GEN_988); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_990 = 10'h1dd == idx_r ? $signed(14'shfe8) : $signed(_GEN_989); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_991 = 10'h1de == idx_r ? $signed(14'shfea) : $signed(_GEN_990); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_992 = 10'h1df == idx_r ? $signed(14'shfeb) : $signed(_GEN_991); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_993 = 10'h1e0 == idx_r ? $signed(14'shfec) : $signed(_GEN_992); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_994 = 10'h1e1 == idx_r ? $signed(14'shfed) : $signed(_GEN_993); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_995 = 10'h1e2 == idx_r ? $signed(14'shfef) : $signed(_GEN_994); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_996 = 10'h1e3 == idx_r ? $signed(14'shff0) : $signed(_GEN_995); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_997 = 10'h1e4 == idx_r ? $signed(14'shff1) : $signed(_GEN_996); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_998 = 10'h1e5 == idx_r ? $signed(14'shff2) : $signed(_GEN_997); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_999 = 10'h1e6 == idx_r ? $signed(14'shff3) : $signed(_GEN_998); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1000 = 10'h1e7 == idx_r ? $signed(14'shff4) : $signed(_GEN_999); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1001 = 10'h1e8 == idx_r ? $signed(14'shff5) : $signed(_GEN_1000); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1002 = 10'h1e9 == idx_r ? $signed(14'shff6) : $signed(_GEN_1001); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1003 = 10'h1ea == idx_r ? $signed(14'shff7) : $signed(_GEN_1002); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1004 = 10'h1eb == idx_r ? $signed(14'shff8) : $signed(_GEN_1003); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1005 = 10'h1ec == idx_r ? $signed(14'shff8) : $signed(_GEN_1004); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1006 = 10'h1ed == idx_r ? $signed(14'shff9) : $signed(_GEN_1005); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1007 = 10'h1ee == idx_r ? $signed(14'shffa) : $signed(_GEN_1006); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1008 = 10'h1ef == idx_r ? $signed(14'shffa) : $signed(_GEN_1007); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1009 = 10'h1f0 == idx_r ? $signed(14'shffb) : $signed(_GEN_1008); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1010 = 10'h1f1 == idx_r ? $signed(14'shffc) : $signed(_GEN_1009); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1011 = 10'h1f2 == idx_r ? $signed(14'shffc) : $signed(_GEN_1010); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1012 = 10'h1f3 == idx_r ? $signed(14'shffd) : $signed(_GEN_1011); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1013 = 10'h1f4 == idx_r ? $signed(14'shffd) : $signed(_GEN_1012); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1014 = 10'h1f5 == idx_r ? $signed(14'shffe) : $signed(_GEN_1013); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1015 = 10'h1f6 == idx_r ? $signed(14'shffe) : $signed(_GEN_1014); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1016 = 10'h1f7 == idx_r ? $signed(14'shffe) : $signed(_GEN_1015); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1017 = 10'h1f8 == idx_r ? $signed(14'shfff) : $signed(_GEN_1016); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1018 = 10'h1f9 == idx_r ? $signed(14'shfff) : $signed(_GEN_1017); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1019 = 10'h1fa == idx_r ? $signed(14'shfff) : $signed(_GEN_1018); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1020 = 10'h1fb == idx_r ? $signed(14'sh1000) : $signed(_GEN_1019); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1021 = 10'h1fc == idx_r ? $signed(14'sh1000) : $signed(_GEN_1020); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1022 = 10'h1fd == idx_r ? $signed(14'sh1000) : $signed(_GEN_1021); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1023 = 10'h1fe == idx_r ? $signed(14'sh1000) : $signed(_GEN_1022); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1024 = 10'h1ff == idx_r ? $signed(14'sh1000) : $signed(_GEN_1023); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_1025 = 10'h200 == idx_r ? $signed(14'sh1000) : $signed(_GEN_1024); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _io_wI_T_2 = 14'sh0 - $signed(_GEN_1025); // @[FFTTwiddle.scala 54:35]
  assign io_wR = chg_sign_flag_r ? $signed(_io_wR_T_2) : $signed(_GEN_512); // @[FFTTwiddle.scala 53:17]
  assign io_wI = chg_sign_flag_i ? $signed(_io_wI_T_2) : $signed(_GEN_1025); // @[FFTTwiddle.scala 54:17]
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
  input  [9:0]  io_radixCount,
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
  wire [10:0] twiddleUnits_0_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_0_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_0_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_0_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [10:0] twiddleUnits_1_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_1_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_1_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_1_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [10:0] twiddleUnits_2_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_2_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_2_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_2_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [10:0] twiddleUnits_3_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_3_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_3_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_3_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [10:0] twiddleUnits_4_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_4_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_4_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_4_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [10:0] twiddleUnits_5_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_5_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_5_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_5_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [10:0] twiddleUnits_6_io_nk; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [1:0] twiddleUnits_6_io_twiLutCaseIndex; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_6_io_wR; // @[FFT3PipelineR23Calc.scala 41:52]
  wire [13:0] twiddleUnits_6_io_wI; // @[FFT3PipelineR23Calc.scala 41:52]
  wire  lastPhase = io_phaseCount == 2'h3; // @[FFT3PipelineR23Calc.scala 38:35]
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
  wire [9:0] _twiLutIdxPre_T_1 = 2'h0 == io_phaseCount ? io_radixCount : 10'h0; // @[Mux.scala 81:58]
  wire [9:0] _twiLutIdxPre_T_3 = 2'h1 == io_phaseCount ? {{3'd0}, io_radixCount[9:3]} : _twiLutIdxPre_T_1; // @[Mux.scala 81:58]
  wire [9:0] _twiLutIdxPre_T_5 = 2'h2 == io_phaseCount ? {{6'd0}, io_radixCount[9:6]} : _twiLutIdxPre_T_3; // @[Mux.scala 81:58]
  reg [7:0] twiLutIdxPre1c; // @[Reg.scala 35:20]
  wire [7:0] twiLutIdxPre = _twiLutIdxPre_T_5[7:0]; // @[FFT3PipelineR23Calc.scala 74:28 75:18]
  wire [10:0] _twiddleUnits_0_io_nk_T = 3'h1 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 80:81]
  wire [3:0] _twiddleUnits_0_io_nk_T_1 = io_phaseCount * 2'h3; // @[FFT3PipelineR23Calc.scala 80:117]
  wire [25:0] _GEN_0 = {{15'd0}, _twiddleUnits_0_io_nk_T}; // @[FFT3PipelineR23Calc.scala 80:99]
  wire [25:0] _twiddleUnits_0_io_nk_T_2 = _GEN_0 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 80:99]
  wire [26:0] _twiddleUnits_0_io_nk_T_3 = {_twiddleUnits_0_io_nk_T_2,1'h0}; // @[Cat.scala 33:92]
  wire [10:0] _twiddleUnits_1_io_nk_T = 3'h2 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [25:0] _GEN_1 = {{15'd0}, _twiddleUnits_1_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [25:0] _twiddleUnits_1_io_nk_T_2 = _GEN_1 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [10:0] _twiddleUnits_2_io_nk_T = 3'h3 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [25:0] _GEN_27 = {{15'd0}, _twiddleUnits_2_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [25:0] _twiddleUnits_2_io_nk_T_2 = _GEN_27 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [10:0] _twiddleUnits_3_io_nk_T = 3'h4 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [25:0] _GEN_28 = {{15'd0}, _twiddleUnits_3_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [25:0] _twiddleUnits_3_io_nk_T_2 = _GEN_28 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [10:0] _twiddleUnits_4_io_nk_T = 3'h5 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [25:0] _GEN_36 = {{15'd0}, _twiddleUnits_4_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [25:0] _twiddleUnits_4_io_nk_T_2 = _GEN_36 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [10:0] _twiddleUnits_5_io_nk_T = 3'h6 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [25:0] _GEN_37 = {{15'd0}, _twiddleUnits_5_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [25:0] _twiddleUnits_5_io_nk_T_2 = _GEN_37 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [10:0] _twiddleUnits_6_io_nk_T = 3'h7 * twiLutIdxPre1c; // @[FFT3PipelineR23Calc.scala 86:51]
  wire [25:0] _GEN_70 = {{15'd0}, _twiddleUnits_6_io_nk_T}; // @[FFT3PipelineR23Calc.scala 86:69]
  wire [25:0] _twiddleUnits_6_io_nk_T_2 = _GEN_70 << _twiddleUnits_0_io_nk_T_1; // @[FFT3PipelineR23Calc.scala 86:69]
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
  assign twiddleUnits_0_io_nk = _twiddleUnits_0_io_nk_T_3[10:0]; // @[FFT3PipelineR23Calc.scala 80:27]
  assign twiddleUnits_0_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_1_io_nk = _twiddleUnits_1_io_nk_T_2[10:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_1_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_2_io_nk = _twiddleUnits_2_io_nk_T_2[10:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_2_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_3_io_nk = _twiddleUnits_3_io_nk_T_2[10:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_3_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_4_io_nk = _twiddleUnits_4_io_nk_T_2[10:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_4_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_5_io_nk = _twiddleUnits_5_io_nk_T_2[10:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_5_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  assign twiddleUnits_6_io_nk = _twiddleUnits_6_io_nk_T_2[10:0]; // @[FFT3PipelineR23Calc.scala 86:94]
  assign twiddleUnits_6_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineR23Calc.scala 54:30]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      twiLutIdxPre1c <= 8'h0; // @[Reg.scala 35:20]
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
  twiLutIdxPre1c = _RAND_0[7:0];
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
  output [7:0]  io_addrSram0Bank_0,
  output [7:0]  io_addrSram0Bank_1,
  output [7:0]  io_addrSram0Bank_2,
  output [7:0]  io_addrSram0Bank_3,
  output [7:0]  io_addrSram0Bank_4,
  output [7:0]  io_addrSram0Bank_5,
  output [7:0]  io_addrSram0Bank_6,
  output [7:0]  io_addrSram0Bank_7,
  output [7:0]  io_addrSram1Bank_0,
  output [7:0]  io_addrSram1Bank_1,
  output [7:0]  io_addrSram1Bank_2,
  output [7:0]  io_addrSram1Bank_3,
  output [7:0]  io_addrSram1Bank_4,
  output [7:0]  io_addrSram1Bank_5,
  output [7:0]  io_addrSram1Bank_6,
  output [7:0]  io_addrSram1Bank_7,
  output        io_fftDone,
  input         io_fftEngineKick,
  input         io_fftMode,
  input         io_fftRShiftP0_0,
  input         io_fftRShiftP0_1,
  input         io_fftRShiftP0_2,
  input         io_fftRShiftP0_3
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
  wire [9:0] fftCalc_io_radixCount; // @[FFTEngine.scala 362:25]
  wire [1:0] fftCalc_io_calcMode; // @[FFTEngine.scala 362:25]
  wire [1:0] fftCalc_io_phaseCount; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_rShiftSym; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_isFFT; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_state1c; // @[FFTEngine.scala 362:25]
  wire  fftCalc_io_state2c; // @[FFTEngine.scala 362:25]
  reg [2:0] stateReg; // @[FFTEngine.scala 46:27]
  reg [10:0] addrSProc; // @[FFTEngine.scala 48:29]
  reg [1:0] phaseCount; // @[FFTEngine.scala 50:29]
  wire  _T_2 = addrSProc == 11'hff; // @[FFTEngine.scala 117:33]
  wire  _T_4 = addrSProc == 11'h3; // @[FFTEngine.scala 124:33]
  wire [2:0] _GEN_2 = addrSProc == 11'h3 ? 3'h3 : stateReg; // @[FFTEngine.scala 124:49 125:30 127:30]
  wire  _T_6 = phaseCount == 2'h3; // @[FFTEngine.scala 131:33]
  wire [2:0] _GEN_3 = phaseCount == 2'h3 ? 3'h7 : 3'h1; // @[FFTEngine.scala 131:50 132:30 134:30]
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
  wire  _radixInit_T_13 = stateReg == 3'h4 & addrSProc == 11'h3ff; // @[FFTEngine.scala 149:28]
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
  wire [10:0] _radixCount_T_1 = addrSProc + 11'h1; // @[FFTEngine.scala 161:34]
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
  wire [10:0] _addrKernelPre_0_T_1 = {addrSProc[7:0],3'h0}; // @[Cat.scala 33:92]
  wire [10:0] _addrKernelPre_1_T_1 = {addrSProc[7:0],3'h1}; // @[Cat.scala 33:92]
  wire [10:0] _addrKernelPre_2_T_1 = {addrSProc[7:0],3'h2}; // @[Cat.scala 33:92]
  wire [10:0] _addrKernelPre_3_T_1 = {addrSProc[7:0],3'h3}; // @[Cat.scala 33:92]
  wire [10:0] _addrKernelPre_4_T_1 = {addrSProc[7:0],3'h4}; // @[Cat.scala 33:92]
  wire [10:0] _addrKernelPre_5_T_1 = {addrSProc[7:0],3'h5}; // @[Cat.scala 33:92]
  wire [10:0] _addrKernelPre_6_T_1 = {addrSProc[7:0],3'h6}; // @[Cat.scala 33:92]
  wire [10:0] _addrKernelPre_7_T_1 = {addrSProc[7:0],3'h7}; // @[Cat.scala 33:92]
  wire [2:0] _addrKernelPre_0_T_4 = {phaseCount, 1'h0}; // @[FFTEngine.scala 227:121]
  wire [2:0] _GEN_1396 = {{1'd0}, phaseCount}; // @[FFTEngine.scala 227:127]
  wire [2:0] _addrKernelPre_0_T_6 = _addrKernelPre_0_T_4 + _GEN_1396; // @[FFTEngine.scala 227:127]
  wire [21:0] _addrKernelPre_0_dataTemp_T = {3'h0,addrSProc[7:0],3'h0,addrSProc[7:0]}; // @[Cat.scala 33:92]
  wire [21:0] addrKernelPre_0_dataTemp = _addrKernelPre_0_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [21:0] _addrKernelPre_1_dataTemp_T = {3'h1,addrSProc[7:0],3'h1,addrSProc[7:0]}; // @[Cat.scala 33:92]
  wire [21:0] addrKernelPre_1_dataTemp = _addrKernelPre_1_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [21:0] _addrKernelPre_2_dataTemp_T = {3'h2,addrSProc[7:0],3'h2,addrSProc[7:0]}; // @[Cat.scala 33:92]
  wire [21:0] addrKernelPre_2_dataTemp = _addrKernelPre_2_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [21:0] _addrKernelPre_3_dataTemp_T = {3'h3,addrSProc[7:0],3'h3,addrSProc[7:0]}; // @[Cat.scala 33:92]
  wire [21:0] addrKernelPre_3_dataTemp = _addrKernelPre_3_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [21:0] _addrKernelPre_4_dataTemp_T = {3'h4,addrSProc[7:0],3'h4,addrSProc[7:0]}; // @[Cat.scala 33:92]
  wire [21:0] addrKernelPre_4_dataTemp = _addrKernelPre_4_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [21:0] _addrKernelPre_5_dataTemp_T = {3'h5,addrSProc[7:0],3'h5,addrSProc[7:0]}; // @[Cat.scala 33:92]
  wire [21:0] addrKernelPre_5_dataTemp = _addrKernelPre_5_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [21:0] _addrKernelPre_6_dataTemp_T = {3'h6,addrSProc[7:0],3'h6,addrSProc[7:0]}; // @[Cat.scala 33:92]
  wire [21:0] addrKernelPre_6_dataTemp = _addrKernelPre_6_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [21:0] _addrKernelPre_7_dataTemp_T = {3'h7,addrSProc[7:0],3'h7,addrSProc[7:0]}; // @[Cat.scala 33:92]
  wire [21:0] addrKernelPre_7_dataTemp = _addrKernelPre_7_dataTemp_T >> _addrKernelPre_0_T_6; // @[FFTEngine.scala 210:40]
  wire [10:0] addrKernelPre_0 = _T_6 ? _addrKernelPre_0_T_1 : addrKernelPre_0_dataTemp[10:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [10:0] addrKernelPre_1 = _T_6 ? _addrKernelPre_1_T_1 : addrKernelPre_1_dataTemp[10:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [10:0] addrKernelPre_2 = _T_6 ? _addrKernelPre_2_T_1 : addrKernelPre_2_dataTemp[10:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [10:0] addrKernelPre_3 = _T_6 ? _addrKernelPre_3_T_1 : addrKernelPre_3_dataTemp[10:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [10:0] addrKernelPre_4 = _T_6 ? _addrKernelPre_4_T_1 : addrKernelPre_4_dataTemp[10:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [10:0] addrKernelPre_5 = _T_6 ? _addrKernelPre_5_T_1 : addrKernelPre_5_dataTemp[10:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [10:0] addrKernelPre_6 = _T_6 ? _addrKernelPre_6_T_1 : addrKernelPre_6_dataTemp[10:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire [10:0] addrKernelPre_7 = _T_6 ? _addrKernelPre_7_T_1 : addrKernelPre_7_dataTemp[10:0]; // @[FFTEngine.scala 216:38 219:34 227:34]
  wire  sameAddr = addrKernelPre_0 == addrKernelPre_1; // @[FFTEngine.scala 248:30]
  reg [7:0] addrIn1c_0_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn2c_0_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn3c_0_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn1c_1_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn2c_1_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn3c_1_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn1c_2_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn2c_2_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn3c_2_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn1c_3_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn2c_3_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn3c_3_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn1c_4_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn2c_4_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn3c_4_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn1c_5_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn2c_5_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn3c_5_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn1c_6_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn2c_6_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn3c_6_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn1c_7_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn2c_7_r; // @[Reg.scala 35:20]
  reg [7:0] addrIn3c_7_r; // @[Reg.scala 35:20]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T = {{2'd0}, addrKernelPre_0[10:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1405 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_2 = {{1'd0}, _GEN_1405}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_4 = {{5'd0}, addrKernelPre_0[10:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1407 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_7 = _addrInBankSelKernelPrePre_sum_T_2[2:0] + _GEN_1407; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_8 = {{8'd0}, addrKernelPre_0[10:8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1409 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_8[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_0_0 = _addrInBankSelKernelPrePre_sum_T_7 + _GEN_1409; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_11 = {{1'd0}, addrKernelPre_0[10:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1411 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_13 = {{1'd0}, _GEN_1411}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_15 = {{4'd0}, addrKernelPre_0[10:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1413 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_15[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_18 = _addrInBankSelKernelPrePre_sum_T_13[2:0] + _GEN_1413; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_19 = {{7'd0}, addrKernelPre_0[10:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1415 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_19[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_22 = _addrInBankSelKernelPrePre_sum_T_18 + _GEN_1415; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_23 = {{10'd0}, addrKernelPre_0[10]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1417 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_23[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_0_1 = _addrInBankSelKernelPrePre_sum_T_22 + _GEN_1417; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1418 = {{2'd0}, addrKernelPre_0[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_28 = {{1'd0}, _GEN_1418}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_30 = {{3'd0}, addrKernelPre_0[10:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1420 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_30[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_33 = _addrInBankSelKernelPrePre_sum_T_28[2:0] + _GEN_1420; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_34 = {{6'd0}, addrKernelPre_0[10:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1422 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_34[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_37 = _addrInBankSelKernelPrePre_sum_T_33 + _GEN_1422; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_38 = {{9'd0}, addrKernelPre_0[10:9]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1424 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_38[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_0_2 = _addrInBankSelKernelPrePre_sum_T_37 + _GEN_1424; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_41 = {{2'd0}, addrKernelPre_1[10:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1426 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_41[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_43 = {{1'd0}, _GEN_1426}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_45 = {{5'd0}, addrKernelPre_1[10:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1428 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_45[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_48 = _addrInBankSelKernelPrePre_sum_T_43[2:0] + _GEN_1428; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_49 = {{8'd0}, addrKernelPre_1[10:8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1430 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_49[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_1_0 = _addrInBankSelKernelPrePre_sum_T_48 + _GEN_1430; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_52 = {{1'd0}, addrKernelPre_1[10:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1432 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_52[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_54 = {{1'd0}, _GEN_1432}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_56 = {{4'd0}, addrKernelPre_1[10:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1434 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_56[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_59 = _addrInBankSelKernelPrePre_sum_T_54[2:0] + _GEN_1434; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_60 = {{7'd0}, addrKernelPre_1[10:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1436 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_60[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_63 = _addrInBankSelKernelPrePre_sum_T_59 + _GEN_1436; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_64 = {{10'd0}, addrKernelPre_1[10]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1438 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_64[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_1_1 = _addrInBankSelKernelPrePre_sum_T_63 + _GEN_1438; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1439 = {{2'd0}, addrKernelPre_1[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_69 = {{1'd0}, _GEN_1439}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_71 = {{3'd0}, addrKernelPre_1[10:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1441 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_71[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_74 = _addrInBankSelKernelPrePre_sum_T_69[2:0] + _GEN_1441; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_75 = {{6'd0}, addrKernelPre_1[10:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1443 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_75[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_78 = _addrInBankSelKernelPrePre_sum_T_74 + _GEN_1443; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_79 = {{9'd0}, addrKernelPre_1[10:9]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1445 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_79[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_1_2 = _addrInBankSelKernelPrePre_sum_T_78 + _GEN_1445; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_82 = {{2'd0}, addrKernelPre_2[10:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1447 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_82[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_84 = {{1'd0}, _GEN_1447}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_86 = {{5'd0}, addrKernelPre_2[10:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1449 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_86[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_89 = _addrInBankSelKernelPrePre_sum_T_84[2:0] + _GEN_1449; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_90 = {{8'd0}, addrKernelPre_2[10:8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1451 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_90[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_2_0 = _addrInBankSelKernelPrePre_sum_T_89 + _GEN_1451; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_93 = {{1'd0}, addrKernelPre_2[10:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1453 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_93[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_95 = {{1'd0}, _GEN_1453}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_97 = {{4'd0}, addrKernelPre_2[10:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1455 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_97[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_100 = _addrInBankSelKernelPrePre_sum_T_95[2:0] + _GEN_1455; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_101 = {{7'd0}, addrKernelPre_2[10:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1457 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_101[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_104 = _addrInBankSelKernelPrePre_sum_T_100 + _GEN_1457; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_105 = {{10'd0}, addrKernelPre_2[10]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1459 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_105[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_2_1 = _addrInBankSelKernelPrePre_sum_T_104 + _GEN_1459; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1460 = {{2'd0}, addrKernelPre_2[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_110 = {{1'd0}, _GEN_1460}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_112 = {{3'd0}, addrKernelPre_2[10:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1462 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_112[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_115 = _addrInBankSelKernelPrePre_sum_T_110[2:0] + _GEN_1462; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_116 = {{6'd0}, addrKernelPre_2[10:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1464 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_116[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_119 = _addrInBankSelKernelPrePre_sum_T_115 + _GEN_1464; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_120 = {{9'd0}, addrKernelPre_2[10:9]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1466 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_120[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_2_2 = _addrInBankSelKernelPrePre_sum_T_119 + _GEN_1466; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_123 = {{2'd0}, addrKernelPre_3[10:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1468 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_123[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_125 = {{1'd0}, _GEN_1468}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_127 = {{5'd0}, addrKernelPre_3[10:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1470 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_127[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_130 = _addrInBankSelKernelPrePre_sum_T_125[2:0] + _GEN_1470; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_131 = {{8'd0}, addrKernelPre_3[10:8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1472 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_131[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_3_0 = _addrInBankSelKernelPrePre_sum_T_130 + _GEN_1472; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_134 = {{1'd0}, addrKernelPre_3[10:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1474 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_134[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_136 = {{1'd0}, _GEN_1474}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_138 = {{4'd0}, addrKernelPre_3[10:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1476 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_138[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_141 = _addrInBankSelKernelPrePre_sum_T_136[2:0] + _GEN_1476; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_142 = {{7'd0}, addrKernelPre_3[10:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1478 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_142[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_145 = _addrInBankSelKernelPrePre_sum_T_141 + _GEN_1478; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_146 = {{10'd0}, addrKernelPre_3[10]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1480 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_146[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_3_1 = _addrInBankSelKernelPrePre_sum_T_145 + _GEN_1480; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1481 = {{2'd0}, addrKernelPre_3[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_151 = {{1'd0}, _GEN_1481}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_153 = {{3'd0}, addrKernelPre_3[10:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1483 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_153[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_156 = _addrInBankSelKernelPrePre_sum_T_151[2:0] + _GEN_1483; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_157 = {{6'd0}, addrKernelPre_3[10:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1485 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_157[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_160 = _addrInBankSelKernelPrePre_sum_T_156 + _GEN_1485; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_161 = {{9'd0}, addrKernelPre_3[10:9]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1487 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_161[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_3_2 = _addrInBankSelKernelPrePre_sum_T_160 + _GEN_1487; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_164 = {{2'd0}, addrKernelPre_4[10:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1489 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_164[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_166 = {{1'd0}, _GEN_1489}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_168 = {{5'd0}, addrKernelPre_4[10:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1491 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_168[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_171 = _addrInBankSelKernelPrePre_sum_T_166[2:0] + _GEN_1491; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_172 = {{8'd0}, addrKernelPre_4[10:8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1493 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_172[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_4_0 = _addrInBankSelKernelPrePre_sum_T_171 + _GEN_1493; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_175 = {{1'd0}, addrKernelPre_4[10:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1495 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_175[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_177 = {{1'd0}, _GEN_1495}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_179 = {{4'd0}, addrKernelPre_4[10:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1497 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_179[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_182 = _addrInBankSelKernelPrePre_sum_T_177[2:0] + _GEN_1497; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_183 = {{7'd0}, addrKernelPre_4[10:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1499 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_183[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_186 = _addrInBankSelKernelPrePre_sum_T_182 + _GEN_1499; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_187 = {{10'd0}, addrKernelPre_4[10]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1501 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_187[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_4_1 = _addrInBankSelKernelPrePre_sum_T_186 + _GEN_1501; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1502 = {{2'd0}, addrKernelPre_4[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_192 = {{1'd0}, _GEN_1502}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_194 = {{3'd0}, addrKernelPre_4[10:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1504 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_194[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_197 = _addrInBankSelKernelPrePre_sum_T_192[2:0] + _GEN_1504; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_198 = {{6'd0}, addrKernelPre_4[10:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1506 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_198[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_201 = _addrInBankSelKernelPrePre_sum_T_197 + _GEN_1506; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_202 = {{9'd0}, addrKernelPre_4[10:9]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1508 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_202[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_4_2 = _addrInBankSelKernelPrePre_sum_T_201 + _GEN_1508; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_205 = {{2'd0}, addrKernelPre_5[10:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1510 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_205[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_207 = {{1'd0}, _GEN_1510}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_209 = {{5'd0}, addrKernelPre_5[10:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1512 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_209[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_212 = _addrInBankSelKernelPrePre_sum_T_207[2:0] + _GEN_1512; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_213 = {{8'd0}, addrKernelPre_5[10:8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1514 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_213[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_5_0 = _addrInBankSelKernelPrePre_sum_T_212 + _GEN_1514; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_216 = {{1'd0}, addrKernelPre_5[10:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1516 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_216[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_218 = {{1'd0}, _GEN_1516}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_220 = {{4'd0}, addrKernelPre_5[10:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1518 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_220[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_223 = _addrInBankSelKernelPrePre_sum_T_218[2:0] + _GEN_1518; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_224 = {{7'd0}, addrKernelPre_5[10:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1520 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_224[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_227 = _addrInBankSelKernelPrePre_sum_T_223 + _GEN_1520; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_228 = {{10'd0}, addrKernelPre_5[10]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1522 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_228[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_5_1 = _addrInBankSelKernelPrePre_sum_T_227 + _GEN_1522; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1523 = {{2'd0}, addrKernelPre_5[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_233 = {{1'd0}, _GEN_1523}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_235 = {{3'd0}, addrKernelPre_5[10:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1525 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_235[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_238 = _addrInBankSelKernelPrePre_sum_T_233[2:0] + _GEN_1525; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_239 = {{6'd0}, addrKernelPre_5[10:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1527 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_239[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_242 = _addrInBankSelKernelPrePre_sum_T_238 + _GEN_1527; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_243 = {{9'd0}, addrKernelPre_5[10:9]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1529 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_243[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_5_2 = _addrInBankSelKernelPrePre_sum_T_242 + _GEN_1529; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_246 = {{2'd0}, addrKernelPre_6[10:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1531 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_246[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_248 = {{1'd0}, _GEN_1531}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_250 = {{5'd0}, addrKernelPre_6[10:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1533 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_250[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_253 = _addrInBankSelKernelPrePre_sum_T_248[2:0] + _GEN_1533; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_254 = {{8'd0}, addrKernelPre_6[10:8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1535 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_254[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_6_0 = _addrInBankSelKernelPrePre_sum_T_253 + _GEN_1535; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_257 = {{1'd0}, addrKernelPre_6[10:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1537 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_257[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_259 = {{1'd0}, _GEN_1537}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_261 = {{4'd0}, addrKernelPre_6[10:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1539 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_261[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_264 = _addrInBankSelKernelPrePre_sum_T_259[2:0] + _GEN_1539; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_265 = {{7'd0}, addrKernelPre_6[10:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1541 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_265[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_268 = _addrInBankSelKernelPrePre_sum_T_264 + _GEN_1541; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_269 = {{10'd0}, addrKernelPre_6[10]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1543 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_269[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_6_1 = _addrInBankSelKernelPrePre_sum_T_268 + _GEN_1543; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1544 = {{2'd0}, addrKernelPre_6[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_274 = {{1'd0}, _GEN_1544}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_276 = {{3'd0}, addrKernelPre_6[10:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1546 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_276[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_279 = _addrInBankSelKernelPrePre_sum_T_274[2:0] + _GEN_1546; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_280 = {{6'd0}, addrKernelPre_6[10:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1548 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_280[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_283 = _addrInBankSelKernelPrePre_sum_T_279 + _GEN_1548; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_284 = {{9'd0}, addrKernelPre_6[10:9]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1550 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_284[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_6_2 = _addrInBankSelKernelPrePre_sum_T_283 + _GEN_1550; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_287 = {{2'd0}, addrKernelPre_7[10:2]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1552 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_287[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_289 = {{1'd0}, _GEN_1552}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_291 = {{5'd0}, addrKernelPre_7[10:5]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1554 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_291[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_294 = _addrInBankSelKernelPrePre_sum_T_289[2:0] + _GEN_1554; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_295 = {{8'd0}, addrKernelPre_7[10:8]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1556 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_295[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_7_0 = _addrInBankSelKernelPrePre_sum_T_294 + _GEN_1556; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_298 = {{1'd0}, addrKernelPre_7[10:1]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1558 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_298[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_300 = {{1'd0}, _GEN_1558}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_302 = {{4'd0}, addrKernelPre_7[10:4]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1560 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_302[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_305 = _addrInBankSelKernelPrePre_sum_T_300[2:0] + _GEN_1560; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_306 = {{7'd0}, addrKernelPre_7[10:7]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1562 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_306[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_309 = _addrInBankSelKernelPrePre_sum_T_305 + _GEN_1562; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_310 = {{10'd0}, addrKernelPre_7[10]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1564 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_310[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_7_1 = _addrInBankSelKernelPrePre_sum_T_309 + _GEN_1564; // @[FFTEngine.scala 261:107]
  wire [2:0] _GEN_1565 = {{2'd0}, addrKernelPre_7[0]}; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPrePre_sum_T_315 = {{1'd0}, _GEN_1565}; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_317 = {{3'd0}, addrKernelPre_7[10:3]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1567 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_317[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_320 = _addrInBankSelKernelPrePre_sum_T_315[2:0] + _GEN_1567; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_321 = {{6'd0}, addrKernelPre_7[10:6]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1569 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_321[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] _addrInBankSelKernelPrePre_sum_T_324 = _addrInBankSelKernelPrePre_sum_T_320 + _GEN_1569; // @[FFTEngine.scala 261:107]
  wire [10:0] _addrInBankSelKernelPrePre_sum_T_325 = {{9'd0}, addrKernelPre_7[10:9]}; // @[FFTEngine.scala 261:115]
  wire [2:0] _GEN_1571 = {{2'd0}, _addrInBankSelKernelPrePre_sum_T_325[0]}; // @[FFTEngine.scala 261:107]
  wire [2:0] addrInBankSelKernelPrePre_7_2 = _addrInBankSelKernelPrePre_sum_T_324 + _GEN_1571; // @[FFTEngine.scala 261:107]
  wire [3:0] _addrInBankSelKernelPre_T_1 = {{1'd0}, addrInBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_3 = {_addrInBankSelKernelPre_T_1[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1572 = {{1'd0}, addrInBankSelKernelPrePre_0_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_5 = _addrInBankSelKernelPre_T_3 + _GEN_1572; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_6 = {_addrInBankSelKernelPre_T_5, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1573 = {{2'd0}, addrInBankSelKernelPrePre_0_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_8 = _addrInBankSelKernelPre_T_6 + _GEN_1573; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_10 = {{1'd0}, addrInBankSelKernelPrePre_1_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_12 = {_addrInBankSelKernelPre_T_10[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1574 = {{1'd0}, addrInBankSelKernelPrePre_1_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_14 = _addrInBankSelKernelPre_T_12 + _GEN_1574; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_15 = {_addrInBankSelKernelPre_T_14, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1575 = {{2'd0}, addrInBankSelKernelPrePre_1_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_17 = _addrInBankSelKernelPre_T_15 + _GEN_1575; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_19 = {{1'd0}, addrInBankSelKernelPrePre_2_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_21 = {_addrInBankSelKernelPre_T_19[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1576 = {{1'd0}, addrInBankSelKernelPrePre_2_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_23 = _addrInBankSelKernelPre_T_21 + _GEN_1576; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_24 = {_addrInBankSelKernelPre_T_23, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1577 = {{2'd0}, addrInBankSelKernelPrePre_2_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_26 = _addrInBankSelKernelPre_T_24 + _GEN_1577; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_28 = {{1'd0}, addrInBankSelKernelPrePre_3_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_30 = {_addrInBankSelKernelPre_T_28[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1578 = {{1'd0}, addrInBankSelKernelPrePre_3_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_32 = _addrInBankSelKernelPre_T_30 + _GEN_1578; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_33 = {_addrInBankSelKernelPre_T_32, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1579 = {{2'd0}, addrInBankSelKernelPrePre_3_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_35 = _addrInBankSelKernelPre_T_33 + _GEN_1579; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_37 = {{1'd0}, addrInBankSelKernelPrePre_4_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_39 = {_addrInBankSelKernelPre_T_37[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1580 = {{1'd0}, addrInBankSelKernelPrePre_4_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_41 = _addrInBankSelKernelPre_T_39 + _GEN_1580; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_42 = {_addrInBankSelKernelPre_T_41, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1581 = {{2'd0}, addrInBankSelKernelPrePre_4_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_44 = _addrInBankSelKernelPre_T_42 + _GEN_1581; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_46 = {{1'd0}, addrInBankSelKernelPrePre_5_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_48 = {_addrInBankSelKernelPre_T_46[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1582 = {{1'd0}, addrInBankSelKernelPrePre_5_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_50 = _addrInBankSelKernelPre_T_48 + _GEN_1582; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_51 = {_addrInBankSelKernelPre_T_50, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1583 = {{2'd0}, addrInBankSelKernelPrePre_5_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_53 = _addrInBankSelKernelPre_T_51 + _GEN_1583; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_55 = {{1'd0}, addrInBankSelKernelPrePre_6_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_57 = {_addrInBankSelKernelPre_T_55[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1584 = {{1'd0}, addrInBankSelKernelPrePre_6_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_59 = _addrInBankSelKernelPre_T_57 + _GEN_1584; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_60 = {_addrInBankSelKernelPre_T_59, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1585 = {{2'd0}, addrInBankSelKernelPrePre_6_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_62 = _addrInBankSelKernelPre_T_60 + _GEN_1585; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_64 = {{1'd0}, addrInBankSelKernelPrePre_7_0}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_66 = {_addrInBankSelKernelPre_T_64[2:0], 1'h0}; // @[FFTEngine.scala 267:136]
  wire [3:0] _GEN_1586 = {{1'd0}, addrInBankSelKernelPrePre_7_1}; // @[FFTEngine.scala 267:142]
  wire [3:0] _addrInBankSelKernelPre_T_68 = _addrInBankSelKernelPre_T_66 + _GEN_1586; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_69 = {_addrInBankSelKernelPre_T_68, 1'h0}; // @[FFTEngine.scala 267:136]
  wire [4:0] _GEN_1587 = {{2'd0}, addrInBankSelKernelPrePre_7_2}; // @[FFTEngine.scala 267:142]
  wire [4:0] _addrInBankSelKernelPre_T_71 = _addrInBankSelKernelPre_T_69 + _GEN_1587; // @[FFTEngine.scala 267:142]
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
  wire  addrInBankSelProcPre__0 = addrKernelPre_0[0] ^ addrKernelPre_0[10]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre__1 = addrKernelPre_0[1] ^ addrKernelPre_0[9]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre__2 = addrKernelPre_0[2] ^ addrKernelPre_0[8]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_0 = {addrInBankSelProcPre__0,addrInBankSelProcPre__1,addrInBankSelProcPre__2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_1_0 = addrKernelPre_1[0] ^ addrKernelPre_1[10]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_1_1 = addrKernelPre_1[1] ^ addrKernelPre_1[9]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_1_2 = addrKernelPre_1[2] ^ addrKernelPre_1[8]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_1 = {addrInBankSelProcPre_1_0,addrInBankSelProcPre_1_1,addrInBankSelProcPre_1_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_2_0 = addrKernelPre_2[0] ^ addrKernelPre_2[10]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_2_1 = addrKernelPre_2[1] ^ addrKernelPre_2[9]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_2_2 = addrKernelPre_2[2] ^ addrKernelPre_2[8]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_2 = {addrInBankSelProcPre_2_0,addrInBankSelProcPre_2_1,addrInBankSelProcPre_2_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_3_0 = addrKernelPre_3[0] ^ addrKernelPre_3[10]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_3_1 = addrKernelPre_3[1] ^ addrKernelPre_3[9]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_3_2 = addrKernelPre_3[2] ^ addrKernelPre_3[8]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_3 = {addrInBankSelProcPre_3_0,addrInBankSelProcPre_3_1,addrInBankSelProcPre_3_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_4_0 = addrKernelPre_4[0] ^ addrKernelPre_4[10]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_4_1 = addrKernelPre_4[1] ^ addrKernelPre_4[9]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_4_2 = addrKernelPre_4[2] ^ addrKernelPre_4[8]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_4 = {addrInBankSelProcPre_4_0,addrInBankSelProcPre_4_1,addrInBankSelProcPre_4_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_5_0 = addrKernelPre_5[0] ^ addrKernelPre_5[10]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_5_1 = addrKernelPre_5[1] ^ addrKernelPre_5[9]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_5_2 = addrKernelPre_5[2] ^ addrKernelPre_5[8]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_5 = {addrInBankSelProcPre_5_0,addrInBankSelProcPre_5_1,addrInBankSelProcPre_5_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_6_0 = addrKernelPre_6[0] ^ addrKernelPre_6[10]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_6_1 = addrKernelPre_6[1] ^ addrKernelPre_6[9]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_6_2 = addrKernelPre_6[2] ^ addrKernelPre_6[8]; // @[FFTEngine.scala 296:57]
  wire [2:0] addrInBankSelProc_6 = {addrInBankSelProcPre_6_0,addrInBankSelProcPre_6_1,addrInBankSelProcPre_6_2}; // @[Cat.scala 33:92]
  wire  addrInBankSelProcPre_7_0 = addrKernelPre_7[0] ^ addrKernelPre_7[10]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_7_1 = addrKernelPre_7[1] ^ addrKernelPre_7[9]; // @[FFTEngine.scala 296:57]
  wire  addrInBankSelProcPre_7_2 = addrKernelPre_7[2] ^ addrKernelPre_7[8]; // @[FFTEngine.scala 296:57]
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
  wire [10:0] _fftCalc_io_radixCount_T_2 = {{3'd0}, addrSProc[7:0]}; // @[FFTEngine.scala 370:33]
  wire  _GEN_264 = 2'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 371:{32,32}]
  wire  _GEN_265 = 2'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_264; // @[FFTEngine.scala 371:{32,32}]
  wire  _GEN_266 = 2'h3 == phaseCount ? io_fftRShiftP0_3 : _GEN_265; // @[FFTEngine.scala 371:{32,32}]
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
  wire [7:0] _GEN_390 = 3'h0 == addrInBankSel_1 ? addrKernelPre_1[7:0] : addrKernelPre_0[7:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_391 = 3'h1 == addrInBankSel_1 ? addrKernelPre_1[7:0] : addrKernelPre_0[7:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_392 = 3'h2 == addrInBankSel_1 ? addrKernelPre_1[7:0] : addrKernelPre_0[7:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_393 = 3'h3 == addrInBankSel_1 ? addrKernelPre_1[7:0] : addrKernelPre_0[7:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_394 = 3'h4 == addrInBankSel_1 ? addrKernelPre_1[7:0] : addrKernelPre_0[7:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_395 = 3'h5 == addrInBankSel_1 ? addrKernelPre_1[7:0] : addrKernelPre_0[7:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_396 = 3'h6 == addrInBankSel_1 ? addrKernelPre_1[7:0] : addrKernelPre_0[7:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_397 = 3'h7 == addrInBankSel_1 ? addrKernelPre_1[7:0] : addrKernelPre_0[7:0]; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_406 = _srcBufferNext_T_3 ? _GEN_390 : addrKernelPre_0[7:0]; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_407 = _srcBufferNext_T_3 ? _GEN_391 : addrKernelPre_0[7:0]; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_408 = _srcBufferNext_T_3 ? _GEN_392 : addrKernelPre_0[7:0]; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_409 = _srcBufferNext_T_3 ? _GEN_393 : addrKernelPre_0[7:0]; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_410 = _srcBufferNext_T_3 ? _GEN_394 : addrKernelPre_0[7:0]; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_411 = _srcBufferNext_T_3 ? _GEN_395 : addrKernelPre_0[7:0]; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_412 = _srcBufferNext_T_3 ? _GEN_396 : addrKernelPre_0[7:0]; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_413 = _srcBufferNext_T_3 ? _GEN_397 : addrKernelPre_0[7:0]; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_414 = _srcBufferNext_T_3 ? addrKernelPre_0[7:0] : _GEN_390; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_415 = _srcBufferNext_T_3 ? addrKernelPre_0[7:0] : _GEN_391; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_416 = _srcBufferNext_T_3 ? addrKernelPre_0[7:0] : _GEN_392; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_417 = _srcBufferNext_T_3 ? addrKernelPre_0[7:0] : _GEN_393; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_418 = _srcBufferNext_T_3 ? addrKernelPre_0[7:0] : _GEN_394; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_419 = _srcBufferNext_T_3 ? addrKernelPre_0[7:0] : _GEN_395; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_420 = _srcBufferNext_T_3 ? addrKernelPre_0[7:0] : _GEN_396; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_421 = _srcBufferNext_T_3 ? addrKernelPre_0[7:0] : _GEN_397; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_470 = 3'h0 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_406; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_471 = 3'h1 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_407; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_472 = 3'h2 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_408; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_473 = 3'h3 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_409; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_474 = 3'h4 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_410; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_475 = 3'h5 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_411; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_476 = 3'h6 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_412; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_477 = 3'h7 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_413; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_478 = 3'h0 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_414; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_479 = 3'h1 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_415; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_480 = 3'h2 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_416; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_481 = 3'h3 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_417; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_482 = 3'h4 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_418; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_483 = 3'h5 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_419; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_484 = 3'h6 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_420; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_485 = 3'h7 == addrInBankSel_2 ? addrKernelPre_2[7:0] : _GEN_421; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_486 = _srcBufferNext_T_3 ? _GEN_470 : _GEN_406; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_487 = _srcBufferNext_T_3 ? _GEN_471 : _GEN_407; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_488 = _srcBufferNext_T_3 ? _GEN_472 : _GEN_408; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_489 = _srcBufferNext_T_3 ? _GEN_473 : _GEN_409; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_490 = _srcBufferNext_T_3 ? _GEN_474 : _GEN_410; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_491 = _srcBufferNext_T_3 ? _GEN_475 : _GEN_411; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_492 = _srcBufferNext_T_3 ? _GEN_476 : _GEN_412; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_493 = _srcBufferNext_T_3 ? _GEN_477 : _GEN_413; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_494 = _srcBufferNext_T_3 ? _GEN_414 : _GEN_478; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_495 = _srcBufferNext_T_3 ? _GEN_415 : _GEN_479; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_496 = _srcBufferNext_T_3 ? _GEN_416 : _GEN_480; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_497 = _srcBufferNext_T_3 ? _GEN_417 : _GEN_481; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_498 = _srcBufferNext_T_3 ? _GEN_418 : _GEN_482; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_499 = _srcBufferNext_T_3 ? _GEN_419 : _GEN_483; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_500 = _srcBufferNext_T_3 ? _GEN_420 : _GEN_484; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_501 = _srcBufferNext_T_3 ? _GEN_421 : _GEN_485; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_518 = 3'h0 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_486; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_519 = 3'h1 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_487; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_520 = 3'h2 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_488; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_521 = 3'h3 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_489; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_522 = 3'h4 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_490; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_523 = 3'h5 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_491; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_524 = 3'h6 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_492; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_525 = 3'h7 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_493; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_526 = 3'h0 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_494; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_527 = 3'h1 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_495; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_528 = 3'h2 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_496; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_529 = 3'h3 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_497; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_530 = 3'h4 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_498; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_531 = 3'h5 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_499; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_532 = 3'h6 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_500; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_533 = 3'h7 == addrInBankSel_3 ? addrKernelPre_3[7:0] : _GEN_501; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_534 = _srcBufferNext_T_3 ? _GEN_518 : _GEN_486; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_535 = _srcBufferNext_T_3 ? _GEN_519 : _GEN_487; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_536 = _srcBufferNext_T_3 ? _GEN_520 : _GEN_488; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_537 = _srcBufferNext_T_3 ? _GEN_521 : _GEN_489; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_538 = _srcBufferNext_T_3 ? _GEN_522 : _GEN_490; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_539 = _srcBufferNext_T_3 ? _GEN_523 : _GEN_491; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_540 = _srcBufferNext_T_3 ? _GEN_524 : _GEN_492; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_541 = _srcBufferNext_T_3 ? _GEN_525 : _GEN_493; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_542 = _srcBufferNext_T_3 ? _GEN_494 : _GEN_526; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_543 = _srcBufferNext_T_3 ? _GEN_495 : _GEN_527; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_544 = _srcBufferNext_T_3 ? _GEN_496 : _GEN_528; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_545 = _srcBufferNext_T_3 ? _GEN_497 : _GEN_529; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_546 = _srcBufferNext_T_3 ? _GEN_498 : _GEN_530; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_547 = _srcBufferNext_T_3 ? _GEN_499 : _GEN_531; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_548 = _srcBufferNext_T_3 ? _GEN_500 : _GEN_532; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_549 = _srcBufferNext_T_3 ? _GEN_501 : _GEN_533; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_566 = 3'h0 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_534; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_567 = 3'h1 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_535; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_568 = 3'h2 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_536; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_569 = 3'h3 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_537; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_570 = 3'h4 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_538; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_571 = 3'h5 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_539; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_572 = 3'h6 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_540; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_573 = 3'h7 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_541; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_574 = 3'h0 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_542; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_575 = 3'h1 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_543; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_576 = 3'h2 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_544; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_577 = 3'h3 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_545; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_578 = 3'h4 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_546; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_579 = 3'h5 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_547; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_580 = 3'h6 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_548; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_581 = 3'h7 == addrInBankSel_4 ? addrKernelPre_4[7:0] : _GEN_549; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_582 = _srcBufferNext_T_3 ? _GEN_566 : _GEN_534; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_583 = _srcBufferNext_T_3 ? _GEN_567 : _GEN_535; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_584 = _srcBufferNext_T_3 ? _GEN_568 : _GEN_536; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_585 = _srcBufferNext_T_3 ? _GEN_569 : _GEN_537; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_586 = _srcBufferNext_T_3 ? _GEN_570 : _GEN_538; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_587 = _srcBufferNext_T_3 ? _GEN_571 : _GEN_539; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_588 = _srcBufferNext_T_3 ? _GEN_572 : _GEN_540; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_589 = _srcBufferNext_T_3 ? _GEN_573 : _GEN_541; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_590 = _srcBufferNext_T_3 ? _GEN_542 : _GEN_574; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_591 = _srcBufferNext_T_3 ? _GEN_543 : _GEN_575; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_592 = _srcBufferNext_T_3 ? _GEN_544 : _GEN_576; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_593 = _srcBufferNext_T_3 ? _GEN_545 : _GEN_577; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_594 = _srcBufferNext_T_3 ? _GEN_546 : _GEN_578; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_595 = _srcBufferNext_T_3 ? _GEN_547 : _GEN_579; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_596 = _srcBufferNext_T_3 ? _GEN_548 : _GEN_580; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_597 = _srcBufferNext_T_3 ? _GEN_549 : _GEN_581; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_614 = 3'h0 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_582; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_615 = 3'h1 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_583; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_616 = 3'h2 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_584; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_617 = 3'h3 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_585; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_618 = 3'h4 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_586; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_619 = 3'h5 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_587; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_620 = 3'h6 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_588; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_621 = 3'h7 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_589; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_622 = 3'h0 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_590; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_623 = 3'h1 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_591; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_624 = 3'h2 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_592; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_625 = 3'h3 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_593; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_626 = 3'h4 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_594; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_627 = 3'h5 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_595; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_628 = 3'h6 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_596; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_629 = 3'h7 == addrInBankSel_5 ? addrKernelPre_5[7:0] : _GEN_597; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_630 = _srcBufferNext_T_3 ? _GEN_614 : _GEN_582; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_631 = _srcBufferNext_T_3 ? _GEN_615 : _GEN_583; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_632 = _srcBufferNext_T_3 ? _GEN_616 : _GEN_584; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_633 = _srcBufferNext_T_3 ? _GEN_617 : _GEN_585; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_634 = _srcBufferNext_T_3 ? _GEN_618 : _GEN_586; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_635 = _srcBufferNext_T_3 ? _GEN_619 : _GEN_587; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_636 = _srcBufferNext_T_3 ? _GEN_620 : _GEN_588; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_637 = _srcBufferNext_T_3 ? _GEN_621 : _GEN_589; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_638 = _srcBufferNext_T_3 ? _GEN_590 : _GEN_622; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_639 = _srcBufferNext_T_3 ? _GEN_591 : _GEN_623; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_640 = _srcBufferNext_T_3 ? _GEN_592 : _GEN_624; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_641 = _srcBufferNext_T_3 ? _GEN_593 : _GEN_625; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_642 = _srcBufferNext_T_3 ? _GEN_594 : _GEN_626; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_643 = _srcBufferNext_T_3 ? _GEN_595 : _GEN_627; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_644 = _srcBufferNext_T_3 ? _GEN_596 : _GEN_628; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_645 = _srcBufferNext_T_3 ? _GEN_597 : _GEN_629; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_662 = 3'h0 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_630; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_663 = 3'h1 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_631; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_664 = 3'h2 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_632; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_665 = 3'h3 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_633; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_666 = 3'h4 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_634; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_667 = 3'h5 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_635; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_668 = 3'h6 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_636; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_669 = 3'h7 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_637; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_670 = 3'h0 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_638; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_671 = 3'h1 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_639; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_672 = 3'h2 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_640; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_673 = 3'h3 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_641; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_674 = 3'h4 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_642; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_675 = 3'h5 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_643; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_676 = 3'h6 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_644; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_677 = 3'h7 == addrInBankSel_6 ? addrKernelPre_6[7:0] : _GEN_645; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_678 = _srcBufferNext_T_3 ? _GEN_662 : _GEN_630; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_679 = _srcBufferNext_T_3 ? _GEN_663 : _GEN_631; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_680 = _srcBufferNext_T_3 ? _GEN_664 : _GEN_632; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_681 = _srcBufferNext_T_3 ? _GEN_665 : _GEN_633; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_682 = _srcBufferNext_T_3 ? _GEN_666 : _GEN_634; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_683 = _srcBufferNext_T_3 ? _GEN_667 : _GEN_635; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_684 = _srcBufferNext_T_3 ? _GEN_668 : _GEN_636; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_685 = _srcBufferNext_T_3 ? _GEN_669 : _GEN_637; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_686 = _srcBufferNext_T_3 ? _GEN_638 : _GEN_670; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_687 = _srcBufferNext_T_3 ? _GEN_639 : _GEN_671; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_688 = _srcBufferNext_T_3 ? _GEN_640 : _GEN_672; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_689 = _srcBufferNext_T_3 ? _GEN_641 : _GEN_673; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_690 = _srcBufferNext_T_3 ? _GEN_642 : _GEN_674; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_691 = _srcBufferNext_T_3 ? _GEN_643 : _GEN_675; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_692 = _srcBufferNext_T_3 ? _GEN_644 : _GEN_676; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_693 = _srcBufferNext_T_3 ? _GEN_645 : _GEN_677; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_710 = 3'h0 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_678; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_711 = 3'h1 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_679; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_712 = 3'h2 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_680; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_713 = 3'h3 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_681; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_714 = 3'h4 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_682; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_715 = 3'h5 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_683; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_716 = 3'h6 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_684; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_717 = 3'h7 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_685; // @[FFTEngine.scala 422:{52,52}]
  wire [7:0] _GEN_718 = 3'h0 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_686; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_719 = 3'h1 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_687; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_720 = 3'h2 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_688; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_721 = 3'h3 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_689; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_722 = 3'h4 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_690; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_723 = 3'h5 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_691; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_724 = 3'h6 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_692; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_725 = 3'h7 == addrInBankSel_7 ? addrKernelPre_7[7:0] : _GEN_693; // @[FFTEngine.scala 424:{52,52}]
  wire [7:0] _GEN_726 = _srcBufferNext_T_3 ? _GEN_710 : _GEN_678; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_727 = _srcBufferNext_T_3 ? _GEN_711 : _GEN_679; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_728 = _srcBufferNext_T_3 ? _GEN_712 : _GEN_680; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_729 = _srcBufferNext_T_3 ? _GEN_713 : _GEN_681; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_730 = _srcBufferNext_T_3 ? _GEN_714 : _GEN_682; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_731 = _srcBufferNext_T_3 ? _GEN_715 : _GEN_683; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_732 = _srcBufferNext_T_3 ? _GEN_716 : _GEN_684; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_733 = _srcBufferNext_T_3 ? _GEN_717 : _GEN_685; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_734 = _srcBufferNext_T_3 ? _GEN_686 : _GEN_718; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_735 = _srcBufferNext_T_3 ? _GEN_687 : _GEN_719; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_736 = _srcBufferNext_T_3 ? _GEN_688 : _GEN_720; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_737 = _srcBufferNext_T_3 ? _GEN_689 : _GEN_721; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_738 = _srcBufferNext_T_3 ? _GEN_690 : _GEN_722; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_739 = _srcBufferNext_T_3 ? _GEN_691 : _GEN_723; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_740 = _srcBufferNext_T_3 ? _GEN_692 : _GEN_724; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_741 = _srcBufferNext_T_3 ? _GEN_693 : _GEN_725; // @[FFTEngine.scala 421:37]
  wire [7:0] _GEN_758 = 3'h0 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_734; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_759 = 3'h1 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_735; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_760 = 3'h2 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_736; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_761 = 3'h3 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_737; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_762 = 3'h4 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_738; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_763 = 3'h5 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_739; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_764 = 3'h6 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_740; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_765 = 3'h7 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_741; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_766 = 3'h0 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_726; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_767 = 3'h1 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_727; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_768 = 3'h2 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_728; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_769 = 3'h3 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_729; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_770 = 3'h4 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_730; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_771 = 3'h5 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_731; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_772 = 3'h6 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_732; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_773 = 3'h7 == addrInBankSel3c_0[2:0] ? addrIn3c_0_r : _GEN_733; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_774 = _srcBufferNext_T_3 ? _GEN_758 : _GEN_734; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_775 = _srcBufferNext_T_3 ? _GEN_759 : _GEN_735; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_776 = _srcBufferNext_T_3 ? _GEN_760 : _GEN_736; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_777 = _srcBufferNext_T_3 ? _GEN_761 : _GEN_737; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_778 = _srcBufferNext_T_3 ? _GEN_762 : _GEN_738; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_779 = _srcBufferNext_T_3 ? _GEN_763 : _GEN_739; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_780 = _srcBufferNext_T_3 ? _GEN_764 : _GEN_740; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_781 = _srcBufferNext_T_3 ? _GEN_765 : _GEN_741; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_782 = _srcBufferNext_T_3 ? _GEN_726 : _GEN_766; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_783 = _srcBufferNext_T_3 ? _GEN_727 : _GEN_767; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_784 = _srcBufferNext_T_3 ? _GEN_728 : _GEN_768; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_785 = _srcBufferNext_T_3 ? _GEN_729 : _GEN_769; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_786 = _srcBufferNext_T_3 ? _GEN_730 : _GEN_770; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_787 = _srcBufferNext_T_3 ? _GEN_731 : _GEN_771; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_788 = _srcBufferNext_T_3 ? _GEN_732 : _GEN_772; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_789 = _srcBufferNext_T_3 ? _GEN_733 : _GEN_773; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_838 = 3'h0 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_774; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_839 = 3'h1 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_775; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_840 = 3'h2 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_776; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_841 = 3'h3 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_777; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_842 = 3'h4 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_778; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_843 = 3'h5 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_779; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_844 = 3'h6 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_780; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_845 = 3'h7 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_781; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_846 = 3'h0 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_782; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_847 = 3'h1 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_783; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_848 = 3'h2 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_784; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_849 = 3'h3 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_785; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_850 = 3'h4 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_786; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_851 = 3'h5 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_787; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_852 = 3'h6 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_788; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_853 = 3'h7 == addrInBankSel3c_1[2:0] ? addrIn3c_1_r : _GEN_789; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_854 = _srcBufferNext_T_3 ? _GEN_838 : _GEN_774; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_855 = _srcBufferNext_T_3 ? _GEN_839 : _GEN_775; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_856 = _srcBufferNext_T_3 ? _GEN_840 : _GEN_776; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_857 = _srcBufferNext_T_3 ? _GEN_841 : _GEN_777; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_858 = _srcBufferNext_T_3 ? _GEN_842 : _GEN_778; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_859 = _srcBufferNext_T_3 ? _GEN_843 : _GEN_779; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_860 = _srcBufferNext_T_3 ? _GEN_844 : _GEN_780; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_861 = _srcBufferNext_T_3 ? _GEN_845 : _GEN_781; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_862 = _srcBufferNext_T_3 ? _GEN_782 : _GEN_846; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_863 = _srcBufferNext_T_3 ? _GEN_783 : _GEN_847; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_864 = _srcBufferNext_T_3 ? _GEN_784 : _GEN_848; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_865 = _srcBufferNext_T_3 ? _GEN_785 : _GEN_849; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_866 = _srcBufferNext_T_3 ? _GEN_786 : _GEN_850; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_867 = _srcBufferNext_T_3 ? _GEN_787 : _GEN_851; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_868 = _srcBufferNext_T_3 ? _GEN_788 : _GEN_852; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_869 = _srcBufferNext_T_3 ? _GEN_789 : _GEN_853; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_918 = 3'h0 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_854; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_919 = 3'h1 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_855; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_920 = 3'h2 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_856; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_921 = 3'h3 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_857; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_922 = 3'h4 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_858; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_923 = 3'h5 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_859; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_924 = 3'h6 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_860; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_925 = 3'h7 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_861; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_926 = 3'h0 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_862; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_927 = 3'h1 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_863; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_928 = 3'h2 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_864; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_929 = 3'h3 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_865; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_930 = 3'h4 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_866; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_931 = 3'h5 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_867; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_932 = 3'h6 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_868; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_933 = 3'h7 == addrInBankSel3c_2[2:0] ? addrIn3c_2_r : _GEN_869; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_934 = _srcBufferNext_T_3 ? _GEN_918 : _GEN_854; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_935 = _srcBufferNext_T_3 ? _GEN_919 : _GEN_855; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_936 = _srcBufferNext_T_3 ? _GEN_920 : _GEN_856; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_937 = _srcBufferNext_T_3 ? _GEN_921 : _GEN_857; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_938 = _srcBufferNext_T_3 ? _GEN_922 : _GEN_858; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_939 = _srcBufferNext_T_3 ? _GEN_923 : _GEN_859; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_940 = _srcBufferNext_T_3 ? _GEN_924 : _GEN_860; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_941 = _srcBufferNext_T_3 ? _GEN_925 : _GEN_861; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_942 = _srcBufferNext_T_3 ? _GEN_862 : _GEN_926; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_943 = _srcBufferNext_T_3 ? _GEN_863 : _GEN_927; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_944 = _srcBufferNext_T_3 ? _GEN_864 : _GEN_928; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_945 = _srcBufferNext_T_3 ? _GEN_865 : _GEN_929; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_946 = _srcBufferNext_T_3 ? _GEN_866 : _GEN_930; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_947 = _srcBufferNext_T_3 ? _GEN_867 : _GEN_931; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_948 = _srcBufferNext_T_3 ? _GEN_868 : _GEN_932; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_949 = _srcBufferNext_T_3 ? _GEN_869 : _GEN_933; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_966 = 3'h0 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_934; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_967 = 3'h1 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_935; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_968 = 3'h2 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_936; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_969 = 3'h3 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_937; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_970 = 3'h4 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_938; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_971 = 3'h5 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_939; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_972 = 3'h6 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_940; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_973 = 3'h7 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_941; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_974 = 3'h0 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_942; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_975 = 3'h1 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_943; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_976 = 3'h2 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_944; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_977 = 3'h3 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_945; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_978 = 3'h4 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_946; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_979 = 3'h5 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_947; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_980 = 3'h6 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_948; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_981 = 3'h7 == addrInBankSel3c_3[2:0] ? addrIn3c_3_r : _GEN_949; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_982 = _srcBufferNext_T_3 ? _GEN_966 : _GEN_934; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_983 = _srcBufferNext_T_3 ? _GEN_967 : _GEN_935; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_984 = _srcBufferNext_T_3 ? _GEN_968 : _GEN_936; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_985 = _srcBufferNext_T_3 ? _GEN_969 : _GEN_937; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_986 = _srcBufferNext_T_3 ? _GEN_970 : _GEN_938; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_987 = _srcBufferNext_T_3 ? _GEN_971 : _GEN_939; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_988 = _srcBufferNext_T_3 ? _GEN_972 : _GEN_940; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_989 = _srcBufferNext_T_3 ? _GEN_973 : _GEN_941; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_990 = _srcBufferNext_T_3 ? _GEN_942 : _GEN_974; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_991 = _srcBufferNext_T_3 ? _GEN_943 : _GEN_975; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_992 = _srcBufferNext_T_3 ? _GEN_944 : _GEN_976; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_993 = _srcBufferNext_T_3 ? _GEN_945 : _GEN_977; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_994 = _srcBufferNext_T_3 ? _GEN_946 : _GEN_978; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_995 = _srcBufferNext_T_3 ? _GEN_947 : _GEN_979; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_996 = _srcBufferNext_T_3 ? _GEN_948 : _GEN_980; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_997 = _srcBufferNext_T_3 ? _GEN_949 : _GEN_981; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1014 = 3'h0 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_982; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1015 = 3'h1 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_983; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1016 = 3'h2 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_984; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1017 = 3'h3 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_985; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1018 = 3'h4 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_986; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1019 = 3'h5 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_987; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1020 = 3'h6 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_988; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1021 = 3'h7 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_989; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1022 = 3'h0 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_990; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1023 = 3'h1 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_991; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1024 = 3'h2 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_992; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1025 = 3'h3 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_993; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1026 = 3'h4 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_994; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1027 = 3'h5 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_995; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1028 = 3'h6 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_996; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1029 = 3'h7 == addrInBankSel3c_4[2:0] ? addrIn3c_4_r : _GEN_997; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1030 = _srcBufferNext_T_3 ? _GEN_1014 : _GEN_982; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1031 = _srcBufferNext_T_3 ? _GEN_1015 : _GEN_983; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1032 = _srcBufferNext_T_3 ? _GEN_1016 : _GEN_984; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1033 = _srcBufferNext_T_3 ? _GEN_1017 : _GEN_985; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1034 = _srcBufferNext_T_3 ? _GEN_1018 : _GEN_986; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1035 = _srcBufferNext_T_3 ? _GEN_1019 : _GEN_987; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1036 = _srcBufferNext_T_3 ? _GEN_1020 : _GEN_988; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1037 = _srcBufferNext_T_3 ? _GEN_1021 : _GEN_989; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1038 = _srcBufferNext_T_3 ? _GEN_990 : _GEN_1022; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1039 = _srcBufferNext_T_3 ? _GEN_991 : _GEN_1023; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1040 = _srcBufferNext_T_3 ? _GEN_992 : _GEN_1024; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1041 = _srcBufferNext_T_3 ? _GEN_993 : _GEN_1025; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1042 = _srcBufferNext_T_3 ? _GEN_994 : _GEN_1026; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1043 = _srcBufferNext_T_3 ? _GEN_995 : _GEN_1027; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1044 = _srcBufferNext_T_3 ? _GEN_996 : _GEN_1028; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1045 = _srcBufferNext_T_3 ? _GEN_997 : _GEN_1029; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1062 = 3'h0 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1030; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1063 = 3'h1 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1031; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1064 = 3'h2 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1032; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1065 = 3'h3 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1033; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1066 = 3'h4 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1034; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1067 = 3'h5 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1035; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1068 = 3'h6 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1036; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1069 = 3'h7 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1037; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1070 = 3'h0 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1038; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1071 = 3'h1 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1039; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1072 = 3'h2 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1040; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1073 = 3'h3 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1041; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1074 = 3'h4 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1042; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1075 = 3'h5 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1043; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1076 = 3'h6 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1044; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1077 = 3'h7 == addrInBankSel3c_5[2:0] ? addrIn3c_5_r : _GEN_1045; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1078 = _srcBufferNext_T_3 ? _GEN_1062 : _GEN_1030; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1079 = _srcBufferNext_T_3 ? _GEN_1063 : _GEN_1031; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1080 = _srcBufferNext_T_3 ? _GEN_1064 : _GEN_1032; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1081 = _srcBufferNext_T_3 ? _GEN_1065 : _GEN_1033; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1082 = _srcBufferNext_T_3 ? _GEN_1066 : _GEN_1034; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1083 = _srcBufferNext_T_3 ? _GEN_1067 : _GEN_1035; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1084 = _srcBufferNext_T_3 ? _GEN_1068 : _GEN_1036; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1085 = _srcBufferNext_T_3 ? _GEN_1069 : _GEN_1037; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1086 = _srcBufferNext_T_3 ? _GEN_1038 : _GEN_1070; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1087 = _srcBufferNext_T_3 ? _GEN_1039 : _GEN_1071; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1088 = _srcBufferNext_T_3 ? _GEN_1040 : _GEN_1072; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1089 = _srcBufferNext_T_3 ? _GEN_1041 : _GEN_1073; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1090 = _srcBufferNext_T_3 ? _GEN_1042 : _GEN_1074; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1091 = _srcBufferNext_T_3 ? _GEN_1043 : _GEN_1075; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1092 = _srcBufferNext_T_3 ? _GEN_1044 : _GEN_1076; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1093 = _srcBufferNext_T_3 ? _GEN_1045 : _GEN_1077; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1110 = 3'h0 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1078; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1111 = 3'h1 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1079; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1112 = 3'h2 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1080; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1113 = 3'h3 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1081; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1114 = 3'h4 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1082; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1115 = 3'h5 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1083; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1116 = 3'h6 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1084; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1117 = 3'h7 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1085; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1118 = 3'h0 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1086; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1119 = 3'h1 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1087; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1120 = 3'h2 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1088; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1121 = 3'h3 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1089; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1122 = 3'h4 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1090; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1123 = 3'h5 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1091; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1124 = 3'h6 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1092; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1125 = 3'h7 == addrInBankSel3c_6[2:0] ? addrIn3c_6_r : _GEN_1093; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1126 = _srcBufferNext_T_3 ? _GEN_1110 : _GEN_1078; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1127 = _srcBufferNext_T_3 ? _GEN_1111 : _GEN_1079; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1128 = _srcBufferNext_T_3 ? _GEN_1112 : _GEN_1080; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1129 = _srcBufferNext_T_3 ? _GEN_1113 : _GEN_1081; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1130 = _srcBufferNext_T_3 ? _GEN_1114 : _GEN_1082; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1131 = _srcBufferNext_T_3 ? _GEN_1115 : _GEN_1083; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1132 = _srcBufferNext_T_3 ? _GEN_1116 : _GEN_1084; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1133 = _srcBufferNext_T_3 ? _GEN_1117 : _GEN_1085; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1134 = _srcBufferNext_T_3 ? _GEN_1086 : _GEN_1118; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1135 = _srcBufferNext_T_3 ? _GEN_1087 : _GEN_1119; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1136 = _srcBufferNext_T_3 ? _GEN_1088 : _GEN_1120; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1137 = _srcBufferNext_T_3 ? _GEN_1089 : _GEN_1121; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1138 = _srcBufferNext_T_3 ? _GEN_1090 : _GEN_1122; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1139 = _srcBufferNext_T_3 ? _GEN_1091 : _GEN_1123; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1140 = _srcBufferNext_T_3 ? _GEN_1092 : _GEN_1124; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1141 = _srcBufferNext_T_3 ? _GEN_1093 : _GEN_1125; // @[FFTEngine.scala 439:37]
  wire [7:0] _GEN_1158 = 3'h0 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1126; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1159 = 3'h1 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1127; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1160 = 3'h2 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1128; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1161 = 3'h3 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1129; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1162 = 3'h4 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1130; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1163 = 3'h5 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1131; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1164 = 3'h6 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1132; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1165 = 3'h7 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1133; // @[FFTEngine.scala 440:{54,54}]
  wire [7:0] _GEN_1166 = 3'h0 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1134; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1167 = 3'h1 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1135; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1168 = 3'h2 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1136; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1169 = 3'h3 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1137; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1170 = 3'h4 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1138; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1171 = 3'h5 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1139; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1172 = 3'h6 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1140; // @[FFTEngine.scala 442:{54,54}]
  wire [7:0] _GEN_1173 = 3'h7 == addrInBankSel3c_7[2:0] ? addrIn3c_7_r : _GEN_1141; // @[FFTEngine.scala 442:{54,54}]
  wire [15:0] writeDataPre3c_0_re = fftCalc_io_dataOut3c_0_re; // @[FFTEngine.scala 387:30 388:23]
  wire [14:0] _writeData3c_0_re_T = writeDataPre3c_0_re[15:1]; // @[FFTEngine.scala 463:55]
  wire [14:0] _writeData3c_0_im_T = writeDataPre3c_1_re[15:1]; // @[FFTEngine.scala 464:55]
  wire [15:0] _GEN_1206 = ~io_fftMode & _phaseInit_T_6 ? $signed({{1{_writeData3c_0_re_T[14]}},_writeData3c_0_re_T}) :
    $signed(writeDataPre3c_0_re); // @[FFTEngine.scala 462:51 463:31 467:28]
  wire [15:0] writeDataPre3c_0_im = fftCalc_io_dataOut3c_0_im; // @[FFTEngine.scala 387:30 388:23]
  wire [15:0] _GEN_1207 = ~io_fftMode & _phaseInit_T_6 ? $signed({{1{_writeData3c_0_im_T[14]}},_writeData3c_0_im_T}) :
    $signed(writeDataPre3c_0_im); // @[FFTEngine.scala 462:51 464:31 467:28]
  wire [15:0] _GEN_1211 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeDataPre3c_1_re) : $signed(_GEN_1207); // @[FFTEngine.scala 458:43 460:31]
  wire [15:0] writeData3c_0_im = sameAddr3c ? $signed(_GEN_1211) : $signed(writeDataPre3c_0_im); // @[FFTEngine.scala 457:22 471:24]
  wire [15:0] _GEN_1208 = ~io_fftMode & _phaseInit_T_6 ? $signed(writeData3c_0_im) : $signed(writeDataPre3c_1_im); // @[FFTEngine.scala 462:51 465:28 468:28]
  wire [15:0] _GEN_1210 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeDataPre3c_0_re) : $signed(_GEN_1206); // @[FFTEngine.scala 458:43 459:31]
  wire [15:0] writeData3c_0_re = sameAddr3c ? $signed(_GEN_1210) : $signed(writeDataPre3c_0_re); // @[FFTEngine.scala 457:22 471:24]
  wire [15:0] _GEN_1209 = ~io_fftMode & _phaseInit_T_6 ? $signed(writeData3c_0_re) : $signed(writeDataPre3c_1_re); // @[FFTEngine.scala 462:51 465:28 468:28]
  wire [15:0] _GEN_1212 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeData3c_0_im) : $signed(_GEN_1208); // @[FFTEngine.scala 458:43 461:28]
  wire [15:0] _GEN_1213 = io_fftMode & _addrInBankSel_0_T_1 ? $signed(writeData3c_0_re) : $signed(_GEN_1209); // @[FFTEngine.scala 458:43 461:28]
  wire [15:0] _writeData3c_1_im_T_2 = 16'sh0 - $signed(writeDataPre3c_1_im); // @[FFTEngine.scala 474:34]
  wire [15:0] _GEN_1215 = _addrInBankSel3c_0_T_1 & addrInBankSel3c_1 == 4'h4 & addrIn3c_1_r == 8'h1 ? $signed(
    _writeData3c_1_im_T_2) : $signed(writeDataPre3c_1_im); // @[FFTEngine.scala 472:121 474:31 477:31]
  wire [15:0] _io_writeDataSram0Bank_0_T = sameAddr3c ? $signed(_GEN_1210) : $signed(writeDataPre3c_0_re); // @[FFTEngine.scala 488:60]
  wire [15:0] _io_writeDataSram0Bank_0_T_1 = sameAddr3c ? $signed(_GEN_1211) : $signed(writeDataPre3c_0_im); // @[FFTEngine.scala 488:60]
  wire [31:0] _io_writeDataSram0Bank_0_T_2 = {_io_writeDataSram0Bank_0_T_1,_io_writeDataSram0Bank_0_T}; // @[FFTEngine.scala 488:60]
  wire  _T_176 = 4'h0 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_3 = sameAddr3c ? $signed(_GEN_1213) : $signed(writeDataPre3c_1_re); // @[FFTEngine.scala 491:60]
  wire [15:0] _io_writeDataSram0Bank_0_T_4 = sameAddr3c ? $signed(_GEN_1212) : $signed(_GEN_1215); // @[FFTEngine.scala 491:60]
  wire [31:0] _io_writeDataSram0Bank_0_T_5 = {_io_writeDataSram0Bank_0_T_4,_io_writeDataSram0Bank_0_T_3}; // @[FFTEngine.scala 491:60]
  wire [31:0] _GEN_1226 = _T_176 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_14 = {fftCalc_io_dataOut3c_2_im,fftCalc_io_dataOut3c_2_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1228 = 4'h0 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1226; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_17 = {fftCalc_io_dataOut3c_3_im,fftCalc_io_dataOut3c_3_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1230 = 4'h0 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1228; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_20 = {fftCalc_io_dataOut3c_4_im,fftCalc_io_dataOut3c_4_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1232 = 4'h0 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1230; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_23 = {fftCalc_io_dataOut3c_5_im,fftCalc_io_dataOut3c_5_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1234 = 4'h0 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1232; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_26 = {fftCalc_io_dataOut3c_6_im,fftCalc_io_dataOut3c_6_re}; // @[FFTEngine.scala 497:64]
  wire [31:0] _GEN_1236 = 4'h0 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1234; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _io_writeDataSram0Bank_0_T_29 = {fftCalc_io_dataOut3c_7_im,fftCalc_io_dataOut3c_7_re}; // @[FFTEngine.scala 497:64]
  wire  _T_186 = 4'h1 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1248 = _T_186 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1250 = 4'h1 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1248; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1252 = 4'h1 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1250; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1254 = 4'h1 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1252; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1256 = 4'h1 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1254; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1258 = 4'h1 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1256; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_196 = 4'h2 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1270 = _T_196 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1272 = 4'h2 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1270; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1274 = 4'h2 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1272; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1276 = 4'h2 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1274; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1278 = 4'h2 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1276; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1280 = 4'h2 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1278; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_206 = 4'h3 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1292 = _T_206 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1294 = 4'h3 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1292; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1296 = 4'h3 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1294; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1298 = 4'h3 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1296; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1300 = 4'h3 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1298; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1302 = 4'h3 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1300; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_216 = 4'h4 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1314 = _T_216 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1316 = 4'h4 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1314; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1318 = 4'h4 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1316; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1320 = 4'h4 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1318; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1322 = 4'h4 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1320; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1324 = 4'h4 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1322; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_226 = 4'h5 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1336 = _T_226 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1338 = 4'h5 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1336; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1340 = 4'h5 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1338; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1342 = 4'h5 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1340; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1344 = 4'h5 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1342; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1346 = 4'h5 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1344; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_236 = 4'h6 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1358 = _T_236 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1360 = 4'h6 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1358; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1362 = 4'h6 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1360; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1364 = 4'h6 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1362; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1366 = 4'h6 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1364; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1368 = 4'h6 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1366; // @[FFTEngine.scala 496:50 497:46]
  wire  _T_246 = 4'h7 == addrInBankSel3c_1; // @[FFTEngine.scala 490:29]
  wire [31:0] _GEN_1380 = _T_246 ? _io_writeDataSram0Bank_0_T_5 : _io_writeDataSram0Bank_0_T_2; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1382 = 4'h7 == addrInBankSel3c_2 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1380; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1384 = 4'h7 == addrInBankSel3c_3 ? _io_writeDataSram0Bank_0_T_17 : _GEN_1382; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1386 = 4'h7 == addrInBankSel3c_4 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1384; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1388 = 4'h7 == addrInBankSel3c_5 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1386; // @[FFTEngine.scala 496:50 497:46]
  wire [31:0] _GEN_1390 = 4'h7 == addrInBankSel3c_6 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1388; // @[FFTEngine.scala 496:50 497:46]
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
  assign io_writeDataSram0Bank_0 = 4'h0 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1236; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_1 = 4'h1 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1258; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_2 = 4'h2 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1280; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_3 = 4'h3 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1302; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_4 = 4'h4 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1324; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_5 = 4'h5 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1346; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_6 = 4'h6 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1368; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram0Bank_7 = 4'h7 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1390; // @[FFTEngine.scala 496:50 497:46]
  assign io_writeDataSram1Bank_0 = 4'h0 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1236; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_1 = 4'h1 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1258; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_2 = 4'h2 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1280; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_3 = 4'h3 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1302; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_4 = 4'h4 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1324; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_5 = 4'h5 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1346; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_6 = 4'h6 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1368; // @[FFTEngine.scala 496:50 498:46]
  assign io_writeDataSram1Bank_7 = 4'h7 == addrInBankSel3c_7 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1390; // @[FFTEngine.scala 496:50 498:46]
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
  assign io_addrSram0Bank_0 = _srcBufferNext_T_3 ? _GEN_1134 : _GEN_1166; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_1 = _srcBufferNext_T_3 ? _GEN_1135 : _GEN_1167; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_2 = _srcBufferNext_T_3 ? _GEN_1136 : _GEN_1168; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_3 = _srcBufferNext_T_3 ? _GEN_1137 : _GEN_1169; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_4 = _srcBufferNext_T_3 ? _GEN_1138 : _GEN_1170; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_5 = _srcBufferNext_T_3 ? _GEN_1139 : _GEN_1171; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_6 = _srcBufferNext_T_3 ? _GEN_1140 : _GEN_1172; // @[FFTEngine.scala 439:37]
  assign io_addrSram0Bank_7 = _srcBufferNext_T_3 ? _GEN_1141 : _GEN_1173; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_0 = _srcBufferNext_T_3 ? _GEN_1158 : _GEN_1126; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_1 = _srcBufferNext_T_3 ? _GEN_1159 : _GEN_1127; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_2 = _srcBufferNext_T_3 ? _GEN_1160 : _GEN_1128; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_3 = _srcBufferNext_T_3 ? _GEN_1161 : _GEN_1129; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_4 = _srcBufferNext_T_3 ? _GEN_1162 : _GEN_1130; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_5 = _srcBufferNext_T_3 ? _GEN_1163 : _GEN_1131; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_6 = _srcBufferNext_T_3 ? _GEN_1164 : _GEN_1132; // @[FFTEngine.scala 439:37]
  assign io_addrSram1Bank_7 = _srcBufferNext_T_3 ? _GEN_1165 : _GEN_1133; // @[FFTEngine.scala 439:37]
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
  assign fftCalc_io_radixCount = _fftCalc_io_radixCount_T_2[9:0]; // @[FFTEngine.scala 370:27]
  assign fftCalc_io_calcMode = (_radixInit_T_1 | kernelState1c | kernelState2c | kernelState3c) & _T_6 ? 2'h2 : 2'h3; // @[FFTEngine.scala 374:103 375:29]
  assign fftCalc_io_phaseCount = phaseCount; // @[FFTEngine.scala 383:27]
  assign fftCalc_io_rShiftSym = kernelState1c ? _GEN_266 : phaseCount[0]; // @[FFTEngine.scala 371:32]
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
      if (addrSProc == 11'hff) begin // @[FFTEngine.scala 117:50]
        stateReg <= 3'h2; // @[FFTEngine.scala 118:30]
      end
    end else if (3'h2 == stateReg) begin // @[FFTEngine.scala 108:26]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_5;
    end
    if (reset) begin // @[FFTEngine.scala 48:29]
      addrSProc <= 11'h0; // @[FFTEngine.scala 48:29]
    end else if (radixInit) begin // @[FFTEngine.scala 158:21]
      addrSProc <= 11'h0; // @[FFTEngine.scala 159:20]
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
      addrIn1c_0_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_0_r <= addrKernelPre_0[7:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_0_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_0_r <= addrIn1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_0_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_0_r <= addrIn2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_1_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_1_r <= addrKernelPre_1[7:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_1_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_1_r <= addrIn1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_1_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_1_r <= addrIn2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_2_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_2_r <= addrKernelPre_2[7:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_2_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_2_r <= addrIn1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_2_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_2_r <= addrIn2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_3_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_3_r <= addrKernelPre_3[7:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_3_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_3_r <= addrIn1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_3_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_3_r <= addrIn2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_4_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_4_r <= addrKernelPre_4[7:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_4_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_4_r <= addrIn1c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_4_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_4_r <= addrIn2c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_5_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_5_r <= addrKernelPre_5[7:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_5_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_5_r <= addrIn1c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_5_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_5_r <= addrIn2c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_6_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_6_r <= addrKernelPre_6[7:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_6_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_6_r <= addrIn1c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_6_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn3c_6_r <= addrIn2c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn1c_7_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn1c_7_r <= addrKernelPre_7[7:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn2c_7_r <= 8'h0; // @[Reg.scala 35:20]
    end else begin
      addrIn2c_7_r <= addrIn1c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrIn3c_7_r <= 8'h0; // @[Reg.scala 35:20]
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
  addrSProc = _RAND_1[10:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  srcBuffer = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrIn1c_0_r = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  addrIn2c_0_r = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  addrIn3c_0_r = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  addrIn1c_1_r = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  addrIn2c_1_r = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  addrIn3c_1_r = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  addrIn1c_2_r = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  addrIn2c_2_r = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  addrIn3c_2_r = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  addrIn1c_3_r = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  addrIn2c_3_r = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  addrIn3c_3_r = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  addrIn1c_4_r = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  addrIn2c_4_r = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  addrIn3c_4_r = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  addrIn1c_5_r = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  addrIn2c_5_r = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  addrIn3c_5_r = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  addrIn1c_6_r = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  addrIn2c_6_r = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  addrIn3c_6_r = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  addrIn1c_7_r = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  addrIn2c_7_r = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  addrIn3c_7_r = _RAND_27[7:0];
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
