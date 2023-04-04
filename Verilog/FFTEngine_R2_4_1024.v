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
module FFT3PipelineCalc(
  input         clock,
  input         reset,
  input  [15:0] io_dataInSR,
  input  [15:0] io_dataInSI,
  input  [15:0] io_dataInTR,
  input  [15:0] io_dataInTI,
  output [15:0] io_dataOutSR3c,
  output [15:0] io_dataOutSI3c,
  output [15:0] io_dataOutTR3c,
  output [15:0] io_dataOutTI3c,
  input  [9:0]  io_nk,
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
`endif // RANDOMIZE_REG_INIT
  wire [10:0] fftTwiddle_io_nk; // @[FFT3PipelineCalc.scala 45:28]
  wire [1:0] fftTwiddle_io_twiLutCaseIndex; // @[FFT3PipelineCalc.scala 45:28]
  wire [13:0] fftTwiddle_io_wR; // @[FFT3PipelineCalc.scala 45:28]
  wire [13:0] fftTwiddle_io_wI; // @[FFT3PipelineCalc.scala 45:28]
  wire [15:0] _dataInSRRnd_T_2 = {io_dataInSR[15],io_dataInSR[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSRRnd_T_5 = {15'h0,io_dataInSR[0]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSIRnd_T_2 = {io_dataInSI[15],io_dataInSI[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSIRnd_T_5 = {15'h0,io_dataInSI[0]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTRRnd_T_2 = {io_dataInTR[15],io_dataInTR[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTRRnd_T_5 = {15'h0,io_dataInTR[0]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTIRnd_T_2 = {io_dataInTI[15],io_dataInTI[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTIRnd_T_5 = {15'h0,io_dataInTI[0]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSR1c_T = _dataInSRRnd_T_2 + _dataInSRRnd_T_5; // @[FFT3PipelineCalc.scala 34:64]
  wire [15:0] _dataInSI1c_T = _dataInSIRnd_T_2 + _dataInSIRnd_T_5; // @[FFT3PipelineCalc.scala 35:64]
  wire [15:0] _dataInTR1c_T = _dataInTRRnd_T_2 + _dataInTRRnd_T_5; // @[FFT3PipelineCalc.scala 36:64]
  wire [15:0] _dataInTI1c_T = _dataInTIRnd_T_2 + _dataInTIRnd_T_5; // @[FFT3PipelineCalc.scala 37:64]
  reg [9:0] nk1c; // @[Reg.scala 35:20]
  reg [15:0] sR2c; // @[Reg.scala 35:20]
  reg [15:0] sI2c; // @[Reg.scala 35:20]
  reg [15:0] qR2cProc; // @[Reg.scala 35:20]
  reg [15:0] tI2c; // @[Reg.scala 35:20]
  reg [13:0] wR2c; // @[Reg.scala 35:20]
  reg [13:0] wI2c; // @[Reg.scala 35:20]
  wire [15:0] addTRI = $signed(qR2cProc) + $signed(tI2c); // @[FFT3PipelineCalc.scala 58:23]
  wire [13:0] addWRI = $signed(wR2c) + $signed(wI2c); // @[FFT3PipelineCalc.scala 59:23]
  wire [29:0] multS = $signed(addTRI) * $signed(addWRI); // @[FFT3PipelineCalc.scala 60:24]
  wire [29:0] multR = $signed(qR2cProc) * $signed(wR2c); // @[FFT3PipelineCalc.scala 62:25]
  wire [29:0] multI = $signed(tI2c) * $signed(wI2c); // @[FFT3PipelineCalc.scala 65:25]
  wire [29:0] qR2cKernel = $signed(multR) - $signed(multI); // @[FFT3PipelineCalc.scala 68:28]
  wire [29:0] _qI2cKernel_T_2 = $signed(multS) - $signed(multR); // @[FFT3PipelineCalc.scala 69:28]
  wire [29:0] qI2cKernel = $signed(_qI2cKernel_T_2) - $signed(multI); // @[FFT3PipelineCalc.scala 69:36]
  wire [15:0] qI2cProc = 16'sh0 - $signed(tI2c); // @[FFT3PipelineCalc.scala 72:20]
  wire [27:0] _GEN_11 = {$signed(qR2cProc), 12'h0}; // @[FFT3PipelineCalc.scala 74:19]
  wire [29:0] qR2c = io_procMode ? $signed({{2{_GEN_11[27]}},_GEN_11}) : $signed(qR2cKernel); // @[FFT3PipelineCalc.scala 74:19]
  wire [27:0] _GEN_12 = {$signed(qI2cProc), 12'h0}; // @[FFT3PipelineCalc.scala 75:19]
  wire [29:0] qI2c = io_procMode ? $signed({{2{_GEN_12[27]}},_GEN_12}) : $signed(qI2cKernel); // @[FFT3PipelineCalc.scala 75:19]
  reg [15:0] sR3c; // @[Reg.scala 35:20]
  reg [15:0] sI3c; // @[Reg.scala 35:20]
  reg [29:0] qR3c; // @[Reg.scala 35:20]
  wire [41:0] _GEN_9 = io_state2c ? $signed({{12{qR2c[29]}},qR2c}) : $signed({$signed(qR3c), 12'h0}); // @[Reg.scala 36:18 35:20 36:22]
  reg [29:0] qI3c; // @[Reg.scala 35:20]
  wire [41:0] _GEN_10 = io_state2c ? $signed({{12{qI2c[29]}},qI2c}) : $signed({$signed(qI3c), 12'h0}); // @[Reg.scala 36:18 35:20 36:22]
  wire [29:0] _GEN_13 = {{14{sR3c[15]}},sR3c}; // @[FFT3PipelineCalc.scala 83:27]
  wire [29:0] xR3cPrePre = $signed(_GEN_13) + $signed(qR3c); // @[FFT3PipelineCalc.scala 83:27]
  wire [29:0] _GEN_14 = {{14{sI3c[15]}},sI3c}; // @[FFT3PipelineCalc.scala 84:27]
  wire [29:0] xI3cPrePre = $signed(_GEN_14) + $signed(qI3c); // @[FFT3PipelineCalc.scala 84:27]
  wire [14:0] _xR3cPre_T_10 = xR3cPrePre[29] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xR3cPre_T_11 = ~_xR3cPre_T_10; // @[FFT3PipelineCalc.scala 86:188]
  wire [15:0] _xR3cPre_T_13 = {xR3cPrePre[29],_xR3cPre_T_11}; // @[FFT3PipelineCalc.scala 86:262]
  wire [29:0] xR3cPre = sR3c[15] == qR3c[29] & sR3c[15] != xR3cPrePre[29] ? $signed({{14{_xR3cPre_T_13[15]}},
    _xR3cPre_T_13}) : $signed(xR3cPrePre); // @[FFT3PipelineCalc.scala 86:22]
  wire [14:0] _xI3cPre_T_10 = xI3cPrePre[29] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xI3cPre_T_11 = ~_xI3cPre_T_10; // @[FFT3PipelineCalc.scala 87:188]
  wire [15:0] _xI3cPre_T_13 = {xI3cPrePre[29],_xI3cPre_T_11}; // @[FFT3PipelineCalc.scala 87:262]
  wire [29:0] xI3cPre = sI3c[15] == qI3c[29] & sI3c[15] != xI3cPrePre[29] ? $signed({{14{_xI3cPre_T_13[15]}},
    _xI3cPre_T_13}) : $signed(xI3cPrePre); // @[FFT3PipelineCalc.scala 87:22]
  wire [29:0] yR3cPrePre = $signed(_GEN_13) - $signed(qR3c); // @[FFT3PipelineCalc.scala 92:27]
  wire [29:0] yI3cPrePre = $signed(_GEN_14) - $signed(qI3c); // @[FFT3PipelineCalc.scala 93:27]
  wire [14:0] _yR3cPre_T_10 = yR3cPrePre[29] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yR3cPre_T_11 = ~_yR3cPre_T_10; // @[FFT3PipelineCalc.scala 95:188]
  wire [15:0] _yR3cPre_T_13 = {yR3cPrePre[29],_yR3cPre_T_11}; // @[FFT3PipelineCalc.scala 95:262]
  wire [29:0] yR3cPre = sR3c[15] != qR3c[29] & sR3c[15] != yR3cPrePre[29] ? $signed({{14{_yR3cPre_T_13[15]}},
    _yR3cPre_T_13}) : $signed(yR3cPrePre); // @[FFT3PipelineCalc.scala 95:22]
  wire [14:0] _yI3cPre_T_10 = yI3cPrePre[29] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yI3cPre_T_11 = ~_yI3cPre_T_10; // @[FFT3PipelineCalc.scala 96:188]
  wire [15:0] _yI3cPre_T_13 = {yI3cPrePre[29],_yI3cPre_T_11}; // @[FFT3PipelineCalc.scala 96:262]
  wire [29:0] yI3cPre = sI3c[15] != qI3c[29] & sI3c[15] != yI3cPrePre[29] ? $signed({{14{_yI3cPre_T_13[15]}},
    _yI3cPre_T_13}) : $signed(yI3cPrePre); // @[FFT3PipelineCalc.scala 96:22]
  FFTTwiddle fftTwiddle ( // @[FFT3PipelineCalc.scala 45:28]
    .io_nk(fftTwiddle_io_nk),
    .io_twiLutCaseIndex(fftTwiddle_io_twiLutCaseIndex),
    .io_wR(fftTwiddle_io_wR),
    .io_wI(fftTwiddle_io_wI)
  );
  assign io_dataOutSR3c = xR3cPre[15:0]; // @[FFT3PipelineCalc.scala 89:64]
  assign io_dataOutSI3c = xI3cPre[15:0]; // @[FFT3PipelineCalc.scala 90:64]
  assign io_dataOutTR3c = yR3cPre[15:0]; // @[FFT3PipelineCalc.scala 98:64]
  assign io_dataOutTI3c = yI3cPre[15:0]; // @[FFT3PipelineCalc.scala 99:64]
  assign fftTwiddle_io_nk = {{1'd0}, nk1c}; // @[FFT3PipelineCalc.scala 46:22]
  assign fftTwiddle_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineCalc.scala 43:30]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      nk1c <= 10'h0; // @[Reg.scala 35:20]
    end else begin
      nk1c <= io_nk;
    end
    if (reset) begin // @[Reg.scala 35:20]
      sR2c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 34:25]
        sR2c <= _dataInSR1c_T;
      end else begin
        sR2c <= io_dataInSR;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      sI2c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 35:25]
        sI2c <= _dataInSI1c_T;
      end else begin
        sI2c <= io_dataInSI;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      qR2cProc <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 36:25]
        qR2cProc <= _dataInTR1c_T;
      end else begin
        qR2cProc <= io_dataInTR;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      tI2c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 37:25]
        tI2c <= _dataInTI1c_T;
      end else begin
        tI2c <= io_dataInTI;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c <= fftTwiddle_io_wR; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c <= fftTwiddle_io_wI; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      sR3c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      sR3c <= sR2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      sI3c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      sI3c <= sI2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      qR3c <= 30'sh0; // @[Reg.scala 35:20]
    end else begin
      qR3c <= _GEN_9[41:12];
    end
    if (reset) begin // @[Reg.scala 35:20]
      qI3c <= 30'sh0; // @[Reg.scala 35:20]
    end else begin
      qI3c <= _GEN_10[41:12];
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
  nk1c = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  sR2c = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  sI2c = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  qR2cProc = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  tI2c = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  wR2c = _RAND_5[13:0];
  _RAND_6 = {1{`RANDOM}};
  wI2c = _RAND_6[13:0];
  _RAND_7 = {1{`RANDOM}};
  sR3c = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  sI3c = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  qR3c = _RAND_9[29:0];
  _RAND_10 = {1{`RANDOM}};
  qI3c = _RAND_10[29:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFTTwiddle_1(
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
module FFT3PipelineCalc_1(
  input         clock,
  input         reset,
  input  [15:0] io_dataInSR,
  input  [15:0] io_dataInSI,
  input  [15:0] io_dataInTR,
  input  [15:0] io_dataInTI,
  output [15:0] io_dataOutSR3c,
  output [15:0] io_dataOutSI3c,
  output [15:0] io_dataOutTR3c,
  output [15:0] io_dataOutTI3c,
  input  [8:0]  io_nk,
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
`endif // RANDOMIZE_REG_INIT
  wire [9:0] fftTwiddle_io_nk; // @[FFT3PipelineCalc.scala 45:28]
  wire [1:0] fftTwiddle_io_twiLutCaseIndex; // @[FFT3PipelineCalc.scala 45:28]
  wire [13:0] fftTwiddle_io_wR; // @[FFT3PipelineCalc.scala 45:28]
  wire [13:0] fftTwiddle_io_wI; // @[FFT3PipelineCalc.scala 45:28]
  wire [15:0] _dataInSRRnd_T_2 = {io_dataInSR[15],io_dataInSR[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSRRnd_T_5 = {15'h0,io_dataInSR[0]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSIRnd_T_2 = {io_dataInSI[15],io_dataInSI[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSIRnd_T_5 = {15'h0,io_dataInSI[0]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTRRnd_T_2 = {io_dataInTR[15],io_dataInTR[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTRRnd_T_5 = {15'h0,io_dataInTR[0]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTIRnd_T_2 = {io_dataInTI[15],io_dataInTI[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTIRnd_T_5 = {15'h0,io_dataInTI[0]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSR1c_T = _dataInSRRnd_T_2 + _dataInSRRnd_T_5; // @[FFT3PipelineCalc.scala 34:64]
  wire [15:0] _dataInSI1c_T = _dataInSIRnd_T_2 + _dataInSIRnd_T_5; // @[FFT3PipelineCalc.scala 35:64]
  wire [15:0] _dataInTR1c_T = _dataInTRRnd_T_2 + _dataInTRRnd_T_5; // @[FFT3PipelineCalc.scala 36:64]
  wire [15:0] _dataInTI1c_T = _dataInTIRnd_T_2 + _dataInTIRnd_T_5; // @[FFT3PipelineCalc.scala 37:64]
  reg [8:0] nk1c; // @[Reg.scala 35:20]
  reg [15:0] sR2c; // @[Reg.scala 35:20]
  reg [15:0] sI2c; // @[Reg.scala 35:20]
  reg [15:0] qR2cProc; // @[Reg.scala 35:20]
  reg [15:0] tI2c; // @[Reg.scala 35:20]
  reg [13:0] wR2c; // @[Reg.scala 35:20]
  reg [13:0] wI2c; // @[Reg.scala 35:20]
  wire [15:0] addTRI = $signed(qR2cProc) + $signed(tI2c); // @[FFT3PipelineCalc.scala 58:23]
  wire [13:0] addWRI = $signed(wR2c) + $signed(wI2c); // @[FFT3PipelineCalc.scala 59:23]
  wire [29:0] multS = $signed(addTRI) * $signed(addWRI); // @[FFT3PipelineCalc.scala 60:24]
  wire [29:0] multR = $signed(qR2cProc) * $signed(wR2c); // @[FFT3PipelineCalc.scala 62:25]
  wire [29:0] multI = $signed(tI2c) * $signed(wI2c); // @[FFT3PipelineCalc.scala 65:25]
  wire [29:0] qR2cKernel = $signed(multR) - $signed(multI); // @[FFT3PipelineCalc.scala 68:28]
  wire [29:0] _qI2cKernel_T_2 = $signed(multS) - $signed(multR); // @[FFT3PipelineCalc.scala 69:28]
  wire [29:0] qI2cKernel = $signed(_qI2cKernel_T_2) - $signed(multI); // @[FFT3PipelineCalc.scala 69:36]
  wire [15:0] qI2cProc = 16'sh0 - $signed(tI2c); // @[FFT3PipelineCalc.scala 72:20]
  wire [27:0] _GEN_11 = {$signed(qR2cProc), 12'h0}; // @[FFT3PipelineCalc.scala 74:19]
  wire [29:0] qR2c = io_procMode ? $signed({{2{_GEN_11[27]}},_GEN_11}) : $signed(qR2cKernel); // @[FFT3PipelineCalc.scala 74:19]
  wire [27:0] _GEN_12 = {$signed(qI2cProc), 12'h0}; // @[FFT3PipelineCalc.scala 75:19]
  wire [29:0] qI2c = io_procMode ? $signed({{2{_GEN_12[27]}},_GEN_12}) : $signed(qI2cKernel); // @[FFT3PipelineCalc.scala 75:19]
  reg [15:0] sR3c; // @[Reg.scala 35:20]
  reg [15:0] sI3c; // @[Reg.scala 35:20]
  reg [29:0] qR3c; // @[Reg.scala 35:20]
  wire [41:0] _GEN_9 = io_state2c ? $signed({{12{qR2c[29]}},qR2c}) : $signed({$signed(qR3c), 12'h0}); // @[Reg.scala 36:18 35:20 36:22]
  reg [29:0] qI3c; // @[Reg.scala 35:20]
  wire [41:0] _GEN_10 = io_state2c ? $signed({{12{qI2c[29]}},qI2c}) : $signed({$signed(qI3c), 12'h0}); // @[Reg.scala 36:18 35:20 36:22]
  wire [29:0] _GEN_13 = {{14{sR3c[15]}},sR3c}; // @[FFT3PipelineCalc.scala 83:27]
  wire [29:0] xR3cPrePre = $signed(_GEN_13) + $signed(qR3c); // @[FFT3PipelineCalc.scala 83:27]
  wire [29:0] _GEN_14 = {{14{sI3c[15]}},sI3c}; // @[FFT3PipelineCalc.scala 84:27]
  wire [29:0] xI3cPrePre = $signed(_GEN_14) + $signed(qI3c); // @[FFT3PipelineCalc.scala 84:27]
  wire [14:0] _xR3cPre_T_10 = xR3cPrePre[29] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xR3cPre_T_11 = ~_xR3cPre_T_10; // @[FFT3PipelineCalc.scala 86:188]
  wire [15:0] _xR3cPre_T_13 = {xR3cPrePre[29],_xR3cPre_T_11}; // @[FFT3PipelineCalc.scala 86:262]
  wire [29:0] xR3cPre = sR3c[15] == qR3c[29] & sR3c[15] != xR3cPrePre[29] ? $signed({{14{_xR3cPre_T_13[15]}},
    _xR3cPre_T_13}) : $signed(xR3cPrePre); // @[FFT3PipelineCalc.scala 86:22]
  wire [14:0] _xI3cPre_T_10 = xI3cPrePre[29] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xI3cPre_T_11 = ~_xI3cPre_T_10; // @[FFT3PipelineCalc.scala 87:188]
  wire [15:0] _xI3cPre_T_13 = {xI3cPrePre[29],_xI3cPre_T_11}; // @[FFT3PipelineCalc.scala 87:262]
  wire [29:0] xI3cPre = sI3c[15] == qI3c[29] & sI3c[15] != xI3cPrePre[29] ? $signed({{14{_xI3cPre_T_13[15]}},
    _xI3cPre_T_13}) : $signed(xI3cPrePre); // @[FFT3PipelineCalc.scala 87:22]
  wire [29:0] yR3cPrePre = $signed(_GEN_13) - $signed(qR3c); // @[FFT3PipelineCalc.scala 92:27]
  wire [29:0] yI3cPrePre = $signed(_GEN_14) - $signed(qI3c); // @[FFT3PipelineCalc.scala 93:27]
  wire [14:0] _yR3cPre_T_10 = yR3cPrePre[29] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yR3cPre_T_11 = ~_yR3cPre_T_10; // @[FFT3PipelineCalc.scala 95:188]
  wire [15:0] _yR3cPre_T_13 = {yR3cPrePre[29],_yR3cPre_T_11}; // @[FFT3PipelineCalc.scala 95:262]
  wire [29:0] yR3cPre = sR3c[15] != qR3c[29] & sR3c[15] != yR3cPrePre[29] ? $signed({{14{_yR3cPre_T_13[15]}},
    _yR3cPre_T_13}) : $signed(yR3cPrePre); // @[FFT3PipelineCalc.scala 95:22]
  wire [14:0] _yI3cPre_T_10 = yI3cPrePre[29] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yI3cPre_T_11 = ~_yI3cPre_T_10; // @[FFT3PipelineCalc.scala 96:188]
  wire [15:0] _yI3cPre_T_13 = {yI3cPrePre[29],_yI3cPre_T_11}; // @[FFT3PipelineCalc.scala 96:262]
  wire [29:0] yI3cPre = sI3c[15] != qI3c[29] & sI3c[15] != yI3cPrePre[29] ? $signed({{14{_yI3cPre_T_13[15]}},
    _yI3cPre_T_13}) : $signed(yI3cPrePre); // @[FFT3PipelineCalc.scala 96:22]
  FFTTwiddle_1 fftTwiddle ( // @[FFT3PipelineCalc.scala 45:28]
    .io_nk(fftTwiddle_io_nk),
    .io_twiLutCaseIndex(fftTwiddle_io_twiLutCaseIndex),
    .io_wR(fftTwiddle_io_wR),
    .io_wI(fftTwiddle_io_wI)
  );
  assign io_dataOutSR3c = xR3cPre[15:0]; // @[FFT3PipelineCalc.scala 89:64]
  assign io_dataOutSI3c = xI3cPre[15:0]; // @[FFT3PipelineCalc.scala 90:64]
  assign io_dataOutTR3c = yR3cPre[15:0]; // @[FFT3PipelineCalc.scala 98:64]
  assign io_dataOutTI3c = yI3cPre[15:0]; // @[FFT3PipelineCalc.scala 99:64]
  assign fftTwiddle_io_nk = {{1'd0}, nk1c}; // @[FFT3PipelineCalc.scala 46:22]
  assign fftTwiddle_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineCalc.scala 43:30]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      nk1c <= 9'h0; // @[Reg.scala 35:20]
    end else begin
      nk1c <= io_nk;
    end
    if (reset) begin // @[Reg.scala 35:20]
      sR2c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 34:25]
        sR2c <= _dataInSR1c_T;
      end else begin
        sR2c <= io_dataInSR;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      sI2c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 35:25]
        sI2c <= _dataInSI1c_T;
      end else begin
        sI2c <= io_dataInSI;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      qR2cProc <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 36:25]
        qR2cProc <= _dataInTR1c_T;
      end else begin
        qR2cProc <= io_dataInTR;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      tI2c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 37:25]
        tI2c <= _dataInTI1c_T;
      end else begin
        tI2c <= io_dataInTI;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c <= fftTwiddle_io_wR; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c <= 14'sh0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c <= fftTwiddle_io_wI; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      sR3c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      sR3c <= sR2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      sI3c <= 16'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      sI3c <= sI2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      qR3c <= 30'sh0; // @[Reg.scala 35:20]
    end else begin
      qR3c <= _GEN_9[41:12];
    end
    if (reset) begin // @[Reg.scala 35:20]
      qI3c <= 30'sh0; // @[Reg.scala 35:20]
    end else begin
      qI3c <= _GEN_10[41:12];
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
  nk1c = _RAND_0[8:0];
  _RAND_1 = {1{`RANDOM}};
  sR2c = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  sI2c = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  qR2cProc = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  tI2c = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  wR2c = _RAND_5[13:0];
  _RAND_6 = {1{`RANDOM}};
  wI2c = _RAND_6[13:0];
  _RAND_7 = {1{`RANDOM}};
  sR3c = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  sI3c = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  qR3c = _RAND_9[29:0];
  _RAND_10 = {1{`RANDOM}};
  qI3c = _RAND_10[29:0];
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
  output [6:0]  io_addrSram0Bank_0,
  output [6:0]  io_addrSram0Bank_1,
  output [6:0]  io_addrSram0Bank_2,
  output [6:0]  io_addrSram0Bank_3,
  output [6:0]  io_addrSram0Bank_4,
  output [6:0]  io_addrSram0Bank_5,
  output [6:0]  io_addrSram0Bank_6,
  output [6:0]  io_addrSram0Bank_7,
  output [6:0]  io_addrSram1Bank_0,
  output [6:0]  io_addrSram1Bank_1,
  output [6:0]  io_addrSram1Bank_2,
  output [6:0]  io_addrSram1Bank_3,
  output [6:0]  io_addrSram1Bank_4,
  output [6:0]  io_addrSram1Bank_5,
  output [6:0]  io_addrSram1Bank_6,
  output [6:0]  io_addrSram1Bank_7,
  output        io_fftDone,
  input         io_fftEngineKick,
  input         io_fftMode,
  input         io_fftRShiftP0_0,
  input         io_fftRShiftP0_1,
  input         io_fftRShiftP0_2,
  input         io_fftRShiftP0_3,
  input         io_fftRShiftP0_4,
  input         io_fftRShiftP0_5,
  input         io_fftRShiftP0_6,
  input         io_fftRShiftP0_7,
  input         io_fftRShiftP0_8,
  input         io_fftRShiftP0_9
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
  wire  fftCalc_clock; // @[FFTEngine.scala 481:29]
  wire  fftCalc_reset; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_io_dataInSR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_io_dataInSI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_io_dataInTR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_io_dataInTI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_io_dataOutSR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_io_dataOutSI3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_io_dataOutTR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_io_dataOutTI3c; // @[FFTEngine.scala 481:29]
  wire [9:0] fftCalc_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_state2c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_1_clock; // @[FFTEngine.scala 481:29]
  wire  fftCalc_1_reset; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_1_io_dataInSR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_1_io_dataInSI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_1_io_dataInTR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_1_io_dataInTI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_1_io_dataOutSR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_1_io_dataOutSI3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_1_io_dataOutTR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_1_io_dataOutTI3c; // @[FFTEngine.scala 481:29]
  wire [8:0] fftCalc_1_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_1_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_1_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_1_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_1_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_1_io_state2c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_2_clock; // @[FFTEngine.scala 481:29]
  wire  fftCalc_2_reset; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_2_io_dataInSR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_2_io_dataInSI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_2_io_dataInTR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_2_io_dataInTI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_2_io_dataOutSR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_2_io_dataOutSI3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_2_io_dataOutTR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_2_io_dataOutTI3c; // @[FFTEngine.scala 481:29]
  wire [8:0] fftCalc_2_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_2_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_2_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_2_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_2_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_2_io_state2c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_clock; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_reset; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_3_io_dataInSR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_3_io_dataInSI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_3_io_dataInTR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_3_io_dataInTI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_3_io_dataOutSR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_3_io_dataOutSI3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_3_io_dataOutTR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_3_io_dataOutTI3c; // @[FFTEngine.scala 481:29]
  wire [8:0] fftCalc_3_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_state2c; // @[FFTEngine.scala 481:29]
  reg [2:0] stateReg; // @[FFTEngine.scala 46:27]
  reg [9:0] addrSProc; // @[FFTEngine.scala 48:29]
  reg [3:0] phaseCount; // @[FFTEngine.scala 50:29]
  wire  _T_2 = addrSProc == 10'h7f; // @[FFTEngine.scala 62:33]
  wire  _T_4 = addrSProc == 10'h3; // @[FFTEngine.scala 69:33]
  wire [2:0] _GEN_2 = addrSProc == 10'h3 ? 3'h3 : stateReg; // @[FFTEngine.scala 69:49 70:30 72:30]
  wire  _T_6 = phaseCount == 4'h9; // @[FFTEngine.scala 76:33]
  wire [2:0] _stateReg_T_1 = io_fftMode ? 3'h4 : 3'h7; // @[FFTEngine.scala 77:36]
  wire [2:0] _GEN_3 = phaseCount == 4'h9 ? _stateReg_T_1 : 3'h1; // @[FFTEngine.scala 76:50 77:30 79:30]
  wire  _T_8 = addrSProc == 10'h1ff; // @[FFTEngine.scala 83:33]
  wire [2:0] _GEN_4 = addrSProc == 10'h1ff ? 3'h5 : stateReg; // @[FFTEngine.scala 83:51 84:30 86:30]
  wire [2:0] _GEN_5 = _T_4 ? 3'h6 : stateReg; // @[FFTEngine.scala 90:50 91:30 93:30]
  wire  _T_12 = phaseCount == 4'h1; // @[FFTEngine.scala 97:33]
  wire [2:0] _stateReg_T_2 = io_fftMode ? 3'h7 : 3'h1; // @[FFTEngine.scala 98:36]
  wire [2:0] _GEN_6 = phaseCount == 4'h1 ? _stateReg_T_2 : 3'h4; // @[FFTEngine.scala 100:30 97:51 98:30]
  wire [2:0] _GEN_7 = 3'h7 == stateReg ? 3'h0 : stateReg; // @[FFTEngine.scala 104:26 53:26 46:27]
  wire [2:0] _GEN_8 = 3'h6 == stateReg ? _GEN_6 : _GEN_7; // @[FFTEngine.scala 53:26]
  wire [2:0] _GEN_9 = 3'h5 == stateReg ? _GEN_5 : _GEN_8; // @[FFTEngine.scala 53:26]
  wire [2:0] _GEN_10 = 3'h4 == stateReg ? _GEN_4 : _GEN_9; // @[FFTEngine.scala 53:26]
  wire [2:0] _GEN_11 = 3'h3 == stateReg ? _GEN_3 : _GEN_10; // @[FFTEngine.scala 53:26]
  wire  _radixInit_T = stateReg == 3'h0; // @[FFTEngine.scala 143:31]
  wire  _radixInit_T_1 = stateReg == 3'h1; // @[FFTEngine.scala 144:16]
  wire  _radixInit_T_3 = stateReg == 3'h1 & _T_2; // @[FFTEngine.scala 144:30]
  wire  _radixInit_T_4 = stateReg == 3'h0 | _radixInit_T_3; // @[FFTEngine.scala 143:45]
  wire  _radixInit_T_5 = stateReg == 3'h2; // @[FFTEngine.scala 145:16]
  wire  _radixInit_T_7 = stateReg == 3'h2 & _T_4; // @[FFTEngine.scala 145:31]
  wire  _radixInit_T_8 = _radixInit_T_4 | _radixInit_T_7; // @[FFTEngine.scala 144:63]
  wire  _radixInit_T_9 = stateReg == 3'h3; // @[FFTEngine.scala 146:15]
  wire  _radixInit_T_10 = _radixInit_T_8 | _radixInit_T_9; // @[FFTEngine.scala 145:63]
  wire  _radixInit_T_11 = stateReg == 3'h4; // @[FFTEngine.scala 147:16]
  wire  _radixInit_T_13 = stateReg == 3'h4 & _T_8; // @[FFTEngine.scala 147:28]
  wire  _radixInit_T_14 = _radixInit_T_10 | _radixInit_T_13; // @[FFTEngine.scala 146:32]
  wire  _radixInit_T_15 = stateReg == 3'h5; // @[FFTEngine.scala 148:16]
  wire  _radixInit_T_17 = stateReg == 3'h5 & _T_4; // @[FFTEngine.scala 148:29]
  wire  _radixInit_T_18 = _radixInit_T_14 | _radixInit_T_17; // @[FFTEngine.scala 147:62]
  wire  _radixInit_T_19 = stateReg == 3'h6; // @[FFTEngine.scala 149:15]
  wire  _radixInit_T_20 = _radixInit_T_18 | _radixInit_T_19; // @[FFTEngine.scala 148:62]
  wire  _radixInit_T_21 = stateReg == 3'h7; // @[FFTEngine.scala 150:15]
  wire  radixInit = _radixInit_T_20 | _radixInit_T_21; // @[FFTEngine.scala 149:30]
  wire  _radixUp_T_4 = _radixInit_T_1 | _radixInit_T_5 | _radixInit_T_11; // @[FFTEngine.scala 152:70]
  wire  radixUp = _radixUp_T_4 | _radixInit_T_15; // @[FFTEngine.scala 153:27]
  wire [9:0] _radixCount_T_1 = addrSProc + 10'h1; // @[FFTEngine.scala 159:34]
  wire  _phaseInit_T_3 = _radixInit_T_9 & _T_6; // @[FFTEngine.scala 165:33]
  wire  _phaseInit_T_4 = _radixInit_T | _phaseInit_T_3; // @[FFTEngine.scala 164:45]
  wire  _phaseInit_T_7 = _radixInit_T_19 & _T_12; // @[FFTEngine.scala 166:31]
  wire  _phaseInit_T_8 = _phaseInit_T_4 | _phaseInit_T_7; // @[FFTEngine.scala 165:65]
  wire  phaseInit = _phaseInit_T_8 | _radixInit_T_21; // @[FFTEngine.scala 166:64]
  wire  phaseUp = _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 169:46]
  wire [3:0] _phaseCount_T_1 = phaseCount + 4'h1; // @[FFTEngine.scala 174:34]
  reg  srcBuffer; // @[FFTEngine.scala 179:28]
  wire  _srcBufferNext_T_3 = ~srcBuffer; // @[FFTEngine.scala 181:79]
  wire  srcBufferNext = phaseUp & ~srcBuffer; // @[FFTEngine.scala 181:77]
  wire  srcUp = _radixInit_T | _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 183:70]
  wire  readEnable = _radixInit_T_1 | _radixInit_T_11; // @[FFTEngine.scala 194:34]
  wire [6:0] radixCountTemp = addrSProc[6:0]; // @[FFTEngine.scala 196:36]
  wire [7:0] _nk_0_T_1 = {1'h0,radixCountTemp}; // @[Cat.scala 33:92]
  wire [7:0] _nk_1_T_1 = {1'h1,radixCountTemp}; // @[Cat.scala 33:92]
  wire [8:0] _nk_2_T_1 = {2'h2,radixCountTemp}; // @[Cat.scala 33:92]
  wire [8:0] _nk_3_T_1 = {2'h3,radixCountTemp}; // @[Cat.scala 33:92]
  wire  _T_15 = phaseCount == 4'h8; // @[FFTEngine.scala 223:32]
  wire [7:0] _nk_0_T_3 = {1'h0,addrSProc[6:1],1'h0}; // @[Cat.scala 33:92]
  wire [7:0] _nk_1_T_3 = {1'h1,addrSProc[6:1],1'h0}; // @[Cat.scala 33:92]
  wire [8:0] _nk_2_T_3 = {2'h2,addrSProc[6:1],1'h0}; // @[Cat.scala 33:92]
  wire [8:0] _nk_3_T_3 = {2'h3,addrSProc[6:1],1'h0}; // @[Cat.scala 33:92]
  wire [10:0] _nk_0_T_5 = {addrSProc[8:0],2'h0}; // @[Cat.scala 33:92]
  wire [9:0] _nk_0_T_8 = 10'h1ff >> phaseCount; // @[FFTEngine.scala 234:164]
  wire [9:0] _nk_0_T_9 = ~_nk_0_T_8; // @[FFTEngine.scala 234:102]
  wire [10:0] _GEN_1255 = {{1'd0}, _nk_0_T_9}; // @[FFTEngine.scala 234:100]
  wire [10:0] _nk_0_T_10 = _nk_0_T_5 & _GEN_1255; // @[FFTEngine.scala 234:100]
  wire [10:0] _nk_1_T_5 = {addrSProc[8:0],2'h1}; // @[Cat.scala 33:92]
  wire [10:0] _nk_1_T_10 = _nk_1_T_5 & _GEN_1255; // @[FFTEngine.scala 234:100]
  wire [10:0] _nk_2_T_5 = {addrSProc[8:0],2'h2}; // @[Cat.scala 33:92]
  wire [10:0] _nk_2_T_10 = _nk_2_T_5 & _GEN_1255; // @[FFTEngine.scala 234:100]
  wire [10:0] _nk_3_T_5 = {addrSProc[8:0],2'h3}; // @[Cat.scala 33:92]
  wire [10:0] _nk_3_T_10 = _nk_3_T_5 & _GEN_1255; // @[FFTEngine.scala 234:100]
  wire [10:0] _GEN_20 = phaseCount == 4'h8 ? {{3'd0}, _nk_0_T_3} : _nk_0_T_10; // @[FFTEngine.scala 223:51 228:27 234:23]
  wire [10:0] _GEN_21 = phaseCount == 4'h8 ? {{3'd0}, _nk_1_T_3} : _nk_1_T_10; // @[FFTEngine.scala 223:51 228:27 234:23]
  wire [10:0] _GEN_22 = phaseCount == 4'h8 ? {{2'd0}, _nk_2_T_3} : _nk_2_T_10; // @[FFTEngine.scala 223:51 228:27 234:23]
  wire [10:0] _GEN_23 = phaseCount == 4'h8 ? {{2'd0}, _nk_3_T_3} : _nk_3_T_10; // @[FFTEngine.scala 223:51 228:27 234:23]
  wire [10:0] nk_0 = _T_6 ? {{3'd0}, _nk_0_T_1} : _GEN_20; // @[FFTEngine.scala 219:42 221:23]
  wire [10:0] nk_1 = _T_6 ? {{3'd0}, _nk_1_T_1} : _GEN_21; // @[FFTEngine.scala 219:42 221:23]
  wire [10:0] nk_2 = _T_6 ? {{2'd0}, _nk_2_T_1} : _GEN_22; // @[FFTEngine.scala 219:42 221:23]
  wire [10:0] nk_3 = _T_6 ? {{2'd0}, _nk_3_T_1} : _GEN_23; // @[FFTEngine.scala 219:42 221:23]
  wire [19:0] addrSKernelPre_0_dataTemp = {3'h0,radixCountTemp,3'h0,radixCountTemp}; // @[Cat.scala 33:92]
  wire [19:0] addrTKernelPre_0_dataTemp = {3'h4,radixCountTemp,3'h4,radixCountTemp}; // @[Cat.scala 33:92]
  wire [19:0] addrSKernelPre_1_dataTemp = {3'h1,radixCountTemp,3'h1,radixCountTemp}; // @[Cat.scala 33:92]
  wire [19:0] addrTKernelPre_1_dataTemp = {3'h5,radixCountTemp,3'h5,radixCountTemp}; // @[Cat.scala 33:92]
  wire [19:0] addrSKernelPre_2_dataTemp = {3'h2,radixCountTemp,3'h2,radixCountTemp}; // @[Cat.scala 33:92]
  wire [19:0] addrTKernelPre_2_dataTemp = {3'h6,radixCountTemp,3'h6,radixCountTemp}; // @[Cat.scala 33:92]
  wire [19:0] addrSKernelPre_3_dataTemp = {3'h3,radixCountTemp,3'h3,radixCountTemp}; // @[Cat.scala 33:92]
  wire [19:0] addrTKernelPre_3_dataTemp = {3'h7,radixCountTemp,3'h7,radixCountTemp}; // @[Cat.scala 33:92]
  wire [19:0] addrSKernelPre_0_dataTemp_1 = {{1'd0}, addrSKernelPre_0_dataTemp[19:1]}; // @[FFTEngine.scala 268:40]
  wire [19:0] addrTKernelPre_0_dataTemp_1 = {{1'd0}, addrTKernelPre_0_dataTemp[19:1]}; // @[FFTEngine.scala 268:40]
  wire [19:0] addrSKernelPre_1_dataTemp_1 = {{1'd0}, addrSKernelPre_1_dataTemp[19:1]}; // @[FFTEngine.scala 268:40]
  wire [19:0] addrTKernelPre_1_dataTemp_1 = {{1'd0}, addrTKernelPre_1_dataTemp[19:1]}; // @[FFTEngine.scala 268:40]
  wire [19:0] addrSKernelPre_2_dataTemp_1 = {{1'd0}, addrSKernelPre_2_dataTemp[19:1]}; // @[FFTEngine.scala 268:40]
  wire [19:0] addrTKernelPre_2_dataTemp_1 = {{1'd0}, addrTKernelPre_2_dataTemp[19:1]}; // @[FFTEngine.scala 268:40]
  wire [19:0] addrSKernelPre_3_dataTemp_1 = {{1'd0}, addrSKernelPre_3_dataTemp[19:1]}; // @[FFTEngine.scala 268:40]
  wire [19:0] addrTKernelPre_3_dataTemp_1 = {{1'd0}, addrTKernelPre_3_dataTemp[19:1]}; // @[FFTEngine.scala 268:40]
  wire [19:0] _addrSKernelPre_0_dataTemp_T_2 = {radixCountTemp,2'h0,1'h0,radixCountTemp,2'h0,1'h0}; // @[Cat.scala 33:92]
  wire [34:0] _GEN_24 = {{15'd0}, _addrSKernelPre_0_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [34:0] addrSKernelPre_0_dataTemp_2 = _GEN_24 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [19:0] _addrTKernelPre_0_dataTemp_T_2 = {radixCountTemp,2'h0,1'h1,radixCountTemp,2'h0,1'h1}; // @[Cat.scala 33:92]
  wire [34:0] _GEN_25 = {{15'd0}, _addrTKernelPre_0_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [34:0] addrTKernelPre_0_dataTemp_2 = _GEN_25 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [19:0] _addrSKernelPre_1_dataTemp_T_2 = {radixCountTemp,2'h1,1'h0,radixCountTemp,2'h1,1'h0}; // @[Cat.scala 33:92]
  wire [34:0] _GEN_26 = {{15'd0}, _addrSKernelPre_1_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [34:0] addrSKernelPre_1_dataTemp_2 = _GEN_26 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [19:0] _addrTKernelPre_1_dataTemp_T_2 = {radixCountTemp,2'h1,1'h1,radixCountTemp,2'h1,1'h1}; // @[Cat.scala 33:92]
  wire [34:0] _GEN_27 = {{15'd0}, _addrTKernelPre_1_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [34:0] addrTKernelPre_1_dataTemp_2 = _GEN_27 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [19:0] _addrSKernelPre_2_dataTemp_T_2 = {radixCountTemp,2'h2,1'h0,radixCountTemp,2'h2,1'h0}; // @[Cat.scala 33:92]
  wire [34:0] _GEN_36 = {{15'd0}, _addrSKernelPre_2_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [34:0] addrSKernelPre_2_dataTemp_2 = _GEN_36 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [19:0] _addrTKernelPre_2_dataTemp_T_2 = {radixCountTemp,2'h2,1'h1,radixCountTemp,2'h2,1'h1}; // @[Cat.scala 33:92]
  wire [34:0] _GEN_37 = {{15'd0}, _addrTKernelPre_2_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [34:0] addrTKernelPre_2_dataTemp_2 = _GEN_37 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [19:0] _addrSKernelPre_3_dataTemp_T_2 = {radixCountTemp,2'h3,1'h0,radixCountTemp,2'h3,1'h0}; // @[Cat.scala 33:92]
  wire [34:0] _GEN_38 = {{15'd0}, _addrSKernelPre_3_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [34:0] addrSKernelPre_3_dataTemp_2 = _GEN_38 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [19:0] _addrTKernelPre_3_dataTemp_T_2 = {radixCountTemp,2'h3,1'h1,radixCountTemp,2'h3,1'h1}; // @[Cat.scala 33:92]
  wire [34:0] _GEN_39 = {{15'd0}, _addrTKernelPre_3_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [34:0] addrTKernelPre_3_dataTemp_2 = _GEN_39 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [9:0] _GEN_28 = _T_15 ? addrSKernelPre_0_dataTemp_1[9:0] : addrSKernelPre_0_dataTemp_2[19:10]; // @[FFTEngine.scala 296:51 298:35 303:35]
  wire [9:0] _GEN_29 = _T_15 ? addrTKernelPre_0_dataTemp_1[9:0] : addrTKernelPre_0_dataTemp_2[19:10]; // @[FFTEngine.scala 296:51 299:35 304:35]
  wire [9:0] _GEN_30 = _T_15 ? addrSKernelPre_1_dataTemp_1[9:0] : addrSKernelPre_1_dataTemp_2[19:10]; // @[FFTEngine.scala 296:51 298:35 303:35]
  wire [9:0] _GEN_31 = _T_15 ? addrTKernelPre_1_dataTemp_1[9:0] : addrTKernelPre_1_dataTemp_2[19:10]; // @[FFTEngine.scala 296:51 299:35 304:35]
  wire [9:0] _GEN_32 = _T_15 ? addrSKernelPre_2_dataTemp_1[9:0] : addrSKernelPre_2_dataTemp_2[19:10]; // @[FFTEngine.scala 296:51 298:35 303:35]
  wire [9:0] _GEN_33 = _T_15 ? addrTKernelPre_2_dataTemp_1[9:0] : addrTKernelPre_2_dataTemp_2[19:10]; // @[FFTEngine.scala 296:51 299:35 304:35]
  wire [9:0] _GEN_34 = _T_15 ? addrSKernelPre_3_dataTemp_1[9:0] : addrSKernelPre_3_dataTemp_2[19:10]; // @[FFTEngine.scala 296:51 298:35 303:35]
  wire [9:0] _GEN_35 = _T_15 ? addrTKernelPre_3_dataTemp_1[9:0] : addrTKernelPre_3_dataTemp_2[19:10]; // @[FFTEngine.scala 296:51 299:35 304:35]
  wire [9:0] addrSKernelPre_0 = _T_6 ? addrSKernelPre_0_dataTemp[9:0] : _GEN_28; // @[FFTEngine.scala 291:42 293:35]
  wire [9:0] addrTKernelPre_0 = _T_6 ? addrTKernelPre_0_dataTemp[9:0] : _GEN_29; // @[FFTEngine.scala 291:42 294:35]
  wire [9:0] addrSKernelPre_1 = _T_6 ? addrSKernelPre_1_dataTemp[9:0] : _GEN_30; // @[FFTEngine.scala 291:42 293:35]
  wire [9:0] addrTKernelPre_1 = _T_6 ? addrTKernelPre_1_dataTemp[9:0] : _GEN_31; // @[FFTEngine.scala 291:42 294:35]
  wire [9:0] addrSKernelPre_2 = _T_6 ? addrSKernelPre_2_dataTemp[9:0] : _GEN_32; // @[FFTEngine.scala 291:42 293:35]
  wire [9:0] addrTKernelPre_2 = _T_6 ? addrTKernelPre_2_dataTemp[9:0] : _GEN_33; // @[FFTEngine.scala 291:42 294:35]
  wire [9:0] addrSKernelPre_3 = _T_6 ? addrSKernelPre_3_dataTemp[9:0] : _GEN_34; // @[FFTEngine.scala 291:42 293:35]
  wire [9:0] addrTKernelPre_3 = _T_6 ? addrTKernelPre_3_dataTemp[9:0] : _GEN_35; // @[FFTEngine.scala 291:42 294:35]
  wire [9:0] _addrTProc_T = ~addrSProc; // @[FFTEngine.scala 332:22]
  wire [9:0] addrTProc = _addrTProc_T + 10'h1; // @[FFTEngine.scala 332:34]
  wire  addrS_0_temp_0 = io_fftMode ? addrSProc[9] : addrSProc[0]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_1 = io_fftMode ? addrSProc[8] : addrSProc[1]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_2 = io_fftMode ? addrSProc[7] : addrSProc[2]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_3 = io_fftMode ? addrSProc[6] : addrSProc[3]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_4 = io_fftMode ? addrSProc[5] : addrSProc[4]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_5 = io_fftMode ? addrSProc[4] : addrSProc[5]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_6 = io_fftMode ? addrSProc[3] : addrSProc[6]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_7 = io_fftMode ? addrSProc[2] : addrSProc[7]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_8 = io_fftMode ? addrSProc[1] : addrSProc[8]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_9 = io_fftMode ? addrSProc[0] : addrSProc[9]; // @[FFTEngine.scala 200:26]
  wire [9:0] _addrS_0_T = {addrS_0_temp_9,addrS_0_temp_8,addrS_0_temp_7,addrS_0_temp_6,addrS_0_temp_5,addrS_0_temp_4,
    addrS_0_temp_3,addrS_0_temp_2,addrS_0_temp_1,addrS_0_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_0_temp_0_1 = addrSKernelPre_0[9]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_1_1 = addrSKernelPre_0[8]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_2_1 = addrSKernelPre_0[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_3_1 = addrSKernelPre_0[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_4_1 = addrSKernelPre_0[5]; // @[FFTEngine.scala 200:34]
  wire [9:0] _addrS_0_T_1 = {addrSKernelPre_0[0],addrSKernelPre_0[1],addrSKernelPre_0[2],addrSKernelPre_0[3],
    addrSKernelPre_0[4],addrS_0_temp_4_1,addrS_0_temp_3_1,addrS_0_temp_2_1,addrS_0_temp_1_1,addrS_0_temp_0_1}; // @[FFTEngine.scala 201:23]
  wire [9:0] addrS_0 = _radixInit_T_11 ? _addrS_0_T : _addrS_0_T_1; // @[FFTEngine.scala 338:28]
  wire  addrT_0_temp_0 = io_fftMode ? addrTProc[9] : addrTProc[0]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_1 = io_fftMode ? addrTProc[8] : addrTProc[1]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_2 = io_fftMode ? addrTProc[7] : addrTProc[2]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_3 = io_fftMode ? addrTProc[6] : addrTProc[3]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_4 = io_fftMode ? addrTProc[5] : addrTProc[4]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_5 = io_fftMode ? addrTProc[4] : addrTProc[5]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_6 = io_fftMode ? addrTProc[3] : addrTProc[6]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_7 = io_fftMode ? addrTProc[2] : addrTProc[7]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_8 = io_fftMode ? addrTProc[1] : addrTProc[8]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_9 = io_fftMode ? addrTProc[0] : addrTProc[9]; // @[FFTEngine.scala 200:26]
  wire [9:0] _addrT_0_T = {addrT_0_temp_9,addrT_0_temp_8,addrT_0_temp_7,addrT_0_temp_6,addrT_0_temp_5,addrT_0_temp_4,
    addrT_0_temp_3,addrT_0_temp_2,addrT_0_temp_1,addrT_0_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_0_temp_0_1 = addrTKernelPre_0[9]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_1_1 = addrTKernelPre_0[8]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_2_1 = addrTKernelPre_0[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_3_1 = addrTKernelPre_0[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_4_1 = addrTKernelPre_0[5]; // @[FFTEngine.scala 200:34]
  wire [9:0] _addrT_0_T_1 = {addrTKernelPre_0[0],addrTKernelPre_0[1],addrTKernelPre_0[2],addrTKernelPre_0[3],
    addrTKernelPre_0[4],addrT_0_temp_4_1,addrT_0_temp_3_1,addrT_0_temp_2_1,addrT_0_temp_1_1,addrT_0_temp_0_1}; // @[FFTEngine.scala 201:23]
  wire [9:0] addrT_0 = _radixInit_T_11 ? _addrT_0_T : _addrT_0_T_1; // @[FFTEngine.scala 339:28]
  wire  addrS_1_temp_0 = addrSKernelPre_1[9]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_1 = addrSKernelPre_1[8]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_2 = addrSKernelPre_1[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_3 = addrSKernelPre_1[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_4 = addrSKernelPre_1[5]; // @[FFTEngine.scala 200:34]
  wire [9:0] addrS_1 = {addrSKernelPre_1[0],addrSKernelPre_1[1],addrSKernelPre_1[2],addrSKernelPre_1[3],addrSKernelPre_1
    [4],addrS_1_temp_4,addrS_1_temp_3,addrS_1_temp_2,addrS_1_temp_1,addrS_1_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_1_temp_0 = addrTKernelPre_1[9]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_1 = addrTKernelPre_1[8]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_2 = addrTKernelPre_1[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_3 = addrTKernelPre_1[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_4 = addrTKernelPre_1[5]; // @[FFTEngine.scala 200:34]
  wire [9:0] addrT_1 = {addrTKernelPre_1[0],addrTKernelPre_1[1],addrTKernelPre_1[2],addrTKernelPre_1[3],addrTKernelPre_1
    [4],addrT_1_temp_4,addrT_1_temp_3,addrT_1_temp_2,addrT_1_temp_1,addrT_1_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_2_temp_0 = addrSKernelPre_2[9]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_1 = addrSKernelPre_2[8]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_2 = addrSKernelPre_2[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_3 = addrSKernelPre_2[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_4 = addrSKernelPre_2[5]; // @[FFTEngine.scala 200:34]
  wire [9:0] addrS_2 = {addrSKernelPre_2[0],addrSKernelPre_2[1],addrSKernelPre_2[2],addrSKernelPre_2[3],addrSKernelPre_2
    [4],addrS_2_temp_4,addrS_2_temp_3,addrS_2_temp_2,addrS_2_temp_1,addrS_2_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_2_temp_0 = addrTKernelPre_2[9]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_1 = addrTKernelPre_2[8]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_2 = addrTKernelPre_2[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_3 = addrTKernelPre_2[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_4 = addrTKernelPre_2[5]; // @[FFTEngine.scala 200:34]
  wire [9:0] addrT_2 = {addrTKernelPre_2[0],addrTKernelPre_2[1],addrTKernelPre_2[2],addrTKernelPre_2[3],addrTKernelPre_2
    [4],addrT_2_temp_4,addrT_2_temp_3,addrT_2_temp_2,addrT_2_temp_1,addrT_2_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_3_temp_0 = addrSKernelPre_3[9]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_1 = addrSKernelPre_3[8]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_2 = addrSKernelPre_3[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_3 = addrSKernelPre_3[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_4 = addrSKernelPre_3[5]; // @[FFTEngine.scala 200:34]
  wire [9:0] addrS_3 = {addrSKernelPre_3[0],addrSKernelPre_3[1],addrSKernelPre_3[2],addrSKernelPre_3[3],addrSKernelPre_3
    [4],addrS_3_temp_4,addrS_3_temp_3,addrS_3_temp_2,addrS_3_temp_1,addrS_3_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_3_temp_0 = addrTKernelPre_3[9]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_1 = addrTKernelPre_3[8]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_2 = addrTKernelPre_3[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_3 = addrTKernelPre_3[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_4 = addrTKernelPre_3[5]; // @[FFTEngine.scala 200:34]
  wire [9:0] addrT_3 = {addrTKernelPre_3[0],addrTKernelPre_3[1],addrTKernelPre_3[2],addrTKernelPre_3[3],addrTKernelPre_3
    [4],addrT_3_temp_4,addrT_3_temp_3,addrT_3_temp_2,addrT_3_temp_1,addrT_3_temp_0}; // @[FFTEngine.scala 201:23]
  wire  sameAddr = addrS_0 == addrT_0; // @[FFTEngine.scala 346:29]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T = {{2'd0}, addrS_0[9:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1268 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_2 = {{1'd0}, _GEN_1268}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_4 = {{5'd0}, addrS_0[9:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1270 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_7 = _addrSBankSelKernelPrePre_sum_T_2[2:0] + _GEN_1270; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_8 = {{8'd0}, addrS_0[9:8]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1272 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_8[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_0_0 = _addrSBankSelKernelPrePre_sum_T_7 + _GEN_1272; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_11 = {{1'd0}, addrS_0[9:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1274 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_13 = {{1'd0}, _GEN_1274}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_15 = {{4'd0}, addrS_0[9:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1276 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_15[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_18 = _addrSBankSelKernelPrePre_sum_T_13[2:0] + _GEN_1276; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_19 = {{7'd0}, addrS_0[9:7]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1278 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_19[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_0_1 = _addrSBankSelKernelPrePre_sum_T_18 + _GEN_1278; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1279 = {{2'd0}, addrS_0[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_24 = {{1'd0}, _GEN_1279}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_26 = {{3'd0}, addrS_0[9:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1281 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_26[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_29 = _addrSBankSelKernelPrePre_sum_T_24[2:0] + _GEN_1281; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_30 = {{6'd0}, addrS_0[9:6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1283 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_30[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_33 = _addrSBankSelKernelPrePre_sum_T_29 + _GEN_1283; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_34 = {{9'd0}, addrS_0[9]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1285 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_34[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_0_2 = _addrSBankSelKernelPrePre_sum_T_33 + _GEN_1285; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_37 = {{2'd0}, addrS_1[9:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1287 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_37[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_39 = {{1'd0}, _GEN_1287}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_41 = {{5'd0}, addrS_1[9:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1289 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_41[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_44 = _addrSBankSelKernelPrePre_sum_T_39[2:0] + _GEN_1289; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_45 = {{8'd0}, addrS_1[9:8]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1291 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_45[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_1_0 = _addrSBankSelKernelPrePre_sum_T_44 + _GEN_1291; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_48 = {{1'd0}, addrS_1[9:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1293 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_48[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_50 = {{1'd0}, _GEN_1293}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_52 = {{4'd0}, addrS_1[9:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1295 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_52[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_55 = _addrSBankSelKernelPrePre_sum_T_50[2:0] + _GEN_1295; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_56 = {{7'd0}, addrS_1[9:7]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1297 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_56[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_1_1 = _addrSBankSelKernelPrePre_sum_T_55 + _GEN_1297; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1298 = {{2'd0}, addrS_1[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_61 = {{1'd0}, _GEN_1298}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_63 = {{3'd0}, addrS_1[9:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1300 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_63[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_66 = _addrSBankSelKernelPrePre_sum_T_61[2:0] + _GEN_1300; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_67 = {{6'd0}, addrS_1[9:6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1302 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_67[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_70 = _addrSBankSelKernelPrePre_sum_T_66 + _GEN_1302; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_71 = {{9'd0}, addrS_1[9]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1304 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_71[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_1_2 = _addrSBankSelKernelPrePre_sum_T_70 + _GEN_1304; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_74 = {{2'd0}, addrS_2[9:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1306 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_74[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_76 = {{1'd0}, _GEN_1306}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_78 = {{5'd0}, addrS_2[9:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1308 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_78[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_81 = _addrSBankSelKernelPrePre_sum_T_76[2:0] + _GEN_1308; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_82 = {{8'd0}, addrS_2[9:8]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1310 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_82[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_2_0 = _addrSBankSelKernelPrePre_sum_T_81 + _GEN_1310; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_85 = {{1'd0}, addrS_2[9:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1312 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_85[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_87 = {{1'd0}, _GEN_1312}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_89 = {{4'd0}, addrS_2[9:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1314 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_89[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_92 = _addrSBankSelKernelPrePre_sum_T_87[2:0] + _GEN_1314; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_93 = {{7'd0}, addrS_2[9:7]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1316 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_93[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_2_1 = _addrSBankSelKernelPrePre_sum_T_92 + _GEN_1316; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1317 = {{2'd0}, addrS_2[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_98 = {{1'd0}, _GEN_1317}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_100 = {{3'd0}, addrS_2[9:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1319 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_100[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_103 = _addrSBankSelKernelPrePre_sum_T_98[2:0] + _GEN_1319; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_104 = {{6'd0}, addrS_2[9:6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1321 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_104[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_107 = _addrSBankSelKernelPrePre_sum_T_103 + _GEN_1321; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_108 = {{9'd0}, addrS_2[9]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1323 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_108[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_2_2 = _addrSBankSelKernelPrePre_sum_T_107 + _GEN_1323; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_111 = {{2'd0}, addrS_3[9:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1325 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_111[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_113 = {{1'd0}, _GEN_1325}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_115 = {{5'd0}, addrS_3[9:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1327 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_115[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_118 = _addrSBankSelKernelPrePre_sum_T_113[2:0] + _GEN_1327; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_119 = {{8'd0}, addrS_3[9:8]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1329 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_119[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_3_0 = _addrSBankSelKernelPrePre_sum_T_118 + _GEN_1329; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_122 = {{1'd0}, addrS_3[9:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1331 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_122[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_124 = {{1'd0}, _GEN_1331}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_126 = {{4'd0}, addrS_3[9:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1333 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_126[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_129 = _addrSBankSelKernelPrePre_sum_T_124[2:0] + _GEN_1333; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_130 = {{7'd0}, addrS_3[9:7]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1335 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_130[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_3_1 = _addrSBankSelKernelPrePre_sum_T_129 + _GEN_1335; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1336 = {{2'd0}, addrS_3[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_135 = {{1'd0}, _GEN_1336}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_137 = {{3'd0}, addrS_3[9:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1338 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_137[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_140 = _addrSBankSelKernelPrePre_sum_T_135[2:0] + _GEN_1338; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_141 = {{6'd0}, addrS_3[9:6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1340 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_141[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_144 = _addrSBankSelKernelPrePre_sum_T_140 + _GEN_1340; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrSBankSelKernelPrePre_sum_T_145 = {{9'd0}, addrS_3[9]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1342 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_145[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_3_2 = _addrSBankSelKernelPrePre_sum_T_144 + _GEN_1342; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPre_T_1 = {{1'd0}, addrSBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_3 = {_addrSBankSelKernelPre_T_1[2:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [3:0] _GEN_1343 = {{1'd0}, addrSBankSelKernelPrePre_0_1}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_5 = _addrSBankSelKernelPre_T_3 + _GEN_1343; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_6 = {_addrSBankSelKernelPre_T_5, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_1344 = {{2'd0}, addrSBankSelKernelPrePre_0_2}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_8 = _addrSBankSelKernelPre_T_6 + _GEN_1344; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_10 = {{1'd0}, addrSBankSelKernelPrePre_1_0}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_12 = {_addrSBankSelKernelPre_T_10[2:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [3:0] _GEN_1345 = {{1'd0}, addrSBankSelKernelPrePre_1_1}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_14 = _addrSBankSelKernelPre_T_12 + _GEN_1345; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_15 = {_addrSBankSelKernelPre_T_14, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_1346 = {{2'd0}, addrSBankSelKernelPrePre_1_2}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_17 = _addrSBankSelKernelPre_T_15 + _GEN_1346; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_19 = {{1'd0}, addrSBankSelKernelPrePre_2_0}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_21 = {_addrSBankSelKernelPre_T_19[2:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [3:0] _GEN_1347 = {{1'd0}, addrSBankSelKernelPrePre_2_1}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_23 = _addrSBankSelKernelPre_T_21 + _GEN_1347; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_24 = {_addrSBankSelKernelPre_T_23, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_1348 = {{2'd0}, addrSBankSelKernelPrePre_2_2}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_26 = _addrSBankSelKernelPre_T_24 + _GEN_1348; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_28 = {{1'd0}, addrSBankSelKernelPrePre_3_0}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_30 = {_addrSBankSelKernelPre_T_28[2:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [3:0] _GEN_1349 = {{1'd0}, addrSBankSelKernelPrePre_3_1}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_32 = _addrSBankSelKernelPre_T_30 + _GEN_1349; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_33 = {_addrSBankSelKernelPre_T_32, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_1350 = {{2'd0}, addrSBankSelKernelPrePre_3_2}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_35 = _addrSBankSelKernelPre_T_33 + _GEN_1350; // @[FFTEngine.scala 355:144]
  wire [2:0] addrSBankSelKernelPre_0 = _addrSBankSelKernelPre_T_8[2:0]; // @[FFTEngine.scala 355:160]
  wire [2:0] addrSBankSelKernelPre_1 = _addrSBankSelKernelPre_T_17[2:0]; // @[FFTEngine.scala 355:160]
  wire [2:0] addrSBankSelKernelPre_2 = _addrSBankSelKernelPre_T_26[2:0]; // @[FFTEngine.scala 355:160]
  wire [2:0] addrSBankSelKernelPre_3 = _addrSBankSelKernelPre_T_35[2:0]; // @[FFTEngine.scala 355:160]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T = {{2'd0}, addrT_0[9:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1352 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_2 = {{1'd0}, _GEN_1352}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_4 = {{5'd0}, addrT_0[9:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1354 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_7 = _addrTBankSelKernelPrePre_sum_T_2[2:0] + _GEN_1354; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_8 = {{8'd0}, addrT_0[9:8]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1356 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_8[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_0_0 = _addrTBankSelKernelPrePre_sum_T_7 + _GEN_1356; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_11 = {{1'd0}, addrT_0[9:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1358 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_13 = {{1'd0}, _GEN_1358}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_15 = {{4'd0}, addrT_0[9:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1360 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_15[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_18 = _addrTBankSelKernelPrePre_sum_T_13[2:0] + _GEN_1360; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_19 = {{7'd0}, addrT_0[9:7]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1362 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_19[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_0_1 = _addrTBankSelKernelPrePre_sum_T_18 + _GEN_1362; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1363 = {{2'd0}, addrT_0[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_24 = {{1'd0}, _GEN_1363}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_26 = {{3'd0}, addrT_0[9:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1365 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_26[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_29 = _addrTBankSelKernelPrePre_sum_T_24[2:0] + _GEN_1365; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_30 = {{6'd0}, addrT_0[9:6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1367 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_30[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_33 = _addrTBankSelKernelPrePre_sum_T_29 + _GEN_1367; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_34 = {{9'd0}, addrT_0[9]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1369 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_34[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_0_2 = _addrTBankSelKernelPrePre_sum_T_33 + _GEN_1369; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_37 = {{2'd0}, addrT_1[9:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1371 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_37[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_39 = {{1'd0}, _GEN_1371}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_41 = {{5'd0}, addrT_1[9:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1373 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_41[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_44 = _addrTBankSelKernelPrePre_sum_T_39[2:0] + _GEN_1373; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_45 = {{8'd0}, addrT_1[9:8]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1375 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_45[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_1_0 = _addrTBankSelKernelPrePre_sum_T_44 + _GEN_1375; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_48 = {{1'd0}, addrT_1[9:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1377 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_48[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_50 = {{1'd0}, _GEN_1377}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_52 = {{4'd0}, addrT_1[9:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1379 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_52[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_55 = _addrTBankSelKernelPrePre_sum_T_50[2:0] + _GEN_1379; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_56 = {{7'd0}, addrT_1[9:7]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1381 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_56[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_1_1 = _addrTBankSelKernelPrePre_sum_T_55 + _GEN_1381; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1382 = {{2'd0}, addrT_1[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_61 = {{1'd0}, _GEN_1382}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_63 = {{3'd0}, addrT_1[9:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1384 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_63[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_66 = _addrTBankSelKernelPrePre_sum_T_61[2:0] + _GEN_1384; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_67 = {{6'd0}, addrT_1[9:6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1386 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_67[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_70 = _addrTBankSelKernelPrePre_sum_T_66 + _GEN_1386; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_71 = {{9'd0}, addrT_1[9]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1388 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_71[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_1_2 = _addrTBankSelKernelPrePre_sum_T_70 + _GEN_1388; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_74 = {{2'd0}, addrT_2[9:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1390 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_74[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_76 = {{1'd0}, _GEN_1390}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_78 = {{5'd0}, addrT_2[9:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1392 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_78[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_81 = _addrTBankSelKernelPrePre_sum_T_76[2:0] + _GEN_1392; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_82 = {{8'd0}, addrT_2[9:8]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1394 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_82[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_2_0 = _addrTBankSelKernelPrePre_sum_T_81 + _GEN_1394; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_85 = {{1'd0}, addrT_2[9:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1396 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_85[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_87 = {{1'd0}, _GEN_1396}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_89 = {{4'd0}, addrT_2[9:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1398 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_89[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_92 = _addrTBankSelKernelPrePre_sum_T_87[2:0] + _GEN_1398; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_93 = {{7'd0}, addrT_2[9:7]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1400 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_93[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_2_1 = _addrTBankSelKernelPrePre_sum_T_92 + _GEN_1400; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1401 = {{2'd0}, addrT_2[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_98 = {{1'd0}, _GEN_1401}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_100 = {{3'd0}, addrT_2[9:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1403 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_100[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_103 = _addrTBankSelKernelPrePre_sum_T_98[2:0] + _GEN_1403; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_104 = {{6'd0}, addrT_2[9:6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1405 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_104[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_107 = _addrTBankSelKernelPrePre_sum_T_103 + _GEN_1405; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_108 = {{9'd0}, addrT_2[9]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1407 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_108[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_2_2 = _addrTBankSelKernelPrePre_sum_T_107 + _GEN_1407; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_111 = {{2'd0}, addrT_3[9:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1409 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_111[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_113 = {{1'd0}, _GEN_1409}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_115 = {{5'd0}, addrT_3[9:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1411 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_115[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_118 = _addrTBankSelKernelPrePre_sum_T_113[2:0] + _GEN_1411; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_119 = {{8'd0}, addrT_3[9:8]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1413 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_119[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_3_0 = _addrTBankSelKernelPrePre_sum_T_118 + _GEN_1413; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_122 = {{1'd0}, addrT_3[9:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1415 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_122[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_124 = {{1'd0}, _GEN_1415}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_126 = {{4'd0}, addrT_3[9:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1417 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_126[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_129 = _addrTBankSelKernelPrePre_sum_T_124[2:0] + _GEN_1417; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_130 = {{7'd0}, addrT_3[9:7]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1419 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_130[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_3_1 = _addrTBankSelKernelPrePre_sum_T_129 + _GEN_1419; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1420 = {{2'd0}, addrT_3[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_135 = {{1'd0}, _GEN_1420}; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_137 = {{3'd0}, addrT_3[9:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1422 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_137[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_140 = _addrTBankSelKernelPrePre_sum_T_135[2:0] + _GEN_1422; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_141 = {{6'd0}, addrT_3[9:6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1424 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_141[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_144 = _addrTBankSelKernelPrePre_sum_T_140 + _GEN_1424; // @[FFTEngine.scala 349:107]
  wire [9:0] _addrTBankSelKernelPrePre_sum_T_145 = {{9'd0}, addrT_3[9]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1426 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_145[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_3_2 = _addrTBankSelKernelPrePre_sum_T_144 + _GEN_1426; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPre_T_1 = {{1'd0}, addrTBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_3 = {_addrTBankSelKernelPre_T_1[2:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [3:0] _GEN_1427 = {{1'd0}, addrTBankSelKernelPrePre_0_1}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_5 = _addrTBankSelKernelPre_T_3 + _GEN_1427; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_6 = {_addrTBankSelKernelPre_T_5, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_1428 = {{2'd0}, addrTBankSelKernelPrePre_0_2}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_8 = _addrTBankSelKernelPre_T_6 + _GEN_1428; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_10 = {{1'd0}, addrTBankSelKernelPrePre_1_0}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_12 = {_addrTBankSelKernelPre_T_10[2:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [3:0] _GEN_1429 = {{1'd0}, addrTBankSelKernelPrePre_1_1}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_14 = _addrTBankSelKernelPre_T_12 + _GEN_1429; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_15 = {_addrTBankSelKernelPre_T_14, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_1430 = {{2'd0}, addrTBankSelKernelPrePre_1_2}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_17 = _addrTBankSelKernelPre_T_15 + _GEN_1430; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_19 = {{1'd0}, addrTBankSelKernelPrePre_2_0}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_21 = {_addrTBankSelKernelPre_T_19[2:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [3:0] _GEN_1431 = {{1'd0}, addrTBankSelKernelPrePre_2_1}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_23 = _addrTBankSelKernelPre_T_21 + _GEN_1431; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_24 = {_addrTBankSelKernelPre_T_23, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_1432 = {{2'd0}, addrTBankSelKernelPrePre_2_2}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_26 = _addrTBankSelKernelPre_T_24 + _GEN_1432; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_28 = {{1'd0}, addrTBankSelKernelPrePre_3_0}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_30 = {_addrTBankSelKernelPre_T_28[2:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [3:0] _GEN_1433 = {{1'd0}, addrTBankSelKernelPrePre_3_1}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_32 = _addrTBankSelKernelPre_T_30 + _GEN_1433; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_33 = {_addrTBankSelKernelPre_T_32, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_1434 = {{2'd0}, addrTBankSelKernelPrePre_3_2}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_35 = _addrTBankSelKernelPre_T_33 + _GEN_1434; // @[FFTEngine.scala 361:144]
  wire [2:0] addrTBankSelKernelPre_0 = _addrTBankSelKernelPre_T_8[2:0]; // @[FFTEngine.scala 361:160]
  wire [2:0] addrTBankSelKernelPre_1 = _addrTBankSelKernelPre_T_17[2:0]; // @[FFTEngine.scala 361:160]
  wire [2:0] addrTBankSelKernelPre_2 = _addrTBankSelKernelPre_T_26[2:0]; // @[FFTEngine.scala 361:160]
  wire [2:0] addrTBankSelKernelPre_3 = _addrTBankSelKernelPre_T_35[2:0]; // @[FFTEngine.scala 361:160]
  wire [2:0] addrSBankSelKernel_0 = _radixInit_T_1 ? addrSBankSelKernelPre_0 : 3'h0; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [2:0] addrTBankSelKernel_0 = _radixInit_T_1 ? addrTBankSelKernelPre_0 : 3'h1; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [2:0] addrSBankSelKernel_1 = _radixInit_T_1 ? addrSBankSelKernelPre_1 : 3'h2; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [2:0] addrTBankSelKernel_1 = _radixInit_T_1 ? addrTBankSelKernelPre_1 : 3'h3; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [2:0] addrSBankSelKernel_2 = _radixInit_T_1 ? addrSBankSelKernelPre_2 : 3'h4; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [2:0] addrTBankSelKernel_2 = _radixInit_T_1 ? addrTBankSelKernelPre_2 : 3'h5; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [2:0] addrSBankSelKernel_3 = _radixInit_T_1 ? addrSBankSelKernelPre_3 : 3'h6; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [2:0] addrTBankSelKernel_3 = _radixInit_T_1 ? addrTBankSelKernelPre_3 : 3'h7; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire  addrSBankSelProcPre__0 = addrS_0[0] ^ addrS_0[9]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__0 = addrT_0[0] ^ addrT_0[9]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre__1 = addrS_0[1] ^ addrS_0[8]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__1 = addrT_0[1] ^ addrT_0[8]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre__2 = addrS_0[2] ^ addrS_0[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__2 = addrT_0[2] ^ addrT_0[7]; // @[FFTEngine.scala 383:55]
  wire [2:0] addrSBankSelProc_0 = {addrSBankSelProcPre__0,addrSBankSelProcPre__1,addrSBankSelProcPre__2}; // @[Cat.scala 33:92]
  wire [2:0] addrTBankSelProc_0 = {addrTBankSelProcPre__0,addrTBankSelProcPre__1,addrTBankSelProcPre__2}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_1_0 = addrS_1[0] ^ addrS_1[9]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_0 = addrT_1[0] ^ addrT_1[9]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_1_1 = addrS_1[1] ^ addrS_1[8]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_1 = addrT_1[1] ^ addrT_1[8]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_1_2 = addrS_1[2] ^ addrS_1[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_2 = addrT_1[2] ^ addrT_1[7]; // @[FFTEngine.scala 383:55]
  wire [2:0] addrSBankSelProc_1 = {addrSBankSelProcPre_1_0,addrSBankSelProcPre_1_1,addrSBankSelProcPre_1_2}; // @[Cat.scala 33:92]
  wire [2:0] addrTBankSelProc_1 = {addrTBankSelProcPre_1_0,addrTBankSelProcPre_1_1,addrTBankSelProcPre_1_2}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_2_0 = addrS_2[0] ^ addrS_2[9]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_0 = addrT_2[0] ^ addrT_2[9]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_2_1 = addrS_2[1] ^ addrS_2[8]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_1 = addrT_2[1] ^ addrT_2[8]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_2_2 = addrS_2[2] ^ addrS_2[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_2 = addrT_2[2] ^ addrT_2[7]; // @[FFTEngine.scala 383:55]
  wire [2:0] addrSBankSelProc_2 = {addrSBankSelProcPre_2_0,addrSBankSelProcPre_2_1,addrSBankSelProcPre_2_2}; // @[Cat.scala 33:92]
  wire [2:0] addrTBankSelProc_2 = {addrTBankSelProcPre_2_0,addrTBankSelProcPre_2_1,addrTBankSelProcPre_2_2}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_3_0 = addrS_3[0] ^ addrS_3[9]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_0 = addrT_3[0] ^ addrT_3[9]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_3_1 = addrS_3[1] ^ addrS_3[8]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_1 = addrT_3[1] ^ addrT_3[8]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_3_2 = addrS_3[2] ^ addrS_3[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_2 = addrT_3[2] ^ addrT_3[7]; // @[FFTEngine.scala 383:55]
  wire [2:0] addrSBankSelProc_3 = {addrSBankSelProcPre_3_0,addrSBankSelProcPre_3_1,addrSBankSelProcPre_3_2}; // @[Cat.scala 33:92]
  wire [2:0] addrTBankSelProc_3 = {addrTBankSelProcPre_3_0,addrTBankSelProcPre_3_1,addrTBankSelProcPre_3_2}; // @[Cat.scala 33:92]
  reg [2:0] addrSBankSelKernel1c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel2c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel3c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel1c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel2c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel3c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel1c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel2c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel3c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel1c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel2c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel3c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel1c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel2c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel3c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel1c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel2c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel3c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel1c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel2c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelKernel3c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel1c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel2c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelKernel3c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc1c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc2c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc3c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc1c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc2c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc3c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc1c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc2c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc3c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc1c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc2c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc3c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc1c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc2c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc3c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc1c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc2c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc3c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc1c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc2c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSelProc3c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc1c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc2c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSelProc3c_3_r; // @[Reg.scala 35:20]
  reg  kernelState1c; // @[Reg.scala 35:20]
  reg  kernelState2c; // @[Reg.scala 35:20]
  reg  kernelState3c; // @[Reg.scala 35:20]
  reg  procState1c; // @[Reg.scala 35:20]
  reg  procState2c; // @[Reg.scala 35:20]
  reg  procState3c; // @[Reg.scala 35:20]
  reg  sameAddr1c; // @[Reg.scala 35:20]
  reg  sameAddr2c; // @[Reg.scala 35:20]
  reg  sameAddr3c; // @[Reg.scala 35:20]
  wire [15:0] _dataInPre_0_T_1 = io_readDataSram1Bank_0[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_0_T_3 = io_readDataSram1Bank_0[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_0_T_5 = io_readDataSram0Bank_0[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_0_T_7 = io_readDataSram0Bank_0[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_0_im = srcBuffer ? $signed(_dataInPre_0_T_3) : $signed(_dataInPre_0_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_0_re = srcBuffer ? $signed(_dataInPre_0_T_1) : $signed(_dataInPre_0_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_1_T_1 = io_readDataSram1Bank_1[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_1_T_3 = io_readDataSram1Bank_1[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_1_T_5 = io_readDataSram0Bank_1[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_1_T_7 = io_readDataSram0Bank_1[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_1_im = srcBuffer ? $signed(_dataInPre_1_T_3) : $signed(_dataInPre_1_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_1_re = srcBuffer ? $signed(_dataInPre_1_T_1) : $signed(_dataInPre_1_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_2_T_1 = io_readDataSram1Bank_2[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_2_T_3 = io_readDataSram1Bank_2[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_2_T_5 = io_readDataSram0Bank_2[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_2_T_7 = io_readDataSram0Bank_2[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_2_im = srcBuffer ? $signed(_dataInPre_2_T_3) : $signed(_dataInPre_2_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_2_re = srcBuffer ? $signed(_dataInPre_2_T_1) : $signed(_dataInPre_2_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_3_T_1 = io_readDataSram1Bank_3[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_3_T_3 = io_readDataSram1Bank_3[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_3_T_5 = io_readDataSram0Bank_3[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_3_T_7 = io_readDataSram0Bank_3[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_3_im = srcBuffer ? $signed(_dataInPre_3_T_3) : $signed(_dataInPre_3_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_3_re = srcBuffer ? $signed(_dataInPre_3_T_1) : $signed(_dataInPre_3_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_4_T_1 = io_readDataSram1Bank_4[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_4_T_3 = io_readDataSram1Bank_4[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_4_T_5 = io_readDataSram0Bank_4[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_4_T_7 = io_readDataSram0Bank_4[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_4_im = srcBuffer ? $signed(_dataInPre_4_T_3) : $signed(_dataInPre_4_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_4_re = srcBuffer ? $signed(_dataInPre_4_T_1) : $signed(_dataInPre_4_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_5_T_1 = io_readDataSram1Bank_5[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_5_T_3 = io_readDataSram1Bank_5[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_5_T_5 = io_readDataSram0Bank_5[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_5_T_7 = io_readDataSram0Bank_5[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_5_im = srcBuffer ? $signed(_dataInPre_5_T_3) : $signed(_dataInPre_5_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_5_re = srcBuffer ? $signed(_dataInPre_5_T_1) : $signed(_dataInPre_5_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_6_T_1 = io_readDataSram1Bank_6[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_6_T_3 = io_readDataSram1Bank_6[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_6_T_5 = io_readDataSram0Bank_6[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_6_T_7 = io_readDataSram0Bank_6[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_6_im = srcBuffer ? $signed(_dataInPre_6_T_3) : $signed(_dataInPre_6_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_6_re = srcBuffer ? $signed(_dataInPre_6_T_1) : $signed(_dataInPre_6_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_7_T_1 = io_readDataSram1Bank_7[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_7_T_3 = io_readDataSram1Bank_7[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_7_T_5 = io_readDataSram0Bank_7[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_7_T_7 = io_readDataSram0Bank_7[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_7_im = srcBuffer ? $signed(_dataInPre_7_T_3) : $signed(_dataInPre_7_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_7_re = srcBuffer ? $signed(_dataInPre_7_T_1) : $signed(_dataInPre_7_T_5); // @[FFTEngine.scala 447:28]
  reg [6:0] addrS1c; // @[Reg.scala 35:20]
  reg [6:0] addrS2c; // @[Reg.scala 35:20]
  reg [6:0] addrS3c; // @[Reg.scala 35:20]
  reg [6:0] addrT1c; // @[Reg.scala 35:20]
  reg [6:0] addrT2c; // @[Reg.scala 35:20]
  reg [6:0] addrT3c; // @[Reg.scala 35:20]
  wire [2:0] _addrSBankSel_T_1 = _radixInit_T_11 ? addrSBankSelProc_0 : addrSBankSelKernel_0; // @[FFTEngine.scala 471:32]
  wire  _addrSBankSel_T_2 = phaseCount == 4'h0; // @[FFTEngine.scala 474:72]
  wire  _addrSBankSel_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 4'h0; // @[FFTEngine.scala 474:43]
  wire [2:0] _addrSBankSel_T_5 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 4'h0 ? addrSBankSelProc_0 :
    addrSBankSelKernel_0; // @[FFTEngine.scala 474:32]
  wire [2:0] addrSBankSel = io_fftMode ? _addrSBankSel_T_1 : _addrSBankSel_T_5; // @[FFTEngine.scala 470:21 471:26 474:26]
  reg [2:0] addrSBankSel1c; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c; // @[Reg.scala 35:20]
  wire [15:0] _GEN_120 = 3'h1 == addrSBankSel1c ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_121 = 3'h2 == addrSBankSel1c ? $signed(dataInPre_2_re) : $signed(_GEN_120); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_122 = 3'h3 == addrSBankSel1c ? $signed(dataInPre_3_re) : $signed(_GEN_121); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_123 = 3'h4 == addrSBankSel1c ? $signed(dataInPre_4_re) : $signed(_GEN_122); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_124 = 3'h5 == addrSBankSel1c ? $signed(dataInPre_5_re) : $signed(_GEN_123); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_125 = 3'h6 == addrSBankSel1c ? $signed(dataInPre_6_re) : $signed(_GEN_124); // @[FFTEngine.scala 482:{29,29}]
  wire  _fftCalc_io_dataInSI_T_1 = sameAddr1c & _T_12; // @[FFTEngine.scala 483:47]
  wire [15:0] _GEN_128 = 3'h1 == addrSBankSel1c ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_129 = 3'h2 == addrSBankSel1c ? $signed(dataInPre_2_im) : $signed(_GEN_128); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_130 = 3'h3 == addrSBankSel1c ? $signed(dataInPre_3_im) : $signed(_GEN_129); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_131 = 3'h4 == addrSBankSel1c ? $signed(dataInPre_4_im) : $signed(_GEN_130); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_132 = 3'h5 == addrSBankSel1c ? $signed(dataInPre_5_im) : $signed(_GEN_131); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_133 = 3'h6 == addrSBankSel1c ? $signed(dataInPre_6_im) : $signed(_GEN_132); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_134 = 3'h7 == addrSBankSel1c ? $signed(dataInPre_7_im) : $signed(_GEN_133); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_136 = 3'h1 == addrTBankSel1c ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_137 = 3'h2 == addrTBankSel1c ? $signed(dataInPre_2_im) : $signed(_GEN_136); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_138 = 3'h3 == addrTBankSel1c ? $signed(dataInPre_3_im) : $signed(_GEN_137); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_139 = 3'h4 == addrTBankSel1c ? $signed(dataInPre_4_im) : $signed(_GEN_138); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_140 = 3'h5 == addrTBankSel1c ? $signed(dataInPre_5_im) : $signed(_GEN_139); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_141 = 3'h6 == addrTBankSel1c ? $signed(dataInPre_6_im) : $signed(_GEN_140); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_142 = 3'h7 == addrTBankSel1c ? $signed(dataInPre_7_im) : $signed(_GEN_141); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_144 = 3'h1 == addrTBankSel1c ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_145 = 3'h2 == addrTBankSel1c ? $signed(dataInPre_2_re) : $signed(_GEN_144); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_146 = 3'h3 == addrTBankSel1c ? $signed(dataInPre_3_re) : $signed(_GEN_145); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_147 = 3'h4 == addrTBankSel1c ? $signed(dataInPre_4_re) : $signed(_GEN_146); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_148 = 3'h5 == addrTBankSel1c ? $signed(dataInPre_5_re) : $signed(_GEN_147); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_149 = 3'h6 == addrTBankSel1c ? $signed(dataInPre_6_re) : $signed(_GEN_148); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_150 = 3'h7 == addrTBankSel1c ? $signed(dataInPre_7_re) : $signed(_GEN_149); // @[FFTEngine.scala 484:{35,35}]
  wire [9:0] _fftCalc_io_nk_T_2 = {nk_0[8:0],1'h0}; // @[Cat.scala 33:92]
  wire  _GEN_160 = 4'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_161 = 4'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_160; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_162 = 4'h3 == phaseCount ? io_fftRShiftP0_3 : _GEN_161; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_163 = 4'h4 == phaseCount ? io_fftRShiftP0_4 : _GEN_162; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_164 = 4'h5 == phaseCount ? io_fftRShiftP0_5 : _GEN_163; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_165 = 4'h6 == phaseCount ? io_fftRShiftP0_6 : _GEN_164; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_166 = 4'h7 == phaseCount ? io_fftRShiftP0_7 : _GEN_165; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_167 = 4'h8 == phaseCount ? io_fftRShiftP0_8 : _GEN_166; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_168 = 4'h9 == phaseCount ? io_fftRShiftP0_9 : _GEN_167; // @[FFTEngine.scala 491:{36,36}]
  wire [15:0] _writeDataTRPre3c_T_3 = 16'sh0 - $signed(fftCalc_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_4 = io_fftMode ? $signed(fftCalc_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_3); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_5 = _T_12 ? $signed(fftCalc_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_4); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c = procState3c ? $signed(_writeDataTRPre3c_T_5) : $signed(fftCalc_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_6 = 16'sh0 - $signed(fftCalc_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_7 = io_fftMode ? $signed(_writeDataTIPre3c_T_6) : $signed(fftCalc_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_8 = _T_12 ? $signed(_writeDataTRPre3c_T_3) : $signed(_writeDataTIPre3c_T_7); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c = procState3c ? $signed(_writeDataTIPre3c_T_8) : $signed(fftCalc_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire  _addrSBankSel3c_T_1 = kernelState3c & _T_6; // @[FFTEngine.scala 505:64]
  wire  _addrSBankSel3c_T_2 = procState3c | kernelState3c & _T_6; // @[FFTEngine.scala 505:47]
  wire [2:0] _addrSBankSel3c_T_3 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_0_r :
    addrSBankSelKernel3c_0_r; // @[FFTEngine.scala 505:34]
  wire [2:0] _addrTBankSel3c_T_3 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_0_r : addrTBankSelKernel3c_0_r; // @[FFTEngine.scala 506:34]
  wire [2:0] _addrSBankSel3c_T_4 = procState3c ? addrSBankSelProc3c_0_r : addrSBankSelKernel3c_0_r; // @[FFTEngine.scala 508:34]
  wire [2:0] _addrTBankSel3c_T_4 = procState3c ? addrTBankSelProc3c_0_r : addrTBankSelKernel3c_0_r; // @[FFTEngine.scala 509:34]
  wire [2:0] addrSBankSel3c = io_fftMode ? _addrSBankSel3c_T_3 : _addrSBankSel3c_T_4; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [2:0] addrTBankSel3c = io_fftMode ? _addrTBankSel3c_T_3 : _addrTBankSel3c_T_4; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire  _GEN_171 = (3'h0 == addrSBankSelProc3c_0_r | 3'h0 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_172 = (3'h0 == addrSBankSelProc3c_0_r | 3'h0 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_175 = (3'h1 == addrSBankSelProc3c_0_r | 3'h1 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_176 = (3'h1 == addrSBankSelProc3c_0_r | 3'h1 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_179 = (3'h2 == addrSBankSelProc3c_0_r | 3'h2 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_180 = (3'h2 == addrSBankSelProc3c_0_r | 3'h2 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_183 = (3'h3 == addrSBankSelProc3c_0_r | 3'h3 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_184 = (3'h3 == addrSBankSelProc3c_0_r | 3'h3 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_187 = (3'h4 == addrSBankSelProc3c_0_r | 3'h4 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_188 = (3'h4 == addrSBankSelProc3c_0_r | 3'h4 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_191 = (3'h5 == addrSBankSelProc3c_0_r | 3'h5 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_192 = (3'h5 == addrSBankSelProc3c_0_r | 3'h5 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_195 = (3'h6 == addrSBankSelProc3c_0_r | 3'h6 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_196 = (3'h6 == addrSBankSelProc3c_0_r | 3'h6 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_199 = (3'h7 == addrSBankSelProc3c_0_r | 3'h7 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_200 = (3'h7 == addrSBankSelProc3c_0_r | 3'h7 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire [6:0] _GEN_211 = 3'h0 == addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_212 = 3'h1 == addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_213 = 3'h2 == addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_214 = 3'h3 == addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_215 = 3'h4 == addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_216 = 3'h5 == addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_217 = 3'h6 == addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_218 = 3'h7 == addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_299 = ~_radixInit_T_11 ? _GEN_211 : _GEN_211; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_300 = ~_radixInit_T_11 ? _GEN_212 : _GEN_212; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_301 = ~_radixInit_T_11 ? _GEN_213 : _GEN_213; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_302 = ~_radixInit_T_11 ? _GEN_214 : _GEN_214; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_303 = ~_radixInit_T_11 ? _GEN_215 : _GEN_215; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_304 = ~_radixInit_T_11 ? _GEN_216 : _GEN_216; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_305 = ~_radixInit_T_11 ? _GEN_217 : _GEN_217; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_306 = ~_radixInit_T_11 ? _GEN_218 : _GEN_218; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_315 = 3'h0 == addrTBankSel3c ? addrT3c : _GEN_299; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_316 = 3'h1 == addrTBankSel3c ? addrT3c : _GEN_300; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_317 = 3'h2 == addrTBankSel3c ? addrT3c : _GEN_301; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_318 = 3'h3 == addrTBankSel3c ? addrT3c : _GEN_302; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_319 = 3'h4 == addrTBankSel3c ? addrT3c : _GEN_303; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_320 = 3'h5 == addrTBankSel3c ? addrT3c : _GEN_304; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_321 = 3'h6 == addrTBankSel3c ? addrT3c : _GEN_305; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_322 = 3'h7 == addrTBankSel3c ? addrT3c : _GEN_306; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_323 = 3'h0 == addrSBankSel3c ? addrS3c : _GEN_315; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_324 = 3'h1 == addrSBankSel3c ? addrS3c : _GEN_316; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_325 = 3'h2 == addrSBankSel3c ? addrS3c : _GEN_317; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_326 = 3'h3 == addrSBankSel3c ? addrS3c : _GEN_318; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_327 = 3'h4 == addrSBankSel3c ? addrS3c : _GEN_319; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_328 = 3'h5 == addrSBankSel3c ? addrS3c : _GEN_320; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_329 = 3'h6 == addrSBankSel3c ? addrS3c : _GEN_321; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_330 = 3'h7 == addrSBankSel3c ? addrS3c : _GEN_322; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_347 = _srcBufferNext_T_3 ? _GEN_323 : _GEN_299; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_348 = _srcBufferNext_T_3 ? _GEN_324 : _GEN_300; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_349 = _srcBufferNext_T_3 ? _GEN_325 : _GEN_301; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_350 = _srcBufferNext_T_3 ? _GEN_326 : _GEN_302; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_351 = _srcBufferNext_T_3 ? _GEN_327 : _GEN_303; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_352 = _srcBufferNext_T_3 ? _GEN_328 : _GEN_304; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_353 = _srcBufferNext_T_3 ? _GEN_329 : _GEN_305; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_354 = _srcBufferNext_T_3 ? _GEN_330 : _GEN_306; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_355 = _srcBufferNext_T_3 ? _GEN_299 : _GEN_323; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_356 = _srcBufferNext_T_3 ? _GEN_300 : _GEN_324; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_357 = _srcBufferNext_T_3 ? _GEN_301 : _GEN_325; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_358 = _srcBufferNext_T_3 ? _GEN_302 : _GEN_326; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_359 = _srcBufferNext_T_3 ? _GEN_303 : _GEN_327; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_360 = _srcBufferNext_T_3 ? _GEN_304 : _GEN_328; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_361 = _srcBufferNext_T_3 ? _GEN_305 : _GEN_329; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_362 = _srcBufferNext_T_3 ? _GEN_306 : _GEN_330; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_411 = ~procState3c ? _GEN_347 : _GEN_347; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_412 = ~procState3c ? _GEN_348 : _GEN_348; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_413 = ~procState3c ? _GEN_349 : _GEN_349; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_414 = ~procState3c ? _GEN_350 : _GEN_350; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_415 = ~procState3c ? _GEN_351 : _GEN_351; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_416 = ~procState3c ? _GEN_352 : _GEN_352; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_417 = ~procState3c ? _GEN_353 : _GEN_353; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_418 = ~procState3c ? _GEN_354 : _GEN_354; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_419 = ~procState3c ? _GEN_355 : _GEN_355; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_420 = ~procState3c ? _GEN_356 : _GEN_356; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_421 = ~procState3c ? _GEN_357 : _GEN_357; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_422 = ~procState3c ? _GEN_358 : _GEN_358; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_423 = ~procState3c ? _GEN_359 : _GEN_359; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_424 = ~procState3c ? _GEN_360 : _GEN_360; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_425 = ~procState3c ? _GEN_361 : _GEN_361; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_426 = ~procState3c ? _GEN_362 : _GEN_362; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T = fftCalc_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T = writeDataTRPre3c[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_427 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T[14]}},_writeDataS3c_re_T}) : $signed(
    fftCalc_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_428 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T[14]}},_writeDataS3c_im_T}) : $signed(
    fftCalc_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_432 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c) : $signed(_GEN_428); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_436 = fftCalc_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_im = sameAddr3c ? $signed(_GEN_432) : $signed(_GEN_436); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_429 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_im) : $signed(writeDataTIPre3c); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_431 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_io_dataOutSR3c) : $signed(_GEN_427); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_435 = fftCalc_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_re = sameAddr3c ? $signed(_GEN_431) : $signed(_GEN_435); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_430 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_re) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_433 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_im) : $signed(_GEN_429); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_434 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_re) : $signed(_GEN_430); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_2 = 16'sh0 - $signed(writeDataTIPre3c); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_438 = _addrSBankSel3c_T_1 & addrTBankSel3c == 3'h4 & addrT3c == 7'h1 ? $signed(_writeDataT3c_im_T_2)
     : $signed(writeDataTIPre3c); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T = sameAddr3c ? $signed(_GEN_431) : $signed(_GEN_435); // @[FFTEngine.scala 604:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_1 = sameAddr3c ? $signed(_GEN_432) : $signed(_GEN_436); // @[FFTEngine.scala 604:66]
  wire [31:0] _io_writeDataSram0Bank_0_T_2 = {_io_writeDataSram0Bank_0_T_1,_io_writeDataSram0Bank_0_T}; // @[FFTEngine.scala 604:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_3 = sameAddr3c ? $signed(_GEN_434) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 607:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_4 = sameAddr3c ? $signed(_GEN_433) : $signed(_GEN_438); // @[FFTEngine.scala 607:66]
  wire [31:0] _io_writeDataSram0Bank_0_T_5 = {_io_writeDataSram0Bank_0_T_4,_io_writeDataSram0Bank_0_T_3}; // @[FFTEngine.scala 607:66]
  wire [31:0] _GEN_445 = 3'h0 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_451 = procState3c ? _GEN_445 : _GEN_445; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_455 = 3'h1 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_461 = procState3c ? _GEN_455 : _GEN_455; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_465 = 3'h2 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_471 = procState3c ? _GEN_465 : _GEN_465; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_475 = 3'h3 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_481 = procState3c ? _GEN_475 : _GEN_475; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_485 = 3'h4 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_491 = procState3c ? _GEN_485 : _GEN_485; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_495 = 3'h5 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_501 = procState3c ? _GEN_495 : _GEN_495; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_505 = 3'h6 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_511 = procState3c ? _GEN_505 : _GEN_505; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_515 = 3'h7 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_521 = procState3c ? _GEN_515 : _GEN_515; // @[FFTEngine.scala 601:30]
  reg [6:0] addrS1c_1; // @[Reg.scala 35:20]
  reg [6:0] addrS2c_1; // @[Reg.scala 35:20]
  reg [6:0] addrS3c_1; // @[Reg.scala 35:20]
  reg [6:0] addrT1c_1; // @[Reg.scala 35:20]
  reg [6:0] addrT2c_1; // @[Reg.scala 35:20]
  reg [6:0] addrT3c_1; // @[Reg.scala 35:20]
  wire [2:0] _addrSBankSel_T_6 = _radixInit_T_11 ? addrSBankSelProc_1 : addrSBankSelKernel_1; // @[FFTEngine.scala 471:32]
  wire [2:0] _addrTBankSel_T_6 = _radixInit_T_11 ? addrTBankSelProc_1 : addrTBankSelKernel_1; // @[FFTEngine.scala 472:32]
  wire [2:0] _addrSBankSel_T_10 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 4'h0 ? addrSBankSelProc_1 :
    addrSBankSelKernel_1; // @[FFTEngine.scala 474:32]
  wire [2:0] _addrTBankSel_T_10 = _addrSBankSel_T_4 ? addrTBankSelProc_1 : addrTBankSelKernel_1; // @[FFTEngine.scala 475:32]
  wire [2:0] addrSBankSel_1 = io_fftMode ? _addrSBankSel_T_6 : _addrSBankSel_T_10; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [2:0] addrTBankSel_1 = io_fftMode ? _addrTBankSel_T_6 : _addrTBankSel_T_10; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [2:0] addrSBankSel1c_1; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_1; // @[Reg.scala 35:20]
  wire [15:0] _GEN_534 = 3'h1 == addrSBankSel1c_1 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_535 = 3'h2 == addrSBankSel1c_1 ? $signed(dataInPre_2_re) : $signed(_GEN_534); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_536 = 3'h3 == addrSBankSel1c_1 ? $signed(dataInPre_3_re) : $signed(_GEN_535); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_537 = 3'h4 == addrSBankSel1c_1 ? $signed(dataInPre_4_re) : $signed(_GEN_536); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_538 = 3'h5 == addrSBankSel1c_1 ? $signed(dataInPre_5_re) : $signed(_GEN_537); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_539 = 3'h6 == addrSBankSel1c_1 ? $signed(dataInPre_6_re) : $signed(_GEN_538); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_542 = 3'h1 == addrSBankSel1c_1 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_543 = 3'h2 == addrSBankSel1c_1 ? $signed(dataInPre_2_im) : $signed(_GEN_542); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_544 = 3'h3 == addrSBankSel1c_1 ? $signed(dataInPre_3_im) : $signed(_GEN_543); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_545 = 3'h4 == addrSBankSel1c_1 ? $signed(dataInPre_4_im) : $signed(_GEN_544); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_546 = 3'h5 == addrSBankSel1c_1 ? $signed(dataInPre_5_im) : $signed(_GEN_545); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_547 = 3'h6 == addrSBankSel1c_1 ? $signed(dataInPre_6_im) : $signed(_GEN_546); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_548 = 3'h7 == addrSBankSel1c_1 ? $signed(dataInPre_7_im) : $signed(_GEN_547); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_550 = 3'h1 == addrTBankSel1c_1 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_551 = 3'h2 == addrTBankSel1c_1 ? $signed(dataInPre_2_im) : $signed(_GEN_550); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_552 = 3'h3 == addrTBankSel1c_1 ? $signed(dataInPre_3_im) : $signed(_GEN_551); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_553 = 3'h4 == addrTBankSel1c_1 ? $signed(dataInPre_4_im) : $signed(_GEN_552); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_554 = 3'h5 == addrTBankSel1c_1 ? $signed(dataInPre_5_im) : $signed(_GEN_553); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_555 = 3'h6 == addrTBankSel1c_1 ? $signed(dataInPre_6_im) : $signed(_GEN_554); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_556 = 3'h7 == addrTBankSel1c_1 ? $signed(dataInPre_7_im) : $signed(_GEN_555); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_558 = 3'h1 == addrTBankSel1c_1 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_559 = 3'h2 == addrTBankSel1c_1 ? $signed(dataInPre_2_re) : $signed(_GEN_558); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_560 = 3'h3 == addrTBankSel1c_1 ? $signed(dataInPre_3_re) : $signed(_GEN_559); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_561 = 3'h4 == addrTBankSel1c_1 ? $signed(dataInPre_4_re) : $signed(_GEN_560); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_562 = 3'h5 == addrTBankSel1c_1 ? $signed(dataInPre_5_re) : $signed(_GEN_561); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_563 = 3'h6 == addrTBankSel1c_1 ? $signed(dataInPre_6_re) : $signed(_GEN_562); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_564 = 3'h7 == addrTBankSel1c_1 ? $signed(dataInPre_7_re) : $signed(_GEN_563); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_9 = 16'sh0 - $signed(fftCalc_1_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_10 = io_fftMode ? $signed(fftCalc_1_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_9); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_11 = _T_12 ? $signed(fftCalc_1_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_10); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_1 = procState3c ? $signed(_writeDataTRPre3c_T_11) : $signed(fftCalc_1_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_15 = 16'sh0 - $signed(fftCalc_1_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_16 = io_fftMode ? $signed(_writeDataTIPre3c_T_15) : $signed(fftCalc_1_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_17 = _T_12 ? $signed(_writeDataTRPre3c_T_9) : $signed(_writeDataTIPre3c_T_16); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_1 = procState3c ? $signed(_writeDataTIPre3c_T_17) : $signed(fftCalc_1_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [2:0] _addrSBankSel3c_T_8 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_1_r :
    addrSBankSelKernel3c_1_r; // @[FFTEngine.scala 505:34]
  wire [2:0] _addrTBankSel3c_T_8 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_1_r : addrTBankSelKernel3c_1_r; // @[FFTEngine.scala 506:34]
  wire [2:0] _addrSBankSel3c_T_9 = procState3c ? addrSBankSelProc3c_1_r : addrSBankSelKernel3c_1_r; // @[FFTEngine.scala 508:34]
  wire [2:0] _addrTBankSel3c_T_9 = procState3c ? addrTBankSelProc3c_1_r : addrTBankSelKernel3c_1_r; // @[FFTEngine.scala 509:34]
  wire [2:0] addrSBankSel3c_1 = io_fftMode ? _addrSBankSel3c_T_8 : _addrSBankSel3c_T_9; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [2:0] addrTBankSel3c_1 = io_fftMode ? _addrTBankSel3c_T_8 : _addrTBankSel3c_T_9; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [6:0] _GEN_575 = 3'h0 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_419; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_576 = 3'h1 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_420; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_577 = 3'h2 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_421; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_578 = 3'h3 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_422; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_579 = 3'h4 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_423; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_580 = 3'h5 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_424; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_581 = 3'h6 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_425; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_582 = 3'h7 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_426; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_583 = 3'h0 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_575; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_584 = 3'h1 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_576; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_585 = 3'h2 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_577; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_586 = 3'h3 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_578; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_587 = 3'h4 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_579; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_588 = 3'h5 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_580; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_589 = 3'h6 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_581; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_590 = 3'h7 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_582; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_591 = 3'h0 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_411; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_592 = 3'h1 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_412; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_593 = 3'h2 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_413; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_594 = 3'h3 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_414; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_595 = 3'h4 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_415; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_596 = 3'h5 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_416; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_597 = 3'h6 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_417; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_598 = 3'h7 == addrTBankSel_1 ? addrT_1[6:0] : _GEN_418; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_599 = 3'h0 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_591; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_600 = 3'h1 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_592; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_601 = 3'h2 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_593; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_602 = 3'h3 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_594; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_603 = 3'h4 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_595; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_604 = 3'h5 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_596; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_605 = 3'h6 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_597; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_606 = 3'h7 == addrSBankSel_1 ? addrS_1[6:0] : _GEN_598; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_607 = _srcBufferNext_T_3 ? _GEN_583 : _GEN_419; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_608 = _srcBufferNext_T_3 ? _GEN_584 : _GEN_420; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_609 = _srcBufferNext_T_3 ? _GEN_585 : _GEN_421; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_610 = _srcBufferNext_T_3 ? _GEN_586 : _GEN_422; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_611 = _srcBufferNext_T_3 ? _GEN_587 : _GEN_423; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_612 = _srcBufferNext_T_3 ? _GEN_588 : _GEN_424; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_613 = _srcBufferNext_T_3 ? _GEN_589 : _GEN_425; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_614 = _srcBufferNext_T_3 ? _GEN_590 : _GEN_426; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_615 = _srcBufferNext_T_3 ? _GEN_411 : _GEN_599; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_616 = _srcBufferNext_T_3 ? _GEN_412 : _GEN_600; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_617 = _srcBufferNext_T_3 ? _GEN_413 : _GEN_601; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_618 = _srcBufferNext_T_3 ? _GEN_414 : _GEN_602; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_619 = _srcBufferNext_T_3 ? _GEN_415 : _GEN_603; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_620 = _srcBufferNext_T_3 ? _GEN_416 : _GEN_604; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_621 = _srcBufferNext_T_3 ? _GEN_417 : _GEN_605; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_622 = _srcBufferNext_T_3 ? _GEN_418 : _GEN_606; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_623 = ~_radixInit_T_11 ? _GEN_607 : _GEN_419; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_624 = ~_radixInit_T_11 ? _GEN_608 : _GEN_420; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_625 = ~_radixInit_T_11 ? _GEN_609 : _GEN_421; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_626 = ~_radixInit_T_11 ? _GEN_610 : _GEN_422; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_627 = ~_radixInit_T_11 ? _GEN_611 : _GEN_423; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_628 = ~_radixInit_T_11 ? _GEN_612 : _GEN_424; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_629 = ~_radixInit_T_11 ? _GEN_613 : _GEN_425; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_630 = ~_radixInit_T_11 ? _GEN_614 : _GEN_426; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_631 = ~_radixInit_T_11 ? _GEN_615 : _GEN_411; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_632 = ~_radixInit_T_11 ? _GEN_616 : _GEN_412; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_633 = ~_radixInit_T_11 ? _GEN_617 : _GEN_413; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_634 = ~_radixInit_T_11 ? _GEN_618 : _GEN_414; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_635 = ~_radixInit_T_11 ? _GEN_619 : _GEN_415; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_636 = ~_radixInit_T_11 ? _GEN_620 : _GEN_416; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_637 = ~_radixInit_T_11 ? _GEN_621 : _GEN_417; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_638 = ~_radixInit_T_11 ? _GEN_622 : _GEN_418; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_639 = 3'h0 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_631; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_640 = 3'h1 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_632; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_641 = 3'h2 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_633; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_642 = 3'h3 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_634; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_643 = 3'h4 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_635; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_644 = 3'h5 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_636; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_645 = 3'h6 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_637; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_646 = 3'h7 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_638; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_647 = 3'h0 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_639; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_648 = 3'h1 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_640; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_649 = 3'h2 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_641; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_650 = 3'h3 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_642; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_651 = 3'h4 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_643; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_652 = 3'h5 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_644; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_653 = 3'h6 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_645; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_654 = 3'h7 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_646; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_655 = 3'h0 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_623; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_656 = 3'h1 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_624; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_657 = 3'h2 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_625; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_658 = 3'h3 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_626; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_659 = 3'h4 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_627; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_660 = 3'h5 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_628; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_661 = 3'h6 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_629; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_662 = 3'h7 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_630; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_663 = 3'h0 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_655; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_664 = 3'h1 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_656; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_665 = 3'h2 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_657; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_666 = 3'h3 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_658; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_667 = 3'h4 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_659; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_668 = 3'h5 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_660; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_669 = 3'h6 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_661; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_670 = 3'h7 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_662; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_671 = _srcBufferNext_T_3 ? _GEN_647 : _GEN_631; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_672 = _srcBufferNext_T_3 ? _GEN_648 : _GEN_632; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_673 = _srcBufferNext_T_3 ? _GEN_649 : _GEN_633; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_674 = _srcBufferNext_T_3 ? _GEN_650 : _GEN_634; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_675 = _srcBufferNext_T_3 ? _GEN_651 : _GEN_635; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_676 = _srcBufferNext_T_3 ? _GEN_652 : _GEN_636; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_677 = _srcBufferNext_T_3 ? _GEN_653 : _GEN_637; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_678 = _srcBufferNext_T_3 ? _GEN_654 : _GEN_638; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_679 = _srcBufferNext_T_3 ? _GEN_623 : _GEN_663; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_680 = _srcBufferNext_T_3 ? _GEN_624 : _GEN_664; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_681 = _srcBufferNext_T_3 ? _GEN_625 : _GEN_665; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_682 = _srcBufferNext_T_3 ? _GEN_626 : _GEN_666; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_683 = _srcBufferNext_T_3 ? _GEN_627 : _GEN_667; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_684 = _srcBufferNext_T_3 ? _GEN_628 : _GEN_668; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_685 = _srcBufferNext_T_3 ? _GEN_629 : _GEN_669; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_686 = _srcBufferNext_T_3 ? _GEN_630 : _GEN_670; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_687 = ~procState3c ? _GEN_671 : _GEN_631; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_688 = ~procState3c ? _GEN_672 : _GEN_632; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_689 = ~procState3c ? _GEN_673 : _GEN_633; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_690 = ~procState3c ? _GEN_674 : _GEN_634; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_691 = ~procState3c ? _GEN_675 : _GEN_635; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_692 = ~procState3c ? _GEN_676 : _GEN_636; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_693 = ~procState3c ? _GEN_677 : _GEN_637; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_694 = ~procState3c ? _GEN_678 : _GEN_638; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_695 = ~procState3c ? _GEN_679 : _GEN_623; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_696 = ~procState3c ? _GEN_680 : _GEN_624; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_697 = ~procState3c ? _GEN_681 : _GEN_625; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_698 = ~procState3c ? _GEN_682 : _GEN_626; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_699 = ~procState3c ? _GEN_683 : _GEN_627; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_700 = ~procState3c ? _GEN_684 : _GEN_628; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_701 = ~procState3c ? _GEN_685 : _GEN_629; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_702 = ~procState3c ? _GEN_686 : _GEN_630; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_1 = fftCalc_1_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_1 = writeDataTRPre3c_1[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_703 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_1[14]}},_writeDataS3c_re_T_1}) : $signed(
    fftCalc_1_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_704 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_1[14]}},_writeDataS3c_im_T_1}) : $signed(
    fftCalc_1_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_708 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_1) : $signed(_GEN_704); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_712 = fftCalc_1_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_1_im = sameAddr3c ? $signed(_GEN_708) : $signed(_GEN_712); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_705 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_1_im) : $signed(writeDataTIPre3c_1); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_707 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_1_io_dataOutSR3c) : $signed(_GEN_703); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_711 = fftCalc_1_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_1_re = sameAddr3c ? $signed(_GEN_707) : $signed(_GEN_711); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_706 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_1_re) : $signed(writeDataTRPre3c_1); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_709 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_1_im) : $signed(_GEN_705); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_710 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_1_re) : $signed(_GEN_706); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_5 = 16'sh0 - $signed(writeDataTIPre3c_1); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_714 = _addrSBankSel3c_T_1 & addrTBankSel3c_1 == 3'h4 & addrT3c_1 == 7'h1 ? $signed(
    _writeDataT3c_im_T_5) : $signed(writeDataTIPre3c_1); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_12 = sameAddr3c ? $signed(_GEN_707) : $signed(_GEN_711); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_13 = sameAddr3c ? $signed(_GEN_708) : $signed(_GEN_712); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_14 = {_io_writeDataSram0Bank_0_T_13,_io_writeDataSram0Bank_0_T_12}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_15 = sameAddr3c ? $signed(_GEN_710) : $signed(writeDataTRPre3c_1); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_16 = sameAddr3c ? $signed(_GEN_709) : $signed(_GEN_714); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_17 = {_io_writeDataSram0Bank_0_T_16,_io_writeDataSram0Bank_0_T_15}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_719 = 3'h0 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_451; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_721 = 3'h0 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_719; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_723 = procState3c ? _GEN_451 : _GEN_721; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_725 = 3'h1 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_461; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_727 = 3'h1 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_725; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_729 = procState3c ? _GEN_461 : _GEN_727; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_731 = 3'h2 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_471; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_733 = 3'h2 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_731; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_735 = procState3c ? _GEN_471 : _GEN_733; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_737 = 3'h3 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_481; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_739 = 3'h3 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_737; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_741 = procState3c ? _GEN_481 : _GEN_739; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_743 = 3'h4 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_491; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_745 = 3'h4 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_743; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_747 = procState3c ? _GEN_491 : _GEN_745; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_749 = 3'h5 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_501; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_751 = 3'h5 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_749; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_753 = procState3c ? _GEN_501 : _GEN_751; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_755 = 3'h6 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_511; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_757 = 3'h6 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_755; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_759 = procState3c ? _GEN_511 : _GEN_757; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_761 = 3'h7 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_521; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_763 = 3'h7 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_761; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_765 = procState3c ? _GEN_521 : _GEN_763; // @[FFTEngine.scala 601:30]
  reg [6:0] addrS1c_2; // @[Reg.scala 35:20]
  reg [6:0] addrS2c_2; // @[Reg.scala 35:20]
  reg [6:0] addrS3c_2; // @[Reg.scala 35:20]
  reg [6:0] addrT1c_2; // @[Reg.scala 35:20]
  reg [6:0] addrT2c_2; // @[Reg.scala 35:20]
  reg [6:0] addrT3c_2; // @[Reg.scala 35:20]
  wire [2:0] _addrSBankSel_T_11 = _radixInit_T_11 ? addrSBankSelProc_2 : addrSBankSelKernel_2; // @[FFTEngine.scala 471:32]
  wire [2:0] _addrTBankSel_T_11 = _radixInit_T_11 ? addrTBankSelProc_2 : addrTBankSelKernel_2; // @[FFTEngine.scala 472:32]
  wire [2:0] _addrSBankSel_T_15 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 4'h0 ? addrSBankSelProc_2 :
    addrSBankSelKernel_2; // @[FFTEngine.scala 474:32]
  wire [2:0] _addrTBankSel_T_15 = _addrSBankSel_T_4 ? addrTBankSelProc_2 : addrTBankSelKernel_2; // @[FFTEngine.scala 475:32]
  wire [2:0] addrSBankSel_2 = io_fftMode ? _addrSBankSel_T_11 : _addrSBankSel_T_15; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [2:0] addrTBankSel_2 = io_fftMode ? _addrTBankSel_T_11 : _addrTBankSel_T_15; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [2:0] addrSBankSel1c_2; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_2; // @[Reg.scala 35:20]
  wire [15:0] _GEN_778 = 3'h1 == addrSBankSel1c_2 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_779 = 3'h2 == addrSBankSel1c_2 ? $signed(dataInPre_2_re) : $signed(_GEN_778); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_780 = 3'h3 == addrSBankSel1c_2 ? $signed(dataInPre_3_re) : $signed(_GEN_779); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_781 = 3'h4 == addrSBankSel1c_2 ? $signed(dataInPre_4_re) : $signed(_GEN_780); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_782 = 3'h5 == addrSBankSel1c_2 ? $signed(dataInPre_5_re) : $signed(_GEN_781); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_783 = 3'h6 == addrSBankSel1c_2 ? $signed(dataInPre_6_re) : $signed(_GEN_782); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_786 = 3'h1 == addrSBankSel1c_2 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_787 = 3'h2 == addrSBankSel1c_2 ? $signed(dataInPre_2_im) : $signed(_GEN_786); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_788 = 3'h3 == addrSBankSel1c_2 ? $signed(dataInPre_3_im) : $signed(_GEN_787); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_789 = 3'h4 == addrSBankSel1c_2 ? $signed(dataInPre_4_im) : $signed(_GEN_788); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_790 = 3'h5 == addrSBankSel1c_2 ? $signed(dataInPre_5_im) : $signed(_GEN_789); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_791 = 3'h6 == addrSBankSel1c_2 ? $signed(dataInPre_6_im) : $signed(_GEN_790); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_792 = 3'h7 == addrSBankSel1c_2 ? $signed(dataInPre_7_im) : $signed(_GEN_791); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_794 = 3'h1 == addrTBankSel1c_2 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_795 = 3'h2 == addrTBankSel1c_2 ? $signed(dataInPre_2_im) : $signed(_GEN_794); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_796 = 3'h3 == addrTBankSel1c_2 ? $signed(dataInPre_3_im) : $signed(_GEN_795); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_797 = 3'h4 == addrTBankSel1c_2 ? $signed(dataInPre_4_im) : $signed(_GEN_796); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_798 = 3'h5 == addrTBankSel1c_2 ? $signed(dataInPre_5_im) : $signed(_GEN_797); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_799 = 3'h6 == addrTBankSel1c_2 ? $signed(dataInPre_6_im) : $signed(_GEN_798); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_800 = 3'h7 == addrTBankSel1c_2 ? $signed(dataInPre_7_im) : $signed(_GEN_799); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_802 = 3'h1 == addrTBankSel1c_2 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_803 = 3'h2 == addrTBankSel1c_2 ? $signed(dataInPre_2_re) : $signed(_GEN_802); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_804 = 3'h3 == addrTBankSel1c_2 ? $signed(dataInPre_3_re) : $signed(_GEN_803); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_805 = 3'h4 == addrTBankSel1c_2 ? $signed(dataInPre_4_re) : $signed(_GEN_804); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_806 = 3'h5 == addrTBankSel1c_2 ? $signed(dataInPre_5_re) : $signed(_GEN_805); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_807 = 3'h6 == addrTBankSel1c_2 ? $signed(dataInPre_6_re) : $signed(_GEN_806); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_808 = 3'h7 == addrTBankSel1c_2 ? $signed(dataInPre_7_re) : $signed(_GEN_807); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_15 = 16'sh0 - $signed(fftCalc_2_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_16 = io_fftMode ? $signed(fftCalc_2_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_15); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_17 = _T_12 ? $signed(fftCalc_2_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_16); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_2 = procState3c ? $signed(_writeDataTRPre3c_T_17) : $signed(fftCalc_2_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_24 = 16'sh0 - $signed(fftCalc_2_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_25 = io_fftMode ? $signed(_writeDataTIPre3c_T_24) : $signed(fftCalc_2_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_26 = _T_12 ? $signed(_writeDataTRPre3c_T_15) : $signed(_writeDataTIPre3c_T_25); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_2 = procState3c ? $signed(_writeDataTIPre3c_T_26) : $signed(fftCalc_2_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [2:0] _addrSBankSel3c_T_13 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_2_r :
    addrSBankSelKernel3c_2_r; // @[FFTEngine.scala 505:34]
  wire [2:0] _addrTBankSel3c_T_13 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_2_r : addrTBankSelKernel3c_2_r; // @[FFTEngine.scala 506:34]
  wire [2:0] _addrSBankSel3c_T_14 = procState3c ? addrSBankSelProc3c_2_r : addrSBankSelKernel3c_2_r; // @[FFTEngine.scala 508:34]
  wire [2:0] _addrTBankSel3c_T_14 = procState3c ? addrTBankSelProc3c_2_r : addrTBankSelKernel3c_2_r; // @[FFTEngine.scala 509:34]
  wire [2:0] addrSBankSel3c_2 = io_fftMode ? _addrSBankSel3c_T_13 : _addrSBankSel3c_T_14; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [2:0] addrTBankSel3c_2 = io_fftMode ? _addrTBankSel3c_T_13 : _addrTBankSel3c_T_14; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [6:0] _GEN_819 = 3'h0 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_695; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_820 = 3'h1 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_696; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_821 = 3'h2 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_697; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_822 = 3'h3 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_698; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_823 = 3'h4 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_699; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_824 = 3'h5 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_700; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_825 = 3'h6 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_701; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_826 = 3'h7 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_702; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_827 = 3'h0 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_819; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_828 = 3'h1 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_820; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_829 = 3'h2 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_821; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_830 = 3'h3 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_822; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_831 = 3'h4 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_823; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_832 = 3'h5 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_824; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_833 = 3'h6 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_825; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_834 = 3'h7 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_826; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_835 = 3'h0 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_687; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_836 = 3'h1 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_688; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_837 = 3'h2 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_689; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_838 = 3'h3 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_690; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_839 = 3'h4 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_691; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_840 = 3'h5 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_692; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_841 = 3'h6 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_693; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_842 = 3'h7 == addrTBankSel_2 ? addrT_2[6:0] : _GEN_694; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_843 = 3'h0 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_835; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_844 = 3'h1 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_836; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_845 = 3'h2 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_837; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_846 = 3'h3 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_838; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_847 = 3'h4 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_839; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_848 = 3'h5 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_840; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_849 = 3'h6 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_841; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_850 = 3'h7 == addrSBankSel_2 ? addrS_2[6:0] : _GEN_842; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_851 = _srcBufferNext_T_3 ? _GEN_827 : _GEN_695; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_852 = _srcBufferNext_T_3 ? _GEN_828 : _GEN_696; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_853 = _srcBufferNext_T_3 ? _GEN_829 : _GEN_697; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_854 = _srcBufferNext_T_3 ? _GEN_830 : _GEN_698; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_855 = _srcBufferNext_T_3 ? _GEN_831 : _GEN_699; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_856 = _srcBufferNext_T_3 ? _GEN_832 : _GEN_700; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_857 = _srcBufferNext_T_3 ? _GEN_833 : _GEN_701; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_858 = _srcBufferNext_T_3 ? _GEN_834 : _GEN_702; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_859 = _srcBufferNext_T_3 ? _GEN_687 : _GEN_843; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_860 = _srcBufferNext_T_3 ? _GEN_688 : _GEN_844; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_861 = _srcBufferNext_T_3 ? _GEN_689 : _GEN_845; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_862 = _srcBufferNext_T_3 ? _GEN_690 : _GEN_846; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_863 = _srcBufferNext_T_3 ? _GEN_691 : _GEN_847; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_864 = _srcBufferNext_T_3 ? _GEN_692 : _GEN_848; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_865 = _srcBufferNext_T_3 ? _GEN_693 : _GEN_849; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_866 = _srcBufferNext_T_3 ? _GEN_694 : _GEN_850; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_867 = ~_radixInit_T_11 ? _GEN_851 : _GEN_695; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_868 = ~_radixInit_T_11 ? _GEN_852 : _GEN_696; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_869 = ~_radixInit_T_11 ? _GEN_853 : _GEN_697; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_870 = ~_radixInit_T_11 ? _GEN_854 : _GEN_698; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_871 = ~_radixInit_T_11 ? _GEN_855 : _GEN_699; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_872 = ~_radixInit_T_11 ? _GEN_856 : _GEN_700; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_873 = ~_radixInit_T_11 ? _GEN_857 : _GEN_701; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_874 = ~_radixInit_T_11 ? _GEN_858 : _GEN_702; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_875 = ~_radixInit_T_11 ? _GEN_859 : _GEN_687; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_876 = ~_radixInit_T_11 ? _GEN_860 : _GEN_688; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_877 = ~_radixInit_T_11 ? _GEN_861 : _GEN_689; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_878 = ~_radixInit_T_11 ? _GEN_862 : _GEN_690; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_879 = ~_radixInit_T_11 ? _GEN_863 : _GEN_691; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_880 = ~_radixInit_T_11 ? _GEN_864 : _GEN_692; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_881 = ~_radixInit_T_11 ? _GEN_865 : _GEN_693; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_882 = ~_radixInit_T_11 ? _GEN_866 : _GEN_694; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_883 = 3'h0 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_875; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_884 = 3'h1 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_876; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_885 = 3'h2 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_877; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_886 = 3'h3 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_878; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_887 = 3'h4 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_879; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_888 = 3'h5 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_880; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_889 = 3'h6 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_881; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_890 = 3'h7 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_882; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_891 = 3'h0 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_883; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_892 = 3'h1 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_884; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_893 = 3'h2 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_885; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_894 = 3'h3 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_886; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_895 = 3'h4 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_887; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_896 = 3'h5 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_888; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_897 = 3'h6 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_889; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_898 = 3'h7 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_890; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_899 = 3'h0 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_867; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_900 = 3'h1 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_868; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_901 = 3'h2 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_869; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_902 = 3'h3 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_870; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_903 = 3'h4 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_871; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_904 = 3'h5 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_872; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_905 = 3'h6 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_873; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_906 = 3'h7 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_874; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_907 = 3'h0 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_899; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_908 = 3'h1 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_900; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_909 = 3'h2 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_901; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_910 = 3'h3 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_902; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_911 = 3'h4 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_903; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_912 = 3'h5 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_904; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_913 = 3'h6 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_905; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_914 = 3'h7 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_906; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_915 = _srcBufferNext_T_3 ? _GEN_891 : _GEN_875; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_916 = _srcBufferNext_T_3 ? _GEN_892 : _GEN_876; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_917 = _srcBufferNext_T_3 ? _GEN_893 : _GEN_877; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_918 = _srcBufferNext_T_3 ? _GEN_894 : _GEN_878; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_919 = _srcBufferNext_T_3 ? _GEN_895 : _GEN_879; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_920 = _srcBufferNext_T_3 ? _GEN_896 : _GEN_880; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_921 = _srcBufferNext_T_3 ? _GEN_897 : _GEN_881; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_922 = _srcBufferNext_T_3 ? _GEN_898 : _GEN_882; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_923 = _srcBufferNext_T_3 ? _GEN_867 : _GEN_907; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_924 = _srcBufferNext_T_3 ? _GEN_868 : _GEN_908; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_925 = _srcBufferNext_T_3 ? _GEN_869 : _GEN_909; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_926 = _srcBufferNext_T_3 ? _GEN_870 : _GEN_910; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_927 = _srcBufferNext_T_3 ? _GEN_871 : _GEN_911; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_928 = _srcBufferNext_T_3 ? _GEN_872 : _GEN_912; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_929 = _srcBufferNext_T_3 ? _GEN_873 : _GEN_913; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_930 = _srcBufferNext_T_3 ? _GEN_874 : _GEN_914; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_931 = ~procState3c ? _GEN_915 : _GEN_875; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_932 = ~procState3c ? _GEN_916 : _GEN_876; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_933 = ~procState3c ? _GEN_917 : _GEN_877; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_934 = ~procState3c ? _GEN_918 : _GEN_878; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_935 = ~procState3c ? _GEN_919 : _GEN_879; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_936 = ~procState3c ? _GEN_920 : _GEN_880; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_937 = ~procState3c ? _GEN_921 : _GEN_881; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_938 = ~procState3c ? _GEN_922 : _GEN_882; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_939 = ~procState3c ? _GEN_923 : _GEN_867; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_940 = ~procState3c ? _GEN_924 : _GEN_868; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_941 = ~procState3c ? _GEN_925 : _GEN_869; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_942 = ~procState3c ? _GEN_926 : _GEN_870; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_943 = ~procState3c ? _GEN_927 : _GEN_871; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_944 = ~procState3c ? _GEN_928 : _GEN_872; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_945 = ~procState3c ? _GEN_929 : _GEN_873; // @[FFTEngine.scala 549:28]
  wire [6:0] _GEN_946 = ~procState3c ? _GEN_930 : _GEN_874; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_2 = fftCalc_2_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_2 = writeDataTRPre3c_2[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_947 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_2[14]}},_writeDataS3c_re_T_2}) : $signed(
    fftCalc_2_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_948 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_2[14]}},_writeDataS3c_im_T_2}) : $signed(
    fftCalc_2_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_952 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_2) : $signed(_GEN_948); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_956 = fftCalc_2_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_2_im = sameAddr3c ? $signed(_GEN_952) : $signed(_GEN_956); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_949 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_2_im) : $signed(writeDataTIPre3c_2); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_951 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_2_io_dataOutSR3c) : $signed(_GEN_947); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_955 = fftCalc_2_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_2_re = sameAddr3c ? $signed(_GEN_951) : $signed(_GEN_955); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_950 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_2_re) : $signed(writeDataTRPre3c_2); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_953 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_2_im) : $signed(_GEN_949); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_954 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_2_re) : $signed(_GEN_950); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_8 = 16'sh0 - $signed(writeDataTIPre3c_2); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_958 = _addrSBankSel3c_T_1 & addrTBankSel3c_2 == 3'h4 & addrT3c_2 == 7'h1 ? $signed(
    _writeDataT3c_im_T_8) : $signed(writeDataTIPre3c_2); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_18 = sameAddr3c ? $signed(_GEN_951) : $signed(_GEN_955); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_19 = sameAddr3c ? $signed(_GEN_952) : $signed(_GEN_956); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_20 = {_io_writeDataSram0Bank_0_T_19,_io_writeDataSram0Bank_0_T_18}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_21 = sameAddr3c ? $signed(_GEN_954) : $signed(writeDataTRPre3c_2); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_22 = sameAddr3c ? $signed(_GEN_953) : $signed(_GEN_958); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_23 = {_io_writeDataSram0Bank_0_T_22,_io_writeDataSram0Bank_0_T_21}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_963 = 3'h0 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_723; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_965 = 3'h0 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_963; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_967 = procState3c ? _GEN_723 : _GEN_965; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_969 = 3'h1 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_729; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_971 = 3'h1 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_969; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_973 = procState3c ? _GEN_729 : _GEN_971; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_975 = 3'h2 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_735; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_977 = 3'h2 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_975; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_979 = procState3c ? _GEN_735 : _GEN_977; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_981 = 3'h3 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_741; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_983 = 3'h3 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_981; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_985 = procState3c ? _GEN_741 : _GEN_983; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_987 = 3'h4 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_747; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_989 = 3'h4 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_987; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_991 = procState3c ? _GEN_747 : _GEN_989; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_993 = 3'h5 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_753; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_995 = 3'h5 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_993; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_997 = procState3c ? _GEN_753 : _GEN_995; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_999 = 3'h6 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_759; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1001 = 3'h6 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_999; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1003 = procState3c ? _GEN_759 : _GEN_1001; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1005 = 3'h7 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_765; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1007 = 3'h7 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1005; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1009 = procState3c ? _GEN_765 : _GEN_1007; // @[FFTEngine.scala 601:30]
  reg [6:0] addrS1c_3; // @[Reg.scala 35:20]
  reg [6:0] addrS2c_3; // @[Reg.scala 35:20]
  reg [6:0] addrS3c_3; // @[Reg.scala 35:20]
  reg [6:0] addrT1c_3; // @[Reg.scala 35:20]
  reg [6:0] addrT2c_3; // @[Reg.scala 35:20]
  reg [6:0] addrT3c_3; // @[Reg.scala 35:20]
  wire [2:0] _addrSBankSel_T_16 = _radixInit_T_11 ? addrSBankSelProc_3 : addrSBankSelKernel_3; // @[FFTEngine.scala 471:32]
  wire [2:0] _addrTBankSel_T_16 = _radixInit_T_11 ? addrTBankSelProc_3 : addrTBankSelKernel_3; // @[FFTEngine.scala 472:32]
  wire [2:0] _addrSBankSel_T_20 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 4'h0 ? addrSBankSelProc_3 :
    addrSBankSelKernel_3; // @[FFTEngine.scala 474:32]
  wire [2:0] _addrTBankSel_T_20 = _addrSBankSel_T_4 ? addrTBankSelProc_3 : addrTBankSelKernel_3; // @[FFTEngine.scala 475:32]
  wire [2:0] addrSBankSel_3 = io_fftMode ? _addrSBankSel_T_16 : _addrSBankSel_T_20; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [2:0] addrTBankSel_3 = io_fftMode ? _addrTBankSel_T_16 : _addrTBankSel_T_20; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [2:0] addrSBankSel1c_3; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_3; // @[Reg.scala 35:20]
  wire [15:0] _GEN_1022 = 3'h1 == addrSBankSel1c_3 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1023 = 3'h2 == addrSBankSel1c_3 ? $signed(dataInPre_2_re) : $signed(_GEN_1022); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1024 = 3'h3 == addrSBankSel1c_3 ? $signed(dataInPre_3_re) : $signed(_GEN_1023); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1025 = 3'h4 == addrSBankSel1c_3 ? $signed(dataInPre_4_re) : $signed(_GEN_1024); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1026 = 3'h5 == addrSBankSel1c_3 ? $signed(dataInPre_5_re) : $signed(_GEN_1025); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1027 = 3'h6 == addrSBankSel1c_3 ? $signed(dataInPre_6_re) : $signed(_GEN_1026); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1030 = 3'h1 == addrSBankSel1c_3 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1031 = 3'h2 == addrSBankSel1c_3 ? $signed(dataInPre_2_im) : $signed(_GEN_1030); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1032 = 3'h3 == addrSBankSel1c_3 ? $signed(dataInPre_3_im) : $signed(_GEN_1031); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1033 = 3'h4 == addrSBankSel1c_3 ? $signed(dataInPre_4_im) : $signed(_GEN_1032); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1034 = 3'h5 == addrSBankSel1c_3 ? $signed(dataInPre_5_im) : $signed(_GEN_1033); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1035 = 3'h6 == addrSBankSel1c_3 ? $signed(dataInPre_6_im) : $signed(_GEN_1034); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1036 = 3'h7 == addrSBankSel1c_3 ? $signed(dataInPre_7_im) : $signed(_GEN_1035); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1038 = 3'h1 == addrTBankSel1c_3 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1039 = 3'h2 == addrTBankSel1c_3 ? $signed(dataInPre_2_im) : $signed(_GEN_1038); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1040 = 3'h3 == addrTBankSel1c_3 ? $signed(dataInPre_3_im) : $signed(_GEN_1039); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1041 = 3'h4 == addrTBankSel1c_3 ? $signed(dataInPre_4_im) : $signed(_GEN_1040); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1042 = 3'h5 == addrTBankSel1c_3 ? $signed(dataInPre_5_im) : $signed(_GEN_1041); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1043 = 3'h6 == addrTBankSel1c_3 ? $signed(dataInPre_6_im) : $signed(_GEN_1042); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1044 = 3'h7 == addrTBankSel1c_3 ? $signed(dataInPre_7_im) : $signed(_GEN_1043); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1046 = 3'h1 == addrTBankSel1c_3 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1047 = 3'h2 == addrTBankSel1c_3 ? $signed(dataInPre_2_re) : $signed(_GEN_1046); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1048 = 3'h3 == addrTBankSel1c_3 ? $signed(dataInPre_3_re) : $signed(_GEN_1047); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1049 = 3'h4 == addrTBankSel1c_3 ? $signed(dataInPre_4_re) : $signed(_GEN_1048); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1050 = 3'h5 == addrTBankSel1c_3 ? $signed(dataInPre_5_re) : $signed(_GEN_1049); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1051 = 3'h6 == addrTBankSel1c_3 ? $signed(dataInPre_6_re) : $signed(_GEN_1050); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1052 = 3'h7 == addrTBankSel1c_3 ? $signed(dataInPre_7_re) : $signed(_GEN_1051); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_21 = 16'sh0 - $signed(fftCalc_3_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_22 = io_fftMode ? $signed(fftCalc_3_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_21); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_23 = _T_12 ? $signed(fftCalc_3_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_22); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_3 = procState3c ? $signed(_writeDataTRPre3c_T_23) : $signed(fftCalc_3_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_33 = 16'sh0 - $signed(fftCalc_3_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_34 = io_fftMode ? $signed(_writeDataTIPre3c_T_33) : $signed(fftCalc_3_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_35 = _T_12 ? $signed(_writeDataTRPre3c_T_21) : $signed(_writeDataTIPre3c_T_34); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_3 = procState3c ? $signed(_writeDataTIPre3c_T_35) : $signed(fftCalc_3_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [2:0] _addrSBankSel3c_T_18 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_3_r :
    addrSBankSelKernel3c_3_r; // @[FFTEngine.scala 505:34]
  wire [2:0] _addrTBankSel3c_T_18 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_3_r : addrTBankSelKernel3c_3_r; // @[FFTEngine.scala 506:34]
  wire [2:0] _addrSBankSel3c_T_19 = procState3c ? addrSBankSelProc3c_3_r : addrSBankSelKernel3c_3_r; // @[FFTEngine.scala 508:34]
  wire [2:0] _addrTBankSel3c_T_19 = procState3c ? addrTBankSelProc3c_3_r : addrTBankSelKernel3c_3_r; // @[FFTEngine.scala 509:34]
  wire [2:0] addrSBankSel3c_3 = io_fftMode ? _addrSBankSel3c_T_18 : _addrSBankSel3c_T_19; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [2:0] addrTBankSel3c_3 = io_fftMode ? _addrTBankSel3c_T_18 : _addrTBankSel3c_T_19; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [6:0] _GEN_1063 = 3'h0 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_939; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_1064 = 3'h1 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_940; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_1065 = 3'h2 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_941; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_1066 = 3'h3 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_942; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_1067 = 3'h4 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_943; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_1068 = 3'h5 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_944; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_1069 = 3'h6 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_945; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_1070 = 3'h7 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_946; // @[FFTEngine.scala 531:{48,48}]
  wire [6:0] _GEN_1071 = 3'h0 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1063; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_1072 = 3'h1 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1064; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_1073 = 3'h2 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1065; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_1074 = 3'h3 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1066; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_1075 = 3'h4 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1067; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_1076 = 3'h5 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1068; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_1077 = 3'h6 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1069; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_1078 = 3'h7 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1070; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_1079 = 3'h0 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_931; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_1080 = 3'h1 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_932; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_1081 = 3'h2 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_933; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_1082 = 3'h3 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_934; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_1083 = 3'h4 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_935; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_1084 = 3'h5 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_936; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_1085 = 3'h6 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_937; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_1086 = 3'h7 == addrTBankSel_3 ? addrT_3[6:0] : _GEN_938; // @[FFTEngine.scala 534:{48,48}]
  wire [6:0] _GEN_1087 = 3'h0 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1079; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_1088 = 3'h1 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1080; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_1089 = 3'h2 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1081; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_1090 = 3'h3 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1082; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_1091 = 3'h4 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1083; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_1092 = 3'h5 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1084; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_1093 = 3'h6 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1085; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_1094 = 3'h7 == addrSBankSel_3 ? addrS_3[6:0] : _GEN_1086; // @[FFTEngine.scala 535:{48,48}]
  wire [6:0] _GEN_1095 = _srcBufferNext_T_3 ? _GEN_1071 : _GEN_939; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1096 = _srcBufferNext_T_3 ? _GEN_1072 : _GEN_940; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1097 = _srcBufferNext_T_3 ? _GEN_1073 : _GEN_941; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1098 = _srcBufferNext_T_3 ? _GEN_1074 : _GEN_942; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1099 = _srcBufferNext_T_3 ? _GEN_1075 : _GEN_943; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1100 = _srcBufferNext_T_3 ? _GEN_1076 : _GEN_944; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1101 = _srcBufferNext_T_3 ? _GEN_1077 : _GEN_945; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1102 = _srcBufferNext_T_3 ? _GEN_1078 : _GEN_946; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1103 = _srcBufferNext_T_3 ? _GEN_931 : _GEN_1087; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1104 = _srcBufferNext_T_3 ? _GEN_932 : _GEN_1088; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1105 = _srcBufferNext_T_3 ? _GEN_933 : _GEN_1089; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1106 = _srcBufferNext_T_3 ? _GEN_934 : _GEN_1090; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1107 = _srcBufferNext_T_3 ? _GEN_935 : _GEN_1091; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1108 = _srcBufferNext_T_3 ? _GEN_936 : _GEN_1092; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1109 = _srcBufferNext_T_3 ? _GEN_937 : _GEN_1093; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1110 = _srcBufferNext_T_3 ? _GEN_938 : _GEN_1094; // @[FFTEngine.scala 530:37]
  wire [6:0] _GEN_1111 = ~_radixInit_T_11 ? _GEN_1095 : _GEN_939; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1112 = ~_radixInit_T_11 ? _GEN_1096 : _GEN_940; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1113 = ~_radixInit_T_11 ? _GEN_1097 : _GEN_941; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1114 = ~_radixInit_T_11 ? _GEN_1098 : _GEN_942; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1115 = ~_radixInit_T_11 ? _GEN_1099 : _GEN_943; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1116 = ~_radixInit_T_11 ? _GEN_1100 : _GEN_944; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1117 = ~_radixInit_T_11 ? _GEN_1101 : _GEN_945; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1118 = ~_radixInit_T_11 ? _GEN_1102 : _GEN_946; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1119 = ~_radixInit_T_11 ? _GEN_1103 : _GEN_931; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1120 = ~_radixInit_T_11 ? _GEN_1104 : _GEN_932; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1121 = ~_radixInit_T_11 ? _GEN_1105 : _GEN_933; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1122 = ~_radixInit_T_11 ? _GEN_1106 : _GEN_934; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1123 = ~_radixInit_T_11 ? _GEN_1107 : _GEN_935; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1124 = ~_radixInit_T_11 ? _GEN_1108 : _GEN_936; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1125 = ~_radixInit_T_11 ? _GEN_1109 : _GEN_937; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1126 = ~_radixInit_T_11 ? _GEN_1110 : _GEN_938; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_1127 = 3'h0 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1119; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_1128 = 3'h1 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1120; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_1129 = 3'h2 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1121; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_1130 = 3'h3 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1122; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_1131 = 3'h4 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1123; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_1132 = 3'h5 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1124; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_1133 = 3'h6 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1125; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_1134 = 3'h7 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1126; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_1135 = 3'h0 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1127; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_1136 = 3'h1 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1128; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_1137 = 3'h2 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1129; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_1138 = 3'h3 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1130; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_1139 = 3'h4 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1131; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_1140 = 3'h5 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1132; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_1141 = 3'h6 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1133; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_1142 = 3'h7 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1134; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_1143 = 3'h0 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1111; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_1144 = 3'h1 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1112; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_1145 = 3'h2 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1113; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_1146 = 3'h3 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1114; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_1147 = 3'h4 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1115; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_1148 = 3'h5 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1116; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_1149 = 3'h6 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1117; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_1150 = 3'h7 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1118; // @[FFTEngine.scala 554:{50,50}]
  wire [6:0] _GEN_1151 = 3'h0 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1143; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_1152 = 3'h1 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1144; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_1153 = 3'h2 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1145; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_1154 = 3'h3 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1146; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_1155 = 3'h4 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1147; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_1156 = 3'h5 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1148; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_1157 = 3'h6 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1149; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_1158 = 3'h7 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1150; // @[FFTEngine.scala 555:{50,50}]
  wire [6:0] _GEN_1159 = _srcBufferNext_T_3 ? _GEN_1135 : _GEN_1119; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1160 = _srcBufferNext_T_3 ? _GEN_1136 : _GEN_1120; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1161 = _srcBufferNext_T_3 ? _GEN_1137 : _GEN_1121; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1162 = _srcBufferNext_T_3 ? _GEN_1138 : _GEN_1122; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1163 = _srcBufferNext_T_3 ? _GEN_1139 : _GEN_1123; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1164 = _srcBufferNext_T_3 ? _GEN_1140 : _GEN_1124; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1165 = _srcBufferNext_T_3 ? _GEN_1141 : _GEN_1125; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1166 = _srcBufferNext_T_3 ? _GEN_1142 : _GEN_1126; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1167 = _srcBufferNext_T_3 ? _GEN_1111 : _GEN_1151; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1168 = _srcBufferNext_T_3 ? _GEN_1112 : _GEN_1152; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1169 = _srcBufferNext_T_3 ? _GEN_1113 : _GEN_1153; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1170 = _srcBufferNext_T_3 ? _GEN_1114 : _GEN_1154; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1171 = _srcBufferNext_T_3 ? _GEN_1115 : _GEN_1155; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1172 = _srcBufferNext_T_3 ? _GEN_1116 : _GEN_1156; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1173 = _srcBufferNext_T_3 ? _GEN_1117 : _GEN_1157; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_1174 = _srcBufferNext_T_3 ? _GEN_1118 : _GEN_1158; // @[FFTEngine.scala 550:37]
  wire [14:0] _writeDataS3c_re_T_3 = fftCalc_3_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_3 = writeDataTRPre3c_3[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_1191 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_3[14]}},_writeDataS3c_re_T_3}) : $signed(
    fftCalc_3_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_1192 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_3[14]}},_writeDataS3c_im_T_3}) : $signed(
    fftCalc_3_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_1196 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_3) : $signed(_GEN_1192); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_1200 = fftCalc_3_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_3_im = sameAddr3c ? $signed(_GEN_1196) : $signed(_GEN_1200); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_1193 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_3_im) : $signed(writeDataTIPre3c_3); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_1195 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_3_io_dataOutSR3c) : $signed(_GEN_1191); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_1199 = fftCalc_3_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_3_re = sameAddr3c ? $signed(_GEN_1195) : $signed(_GEN_1199); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_1194 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_3_re) : $signed(writeDataTRPre3c_3); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_1197 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_3_im) : $signed(_GEN_1193); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_1198 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_3_re) : $signed(_GEN_1194); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_11 = 16'sh0 - $signed(writeDataTIPre3c_3); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_1202 = _addrSBankSel3c_T_1 & addrTBankSel3c_3 == 3'h4 & addrT3c_3 == 7'h1 ? $signed(
    _writeDataT3c_im_T_11) : $signed(writeDataTIPre3c_3); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_24 = sameAddr3c ? $signed(_GEN_1195) : $signed(_GEN_1199); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_25 = sameAddr3c ? $signed(_GEN_1196) : $signed(_GEN_1200); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_26 = {_io_writeDataSram0Bank_0_T_25,_io_writeDataSram0Bank_0_T_24}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_27 = sameAddr3c ? $signed(_GEN_1198) : $signed(writeDataTRPre3c_3); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_28 = sameAddr3c ? $signed(_GEN_1197) : $signed(_GEN_1202); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_29 = {_io_writeDataSram0Bank_0_T_28,_io_writeDataSram0Bank_0_T_27}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_1207 = 3'h0 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_967; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1209 = 3'h0 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1207; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1213 = 3'h1 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_973; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1215 = 3'h1 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1213; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1219 = 3'h2 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_979; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1221 = 3'h2 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1219; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1225 = 3'h3 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_985; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1227 = 3'h3 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1225; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1231 = 3'h4 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_991; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1233 = 3'h4 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1231; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1237 = 3'h5 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_997; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1239 = 3'h5 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1237; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1243 = 3'h6 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1003; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1245 = 3'h6 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1243; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1249 = 3'h7 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1009; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1251 = 3'h7 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1249; // @[FFTEngine.scala 612:46 613:46]
  reg  fftDoneReg; // @[FFTEngine.scala 624:29]
  FFT3PipelineCalc fftCalc ( // @[FFTEngine.scala 481:29]
    .clock(fftCalc_clock),
    .reset(fftCalc_reset),
    .io_dataInSR(fftCalc_io_dataInSR),
    .io_dataInSI(fftCalc_io_dataInSI),
    .io_dataInTR(fftCalc_io_dataInTR),
    .io_dataInTI(fftCalc_io_dataInTI),
    .io_dataOutSR3c(fftCalc_io_dataOutSR3c),
    .io_dataOutSI3c(fftCalc_io_dataOutSI3c),
    .io_dataOutTR3c(fftCalc_io_dataOutTR3c),
    .io_dataOutTI3c(fftCalc_io_dataOutTI3c),
    .io_nk(fftCalc_io_nk),
    .io_rShiftSym(fftCalc_io_rShiftSym),
    .io_isFFT(fftCalc_io_isFFT),
    .io_procMode(fftCalc_io_procMode),
    .io_state1c(fftCalc_io_state1c),
    .io_state2c(fftCalc_io_state2c)
  );
  FFT3PipelineCalc_1 fftCalc_1 ( // @[FFTEngine.scala 481:29]
    .clock(fftCalc_1_clock),
    .reset(fftCalc_1_reset),
    .io_dataInSR(fftCalc_1_io_dataInSR),
    .io_dataInSI(fftCalc_1_io_dataInSI),
    .io_dataInTR(fftCalc_1_io_dataInTR),
    .io_dataInTI(fftCalc_1_io_dataInTI),
    .io_dataOutSR3c(fftCalc_1_io_dataOutSR3c),
    .io_dataOutSI3c(fftCalc_1_io_dataOutSI3c),
    .io_dataOutTR3c(fftCalc_1_io_dataOutTR3c),
    .io_dataOutTI3c(fftCalc_1_io_dataOutTI3c),
    .io_nk(fftCalc_1_io_nk),
    .io_rShiftSym(fftCalc_1_io_rShiftSym),
    .io_isFFT(fftCalc_1_io_isFFT),
    .io_procMode(fftCalc_1_io_procMode),
    .io_state1c(fftCalc_1_io_state1c),
    .io_state2c(fftCalc_1_io_state2c)
  );
  FFT3PipelineCalc_1 fftCalc_2 ( // @[FFTEngine.scala 481:29]
    .clock(fftCalc_2_clock),
    .reset(fftCalc_2_reset),
    .io_dataInSR(fftCalc_2_io_dataInSR),
    .io_dataInSI(fftCalc_2_io_dataInSI),
    .io_dataInTR(fftCalc_2_io_dataInTR),
    .io_dataInTI(fftCalc_2_io_dataInTI),
    .io_dataOutSR3c(fftCalc_2_io_dataOutSR3c),
    .io_dataOutSI3c(fftCalc_2_io_dataOutSI3c),
    .io_dataOutTR3c(fftCalc_2_io_dataOutTR3c),
    .io_dataOutTI3c(fftCalc_2_io_dataOutTI3c),
    .io_nk(fftCalc_2_io_nk),
    .io_rShiftSym(fftCalc_2_io_rShiftSym),
    .io_isFFT(fftCalc_2_io_isFFT),
    .io_procMode(fftCalc_2_io_procMode),
    .io_state1c(fftCalc_2_io_state1c),
    .io_state2c(fftCalc_2_io_state2c)
  );
  FFT3PipelineCalc_1 fftCalc_3 ( // @[FFTEngine.scala 481:29]
    .clock(fftCalc_3_clock),
    .reset(fftCalc_3_reset),
    .io_dataInSR(fftCalc_3_io_dataInSR),
    .io_dataInSI(fftCalc_3_io_dataInSI),
    .io_dataInTR(fftCalc_3_io_dataInTR),
    .io_dataInTI(fftCalc_3_io_dataInTI),
    .io_dataOutSR3c(fftCalc_3_io_dataOutSR3c),
    .io_dataOutSI3c(fftCalc_3_io_dataOutSI3c),
    .io_dataOutTR3c(fftCalc_3_io_dataOutTR3c),
    .io_dataOutTI3c(fftCalc_3_io_dataOutTI3c),
    .io_nk(fftCalc_3_io_nk),
    .io_rShiftSym(fftCalc_3_io_rShiftSym),
    .io_isFFT(fftCalc_3_io_isFFT),
    .io_procMode(fftCalc_3_io_procMode),
    .io_state1c(fftCalc_3_io_state1c),
    .io_state2c(fftCalc_3_io_state2c)
  );
  assign io_readEnableSram0Bank_0 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_1 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_2 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_3 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_4 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_5 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_6 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_7 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram1Bank_0 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_1 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_2 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_3 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_4 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_5 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_6 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_7 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_writeDataSram0Bank_0 = procState3c ? _GEN_967 : _GEN_1209; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_1 = procState3c ? _GEN_973 : _GEN_1215; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_2 = procState3c ? _GEN_979 : _GEN_1221; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_3 = procState3c ? _GEN_985 : _GEN_1227; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_4 = procState3c ? _GEN_991 : _GEN_1233; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_5 = procState3c ? _GEN_997 : _GEN_1239; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_6 = procState3c ? _GEN_1003 : _GEN_1245; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_7 = procState3c ? _GEN_1009 : _GEN_1251; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_0 = procState3c ? _GEN_967 : _GEN_1209; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_1 = procState3c ? _GEN_973 : _GEN_1215; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_2 = procState3c ? _GEN_979 : _GEN_1221; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_3 = procState3c ? _GEN_985 : _GEN_1227; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_4 = procState3c ? _GEN_991 : _GEN_1233; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_5 = procState3c ? _GEN_997 : _GEN_1239; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_6 = procState3c ? _GEN_1003 : _GEN_1245; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_7 = procState3c ? _GEN_1009 : _GEN_1251; // @[FFTEngine.scala 601:30]
  assign io_writeEnableSram0Bank_0 = procState3c ? _GEN_171 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_1 = procState3c ? _GEN_175 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_2 = procState3c ? _GEN_179 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_3 = procState3c ? _GEN_183 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_4 = procState3c ? _GEN_187 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_5 = procState3c ? _GEN_191 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_6 = procState3c ? _GEN_195 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_7 = procState3c ? _GEN_199 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram1Bank_0 = procState3c ? _GEN_172 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_1 = procState3c ? _GEN_176 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_2 = procState3c ? _GEN_180 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_3 = procState3c ? _GEN_184 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_4 = procState3c ? _GEN_188 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_5 = procState3c ? _GEN_192 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_6 = procState3c ? _GEN_196 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_7 = procState3c ? _GEN_200 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_addrSram0Bank_0 = ~procState3c ? _GEN_1167 : _GEN_1111; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_1 = ~procState3c ? _GEN_1168 : _GEN_1112; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_2 = ~procState3c ? _GEN_1169 : _GEN_1113; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_3 = ~procState3c ? _GEN_1170 : _GEN_1114; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_4 = ~procState3c ? _GEN_1171 : _GEN_1115; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_5 = ~procState3c ? _GEN_1172 : _GEN_1116; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_6 = ~procState3c ? _GEN_1173 : _GEN_1117; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_7 = ~procState3c ? _GEN_1174 : _GEN_1118; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_0 = ~procState3c ? _GEN_1159 : _GEN_1119; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_1 = ~procState3c ? _GEN_1160 : _GEN_1120; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_2 = ~procState3c ? _GEN_1161 : _GEN_1121; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_3 = ~procState3c ? _GEN_1162 : _GEN_1122; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_4 = ~procState3c ? _GEN_1163 : _GEN_1123; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_5 = ~procState3c ? _GEN_1164 : _GEN_1124; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_6 = ~procState3c ? _GEN_1165 : _GEN_1125; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_7 = ~procState3c ? _GEN_1166 : _GEN_1126; // @[FFTEngine.scala 549:28]
  assign io_fftDone = fftDoneReg; // @[FFTEngine.scala 625:16]
  assign fftCalc_clock = clock;
  assign fftCalc_reset = reset;
  assign fftCalc_io_dataInSR = 3'h7 == addrSBankSel1c ? $signed(dataInPre_7_re) : $signed(_GEN_125); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_134); // @[FFTEngine.scala 483:35]
  assign fftCalc_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_142) : $signed(_GEN_150); // @[FFTEngine.scala 484:35]
  assign fftCalc_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_142); // @[FFTEngine.scala 485:35]
  assign fftCalc_io_nk = _radixInit_T_11 ? addrSProc : _fftCalc_io_nk_T_2; // @[FFTEngine.scala 487:33]
  assign fftCalc_io_rShiftSym = kernelState1c ? _GEN_168 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_1_clock = clock;
  assign fftCalc_1_reset = reset;
  assign fftCalc_1_io_dataInSR = 3'h7 == addrSBankSel1c_1 ? $signed(dataInPre_7_re) : $signed(_GEN_539); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_1_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_548); // @[FFTEngine.scala 483:35]
  assign fftCalc_1_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_556) : $signed(_GEN_564); // @[FFTEngine.scala 484:35]
  assign fftCalc_1_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_556); // @[FFTEngine.scala 485:35]
  assign fftCalc_1_io_nk = nk_1[8:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_1_io_rShiftSym = kernelState1c ? _GEN_168 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_1_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_1_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_1_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_1_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_2_clock = clock;
  assign fftCalc_2_reset = reset;
  assign fftCalc_2_io_dataInSR = 3'h7 == addrSBankSel1c_2 ? $signed(dataInPre_7_re) : $signed(_GEN_783); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_2_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_792); // @[FFTEngine.scala 483:35]
  assign fftCalc_2_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_800) : $signed(_GEN_808); // @[FFTEngine.scala 484:35]
  assign fftCalc_2_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_800); // @[FFTEngine.scala 485:35]
  assign fftCalc_2_io_nk = nk_2[8:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_2_io_rShiftSym = kernelState1c ? _GEN_168 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_2_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_2_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_2_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_2_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_3_clock = clock;
  assign fftCalc_3_reset = reset;
  assign fftCalc_3_io_dataInSR = 3'h7 == addrSBankSel1c_3 ? $signed(dataInPre_7_re) : $signed(_GEN_1027); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_3_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_1036); // @[FFTEngine.scala 483:35]
  assign fftCalc_3_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_1044) : $signed(_GEN_1052); // @[FFTEngine.scala 484:35]
  assign fftCalc_3_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_1044); // @[FFTEngine.scala 485:35]
  assign fftCalc_3_io_nk = nk_3[8:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_3_io_rShiftSym = kernelState1c ? _GEN_168 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_3_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_3_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_3_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_3_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  always @(posedge clock) begin
    if (reset) begin // @[FFTEngine.scala 46:27]
      stateReg <= 3'h0; // @[FFTEngine.scala 46:27]
    end else if (3'h0 == stateReg) begin // @[FFTEngine.scala 53:26]
      if (io_fftEngineKick) begin // @[FFTEngine.scala 55:44]
        if (io_fftMode) begin // @[FFTEngine.scala 56:40]
          stateReg <= 3'h1;
        end else begin
          stateReg <= 3'h4;
        end
      end
    end else if (3'h1 == stateReg) begin // @[FFTEngine.scala 53:26]
      if (addrSProc == 10'h7f) begin // @[FFTEngine.scala 62:50]
        stateReg <= 3'h2; // @[FFTEngine.scala 63:30]
      end
    end else if (3'h2 == stateReg) begin // @[FFTEngine.scala 53:26]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_11;
    end
    if (reset) begin // @[FFTEngine.scala 48:29]
      addrSProc <= 10'h0; // @[FFTEngine.scala 48:29]
    end else if (radixInit) begin // @[FFTEngine.scala 156:21]
      addrSProc <= 10'h0; // @[FFTEngine.scala 157:20]
    end else if (radixUp) begin // @[FFTEngine.scala 158:26]
      addrSProc <= _radixCount_T_1; // @[FFTEngine.scala 159:20]
    end
    if (reset) begin // @[FFTEngine.scala 50:29]
      phaseCount <= 4'h0; // @[FFTEngine.scala 50:29]
    end else if (phaseInit) begin // @[FFTEngine.scala 171:21]
      phaseCount <= 4'h0; // @[FFTEngine.scala 172:20]
    end else if (phaseUp) begin // @[FFTEngine.scala 173:26]
      phaseCount <= _phaseCount_T_1; // @[FFTEngine.scala 174:20]
    end
    if (reset) begin // @[FFTEngine.scala 179:28]
      srcBuffer <= 1'h0; // @[FFTEngine.scala 179:28]
    end else if (srcUp) begin // @[FFTEngine.scala 185:17]
      srcBuffer <= srcBufferNext; // @[FFTEngine.scala 186:19]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_0_r <= addrSBankSelKernelPre_0; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_0_r <= 3'h0; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_0_r <= addrSBankSelKernel1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_0_r <= addrSBankSelKernel2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_0_r <= 3'h1; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_0_r <= addrTBankSelKernelPre_0; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_0_r <= 3'h1; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_0_r <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_0_r <= addrTBankSelKernel1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_0_r <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_0_r <= addrTBankSelKernel2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_1_r <= addrSBankSelKernelPre_1; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_1_r <= 3'h2; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_1_r <= addrSBankSelKernel1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_1_r <= addrSBankSelKernel2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_1_r <= 3'h3; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_1_r <= addrTBankSelKernelPre_1; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_1_r <= 3'h3; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_1_r <= 3'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_1_r <= addrTBankSelKernel1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_1_r <= 3'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_1_r <= addrTBankSelKernel2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_2_r <= addrSBankSelKernelPre_2; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_2_r <= 3'h4; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_2_r <= addrSBankSelKernel1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_2_r <= addrSBankSelKernel2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_2_r <= 3'h5; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_2_r <= addrTBankSelKernelPre_2; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_2_r <= 3'h5; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_2_r <= 3'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_2_r <= addrTBankSelKernel1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_2_r <= 3'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_2_r <= addrTBankSelKernel2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_3_r <= addrSBankSelKernelPre_3; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_3_r <= 3'h6; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_3_r <= addrSBankSelKernel1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_3_r <= addrSBankSelKernel2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_3_r <= 3'h7; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_3_r <= addrTBankSelKernelPre_3; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_3_r <= 3'h7; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_3_r <= 3'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_3_r <= addrTBankSelKernel1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_3_r <= 3'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_3_r <= addrTBankSelKernel2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_0_r <= addrSBankSelProc_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_0_r <= addrSBankSelProc1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_0_r <= addrSBankSelProc2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_0_r <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_0_r <= addrTBankSelProc_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_0_r <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_0_r <= addrTBankSelProc1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_0_r <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_0_r <= addrTBankSelProc2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_1_r <= addrSBankSelProc_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_1_r <= addrSBankSelProc1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_1_r <= addrSBankSelProc2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_1_r <= 3'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_1_r <= addrTBankSelProc_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_1_r <= 3'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_1_r <= addrTBankSelProc1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_1_r <= 3'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_1_r <= addrTBankSelProc2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_2_r <= addrSBankSelProc_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_2_r <= addrSBankSelProc1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_2_r <= addrSBankSelProc2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_2_r <= 3'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_2_r <= addrTBankSelProc_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_2_r <= 3'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_2_r <= addrTBankSelProc1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_2_r <= 3'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_2_r <= addrTBankSelProc2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_3_r <= addrSBankSelProc_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_3_r <= addrSBankSelProc1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_3_r <= addrSBankSelProc2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_3_r <= 3'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_3_r <= addrTBankSelProc_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_3_r <= 3'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_3_r <= addrTBankSelProc1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_3_r <= 3'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_3_r <= addrTBankSelProc2c_3_r;
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
      addrS1c <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c <= addrS_0[6:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c <= addrS1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c <= addrS2c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c <= addrT_0[6:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c <= addrT1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT3c <= addrT2c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 471:32]
        addrSBankSel1c <= addrSBankSelProc_0;
      end else begin
        addrSBankSel1c <= addrSBankSelKernel_0;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 4'h0) begin // @[FFTEngine.scala 474:32]
      addrSBankSel1c <= addrSBankSelProc_0;
    end else begin
      addrSBankSel1c <= addrSBankSelKernel_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c <= 3'h1; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 472:32]
        addrTBankSel1c <= addrTBankSelProc_0;
      end else begin
        addrTBankSel1c <= addrTBankSelKernel_0;
      end
    end else if (_addrSBankSel_T_4) begin // @[FFTEngine.scala 475:32]
      addrTBankSel1c <= addrTBankSelProc_0;
    end else begin
      addrTBankSel1c <= addrTBankSelKernel_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS1c_1 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_1 <= addrS_1[6:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_1 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_1 <= addrS1c_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_1 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_1 <= addrS2c_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_1 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_1 <= addrT_1[6:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_1 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_1 <= addrT1c_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_1 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT3c_1 <= addrT2c_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_1 <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 471:32]
        addrSBankSel1c_1 <= addrSBankSelProc_1;
      end else begin
        addrSBankSel1c_1 <= addrSBankSelKernel_1;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 4'h0) begin // @[FFTEngine.scala 474:32]
      addrSBankSel1c_1 <= addrSBankSelProc_1;
    end else begin
      addrSBankSel1c_1 <= addrSBankSelKernel_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_1 <= 3'h1; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 472:32]
        addrTBankSel1c_1 <= addrTBankSelProc_1;
      end else begin
        addrTBankSel1c_1 <= addrTBankSelKernel_1;
      end
    end else if (_addrSBankSel_T_4) begin // @[FFTEngine.scala 475:32]
      addrTBankSel1c_1 <= addrTBankSelProc_1;
    end else begin
      addrTBankSel1c_1 <= addrTBankSelKernel_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS1c_2 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_2 <= addrS_2[6:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_2 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_2 <= addrS1c_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_2 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_2 <= addrS2c_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_2 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_2 <= addrT_2[6:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_2 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_2 <= addrT1c_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_2 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT3c_2 <= addrT2c_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_2 <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 471:32]
        addrSBankSel1c_2 <= addrSBankSelProc_2;
      end else begin
        addrSBankSel1c_2 <= addrSBankSelKernel_2;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 4'h0) begin // @[FFTEngine.scala 474:32]
      addrSBankSel1c_2 <= addrSBankSelProc_2;
    end else begin
      addrSBankSel1c_2 <= addrSBankSelKernel_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_2 <= 3'h1; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 472:32]
        addrTBankSel1c_2 <= addrTBankSelProc_2;
      end else begin
        addrTBankSel1c_2 <= addrTBankSelKernel_2;
      end
    end else if (_addrSBankSel_T_4) begin // @[FFTEngine.scala 475:32]
      addrTBankSel1c_2 <= addrTBankSelProc_2;
    end else begin
      addrTBankSel1c_2 <= addrTBankSelKernel_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS1c_3 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_3 <= addrS_3[6:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_3 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_3 <= addrS1c_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_3 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_3 <= addrS2c_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_3 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_3 <= addrT_3[6:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_3 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_3 <= addrT1c_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_3 <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      addrT3c_3 <= addrT2c_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_3 <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 471:32]
        addrSBankSel1c_3 <= addrSBankSelProc_3;
      end else begin
        addrSBankSel1c_3 <= addrSBankSelKernel_3;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 4'h0) begin // @[FFTEngine.scala 474:32]
      addrSBankSel1c_3 <= addrSBankSelProc_3;
    end else begin
      addrSBankSel1c_3 <= addrSBankSelKernel_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_3 <= 3'h1; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 472:32]
        addrTBankSel1c_3 <= addrTBankSelProc_3;
      end else begin
        addrTBankSel1c_3 <= addrTBankSelKernel_3;
      end
    end else if (_addrSBankSel_T_4) begin // @[FFTEngine.scala 475:32]
      addrTBankSel1c_3 <= addrTBankSelProc_3;
    end else begin
      addrTBankSel1c_3 <= addrTBankSelKernel_3;
    end
    if (reset) begin // @[FFTEngine.scala 624:29]
      fftDoneReg <= 1'h0; // @[FFTEngine.scala 624:29]
    end else begin
      fftDoneReg <= _radixInit_T_21; // @[FFTEngine.scala 624:29]
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
  addrSProc = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  srcBuffer = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrSBankSelKernel1c_0_r = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  addrSBankSelKernel2c_0_r = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  addrSBankSelKernel3c_0_r = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  addrTBankSelKernel1c_0_r = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  addrTBankSelKernel2c_0_r = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  addrTBankSelKernel3c_0_r = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  addrSBankSelKernel1c_1_r = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  addrSBankSelKernel2c_1_r = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  addrSBankSelKernel3c_1_r = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  addrTBankSelKernel1c_1_r = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  addrTBankSelKernel2c_1_r = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  addrTBankSelKernel3c_1_r = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  addrSBankSelKernel1c_2_r = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  addrSBankSelKernel2c_2_r = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  addrSBankSelKernel3c_2_r = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  addrTBankSelKernel1c_2_r = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  addrTBankSelKernel2c_2_r = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  addrTBankSelKernel3c_2_r = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  addrSBankSelKernel1c_3_r = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  addrSBankSelKernel2c_3_r = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  addrSBankSelKernel3c_3_r = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  addrTBankSelKernel1c_3_r = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  addrTBankSelKernel2c_3_r = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  addrTBankSelKernel3c_3_r = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  addrSBankSelProc1c_0_r = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  addrSBankSelProc2c_0_r = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  addrSBankSelProc3c_0_r = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  addrTBankSelProc1c_0_r = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  addrTBankSelProc2c_0_r = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  addrTBankSelProc3c_0_r = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  addrSBankSelProc1c_1_r = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  addrSBankSelProc2c_1_r = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  addrSBankSelProc3c_1_r = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  addrTBankSelProc1c_1_r = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  addrTBankSelProc2c_1_r = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  addrTBankSelProc3c_1_r = _RAND_39[2:0];
  _RAND_40 = {1{`RANDOM}};
  addrSBankSelProc1c_2_r = _RAND_40[2:0];
  _RAND_41 = {1{`RANDOM}};
  addrSBankSelProc2c_2_r = _RAND_41[2:0];
  _RAND_42 = {1{`RANDOM}};
  addrSBankSelProc3c_2_r = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  addrTBankSelProc1c_2_r = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  addrTBankSelProc2c_2_r = _RAND_44[2:0];
  _RAND_45 = {1{`RANDOM}};
  addrTBankSelProc3c_2_r = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  addrSBankSelProc1c_3_r = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  addrSBankSelProc2c_3_r = _RAND_47[2:0];
  _RAND_48 = {1{`RANDOM}};
  addrSBankSelProc3c_3_r = _RAND_48[2:0];
  _RAND_49 = {1{`RANDOM}};
  addrTBankSelProc1c_3_r = _RAND_49[2:0];
  _RAND_50 = {1{`RANDOM}};
  addrTBankSelProc2c_3_r = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  addrTBankSelProc3c_3_r = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  kernelState1c = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  kernelState2c = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  kernelState3c = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  procState1c = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  procState2c = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  procState3c = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  sameAddr1c = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  sameAddr2c = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  sameAddr3c = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  addrS1c = _RAND_61[6:0];
  _RAND_62 = {1{`RANDOM}};
  addrS2c = _RAND_62[6:0];
  _RAND_63 = {1{`RANDOM}};
  addrS3c = _RAND_63[6:0];
  _RAND_64 = {1{`RANDOM}};
  addrT1c = _RAND_64[6:0];
  _RAND_65 = {1{`RANDOM}};
  addrT2c = _RAND_65[6:0];
  _RAND_66 = {1{`RANDOM}};
  addrT3c = _RAND_66[6:0];
  _RAND_67 = {1{`RANDOM}};
  addrSBankSel1c = _RAND_67[2:0];
  _RAND_68 = {1{`RANDOM}};
  addrTBankSel1c = _RAND_68[2:0];
  _RAND_69 = {1{`RANDOM}};
  addrS1c_1 = _RAND_69[6:0];
  _RAND_70 = {1{`RANDOM}};
  addrS2c_1 = _RAND_70[6:0];
  _RAND_71 = {1{`RANDOM}};
  addrS3c_1 = _RAND_71[6:0];
  _RAND_72 = {1{`RANDOM}};
  addrT1c_1 = _RAND_72[6:0];
  _RAND_73 = {1{`RANDOM}};
  addrT2c_1 = _RAND_73[6:0];
  _RAND_74 = {1{`RANDOM}};
  addrT3c_1 = _RAND_74[6:0];
  _RAND_75 = {1{`RANDOM}};
  addrSBankSel1c_1 = _RAND_75[2:0];
  _RAND_76 = {1{`RANDOM}};
  addrTBankSel1c_1 = _RAND_76[2:0];
  _RAND_77 = {1{`RANDOM}};
  addrS1c_2 = _RAND_77[6:0];
  _RAND_78 = {1{`RANDOM}};
  addrS2c_2 = _RAND_78[6:0];
  _RAND_79 = {1{`RANDOM}};
  addrS3c_2 = _RAND_79[6:0];
  _RAND_80 = {1{`RANDOM}};
  addrT1c_2 = _RAND_80[6:0];
  _RAND_81 = {1{`RANDOM}};
  addrT2c_2 = _RAND_81[6:0];
  _RAND_82 = {1{`RANDOM}};
  addrT3c_2 = _RAND_82[6:0];
  _RAND_83 = {1{`RANDOM}};
  addrSBankSel1c_2 = _RAND_83[2:0];
  _RAND_84 = {1{`RANDOM}};
  addrTBankSel1c_2 = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  addrS1c_3 = _RAND_85[6:0];
  _RAND_86 = {1{`RANDOM}};
  addrS2c_3 = _RAND_86[6:0];
  _RAND_87 = {1{`RANDOM}};
  addrS3c_3 = _RAND_87[6:0];
  _RAND_88 = {1{`RANDOM}};
  addrT1c_3 = _RAND_88[6:0];
  _RAND_89 = {1{`RANDOM}};
  addrT2c_3 = _RAND_89[6:0];
  _RAND_90 = {1{`RANDOM}};
  addrT3c_3 = _RAND_90[6:0];
  _RAND_91 = {1{`RANDOM}};
  addrSBankSel1c_3 = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  addrTBankSel1c_3 = _RAND_92[2:0];
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
