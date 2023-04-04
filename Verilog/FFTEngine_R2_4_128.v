module FFTTwiddle(
  input  [7:0]  io_nk,
  input  [1:0]  io_twiLutCaseIndex,
  output [13:0] io_wR,
  output [13:0] io_wI
);
  wire [7:0] _idx_r_pre_T_1 = ~io_nk; // @[FFTTwiddle.scala 36:51]
  wire [7:0] _idx_r_pre_T_3 = _idx_r_pre_T_1 + 8'h1; // @[FFTTwiddle.scala 36:58]
  wire [7:0] _idx_r_pre_T_4 = io_nk[7] ? _idx_r_pre_T_3 : io_nk; // @[FFTTwiddle.scala 36:24]
  wire [6:0] idx_r_pre = _idx_r_pre_T_4[6:0]; // @[FFTTwiddle.scala 36:72]
  wire  _idx_r_T_3 = idx_r_pre[6] & |idx_r_pre[5:0]; // @[FFTTwiddle.scala 38:54]
  wire [6:0] _idx_r_T_4 = ~idx_r_pre; // @[FFTTwiddle.scala 38:98]
  wire [6:0] _idx_r_T_6 = _idx_r_T_4 + 7'h1; // @[FFTTwiddle.scala 38:109]
  wire [6:0] idx_r = idx_r_pre[6] & |idx_r_pre[5:0] ? _idx_r_T_6 : idx_r_pre; // @[FFTTwiddle.scala 38:20]
  wire  lut_chg_sign_flag_i = ~io_nk[7]; // @[FFTTwiddle.scala 46:31]
  wire  chg_sign_flag_r = io_twiLutCaseIndex == 2'h2 ? ~_idx_r_T_3 : _idx_r_T_3; // @[FFTTwiddle.scala 50:30]
  wire  chg_sign_flag_i = io_twiLutCaseIndex == 2'h1 ? ~lut_chg_sign_flag_i : lut_chg_sign_flag_i; // @[FFTTwiddle.scala 51:30]
  wire [13:0] _GEN_1 = 7'h1 == idx_r ? $signed(14'shfff) : $signed(14'sh1000); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_2 = 7'h2 == idx_r ? $signed(14'shffb) : $signed(_GEN_1); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_3 = 7'h3 == idx_r ? $signed(14'shff5) : $signed(_GEN_2); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_4 = 7'h4 == idx_r ? $signed(14'shfec) : $signed(_GEN_3); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_5 = 7'h5 == idx_r ? $signed(14'shfe1) : $signed(_GEN_4); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_6 = 7'h6 == idx_r ? $signed(14'shfd4) : $signed(_GEN_5); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_7 = 7'h7 == idx_r ? $signed(14'shfc4) : $signed(_GEN_6); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_8 = 7'h8 == idx_r ? $signed(14'shfb1) : $signed(_GEN_7); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_9 = 7'h9 == idx_r ? $signed(14'shf9c) : $signed(_GEN_8); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_10 = 7'ha == idx_r ? $signed(14'shf85) : $signed(_GEN_9); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_11 = 7'hb == idx_r ? $signed(14'shf6c) : $signed(_GEN_10); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_12 = 7'hc == idx_r ? $signed(14'shf50) : $signed(_GEN_11); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_13 = 7'hd == idx_r ? $signed(14'shf31) : $signed(_GEN_12); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_14 = 7'he == idx_r ? $signed(14'shf11) : $signed(_GEN_13); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_15 = 7'hf == idx_r ? $signed(14'sheee) : $signed(_GEN_14); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_16 = 7'h10 == idx_r ? $signed(14'shec8) : $signed(_GEN_15); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_17 = 7'h11 == idx_r ? $signed(14'shea1) : $signed(_GEN_16); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_18 = 7'h12 == idx_r ? $signed(14'she77) : $signed(_GEN_17); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_19 = 7'h13 == idx_r ? $signed(14'she4b) : $signed(_GEN_18); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_20 = 7'h14 == idx_r ? $signed(14'she1c) : $signed(_GEN_19); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_21 = 7'h15 == idx_r ? $signed(14'shdec) : $signed(_GEN_20); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_22 = 7'h16 == idx_r ? $signed(14'shdb9) : $signed(_GEN_21); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_23 = 7'h17 == idx_r ? $signed(14'shd85) : $signed(_GEN_22); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_24 = 7'h18 == idx_r ? $signed(14'shd4e) : $signed(_GEN_23); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_25 = 7'h19 == idx_r ? $signed(14'shd15) : $signed(_GEN_24); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_26 = 7'h1a == idx_r ? $signed(14'shcda) : $signed(_GEN_25); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_27 = 7'h1b == idx_r ? $signed(14'shc9d) : $signed(_GEN_26); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_28 = 7'h1c == idx_r ? $signed(14'shc5e) : $signed(_GEN_27); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_29 = 7'h1d == idx_r ? $signed(14'shc1e) : $signed(_GEN_28); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_30 = 7'h1e == idx_r ? $signed(14'shbdb) : $signed(_GEN_29); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_31 = 7'h1f == idx_r ? $signed(14'shb97) : $signed(_GEN_30); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_32 = 7'h20 == idx_r ? $signed(14'shb50) : $signed(_GEN_31); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_33 = 7'h21 == idx_r ? $signed(14'shb08) : $signed(_GEN_32); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_34 = 7'h22 == idx_r ? $signed(14'shabf) : $signed(_GEN_33); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_35 = 7'h23 == idx_r ? $signed(14'sha73) : $signed(_GEN_34); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_36 = 7'h24 == idx_r ? $signed(14'sha26) : $signed(_GEN_35); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_37 = 7'h25 == idx_r ? $signed(14'sh9d8) : $signed(_GEN_36); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_38 = 7'h26 == idx_r ? $signed(14'sh988) : $signed(_GEN_37); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_39 = 7'h27 == idx_r ? $signed(14'sh937) : $signed(_GEN_38); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_40 = 7'h28 == idx_r ? $signed(14'sh8e4) : $signed(_GEN_39); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_41 = 7'h29 == idx_r ? $signed(14'sh88f) : $signed(_GEN_40); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_42 = 7'h2a == idx_r ? $signed(14'sh83a) : $signed(_GEN_41); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_43 = 7'h2b == idx_r ? $signed(14'sh7e3) : $signed(_GEN_42); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_44 = 7'h2c == idx_r ? $signed(14'sh78b) : $signed(_GEN_43); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_45 = 7'h2d == idx_r ? $signed(14'sh732) : $signed(_GEN_44); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_46 = 7'h2e == idx_r ? $signed(14'sh6d7) : $signed(_GEN_45); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_47 = 7'h2f == idx_r ? $signed(14'sh67c) : $signed(_GEN_46); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_48 = 7'h30 == idx_r ? $signed(14'sh61f) : $signed(_GEN_47); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_49 = 7'h31 == idx_r ? $signed(14'sh5c2) : $signed(_GEN_48); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_50 = 7'h32 == idx_r ? $signed(14'sh564) : $signed(_GEN_49); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_51 = 7'h33 == idx_r ? $signed(14'sh505) : $signed(_GEN_50); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_52 = 7'h34 == idx_r ? $signed(14'sh4a5) : $signed(_GEN_51); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_53 = 7'h35 == idx_r ? $signed(14'sh444) : $signed(_GEN_52); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_54 = 7'h36 == idx_r ? $signed(14'sh3e3) : $signed(_GEN_53); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_55 = 7'h37 == idx_r ? $signed(14'sh381) : $signed(_GEN_54); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_56 = 7'h38 == idx_r ? $signed(14'sh31f) : $signed(_GEN_55); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_57 = 7'h39 == idx_r ? $signed(14'sh2bc) : $signed(_GEN_56); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_58 = 7'h3a == idx_r ? $signed(14'sh259) : $signed(_GEN_57); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_59 = 7'h3b == idx_r ? $signed(14'sh1f5) : $signed(_GEN_58); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_60 = 7'h3c == idx_r ? $signed(14'sh191) : $signed(_GEN_59); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_61 = 7'h3d == idx_r ? $signed(14'sh12d) : $signed(_GEN_60); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_62 = 7'h3e == idx_r ? $signed(14'shc9) : $signed(_GEN_61); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_63 = 7'h3f == idx_r ? $signed(14'sh65) : $signed(_GEN_62); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _GEN_64 = 7'h40 == idx_r ? $signed(14'sh0) : $signed(_GEN_63); // @[FFTTwiddle.scala 53:{35,35}]
  wire [13:0] _io_wR_T_2 = 14'sh0 - $signed(_GEN_64); // @[FFTTwiddle.scala 53:35]
  wire [13:0] _GEN_66 = 7'h1 == idx_r ? $signed(14'sh65) : $signed(14'sh0); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_67 = 7'h2 == idx_r ? $signed(14'shc9) : $signed(_GEN_66); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_68 = 7'h3 == idx_r ? $signed(14'sh12d) : $signed(_GEN_67); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_69 = 7'h4 == idx_r ? $signed(14'sh191) : $signed(_GEN_68); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_70 = 7'h5 == idx_r ? $signed(14'sh1f5) : $signed(_GEN_69); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_71 = 7'h6 == idx_r ? $signed(14'sh259) : $signed(_GEN_70); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_72 = 7'h7 == idx_r ? $signed(14'sh2bc) : $signed(_GEN_71); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_73 = 7'h8 == idx_r ? $signed(14'sh31f) : $signed(_GEN_72); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_74 = 7'h9 == idx_r ? $signed(14'sh381) : $signed(_GEN_73); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_75 = 7'ha == idx_r ? $signed(14'sh3e3) : $signed(_GEN_74); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_76 = 7'hb == idx_r ? $signed(14'sh444) : $signed(_GEN_75); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_77 = 7'hc == idx_r ? $signed(14'sh4a5) : $signed(_GEN_76); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_78 = 7'hd == idx_r ? $signed(14'sh505) : $signed(_GEN_77); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_79 = 7'he == idx_r ? $signed(14'sh564) : $signed(_GEN_78); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_80 = 7'hf == idx_r ? $signed(14'sh5c2) : $signed(_GEN_79); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_81 = 7'h10 == idx_r ? $signed(14'sh61f) : $signed(_GEN_80); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_82 = 7'h11 == idx_r ? $signed(14'sh67c) : $signed(_GEN_81); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_83 = 7'h12 == idx_r ? $signed(14'sh6d7) : $signed(_GEN_82); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_84 = 7'h13 == idx_r ? $signed(14'sh732) : $signed(_GEN_83); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_85 = 7'h14 == idx_r ? $signed(14'sh78b) : $signed(_GEN_84); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_86 = 7'h15 == idx_r ? $signed(14'sh7e3) : $signed(_GEN_85); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_87 = 7'h16 == idx_r ? $signed(14'sh83a) : $signed(_GEN_86); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_88 = 7'h17 == idx_r ? $signed(14'sh88f) : $signed(_GEN_87); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_89 = 7'h18 == idx_r ? $signed(14'sh8e4) : $signed(_GEN_88); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_90 = 7'h19 == idx_r ? $signed(14'sh937) : $signed(_GEN_89); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_91 = 7'h1a == idx_r ? $signed(14'sh988) : $signed(_GEN_90); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_92 = 7'h1b == idx_r ? $signed(14'sh9d8) : $signed(_GEN_91); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_93 = 7'h1c == idx_r ? $signed(14'sha26) : $signed(_GEN_92); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_94 = 7'h1d == idx_r ? $signed(14'sha73) : $signed(_GEN_93); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_95 = 7'h1e == idx_r ? $signed(14'shabf) : $signed(_GEN_94); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_96 = 7'h1f == idx_r ? $signed(14'shb08) : $signed(_GEN_95); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_97 = 7'h20 == idx_r ? $signed(14'shb50) : $signed(_GEN_96); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_98 = 7'h21 == idx_r ? $signed(14'shb97) : $signed(_GEN_97); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_99 = 7'h22 == idx_r ? $signed(14'shbdb) : $signed(_GEN_98); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_100 = 7'h23 == idx_r ? $signed(14'shc1e) : $signed(_GEN_99); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_101 = 7'h24 == idx_r ? $signed(14'shc5e) : $signed(_GEN_100); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_102 = 7'h25 == idx_r ? $signed(14'shc9d) : $signed(_GEN_101); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_103 = 7'h26 == idx_r ? $signed(14'shcda) : $signed(_GEN_102); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_104 = 7'h27 == idx_r ? $signed(14'shd15) : $signed(_GEN_103); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_105 = 7'h28 == idx_r ? $signed(14'shd4e) : $signed(_GEN_104); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_106 = 7'h29 == idx_r ? $signed(14'shd85) : $signed(_GEN_105); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_107 = 7'h2a == idx_r ? $signed(14'shdb9) : $signed(_GEN_106); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_108 = 7'h2b == idx_r ? $signed(14'shdec) : $signed(_GEN_107); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_109 = 7'h2c == idx_r ? $signed(14'she1c) : $signed(_GEN_108); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_110 = 7'h2d == idx_r ? $signed(14'she4b) : $signed(_GEN_109); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_111 = 7'h2e == idx_r ? $signed(14'she77) : $signed(_GEN_110); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_112 = 7'h2f == idx_r ? $signed(14'shea1) : $signed(_GEN_111); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_113 = 7'h30 == idx_r ? $signed(14'shec8) : $signed(_GEN_112); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_114 = 7'h31 == idx_r ? $signed(14'sheee) : $signed(_GEN_113); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_115 = 7'h32 == idx_r ? $signed(14'shf11) : $signed(_GEN_114); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_116 = 7'h33 == idx_r ? $signed(14'shf31) : $signed(_GEN_115); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_117 = 7'h34 == idx_r ? $signed(14'shf50) : $signed(_GEN_116); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_118 = 7'h35 == idx_r ? $signed(14'shf6c) : $signed(_GEN_117); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_119 = 7'h36 == idx_r ? $signed(14'shf85) : $signed(_GEN_118); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_120 = 7'h37 == idx_r ? $signed(14'shf9c) : $signed(_GEN_119); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_121 = 7'h38 == idx_r ? $signed(14'shfb1) : $signed(_GEN_120); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_122 = 7'h39 == idx_r ? $signed(14'shfc4) : $signed(_GEN_121); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_123 = 7'h3a == idx_r ? $signed(14'shfd4) : $signed(_GEN_122); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_124 = 7'h3b == idx_r ? $signed(14'shfe1) : $signed(_GEN_123); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_125 = 7'h3c == idx_r ? $signed(14'shfec) : $signed(_GEN_124); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_126 = 7'h3d == idx_r ? $signed(14'shff5) : $signed(_GEN_125); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_127 = 7'h3e == idx_r ? $signed(14'shffb) : $signed(_GEN_126); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_128 = 7'h3f == idx_r ? $signed(14'shfff) : $signed(_GEN_127); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _GEN_129 = 7'h40 == idx_r ? $signed(14'sh1000) : $signed(_GEN_128); // @[FFTTwiddle.scala 54:{35,35}]
  wire [13:0] _io_wI_T_2 = 14'sh0 - $signed(_GEN_129); // @[FFTTwiddle.scala 54:35]
  assign io_wR = chg_sign_flag_r ? $signed(_io_wR_T_2) : $signed(_GEN_64); // @[FFTTwiddle.scala 53:17]
  assign io_wI = chg_sign_flag_i ? $signed(_io_wI_T_2) : $signed(_GEN_129); // @[FFTTwiddle.scala 54:17]
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
  input  [6:0]  io_nk,
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
  wire [7:0] fftTwiddle_io_nk; // @[FFT3PipelineCalc.scala 45:28]
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
  reg [6:0] nk1c; // @[Reg.scala 35:20]
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
      nk1c <= 7'h0; // @[Reg.scala 35:20]
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
  nk1c = _RAND_0[6:0];
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
  input  [5:0]  io_nk,
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
  wire [6:0] fftTwiddle_io_nk; // @[FFT3PipelineCalc.scala 45:28]
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
  reg [5:0] nk1c; // @[Reg.scala 35:20]
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
      nk1c <= 6'h0; // @[Reg.scala 35:20]
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
  nk1c = _RAND_0[5:0];
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
  input         io_fftRShiftP0_2,
  input         io_fftRShiftP0_3,
  input         io_fftRShiftP0_4,
  input         io_fftRShiftP0_5,
  input         io_fftRShiftP0_6
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
  wire [6:0] fftCalc_io_nk; // @[FFTEngine.scala 481:29]
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
  wire [5:0] fftCalc_1_io_nk; // @[FFTEngine.scala 481:29]
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
  wire [5:0] fftCalc_2_io_nk; // @[FFTEngine.scala 481:29]
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
  wire [5:0] fftCalc_3_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_state2c; // @[FFTEngine.scala 481:29]
  reg [2:0] stateReg; // @[FFTEngine.scala 46:27]
  reg [6:0] addrSProc; // @[FFTEngine.scala 48:29]
  reg [2:0] phaseCount; // @[FFTEngine.scala 50:29]
  wire  _T_2 = addrSProc == 7'hf; // @[FFTEngine.scala 62:33]
  wire  _T_4 = addrSProc == 7'h3; // @[FFTEngine.scala 69:33]
  wire [2:0] _GEN_2 = addrSProc == 7'h3 ? 3'h3 : stateReg; // @[FFTEngine.scala 69:49 70:30 72:30]
  wire  _T_6 = phaseCount == 3'h6; // @[FFTEngine.scala 76:33]
  wire [2:0] _stateReg_T_1 = io_fftMode ? 3'h4 : 3'h7; // @[FFTEngine.scala 77:36]
  wire [2:0] _GEN_3 = phaseCount == 3'h6 ? _stateReg_T_1 : 3'h1; // @[FFTEngine.scala 76:50 77:30 79:30]
  wire  _T_8 = addrSProc == 7'h3f; // @[FFTEngine.scala 83:33]
  wire [2:0] _GEN_4 = addrSProc == 7'h3f ? 3'h5 : stateReg; // @[FFTEngine.scala 83:51 84:30 86:30]
  wire [2:0] _GEN_5 = _T_4 ? 3'h6 : stateReg; // @[FFTEngine.scala 90:50 91:30 93:30]
  wire  _T_12 = phaseCount == 3'h1; // @[FFTEngine.scala 97:33]
  wire [2:0] _stateReg_T_2 = io_fftMode ? 3'h7 : 3'h1; // @[FFTEngine.scala 98:36]
  wire [2:0] _GEN_6 = phaseCount == 3'h1 ? _stateReg_T_2 : 3'h4; // @[FFTEngine.scala 100:30 97:51 98:30]
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
  wire [6:0] _radixCount_T_1 = addrSProc + 7'h1; // @[FFTEngine.scala 159:34]
  wire  _phaseInit_T_3 = _radixInit_T_9 & _T_6; // @[FFTEngine.scala 165:33]
  wire  _phaseInit_T_4 = _radixInit_T | _phaseInit_T_3; // @[FFTEngine.scala 164:45]
  wire  _phaseInit_T_7 = _radixInit_T_19 & _T_12; // @[FFTEngine.scala 166:31]
  wire  _phaseInit_T_8 = _phaseInit_T_4 | _phaseInit_T_7; // @[FFTEngine.scala 165:65]
  wire  phaseInit = _phaseInit_T_8 | _radixInit_T_21; // @[FFTEngine.scala 166:64]
  wire  phaseUp = _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 169:46]
  wire [2:0] _phaseCount_T_1 = phaseCount + 3'h1; // @[FFTEngine.scala 174:34]
  reg  srcBuffer; // @[FFTEngine.scala 179:28]
  wire  _srcBufferNext_T_3 = ~srcBuffer; // @[FFTEngine.scala 181:79]
  wire  srcBufferNext = phaseUp & ~srcBuffer; // @[FFTEngine.scala 181:77]
  wire  srcUp = _radixInit_T | _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 183:70]
  wire  readEnable = _radixInit_T_1 | _radixInit_T_11; // @[FFTEngine.scala 194:34]
  wire [3:0] radixCountTemp = addrSProc[3:0]; // @[FFTEngine.scala 196:36]
  wire [4:0] _nk_0_T_1 = {1'h0,radixCountTemp}; // @[Cat.scala 33:92]
  wire [4:0] _nk_1_T_1 = {1'h1,radixCountTemp}; // @[Cat.scala 33:92]
  wire [5:0] _nk_2_T_1 = {2'h2,radixCountTemp}; // @[Cat.scala 33:92]
  wire [5:0] _nk_3_T_1 = {2'h3,radixCountTemp}; // @[Cat.scala 33:92]
  wire  _T_15 = phaseCount == 3'h5; // @[FFTEngine.scala 223:32]
  wire [4:0] _nk_0_T_3 = {1'h0,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _nk_1_T_3 = {1'h1,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [5:0] _nk_2_T_3 = {2'h2,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [5:0] _nk_3_T_3 = {2'h3,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [7:0] _nk_0_T_5 = {addrSProc[5:0],2'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_0_T_8 = 7'h3f >> phaseCount; // @[FFTEngine.scala 234:164]
  wire [6:0] _nk_0_T_9 = ~_nk_0_T_8; // @[FFTEngine.scala 234:102]
  wire [7:0] _GEN_1252 = {{1'd0}, _nk_0_T_9}; // @[FFTEngine.scala 234:100]
  wire [7:0] _nk_0_T_10 = _nk_0_T_5 & _GEN_1252; // @[FFTEngine.scala 234:100]
  wire [7:0] _nk_1_T_5 = {addrSProc[5:0],2'h1}; // @[Cat.scala 33:92]
  wire [7:0] _nk_1_T_10 = _nk_1_T_5 & _GEN_1252; // @[FFTEngine.scala 234:100]
  wire [7:0] _nk_2_T_5 = {addrSProc[5:0],2'h2}; // @[Cat.scala 33:92]
  wire [7:0] _nk_2_T_10 = _nk_2_T_5 & _GEN_1252; // @[FFTEngine.scala 234:100]
  wire [7:0] _nk_3_T_5 = {addrSProc[5:0],2'h3}; // @[Cat.scala 33:92]
  wire [7:0] _nk_3_T_10 = _nk_3_T_5 & _GEN_1252; // @[FFTEngine.scala 234:100]
  wire [7:0] _GEN_20 = phaseCount == 3'h5 ? {{3'd0}, _nk_0_T_3} : _nk_0_T_10; // @[FFTEngine.scala 223:51 228:27 234:23]
  wire [7:0] _GEN_21 = phaseCount == 3'h5 ? {{3'd0}, _nk_1_T_3} : _nk_1_T_10; // @[FFTEngine.scala 223:51 228:27 234:23]
  wire [7:0] _GEN_22 = phaseCount == 3'h5 ? {{2'd0}, _nk_2_T_3} : _nk_2_T_10; // @[FFTEngine.scala 223:51 228:27 234:23]
  wire [7:0] _GEN_23 = phaseCount == 3'h5 ? {{2'd0}, _nk_3_T_3} : _nk_3_T_10; // @[FFTEngine.scala 223:51 228:27 234:23]
  wire [7:0] nk_0 = _T_6 ? {{3'd0}, _nk_0_T_1} : _GEN_20; // @[FFTEngine.scala 219:42 221:23]
  wire [7:0] nk_1 = _T_6 ? {{3'd0}, _nk_1_T_1} : _GEN_21; // @[FFTEngine.scala 219:42 221:23]
  wire [7:0] nk_2 = _T_6 ? {{2'd0}, _nk_2_T_1} : _GEN_22; // @[FFTEngine.scala 219:42 221:23]
  wire [7:0] nk_3 = _T_6 ? {{2'd0}, _nk_3_T_1} : _GEN_23; // @[FFTEngine.scala 219:42 221:23]
  wire [13:0] addrSKernelPre_0_dataTemp = {3'h0,radixCountTemp,3'h0,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrTKernelPre_0_dataTemp = {3'h4,radixCountTemp,3'h4,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrSKernelPre_1_dataTemp = {3'h1,radixCountTemp,3'h1,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrTKernelPre_1_dataTemp = {3'h5,radixCountTemp,3'h5,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrSKernelPre_2_dataTemp = {3'h2,radixCountTemp,3'h2,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrTKernelPre_2_dataTemp = {3'h6,radixCountTemp,3'h6,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrSKernelPre_3_dataTemp = {3'h3,radixCountTemp,3'h3,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrTKernelPre_3_dataTemp = {3'h7,radixCountTemp,3'h7,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrSKernelPre_0_dataTemp_1 = {{1'd0}, addrSKernelPre_0_dataTemp[13:1]}; // @[FFTEngine.scala 268:40]
  wire [13:0] addrTKernelPre_0_dataTemp_1 = {{1'd0}, addrTKernelPre_0_dataTemp[13:1]}; // @[FFTEngine.scala 268:40]
  wire [13:0] addrSKernelPre_1_dataTemp_1 = {{1'd0}, addrSKernelPre_1_dataTemp[13:1]}; // @[FFTEngine.scala 268:40]
  wire [13:0] addrTKernelPre_1_dataTemp_1 = {{1'd0}, addrTKernelPre_1_dataTemp[13:1]}; // @[FFTEngine.scala 268:40]
  wire [13:0] addrSKernelPre_2_dataTemp_1 = {{1'd0}, addrSKernelPre_2_dataTemp[13:1]}; // @[FFTEngine.scala 268:40]
  wire [13:0] addrTKernelPre_2_dataTemp_1 = {{1'd0}, addrTKernelPre_2_dataTemp[13:1]}; // @[FFTEngine.scala 268:40]
  wire [13:0] addrSKernelPre_3_dataTemp_1 = {{1'd0}, addrSKernelPre_3_dataTemp[13:1]}; // @[FFTEngine.scala 268:40]
  wire [13:0] addrTKernelPre_3_dataTemp_1 = {{1'd0}, addrTKernelPre_3_dataTemp[13:1]}; // @[FFTEngine.scala 268:40]
  wire [13:0] _addrSKernelPre_0_dataTemp_T_2 = {radixCountTemp,2'h0,1'h0,radixCountTemp,2'h0,1'h0}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_24 = {{7'd0}, _addrSKernelPre_0_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [20:0] addrSKernelPre_0_dataTemp_2 = _GEN_24 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [13:0] _addrTKernelPre_0_dataTemp_T_2 = {radixCountTemp,2'h0,1'h1,radixCountTemp,2'h0,1'h1}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_25 = {{7'd0}, _addrTKernelPre_0_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [20:0] addrTKernelPre_0_dataTemp_2 = _GEN_25 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [13:0] _addrSKernelPre_1_dataTemp_T_2 = {radixCountTemp,2'h1,1'h0,radixCountTemp,2'h1,1'h0}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_26 = {{7'd0}, _addrSKernelPre_1_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [20:0] addrSKernelPre_1_dataTemp_2 = _GEN_26 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [13:0] _addrTKernelPre_1_dataTemp_T_2 = {radixCountTemp,2'h1,1'h1,radixCountTemp,2'h1,1'h1}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_27 = {{7'd0}, _addrTKernelPre_1_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [20:0] addrTKernelPre_1_dataTemp_2 = _GEN_27 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [13:0] _addrSKernelPre_2_dataTemp_T_2 = {radixCountTemp,2'h2,1'h0,radixCountTemp,2'h2,1'h0}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_36 = {{7'd0}, _addrSKernelPre_2_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [20:0] addrSKernelPre_2_dataTemp_2 = _GEN_36 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [13:0] _addrTKernelPre_2_dataTemp_T_2 = {radixCountTemp,2'h2,1'h1,radixCountTemp,2'h2,1'h1}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_37 = {{7'd0}, _addrTKernelPre_2_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [20:0] addrTKernelPre_2_dataTemp_2 = _GEN_37 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [13:0] _addrSKernelPre_3_dataTemp_T_2 = {radixCountTemp,2'h3,1'h0,radixCountTemp,2'h3,1'h0}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_38 = {{7'd0}, _addrSKernelPre_3_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [20:0] addrSKernelPre_3_dataTemp_2 = _GEN_38 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [13:0] _addrTKernelPre_3_dataTemp_T_2 = {radixCountTemp,2'h3,1'h1,radixCountTemp,2'h3,1'h1}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_39 = {{7'd0}, _addrTKernelPre_3_dataTemp_T_2}; // @[FFTEngine.scala 263:40]
  wire [20:0] addrTKernelPre_3_dataTemp_2 = _GEN_39 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [6:0] _GEN_28 = _T_15 ? addrSKernelPre_0_dataTemp_1[6:0] : addrSKernelPre_0_dataTemp_2[13:7]; // @[FFTEngine.scala 296:51 298:35 303:35]
  wire [6:0] _GEN_29 = _T_15 ? addrTKernelPre_0_dataTemp_1[6:0] : addrTKernelPre_0_dataTemp_2[13:7]; // @[FFTEngine.scala 296:51 299:35 304:35]
  wire [6:0] _GEN_30 = _T_15 ? addrSKernelPre_1_dataTemp_1[6:0] : addrSKernelPre_1_dataTemp_2[13:7]; // @[FFTEngine.scala 296:51 298:35 303:35]
  wire [6:0] _GEN_31 = _T_15 ? addrTKernelPre_1_dataTemp_1[6:0] : addrTKernelPre_1_dataTemp_2[13:7]; // @[FFTEngine.scala 296:51 299:35 304:35]
  wire [6:0] _GEN_32 = _T_15 ? addrSKernelPre_2_dataTemp_1[6:0] : addrSKernelPre_2_dataTemp_2[13:7]; // @[FFTEngine.scala 296:51 298:35 303:35]
  wire [6:0] _GEN_33 = _T_15 ? addrTKernelPre_2_dataTemp_1[6:0] : addrTKernelPre_2_dataTemp_2[13:7]; // @[FFTEngine.scala 296:51 299:35 304:35]
  wire [6:0] _GEN_34 = _T_15 ? addrSKernelPre_3_dataTemp_1[6:0] : addrSKernelPre_3_dataTemp_2[13:7]; // @[FFTEngine.scala 296:51 298:35 303:35]
  wire [6:0] _GEN_35 = _T_15 ? addrTKernelPre_3_dataTemp_1[6:0] : addrTKernelPre_3_dataTemp_2[13:7]; // @[FFTEngine.scala 296:51 299:35 304:35]
  wire [6:0] addrSKernelPre_0 = _T_6 ? addrSKernelPre_0_dataTemp[6:0] : _GEN_28; // @[FFTEngine.scala 291:42 293:35]
  wire [6:0] addrTKernelPre_0 = _T_6 ? addrTKernelPre_0_dataTemp[6:0] : _GEN_29; // @[FFTEngine.scala 291:42 294:35]
  wire [6:0] addrSKernelPre_1 = _T_6 ? addrSKernelPre_1_dataTemp[6:0] : _GEN_30; // @[FFTEngine.scala 291:42 293:35]
  wire [6:0] addrTKernelPre_1 = _T_6 ? addrTKernelPre_1_dataTemp[6:0] : _GEN_31; // @[FFTEngine.scala 291:42 294:35]
  wire [6:0] addrSKernelPre_2 = _T_6 ? addrSKernelPre_2_dataTemp[6:0] : _GEN_32; // @[FFTEngine.scala 291:42 293:35]
  wire [6:0] addrTKernelPre_2 = _T_6 ? addrTKernelPre_2_dataTemp[6:0] : _GEN_33; // @[FFTEngine.scala 291:42 294:35]
  wire [6:0] addrSKernelPre_3 = _T_6 ? addrSKernelPre_3_dataTemp[6:0] : _GEN_34; // @[FFTEngine.scala 291:42 293:35]
  wire [6:0] addrTKernelPre_3 = _T_6 ? addrTKernelPre_3_dataTemp[6:0] : _GEN_35; // @[FFTEngine.scala 291:42 294:35]
  wire [6:0] _addrTProc_T = ~addrSProc; // @[FFTEngine.scala 332:22]
  wire [6:0] addrTProc = _addrTProc_T + 7'h1; // @[FFTEngine.scala 332:34]
  wire  addrS_0_temp_0 = io_fftMode ? addrSProc[6] : addrSProc[0]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_1 = io_fftMode ? addrSProc[5] : addrSProc[1]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_2 = io_fftMode ? addrSProc[4] : addrSProc[2]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_3 = io_fftMode ? addrSProc[3] : addrSProc[3]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_4 = io_fftMode ? addrSProc[2] : addrSProc[4]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_5 = io_fftMode ? addrSProc[1] : addrSProc[5]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_6 = io_fftMode ? addrSProc[0] : addrSProc[6]; // @[FFTEngine.scala 200:26]
  wire [6:0] _addrS_0_T = {addrS_0_temp_6,addrS_0_temp_5,addrS_0_temp_4,addrS_0_temp_3,addrS_0_temp_2,addrS_0_temp_1,
    addrS_0_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_0_temp_0_1 = addrSKernelPre_0[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_1_1 = addrSKernelPre_0[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_2_1 = addrSKernelPre_0[4]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_3_1 = addrSKernelPre_0[3]; // @[FFTEngine.scala 200:34]
  wire [6:0] _addrS_0_T_1 = {addrSKernelPre_0[0],addrSKernelPre_0[1],addrSKernelPre_0[2],addrS_0_temp_3_1,
    addrS_0_temp_2_1,addrS_0_temp_1_1,addrS_0_temp_0_1}; // @[FFTEngine.scala 201:23]
  wire [6:0] addrS_0 = _radixInit_T_11 ? _addrS_0_T : _addrS_0_T_1; // @[FFTEngine.scala 338:28]
  wire  addrT_0_temp_0 = io_fftMode ? addrTProc[6] : addrTProc[0]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_1 = io_fftMode ? addrTProc[5] : addrTProc[1]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_2 = io_fftMode ? addrTProc[4] : addrTProc[2]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_3 = io_fftMode ? addrTProc[3] : addrTProc[3]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_4 = io_fftMode ? addrTProc[2] : addrTProc[4]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_5 = io_fftMode ? addrTProc[1] : addrTProc[5]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_6 = io_fftMode ? addrTProc[0] : addrTProc[6]; // @[FFTEngine.scala 200:26]
  wire [6:0] _addrT_0_T = {addrT_0_temp_6,addrT_0_temp_5,addrT_0_temp_4,addrT_0_temp_3,addrT_0_temp_2,addrT_0_temp_1,
    addrT_0_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_0_temp_0_1 = addrTKernelPre_0[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_1_1 = addrTKernelPre_0[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_2_1 = addrTKernelPre_0[4]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_3_1 = addrTKernelPre_0[3]; // @[FFTEngine.scala 200:34]
  wire [6:0] _addrT_0_T_1 = {addrTKernelPre_0[0],addrTKernelPre_0[1],addrTKernelPre_0[2],addrT_0_temp_3_1,
    addrT_0_temp_2_1,addrT_0_temp_1_1,addrT_0_temp_0_1}; // @[FFTEngine.scala 201:23]
  wire [6:0] addrT_0 = _radixInit_T_11 ? _addrT_0_T : _addrT_0_T_1; // @[FFTEngine.scala 339:28]
  wire  addrS_1_temp_0 = addrSKernelPre_1[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_1 = addrSKernelPre_1[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_2 = addrSKernelPre_1[4]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_3 = addrSKernelPre_1[3]; // @[FFTEngine.scala 200:34]
  wire [6:0] addrS_1 = {addrSKernelPre_1[0],addrSKernelPre_1[1],addrSKernelPre_1[2],addrS_1_temp_3,addrS_1_temp_2,
    addrS_1_temp_1,addrS_1_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_1_temp_0 = addrTKernelPre_1[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_1 = addrTKernelPre_1[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_2 = addrTKernelPre_1[4]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_3 = addrTKernelPre_1[3]; // @[FFTEngine.scala 200:34]
  wire [6:0] addrT_1 = {addrTKernelPre_1[0],addrTKernelPre_1[1],addrTKernelPre_1[2],addrT_1_temp_3,addrT_1_temp_2,
    addrT_1_temp_1,addrT_1_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_2_temp_0 = addrSKernelPre_2[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_1 = addrSKernelPre_2[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_2 = addrSKernelPre_2[4]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_3 = addrSKernelPre_2[3]; // @[FFTEngine.scala 200:34]
  wire [6:0] addrS_2 = {addrSKernelPre_2[0],addrSKernelPre_2[1],addrSKernelPre_2[2],addrS_2_temp_3,addrS_2_temp_2,
    addrS_2_temp_1,addrS_2_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_2_temp_0 = addrTKernelPre_2[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_1 = addrTKernelPre_2[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_2 = addrTKernelPre_2[4]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_3 = addrTKernelPre_2[3]; // @[FFTEngine.scala 200:34]
  wire [6:0] addrT_2 = {addrTKernelPre_2[0],addrTKernelPre_2[1],addrTKernelPre_2[2],addrT_2_temp_3,addrT_2_temp_2,
    addrT_2_temp_1,addrT_2_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_3_temp_0 = addrSKernelPre_3[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_1 = addrSKernelPre_3[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_2 = addrSKernelPre_3[4]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_3 = addrSKernelPre_3[3]; // @[FFTEngine.scala 200:34]
  wire [6:0] addrS_3 = {addrSKernelPre_3[0],addrSKernelPre_3[1],addrSKernelPre_3[2],addrS_3_temp_3,addrS_3_temp_2,
    addrS_3_temp_1,addrS_3_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_3_temp_0 = addrTKernelPre_3[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_1 = addrTKernelPre_3[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_2 = addrTKernelPre_3[4]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_3 = addrTKernelPre_3[3]; // @[FFTEngine.scala 200:34]
  wire [6:0] addrT_3 = {addrTKernelPre_3[0],addrTKernelPre_3[1],addrTKernelPre_3[2],addrT_3_temp_3,addrT_3_temp_2,
    addrT_3_temp_1,addrT_3_temp_0}; // @[FFTEngine.scala 201:23]
  wire  sameAddr = addrS_0 == addrT_0; // @[FFTEngine.scala 346:29]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T = {{2'd0}, addrS_0[6:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1265 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_2 = {{1'd0}, _GEN_1265}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_4 = {{5'd0}, addrS_0[6:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1267 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_0_0 = _addrSBankSelKernelPrePre_sum_T_2[2:0] + _GEN_1267; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_7 = {{1'd0}, addrS_0[6:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1269 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_7[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_9 = {{1'd0}, _GEN_1269}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_11 = {{4'd0}, addrS_0[6:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1271 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_0_1 = _addrSBankSelKernelPrePre_sum_T_9[2:0] + _GEN_1271; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1272 = {{2'd0}, addrS_0[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_16 = {{1'd0}, _GEN_1272}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_18 = {{3'd0}, addrS_0[6:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1274 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_18[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_21 = _addrSBankSelKernelPrePre_sum_T_16[2:0] + _GEN_1274; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_22 = {{6'd0}, addrS_0[6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1276 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_22[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_0_2 = _addrSBankSelKernelPrePre_sum_T_21 + _GEN_1276; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_25 = {{2'd0}, addrS_1[6:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1278 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_25[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_27 = {{1'd0}, _GEN_1278}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_29 = {{5'd0}, addrS_1[6:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1280 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_29[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_1_0 = _addrSBankSelKernelPrePre_sum_T_27[2:0] + _GEN_1280; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_32 = {{1'd0}, addrS_1[6:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1282 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_32[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_34 = {{1'd0}, _GEN_1282}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_36 = {{4'd0}, addrS_1[6:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1284 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_36[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_1_1 = _addrSBankSelKernelPrePre_sum_T_34[2:0] + _GEN_1284; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1285 = {{2'd0}, addrS_1[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_41 = {{1'd0}, _GEN_1285}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_43 = {{3'd0}, addrS_1[6:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1287 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_43[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_46 = _addrSBankSelKernelPrePre_sum_T_41[2:0] + _GEN_1287; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_47 = {{6'd0}, addrS_1[6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1289 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_47[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_1_2 = _addrSBankSelKernelPrePre_sum_T_46 + _GEN_1289; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_50 = {{2'd0}, addrS_2[6:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1291 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_50[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_52 = {{1'd0}, _GEN_1291}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_54 = {{5'd0}, addrS_2[6:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1293 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_54[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_2_0 = _addrSBankSelKernelPrePre_sum_T_52[2:0] + _GEN_1293; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_57 = {{1'd0}, addrS_2[6:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1295 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_57[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_59 = {{1'd0}, _GEN_1295}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_61 = {{4'd0}, addrS_2[6:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1297 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_61[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_2_1 = _addrSBankSelKernelPrePre_sum_T_59[2:0] + _GEN_1297; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1298 = {{2'd0}, addrS_2[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_66 = {{1'd0}, _GEN_1298}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_68 = {{3'd0}, addrS_2[6:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1300 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_68[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_71 = _addrSBankSelKernelPrePre_sum_T_66[2:0] + _GEN_1300; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_72 = {{6'd0}, addrS_2[6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1302 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_72[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_2_2 = _addrSBankSelKernelPrePre_sum_T_71 + _GEN_1302; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_75 = {{2'd0}, addrS_3[6:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1304 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_75[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_77 = {{1'd0}, _GEN_1304}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_79 = {{5'd0}, addrS_3[6:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1306 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_79[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_3_0 = _addrSBankSelKernelPrePre_sum_T_77[2:0] + _GEN_1306; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_82 = {{1'd0}, addrS_3[6:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1308 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_82[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_84 = {{1'd0}, _GEN_1308}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_86 = {{4'd0}, addrS_3[6:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1310 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_86[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_3_1 = _addrSBankSelKernelPrePre_sum_T_84[2:0] + _GEN_1310; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1311 = {{2'd0}, addrS_3[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPrePre_sum_T_91 = {{1'd0}, _GEN_1311}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_93 = {{3'd0}, addrS_3[6:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1313 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_93[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_96 = _addrSBankSelKernelPrePre_sum_T_91[2:0] + _GEN_1313; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrSBankSelKernelPrePre_sum_T_97 = {{6'd0}, addrS_3[6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1315 = {{2'd0}, _addrSBankSelKernelPrePre_sum_T_97[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrSBankSelKernelPrePre_3_2 = _addrSBankSelKernelPrePre_sum_T_96 + _GEN_1315; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrSBankSelKernelPre_T_1 = {{1'd0}, addrSBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_3 = {_addrSBankSelKernelPre_T_1[2:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [3:0] _GEN_1316 = {{1'd0}, addrSBankSelKernelPrePre_0_1}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_5 = _addrSBankSelKernelPre_T_3 + _GEN_1316; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_6 = {_addrSBankSelKernelPre_T_5, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_1317 = {{2'd0}, addrSBankSelKernelPrePre_0_2}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_8 = _addrSBankSelKernelPre_T_6 + _GEN_1317; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_10 = {{1'd0}, addrSBankSelKernelPrePre_1_0}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_12 = {_addrSBankSelKernelPre_T_10[2:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [3:0] _GEN_1318 = {{1'd0}, addrSBankSelKernelPrePre_1_1}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_14 = _addrSBankSelKernelPre_T_12 + _GEN_1318; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_15 = {_addrSBankSelKernelPre_T_14, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_1319 = {{2'd0}, addrSBankSelKernelPrePre_1_2}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_17 = _addrSBankSelKernelPre_T_15 + _GEN_1319; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_19 = {{1'd0}, addrSBankSelKernelPrePre_2_0}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_21 = {_addrSBankSelKernelPre_T_19[2:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [3:0] _GEN_1320 = {{1'd0}, addrSBankSelKernelPrePre_2_1}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_23 = _addrSBankSelKernelPre_T_21 + _GEN_1320; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_24 = {_addrSBankSelKernelPre_T_23, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_1321 = {{2'd0}, addrSBankSelKernelPrePre_2_2}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_26 = _addrSBankSelKernelPre_T_24 + _GEN_1321; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_28 = {{1'd0}, addrSBankSelKernelPrePre_3_0}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_30 = {_addrSBankSelKernelPre_T_28[2:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [3:0] _GEN_1322 = {{1'd0}, addrSBankSelKernelPrePre_3_1}; // @[FFTEngine.scala 355:144]
  wire [3:0] _addrSBankSelKernelPre_T_32 = _addrSBankSelKernelPre_T_30 + _GEN_1322; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_33 = {_addrSBankSelKernelPre_T_32, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_1323 = {{2'd0}, addrSBankSelKernelPrePre_3_2}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_35 = _addrSBankSelKernelPre_T_33 + _GEN_1323; // @[FFTEngine.scala 355:144]
  wire [2:0] addrSBankSelKernelPre_0 = _addrSBankSelKernelPre_T_8[2:0]; // @[FFTEngine.scala 355:160]
  wire [2:0] addrSBankSelKernelPre_1 = _addrSBankSelKernelPre_T_17[2:0]; // @[FFTEngine.scala 355:160]
  wire [2:0] addrSBankSelKernelPre_2 = _addrSBankSelKernelPre_T_26[2:0]; // @[FFTEngine.scala 355:160]
  wire [2:0] addrSBankSelKernelPre_3 = _addrSBankSelKernelPre_T_35[2:0]; // @[FFTEngine.scala 355:160]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T = {{2'd0}, addrT_0[6:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1325 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_2 = {{1'd0}, _GEN_1325}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_4 = {{5'd0}, addrT_0[6:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1327 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_0_0 = _addrTBankSelKernelPrePre_sum_T_2[2:0] + _GEN_1327; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_7 = {{1'd0}, addrT_0[6:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1329 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_7[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_9 = {{1'd0}, _GEN_1329}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_11 = {{4'd0}, addrT_0[6:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1331 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_0_1 = _addrTBankSelKernelPrePre_sum_T_9[2:0] + _GEN_1331; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1332 = {{2'd0}, addrT_0[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_16 = {{1'd0}, _GEN_1332}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_18 = {{3'd0}, addrT_0[6:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1334 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_18[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_21 = _addrTBankSelKernelPrePre_sum_T_16[2:0] + _GEN_1334; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_22 = {{6'd0}, addrT_0[6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1336 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_22[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_0_2 = _addrTBankSelKernelPrePre_sum_T_21 + _GEN_1336; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_25 = {{2'd0}, addrT_1[6:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1338 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_25[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_27 = {{1'd0}, _GEN_1338}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_29 = {{5'd0}, addrT_1[6:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1340 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_29[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_1_0 = _addrTBankSelKernelPrePre_sum_T_27[2:0] + _GEN_1340; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_32 = {{1'd0}, addrT_1[6:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1342 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_32[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_34 = {{1'd0}, _GEN_1342}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_36 = {{4'd0}, addrT_1[6:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1344 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_36[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_1_1 = _addrTBankSelKernelPrePre_sum_T_34[2:0] + _GEN_1344; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1345 = {{2'd0}, addrT_1[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_41 = {{1'd0}, _GEN_1345}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_43 = {{3'd0}, addrT_1[6:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1347 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_43[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_46 = _addrTBankSelKernelPrePre_sum_T_41[2:0] + _GEN_1347; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_47 = {{6'd0}, addrT_1[6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1349 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_47[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_1_2 = _addrTBankSelKernelPrePre_sum_T_46 + _GEN_1349; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_50 = {{2'd0}, addrT_2[6:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1351 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_50[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_52 = {{1'd0}, _GEN_1351}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_54 = {{5'd0}, addrT_2[6:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1353 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_54[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_2_0 = _addrTBankSelKernelPrePre_sum_T_52[2:0] + _GEN_1353; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_57 = {{1'd0}, addrT_2[6:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1355 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_57[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_59 = {{1'd0}, _GEN_1355}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_61 = {{4'd0}, addrT_2[6:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1357 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_61[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_2_1 = _addrTBankSelKernelPrePre_sum_T_59[2:0] + _GEN_1357; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1358 = {{2'd0}, addrT_2[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_66 = {{1'd0}, _GEN_1358}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_68 = {{3'd0}, addrT_2[6:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1360 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_68[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_71 = _addrTBankSelKernelPrePre_sum_T_66[2:0] + _GEN_1360; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_72 = {{6'd0}, addrT_2[6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1362 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_72[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_2_2 = _addrTBankSelKernelPrePre_sum_T_71 + _GEN_1362; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_75 = {{2'd0}, addrT_3[6:2]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1364 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_75[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_77 = {{1'd0}, _GEN_1364}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_79 = {{5'd0}, addrT_3[6:5]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1366 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_79[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_3_0 = _addrTBankSelKernelPrePre_sum_T_77[2:0] + _GEN_1366; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_82 = {{1'd0}, addrT_3[6:1]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1368 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_82[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_84 = {{1'd0}, _GEN_1368}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_86 = {{4'd0}, addrT_3[6:4]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1370 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_86[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_3_1 = _addrTBankSelKernelPrePre_sum_T_84[2:0] + _GEN_1370; // @[FFTEngine.scala 349:107]
  wire [2:0] _GEN_1371 = {{2'd0}, addrT_3[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPrePre_sum_T_91 = {{1'd0}, _GEN_1371}; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_93 = {{3'd0}, addrT_3[6:3]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1373 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_93[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_96 = _addrTBankSelKernelPrePre_sum_T_91[2:0] + _GEN_1373; // @[FFTEngine.scala 349:107]
  wire [6:0] _addrTBankSelKernelPrePre_sum_T_97 = {{6'd0}, addrT_3[6]}; // @[FFTEngine.scala 349:115]
  wire [2:0] _GEN_1375 = {{2'd0}, _addrTBankSelKernelPrePre_sum_T_97[0]}; // @[FFTEngine.scala 349:107]
  wire [2:0] addrTBankSelKernelPrePre_3_2 = _addrTBankSelKernelPrePre_sum_T_96 + _GEN_1375; // @[FFTEngine.scala 349:107]
  wire [3:0] _addrTBankSelKernelPre_T_1 = {{1'd0}, addrTBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_3 = {_addrTBankSelKernelPre_T_1[2:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [3:0] _GEN_1376 = {{1'd0}, addrTBankSelKernelPrePre_0_1}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_5 = _addrTBankSelKernelPre_T_3 + _GEN_1376; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_6 = {_addrTBankSelKernelPre_T_5, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_1377 = {{2'd0}, addrTBankSelKernelPrePre_0_2}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_8 = _addrTBankSelKernelPre_T_6 + _GEN_1377; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_10 = {{1'd0}, addrTBankSelKernelPrePre_1_0}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_12 = {_addrTBankSelKernelPre_T_10[2:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [3:0] _GEN_1378 = {{1'd0}, addrTBankSelKernelPrePre_1_1}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_14 = _addrTBankSelKernelPre_T_12 + _GEN_1378; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_15 = {_addrTBankSelKernelPre_T_14, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_1379 = {{2'd0}, addrTBankSelKernelPrePre_1_2}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_17 = _addrTBankSelKernelPre_T_15 + _GEN_1379; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_19 = {{1'd0}, addrTBankSelKernelPrePre_2_0}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_21 = {_addrTBankSelKernelPre_T_19[2:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [3:0] _GEN_1380 = {{1'd0}, addrTBankSelKernelPrePre_2_1}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_23 = _addrTBankSelKernelPre_T_21 + _GEN_1380; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_24 = {_addrTBankSelKernelPre_T_23, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_1381 = {{2'd0}, addrTBankSelKernelPrePre_2_2}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_26 = _addrTBankSelKernelPre_T_24 + _GEN_1381; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_28 = {{1'd0}, addrTBankSelKernelPrePre_3_0}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_30 = {_addrTBankSelKernelPre_T_28[2:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [3:0] _GEN_1382 = {{1'd0}, addrTBankSelKernelPrePre_3_1}; // @[FFTEngine.scala 361:144]
  wire [3:0] _addrTBankSelKernelPre_T_32 = _addrTBankSelKernelPre_T_30 + _GEN_1382; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_33 = {_addrTBankSelKernelPre_T_32, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_1383 = {{2'd0}, addrTBankSelKernelPrePre_3_2}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_35 = _addrTBankSelKernelPre_T_33 + _GEN_1383; // @[FFTEngine.scala 361:144]
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
  wire  addrSBankSelProcPre__0 = addrS_0[0] ^ addrS_0[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__0 = addrT_0[0] ^ addrT_0[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre__1 = addrS_0[1] ^ addrS_0[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__1 = addrT_0[1] ^ addrT_0[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre__2 = addrS_0[2] ^ addrS_0[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__2 = addrT_0[2] ^ addrT_0[4]; // @[FFTEngine.scala 383:55]
  wire [2:0] addrSBankSelProc_0 = {addrSBankSelProcPre__0,addrSBankSelProcPre__1,addrSBankSelProcPre__2}; // @[Cat.scala 33:92]
  wire [2:0] addrTBankSelProc_0 = {addrTBankSelProcPre__0,addrTBankSelProcPre__1,addrTBankSelProcPre__2}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_1_0 = addrS_1[0] ^ addrS_1[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_0 = addrT_1[0] ^ addrT_1[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_1_1 = addrS_1[1] ^ addrS_1[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_1 = addrT_1[1] ^ addrT_1[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_1_2 = addrS_1[2] ^ addrS_1[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_2 = addrT_1[2] ^ addrT_1[4]; // @[FFTEngine.scala 383:55]
  wire [2:0] addrSBankSelProc_1 = {addrSBankSelProcPre_1_0,addrSBankSelProcPre_1_1,addrSBankSelProcPre_1_2}; // @[Cat.scala 33:92]
  wire [2:0] addrTBankSelProc_1 = {addrTBankSelProcPre_1_0,addrTBankSelProcPre_1_1,addrTBankSelProcPre_1_2}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_2_0 = addrS_2[0] ^ addrS_2[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_0 = addrT_2[0] ^ addrT_2[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_2_1 = addrS_2[1] ^ addrS_2[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_1 = addrT_2[1] ^ addrT_2[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_2_2 = addrS_2[2] ^ addrS_2[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_2 = addrT_2[2] ^ addrT_2[4]; // @[FFTEngine.scala 383:55]
  wire [2:0] addrSBankSelProc_2 = {addrSBankSelProcPre_2_0,addrSBankSelProcPre_2_1,addrSBankSelProcPre_2_2}; // @[Cat.scala 33:92]
  wire [2:0] addrTBankSelProc_2 = {addrTBankSelProcPre_2_0,addrTBankSelProcPre_2_1,addrTBankSelProcPre_2_2}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_3_0 = addrS_3[0] ^ addrS_3[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_0 = addrT_3[0] ^ addrT_3[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_3_1 = addrS_3[1] ^ addrS_3[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_1 = addrT_3[1] ^ addrT_3[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_3_2 = addrS_3[2] ^ addrS_3[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_2 = addrT_3[2] ^ addrT_3[4]; // @[FFTEngine.scala 383:55]
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
  reg [3:0] addrS1c; // @[Reg.scala 35:20]
  reg [3:0] addrS2c; // @[Reg.scala 35:20]
  reg [3:0] addrS3c; // @[Reg.scala 35:20]
  reg [3:0] addrT1c; // @[Reg.scala 35:20]
  reg [3:0] addrT2c; // @[Reg.scala 35:20]
  reg [3:0] addrT3c; // @[Reg.scala 35:20]
  wire [2:0] _addrSBankSel_T_1 = _radixInit_T_11 ? addrSBankSelProc_0 : addrSBankSelKernel_0; // @[FFTEngine.scala 471:32]
  wire  _addrSBankSel_T_2 = phaseCount == 3'h0; // @[FFTEngine.scala 474:72]
  wire  _addrSBankSel_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0; // @[FFTEngine.scala 474:43]
  wire [2:0] _addrSBankSel_T_5 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_0 :
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
  wire [6:0] _fftCalc_io_nk_T_2 = {nk_0[5:0],1'h0}; // @[Cat.scala 33:92]
  wire  _GEN_160 = 3'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_161 = 3'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_160; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_162 = 3'h3 == phaseCount ? io_fftRShiftP0_3 : _GEN_161; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_163 = 3'h4 == phaseCount ? io_fftRShiftP0_4 : _GEN_162; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_164 = 3'h5 == phaseCount ? io_fftRShiftP0_5 : _GEN_163; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_165 = 3'h6 == phaseCount ? io_fftRShiftP0_6 : _GEN_164; // @[FFTEngine.scala 491:{36,36}]
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
  wire  _GEN_168 = (3'h0 == addrSBankSelProc3c_0_r | 3'h0 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_169 = (3'h0 == addrSBankSelProc3c_0_r | 3'h0 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_172 = (3'h1 == addrSBankSelProc3c_0_r | 3'h1 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_173 = (3'h1 == addrSBankSelProc3c_0_r | 3'h1 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_176 = (3'h2 == addrSBankSelProc3c_0_r | 3'h2 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_177 = (3'h2 == addrSBankSelProc3c_0_r | 3'h2 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_180 = (3'h3 == addrSBankSelProc3c_0_r | 3'h3 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_181 = (3'h3 == addrSBankSelProc3c_0_r | 3'h3 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_184 = (3'h4 == addrSBankSelProc3c_0_r | 3'h4 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_185 = (3'h4 == addrSBankSelProc3c_0_r | 3'h4 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_188 = (3'h5 == addrSBankSelProc3c_0_r | 3'h5 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_189 = (3'h5 == addrSBankSelProc3c_0_r | 3'h5 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_192 = (3'h6 == addrSBankSelProc3c_0_r | 3'h6 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_193 = (3'h6 == addrSBankSelProc3c_0_r | 3'h6 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_196 = (3'h7 == addrSBankSelProc3c_0_r | 3'h7 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_197 = (3'h7 == addrSBankSelProc3c_0_r | 3'h7 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire [3:0] _GEN_208 = 3'h0 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_209 = 3'h1 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_210 = 3'h2 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_211 = 3'h3 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_212 = 3'h4 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_213 = 3'h5 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_214 = 3'h6 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_215 = 3'h7 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_296 = ~_radixInit_T_11 ? _GEN_208 : _GEN_208; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_297 = ~_radixInit_T_11 ? _GEN_209 : _GEN_209; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_298 = ~_radixInit_T_11 ? _GEN_210 : _GEN_210; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_299 = ~_radixInit_T_11 ? _GEN_211 : _GEN_211; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_300 = ~_radixInit_T_11 ? _GEN_212 : _GEN_212; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_301 = ~_radixInit_T_11 ? _GEN_213 : _GEN_213; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_302 = ~_radixInit_T_11 ? _GEN_214 : _GEN_214; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_303 = ~_radixInit_T_11 ? _GEN_215 : _GEN_215; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_312 = 3'h0 == addrTBankSel3c ? addrT3c : _GEN_296; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_313 = 3'h1 == addrTBankSel3c ? addrT3c : _GEN_297; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_314 = 3'h2 == addrTBankSel3c ? addrT3c : _GEN_298; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_315 = 3'h3 == addrTBankSel3c ? addrT3c : _GEN_299; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_316 = 3'h4 == addrTBankSel3c ? addrT3c : _GEN_300; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_317 = 3'h5 == addrTBankSel3c ? addrT3c : _GEN_301; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_318 = 3'h6 == addrTBankSel3c ? addrT3c : _GEN_302; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_319 = 3'h7 == addrTBankSel3c ? addrT3c : _GEN_303; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_320 = 3'h0 == addrSBankSel3c ? addrS3c : _GEN_312; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_321 = 3'h1 == addrSBankSel3c ? addrS3c : _GEN_313; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_322 = 3'h2 == addrSBankSel3c ? addrS3c : _GEN_314; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_323 = 3'h3 == addrSBankSel3c ? addrS3c : _GEN_315; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_324 = 3'h4 == addrSBankSel3c ? addrS3c : _GEN_316; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_325 = 3'h5 == addrSBankSel3c ? addrS3c : _GEN_317; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_326 = 3'h6 == addrSBankSel3c ? addrS3c : _GEN_318; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_327 = 3'h7 == addrSBankSel3c ? addrS3c : _GEN_319; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_344 = _srcBufferNext_T_3 ? _GEN_320 : _GEN_296; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_345 = _srcBufferNext_T_3 ? _GEN_321 : _GEN_297; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_346 = _srcBufferNext_T_3 ? _GEN_322 : _GEN_298; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_347 = _srcBufferNext_T_3 ? _GEN_323 : _GEN_299; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_348 = _srcBufferNext_T_3 ? _GEN_324 : _GEN_300; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_349 = _srcBufferNext_T_3 ? _GEN_325 : _GEN_301; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_350 = _srcBufferNext_T_3 ? _GEN_326 : _GEN_302; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_351 = _srcBufferNext_T_3 ? _GEN_327 : _GEN_303; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_352 = _srcBufferNext_T_3 ? _GEN_296 : _GEN_320; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_353 = _srcBufferNext_T_3 ? _GEN_297 : _GEN_321; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_354 = _srcBufferNext_T_3 ? _GEN_298 : _GEN_322; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_355 = _srcBufferNext_T_3 ? _GEN_299 : _GEN_323; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_356 = _srcBufferNext_T_3 ? _GEN_300 : _GEN_324; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_357 = _srcBufferNext_T_3 ? _GEN_301 : _GEN_325; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_358 = _srcBufferNext_T_3 ? _GEN_302 : _GEN_326; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_359 = _srcBufferNext_T_3 ? _GEN_303 : _GEN_327; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_408 = ~procState3c ? _GEN_344 : _GEN_344; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_409 = ~procState3c ? _GEN_345 : _GEN_345; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_410 = ~procState3c ? _GEN_346 : _GEN_346; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_411 = ~procState3c ? _GEN_347 : _GEN_347; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_412 = ~procState3c ? _GEN_348 : _GEN_348; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_413 = ~procState3c ? _GEN_349 : _GEN_349; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_414 = ~procState3c ? _GEN_350 : _GEN_350; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_415 = ~procState3c ? _GEN_351 : _GEN_351; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_416 = ~procState3c ? _GEN_352 : _GEN_352; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_417 = ~procState3c ? _GEN_353 : _GEN_353; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_418 = ~procState3c ? _GEN_354 : _GEN_354; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_419 = ~procState3c ? _GEN_355 : _GEN_355; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_420 = ~procState3c ? _GEN_356 : _GEN_356; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_421 = ~procState3c ? _GEN_357 : _GEN_357; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_422 = ~procState3c ? _GEN_358 : _GEN_358; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_423 = ~procState3c ? _GEN_359 : _GEN_359; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T = fftCalc_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T = writeDataTRPre3c[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_424 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T[14]}},_writeDataS3c_re_T}) : $signed(
    fftCalc_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_425 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T[14]}},_writeDataS3c_im_T}) : $signed(
    fftCalc_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_429 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c) : $signed(_GEN_425); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_433 = fftCalc_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_im = sameAddr3c ? $signed(_GEN_429) : $signed(_GEN_433); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_426 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_im) : $signed(writeDataTIPre3c); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_428 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_io_dataOutSR3c) : $signed(_GEN_424); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_432 = fftCalc_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_re = sameAddr3c ? $signed(_GEN_428) : $signed(_GEN_432); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_427 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_re) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_430 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_im) : $signed(_GEN_426); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_431 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_re) : $signed(_GEN_427); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_2 = 16'sh0 - $signed(writeDataTIPre3c); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_435 = _addrSBankSel3c_T_1 & addrTBankSel3c == 3'h4 & addrT3c == 4'h1 ? $signed(_writeDataT3c_im_T_2)
     : $signed(writeDataTIPre3c); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T = sameAddr3c ? $signed(_GEN_428) : $signed(_GEN_432); // @[FFTEngine.scala 604:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_1 = sameAddr3c ? $signed(_GEN_429) : $signed(_GEN_433); // @[FFTEngine.scala 604:66]
  wire [31:0] _io_writeDataSram0Bank_0_T_2 = {_io_writeDataSram0Bank_0_T_1,_io_writeDataSram0Bank_0_T}; // @[FFTEngine.scala 604:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_3 = sameAddr3c ? $signed(_GEN_431) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 607:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_4 = sameAddr3c ? $signed(_GEN_430) : $signed(_GEN_435); // @[FFTEngine.scala 607:66]
  wire [31:0] _io_writeDataSram0Bank_0_T_5 = {_io_writeDataSram0Bank_0_T_4,_io_writeDataSram0Bank_0_T_3}; // @[FFTEngine.scala 607:66]
  wire [31:0] _GEN_442 = 3'h0 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_448 = procState3c ? _GEN_442 : _GEN_442; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_452 = 3'h1 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_458 = procState3c ? _GEN_452 : _GEN_452; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_462 = 3'h2 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_468 = procState3c ? _GEN_462 : _GEN_462; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_472 = 3'h3 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_478 = procState3c ? _GEN_472 : _GEN_472; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_482 = 3'h4 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_488 = procState3c ? _GEN_482 : _GEN_482; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_492 = 3'h5 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_498 = procState3c ? _GEN_492 : _GEN_492; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_502 = 3'h6 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_508 = procState3c ? _GEN_502 : _GEN_502; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_512 = 3'h7 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_518 = procState3c ? _GEN_512 : _GEN_512; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_1; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_1; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_1; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_1; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_1; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_1; // @[Reg.scala 35:20]
  wire [2:0] _addrSBankSel_T_6 = _radixInit_T_11 ? addrSBankSelProc_1 : addrSBankSelKernel_1; // @[FFTEngine.scala 471:32]
  wire [2:0] _addrTBankSel_T_6 = _radixInit_T_11 ? addrTBankSelProc_1 : addrTBankSelKernel_1; // @[FFTEngine.scala 472:32]
  wire [2:0] _addrSBankSel_T_10 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_1 :
    addrSBankSelKernel_1; // @[FFTEngine.scala 474:32]
  wire [2:0] _addrTBankSel_T_10 = _addrSBankSel_T_4 ? addrTBankSelProc_1 : addrTBankSelKernel_1; // @[FFTEngine.scala 475:32]
  wire [2:0] addrSBankSel_1 = io_fftMode ? _addrSBankSel_T_6 : _addrSBankSel_T_10; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [2:0] addrTBankSel_1 = io_fftMode ? _addrTBankSel_T_6 : _addrTBankSel_T_10; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [2:0] addrSBankSel1c_1; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_1; // @[Reg.scala 35:20]
  wire [15:0] _GEN_531 = 3'h1 == addrSBankSel1c_1 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_532 = 3'h2 == addrSBankSel1c_1 ? $signed(dataInPre_2_re) : $signed(_GEN_531); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_533 = 3'h3 == addrSBankSel1c_1 ? $signed(dataInPre_3_re) : $signed(_GEN_532); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_534 = 3'h4 == addrSBankSel1c_1 ? $signed(dataInPre_4_re) : $signed(_GEN_533); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_535 = 3'h5 == addrSBankSel1c_1 ? $signed(dataInPre_5_re) : $signed(_GEN_534); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_536 = 3'h6 == addrSBankSel1c_1 ? $signed(dataInPre_6_re) : $signed(_GEN_535); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_539 = 3'h1 == addrSBankSel1c_1 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_540 = 3'h2 == addrSBankSel1c_1 ? $signed(dataInPre_2_im) : $signed(_GEN_539); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_541 = 3'h3 == addrSBankSel1c_1 ? $signed(dataInPre_3_im) : $signed(_GEN_540); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_542 = 3'h4 == addrSBankSel1c_1 ? $signed(dataInPre_4_im) : $signed(_GEN_541); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_543 = 3'h5 == addrSBankSel1c_1 ? $signed(dataInPre_5_im) : $signed(_GEN_542); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_544 = 3'h6 == addrSBankSel1c_1 ? $signed(dataInPre_6_im) : $signed(_GEN_543); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_545 = 3'h7 == addrSBankSel1c_1 ? $signed(dataInPre_7_im) : $signed(_GEN_544); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_547 = 3'h1 == addrTBankSel1c_1 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_548 = 3'h2 == addrTBankSel1c_1 ? $signed(dataInPre_2_im) : $signed(_GEN_547); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_549 = 3'h3 == addrTBankSel1c_1 ? $signed(dataInPre_3_im) : $signed(_GEN_548); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_550 = 3'h4 == addrTBankSel1c_1 ? $signed(dataInPre_4_im) : $signed(_GEN_549); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_551 = 3'h5 == addrTBankSel1c_1 ? $signed(dataInPre_5_im) : $signed(_GEN_550); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_552 = 3'h6 == addrTBankSel1c_1 ? $signed(dataInPre_6_im) : $signed(_GEN_551); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_553 = 3'h7 == addrTBankSel1c_1 ? $signed(dataInPre_7_im) : $signed(_GEN_552); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_555 = 3'h1 == addrTBankSel1c_1 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_556 = 3'h2 == addrTBankSel1c_1 ? $signed(dataInPre_2_re) : $signed(_GEN_555); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_557 = 3'h3 == addrTBankSel1c_1 ? $signed(dataInPre_3_re) : $signed(_GEN_556); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_558 = 3'h4 == addrTBankSel1c_1 ? $signed(dataInPre_4_re) : $signed(_GEN_557); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_559 = 3'h5 == addrTBankSel1c_1 ? $signed(dataInPre_5_re) : $signed(_GEN_558); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_560 = 3'h6 == addrTBankSel1c_1 ? $signed(dataInPre_6_re) : $signed(_GEN_559); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_561 = 3'h7 == addrTBankSel1c_1 ? $signed(dataInPre_7_re) : $signed(_GEN_560); // @[FFTEngine.scala 484:{35,35}]
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
  wire [3:0] _GEN_572 = 3'h0 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_416; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_573 = 3'h1 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_417; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_574 = 3'h2 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_418; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_575 = 3'h3 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_419; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_576 = 3'h4 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_420; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_577 = 3'h5 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_421; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_578 = 3'h6 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_422; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_579 = 3'h7 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_423; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_580 = 3'h0 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_572; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_581 = 3'h1 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_573; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_582 = 3'h2 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_574; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_583 = 3'h3 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_575; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_584 = 3'h4 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_576; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_585 = 3'h5 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_577; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_586 = 3'h6 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_578; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_587 = 3'h7 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_579; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_588 = 3'h0 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_408; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_589 = 3'h1 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_409; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_590 = 3'h2 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_410; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_591 = 3'h3 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_411; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_592 = 3'h4 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_412; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_593 = 3'h5 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_413; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_594 = 3'h6 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_414; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_595 = 3'h7 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_415; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_596 = 3'h0 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_588; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_597 = 3'h1 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_589; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_598 = 3'h2 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_590; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_599 = 3'h3 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_591; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_600 = 3'h4 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_592; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_601 = 3'h5 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_593; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_602 = 3'h6 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_594; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_603 = 3'h7 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_595; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_604 = _srcBufferNext_T_3 ? _GEN_580 : _GEN_416; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_605 = _srcBufferNext_T_3 ? _GEN_581 : _GEN_417; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_606 = _srcBufferNext_T_3 ? _GEN_582 : _GEN_418; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_607 = _srcBufferNext_T_3 ? _GEN_583 : _GEN_419; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_608 = _srcBufferNext_T_3 ? _GEN_584 : _GEN_420; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_609 = _srcBufferNext_T_3 ? _GEN_585 : _GEN_421; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_610 = _srcBufferNext_T_3 ? _GEN_586 : _GEN_422; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_611 = _srcBufferNext_T_3 ? _GEN_587 : _GEN_423; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_612 = _srcBufferNext_T_3 ? _GEN_408 : _GEN_596; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_613 = _srcBufferNext_T_3 ? _GEN_409 : _GEN_597; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_614 = _srcBufferNext_T_3 ? _GEN_410 : _GEN_598; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_615 = _srcBufferNext_T_3 ? _GEN_411 : _GEN_599; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_616 = _srcBufferNext_T_3 ? _GEN_412 : _GEN_600; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_617 = _srcBufferNext_T_3 ? _GEN_413 : _GEN_601; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_618 = _srcBufferNext_T_3 ? _GEN_414 : _GEN_602; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_619 = _srcBufferNext_T_3 ? _GEN_415 : _GEN_603; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_620 = ~_radixInit_T_11 ? _GEN_604 : _GEN_416; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_621 = ~_radixInit_T_11 ? _GEN_605 : _GEN_417; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_622 = ~_radixInit_T_11 ? _GEN_606 : _GEN_418; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_623 = ~_radixInit_T_11 ? _GEN_607 : _GEN_419; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_624 = ~_radixInit_T_11 ? _GEN_608 : _GEN_420; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_625 = ~_radixInit_T_11 ? _GEN_609 : _GEN_421; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_626 = ~_radixInit_T_11 ? _GEN_610 : _GEN_422; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_627 = ~_radixInit_T_11 ? _GEN_611 : _GEN_423; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_628 = ~_radixInit_T_11 ? _GEN_612 : _GEN_408; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_629 = ~_radixInit_T_11 ? _GEN_613 : _GEN_409; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_630 = ~_radixInit_T_11 ? _GEN_614 : _GEN_410; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_631 = ~_radixInit_T_11 ? _GEN_615 : _GEN_411; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_632 = ~_radixInit_T_11 ? _GEN_616 : _GEN_412; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_633 = ~_radixInit_T_11 ? _GEN_617 : _GEN_413; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_634 = ~_radixInit_T_11 ? _GEN_618 : _GEN_414; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_635 = ~_radixInit_T_11 ? _GEN_619 : _GEN_415; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_636 = 3'h0 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_628; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_637 = 3'h1 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_629; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_638 = 3'h2 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_630; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_639 = 3'h3 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_631; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_640 = 3'h4 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_632; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_641 = 3'h5 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_633; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_642 = 3'h6 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_634; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_643 = 3'h7 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_635; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_644 = 3'h0 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_636; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_645 = 3'h1 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_637; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_646 = 3'h2 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_638; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_647 = 3'h3 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_639; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_648 = 3'h4 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_640; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_649 = 3'h5 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_641; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_650 = 3'h6 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_642; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_651 = 3'h7 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_643; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_652 = 3'h0 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_620; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_653 = 3'h1 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_621; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_654 = 3'h2 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_622; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_655 = 3'h3 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_623; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_656 = 3'h4 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_624; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_657 = 3'h5 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_625; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_658 = 3'h6 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_626; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_659 = 3'h7 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_627; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_660 = 3'h0 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_652; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_661 = 3'h1 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_653; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_662 = 3'h2 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_654; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_663 = 3'h3 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_655; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_664 = 3'h4 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_656; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_665 = 3'h5 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_657; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_666 = 3'h6 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_658; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_667 = 3'h7 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_659; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_668 = _srcBufferNext_T_3 ? _GEN_644 : _GEN_628; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_669 = _srcBufferNext_T_3 ? _GEN_645 : _GEN_629; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_670 = _srcBufferNext_T_3 ? _GEN_646 : _GEN_630; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_671 = _srcBufferNext_T_3 ? _GEN_647 : _GEN_631; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_672 = _srcBufferNext_T_3 ? _GEN_648 : _GEN_632; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_673 = _srcBufferNext_T_3 ? _GEN_649 : _GEN_633; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_674 = _srcBufferNext_T_3 ? _GEN_650 : _GEN_634; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_675 = _srcBufferNext_T_3 ? _GEN_651 : _GEN_635; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_676 = _srcBufferNext_T_3 ? _GEN_620 : _GEN_660; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_677 = _srcBufferNext_T_3 ? _GEN_621 : _GEN_661; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_678 = _srcBufferNext_T_3 ? _GEN_622 : _GEN_662; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_679 = _srcBufferNext_T_3 ? _GEN_623 : _GEN_663; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_680 = _srcBufferNext_T_3 ? _GEN_624 : _GEN_664; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_681 = _srcBufferNext_T_3 ? _GEN_625 : _GEN_665; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_682 = _srcBufferNext_T_3 ? _GEN_626 : _GEN_666; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_683 = _srcBufferNext_T_3 ? _GEN_627 : _GEN_667; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_684 = ~procState3c ? _GEN_668 : _GEN_628; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_685 = ~procState3c ? _GEN_669 : _GEN_629; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_686 = ~procState3c ? _GEN_670 : _GEN_630; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_687 = ~procState3c ? _GEN_671 : _GEN_631; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_688 = ~procState3c ? _GEN_672 : _GEN_632; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_689 = ~procState3c ? _GEN_673 : _GEN_633; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_690 = ~procState3c ? _GEN_674 : _GEN_634; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_691 = ~procState3c ? _GEN_675 : _GEN_635; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_692 = ~procState3c ? _GEN_676 : _GEN_620; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_693 = ~procState3c ? _GEN_677 : _GEN_621; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_694 = ~procState3c ? _GEN_678 : _GEN_622; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_695 = ~procState3c ? _GEN_679 : _GEN_623; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_696 = ~procState3c ? _GEN_680 : _GEN_624; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_697 = ~procState3c ? _GEN_681 : _GEN_625; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_698 = ~procState3c ? _GEN_682 : _GEN_626; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_699 = ~procState3c ? _GEN_683 : _GEN_627; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_1 = fftCalc_1_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_1 = writeDataTRPre3c_1[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_700 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_1[14]}},_writeDataS3c_re_T_1}) : $signed(
    fftCalc_1_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_701 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_1[14]}},_writeDataS3c_im_T_1}) : $signed(
    fftCalc_1_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_705 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_1) : $signed(_GEN_701); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_709 = fftCalc_1_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_1_im = sameAddr3c ? $signed(_GEN_705) : $signed(_GEN_709); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_702 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_1_im) : $signed(writeDataTIPre3c_1); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_704 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_1_io_dataOutSR3c) : $signed(_GEN_700); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_708 = fftCalc_1_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_1_re = sameAddr3c ? $signed(_GEN_704) : $signed(_GEN_708); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_703 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_1_re) : $signed(writeDataTRPre3c_1); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_706 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_1_im) : $signed(_GEN_702); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_707 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_1_re) : $signed(_GEN_703); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_5 = 16'sh0 - $signed(writeDataTIPre3c_1); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_711 = _addrSBankSel3c_T_1 & addrTBankSel3c_1 == 3'h4 & addrT3c_1 == 4'h1 ? $signed(
    _writeDataT3c_im_T_5) : $signed(writeDataTIPre3c_1); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_12 = sameAddr3c ? $signed(_GEN_704) : $signed(_GEN_708); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_13 = sameAddr3c ? $signed(_GEN_705) : $signed(_GEN_709); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_14 = {_io_writeDataSram0Bank_0_T_13,_io_writeDataSram0Bank_0_T_12}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_15 = sameAddr3c ? $signed(_GEN_707) : $signed(writeDataTRPre3c_1); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_16 = sameAddr3c ? $signed(_GEN_706) : $signed(_GEN_711); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_17 = {_io_writeDataSram0Bank_0_T_16,_io_writeDataSram0Bank_0_T_15}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_716 = 3'h0 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_448; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_718 = 3'h0 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_716; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_720 = procState3c ? _GEN_448 : _GEN_718; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_722 = 3'h1 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_458; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_724 = 3'h1 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_722; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_726 = procState3c ? _GEN_458 : _GEN_724; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_728 = 3'h2 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_468; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_730 = 3'h2 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_728; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_732 = procState3c ? _GEN_468 : _GEN_730; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_734 = 3'h3 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_478; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_736 = 3'h3 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_734; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_738 = procState3c ? _GEN_478 : _GEN_736; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_740 = 3'h4 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_488; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_742 = 3'h4 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_740; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_744 = procState3c ? _GEN_488 : _GEN_742; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_746 = 3'h5 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_498; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_748 = 3'h5 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_746; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_750 = procState3c ? _GEN_498 : _GEN_748; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_752 = 3'h6 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_508; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_754 = 3'h6 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_752; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_756 = procState3c ? _GEN_508 : _GEN_754; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_758 = 3'h7 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_518; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_760 = 3'h7 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_758; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_762 = procState3c ? _GEN_518 : _GEN_760; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_2; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_2; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_2; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_2; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_2; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_2; // @[Reg.scala 35:20]
  wire [2:0] _addrSBankSel_T_11 = _radixInit_T_11 ? addrSBankSelProc_2 : addrSBankSelKernel_2; // @[FFTEngine.scala 471:32]
  wire [2:0] _addrTBankSel_T_11 = _radixInit_T_11 ? addrTBankSelProc_2 : addrTBankSelKernel_2; // @[FFTEngine.scala 472:32]
  wire [2:0] _addrSBankSel_T_15 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_2 :
    addrSBankSelKernel_2; // @[FFTEngine.scala 474:32]
  wire [2:0] _addrTBankSel_T_15 = _addrSBankSel_T_4 ? addrTBankSelProc_2 : addrTBankSelKernel_2; // @[FFTEngine.scala 475:32]
  wire [2:0] addrSBankSel_2 = io_fftMode ? _addrSBankSel_T_11 : _addrSBankSel_T_15; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [2:0] addrTBankSel_2 = io_fftMode ? _addrTBankSel_T_11 : _addrTBankSel_T_15; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [2:0] addrSBankSel1c_2; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_2; // @[Reg.scala 35:20]
  wire [15:0] _GEN_775 = 3'h1 == addrSBankSel1c_2 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_776 = 3'h2 == addrSBankSel1c_2 ? $signed(dataInPre_2_re) : $signed(_GEN_775); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_777 = 3'h3 == addrSBankSel1c_2 ? $signed(dataInPre_3_re) : $signed(_GEN_776); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_778 = 3'h4 == addrSBankSel1c_2 ? $signed(dataInPre_4_re) : $signed(_GEN_777); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_779 = 3'h5 == addrSBankSel1c_2 ? $signed(dataInPre_5_re) : $signed(_GEN_778); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_780 = 3'h6 == addrSBankSel1c_2 ? $signed(dataInPre_6_re) : $signed(_GEN_779); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_783 = 3'h1 == addrSBankSel1c_2 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_784 = 3'h2 == addrSBankSel1c_2 ? $signed(dataInPre_2_im) : $signed(_GEN_783); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_785 = 3'h3 == addrSBankSel1c_2 ? $signed(dataInPre_3_im) : $signed(_GEN_784); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_786 = 3'h4 == addrSBankSel1c_2 ? $signed(dataInPre_4_im) : $signed(_GEN_785); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_787 = 3'h5 == addrSBankSel1c_2 ? $signed(dataInPre_5_im) : $signed(_GEN_786); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_788 = 3'h6 == addrSBankSel1c_2 ? $signed(dataInPre_6_im) : $signed(_GEN_787); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_789 = 3'h7 == addrSBankSel1c_2 ? $signed(dataInPre_7_im) : $signed(_GEN_788); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_791 = 3'h1 == addrTBankSel1c_2 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_792 = 3'h2 == addrTBankSel1c_2 ? $signed(dataInPre_2_im) : $signed(_GEN_791); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_793 = 3'h3 == addrTBankSel1c_2 ? $signed(dataInPre_3_im) : $signed(_GEN_792); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_794 = 3'h4 == addrTBankSel1c_2 ? $signed(dataInPre_4_im) : $signed(_GEN_793); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_795 = 3'h5 == addrTBankSel1c_2 ? $signed(dataInPre_5_im) : $signed(_GEN_794); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_796 = 3'h6 == addrTBankSel1c_2 ? $signed(dataInPre_6_im) : $signed(_GEN_795); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_797 = 3'h7 == addrTBankSel1c_2 ? $signed(dataInPre_7_im) : $signed(_GEN_796); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_799 = 3'h1 == addrTBankSel1c_2 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_800 = 3'h2 == addrTBankSel1c_2 ? $signed(dataInPre_2_re) : $signed(_GEN_799); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_801 = 3'h3 == addrTBankSel1c_2 ? $signed(dataInPre_3_re) : $signed(_GEN_800); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_802 = 3'h4 == addrTBankSel1c_2 ? $signed(dataInPre_4_re) : $signed(_GEN_801); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_803 = 3'h5 == addrTBankSel1c_2 ? $signed(dataInPre_5_re) : $signed(_GEN_802); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_804 = 3'h6 == addrTBankSel1c_2 ? $signed(dataInPre_6_re) : $signed(_GEN_803); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_805 = 3'h7 == addrTBankSel1c_2 ? $signed(dataInPre_7_re) : $signed(_GEN_804); // @[FFTEngine.scala 484:{35,35}]
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
  wire [3:0] _GEN_816 = 3'h0 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_692; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_817 = 3'h1 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_693; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_818 = 3'h2 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_694; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_819 = 3'h3 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_695; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_820 = 3'h4 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_696; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_821 = 3'h5 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_697; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_822 = 3'h6 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_698; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_823 = 3'h7 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_699; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_824 = 3'h0 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_816; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_825 = 3'h1 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_817; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_826 = 3'h2 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_818; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_827 = 3'h3 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_819; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_828 = 3'h4 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_820; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_829 = 3'h5 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_821; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_830 = 3'h6 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_822; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_831 = 3'h7 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_823; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_832 = 3'h0 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_684; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_833 = 3'h1 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_685; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_834 = 3'h2 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_686; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_835 = 3'h3 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_687; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_836 = 3'h4 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_688; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_837 = 3'h5 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_689; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_838 = 3'h6 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_690; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_839 = 3'h7 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_691; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_840 = 3'h0 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_832; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_841 = 3'h1 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_833; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_842 = 3'h2 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_834; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_843 = 3'h3 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_835; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_844 = 3'h4 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_836; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_845 = 3'h5 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_837; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_846 = 3'h6 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_838; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_847 = 3'h7 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_839; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_848 = _srcBufferNext_T_3 ? _GEN_824 : _GEN_692; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_849 = _srcBufferNext_T_3 ? _GEN_825 : _GEN_693; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_850 = _srcBufferNext_T_3 ? _GEN_826 : _GEN_694; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_851 = _srcBufferNext_T_3 ? _GEN_827 : _GEN_695; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_852 = _srcBufferNext_T_3 ? _GEN_828 : _GEN_696; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_853 = _srcBufferNext_T_3 ? _GEN_829 : _GEN_697; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_854 = _srcBufferNext_T_3 ? _GEN_830 : _GEN_698; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_855 = _srcBufferNext_T_3 ? _GEN_831 : _GEN_699; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_856 = _srcBufferNext_T_3 ? _GEN_684 : _GEN_840; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_857 = _srcBufferNext_T_3 ? _GEN_685 : _GEN_841; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_858 = _srcBufferNext_T_3 ? _GEN_686 : _GEN_842; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_859 = _srcBufferNext_T_3 ? _GEN_687 : _GEN_843; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_860 = _srcBufferNext_T_3 ? _GEN_688 : _GEN_844; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_861 = _srcBufferNext_T_3 ? _GEN_689 : _GEN_845; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_862 = _srcBufferNext_T_3 ? _GEN_690 : _GEN_846; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_863 = _srcBufferNext_T_3 ? _GEN_691 : _GEN_847; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_864 = ~_radixInit_T_11 ? _GEN_848 : _GEN_692; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_865 = ~_radixInit_T_11 ? _GEN_849 : _GEN_693; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_866 = ~_radixInit_T_11 ? _GEN_850 : _GEN_694; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_867 = ~_radixInit_T_11 ? _GEN_851 : _GEN_695; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_868 = ~_radixInit_T_11 ? _GEN_852 : _GEN_696; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_869 = ~_radixInit_T_11 ? _GEN_853 : _GEN_697; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_870 = ~_radixInit_T_11 ? _GEN_854 : _GEN_698; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_871 = ~_radixInit_T_11 ? _GEN_855 : _GEN_699; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_872 = ~_radixInit_T_11 ? _GEN_856 : _GEN_684; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_873 = ~_radixInit_T_11 ? _GEN_857 : _GEN_685; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_874 = ~_radixInit_T_11 ? _GEN_858 : _GEN_686; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_875 = ~_radixInit_T_11 ? _GEN_859 : _GEN_687; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_876 = ~_radixInit_T_11 ? _GEN_860 : _GEN_688; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_877 = ~_radixInit_T_11 ? _GEN_861 : _GEN_689; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_878 = ~_radixInit_T_11 ? _GEN_862 : _GEN_690; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_879 = ~_radixInit_T_11 ? _GEN_863 : _GEN_691; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_880 = 3'h0 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_872; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_881 = 3'h1 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_873; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_882 = 3'h2 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_874; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_883 = 3'h3 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_875; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_884 = 3'h4 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_876; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_885 = 3'h5 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_877; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_886 = 3'h6 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_878; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_887 = 3'h7 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_879; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_888 = 3'h0 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_880; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_889 = 3'h1 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_881; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_890 = 3'h2 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_882; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_891 = 3'h3 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_883; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_892 = 3'h4 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_884; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_893 = 3'h5 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_885; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_894 = 3'h6 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_886; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_895 = 3'h7 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_887; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_896 = 3'h0 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_864; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_897 = 3'h1 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_865; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_898 = 3'h2 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_866; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_899 = 3'h3 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_867; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_900 = 3'h4 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_868; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_901 = 3'h5 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_869; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_902 = 3'h6 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_870; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_903 = 3'h7 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_871; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_904 = 3'h0 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_896; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_905 = 3'h1 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_897; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_906 = 3'h2 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_898; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_907 = 3'h3 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_899; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_908 = 3'h4 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_900; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_909 = 3'h5 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_901; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_910 = 3'h6 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_902; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_911 = 3'h7 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_903; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_912 = _srcBufferNext_T_3 ? _GEN_888 : _GEN_872; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_913 = _srcBufferNext_T_3 ? _GEN_889 : _GEN_873; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_914 = _srcBufferNext_T_3 ? _GEN_890 : _GEN_874; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_915 = _srcBufferNext_T_3 ? _GEN_891 : _GEN_875; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_916 = _srcBufferNext_T_3 ? _GEN_892 : _GEN_876; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_917 = _srcBufferNext_T_3 ? _GEN_893 : _GEN_877; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_918 = _srcBufferNext_T_3 ? _GEN_894 : _GEN_878; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_919 = _srcBufferNext_T_3 ? _GEN_895 : _GEN_879; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_920 = _srcBufferNext_T_3 ? _GEN_864 : _GEN_904; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_921 = _srcBufferNext_T_3 ? _GEN_865 : _GEN_905; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_922 = _srcBufferNext_T_3 ? _GEN_866 : _GEN_906; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_923 = _srcBufferNext_T_3 ? _GEN_867 : _GEN_907; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_924 = _srcBufferNext_T_3 ? _GEN_868 : _GEN_908; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_925 = _srcBufferNext_T_3 ? _GEN_869 : _GEN_909; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_926 = _srcBufferNext_T_3 ? _GEN_870 : _GEN_910; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_927 = _srcBufferNext_T_3 ? _GEN_871 : _GEN_911; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_928 = ~procState3c ? _GEN_912 : _GEN_872; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_929 = ~procState3c ? _GEN_913 : _GEN_873; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_930 = ~procState3c ? _GEN_914 : _GEN_874; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_931 = ~procState3c ? _GEN_915 : _GEN_875; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_932 = ~procState3c ? _GEN_916 : _GEN_876; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_933 = ~procState3c ? _GEN_917 : _GEN_877; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_934 = ~procState3c ? _GEN_918 : _GEN_878; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_935 = ~procState3c ? _GEN_919 : _GEN_879; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_936 = ~procState3c ? _GEN_920 : _GEN_864; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_937 = ~procState3c ? _GEN_921 : _GEN_865; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_938 = ~procState3c ? _GEN_922 : _GEN_866; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_939 = ~procState3c ? _GEN_923 : _GEN_867; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_940 = ~procState3c ? _GEN_924 : _GEN_868; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_941 = ~procState3c ? _GEN_925 : _GEN_869; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_942 = ~procState3c ? _GEN_926 : _GEN_870; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_943 = ~procState3c ? _GEN_927 : _GEN_871; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_2 = fftCalc_2_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_2 = writeDataTRPre3c_2[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_944 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_2[14]}},_writeDataS3c_re_T_2}) : $signed(
    fftCalc_2_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_945 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_2[14]}},_writeDataS3c_im_T_2}) : $signed(
    fftCalc_2_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_949 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_2) : $signed(_GEN_945); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_953 = fftCalc_2_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_2_im = sameAddr3c ? $signed(_GEN_949) : $signed(_GEN_953); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_946 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_2_im) : $signed(writeDataTIPre3c_2); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_948 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_2_io_dataOutSR3c) : $signed(_GEN_944); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_952 = fftCalc_2_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_2_re = sameAddr3c ? $signed(_GEN_948) : $signed(_GEN_952); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_947 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_2_re) : $signed(writeDataTRPre3c_2); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_950 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_2_im) : $signed(_GEN_946); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_951 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_2_re) : $signed(_GEN_947); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_8 = 16'sh0 - $signed(writeDataTIPre3c_2); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_955 = _addrSBankSel3c_T_1 & addrTBankSel3c_2 == 3'h4 & addrT3c_2 == 4'h1 ? $signed(
    _writeDataT3c_im_T_8) : $signed(writeDataTIPre3c_2); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_18 = sameAddr3c ? $signed(_GEN_948) : $signed(_GEN_952); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_19 = sameAddr3c ? $signed(_GEN_949) : $signed(_GEN_953); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_20 = {_io_writeDataSram0Bank_0_T_19,_io_writeDataSram0Bank_0_T_18}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_21 = sameAddr3c ? $signed(_GEN_951) : $signed(writeDataTRPre3c_2); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_22 = sameAddr3c ? $signed(_GEN_950) : $signed(_GEN_955); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_23 = {_io_writeDataSram0Bank_0_T_22,_io_writeDataSram0Bank_0_T_21}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_960 = 3'h0 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_720; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_962 = 3'h0 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_960; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_964 = procState3c ? _GEN_720 : _GEN_962; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_966 = 3'h1 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_726; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_968 = 3'h1 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_966; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_970 = procState3c ? _GEN_726 : _GEN_968; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_972 = 3'h2 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_732; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_974 = 3'h2 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_972; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_976 = procState3c ? _GEN_732 : _GEN_974; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_978 = 3'h3 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_738; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_980 = 3'h3 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_978; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_982 = procState3c ? _GEN_738 : _GEN_980; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_984 = 3'h4 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_744; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_986 = 3'h4 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_984; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_988 = procState3c ? _GEN_744 : _GEN_986; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_990 = 3'h5 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_750; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_992 = 3'h5 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_990; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_994 = procState3c ? _GEN_750 : _GEN_992; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_996 = 3'h6 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_756; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_998 = 3'h6 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_996; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1000 = procState3c ? _GEN_756 : _GEN_998; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1002 = 3'h7 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_762; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1004 = 3'h7 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1002; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1006 = procState3c ? _GEN_762 : _GEN_1004; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_3; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_3; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_3; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_3; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_3; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_3; // @[Reg.scala 35:20]
  wire [2:0] _addrSBankSel_T_16 = _radixInit_T_11 ? addrSBankSelProc_3 : addrSBankSelKernel_3; // @[FFTEngine.scala 471:32]
  wire [2:0] _addrTBankSel_T_16 = _radixInit_T_11 ? addrTBankSelProc_3 : addrTBankSelKernel_3; // @[FFTEngine.scala 472:32]
  wire [2:0] _addrSBankSel_T_20 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_3 :
    addrSBankSelKernel_3; // @[FFTEngine.scala 474:32]
  wire [2:0] _addrTBankSel_T_20 = _addrSBankSel_T_4 ? addrTBankSelProc_3 : addrTBankSelKernel_3; // @[FFTEngine.scala 475:32]
  wire [2:0] addrSBankSel_3 = io_fftMode ? _addrSBankSel_T_16 : _addrSBankSel_T_20; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [2:0] addrTBankSel_3 = io_fftMode ? _addrTBankSel_T_16 : _addrTBankSel_T_20; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [2:0] addrSBankSel1c_3; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_3; // @[Reg.scala 35:20]
  wire [15:0] _GEN_1019 = 3'h1 == addrSBankSel1c_3 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1020 = 3'h2 == addrSBankSel1c_3 ? $signed(dataInPre_2_re) : $signed(_GEN_1019); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1021 = 3'h3 == addrSBankSel1c_3 ? $signed(dataInPre_3_re) : $signed(_GEN_1020); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1022 = 3'h4 == addrSBankSel1c_3 ? $signed(dataInPre_4_re) : $signed(_GEN_1021); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1023 = 3'h5 == addrSBankSel1c_3 ? $signed(dataInPre_5_re) : $signed(_GEN_1022); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1024 = 3'h6 == addrSBankSel1c_3 ? $signed(dataInPre_6_re) : $signed(_GEN_1023); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1027 = 3'h1 == addrSBankSel1c_3 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1028 = 3'h2 == addrSBankSel1c_3 ? $signed(dataInPre_2_im) : $signed(_GEN_1027); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1029 = 3'h3 == addrSBankSel1c_3 ? $signed(dataInPre_3_im) : $signed(_GEN_1028); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1030 = 3'h4 == addrSBankSel1c_3 ? $signed(dataInPre_4_im) : $signed(_GEN_1029); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1031 = 3'h5 == addrSBankSel1c_3 ? $signed(dataInPre_5_im) : $signed(_GEN_1030); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1032 = 3'h6 == addrSBankSel1c_3 ? $signed(dataInPre_6_im) : $signed(_GEN_1031); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1033 = 3'h7 == addrSBankSel1c_3 ? $signed(dataInPre_7_im) : $signed(_GEN_1032); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1035 = 3'h1 == addrTBankSel1c_3 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1036 = 3'h2 == addrTBankSel1c_3 ? $signed(dataInPre_2_im) : $signed(_GEN_1035); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1037 = 3'h3 == addrTBankSel1c_3 ? $signed(dataInPre_3_im) : $signed(_GEN_1036); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1038 = 3'h4 == addrTBankSel1c_3 ? $signed(dataInPre_4_im) : $signed(_GEN_1037); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1039 = 3'h5 == addrTBankSel1c_3 ? $signed(dataInPre_5_im) : $signed(_GEN_1038); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1040 = 3'h6 == addrTBankSel1c_3 ? $signed(dataInPre_6_im) : $signed(_GEN_1039); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1041 = 3'h7 == addrTBankSel1c_3 ? $signed(dataInPre_7_im) : $signed(_GEN_1040); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1043 = 3'h1 == addrTBankSel1c_3 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1044 = 3'h2 == addrTBankSel1c_3 ? $signed(dataInPre_2_re) : $signed(_GEN_1043); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1045 = 3'h3 == addrTBankSel1c_3 ? $signed(dataInPre_3_re) : $signed(_GEN_1044); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1046 = 3'h4 == addrTBankSel1c_3 ? $signed(dataInPre_4_re) : $signed(_GEN_1045); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1047 = 3'h5 == addrTBankSel1c_3 ? $signed(dataInPre_5_re) : $signed(_GEN_1046); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1048 = 3'h6 == addrTBankSel1c_3 ? $signed(dataInPre_6_re) : $signed(_GEN_1047); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1049 = 3'h7 == addrTBankSel1c_3 ? $signed(dataInPre_7_re) : $signed(_GEN_1048); // @[FFTEngine.scala 484:{35,35}]
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
  wire [3:0] _GEN_1060 = 3'h0 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_936; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1061 = 3'h1 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_937; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1062 = 3'h2 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_938; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1063 = 3'h3 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_939; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1064 = 3'h4 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_940; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1065 = 3'h5 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_941; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1066 = 3'h6 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_942; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1067 = 3'h7 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_943; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1068 = 3'h0 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1060; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1069 = 3'h1 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1061; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1070 = 3'h2 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1062; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1071 = 3'h3 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1063; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1072 = 3'h4 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1064; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1073 = 3'h5 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1065; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1074 = 3'h6 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1066; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1075 = 3'h7 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1067; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1076 = 3'h0 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_928; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1077 = 3'h1 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_929; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1078 = 3'h2 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_930; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1079 = 3'h3 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_931; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1080 = 3'h4 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_932; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1081 = 3'h5 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_933; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1082 = 3'h6 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_934; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1083 = 3'h7 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_935; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1084 = 3'h0 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1076; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1085 = 3'h1 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1077; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1086 = 3'h2 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1078; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1087 = 3'h3 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1079; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1088 = 3'h4 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1080; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1089 = 3'h5 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1081; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1090 = 3'h6 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1082; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1091 = 3'h7 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_1083; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1092 = _srcBufferNext_T_3 ? _GEN_1068 : _GEN_936; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1093 = _srcBufferNext_T_3 ? _GEN_1069 : _GEN_937; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1094 = _srcBufferNext_T_3 ? _GEN_1070 : _GEN_938; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1095 = _srcBufferNext_T_3 ? _GEN_1071 : _GEN_939; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1096 = _srcBufferNext_T_3 ? _GEN_1072 : _GEN_940; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1097 = _srcBufferNext_T_3 ? _GEN_1073 : _GEN_941; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1098 = _srcBufferNext_T_3 ? _GEN_1074 : _GEN_942; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1099 = _srcBufferNext_T_3 ? _GEN_1075 : _GEN_943; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1100 = _srcBufferNext_T_3 ? _GEN_928 : _GEN_1084; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1101 = _srcBufferNext_T_3 ? _GEN_929 : _GEN_1085; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1102 = _srcBufferNext_T_3 ? _GEN_930 : _GEN_1086; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1103 = _srcBufferNext_T_3 ? _GEN_931 : _GEN_1087; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1104 = _srcBufferNext_T_3 ? _GEN_932 : _GEN_1088; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1105 = _srcBufferNext_T_3 ? _GEN_933 : _GEN_1089; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1106 = _srcBufferNext_T_3 ? _GEN_934 : _GEN_1090; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1107 = _srcBufferNext_T_3 ? _GEN_935 : _GEN_1091; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1108 = ~_radixInit_T_11 ? _GEN_1092 : _GEN_936; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1109 = ~_radixInit_T_11 ? _GEN_1093 : _GEN_937; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1110 = ~_radixInit_T_11 ? _GEN_1094 : _GEN_938; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1111 = ~_radixInit_T_11 ? _GEN_1095 : _GEN_939; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1112 = ~_radixInit_T_11 ? _GEN_1096 : _GEN_940; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1113 = ~_radixInit_T_11 ? _GEN_1097 : _GEN_941; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1114 = ~_radixInit_T_11 ? _GEN_1098 : _GEN_942; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1115 = ~_radixInit_T_11 ? _GEN_1099 : _GEN_943; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1116 = ~_radixInit_T_11 ? _GEN_1100 : _GEN_928; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1117 = ~_radixInit_T_11 ? _GEN_1101 : _GEN_929; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1118 = ~_radixInit_T_11 ? _GEN_1102 : _GEN_930; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1119 = ~_radixInit_T_11 ? _GEN_1103 : _GEN_931; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1120 = ~_radixInit_T_11 ? _GEN_1104 : _GEN_932; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1121 = ~_radixInit_T_11 ? _GEN_1105 : _GEN_933; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1122 = ~_radixInit_T_11 ? _GEN_1106 : _GEN_934; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1123 = ~_radixInit_T_11 ? _GEN_1107 : _GEN_935; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1124 = 3'h0 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1116; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1125 = 3'h1 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1117; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1126 = 3'h2 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1118; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1127 = 3'h3 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1119; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1128 = 3'h4 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1120; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1129 = 3'h5 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1121; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1130 = 3'h6 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1122; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1131 = 3'h7 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1123; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1132 = 3'h0 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1124; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1133 = 3'h1 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1125; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1134 = 3'h2 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1126; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1135 = 3'h3 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1127; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1136 = 3'h4 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1128; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1137 = 3'h5 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1129; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1138 = 3'h6 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1130; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1139 = 3'h7 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1131; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1140 = 3'h0 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1108; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1141 = 3'h1 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1109; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1142 = 3'h2 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1110; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1143 = 3'h3 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1111; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1144 = 3'h4 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1112; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1145 = 3'h5 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1113; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1146 = 3'h6 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1114; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1147 = 3'h7 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_1115; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1148 = 3'h0 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1140; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1149 = 3'h1 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1141; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1150 = 3'h2 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1142; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1151 = 3'h3 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1143; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1152 = 3'h4 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1144; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1153 = 3'h5 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1145; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1154 = 3'h6 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1146; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1155 = 3'h7 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_1147; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1156 = _srcBufferNext_T_3 ? _GEN_1132 : _GEN_1116; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1157 = _srcBufferNext_T_3 ? _GEN_1133 : _GEN_1117; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1158 = _srcBufferNext_T_3 ? _GEN_1134 : _GEN_1118; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1159 = _srcBufferNext_T_3 ? _GEN_1135 : _GEN_1119; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1160 = _srcBufferNext_T_3 ? _GEN_1136 : _GEN_1120; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1161 = _srcBufferNext_T_3 ? _GEN_1137 : _GEN_1121; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1162 = _srcBufferNext_T_3 ? _GEN_1138 : _GEN_1122; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1163 = _srcBufferNext_T_3 ? _GEN_1139 : _GEN_1123; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1164 = _srcBufferNext_T_3 ? _GEN_1108 : _GEN_1148; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1165 = _srcBufferNext_T_3 ? _GEN_1109 : _GEN_1149; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1166 = _srcBufferNext_T_3 ? _GEN_1110 : _GEN_1150; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1167 = _srcBufferNext_T_3 ? _GEN_1111 : _GEN_1151; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1168 = _srcBufferNext_T_3 ? _GEN_1112 : _GEN_1152; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1169 = _srcBufferNext_T_3 ? _GEN_1113 : _GEN_1153; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1170 = _srcBufferNext_T_3 ? _GEN_1114 : _GEN_1154; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1171 = _srcBufferNext_T_3 ? _GEN_1115 : _GEN_1155; // @[FFTEngine.scala 550:37]
  wire [14:0] _writeDataS3c_re_T_3 = fftCalc_3_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_3 = writeDataTRPre3c_3[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_1188 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_3[14]}},_writeDataS3c_re_T_3}) : $signed(
    fftCalc_3_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_1189 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_3[14]}},_writeDataS3c_im_T_3}) : $signed(
    fftCalc_3_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_1193 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_3) : $signed(_GEN_1189); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_1197 = fftCalc_3_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_3_im = sameAddr3c ? $signed(_GEN_1193) : $signed(_GEN_1197); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_1190 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_3_im) : $signed(writeDataTIPre3c_3); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_1192 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_3_io_dataOutSR3c) : $signed(_GEN_1188); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_1196 = fftCalc_3_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_3_re = sameAddr3c ? $signed(_GEN_1192) : $signed(_GEN_1196); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_1191 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_3_re) : $signed(writeDataTRPre3c_3); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_1194 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_3_im) : $signed(_GEN_1190); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_1195 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_3_re) : $signed(_GEN_1191); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_11 = 16'sh0 - $signed(writeDataTIPre3c_3); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_1199 = _addrSBankSel3c_T_1 & addrTBankSel3c_3 == 3'h4 & addrT3c_3 == 4'h1 ? $signed(
    _writeDataT3c_im_T_11) : $signed(writeDataTIPre3c_3); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_24 = sameAddr3c ? $signed(_GEN_1192) : $signed(_GEN_1196); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_25 = sameAddr3c ? $signed(_GEN_1193) : $signed(_GEN_1197); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_26 = {_io_writeDataSram0Bank_0_T_25,_io_writeDataSram0Bank_0_T_24}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_27 = sameAddr3c ? $signed(_GEN_1195) : $signed(writeDataTRPre3c_3); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_28 = sameAddr3c ? $signed(_GEN_1194) : $signed(_GEN_1199); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_29 = {_io_writeDataSram0Bank_0_T_28,_io_writeDataSram0Bank_0_T_27}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_1204 = 3'h0 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_964; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1206 = 3'h0 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1204; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1210 = 3'h1 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_970; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1212 = 3'h1 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1210; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1216 = 3'h2 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_976; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1218 = 3'h2 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1216; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1222 = 3'h3 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_982; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1224 = 3'h3 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1222; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1228 = 3'h4 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_988; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1230 = 3'h4 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1228; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1234 = 3'h5 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_994; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1236 = 3'h5 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1234; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1240 = 3'h6 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1000; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1242 = 3'h6 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1240; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1246 = 3'h7 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1006; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1248 = 3'h7 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_1246; // @[FFTEngine.scala 612:46 613:46]
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
  assign io_writeDataSram0Bank_0 = procState3c ? _GEN_964 : _GEN_1206; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_1 = procState3c ? _GEN_970 : _GEN_1212; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_2 = procState3c ? _GEN_976 : _GEN_1218; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_3 = procState3c ? _GEN_982 : _GEN_1224; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_4 = procState3c ? _GEN_988 : _GEN_1230; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_5 = procState3c ? _GEN_994 : _GEN_1236; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_6 = procState3c ? _GEN_1000 : _GEN_1242; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_7 = procState3c ? _GEN_1006 : _GEN_1248; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_0 = procState3c ? _GEN_964 : _GEN_1206; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_1 = procState3c ? _GEN_970 : _GEN_1212; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_2 = procState3c ? _GEN_976 : _GEN_1218; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_3 = procState3c ? _GEN_982 : _GEN_1224; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_4 = procState3c ? _GEN_988 : _GEN_1230; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_5 = procState3c ? _GEN_994 : _GEN_1236; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_6 = procState3c ? _GEN_1000 : _GEN_1242; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_7 = procState3c ? _GEN_1006 : _GEN_1248; // @[FFTEngine.scala 601:30]
  assign io_writeEnableSram0Bank_0 = procState3c ? _GEN_168 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_1 = procState3c ? _GEN_172 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_2 = procState3c ? _GEN_176 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_3 = procState3c ? _GEN_180 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_4 = procState3c ? _GEN_184 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_5 = procState3c ? _GEN_188 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_6 = procState3c ? _GEN_192 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_7 = procState3c ? _GEN_196 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram1Bank_0 = procState3c ? _GEN_169 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_1 = procState3c ? _GEN_173 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_2 = procState3c ? _GEN_177 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_3 = procState3c ? _GEN_181 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_4 = procState3c ? _GEN_185 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_5 = procState3c ? _GEN_189 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_6 = procState3c ? _GEN_193 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_7 = procState3c ? _GEN_197 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_addrSram0Bank_0 = ~procState3c ? _GEN_1164 : _GEN_1108; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_1 = ~procState3c ? _GEN_1165 : _GEN_1109; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_2 = ~procState3c ? _GEN_1166 : _GEN_1110; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_3 = ~procState3c ? _GEN_1167 : _GEN_1111; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_4 = ~procState3c ? _GEN_1168 : _GEN_1112; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_5 = ~procState3c ? _GEN_1169 : _GEN_1113; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_6 = ~procState3c ? _GEN_1170 : _GEN_1114; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_7 = ~procState3c ? _GEN_1171 : _GEN_1115; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_0 = ~procState3c ? _GEN_1156 : _GEN_1116; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_1 = ~procState3c ? _GEN_1157 : _GEN_1117; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_2 = ~procState3c ? _GEN_1158 : _GEN_1118; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_3 = ~procState3c ? _GEN_1159 : _GEN_1119; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_4 = ~procState3c ? _GEN_1160 : _GEN_1120; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_5 = ~procState3c ? _GEN_1161 : _GEN_1121; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_6 = ~procState3c ? _GEN_1162 : _GEN_1122; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_7 = ~procState3c ? _GEN_1163 : _GEN_1123; // @[FFTEngine.scala 549:28]
  assign io_fftDone = fftDoneReg; // @[FFTEngine.scala 625:16]
  assign fftCalc_clock = clock;
  assign fftCalc_reset = reset;
  assign fftCalc_io_dataInSR = 3'h7 == addrSBankSel1c ? $signed(dataInPre_7_re) : $signed(_GEN_125); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_134); // @[FFTEngine.scala 483:35]
  assign fftCalc_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_142) : $signed(_GEN_150); // @[FFTEngine.scala 484:35]
  assign fftCalc_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_142); // @[FFTEngine.scala 485:35]
  assign fftCalc_io_nk = _radixInit_T_11 ? addrSProc : _fftCalc_io_nk_T_2; // @[FFTEngine.scala 487:33]
  assign fftCalc_io_rShiftSym = kernelState1c ? _GEN_165 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_1_clock = clock;
  assign fftCalc_1_reset = reset;
  assign fftCalc_1_io_dataInSR = 3'h7 == addrSBankSel1c_1 ? $signed(dataInPre_7_re) : $signed(_GEN_536); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_1_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_545); // @[FFTEngine.scala 483:35]
  assign fftCalc_1_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_553) : $signed(_GEN_561); // @[FFTEngine.scala 484:35]
  assign fftCalc_1_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_553); // @[FFTEngine.scala 485:35]
  assign fftCalc_1_io_nk = nk_1[5:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_1_io_rShiftSym = kernelState1c ? _GEN_165 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_1_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_1_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_1_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_1_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_2_clock = clock;
  assign fftCalc_2_reset = reset;
  assign fftCalc_2_io_dataInSR = 3'h7 == addrSBankSel1c_2 ? $signed(dataInPre_7_re) : $signed(_GEN_780); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_2_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_789); // @[FFTEngine.scala 483:35]
  assign fftCalc_2_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_797) : $signed(_GEN_805); // @[FFTEngine.scala 484:35]
  assign fftCalc_2_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_797); // @[FFTEngine.scala 485:35]
  assign fftCalc_2_io_nk = nk_2[5:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_2_io_rShiftSym = kernelState1c ? _GEN_165 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_2_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_2_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_2_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_2_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_3_clock = clock;
  assign fftCalc_3_reset = reset;
  assign fftCalc_3_io_dataInSR = 3'h7 == addrSBankSel1c_3 ? $signed(dataInPre_7_re) : $signed(_GEN_1024); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_3_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_1033); // @[FFTEngine.scala 483:35]
  assign fftCalc_3_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_1041) : $signed(_GEN_1049); // @[FFTEngine.scala 484:35]
  assign fftCalc_3_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_1041); // @[FFTEngine.scala 485:35]
  assign fftCalc_3_io_nk = nk_3[5:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_3_io_rShiftSym = kernelState1c ? _GEN_165 : phaseCount[0]; // @[FFTEngine.scala 491:36]
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
      if (addrSProc == 7'hf) begin // @[FFTEngine.scala 62:50]
        stateReg <= 3'h2; // @[FFTEngine.scala 63:30]
      end
    end else if (3'h2 == stateReg) begin // @[FFTEngine.scala 53:26]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_11;
    end
    if (reset) begin // @[FFTEngine.scala 48:29]
      addrSProc <= 7'h0; // @[FFTEngine.scala 48:29]
    end else if (radixInit) begin // @[FFTEngine.scala 156:21]
      addrSProc <= 7'h0; // @[FFTEngine.scala 157:20]
    end else if (radixUp) begin // @[FFTEngine.scala 158:26]
      addrSProc <= _radixCount_T_1; // @[FFTEngine.scala 159:20]
    end
    if (reset) begin // @[FFTEngine.scala 50:29]
      phaseCount <= 3'h0; // @[FFTEngine.scala 50:29]
    end else if (phaseInit) begin // @[FFTEngine.scala 171:21]
      phaseCount <= 3'h0; // @[FFTEngine.scala 172:20]
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
      addrS1c <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c <= addrS_0[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c <= addrS1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c <= addrS2c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c <= addrT_0[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c <= addrT1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c <= 4'h0; // @[Reg.scala 35:20]
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
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0) begin // @[FFTEngine.scala 474:32]
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
      addrS1c_1 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_1 <= addrS_1[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_1 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_1 <= addrS1c_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_1 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_1 <= addrS2c_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_1 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_1 <= addrT_1[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_1 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_1 <= addrT1c_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_1 <= 4'h0; // @[Reg.scala 35:20]
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
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0) begin // @[FFTEngine.scala 474:32]
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
      addrS1c_2 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_2 <= addrS_2[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_2 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_2 <= addrS1c_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_2 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_2 <= addrS2c_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_2 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_2 <= addrT_2[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_2 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_2 <= addrT1c_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_2 <= 4'h0; // @[Reg.scala 35:20]
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
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0) begin // @[FFTEngine.scala 474:32]
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
      addrS1c_3 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_3 <= addrS_3[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_3 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_3 <= addrS1c_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_3 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_3 <= addrS2c_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_3 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_3 <= addrT_3[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_3 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_3 <= addrT1c_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_3 <= 4'h0; // @[Reg.scala 35:20]
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
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0) begin // @[FFTEngine.scala 474:32]
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
  addrSProc = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[2:0];
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
  addrS1c = _RAND_61[3:0];
  _RAND_62 = {1{`RANDOM}};
  addrS2c = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  addrS3c = _RAND_63[3:0];
  _RAND_64 = {1{`RANDOM}};
  addrT1c = _RAND_64[3:0];
  _RAND_65 = {1{`RANDOM}};
  addrT2c = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  addrT3c = _RAND_66[3:0];
  _RAND_67 = {1{`RANDOM}};
  addrSBankSel1c = _RAND_67[2:0];
  _RAND_68 = {1{`RANDOM}};
  addrTBankSel1c = _RAND_68[2:0];
  _RAND_69 = {1{`RANDOM}};
  addrS1c_1 = _RAND_69[3:0];
  _RAND_70 = {1{`RANDOM}};
  addrS2c_1 = _RAND_70[3:0];
  _RAND_71 = {1{`RANDOM}};
  addrS3c_1 = _RAND_71[3:0];
  _RAND_72 = {1{`RANDOM}};
  addrT1c_1 = _RAND_72[3:0];
  _RAND_73 = {1{`RANDOM}};
  addrT2c_1 = _RAND_73[3:0];
  _RAND_74 = {1{`RANDOM}};
  addrT3c_1 = _RAND_74[3:0];
  _RAND_75 = {1{`RANDOM}};
  addrSBankSel1c_1 = _RAND_75[2:0];
  _RAND_76 = {1{`RANDOM}};
  addrTBankSel1c_1 = _RAND_76[2:0];
  _RAND_77 = {1{`RANDOM}};
  addrS1c_2 = _RAND_77[3:0];
  _RAND_78 = {1{`RANDOM}};
  addrS2c_2 = _RAND_78[3:0];
  _RAND_79 = {1{`RANDOM}};
  addrS3c_2 = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  addrT1c_2 = _RAND_80[3:0];
  _RAND_81 = {1{`RANDOM}};
  addrT2c_2 = _RAND_81[3:0];
  _RAND_82 = {1{`RANDOM}};
  addrT3c_2 = _RAND_82[3:0];
  _RAND_83 = {1{`RANDOM}};
  addrSBankSel1c_2 = _RAND_83[2:0];
  _RAND_84 = {1{`RANDOM}};
  addrTBankSel1c_2 = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  addrS1c_3 = _RAND_85[3:0];
  _RAND_86 = {1{`RANDOM}};
  addrS2c_3 = _RAND_86[3:0];
  _RAND_87 = {1{`RANDOM}};
  addrS3c_3 = _RAND_87[3:0];
  _RAND_88 = {1{`RANDOM}};
  addrT1c_3 = _RAND_88[3:0];
  _RAND_89 = {1{`RANDOM}};
  addrT2c_3 = _RAND_89[3:0];
  _RAND_90 = {1{`RANDOM}};
  addrT3c_3 = _RAND_90[3:0];
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
