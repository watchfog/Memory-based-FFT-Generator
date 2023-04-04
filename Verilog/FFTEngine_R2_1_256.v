module FFTTwiddle(
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
  input  [7:0]  io_nk,
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
  wire [8:0] fftTwiddle_io_nk; // @[FFT3PipelineCalc.scala 45:28]
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
  reg [7:0] nk1c; // @[Reg.scala 35:20]
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
      nk1c <= 8'h0; // @[Reg.scala 35:20]
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
  nk1c = _RAND_0[7:0];
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
  input  [31:0] io_readDataSram1Bank_0,
  input  [31:0] io_readDataSram1Bank_1,
  output        io_readEnableSram0Bank_0,
  output        io_readEnableSram0Bank_1,
  output        io_readEnableSram1Bank_0,
  output        io_readEnableSram1Bank_1,
  output [31:0] io_writeDataSram0Bank_0,
  output [31:0] io_writeDataSram0Bank_1,
  output [31:0] io_writeDataSram1Bank_0,
  output [31:0] io_writeDataSram1Bank_1,
  output        io_writeEnableSram0Bank_0,
  output        io_writeEnableSram0Bank_1,
  output        io_writeEnableSram1Bank_0,
  output        io_writeEnableSram1Bank_1,
  output [6:0]  io_addrSram0Bank_0,
  output [6:0]  io_addrSram0Bank_1,
  output [6:0]  io_addrSram1Bank_0,
  output [6:0]  io_addrSram1Bank_1,
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
  input         io_fftRShiftP0_7
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
  wire [7:0] fftCalc_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_io_state2c; // @[FFTEngine.scala 481:29]
  reg [2:0] stateReg; // @[FFTEngine.scala 46:27]
  reg [7:0] addrSProc; // @[FFTEngine.scala 48:29]
  reg [2:0] phaseCount; // @[FFTEngine.scala 50:29]
  wire  _T_2 = addrSProc == 8'h7f; // @[FFTEngine.scala 62:33]
  wire  _T_4 = addrSProc == 8'h3; // @[FFTEngine.scala 69:33]
  wire [2:0] _GEN_2 = addrSProc == 8'h3 ? 3'h3 : stateReg; // @[FFTEngine.scala 69:49 70:30 72:30]
  wire  _T_6 = phaseCount == 3'h7; // @[FFTEngine.scala 76:33]
  wire [2:0] _stateReg_T_1 = io_fftMode ? 3'h4 : 3'h7; // @[FFTEngine.scala 77:36]
  wire [2:0] _GEN_3 = phaseCount == 3'h7 ? _stateReg_T_1 : 3'h1; // @[FFTEngine.scala 76:50 77:30 79:30]
  wire [2:0] _GEN_4 = _T_2 ? 3'h5 : stateReg; // @[FFTEngine.scala 83:51 84:30 86:30]
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
  wire  _radixInit_T_13 = stateReg == 3'h4 & _T_2; // @[FFTEngine.scala 147:28]
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
  wire [7:0] _radixCount_T_1 = addrSProc + 8'h1; // @[FFTEngine.scala 159:34]
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
  wire [6:0] radixCountTemp = addrSProc[6:0]; // @[FFTEngine.scala 196:36]
  wire [7:0] _T_17 = 8'h7f >> phaseCount; // @[FFTEngine.scala 207:181]
  wire [7:0] _T_18 = ~_T_17; // @[FFTEngine.scala 207:119]
  wire [7:0] _GEN_173 = {{1'd0}, radixCountTemp}; // @[FFTEngine.scala 207:117]
  wire [7:0] nk_0 = _GEN_173 & _T_18; // @[FFTEngine.scala 207:117]
  wire [15:0] _dataTemp_T = {radixCountTemp,1'h0,radixCountTemp,1'h0}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_20 = {{7'd0}, _dataTemp_T}; // @[FFTEngine.scala 263:40]
  wire [22:0] dataTemp = _GEN_20 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [7:0] addrSKernelPre_0 = dataTemp[15:8]; // @[FFTEngine.scala 264:17]
  wire [15:0] _dataTemp_T_1 = {radixCountTemp,1'h1,radixCountTemp,1'h1}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_21 = {{7'd0}, _dataTemp_T_1}; // @[FFTEngine.scala 263:40]
  wire [22:0] dataTemp_1 = _GEN_21 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [7:0] addrTKernelPre_0 = dataTemp_1[15:8]; // @[FFTEngine.scala 264:17]
  wire [7:0] _addrTProc_T = ~addrSProc; // @[FFTEngine.scala 332:22]
  wire [7:0] addrTProc = _addrTProc_T + 8'h1; // @[FFTEngine.scala 332:34]
  wire  addrS_0_temp_0 = io_fftMode ? addrSProc[7] : addrSProc[0]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_1 = io_fftMode ? addrSProc[6] : addrSProc[1]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_2 = io_fftMode ? addrSProc[5] : addrSProc[2]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_3 = io_fftMode ? addrSProc[4] : addrSProc[3]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_4 = io_fftMode ? addrSProc[3] : addrSProc[4]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_5 = io_fftMode ? addrSProc[2] : addrSProc[5]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_6 = io_fftMode ? addrSProc[1] : addrSProc[6]; // @[FFTEngine.scala 200:26]
  wire  addrS_0_temp_7 = io_fftMode ? addrSProc[0] : addrSProc[7]; // @[FFTEngine.scala 200:26]
  wire [7:0] _addrS_0_T = {addrS_0_temp_7,addrS_0_temp_6,addrS_0_temp_5,addrS_0_temp_4,addrS_0_temp_3,addrS_0_temp_2,
    addrS_0_temp_1,addrS_0_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_0_temp_0_1 = addrSKernelPre_0[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_1_1 = addrSKernelPre_0[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_2_1 = addrSKernelPre_0[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_0_temp_3_1 = addrSKernelPre_0[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] _addrS_0_T_1 = {addrSKernelPre_0[0],addrSKernelPre_0[1],addrSKernelPre_0[2],addrSKernelPre_0[3],
    addrS_0_temp_3_1,addrS_0_temp_2_1,addrS_0_temp_1_1,addrS_0_temp_0_1}; // @[FFTEngine.scala 201:23]
  wire [7:0] addrS_0 = _radixInit_T_11 ? _addrS_0_T : _addrS_0_T_1; // @[FFTEngine.scala 338:28]
  wire  addrT_0_temp_0 = io_fftMode ? addrTProc[7] : addrTProc[0]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_1 = io_fftMode ? addrTProc[6] : addrTProc[1]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_2 = io_fftMode ? addrTProc[5] : addrTProc[2]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_3 = io_fftMode ? addrTProc[4] : addrTProc[3]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_4 = io_fftMode ? addrTProc[3] : addrTProc[4]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_5 = io_fftMode ? addrTProc[2] : addrTProc[5]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_6 = io_fftMode ? addrTProc[1] : addrTProc[6]; // @[FFTEngine.scala 200:26]
  wire  addrT_0_temp_7 = io_fftMode ? addrTProc[0] : addrTProc[7]; // @[FFTEngine.scala 200:26]
  wire [7:0] _addrT_0_T = {addrT_0_temp_7,addrT_0_temp_6,addrT_0_temp_5,addrT_0_temp_4,addrT_0_temp_3,addrT_0_temp_2,
    addrT_0_temp_1,addrT_0_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_0_temp_0_1 = addrTKernelPre_0[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_1_1 = addrTKernelPre_0[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_2_1 = addrTKernelPre_0[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_0_temp_3_1 = addrTKernelPre_0[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] _addrT_0_T_1 = {addrTKernelPre_0[0],addrTKernelPre_0[1],addrTKernelPre_0[2],addrTKernelPre_0[3],
    addrT_0_temp_3_1,addrT_0_temp_2_1,addrT_0_temp_1_1,addrT_0_temp_0_1}; // @[FFTEngine.scala 201:23]
  wire [7:0] addrT_0 = _radixInit_T_11 ? _addrT_0_T : _addrT_0_T_1; // @[FFTEngine.scala 339:28]
  wire  sameAddr = addrS_0 == addrT_0; // @[FFTEngine.scala 346:29]
  wire [1:0] _addrSBankSelKernelPrePre_sum_T_2 = {{1'd0}, addrS_0[0]}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_4 = {{1'd0}, addrS_0[7:1]}; // @[FFTEngine.scala 349:115]
  wire  _addrSBankSelKernelPrePre_sum_T_7 = _addrSBankSelKernelPrePre_sum_T_2[0] + _addrSBankSelKernelPrePre_sum_T_4[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_8 = {{2'd0}, addrS_0[7:2]}; // @[FFTEngine.scala 349:115]
  wire  _addrSBankSelKernelPrePre_sum_T_11 = _addrSBankSelKernelPrePre_sum_T_7 + _addrSBankSelKernelPrePre_sum_T_8[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_12 = {{3'd0}, addrS_0[7:3]}; // @[FFTEngine.scala 349:115]
  wire  _addrSBankSelKernelPrePre_sum_T_15 = _addrSBankSelKernelPrePre_sum_T_11 + _addrSBankSelKernelPrePre_sum_T_12[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_16 = {{4'd0}, addrS_0[7:4]}; // @[FFTEngine.scala 349:115]
  wire  _addrSBankSelKernelPrePre_sum_T_19 = _addrSBankSelKernelPrePre_sum_T_15 + _addrSBankSelKernelPrePre_sum_T_16[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_20 = {{5'd0}, addrS_0[7:5]}; // @[FFTEngine.scala 349:115]
  wire  _addrSBankSelKernelPrePre_sum_T_23 = _addrSBankSelKernelPrePre_sum_T_19 + _addrSBankSelKernelPrePre_sum_T_20[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_24 = {{6'd0}, addrS_0[7:6]}; // @[FFTEngine.scala 349:115]
  wire  _addrSBankSelKernelPrePre_sum_T_27 = _addrSBankSelKernelPrePre_sum_T_23 + _addrSBankSelKernelPrePre_sum_T_24[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_28 = {{7'd0}, addrS_0[7]}; // @[FFTEngine.scala 349:115]
  wire  addrSBankSelKernelPrePre_0_0 = _addrSBankSelKernelPrePre_sum_T_27 + _addrSBankSelKernelPrePre_sum_T_28[0]; // @[FFTEngine.scala 349:107]
  wire [1:0] _GEN_181 = {{1'd0}, addrSBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 355:144]
  wire [2:0] _addrSBankSelKernelPre_T_1 = {{1'd0}, _GEN_181}; // @[FFTEngine.scala 355:144]
  wire  addrSBankSelKernelPre_0 = _addrSBankSelKernelPre_T_1[0]; // @[FFTEngine.scala 355:160]
  wire [1:0] _addrTBankSelKernelPrePre_sum_T_2 = {{1'd0}, addrT_0[0]}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_4 = {{1'd0}, addrT_0[7:1]}; // @[FFTEngine.scala 349:115]
  wire  _addrTBankSelKernelPrePre_sum_T_7 = _addrTBankSelKernelPrePre_sum_T_2[0] + _addrTBankSelKernelPrePre_sum_T_4[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_8 = {{2'd0}, addrT_0[7:2]}; // @[FFTEngine.scala 349:115]
  wire  _addrTBankSelKernelPrePre_sum_T_11 = _addrTBankSelKernelPrePre_sum_T_7 + _addrTBankSelKernelPrePre_sum_T_8[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_12 = {{3'd0}, addrT_0[7:3]}; // @[FFTEngine.scala 349:115]
  wire  _addrTBankSelKernelPrePre_sum_T_15 = _addrTBankSelKernelPrePre_sum_T_11 + _addrTBankSelKernelPrePre_sum_T_12[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_16 = {{4'd0}, addrT_0[7:4]}; // @[FFTEngine.scala 349:115]
  wire  _addrTBankSelKernelPrePre_sum_T_19 = _addrTBankSelKernelPrePre_sum_T_15 + _addrTBankSelKernelPrePre_sum_T_16[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_20 = {{5'd0}, addrT_0[7:5]}; // @[FFTEngine.scala 349:115]
  wire  _addrTBankSelKernelPrePre_sum_T_23 = _addrTBankSelKernelPrePre_sum_T_19 + _addrTBankSelKernelPrePre_sum_T_20[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_24 = {{6'd0}, addrT_0[7:6]}; // @[FFTEngine.scala 349:115]
  wire  _addrTBankSelKernelPrePre_sum_T_27 = _addrTBankSelKernelPrePre_sum_T_23 + _addrTBankSelKernelPrePre_sum_T_24[0]; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_28 = {{7'd0}, addrT_0[7]}; // @[FFTEngine.scala 349:115]
  wire  addrTBankSelKernelPrePre_0_0 = _addrTBankSelKernelPrePre_sum_T_27 + _addrTBankSelKernelPrePre_sum_T_28[0]; // @[FFTEngine.scala 349:107]
  wire [1:0] _GEN_189 = {{1'd0}, addrTBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 361:144]
  wire [2:0] _addrTBankSelKernelPre_T_1 = {{1'd0}, _GEN_189}; // @[FFTEngine.scala 361:144]
  wire  addrTBankSelKernelPre_0 = _addrTBankSelKernelPre_T_1[0]; // @[FFTEngine.scala 361:160]
  wire  addrSBankSelKernel_0 = _radixInit_T_1 & addrSBankSelKernelPre_0; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire  addrTBankSelKernel_0 = _radixInit_T_1 ? addrTBankSelKernelPre_0 : 1'h1; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire  addrSBankSelProcPre_0 = addrS_0[0] ^ addrS_0[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_0 = addrT_0[0] ^ addrT_0[7]; // @[FFTEngine.scala 383:55]
  reg  addrSBankSelKernel1c_0_r; // @[Reg.scala 35:20]
  reg  addrSBankSelKernel2c_0_r; // @[Reg.scala 35:20]
  reg  addrSBankSelKernel3c_0_r; // @[Reg.scala 35:20]
  reg  addrTBankSelKernel1c_0_r; // @[Reg.scala 35:20]
  reg  addrTBankSelKernel2c_0_r; // @[Reg.scala 35:20]
  reg  addrTBankSelKernel3c_0_r; // @[Reg.scala 35:20]
  reg  addrSBankSelProc1c_0_r; // @[Reg.scala 35:20]
  reg  addrSBankSelProc2c_0_r; // @[Reg.scala 35:20]
  reg  addrSBankSelProc3c_0_r; // @[Reg.scala 35:20]
  reg  addrTBankSelProc1c_0_r; // @[Reg.scala 35:20]
  reg  addrTBankSelProc2c_0_r; // @[Reg.scala 35:20]
  reg  addrTBankSelProc3c_0_r; // @[Reg.scala 35:20]
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
  reg [6:0] addrS1c; // @[Reg.scala 35:20]
  reg [6:0] addrS2c; // @[Reg.scala 35:20]
  reg [6:0] addrS3c; // @[Reg.scala 35:20]
  reg [6:0] addrT1c; // @[Reg.scala 35:20]
  reg [6:0] addrT2c; // @[Reg.scala 35:20]
  reg [6:0] addrT3c; // @[Reg.scala 35:20]
  wire  _addrSBankSel_T_1 = _radixInit_T_11 ? addrSBankSelProcPre_0 : addrSBankSelKernel_0; // @[FFTEngine.scala 471:32]
  wire  _addrTBankSel_T_1 = _radixInit_T_11 ? addrTBankSelProcPre_0 : addrTBankSelKernel_0; // @[FFTEngine.scala 472:32]
  wire  _addrSBankSel_T_2 = phaseCount == 3'h0; // @[FFTEngine.scala 474:72]
  wire  _addrSBankSel_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0; // @[FFTEngine.scala 474:43]
  wire  _addrSBankSel_T_5 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProcPre_0 :
    addrSBankSelKernel_0; // @[FFTEngine.scala 474:32]
  wire  _addrTBankSel_T_5 = _addrSBankSel_T_4 ? addrTBankSelProcPre_0 : addrTBankSelKernel_0; // @[FFTEngine.scala 475:32]
  wire  addrSBankSel = io_fftMode ? _addrSBankSel_T_1 : _addrSBankSel_T_5; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire  addrTBankSel = io_fftMode ? _addrTBankSel_T_1 : _addrTBankSel_T_5; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg  addrSBankSel1c; // @[Reg.scala 35:20]
  reg  addrTBankSel1c; // @[Reg.scala 35:20]
  wire  _fftCalc_io_dataInSI_T_1 = sameAddr1c & _T_12; // @[FFTEngine.scala 483:47]
  wire [15:0] _GEN_56 = addrSBankSel1c ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_58 = addrTBankSel1c ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_60 = addrTBankSel1c ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [7:0] _fftCalc_io_nk_T_2 = {nk_0[6:0],1'h0}; // @[Cat.scala 33:92]
  wire  _GEN_64 = 3'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_65 = 3'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_64; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_66 = 3'h3 == phaseCount ? io_fftRShiftP0_3 : _GEN_65; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_67 = 3'h4 == phaseCount ? io_fftRShiftP0_4 : _GEN_66; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_68 = 3'h5 == phaseCount ? io_fftRShiftP0_5 : _GEN_67; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_69 = 3'h6 == phaseCount ? io_fftRShiftP0_6 : _GEN_68; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_70 = 3'h7 == phaseCount ? io_fftRShiftP0_7 : _GEN_69; // @[FFTEngine.scala 491:{36,36}]
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
  wire  _addrSBankSel3c_T_3 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_0_r : addrSBankSelKernel3c_0_r; // @[FFTEngine.scala 505:34]
  wire  _addrTBankSel3c_T_3 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_0_r : addrTBankSelKernel3c_0_r; // @[FFTEngine.scala 506:34]
  wire  _addrSBankSel3c_T_4 = procState3c ? addrSBankSelProc3c_0_r : addrSBankSelKernel3c_0_r; // @[FFTEngine.scala 508:34]
  wire  _addrTBankSel3c_T_4 = procState3c ? addrTBankSelProc3c_0_r : addrTBankSelKernel3c_0_r; // @[FFTEngine.scala 509:34]
  wire  addrSBankSel3c = io_fftMode ? _addrSBankSel3c_T_3 : _addrSBankSel3c_T_4; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire  addrTBankSel3c = io_fftMode ? _addrTBankSel3c_T_3 : _addrTBankSel3c_T_4; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire  _GEN_73 = (~addrSBankSelProc3c_0_r | ~addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_74 = (~addrSBankSelProc3c_0_r | ~addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_77 = (addrSBankSelProc3c_0_r | addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_78 = (addrSBankSelProc3c_0_r | addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire [6:0] _GEN_83 = ~addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_84 = addrSBankSel ? addrS_0[6:0] : addrT_0[6:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [6:0] _GEN_105 = ~_radixInit_T_11 ? _GEN_83 : _GEN_83; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_106 = ~_radixInit_T_11 ? _GEN_84 : _GEN_84; // @[FFTEngine.scala 529:26]
  wire [6:0] _GEN_109 = ~addrTBankSel3c ? addrT3c : _GEN_105; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_110 = addrTBankSel3c ? addrT3c : _GEN_106; // @[FFTEngine.scala 551:{50,50}]
  wire [6:0] _GEN_111 = ~addrSBankSel3c ? addrS3c : _GEN_109; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_112 = addrSBankSel3c ? addrS3c : _GEN_110; // @[FFTEngine.scala 552:{50,50}]
  wire [6:0] _GEN_117 = _srcBufferNext_T_3 ? _GEN_111 : _GEN_105; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_118 = _srcBufferNext_T_3 ? _GEN_112 : _GEN_106; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_119 = _srcBufferNext_T_3 ? _GEN_105 : _GEN_111; // @[FFTEngine.scala 550:37]
  wire [6:0] _GEN_120 = _srcBufferNext_T_3 ? _GEN_106 : _GEN_112; // @[FFTEngine.scala 550:37]
  wire [14:0] _writeDataS3c_re_T = fftCalc_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T = writeDataTRPre3c[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_137 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T[14]}},_writeDataS3c_re_T}) : $signed(
    fftCalc_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_138 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T[14]}},_writeDataS3c_im_T}) : $signed(
    fftCalc_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_142 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c) : $signed(_GEN_138); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_146 = fftCalc_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_im = sameAddr3c ? $signed(_GEN_142) : $signed(_GEN_146); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_139 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_im) : $signed(writeDataTIPre3c); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_141 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_io_dataOutSR3c) : $signed(_GEN_137); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_145 = fftCalc_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_re = sameAddr3c ? $signed(_GEN_141) : $signed(_GEN_145); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_140 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_re) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_143 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_im) : $signed(_GEN_139); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_144 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_re) : $signed(_GEN_140); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_2 = 16'sh0 - $signed(writeDataTIPre3c); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_148 = _addrSBankSel3c_T_1 & addrTBankSel3c & addrT3c == 7'h1 ? $signed(_writeDataT3c_im_T_2) :
    $signed(writeDataTIPre3c); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T = sameAddr3c ? $signed(_GEN_141) : $signed(_GEN_145); // @[FFTEngine.scala 604:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_1 = sameAddr3c ? $signed(_GEN_142) : $signed(_GEN_146); // @[FFTEngine.scala 604:66]
  wire [31:0] _io_writeDataSram0Bank_0_T_2 = {_io_writeDataSram0Bank_0_T_1,_io_writeDataSram0Bank_0_T}; // @[FFTEngine.scala 604:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_3 = sameAddr3c ? $signed(_GEN_144) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 607:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_4 = sameAddr3c ? $signed(_GEN_143) : $signed(_GEN_148); // @[FFTEngine.scala 607:66]
  wire [31:0] _io_writeDataSram0Bank_0_T_5 = {_io_writeDataSram0Bank_0_T_4,_io_writeDataSram0Bank_0_T_3}; // @[FFTEngine.scala 607:66]
  wire [31:0] _GEN_155 = ~addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_165 = addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
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
  assign io_readEnableSram0Bank_0 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_1 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram1Bank_0 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_1 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_writeDataSram0Bank_0 = procState3c ? _GEN_155 : _GEN_155; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_1 = procState3c ? _GEN_165 : _GEN_165; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_0 = procState3c ? _GEN_155 : _GEN_155; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_1 = procState3c ? _GEN_165 : _GEN_165; // @[FFTEngine.scala 601:30]
  assign io_writeEnableSram0Bank_0 = procState3c ? _GEN_73 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_1 = procState3c ? _GEN_77 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram1Bank_0 = procState3c ? _GEN_74 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_1 = procState3c ? _GEN_78 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_addrSram0Bank_0 = ~procState3c ? _GEN_119 : _GEN_119; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_1 = ~procState3c ? _GEN_120 : _GEN_120; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_0 = ~procState3c ? _GEN_117 : _GEN_117; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_1 = ~procState3c ? _GEN_118 : _GEN_118; // @[FFTEngine.scala 549:28]
  assign io_fftDone = fftDoneReg; // @[FFTEngine.scala 625:16]
  assign fftCalc_clock = clock;
  assign fftCalc_reset = reset;
  assign fftCalc_io_dataInSR = addrSBankSel1c ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_56); // @[FFTEngine.scala 483:35]
  assign fftCalc_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_58) : $signed(_GEN_60); // @[FFTEngine.scala 484:35]
  assign fftCalc_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_58); // @[FFTEngine.scala 485:35]
  assign fftCalc_io_nk = _radixInit_T_11 ? addrSProc : _fftCalc_io_nk_T_2; // @[FFTEngine.scala 487:33]
  assign fftCalc_io_rShiftSym = kernelState1c ? _GEN_70 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
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
      if (addrSProc == 8'h7f) begin // @[FFTEngine.scala 62:50]
        stateReg <= 3'h2; // @[FFTEngine.scala 63:30]
      end
    end else if (3'h2 == stateReg) begin // @[FFTEngine.scala 53:26]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_11;
    end
    if (reset) begin // @[FFTEngine.scala 48:29]
      addrSProc <= 8'h0; // @[FFTEngine.scala 48:29]
    end else if (radixInit) begin // @[FFTEngine.scala 156:21]
      addrSProc <= 8'h0; // @[FFTEngine.scala 157:20]
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
      addrSBankSelKernel1c_0_r <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel1c_0_r <= addrSBankSelKernel_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_0_r <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_0_r <= addrSBankSelKernel1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_0_r <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_0_r <= addrSBankSelKernel2c_0_r;
    end
    addrTBankSelKernel1c_0_r <= reset | addrTBankSelKernel_0; // @[Reg.scala 35:{20,20}]
    addrTBankSelKernel2c_0_r <= reset | addrTBankSelKernel1c_0_r; // @[Reg.scala 35:{20,20}]
    addrTBankSelKernel3c_0_r <= reset | addrTBankSelKernel2c_0_r; // @[Reg.scala 35:{20,20}]
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_0_r <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_0_r <= addrSBankSelProcPre_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_0_r <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_0_r <= addrSBankSelProc1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_0_r <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_0_r <= addrSBankSelProc2c_0_r;
    end
    addrTBankSelProc1c_0_r <= reset | addrTBankSelProcPre_0; // @[Reg.scala 35:{20,20}]
    addrTBankSelProc2c_0_r <= reset | addrTBankSelProc1c_0_r; // @[Reg.scala 35:{20,20}]
    addrTBankSelProc3c_0_r <= reset | addrTBankSelProc2c_0_r; // @[Reg.scala 35:{20,20}]
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
      addrSBankSel1c <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 471:32]
        addrSBankSel1c <= addrSBankSelProcPre_0;
      end else begin
        addrSBankSel1c <= addrSBankSelKernel_0;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0) begin // @[FFTEngine.scala 474:32]
      addrSBankSel1c <= addrSBankSelProcPre_0;
    end else begin
      addrSBankSel1c <= addrSBankSelKernel_0;
    end
    addrTBankSel1c <= reset | addrTBankSel; // @[Reg.scala 35:{20,20}]
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
  addrSProc = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  srcBuffer = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrSBankSelKernel1c_0_r = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  addrSBankSelKernel2c_0_r = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  addrSBankSelKernel3c_0_r = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  addrTBankSelKernel1c_0_r = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  addrTBankSelKernel2c_0_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  addrTBankSelKernel3c_0_r = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  addrSBankSelProc1c_0_r = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  addrSBankSelProc2c_0_r = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  addrSBankSelProc3c_0_r = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  addrTBankSelProc1c_0_r = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  addrTBankSelProc2c_0_r = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  addrTBankSelProc3c_0_r = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  kernelState1c = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  kernelState2c = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  kernelState3c = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  procState1c = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  procState2c = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  procState3c = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  sameAddr1c = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  sameAddr2c = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  sameAddr3c = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  addrS1c = _RAND_25[6:0];
  _RAND_26 = {1{`RANDOM}};
  addrS2c = _RAND_26[6:0];
  _RAND_27 = {1{`RANDOM}};
  addrS3c = _RAND_27[6:0];
  _RAND_28 = {1{`RANDOM}};
  addrT1c = _RAND_28[6:0];
  _RAND_29 = {1{`RANDOM}};
  addrT2c = _RAND_29[6:0];
  _RAND_30 = {1{`RANDOM}};
  addrT3c = _RAND_30[6:0];
  _RAND_31 = {1{`RANDOM}};
  addrSBankSel1c = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  addrTBankSel1c = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  fftDoneReg = _RAND_33[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
