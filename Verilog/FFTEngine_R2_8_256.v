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
module FFTTwiddle_1(
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
  input  [31:0] io_readDataSram0Bank_8,
  input  [31:0] io_readDataSram0Bank_9,
  input  [31:0] io_readDataSram0Bank_10,
  input  [31:0] io_readDataSram0Bank_11,
  input  [31:0] io_readDataSram0Bank_12,
  input  [31:0] io_readDataSram0Bank_13,
  input  [31:0] io_readDataSram0Bank_14,
  input  [31:0] io_readDataSram0Bank_15,
  input  [31:0] io_readDataSram1Bank_0,
  input  [31:0] io_readDataSram1Bank_1,
  input  [31:0] io_readDataSram1Bank_2,
  input  [31:0] io_readDataSram1Bank_3,
  input  [31:0] io_readDataSram1Bank_4,
  input  [31:0] io_readDataSram1Bank_5,
  input  [31:0] io_readDataSram1Bank_6,
  input  [31:0] io_readDataSram1Bank_7,
  input  [31:0] io_readDataSram1Bank_8,
  input  [31:0] io_readDataSram1Bank_9,
  input  [31:0] io_readDataSram1Bank_10,
  input  [31:0] io_readDataSram1Bank_11,
  input  [31:0] io_readDataSram1Bank_12,
  input  [31:0] io_readDataSram1Bank_13,
  input  [31:0] io_readDataSram1Bank_14,
  input  [31:0] io_readDataSram1Bank_15,
  output        io_readEnableSram0Bank_0,
  output        io_readEnableSram0Bank_1,
  output        io_readEnableSram0Bank_2,
  output        io_readEnableSram0Bank_3,
  output        io_readEnableSram0Bank_4,
  output        io_readEnableSram0Bank_5,
  output        io_readEnableSram0Bank_6,
  output        io_readEnableSram0Bank_7,
  output        io_readEnableSram0Bank_8,
  output        io_readEnableSram0Bank_9,
  output        io_readEnableSram0Bank_10,
  output        io_readEnableSram0Bank_11,
  output        io_readEnableSram0Bank_12,
  output        io_readEnableSram0Bank_13,
  output        io_readEnableSram0Bank_14,
  output        io_readEnableSram0Bank_15,
  output        io_readEnableSram1Bank_0,
  output        io_readEnableSram1Bank_1,
  output        io_readEnableSram1Bank_2,
  output        io_readEnableSram1Bank_3,
  output        io_readEnableSram1Bank_4,
  output        io_readEnableSram1Bank_5,
  output        io_readEnableSram1Bank_6,
  output        io_readEnableSram1Bank_7,
  output        io_readEnableSram1Bank_8,
  output        io_readEnableSram1Bank_9,
  output        io_readEnableSram1Bank_10,
  output        io_readEnableSram1Bank_11,
  output        io_readEnableSram1Bank_12,
  output        io_readEnableSram1Bank_13,
  output        io_readEnableSram1Bank_14,
  output        io_readEnableSram1Bank_15,
  output [31:0] io_writeDataSram0Bank_0,
  output [31:0] io_writeDataSram0Bank_1,
  output [31:0] io_writeDataSram0Bank_2,
  output [31:0] io_writeDataSram0Bank_3,
  output [31:0] io_writeDataSram0Bank_4,
  output [31:0] io_writeDataSram0Bank_5,
  output [31:0] io_writeDataSram0Bank_6,
  output [31:0] io_writeDataSram0Bank_7,
  output [31:0] io_writeDataSram0Bank_8,
  output [31:0] io_writeDataSram0Bank_9,
  output [31:0] io_writeDataSram0Bank_10,
  output [31:0] io_writeDataSram0Bank_11,
  output [31:0] io_writeDataSram0Bank_12,
  output [31:0] io_writeDataSram0Bank_13,
  output [31:0] io_writeDataSram0Bank_14,
  output [31:0] io_writeDataSram0Bank_15,
  output [31:0] io_writeDataSram1Bank_0,
  output [31:0] io_writeDataSram1Bank_1,
  output [31:0] io_writeDataSram1Bank_2,
  output [31:0] io_writeDataSram1Bank_3,
  output [31:0] io_writeDataSram1Bank_4,
  output [31:0] io_writeDataSram1Bank_5,
  output [31:0] io_writeDataSram1Bank_6,
  output [31:0] io_writeDataSram1Bank_7,
  output [31:0] io_writeDataSram1Bank_8,
  output [31:0] io_writeDataSram1Bank_9,
  output [31:0] io_writeDataSram1Bank_10,
  output [31:0] io_writeDataSram1Bank_11,
  output [31:0] io_writeDataSram1Bank_12,
  output [31:0] io_writeDataSram1Bank_13,
  output [31:0] io_writeDataSram1Bank_14,
  output [31:0] io_writeDataSram1Bank_15,
  output        io_writeEnableSram0Bank_0,
  output        io_writeEnableSram0Bank_1,
  output        io_writeEnableSram0Bank_2,
  output        io_writeEnableSram0Bank_3,
  output        io_writeEnableSram0Bank_4,
  output        io_writeEnableSram0Bank_5,
  output        io_writeEnableSram0Bank_6,
  output        io_writeEnableSram0Bank_7,
  output        io_writeEnableSram0Bank_8,
  output        io_writeEnableSram0Bank_9,
  output        io_writeEnableSram0Bank_10,
  output        io_writeEnableSram0Bank_11,
  output        io_writeEnableSram0Bank_12,
  output        io_writeEnableSram0Bank_13,
  output        io_writeEnableSram0Bank_14,
  output        io_writeEnableSram0Bank_15,
  output        io_writeEnableSram1Bank_0,
  output        io_writeEnableSram1Bank_1,
  output        io_writeEnableSram1Bank_2,
  output        io_writeEnableSram1Bank_3,
  output        io_writeEnableSram1Bank_4,
  output        io_writeEnableSram1Bank_5,
  output        io_writeEnableSram1Bank_6,
  output        io_writeEnableSram1Bank_7,
  output        io_writeEnableSram1Bank_8,
  output        io_writeEnableSram1Bank_9,
  output        io_writeEnableSram1Bank_10,
  output        io_writeEnableSram1Bank_11,
  output        io_writeEnableSram1Bank_12,
  output        io_writeEnableSram1Bank_13,
  output        io_writeEnableSram1Bank_14,
  output        io_writeEnableSram1Bank_15,
  output [3:0]  io_addrSram0Bank_0,
  output [3:0]  io_addrSram0Bank_1,
  output [3:0]  io_addrSram0Bank_2,
  output [3:0]  io_addrSram0Bank_3,
  output [3:0]  io_addrSram0Bank_4,
  output [3:0]  io_addrSram0Bank_5,
  output [3:0]  io_addrSram0Bank_6,
  output [3:0]  io_addrSram0Bank_7,
  output [3:0]  io_addrSram0Bank_8,
  output [3:0]  io_addrSram0Bank_9,
  output [3:0]  io_addrSram0Bank_10,
  output [3:0]  io_addrSram0Bank_11,
  output [3:0]  io_addrSram0Bank_12,
  output [3:0]  io_addrSram0Bank_13,
  output [3:0]  io_addrSram0Bank_14,
  output [3:0]  io_addrSram0Bank_15,
  output [3:0]  io_addrSram1Bank_0,
  output [3:0]  io_addrSram1Bank_1,
  output [3:0]  io_addrSram1Bank_2,
  output [3:0]  io_addrSram1Bank_3,
  output [3:0]  io_addrSram1Bank_4,
  output [3:0]  io_addrSram1Bank_5,
  output [3:0]  io_addrSram1Bank_6,
  output [3:0]  io_addrSram1Bank_7,
  output [3:0]  io_addrSram1Bank_8,
  output [3:0]  io_addrSram1Bank_9,
  output [3:0]  io_addrSram1Bank_10,
  output [3:0]  io_addrSram1Bank_11,
  output [3:0]  io_addrSram1Bank_12,
  output [3:0]  io_addrSram1Bank_13,
  output [3:0]  io_addrSram1Bank_14,
  output [3:0]  io_addrSram1Bank_15,
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
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
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
  wire [6:0] fftCalc_1_io_nk; // @[FFTEngine.scala 481:29]
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
  wire [6:0] fftCalc_2_io_nk; // @[FFTEngine.scala 481:29]
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
  wire [6:0] fftCalc_3_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_3_io_state2c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_4_clock; // @[FFTEngine.scala 481:29]
  wire  fftCalc_4_reset; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_4_io_dataInSR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_4_io_dataInSI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_4_io_dataInTR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_4_io_dataInTI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_4_io_dataOutSR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_4_io_dataOutSI3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_4_io_dataOutTR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_4_io_dataOutTI3c; // @[FFTEngine.scala 481:29]
  wire [6:0] fftCalc_4_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_4_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_4_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_4_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_4_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_4_io_state2c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_5_clock; // @[FFTEngine.scala 481:29]
  wire  fftCalc_5_reset; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_5_io_dataInSR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_5_io_dataInSI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_5_io_dataInTR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_5_io_dataInTI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_5_io_dataOutSR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_5_io_dataOutSI3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_5_io_dataOutTR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_5_io_dataOutTI3c; // @[FFTEngine.scala 481:29]
  wire [6:0] fftCalc_5_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_5_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_5_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_5_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_5_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_5_io_state2c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_6_clock; // @[FFTEngine.scala 481:29]
  wire  fftCalc_6_reset; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_6_io_dataInSR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_6_io_dataInSI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_6_io_dataInTR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_6_io_dataInTI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_6_io_dataOutSR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_6_io_dataOutSI3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_6_io_dataOutTR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_6_io_dataOutTI3c; // @[FFTEngine.scala 481:29]
  wire [6:0] fftCalc_6_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_6_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_6_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_6_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_6_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_6_io_state2c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_7_clock; // @[FFTEngine.scala 481:29]
  wire  fftCalc_7_reset; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_7_io_dataInSR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_7_io_dataInSI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_7_io_dataInTR; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_7_io_dataInTI; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_7_io_dataOutSR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_7_io_dataOutSI3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_7_io_dataOutTR3c; // @[FFTEngine.scala 481:29]
  wire [15:0] fftCalc_7_io_dataOutTI3c; // @[FFTEngine.scala 481:29]
  wire [6:0] fftCalc_7_io_nk; // @[FFTEngine.scala 481:29]
  wire  fftCalc_7_io_rShiftSym; // @[FFTEngine.scala 481:29]
  wire  fftCalc_7_io_isFFT; // @[FFTEngine.scala 481:29]
  wire  fftCalc_7_io_procMode; // @[FFTEngine.scala 481:29]
  wire  fftCalc_7_io_state1c; // @[FFTEngine.scala 481:29]
  wire  fftCalc_7_io_state2c; // @[FFTEngine.scala 481:29]
  reg [2:0] stateReg; // @[FFTEngine.scala 46:27]
  reg [7:0] addrSProc; // @[FFTEngine.scala 48:29]
  reg [2:0] phaseCount; // @[FFTEngine.scala 50:29]
  wire  _T_2 = addrSProc == 8'hf; // @[FFTEngine.scala 62:33]
  wire  _T_4 = addrSProc == 8'h3; // @[FFTEngine.scala 69:33]
  wire [2:0] _GEN_2 = addrSProc == 8'h3 ? 3'h3 : stateReg; // @[FFTEngine.scala 69:49 70:30 72:30]
  wire  _T_6 = phaseCount == 3'h7; // @[FFTEngine.scala 76:33]
  wire [2:0] _stateReg_T_1 = io_fftMode ? 3'h4 : 3'h7; // @[FFTEngine.scala 77:36]
  wire [2:0] _GEN_3 = phaseCount == 3'h7 ? _stateReg_T_1 : 3'h1; // @[FFTEngine.scala 76:50 77:30 79:30]
  wire  _T_8 = addrSProc == 8'h7f; // @[FFTEngine.scala 83:33]
  wire [2:0] _GEN_4 = addrSProc == 8'h7f ? 3'h5 : stateReg; // @[FFTEngine.scala 83:51 84:30 86:30]
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
  wire [3:0] radixCountTemp = addrSProc[3:0]; // @[FFTEngine.scala 196:36]
  wire [4:0] _nk_0_T_1 = {1'h0,radixCountTemp}; // @[Cat.scala 33:92]
  wire [4:0] _nk_1_T_1 = {1'h1,radixCountTemp}; // @[Cat.scala 33:92]
  wire [5:0] _nk_2_T_1 = {2'h2,radixCountTemp}; // @[Cat.scala 33:92]
  wire [5:0] _nk_3_T_1 = {2'h3,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _nk_4_T_1 = {3'h4,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _nk_5_T_1 = {3'h5,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _nk_6_T_1 = {3'h6,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _nk_7_T_1 = {3'h7,radixCountTemp}; // @[Cat.scala 33:92]
  wire  _T_15 = phaseCount == 3'h6; // @[FFTEngine.scala 242:32]
  wire [4:0] _nk_0_T_3 = {1'h0,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _nk_1_T_3 = {1'h1,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [5:0] _nk_2_T_3 = {2'h2,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [5:0] _nk_3_T_3 = {2'h3,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_4_T_3 = {3'h4,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_5_T_3 = {3'h5,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_6_T_3 = {3'h6,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_7_T_3 = {3'h7,addrSProc[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [2:0] _T_17 = 3'h6 - 3'h1; // @[FFTEngine.scala 251:50]
  wire  _T_18 = phaseCount == _T_17; // @[FFTEngine.scala 251:32]
  wire [4:0] _nk_0_T_5 = {1'h0,addrSProc[3:2],2'h0}; // @[Cat.scala 33:92]
  wire [4:0] _nk_1_T_5 = {1'h1,addrSProc[3:2],2'h0}; // @[Cat.scala 33:92]
  wire [5:0] _nk_2_T_5 = {2'h2,addrSProc[3:2],2'h0}; // @[Cat.scala 33:92]
  wire [5:0] _nk_3_T_5 = {2'h3,addrSProc[3:2],2'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_4_T_5 = {3'h4,addrSProc[3:2],2'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_5_T_5 = {3'h5,addrSProc[3:2],2'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_6_T_5 = {3'h6,addrSProc[3:2],2'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_7_T_5 = {3'h7,addrSProc[3:2],2'h0}; // @[Cat.scala 33:92]
  wire [9:0] _nk_0_T_7 = {addrSProc[6:0],3'h0}; // @[Cat.scala 33:92]
  wire [7:0] _nk_0_T_10 = 8'h7f >> phaseCount; // @[FFTEngine.scala 257:164]
  wire [7:0] _nk_0_T_11 = ~_nk_0_T_10; // @[FFTEngine.scala 257:102]
  wire [9:0] _GEN_4221 = {{2'd0}, _nk_0_T_11}; // @[FFTEngine.scala 257:100]
  wire [9:0] _nk_0_T_12 = _nk_0_T_7 & _GEN_4221; // @[FFTEngine.scala 257:100]
  wire [9:0] _nk_1_T_7 = {addrSProc[6:0],3'h1}; // @[Cat.scala 33:92]
  wire [9:0] _nk_1_T_12 = _nk_1_T_7 & _GEN_4221; // @[FFTEngine.scala 257:100]
  wire [9:0] _nk_2_T_7 = {addrSProc[6:0],3'h2}; // @[Cat.scala 33:92]
  wire [9:0] _nk_2_T_12 = _nk_2_T_7 & _GEN_4221; // @[FFTEngine.scala 257:100]
  wire [9:0] _nk_3_T_7 = {addrSProc[6:0],3'h3}; // @[Cat.scala 33:92]
  wire [9:0] _nk_3_T_12 = _nk_3_T_7 & _GEN_4221; // @[FFTEngine.scala 257:100]
  wire [9:0] _nk_4_T_7 = {addrSProc[6:0],3'h4}; // @[Cat.scala 33:92]
  wire [9:0] _nk_4_T_12 = _nk_4_T_7 & _GEN_4221; // @[FFTEngine.scala 257:100]
  wire [9:0] _nk_5_T_7 = {addrSProc[6:0],3'h5}; // @[Cat.scala 33:92]
  wire [9:0] _nk_5_T_12 = _nk_5_T_7 & _GEN_4221; // @[FFTEngine.scala 257:100]
  wire [9:0] _nk_6_T_7 = {addrSProc[6:0],3'h6}; // @[Cat.scala 33:92]
  wire [9:0] _nk_6_T_12 = _nk_6_T_7 & _GEN_4221; // @[FFTEngine.scala 257:100]
  wire [9:0] _nk_7_T_7 = {addrSProc[6:0],3'h7}; // @[Cat.scala 33:92]
  wire [9:0] _nk_7_T_12 = _nk_7_T_7 & _GEN_4221; // @[FFTEngine.scala 257:100]
  wire [9:0] _GEN_20 = phaseCount == _T_17 ? {{5'd0}, _nk_0_T_5} : _nk_0_T_12; // @[FFTEngine.scala 251:57 253:27 257:23]
  wire [9:0] _GEN_21 = phaseCount == _T_17 ? {{5'd0}, _nk_1_T_5} : _nk_1_T_12; // @[FFTEngine.scala 251:57 253:27 257:23]
  wire [9:0] _GEN_22 = phaseCount == _T_17 ? {{4'd0}, _nk_2_T_5} : _nk_2_T_12; // @[FFTEngine.scala 251:57 253:27 257:23]
  wire [9:0] _GEN_23 = phaseCount == _T_17 ? {{4'd0}, _nk_3_T_5} : _nk_3_T_12; // @[FFTEngine.scala 251:57 253:27 257:23]
  wire [9:0] _GEN_24 = phaseCount == _T_17 ? {{3'd0}, _nk_4_T_5} : _nk_4_T_12; // @[FFTEngine.scala 251:57 253:27 257:23]
  wire [9:0] _GEN_25 = phaseCount == _T_17 ? {{3'd0}, _nk_5_T_5} : _nk_5_T_12; // @[FFTEngine.scala 251:57 253:27 257:23]
  wire [9:0] _GEN_26 = phaseCount == _T_17 ? {{3'd0}, _nk_6_T_5} : _nk_6_T_12; // @[FFTEngine.scala 251:57 253:27 257:23]
  wire [9:0] _GEN_27 = phaseCount == _T_17 ? {{3'd0}, _nk_7_T_5} : _nk_7_T_12; // @[FFTEngine.scala 251:57 253:27 257:23]
  wire [9:0] _GEN_28 = phaseCount == 3'h6 ? {{5'd0}, _nk_0_T_3} : _GEN_20; // @[FFTEngine.scala 242:51 247:27]
  wire [9:0] _GEN_29 = phaseCount == 3'h6 ? {{5'd0}, _nk_1_T_3} : _GEN_21; // @[FFTEngine.scala 242:51 247:27]
  wire [9:0] _GEN_30 = phaseCount == 3'h6 ? {{4'd0}, _nk_2_T_3} : _GEN_22; // @[FFTEngine.scala 242:51 247:27]
  wire [9:0] _GEN_31 = phaseCount == 3'h6 ? {{4'd0}, _nk_3_T_3} : _GEN_23; // @[FFTEngine.scala 242:51 247:27]
  wire [9:0] _GEN_32 = phaseCount == 3'h6 ? {{3'd0}, _nk_4_T_3} : _GEN_24; // @[FFTEngine.scala 242:51 247:27]
  wire [9:0] _GEN_33 = phaseCount == 3'h6 ? {{3'd0}, _nk_5_T_3} : _GEN_25; // @[FFTEngine.scala 242:51 247:27]
  wire [9:0] _GEN_34 = phaseCount == 3'h6 ? {{3'd0}, _nk_6_T_3} : _GEN_26; // @[FFTEngine.scala 242:51 247:27]
  wire [9:0] _GEN_35 = phaseCount == 3'h6 ? {{3'd0}, _nk_7_T_3} : _GEN_27; // @[FFTEngine.scala 242:51 247:27]
  wire [9:0] nk_0 = _T_6 ? {{5'd0}, _nk_0_T_1} : _GEN_28; // @[FFTEngine.scala 238:42 240:23]
  wire [9:0] nk_1 = _T_6 ? {{5'd0}, _nk_1_T_1} : _GEN_29; // @[FFTEngine.scala 238:42 240:23]
  wire [9:0] nk_2 = _T_6 ? {{4'd0}, _nk_2_T_1} : _GEN_30; // @[FFTEngine.scala 238:42 240:23]
  wire [9:0] nk_3 = _T_6 ? {{4'd0}, _nk_3_T_1} : _GEN_31; // @[FFTEngine.scala 238:42 240:23]
  wire [9:0] nk_4 = _T_6 ? {{3'd0}, _nk_4_T_1} : _GEN_32; // @[FFTEngine.scala 238:42 240:23]
  wire [9:0] nk_5 = _T_6 ? {{3'd0}, _nk_5_T_1} : _GEN_33; // @[FFTEngine.scala 238:42 240:23]
  wire [9:0] nk_6 = _T_6 ? {{3'd0}, _nk_6_T_1} : _GEN_34; // @[FFTEngine.scala 238:42 240:23]
  wire [9:0] nk_7 = _T_6 ? {{3'd0}, _nk_7_T_1} : _GEN_35; // @[FFTEngine.scala 238:42 240:23]
  wire [15:0] addrSKernelPre_0_dataTemp = {4'h0,radixCountTemp,4'h0,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrTKernelPre_0_dataTemp = {4'h8,radixCountTemp,4'h8,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrSKernelPre_1_dataTemp = {4'h1,radixCountTemp,4'h1,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrTKernelPre_1_dataTemp = {4'h9,radixCountTemp,4'h9,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrSKernelPre_2_dataTemp = {4'h2,radixCountTemp,4'h2,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrTKernelPre_2_dataTemp = {4'ha,radixCountTemp,4'ha,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrSKernelPre_3_dataTemp = {4'h3,radixCountTemp,4'h3,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrTKernelPre_3_dataTemp = {4'hb,radixCountTemp,4'hb,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrSKernelPre_4_dataTemp = {4'h4,radixCountTemp,4'h4,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrTKernelPre_4_dataTemp = {4'hc,radixCountTemp,4'hc,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrSKernelPre_5_dataTemp = {4'h5,radixCountTemp,4'h5,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrTKernelPre_5_dataTemp = {4'hd,radixCountTemp,4'hd,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrSKernelPre_6_dataTemp = {4'h6,radixCountTemp,4'h6,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrTKernelPre_6_dataTemp = {4'he,radixCountTemp,4'he,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrSKernelPre_7_dataTemp = {4'h7,radixCountTemp,4'h7,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrTKernelPre_7_dataTemp = {4'hf,radixCountTemp,4'hf,radixCountTemp}; // @[Cat.scala 33:92]
  wire [15:0] addrSKernelPre_0_dataTemp_1 = {{1'd0}, addrSKernelPre_0_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_0_dataTemp_1 = {{1'd0}, addrTKernelPre_0_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_1_dataTemp_1 = {{1'd0}, addrSKernelPre_1_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_1_dataTemp_1 = {{1'd0}, addrTKernelPre_1_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_2_dataTemp_1 = {{1'd0}, addrSKernelPre_2_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_2_dataTemp_1 = {{1'd0}, addrTKernelPre_2_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_3_dataTemp_1 = {{1'd0}, addrSKernelPre_3_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_3_dataTemp_1 = {{1'd0}, addrTKernelPre_3_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_4_dataTemp_1 = {{1'd0}, addrSKernelPre_4_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_4_dataTemp_1 = {{1'd0}, addrTKernelPre_4_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_5_dataTemp_1 = {{1'd0}, addrSKernelPre_5_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_5_dataTemp_1 = {{1'd0}, addrTKernelPre_5_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_6_dataTemp_1 = {{1'd0}, addrSKernelPre_6_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_6_dataTemp_1 = {{1'd0}, addrTKernelPre_6_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_7_dataTemp_1 = {{1'd0}, addrSKernelPre_7_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_7_dataTemp_1 = {{1'd0}, addrTKernelPre_7_dataTemp[15:1]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_0_dataTemp_2 = {{2'd0}, addrSKernelPre_0_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_0_dataTemp_2 = {{2'd0}, addrTKernelPre_0_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_1_dataTemp_2 = {{2'd0}, addrSKernelPre_1_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_1_dataTemp_2 = {{2'd0}, addrTKernelPre_1_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_2_dataTemp_2 = {{2'd0}, addrSKernelPre_2_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_2_dataTemp_2 = {{2'd0}, addrTKernelPre_2_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_3_dataTemp_2 = {{2'd0}, addrSKernelPre_3_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_3_dataTemp_2 = {{2'd0}, addrTKernelPre_3_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_4_dataTemp_2 = {{2'd0}, addrSKernelPre_4_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_4_dataTemp_2 = {{2'd0}, addrTKernelPre_4_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_5_dataTemp_2 = {{2'd0}, addrSKernelPre_5_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_5_dataTemp_2 = {{2'd0}, addrTKernelPre_5_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_6_dataTemp_2 = {{2'd0}, addrSKernelPre_6_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_6_dataTemp_2 = {{2'd0}, addrTKernelPre_6_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrSKernelPre_7_dataTemp_2 = {{2'd0}, addrSKernelPre_7_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] addrTKernelPre_7_dataTemp_2 = {{2'd0}, addrTKernelPre_7_dataTemp[15:2]}; // @[FFTEngine.scala 268:40]
  wire [15:0] _addrSKernelPre_0_dataTemp_T_3 = {radixCountTemp,3'h0,1'h0,radixCountTemp,3'h0,1'h0}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_36 = {{7'd0}, _addrSKernelPre_0_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrSKernelPre_0_dataTemp_3 = _GEN_36 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrTKernelPre_0_dataTemp_T_3 = {radixCountTemp,3'h0,1'h1,radixCountTemp,3'h0,1'h1}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_37 = {{7'd0}, _addrTKernelPre_0_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrTKernelPre_0_dataTemp_3 = _GEN_37 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrSKernelPre_1_dataTemp_T_3 = {radixCountTemp,3'h1,1'h0,radixCountTemp,3'h1,1'h0}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_38 = {{7'd0}, _addrSKernelPre_1_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrSKernelPre_1_dataTemp_3 = _GEN_38 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrTKernelPre_1_dataTemp_T_3 = {radixCountTemp,3'h1,1'h1,radixCountTemp,3'h1,1'h1}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_39 = {{7'd0}, _addrTKernelPre_1_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrTKernelPre_1_dataTemp_3 = _GEN_39 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrSKernelPre_2_dataTemp_T_3 = {radixCountTemp,3'h2,1'h0,radixCountTemp,3'h2,1'h0}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_40 = {{7'd0}, _addrSKernelPre_2_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrSKernelPre_2_dataTemp_3 = _GEN_40 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrTKernelPre_2_dataTemp_T_3 = {radixCountTemp,3'h2,1'h1,radixCountTemp,3'h2,1'h1}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_41 = {{7'd0}, _addrTKernelPre_2_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrTKernelPre_2_dataTemp_3 = _GEN_41 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrSKernelPre_3_dataTemp_T_3 = {radixCountTemp,3'h3,1'h0,radixCountTemp,3'h3,1'h0}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_42 = {{7'd0}, _addrSKernelPre_3_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrSKernelPre_3_dataTemp_3 = _GEN_42 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrTKernelPre_3_dataTemp_T_3 = {radixCountTemp,3'h3,1'h1,radixCountTemp,3'h3,1'h1}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_43 = {{7'd0}, _addrTKernelPre_3_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrTKernelPre_3_dataTemp_3 = _GEN_43 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrSKernelPre_4_dataTemp_T_3 = {radixCountTemp,3'h4,1'h0,radixCountTemp,3'h4,1'h0}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_76 = {{7'd0}, _addrSKernelPre_4_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrSKernelPre_4_dataTemp_3 = _GEN_76 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrTKernelPre_4_dataTemp_T_3 = {radixCountTemp,3'h4,1'h1,radixCountTemp,3'h4,1'h1}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_77 = {{7'd0}, _addrTKernelPre_4_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrTKernelPre_4_dataTemp_3 = _GEN_77 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrSKernelPre_5_dataTemp_T_3 = {radixCountTemp,3'h5,1'h0,radixCountTemp,3'h5,1'h0}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_78 = {{7'd0}, _addrSKernelPre_5_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrSKernelPre_5_dataTemp_3 = _GEN_78 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrTKernelPre_5_dataTemp_T_3 = {radixCountTemp,3'h5,1'h1,radixCountTemp,3'h5,1'h1}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_79 = {{7'd0}, _addrTKernelPre_5_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrTKernelPre_5_dataTemp_3 = _GEN_79 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrSKernelPre_6_dataTemp_T_3 = {radixCountTemp,3'h6,1'h0,radixCountTemp,3'h6,1'h0}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_80 = {{7'd0}, _addrSKernelPre_6_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrSKernelPre_6_dataTemp_3 = _GEN_80 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrTKernelPre_6_dataTemp_T_3 = {radixCountTemp,3'h6,1'h1,radixCountTemp,3'h6,1'h1}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_81 = {{7'd0}, _addrTKernelPre_6_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrTKernelPre_6_dataTemp_3 = _GEN_81 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrSKernelPre_7_dataTemp_T_3 = {radixCountTemp,3'h7,1'h0,radixCountTemp,3'h7,1'h0}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_82 = {{7'd0}, _addrSKernelPre_7_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrSKernelPre_7_dataTemp_3 = _GEN_82 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [15:0] _addrTKernelPre_7_dataTemp_T_3 = {radixCountTemp,3'h7,1'h1,radixCountTemp,3'h7,1'h1}; // @[Cat.scala 33:92]
  wire [22:0] _GEN_83 = {{7'd0}, _addrTKernelPre_7_dataTemp_T_3}; // @[FFTEngine.scala 263:40]
  wire [22:0] addrTKernelPre_7_dataTemp_3 = _GEN_83 << phaseCount; // @[FFTEngine.scala 263:40]
  wire [7:0] _GEN_44 = _T_18 ? addrSKernelPre_0_dataTemp_2[7:0] : addrSKernelPre_0_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 320:35 325:35]
  wire [7:0] _GEN_45 = _T_18 ? addrTKernelPre_0_dataTemp_2[7:0] : addrTKernelPre_0_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 321:35 326:35]
  wire [7:0] _GEN_46 = _T_18 ? addrSKernelPre_1_dataTemp_2[7:0] : addrSKernelPre_1_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 320:35 325:35]
  wire [7:0] _GEN_47 = _T_18 ? addrTKernelPre_1_dataTemp_2[7:0] : addrTKernelPre_1_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 321:35 326:35]
  wire [7:0] _GEN_48 = _T_18 ? addrSKernelPre_2_dataTemp_2[7:0] : addrSKernelPre_2_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 320:35 325:35]
  wire [7:0] _GEN_49 = _T_18 ? addrTKernelPre_2_dataTemp_2[7:0] : addrTKernelPre_2_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 321:35 326:35]
  wire [7:0] _GEN_50 = _T_18 ? addrSKernelPre_3_dataTemp_2[7:0] : addrSKernelPre_3_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 320:35 325:35]
  wire [7:0] _GEN_51 = _T_18 ? addrTKernelPre_3_dataTemp_2[7:0] : addrTKernelPre_3_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 321:35 326:35]
  wire [7:0] _GEN_52 = _T_18 ? addrSKernelPre_4_dataTemp_2[7:0] : addrSKernelPre_4_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 320:35 325:35]
  wire [7:0] _GEN_53 = _T_18 ? addrTKernelPre_4_dataTemp_2[7:0] : addrTKernelPre_4_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 321:35 326:35]
  wire [7:0] _GEN_54 = _T_18 ? addrSKernelPre_5_dataTemp_2[7:0] : addrSKernelPre_5_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 320:35 325:35]
  wire [7:0] _GEN_55 = _T_18 ? addrTKernelPre_5_dataTemp_2[7:0] : addrTKernelPre_5_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 321:35 326:35]
  wire [7:0] _GEN_56 = _T_18 ? addrSKernelPre_6_dataTemp_2[7:0] : addrSKernelPre_6_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 320:35 325:35]
  wire [7:0] _GEN_57 = _T_18 ? addrTKernelPre_6_dataTemp_2[7:0] : addrTKernelPre_6_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 321:35 326:35]
  wire [7:0] _GEN_58 = _T_18 ? addrSKernelPre_7_dataTemp_2[7:0] : addrSKernelPre_7_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 320:35 325:35]
  wire [7:0] _GEN_59 = _T_18 ? addrTKernelPre_7_dataTemp_2[7:0] : addrTKernelPre_7_dataTemp_3[15:8]; // @[FFTEngine.scala 318:59 321:35 326:35]
  wire [7:0] _GEN_60 = _T_15 ? addrSKernelPre_0_dataTemp_1[7:0] : _GEN_44; // @[FFTEngine.scala 313:51 315:35]
  wire [7:0] _GEN_61 = _T_15 ? addrTKernelPre_0_dataTemp_1[7:0] : _GEN_45; // @[FFTEngine.scala 313:51 316:35]
  wire [7:0] _GEN_62 = _T_15 ? addrSKernelPre_1_dataTemp_1[7:0] : _GEN_46; // @[FFTEngine.scala 313:51 315:35]
  wire [7:0] _GEN_63 = _T_15 ? addrTKernelPre_1_dataTemp_1[7:0] : _GEN_47; // @[FFTEngine.scala 313:51 316:35]
  wire [7:0] _GEN_64 = _T_15 ? addrSKernelPre_2_dataTemp_1[7:0] : _GEN_48; // @[FFTEngine.scala 313:51 315:35]
  wire [7:0] _GEN_65 = _T_15 ? addrTKernelPre_2_dataTemp_1[7:0] : _GEN_49; // @[FFTEngine.scala 313:51 316:35]
  wire [7:0] _GEN_66 = _T_15 ? addrSKernelPre_3_dataTemp_1[7:0] : _GEN_50; // @[FFTEngine.scala 313:51 315:35]
  wire [7:0] _GEN_67 = _T_15 ? addrTKernelPre_3_dataTemp_1[7:0] : _GEN_51; // @[FFTEngine.scala 313:51 316:35]
  wire [7:0] _GEN_68 = _T_15 ? addrSKernelPre_4_dataTemp_1[7:0] : _GEN_52; // @[FFTEngine.scala 313:51 315:35]
  wire [7:0] _GEN_69 = _T_15 ? addrTKernelPre_4_dataTemp_1[7:0] : _GEN_53; // @[FFTEngine.scala 313:51 316:35]
  wire [7:0] _GEN_70 = _T_15 ? addrSKernelPre_5_dataTemp_1[7:0] : _GEN_54; // @[FFTEngine.scala 313:51 315:35]
  wire [7:0] _GEN_71 = _T_15 ? addrTKernelPre_5_dataTemp_1[7:0] : _GEN_55; // @[FFTEngine.scala 313:51 316:35]
  wire [7:0] _GEN_72 = _T_15 ? addrSKernelPre_6_dataTemp_1[7:0] : _GEN_56; // @[FFTEngine.scala 313:51 315:35]
  wire [7:0] _GEN_73 = _T_15 ? addrTKernelPre_6_dataTemp_1[7:0] : _GEN_57; // @[FFTEngine.scala 313:51 316:35]
  wire [7:0] _GEN_74 = _T_15 ? addrSKernelPre_7_dataTemp_1[7:0] : _GEN_58; // @[FFTEngine.scala 313:51 315:35]
  wire [7:0] _GEN_75 = _T_15 ? addrTKernelPre_7_dataTemp_1[7:0] : _GEN_59; // @[FFTEngine.scala 313:51 316:35]
  wire [7:0] addrSKernelPre_0 = _T_6 ? addrSKernelPre_0_dataTemp[7:0] : _GEN_60; // @[FFTEngine.scala 308:42 310:35]
  wire [7:0] addrTKernelPre_0 = _T_6 ? addrTKernelPre_0_dataTemp[7:0] : _GEN_61; // @[FFTEngine.scala 308:42 311:35]
  wire [7:0] addrSKernelPre_1 = _T_6 ? addrSKernelPre_1_dataTemp[7:0] : _GEN_62; // @[FFTEngine.scala 308:42 310:35]
  wire [7:0] addrTKernelPre_1 = _T_6 ? addrTKernelPre_1_dataTemp[7:0] : _GEN_63; // @[FFTEngine.scala 308:42 311:35]
  wire [7:0] addrSKernelPre_2 = _T_6 ? addrSKernelPre_2_dataTemp[7:0] : _GEN_64; // @[FFTEngine.scala 308:42 310:35]
  wire [7:0] addrTKernelPre_2 = _T_6 ? addrTKernelPre_2_dataTemp[7:0] : _GEN_65; // @[FFTEngine.scala 308:42 311:35]
  wire [7:0] addrSKernelPre_3 = _T_6 ? addrSKernelPre_3_dataTemp[7:0] : _GEN_66; // @[FFTEngine.scala 308:42 310:35]
  wire [7:0] addrTKernelPre_3 = _T_6 ? addrTKernelPre_3_dataTemp[7:0] : _GEN_67; // @[FFTEngine.scala 308:42 311:35]
  wire [7:0] addrSKernelPre_4 = _T_6 ? addrSKernelPre_4_dataTemp[7:0] : _GEN_68; // @[FFTEngine.scala 308:42 310:35]
  wire [7:0] addrTKernelPre_4 = _T_6 ? addrTKernelPre_4_dataTemp[7:0] : _GEN_69; // @[FFTEngine.scala 308:42 311:35]
  wire [7:0] addrSKernelPre_5 = _T_6 ? addrSKernelPre_5_dataTemp[7:0] : _GEN_70; // @[FFTEngine.scala 308:42 310:35]
  wire [7:0] addrTKernelPre_5 = _T_6 ? addrTKernelPre_5_dataTemp[7:0] : _GEN_71; // @[FFTEngine.scala 308:42 311:35]
  wire [7:0] addrSKernelPre_6 = _T_6 ? addrSKernelPre_6_dataTemp[7:0] : _GEN_72; // @[FFTEngine.scala 308:42 310:35]
  wire [7:0] addrTKernelPre_6 = _T_6 ? addrTKernelPre_6_dataTemp[7:0] : _GEN_73; // @[FFTEngine.scala 308:42 311:35]
  wire [7:0] addrSKernelPre_7 = _T_6 ? addrSKernelPre_7_dataTemp[7:0] : _GEN_74; // @[FFTEngine.scala 308:42 310:35]
  wire [7:0] addrTKernelPre_7 = _T_6 ? addrTKernelPre_7_dataTemp[7:0] : _GEN_75; // @[FFTEngine.scala 308:42 311:35]
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
  wire  addrS_1_temp_0 = addrSKernelPre_1[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_1 = addrSKernelPre_1[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_2 = addrSKernelPre_1[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_1_temp_3 = addrSKernelPre_1[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrS_1 = {addrSKernelPre_1[0],addrSKernelPre_1[1],addrSKernelPre_1[2],addrSKernelPre_1[3],addrS_1_temp_3,
    addrS_1_temp_2,addrS_1_temp_1,addrS_1_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_1_temp_0 = addrTKernelPre_1[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_1 = addrTKernelPre_1[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_2 = addrTKernelPre_1[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_1_temp_3 = addrTKernelPre_1[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrT_1 = {addrTKernelPre_1[0],addrTKernelPre_1[1],addrTKernelPre_1[2],addrTKernelPre_1[3],addrT_1_temp_3,
    addrT_1_temp_2,addrT_1_temp_1,addrT_1_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_2_temp_0 = addrSKernelPre_2[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_1 = addrSKernelPre_2[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_2 = addrSKernelPre_2[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_2_temp_3 = addrSKernelPre_2[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrS_2 = {addrSKernelPre_2[0],addrSKernelPre_2[1],addrSKernelPre_2[2],addrSKernelPre_2[3],addrS_2_temp_3,
    addrS_2_temp_2,addrS_2_temp_1,addrS_2_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_2_temp_0 = addrTKernelPre_2[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_1 = addrTKernelPre_2[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_2 = addrTKernelPre_2[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_2_temp_3 = addrTKernelPre_2[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrT_2 = {addrTKernelPre_2[0],addrTKernelPre_2[1],addrTKernelPre_2[2],addrTKernelPre_2[3],addrT_2_temp_3,
    addrT_2_temp_2,addrT_2_temp_1,addrT_2_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_3_temp_0 = addrSKernelPre_3[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_1 = addrSKernelPre_3[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_2 = addrSKernelPre_3[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_3_temp_3 = addrSKernelPre_3[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrS_3 = {addrSKernelPre_3[0],addrSKernelPre_3[1],addrSKernelPre_3[2],addrSKernelPre_3[3],addrS_3_temp_3,
    addrS_3_temp_2,addrS_3_temp_1,addrS_3_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_3_temp_0 = addrTKernelPre_3[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_1 = addrTKernelPre_3[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_2 = addrTKernelPre_3[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_3_temp_3 = addrTKernelPre_3[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrT_3 = {addrTKernelPre_3[0],addrTKernelPre_3[1],addrTKernelPre_3[2],addrTKernelPre_3[3],addrT_3_temp_3,
    addrT_3_temp_2,addrT_3_temp_1,addrT_3_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_4_temp_0 = addrSKernelPre_4[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_4_temp_1 = addrSKernelPre_4[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_4_temp_2 = addrSKernelPre_4[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_4_temp_3 = addrSKernelPre_4[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrS_4 = {addrSKernelPre_4[0],addrSKernelPre_4[1],addrSKernelPre_4[2],addrSKernelPre_4[3],addrS_4_temp_3,
    addrS_4_temp_2,addrS_4_temp_1,addrS_4_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_4_temp_0 = addrTKernelPre_4[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_4_temp_1 = addrTKernelPre_4[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_4_temp_2 = addrTKernelPre_4[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_4_temp_3 = addrTKernelPre_4[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrT_4 = {addrTKernelPre_4[0],addrTKernelPre_4[1],addrTKernelPre_4[2],addrTKernelPre_4[3],addrT_4_temp_3,
    addrT_4_temp_2,addrT_4_temp_1,addrT_4_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_5_temp_0 = addrSKernelPre_5[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_5_temp_1 = addrSKernelPre_5[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_5_temp_2 = addrSKernelPre_5[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_5_temp_3 = addrSKernelPre_5[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrS_5 = {addrSKernelPre_5[0],addrSKernelPre_5[1],addrSKernelPre_5[2],addrSKernelPre_5[3],addrS_5_temp_3,
    addrS_5_temp_2,addrS_5_temp_1,addrS_5_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_5_temp_0 = addrTKernelPre_5[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_5_temp_1 = addrTKernelPre_5[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_5_temp_2 = addrTKernelPre_5[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_5_temp_3 = addrTKernelPre_5[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrT_5 = {addrTKernelPre_5[0],addrTKernelPre_5[1],addrTKernelPre_5[2],addrTKernelPre_5[3],addrT_5_temp_3,
    addrT_5_temp_2,addrT_5_temp_1,addrT_5_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_6_temp_0 = addrSKernelPre_6[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_6_temp_1 = addrSKernelPre_6[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_6_temp_2 = addrSKernelPre_6[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_6_temp_3 = addrSKernelPre_6[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrS_6 = {addrSKernelPre_6[0],addrSKernelPre_6[1],addrSKernelPre_6[2],addrSKernelPre_6[3],addrS_6_temp_3,
    addrS_6_temp_2,addrS_6_temp_1,addrS_6_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_6_temp_0 = addrTKernelPre_6[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_6_temp_1 = addrTKernelPre_6[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_6_temp_2 = addrTKernelPre_6[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_6_temp_3 = addrTKernelPre_6[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrT_6 = {addrTKernelPre_6[0],addrTKernelPre_6[1],addrTKernelPre_6[2],addrTKernelPre_6[3],addrT_6_temp_3,
    addrT_6_temp_2,addrT_6_temp_1,addrT_6_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrS_7_temp_0 = addrSKernelPre_7[7]; // @[FFTEngine.scala 200:34]
  wire  addrS_7_temp_1 = addrSKernelPre_7[6]; // @[FFTEngine.scala 200:34]
  wire  addrS_7_temp_2 = addrSKernelPre_7[5]; // @[FFTEngine.scala 200:34]
  wire  addrS_7_temp_3 = addrSKernelPre_7[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrS_7 = {addrSKernelPre_7[0],addrSKernelPre_7[1],addrSKernelPre_7[2],addrSKernelPre_7[3],addrS_7_temp_3,
    addrS_7_temp_2,addrS_7_temp_1,addrS_7_temp_0}; // @[FFTEngine.scala 201:23]
  wire  addrT_7_temp_0 = addrTKernelPre_7[7]; // @[FFTEngine.scala 200:34]
  wire  addrT_7_temp_1 = addrTKernelPre_7[6]; // @[FFTEngine.scala 200:34]
  wire  addrT_7_temp_2 = addrTKernelPre_7[5]; // @[FFTEngine.scala 200:34]
  wire  addrT_7_temp_3 = addrTKernelPre_7[4]; // @[FFTEngine.scala 200:34]
  wire [7:0] addrT_7 = {addrTKernelPre_7[0],addrTKernelPre_7[1],addrTKernelPre_7[2],addrTKernelPre_7[3],addrT_7_temp_3,
    addrT_7_temp_2,addrT_7_temp_1,addrT_7_temp_0}; // @[FFTEngine.scala 201:23]
  wire  sameAddr = addrS_0 == addrT_0; // @[FFTEngine.scala 346:29]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T = {{3'd0}, addrS_0[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4262 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_2 = {{1'd0}, _GEN_4262}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_4 = {{7'd0}, addrS_0[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4264 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_0_0 = _addrSBankSelKernelPrePre_sum_T_2[3:0] + _GEN_4264; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_7 = {{2'd0}, addrS_0[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4266 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_7[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_9 = {{1'd0}, _GEN_4266}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_11 = {{6'd0}, addrS_0[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4268 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_0_1 = _addrSBankSelKernelPrePre_sum_T_9[3:0] + _GEN_4268; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_14 = {{1'd0}, addrS_0[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4270 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_14[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_16 = {{1'd0}, _GEN_4270}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_18 = {{5'd0}, addrS_0[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4272 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_18[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_0_2 = _addrSBankSelKernelPrePre_sum_T_16[3:0] + _GEN_4272; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4273 = {{3'd0}, addrS_0[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_23 = {{1'd0}, _GEN_4273}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_25 = {{4'd0}, addrS_0[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4275 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_25[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_0_3 = _addrSBankSelKernelPrePre_sum_T_23[3:0] + _GEN_4275; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_28 = {{3'd0}, addrS_1[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4277 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_28[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_30 = {{1'd0}, _GEN_4277}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_32 = {{7'd0}, addrS_1[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4279 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_32[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_1_0 = _addrSBankSelKernelPrePre_sum_T_30[3:0] + _GEN_4279; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_35 = {{2'd0}, addrS_1[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4281 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_35[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_37 = {{1'd0}, _GEN_4281}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_39 = {{6'd0}, addrS_1[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4283 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_39[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_1_1 = _addrSBankSelKernelPrePre_sum_T_37[3:0] + _GEN_4283; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_42 = {{1'd0}, addrS_1[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4285 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_42[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_44 = {{1'd0}, _GEN_4285}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_46 = {{5'd0}, addrS_1[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4287 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_46[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_1_2 = _addrSBankSelKernelPrePre_sum_T_44[3:0] + _GEN_4287; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4288 = {{3'd0}, addrS_1[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_51 = {{1'd0}, _GEN_4288}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_53 = {{4'd0}, addrS_1[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4290 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_53[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_1_3 = _addrSBankSelKernelPrePre_sum_T_51[3:0] + _GEN_4290; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_56 = {{3'd0}, addrS_2[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4292 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_56[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_58 = {{1'd0}, _GEN_4292}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_60 = {{7'd0}, addrS_2[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4294 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_60[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_2_0 = _addrSBankSelKernelPrePre_sum_T_58[3:0] + _GEN_4294; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_63 = {{2'd0}, addrS_2[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4296 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_63[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_65 = {{1'd0}, _GEN_4296}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_67 = {{6'd0}, addrS_2[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4298 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_67[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_2_1 = _addrSBankSelKernelPrePre_sum_T_65[3:0] + _GEN_4298; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_70 = {{1'd0}, addrS_2[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4300 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_70[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_72 = {{1'd0}, _GEN_4300}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_74 = {{5'd0}, addrS_2[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4302 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_74[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_2_2 = _addrSBankSelKernelPrePre_sum_T_72[3:0] + _GEN_4302; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4303 = {{3'd0}, addrS_2[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_79 = {{1'd0}, _GEN_4303}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_81 = {{4'd0}, addrS_2[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4305 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_81[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_2_3 = _addrSBankSelKernelPrePre_sum_T_79[3:0] + _GEN_4305; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_84 = {{3'd0}, addrS_3[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4307 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_84[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_86 = {{1'd0}, _GEN_4307}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_88 = {{7'd0}, addrS_3[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4309 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_88[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_3_0 = _addrSBankSelKernelPrePre_sum_T_86[3:0] + _GEN_4309; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_91 = {{2'd0}, addrS_3[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4311 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_91[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_93 = {{1'd0}, _GEN_4311}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_95 = {{6'd0}, addrS_3[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4313 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_95[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_3_1 = _addrSBankSelKernelPrePre_sum_T_93[3:0] + _GEN_4313; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_98 = {{1'd0}, addrS_3[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4315 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_98[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_100 = {{1'd0}, _GEN_4315}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_102 = {{5'd0}, addrS_3[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4317 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_102[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_3_2 = _addrSBankSelKernelPrePre_sum_T_100[3:0] + _GEN_4317; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4318 = {{3'd0}, addrS_3[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_107 = {{1'd0}, _GEN_4318}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_109 = {{4'd0}, addrS_3[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4320 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_109[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_3_3 = _addrSBankSelKernelPrePre_sum_T_107[3:0] + _GEN_4320; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_112 = {{3'd0}, addrS_4[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4322 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_112[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_114 = {{1'd0}, _GEN_4322}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_116 = {{7'd0}, addrS_4[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4324 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_116[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_4_0 = _addrSBankSelKernelPrePre_sum_T_114[3:0] + _GEN_4324; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_119 = {{2'd0}, addrS_4[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4326 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_119[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_121 = {{1'd0}, _GEN_4326}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_123 = {{6'd0}, addrS_4[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4328 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_123[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_4_1 = _addrSBankSelKernelPrePre_sum_T_121[3:0] + _GEN_4328; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_126 = {{1'd0}, addrS_4[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4330 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_126[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_128 = {{1'd0}, _GEN_4330}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_130 = {{5'd0}, addrS_4[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4332 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_130[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_4_2 = _addrSBankSelKernelPrePre_sum_T_128[3:0] + _GEN_4332; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4333 = {{3'd0}, addrS_4[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_135 = {{1'd0}, _GEN_4333}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_137 = {{4'd0}, addrS_4[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4335 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_137[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_4_3 = _addrSBankSelKernelPrePre_sum_T_135[3:0] + _GEN_4335; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_140 = {{3'd0}, addrS_5[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4337 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_140[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_142 = {{1'd0}, _GEN_4337}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_144 = {{7'd0}, addrS_5[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4339 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_144[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_5_0 = _addrSBankSelKernelPrePre_sum_T_142[3:0] + _GEN_4339; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_147 = {{2'd0}, addrS_5[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4341 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_147[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_149 = {{1'd0}, _GEN_4341}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_151 = {{6'd0}, addrS_5[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4343 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_151[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_5_1 = _addrSBankSelKernelPrePre_sum_T_149[3:0] + _GEN_4343; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_154 = {{1'd0}, addrS_5[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4345 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_154[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_156 = {{1'd0}, _GEN_4345}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_158 = {{5'd0}, addrS_5[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4347 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_158[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_5_2 = _addrSBankSelKernelPrePre_sum_T_156[3:0] + _GEN_4347; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4348 = {{3'd0}, addrS_5[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_163 = {{1'd0}, _GEN_4348}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_165 = {{4'd0}, addrS_5[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4350 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_165[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_5_3 = _addrSBankSelKernelPrePre_sum_T_163[3:0] + _GEN_4350; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_168 = {{3'd0}, addrS_6[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4352 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_168[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_170 = {{1'd0}, _GEN_4352}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_172 = {{7'd0}, addrS_6[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4354 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_172[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_6_0 = _addrSBankSelKernelPrePre_sum_T_170[3:0] + _GEN_4354; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_175 = {{2'd0}, addrS_6[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4356 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_175[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_177 = {{1'd0}, _GEN_4356}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_179 = {{6'd0}, addrS_6[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4358 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_179[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_6_1 = _addrSBankSelKernelPrePre_sum_T_177[3:0] + _GEN_4358; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_182 = {{1'd0}, addrS_6[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4360 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_182[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_184 = {{1'd0}, _GEN_4360}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_186 = {{5'd0}, addrS_6[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4362 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_186[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_6_2 = _addrSBankSelKernelPrePre_sum_T_184[3:0] + _GEN_4362; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4363 = {{3'd0}, addrS_6[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_191 = {{1'd0}, _GEN_4363}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_193 = {{4'd0}, addrS_6[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4365 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_193[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_6_3 = _addrSBankSelKernelPrePre_sum_T_191[3:0] + _GEN_4365; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_196 = {{3'd0}, addrS_7[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4367 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_196[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_198 = {{1'd0}, _GEN_4367}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_200 = {{7'd0}, addrS_7[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4369 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_200[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_7_0 = _addrSBankSelKernelPrePre_sum_T_198[3:0] + _GEN_4369; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_203 = {{2'd0}, addrS_7[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4371 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_203[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_205 = {{1'd0}, _GEN_4371}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_207 = {{6'd0}, addrS_7[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4373 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_207[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_7_1 = _addrSBankSelKernelPrePre_sum_T_205[3:0] + _GEN_4373; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_210 = {{1'd0}, addrS_7[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4375 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_210[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_212 = {{1'd0}, _GEN_4375}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_214 = {{5'd0}, addrS_7[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4377 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_214[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_7_2 = _addrSBankSelKernelPrePre_sum_T_212[3:0] + _GEN_4377; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4378 = {{3'd0}, addrS_7[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPrePre_sum_T_219 = {{1'd0}, _GEN_4378}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrSBankSelKernelPrePre_sum_T_221 = {{4'd0}, addrS_7[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4380 = {{3'd0}, _addrSBankSelKernelPrePre_sum_T_221[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrSBankSelKernelPrePre_7_3 = _addrSBankSelKernelPrePre_sum_T_219[3:0] + _GEN_4380; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrSBankSelKernelPre_T_1 = {{1'd0}, addrSBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_3 = {_addrSBankSelKernelPre_T_1[3:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_4381 = {{1'd0}, addrSBankSelKernelPrePre_0_1}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_5 = _addrSBankSelKernelPre_T_3 + _GEN_4381; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_6 = {_addrSBankSelKernelPre_T_5, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [5:0] _GEN_4382 = {{2'd0}, addrSBankSelKernelPrePre_0_2}; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_8 = _addrSBankSelKernelPre_T_6 + _GEN_4382; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_9 = {_addrSBankSelKernelPre_T_8, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [6:0] _GEN_4383 = {{3'd0}, addrSBankSelKernelPrePre_0_3}; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_11 = _addrSBankSelKernelPre_T_9 + _GEN_4383; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_13 = {{1'd0}, addrSBankSelKernelPrePre_1_0}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_15 = {_addrSBankSelKernelPre_T_13[3:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_4384 = {{1'd0}, addrSBankSelKernelPrePre_1_1}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_17 = _addrSBankSelKernelPre_T_15 + _GEN_4384; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_18 = {_addrSBankSelKernelPre_T_17, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [5:0] _GEN_4385 = {{2'd0}, addrSBankSelKernelPrePre_1_2}; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_20 = _addrSBankSelKernelPre_T_18 + _GEN_4385; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_21 = {_addrSBankSelKernelPre_T_20, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [6:0] _GEN_4386 = {{3'd0}, addrSBankSelKernelPrePre_1_3}; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_23 = _addrSBankSelKernelPre_T_21 + _GEN_4386; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_25 = {{1'd0}, addrSBankSelKernelPrePre_2_0}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_27 = {_addrSBankSelKernelPre_T_25[3:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_4387 = {{1'd0}, addrSBankSelKernelPrePre_2_1}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_29 = _addrSBankSelKernelPre_T_27 + _GEN_4387; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_30 = {_addrSBankSelKernelPre_T_29, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [5:0] _GEN_4388 = {{2'd0}, addrSBankSelKernelPrePre_2_2}; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_32 = _addrSBankSelKernelPre_T_30 + _GEN_4388; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_33 = {_addrSBankSelKernelPre_T_32, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [6:0] _GEN_4389 = {{3'd0}, addrSBankSelKernelPrePre_2_3}; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_35 = _addrSBankSelKernelPre_T_33 + _GEN_4389; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_37 = {{1'd0}, addrSBankSelKernelPrePre_3_0}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_39 = {_addrSBankSelKernelPre_T_37[3:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_4390 = {{1'd0}, addrSBankSelKernelPrePre_3_1}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_41 = _addrSBankSelKernelPre_T_39 + _GEN_4390; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_42 = {_addrSBankSelKernelPre_T_41, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [5:0] _GEN_4391 = {{2'd0}, addrSBankSelKernelPrePre_3_2}; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_44 = _addrSBankSelKernelPre_T_42 + _GEN_4391; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_45 = {_addrSBankSelKernelPre_T_44, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [6:0] _GEN_4392 = {{3'd0}, addrSBankSelKernelPrePre_3_3}; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_47 = _addrSBankSelKernelPre_T_45 + _GEN_4392; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_49 = {{1'd0}, addrSBankSelKernelPrePre_4_0}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_51 = {_addrSBankSelKernelPre_T_49[3:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_4393 = {{1'd0}, addrSBankSelKernelPrePre_4_1}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_53 = _addrSBankSelKernelPre_T_51 + _GEN_4393; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_54 = {_addrSBankSelKernelPre_T_53, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [5:0] _GEN_4394 = {{2'd0}, addrSBankSelKernelPrePre_4_2}; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_56 = _addrSBankSelKernelPre_T_54 + _GEN_4394; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_57 = {_addrSBankSelKernelPre_T_56, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [6:0] _GEN_4395 = {{3'd0}, addrSBankSelKernelPrePre_4_3}; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_59 = _addrSBankSelKernelPre_T_57 + _GEN_4395; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_61 = {{1'd0}, addrSBankSelKernelPrePre_5_0}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_63 = {_addrSBankSelKernelPre_T_61[3:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_4396 = {{1'd0}, addrSBankSelKernelPrePre_5_1}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_65 = _addrSBankSelKernelPre_T_63 + _GEN_4396; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_66 = {_addrSBankSelKernelPre_T_65, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [5:0] _GEN_4397 = {{2'd0}, addrSBankSelKernelPrePre_5_2}; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_68 = _addrSBankSelKernelPre_T_66 + _GEN_4397; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_69 = {_addrSBankSelKernelPre_T_68, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [6:0] _GEN_4398 = {{3'd0}, addrSBankSelKernelPrePre_5_3}; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_71 = _addrSBankSelKernelPre_T_69 + _GEN_4398; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_73 = {{1'd0}, addrSBankSelKernelPrePre_6_0}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_75 = {_addrSBankSelKernelPre_T_73[3:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_4399 = {{1'd0}, addrSBankSelKernelPrePre_6_1}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_77 = _addrSBankSelKernelPre_T_75 + _GEN_4399; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_78 = {_addrSBankSelKernelPre_T_77, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [5:0] _GEN_4400 = {{2'd0}, addrSBankSelKernelPrePre_6_2}; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_80 = _addrSBankSelKernelPre_T_78 + _GEN_4400; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_81 = {_addrSBankSelKernelPre_T_80, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [6:0] _GEN_4401 = {{3'd0}, addrSBankSelKernelPrePre_6_3}; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_83 = _addrSBankSelKernelPre_T_81 + _GEN_4401; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_85 = {{1'd0}, addrSBankSelKernelPrePre_7_0}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_87 = {_addrSBankSelKernelPre_T_85[3:0], 1'h0}; // @[FFTEngine.scala 355:138]
  wire [4:0] _GEN_4402 = {{1'd0}, addrSBankSelKernelPrePre_7_1}; // @[FFTEngine.scala 355:144]
  wire [4:0] _addrSBankSelKernelPre_T_89 = _addrSBankSelKernelPre_T_87 + _GEN_4402; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_90 = {_addrSBankSelKernelPre_T_89, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [5:0] _GEN_4403 = {{2'd0}, addrSBankSelKernelPrePre_7_2}; // @[FFTEngine.scala 355:144]
  wire [5:0] _addrSBankSelKernelPre_T_92 = _addrSBankSelKernelPre_T_90 + _GEN_4403; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_93 = {_addrSBankSelKernelPre_T_92, 1'h0}; // @[FFTEngine.scala 355:138]
  wire [6:0] _GEN_4404 = {{3'd0}, addrSBankSelKernelPrePre_7_3}; // @[FFTEngine.scala 355:144]
  wire [6:0] _addrSBankSelKernelPre_T_95 = _addrSBankSelKernelPre_T_93 + _GEN_4404; // @[FFTEngine.scala 355:144]
  wire [3:0] addrSBankSelKernelPre_0 = _addrSBankSelKernelPre_T_11[3:0]; // @[FFTEngine.scala 355:160]
  wire [3:0] addrSBankSelKernelPre_1 = _addrSBankSelKernelPre_T_23[3:0]; // @[FFTEngine.scala 355:160]
  wire [3:0] addrSBankSelKernelPre_2 = _addrSBankSelKernelPre_T_35[3:0]; // @[FFTEngine.scala 355:160]
  wire [3:0] addrSBankSelKernelPre_3 = _addrSBankSelKernelPre_T_47[3:0]; // @[FFTEngine.scala 355:160]
  wire [3:0] addrSBankSelKernelPre_4 = _addrSBankSelKernelPre_T_59[3:0]; // @[FFTEngine.scala 355:160]
  wire [3:0] addrSBankSelKernelPre_5 = _addrSBankSelKernelPre_T_71[3:0]; // @[FFTEngine.scala 355:160]
  wire [3:0] addrSBankSelKernelPre_6 = _addrSBankSelKernelPre_T_83[3:0]; // @[FFTEngine.scala 355:160]
  wire [3:0] addrSBankSelKernelPre_7 = _addrSBankSelKernelPre_T_95[3:0]; // @[FFTEngine.scala 355:160]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T = {{3'd0}, addrT_0[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4406 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_2 = {{1'd0}, _GEN_4406}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_4 = {{7'd0}, addrT_0[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4408 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_0_0 = _addrTBankSelKernelPrePre_sum_T_2[3:0] + _GEN_4408; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_7 = {{2'd0}, addrT_0[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4410 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_7[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_9 = {{1'd0}, _GEN_4410}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_11 = {{6'd0}, addrT_0[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4412 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_0_1 = _addrTBankSelKernelPrePre_sum_T_9[3:0] + _GEN_4412; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_14 = {{1'd0}, addrT_0[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4414 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_14[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_16 = {{1'd0}, _GEN_4414}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_18 = {{5'd0}, addrT_0[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4416 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_18[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_0_2 = _addrTBankSelKernelPrePre_sum_T_16[3:0] + _GEN_4416; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4417 = {{3'd0}, addrT_0[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_23 = {{1'd0}, _GEN_4417}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_25 = {{4'd0}, addrT_0[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4419 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_25[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_0_3 = _addrTBankSelKernelPrePre_sum_T_23[3:0] + _GEN_4419; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_28 = {{3'd0}, addrT_1[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4421 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_28[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_30 = {{1'd0}, _GEN_4421}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_32 = {{7'd0}, addrT_1[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4423 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_32[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_1_0 = _addrTBankSelKernelPrePre_sum_T_30[3:0] + _GEN_4423; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_35 = {{2'd0}, addrT_1[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4425 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_35[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_37 = {{1'd0}, _GEN_4425}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_39 = {{6'd0}, addrT_1[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4427 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_39[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_1_1 = _addrTBankSelKernelPrePre_sum_T_37[3:0] + _GEN_4427; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_42 = {{1'd0}, addrT_1[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4429 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_42[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_44 = {{1'd0}, _GEN_4429}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_46 = {{5'd0}, addrT_1[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4431 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_46[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_1_2 = _addrTBankSelKernelPrePre_sum_T_44[3:0] + _GEN_4431; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4432 = {{3'd0}, addrT_1[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_51 = {{1'd0}, _GEN_4432}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_53 = {{4'd0}, addrT_1[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4434 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_53[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_1_3 = _addrTBankSelKernelPrePre_sum_T_51[3:0] + _GEN_4434; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_56 = {{3'd0}, addrT_2[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4436 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_56[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_58 = {{1'd0}, _GEN_4436}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_60 = {{7'd0}, addrT_2[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4438 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_60[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_2_0 = _addrTBankSelKernelPrePre_sum_T_58[3:0] + _GEN_4438; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_63 = {{2'd0}, addrT_2[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4440 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_63[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_65 = {{1'd0}, _GEN_4440}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_67 = {{6'd0}, addrT_2[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4442 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_67[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_2_1 = _addrTBankSelKernelPrePre_sum_T_65[3:0] + _GEN_4442; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_70 = {{1'd0}, addrT_2[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4444 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_70[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_72 = {{1'd0}, _GEN_4444}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_74 = {{5'd0}, addrT_2[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4446 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_74[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_2_2 = _addrTBankSelKernelPrePre_sum_T_72[3:0] + _GEN_4446; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4447 = {{3'd0}, addrT_2[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_79 = {{1'd0}, _GEN_4447}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_81 = {{4'd0}, addrT_2[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4449 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_81[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_2_3 = _addrTBankSelKernelPrePre_sum_T_79[3:0] + _GEN_4449; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_84 = {{3'd0}, addrT_3[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4451 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_84[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_86 = {{1'd0}, _GEN_4451}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_88 = {{7'd0}, addrT_3[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4453 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_88[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_3_0 = _addrTBankSelKernelPrePre_sum_T_86[3:0] + _GEN_4453; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_91 = {{2'd0}, addrT_3[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4455 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_91[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_93 = {{1'd0}, _GEN_4455}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_95 = {{6'd0}, addrT_3[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4457 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_95[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_3_1 = _addrTBankSelKernelPrePre_sum_T_93[3:0] + _GEN_4457; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_98 = {{1'd0}, addrT_3[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4459 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_98[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_100 = {{1'd0}, _GEN_4459}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_102 = {{5'd0}, addrT_3[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4461 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_102[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_3_2 = _addrTBankSelKernelPrePre_sum_T_100[3:0] + _GEN_4461; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4462 = {{3'd0}, addrT_3[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_107 = {{1'd0}, _GEN_4462}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_109 = {{4'd0}, addrT_3[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4464 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_109[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_3_3 = _addrTBankSelKernelPrePre_sum_T_107[3:0] + _GEN_4464; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_112 = {{3'd0}, addrT_4[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4466 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_112[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_114 = {{1'd0}, _GEN_4466}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_116 = {{7'd0}, addrT_4[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4468 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_116[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_4_0 = _addrTBankSelKernelPrePre_sum_T_114[3:0] + _GEN_4468; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_119 = {{2'd0}, addrT_4[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4470 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_119[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_121 = {{1'd0}, _GEN_4470}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_123 = {{6'd0}, addrT_4[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4472 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_123[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_4_1 = _addrTBankSelKernelPrePre_sum_T_121[3:0] + _GEN_4472; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_126 = {{1'd0}, addrT_4[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4474 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_126[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_128 = {{1'd0}, _GEN_4474}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_130 = {{5'd0}, addrT_4[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4476 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_130[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_4_2 = _addrTBankSelKernelPrePre_sum_T_128[3:0] + _GEN_4476; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4477 = {{3'd0}, addrT_4[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_135 = {{1'd0}, _GEN_4477}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_137 = {{4'd0}, addrT_4[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4479 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_137[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_4_3 = _addrTBankSelKernelPrePre_sum_T_135[3:0] + _GEN_4479; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_140 = {{3'd0}, addrT_5[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4481 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_140[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_142 = {{1'd0}, _GEN_4481}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_144 = {{7'd0}, addrT_5[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4483 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_144[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_5_0 = _addrTBankSelKernelPrePre_sum_T_142[3:0] + _GEN_4483; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_147 = {{2'd0}, addrT_5[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4485 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_147[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_149 = {{1'd0}, _GEN_4485}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_151 = {{6'd0}, addrT_5[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4487 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_151[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_5_1 = _addrTBankSelKernelPrePre_sum_T_149[3:0] + _GEN_4487; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_154 = {{1'd0}, addrT_5[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4489 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_154[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_156 = {{1'd0}, _GEN_4489}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_158 = {{5'd0}, addrT_5[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4491 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_158[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_5_2 = _addrTBankSelKernelPrePre_sum_T_156[3:0] + _GEN_4491; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4492 = {{3'd0}, addrT_5[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_163 = {{1'd0}, _GEN_4492}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_165 = {{4'd0}, addrT_5[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4494 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_165[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_5_3 = _addrTBankSelKernelPrePre_sum_T_163[3:0] + _GEN_4494; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_168 = {{3'd0}, addrT_6[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4496 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_168[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_170 = {{1'd0}, _GEN_4496}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_172 = {{7'd0}, addrT_6[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4498 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_172[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_6_0 = _addrTBankSelKernelPrePre_sum_T_170[3:0] + _GEN_4498; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_175 = {{2'd0}, addrT_6[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4500 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_175[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_177 = {{1'd0}, _GEN_4500}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_179 = {{6'd0}, addrT_6[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4502 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_179[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_6_1 = _addrTBankSelKernelPrePre_sum_T_177[3:0] + _GEN_4502; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_182 = {{1'd0}, addrT_6[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4504 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_182[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_184 = {{1'd0}, _GEN_4504}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_186 = {{5'd0}, addrT_6[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4506 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_186[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_6_2 = _addrTBankSelKernelPrePre_sum_T_184[3:0] + _GEN_4506; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4507 = {{3'd0}, addrT_6[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_191 = {{1'd0}, _GEN_4507}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_193 = {{4'd0}, addrT_6[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4509 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_193[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_6_3 = _addrTBankSelKernelPrePre_sum_T_191[3:0] + _GEN_4509; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_196 = {{3'd0}, addrT_7[7:3]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4511 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_196[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_198 = {{1'd0}, _GEN_4511}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_200 = {{7'd0}, addrT_7[7]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4513 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_200[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_7_0 = _addrTBankSelKernelPrePre_sum_T_198[3:0] + _GEN_4513; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_203 = {{2'd0}, addrT_7[7:2]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4515 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_203[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_205 = {{1'd0}, _GEN_4515}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_207 = {{6'd0}, addrT_7[7:6]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4517 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_207[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_7_1 = _addrTBankSelKernelPrePre_sum_T_205[3:0] + _GEN_4517; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_210 = {{1'd0}, addrT_7[7:1]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4519 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_210[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_212 = {{1'd0}, _GEN_4519}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_214 = {{5'd0}, addrT_7[7:5]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4521 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_214[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_7_2 = _addrTBankSelKernelPrePre_sum_T_212[3:0] + _GEN_4521; // @[FFTEngine.scala 349:107]
  wire [3:0] _GEN_4522 = {{3'd0}, addrT_7[0]}; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPrePre_sum_T_219 = {{1'd0}, _GEN_4522}; // @[FFTEngine.scala 349:107]
  wire [7:0] _addrTBankSelKernelPrePre_sum_T_221 = {{4'd0}, addrT_7[7:4]}; // @[FFTEngine.scala 349:115]
  wire [3:0] _GEN_4524 = {{3'd0}, _addrTBankSelKernelPrePre_sum_T_221[0]}; // @[FFTEngine.scala 349:107]
  wire [3:0] addrTBankSelKernelPrePre_7_3 = _addrTBankSelKernelPrePre_sum_T_219[3:0] + _GEN_4524; // @[FFTEngine.scala 349:107]
  wire [4:0] _addrTBankSelKernelPre_T_1 = {{1'd0}, addrTBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_3 = {_addrTBankSelKernelPre_T_1[3:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_4525 = {{1'd0}, addrTBankSelKernelPrePre_0_1}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_5 = _addrTBankSelKernelPre_T_3 + _GEN_4525; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_6 = {_addrTBankSelKernelPre_T_5, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [5:0] _GEN_4526 = {{2'd0}, addrTBankSelKernelPrePre_0_2}; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_8 = _addrTBankSelKernelPre_T_6 + _GEN_4526; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_9 = {_addrTBankSelKernelPre_T_8, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [6:0] _GEN_4527 = {{3'd0}, addrTBankSelKernelPrePre_0_3}; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_11 = _addrTBankSelKernelPre_T_9 + _GEN_4527; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_13 = {{1'd0}, addrTBankSelKernelPrePre_1_0}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_15 = {_addrTBankSelKernelPre_T_13[3:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_4528 = {{1'd0}, addrTBankSelKernelPrePre_1_1}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_17 = _addrTBankSelKernelPre_T_15 + _GEN_4528; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_18 = {_addrTBankSelKernelPre_T_17, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [5:0] _GEN_4529 = {{2'd0}, addrTBankSelKernelPrePre_1_2}; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_20 = _addrTBankSelKernelPre_T_18 + _GEN_4529; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_21 = {_addrTBankSelKernelPre_T_20, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [6:0] _GEN_4530 = {{3'd0}, addrTBankSelKernelPrePre_1_3}; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_23 = _addrTBankSelKernelPre_T_21 + _GEN_4530; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_25 = {{1'd0}, addrTBankSelKernelPrePre_2_0}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_27 = {_addrTBankSelKernelPre_T_25[3:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_4531 = {{1'd0}, addrTBankSelKernelPrePre_2_1}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_29 = _addrTBankSelKernelPre_T_27 + _GEN_4531; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_30 = {_addrTBankSelKernelPre_T_29, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [5:0] _GEN_4532 = {{2'd0}, addrTBankSelKernelPrePre_2_2}; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_32 = _addrTBankSelKernelPre_T_30 + _GEN_4532; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_33 = {_addrTBankSelKernelPre_T_32, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [6:0] _GEN_4533 = {{3'd0}, addrTBankSelKernelPrePre_2_3}; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_35 = _addrTBankSelKernelPre_T_33 + _GEN_4533; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_37 = {{1'd0}, addrTBankSelKernelPrePre_3_0}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_39 = {_addrTBankSelKernelPre_T_37[3:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_4534 = {{1'd0}, addrTBankSelKernelPrePre_3_1}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_41 = _addrTBankSelKernelPre_T_39 + _GEN_4534; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_42 = {_addrTBankSelKernelPre_T_41, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [5:0] _GEN_4535 = {{2'd0}, addrTBankSelKernelPrePre_3_2}; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_44 = _addrTBankSelKernelPre_T_42 + _GEN_4535; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_45 = {_addrTBankSelKernelPre_T_44, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [6:0] _GEN_4536 = {{3'd0}, addrTBankSelKernelPrePre_3_3}; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_47 = _addrTBankSelKernelPre_T_45 + _GEN_4536; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_49 = {{1'd0}, addrTBankSelKernelPrePre_4_0}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_51 = {_addrTBankSelKernelPre_T_49[3:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_4537 = {{1'd0}, addrTBankSelKernelPrePre_4_1}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_53 = _addrTBankSelKernelPre_T_51 + _GEN_4537; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_54 = {_addrTBankSelKernelPre_T_53, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [5:0] _GEN_4538 = {{2'd0}, addrTBankSelKernelPrePre_4_2}; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_56 = _addrTBankSelKernelPre_T_54 + _GEN_4538; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_57 = {_addrTBankSelKernelPre_T_56, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [6:0] _GEN_4539 = {{3'd0}, addrTBankSelKernelPrePre_4_3}; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_59 = _addrTBankSelKernelPre_T_57 + _GEN_4539; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_61 = {{1'd0}, addrTBankSelKernelPrePre_5_0}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_63 = {_addrTBankSelKernelPre_T_61[3:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_4540 = {{1'd0}, addrTBankSelKernelPrePre_5_1}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_65 = _addrTBankSelKernelPre_T_63 + _GEN_4540; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_66 = {_addrTBankSelKernelPre_T_65, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [5:0] _GEN_4541 = {{2'd0}, addrTBankSelKernelPrePre_5_2}; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_68 = _addrTBankSelKernelPre_T_66 + _GEN_4541; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_69 = {_addrTBankSelKernelPre_T_68, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [6:0] _GEN_4542 = {{3'd0}, addrTBankSelKernelPrePre_5_3}; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_71 = _addrTBankSelKernelPre_T_69 + _GEN_4542; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_73 = {{1'd0}, addrTBankSelKernelPrePre_6_0}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_75 = {_addrTBankSelKernelPre_T_73[3:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_4543 = {{1'd0}, addrTBankSelKernelPrePre_6_1}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_77 = _addrTBankSelKernelPre_T_75 + _GEN_4543; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_78 = {_addrTBankSelKernelPre_T_77, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [5:0] _GEN_4544 = {{2'd0}, addrTBankSelKernelPrePre_6_2}; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_80 = _addrTBankSelKernelPre_T_78 + _GEN_4544; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_81 = {_addrTBankSelKernelPre_T_80, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [6:0] _GEN_4545 = {{3'd0}, addrTBankSelKernelPrePre_6_3}; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_83 = _addrTBankSelKernelPre_T_81 + _GEN_4545; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_85 = {{1'd0}, addrTBankSelKernelPrePre_7_0}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_87 = {_addrTBankSelKernelPre_T_85[3:0], 1'h0}; // @[FFTEngine.scala 361:138]
  wire [4:0] _GEN_4546 = {{1'd0}, addrTBankSelKernelPrePre_7_1}; // @[FFTEngine.scala 361:144]
  wire [4:0] _addrTBankSelKernelPre_T_89 = _addrTBankSelKernelPre_T_87 + _GEN_4546; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_90 = {_addrTBankSelKernelPre_T_89, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [5:0] _GEN_4547 = {{2'd0}, addrTBankSelKernelPrePre_7_2}; // @[FFTEngine.scala 361:144]
  wire [5:0] _addrTBankSelKernelPre_T_92 = _addrTBankSelKernelPre_T_90 + _GEN_4547; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_93 = {_addrTBankSelKernelPre_T_92, 1'h0}; // @[FFTEngine.scala 361:138]
  wire [6:0] _GEN_4548 = {{3'd0}, addrTBankSelKernelPrePre_7_3}; // @[FFTEngine.scala 361:144]
  wire [6:0] _addrTBankSelKernelPre_T_95 = _addrTBankSelKernelPre_T_93 + _GEN_4548; // @[FFTEngine.scala 361:144]
  wire [3:0] addrTBankSelKernelPre_0 = _addrTBankSelKernelPre_T_11[3:0]; // @[FFTEngine.scala 361:160]
  wire [3:0] addrTBankSelKernelPre_1 = _addrTBankSelKernelPre_T_23[3:0]; // @[FFTEngine.scala 361:160]
  wire [3:0] addrTBankSelKernelPre_2 = _addrTBankSelKernelPre_T_35[3:0]; // @[FFTEngine.scala 361:160]
  wire [3:0] addrTBankSelKernelPre_3 = _addrTBankSelKernelPre_T_47[3:0]; // @[FFTEngine.scala 361:160]
  wire [3:0] addrTBankSelKernelPre_4 = _addrTBankSelKernelPre_T_59[3:0]; // @[FFTEngine.scala 361:160]
  wire [3:0] addrTBankSelKernelPre_5 = _addrTBankSelKernelPre_T_71[3:0]; // @[FFTEngine.scala 361:160]
  wire [3:0] addrTBankSelKernelPre_6 = _addrTBankSelKernelPre_T_83[3:0]; // @[FFTEngine.scala 361:160]
  wire [3:0] addrTBankSelKernelPre_7 = _addrTBankSelKernelPre_T_95[3:0]; // @[FFTEngine.scala 361:160]
  wire [3:0] addrSBankSelKernel_0 = _radixInit_T_1 ? addrSBankSelKernelPre_0 : 4'h0; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [3:0] addrTBankSelKernel_0 = _radixInit_T_1 ? addrTBankSelKernelPre_0 : 4'h1; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [3:0] addrSBankSelKernel_1 = _radixInit_T_1 ? addrSBankSelKernelPre_1 : 4'h2; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [3:0] addrTBankSelKernel_1 = _radixInit_T_1 ? addrTBankSelKernelPre_1 : 4'h3; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [3:0] addrSBankSelKernel_2 = _radixInit_T_1 ? addrSBankSelKernelPre_2 : 4'h4; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [3:0] addrTBankSelKernel_2 = _radixInit_T_1 ? addrTBankSelKernelPre_2 : 4'h5; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [3:0] addrSBankSelKernel_3 = _radixInit_T_1 ? addrSBankSelKernelPre_3 : 4'h6; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [3:0] addrTBankSelKernel_3 = _radixInit_T_1 ? addrTBankSelKernelPre_3 : 4'h7; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [3:0] addrSBankSelKernel_4 = _radixInit_T_1 ? addrSBankSelKernelPre_4 : 4'h8; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [3:0] addrTBankSelKernel_4 = _radixInit_T_1 ? addrTBankSelKernelPre_4 : 4'h9; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [3:0] addrSBankSelKernel_5 = _radixInit_T_1 ? addrSBankSelKernelPre_5 : 4'ha; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [3:0] addrTBankSelKernel_5 = _radixInit_T_1 ? addrTBankSelKernelPre_5 : 4'hb; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [3:0] addrSBankSelKernel_6 = _radixInit_T_1 ? addrSBankSelKernelPre_6 : 4'hc; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [3:0] addrTBankSelKernel_6 = _radixInit_T_1 ? addrTBankSelKernelPre_6 : 4'hd; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire [3:0] addrSBankSelKernel_7 = _radixInit_T_1 ? addrSBankSelKernelPre_7 : 4'he; // @[FFTEngine.scala 366:27 367:35 370:35]
  wire [3:0] addrTBankSelKernel_7 = _radixInit_T_1 ? addrTBankSelKernelPre_7 : 4'hf; // @[FFTEngine.scala 366:27 368:35 371:35]
  wire  addrSBankSelProcPre__0 = addrS_0[0] ^ addrS_0[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__0 = addrT_0[0] ^ addrT_0[7]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre__1 = addrS_0[1] ^ addrS_0[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__1 = addrT_0[1] ^ addrT_0[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre__2 = addrS_0[2] ^ addrS_0[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__2 = addrT_0[2] ^ addrT_0[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre__3 = addrS_0[3] ^ addrS_0[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre__3 = addrT_0[3] ^ addrT_0[4]; // @[FFTEngine.scala 383:55]
  wire [3:0] addrSBankSelProc_0 = {addrSBankSelProcPre__0,addrSBankSelProcPre__1,addrSBankSelProcPre__2,
    addrSBankSelProcPre__3}; // @[Cat.scala 33:92]
  wire [3:0] addrTBankSelProc_0 = {addrTBankSelProcPre__0,addrTBankSelProcPre__1,addrTBankSelProcPre__2,
    addrTBankSelProcPre__3}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_1_0 = addrS_1[0] ^ addrS_1[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_0 = addrT_1[0] ^ addrT_1[7]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_1_1 = addrS_1[1] ^ addrS_1[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_1 = addrT_1[1] ^ addrT_1[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_1_2 = addrS_1[2] ^ addrS_1[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_2 = addrT_1[2] ^ addrT_1[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_1_3 = addrS_1[3] ^ addrS_1[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_1_3 = addrT_1[3] ^ addrT_1[4]; // @[FFTEngine.scala 383:55]
  wire [3:0] addrSBankSelProc_1 = {addrSBankSelProcPre_1_0,addrSBankSelProcPre_1_1,addrSBankSelProcPre_1_2,
    addrSBankSelProcPre_1_3}; // @[Cat.scala 33:92]
  wire [3:0] addrTBankSelProc_1 = {addrTBankSelProcPre_1_0,addrTBankSelProcPre_1_1,addrTBankSelProcPre_1_2,
    addrTBankSelProcPre_1_3}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_2_0 = addrS_2[0] ^ addrS_2[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_0 = addrT_2[0] ^ addrT_2[7]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_2_1 = addrS_2[1] ^ addrS_2[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_1 = addrT_2[1] ^ addrT_2[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_2_2 = addrS_2[2] ^ addrS_2[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_2 = addrT_2[2] ^ addrT_2[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_2_3 = addrS_2[3] ^ addrS_2[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_2_3 = addrT_2[3] ^ addrT_2[4]; // @[FFTEngine.scala 383:55]
  wire [3:0] addrSBankSelProc_2 = {addrSBankSelProcPre_2_0,addrSBankSelProcPre_2_1,addrSBankSelProcPre_2_2,
    addrSBankSelProcPre_2_3}; // @[Cat.scala 33:92]
  wire [3:0] addrTBankSelProc_2 = {addrTBankSelProcPre_2_0,addrTBankSelProcPre_2_1,addrTBankSelProcPre_2_2,
    addrTBankSelProcPre_2_3}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_3_0 = addrS_3[0] ^ addrS_3[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_0 = addrT_3[0] ^ addrT_3[7]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_3_1 = addrS_3[1] ^ addrS_3[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_1 = addrT_3[1] ^ addrT_3[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_3_2 = addrS_3[2] ^ addrS_3[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_2 = addrT_3[2] ^ addrT_3[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_3_3 = addrS_3[3] ^ addrS_3[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_3_3 = addrT_3[3] ^ addrT_3[4]; // @[FFTEngine.scala 383:55]
  wire [3:0] addrSBankSelProc_3 = {addrSBankSelProcPre_3_0,addrSBankSelProcPre_3_1,addrSBankSelProcPre_3_2,
    addrSBankSelProcPre_3_3}; // @[Cat.scala 33:92]
  wire [3:0] addrTBankSelProc_3 = {addrTBankSelProcPre_3_0,addrTBankSelProcPre_3_1,addrTBankSelProcPre_3_2,
    addrTBankSelProcPre_3_3}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_4_0 = addrS_4[0] ^ addrS_4[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_4_0 = addrT_4[0] ^ addrT_4[7]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_4_1 = addrS_4[1] ^ addrS_4[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_4_1 = addrT_4[1] ^ addrT_4[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_4_2 = addrS_4[2] ^ addrS_4[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_4_2 = addrT_4[2] ^ addrT_4[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_4_3 = addrS_4[3] ^ addrS_4[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_4_3 = addrT_4[3] ^ addrT_4[4]; // @[FFTEngine.scala 383:55]
  wire [3:0] addrSBankSelProc_4 = {addrSBankSelProcPre_4_0,addrSBankSelProcPre_4_1,addrSBankSelProcPre_4_2,
    addrSBankSelProcPre_4_3}; // @[Cat.scala 33:92]
  wire [3:0] addrTBankSelProc_4 = {addrTBankSelProcPre_4_0,addrTBankSelProcPre_4_1,addrTBankSelProcPre_4_2,
    addrTBankSelProcPre_4_3}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_5_0 = addrS_5[0] ^ addrS_5[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_5_0 = addrT_5[0] ^ addrT_5[7]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_5_1 = addrS_5[1] ^ addrS_5[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_5_1 = addrT_5[1] ^ addrT_5[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_5_2 = addrS_5[2] ^ addrS_5[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_5_2 = addrT_5[2] ^ addrT_5[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_5_3 = addrS_5[3] ^ addrS_5[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_5_3 = addrT_5[3] ^ addrT_5[4]; // @[FFTEngine.scala 383:55]
  wire [3:0] addrSBankSelProc_5 = {addrSBankSelProcPre_5_0,addrSBankSelProcPre_5_1,addrSBankSelProcPre_5_2,
    addrSBankSelProcPre_5_3}; // @[Cat.scala 33:92]
  wire [3:0] addrTBankSelProc_5 = {addrTBankSelProcPre_5_0,addrTBankSelProcPre_5_1,addrTBankSelProcPre_5_2,
    addrTBankSelProcPre_5_3}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_6_0 = addrS_6[0] ^ addrS_6[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_6_0 = addrT_6[0] ^ addrT_6[7]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_6_1 = addrS_6[1] ^ addrS_6[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_6_1 = addrT_6[1] ^ addrT_6[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_6_2 = addrS_6[2] ^ addrS_6[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_6_2 = addrT_6[2] ^ addrT_6[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_6_3 = addrS_6[3] ^ addrS_6[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_6_3 = addrT_6[3] ^ addrT_6[4]; // @[FFTEngine.scala 383:55]
  wire [3:0] addrSBankSelProc_6 = {addrSBankSelProcPre_6_0,addrSBankSelProcPre_6_1,addrSBankSelProcPre_6_2,
    addrSBankSelProcPre_6_3}; // @[Cat.scala 33:92]
  wire [3:0] addrTBankSelProc_6 = {addrTBankSelProcPre_6_0,addrTBankSelProcPre_6_1,addrTBankSelProcPre_6_2,
    addrTBankSelProcPre_6_3}; // @[Cat.scala 33:92]
  wire  addrSBankSelProcPre_7_0 = addrS_7[0] ^ addrS_7[7]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_7_0 = addrT_7[0] ^ addrT_7[7]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_7_1 = addrS_7[1] ^ addrS_7[6]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_7_1 = addrT_7[1] ^ addrT_7[6]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_7_2 = addrS_7[2] ^ addrS_7[5]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_7_2 = addrT_7[2] ^ addrT_7[5]; // @[FFTEngine.scala 383:55]
  wire  addrSBankSelProcPre_7_3 = addrS_7[3] ^ addrS_7[4]; // @[FFTEngine.scala 382:55]
  wire  addrTBankSelProcPre_7_3 = addrT_7[3] ^ addrT_7[4]; // @[FFTEngine.scala 383:55]
  wire [3:0] addrSBankSelProc_7 = {addrSBankSelProcPre_7_0,addrSBankSelProcPre_7_1,addrSBankSelProcPre_7_2,
    addrSBankSelProcPre_7_3}; // @[Cat.scala 33:92]
  wire [3:0] addrTBankSelProc_7 = {addrTBankSelProcPre_7_0,addrTBankSelProcPre_7_1,addrTBankSelProcPre_7_2,
    addrTBankSelProcPre_7_3}; // @[Cat.scala 33:92]
  reg [3:0] addrSBankSelKernel1c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel2c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel3c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel1c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel2c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel3c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel1c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel2c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel3c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel1c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel2c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel3c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel1c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel2c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel3c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel1c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel2c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel3c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel1c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel2c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel3c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel1c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel2c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel3c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel1c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel2c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel3c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel1c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel2c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel3c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel1c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel2c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel3c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel1c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel2c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel3c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel1c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel2c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel3c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel1c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel2c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel3c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel1c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel2c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelKernel3c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel1c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel2c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelKernel3c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc1c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc2c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc3c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc1c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc2c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc3c_0_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc1c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc2c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc3c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc1c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc2c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc3c_1_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc1c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc2c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc3c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc1c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc2c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc3c_2_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc1c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc2c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc3c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc1c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc2c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc3c_3_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc1c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc2c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc3c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc1c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc2c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc3c_4_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc1c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc2c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc3c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc1c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc2c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc3c_5_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc1c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc2c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc3c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc1c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc2c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc3c_6_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc1c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc2c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrSBankSelProc3c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc1c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc2c_7_r; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSelProc3c_7_r; // @[Reg.scala 35:20]
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
  wire [15:0] _dataInPre_8_T_1 = io_readDataSram1Bank_8[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_8_T_3 = io_readDataSram1Bank_8[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_8_T_5 = io_readDataSram0Bank_8[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_8_T_7 = io_readDataSram0Bank_8[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_8_im = srcBuffer ? $signed(_dataInPre_8_T_3) : $signed(_dataInPre_8_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_8_re = srcBuffer ? $signed(_dataInPre_8_T_1) : $signed(_dataInPre_8_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_9_T_1 = io_readDataSram1Bank_9[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_9_T_3 = io_readDataSram1Bank_9[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_9_T_5 = io_readDataSram0Bank_9[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_9_T_7 = io_readDataSram0Bank_9[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_9_im = srcBuffer ? $signed(_dataInPre_9_T_3) : $signed(_dataInPre_9_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_9_re = srcBuffer ? $signed(_dataInPre_9_T_1) : $signed(_dataInPre_9_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_10_T_1 = io_readDataSram1Bank_10[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_10_T_3 = io_readDataSram1Bank_10[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_10_T_5 = io_readDataSram0Bank_10[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_10_T_7 = io_readDataSram0Bank_10[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_10_im = srcBuffer ? $signed(_dataInPre_10_T_3) : $signed(_dataInPre_10_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_10_re = srcBuffer ? $signed(_dataInPre_10_T_1) : $signed(_dataInPre_10_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_11_T_1 = io_readDataSram1Bank_11[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_11_T_3 = io_readDataSram1Bank_11[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_11_T_5 = io_readDataSram0Bank_11[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_11_T_7 = io_readDataSram0Bank_11[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_11_im = srcBuffer ? $signed(_dataInPre_11_T_3) : $signed(_dataInPre_11_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_11_re = srcBuffer ? $signed(_dataInPre_11_T_1) : $signed(_dataInPre_11_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_12_T_1 = io_readDataSram1Bank_12[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_12_T_3 = io_readDataSram1Bank_12[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_12_T_5 = io_readDataSram0Bank_12[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_12_T_7 = io_readDataSram0Bank_12[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_12_im = srcBuffer ? $signed(_dataInPre_12_T_3) : $signed(_dataInPre_12_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_12_re = srcBuffer ? $signed(_dataInPre_12_T_1) : $signed(_dataInPre_12_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_13_T_1 = io_readDataSram1Bank_13[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_13_T_3 = io_readDataSram1Bank_13[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_13_T_5 = io_readDataSram0Bank_13[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_13_T_7 = io_readDataSram0Bank_13[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_13_im = srcBuffer ? $signed(_dataInPre_13_T_3) : $signed(_dataInPre_13_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_13_re = srcBuffer ? $signed(_dataInPre_13_T_1) : $signed(_dataInPre_13_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_14_T_1 = io_readDataSram1Bank_14[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_14_T_3 = io_readDataSram1Bank_14[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_14_T_5 = io_readDataSram0Bank_14[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_14_T_7 = io_readDataSram0Bank_14[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_14_im = srcBuffer ? $signed(_dataInPre_14_T_3) : $signed(_dataInPre_14_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_14_re = srcBuffer ? $signed(_dataInPre_14_T_1) : $signed(_dataInPre_14_T_5); // @[FFTEngine.scala 447:28]
  wire [15:0] _dataInPre_15_T_1 = io_readDataSram1Bank_15[15:0]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_15_T_3 = io_readDataSram1Bank_15[31:16]; // @[FFTEngine.scala 447:72]
  wire [15:0] _dataInPre_15_T_5 = io_readDataSram0Bank_15[15:0]; // @[FFTEngine.scala 447:121]
  wire [15:0] _dataInPre_15_T_7 = io_readDataSram0Bank_15[31:16]; // @[FFTEngine.scala 447:121]
  wire [15:0] dataInPre_15_im = srcBuffer ? $signed(_dataInPre_15_T_3) : $signed(_dataInPre_15_T_7); // @[FFTEngine.scala 447:28]
  wire [15:0] dataInPre_15_re = srcBuffer ? $signed(_dataInPre_15_T_1) : $signed(_dataInPre_15_T_5); // @[FFTEngine.scala 447:28]
  reg [3:0] addrS1c; // @[Reg.scala 35:20]
  reg [3:0] addrS2c; // @[Reg.scala 35:20]
  reg [3:0] addrS3c; // @[Reg.scala 35:20]
  reg [3:0] addrT1c; // @[Reg.scala 35:20]
  reg [3:0] addrT2c; // @[Reg.scala 35:20]
  reg [3:0] addrT3c; // @[Reg.scala 35:20]
  wire [3:0] _addrSBankSel_T_1 = _radixInit_T_11 ? addrSBankSelProc_0 : addrSBankSelKernel_0; // @[FFTEngine.scala 471:32]
  wire  _addrSBankSel_T_2 = phaseCount == 3'h0; // @[FFTEngine.scala 474:72]
  wire  _addrSBankSel_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0; // @[FFTEngine.scala 474:43]
  wire [3:0] _addrSBankSel_T_5 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_0 :
    addrSBankSelKernel_0; // @[FFTEngine.scala 474:32]
  wire [3:0] addrSBankSel = io_fftMode ? _addrSBankSel_T_1 : _addrSBankSel_T_5; // @[FFTEngine.scala 470:21 471:26 474:26]
  reg [3:0] addrSBankSel1c; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSel1c; // @[Reg.scala 35:20]
  wire [15:0] _GEN_224 = 4'h1 == addrSBankSel1c ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_225 = 4'h2 == addrSBankSel1c ? $signed(dataInPre_2_re) : $signed(_GEN_224); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_226 = 4'h3 == addrSBankSel1c ? $signed(dataInPre_3_re) : $signed(_GEN_225); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_227 = 4'h4 == addrSBankSel1c ? $signed(dataInPre_4_re) : $signed(_GEN_226); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_228 = 4'h5 == addrSBankSel1c ? $signed(dataInPre_5_re) : $signed(_GEN_227); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_229 = 4'h6 == addrSBankSel1c ? $signed(dataInPre_6_re) : $signed(_GEN_228); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_230 = 4'h7 == addrSBankSel1c ? $signed(dataInPre_7_re) : $signed(_GEN_229); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_231 = 4'h8 == addrSBankSel1c ? $signed(dataInPre_8_re) : $signed(_GEN_230); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_232 = 4'h9 == addrSBankSel1c ? $signed(dataInPre_9_re) : $signed(_GEN_231); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_233 = 4'ha == addrSBankSel1c ? $signed(dataInPre_10_re) : $signed(_GEN_232); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_234 = 4'hb == addrSBankSel1c ? $signed(dataInPre_11_re) : $signed(_GEN_233); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_235 = 4'hc == addrSBankSel1c ? $signed(dataInPre_12_re) : $signed(_GEN_234); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_236 = 4'hd == addrSBankSel1c ? $signed(dataInPre_13_re) : $signed(_GEN_235); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_237 = 4'he == addrSBankSel1c ? $signed(dataInPre_14_re) : $signed(_GEN_236); // @[FFTEngine.scala 482:{29,29}]
  wire  _fftCalc_io_dataInSI_T_1 = sameAddr1c & _T_12; // @[FFTEngine.scala 483:47]
  wire [15:0] _GEN_240 = 4'h1 == addrSBankSel1c ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_241 = 4'h2 == addrSBankSel1c ? $signed(dataInPre_2_im) : $signed(_GEN_240); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_242 = 4'h3 == addrSBankSel1c ? $signed(dataInPre_3_im) : $signed(_GEN_241); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_243 = 4'h4 == addrSBankSel1c ? $signed(dataInPre_4_im) : $signed(_GEN_242); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_244 = 4'h5 == addrSBankSel1c ? $signed(dataInPre_5_im) : $signed(_GEN_243); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_245 = 4'h6 == addrSBankSel1c ? $signed(dataInPre_6_im) : $signed(_GEN_244); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_246 = 4'h7 == addrSBankSel1c ? $signed(dataInPre_7_im) : $signed(_GEN_245); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_247 = 4'h8 == addrSBankSel1c ? $signed(dataInPre_8_im) : $signed(_GEN_246); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_248 = 4'h9 == addrSBankSel1c ? $signed(dataInPre_9_im) : $signed(_GEN_247); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_249 = 4'ha == addrSBankSel1c ? $signed(dataInPre_10_im) : $signed(_GEN_248); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_250 = 4'hb == addrSBankSel1c ? $signed(dataInPre_11_im) : $signed(_GEN_249); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_251 = 4'hc == addrSBankSel1c ? $signed(dataInPre_12_im) : $signed(_GEN_250); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_252 = 4'hd == addrSBankSel1c ? $signed(dataInPre_13_im) : $signed(_GEN_251); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_253 = 4'he == addrSBankSel1c ? $signed(dataInPre_14_im) : $signed(_GEN_252); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_254 = 4'hf == addrSBankSel1c ? $signed(dataInPre_15_im) : $signed(_GEN_253); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_256 = 4'h1 == addrTBankSel1c ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_257 = 4'h2 == addrTBankSel1c ? $signed(dataInPre_2_im) : $signed(_GEN_256); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_258 = 4'h3 == addrTBankSel1c ? $signed(dataInPre_3_im) : $signed(_GEN_257); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_259 = 4'h4 == addrTBankSel1c ? $signed(dataInPre_4_im) : $signed(_GEN_258); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_260 = 4'h5 == addrTBankSel1c ? $signed(dataInPre_5_im) : $signed(_GEN_259); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_261 = 4'h6 == addrTBankSel1c ? $signed(dataInPre_6_im) : $signed(_GEN_260); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_262 = 4'h7 == addrTBankSel1c ? $signed(dataInPre_7_im) : $signed(_GEN_261); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_263 = 4'h8 == addrTBankSel1c ? $signed(dataInPre_8_im) : $signed(_GEN_262); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_264 = 4'h9 == addrTBankSel1c ? $signed(dataInPre_9_im) : $signed(_GEN_263); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_265 = 4'ha == addrTBankSel1c ? $signed(dataInPre_10_im) : $signed(_GEN_264); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_266 = 4'hb == addrTBankSel1c ? $signed(dataInPre_11_im) : $signed(_GEN_265); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_267 = 4'hc == addrTBankSel1c ? $signed(dataInPre_12_im) : $signed(_GEN_266); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_268 = 4'hd == addrTBankSel1c ? $signed(dataInPre_13_im) : $signed(_GEN_267); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_269 = 4'he == addrTBankSel1c ? $signed(dataInPre_14_im) : $signed(_GEN_268); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_270 = 4'hf == addrTBankSel1c ? $signed(dataInPre_15_im) : $signed(_GEN_269); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_272 = 4'h1 == addrTBankSel1c ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_273 = 4'h2 == addrTBankSel1c ? $signed(dataInPre_2_re) : $signed(_GEN_272); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_274 = 4'h3 == addrTBankSel1c ? $signed(dataInPre_3_re) : $signed(_GEN_273); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_275 = 4'h4 == addrTBankSel1c ? $signed(dataInPre_4_re) : $signed(_GEN_274); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_276 = 4'h5 == addrTBankSel1c ? $signed(dataInPre_5_re) : $signed(_GEN_275); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_277 = 4'h6 == addrTBankSel1c ? $signed(dataInPre_6_re) : $signed(_GEN_276); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_278 = 4'h7 == addrTBankSel1c ? $signed(dataInPre_7_re) : $signed(_GEN_277); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_279 = 4'h8 == addrTBankSel1c ? $signed(dataInPre_8_re) : $signed(_GEN_278); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_280 = 4'h9 == addrTBankSel1c ? $signed(dataInPre_9_re) : $signed(_GEN_279); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_281 = 4'ha == addrTBankSel1c ? $signed(dataInPre_10_re) : $signed(_GEN_280); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_282 = 4'hb == addrTBankSel1c ? $signed(dataInPre_11_re) : $signed(_GEN_281); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_283 = 4'hc == addrTBankSel1c ? $signed(dataInPre_12_re) : $signed(_GEN_282); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_284 = 4'hd == addrTBankSel1c ? $signed(dataInPre_13_re) : $signed(_GEN_283); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_285 = 4'he == addrTBankSel1c ? $signed(dataInPre_14_re) : $signed(_GEN_284); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_286 = 4'hf == addrTBankSel1c ? $signed(dataInPre_15_re) : $signed(_GEN_285); // @[FFTEngine.scala 484:{35,35}]
  wire [7:0] _fftCalc_io_nk_T_2 = {nk_0[6:0],1'h0}; // @[Cat.scala 33:92]
  wire  _GEN_304 = 3'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_305 = 3'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_304; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_306 = 3'h3 == phaseCount ? io_fftRShiftP0_3 : _GEN_305; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_307 = 3'h4 == phaseCount ? io_fftRShiftP0_4 : _GEN_306; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_308 = 3'h5 == phaseCount ? io_fftRShiftP0_5 : _GEN_307; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_309 = 3'h6 == phaseCount ? io_fftRShiftP0_6 : _GEN_308; // @[FFTEngine.scala 491:{36,36}]
  wire  _GEN_310 = 3'h7 == phaseCount ? io_fftRShiftP0_7 : _GEN_309; // @[FFTEngine.scala 491:{36,36}]
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
  wire [3:0] _addrSBankSel3c_T_3 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_0_r :
    addrSBankSelKernel3c_0_r; // @[FFTEngine.scala 505:34]
  wire [3:0] _addrTBankSel3c_T_3 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_0_r : addrTBankSelKernel3c_0_r; // @[FFTEngine.scala 506:34]
  wire [3:0] _addrSBankSel3c_T_4 = procState3c ? addrSBankSelProc3c_0_r : addrSBankSelKernel3c_0_r; // @[FFTEngine.scala 508:34]
  wire [3:0] _addrTBankSel3c_T_4 = procState3c ? addrTBankSelProc3c_0_r : addrTBankSelKernel3c_0_r; // @[FFTEngine.scala 509:34]
  wire [3:0] addrSBankSel3c = io_fftMode ? _addrSBankSel3c_T_3 : _addrSBankSel3c_T_4; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [3:0] addrTBankSel3c = io_fftMode ? _addrTBankSel3c_T_3 : _addrTBankSel3c_T_4; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire  _GEN_313 = (4'h0 == addrSBankSelProc3c_0_r | 4'h0 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_314 = (4'h0 == addrSBankSelProc3c_0_r | 4'h0 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_317 = (4'h1 == addrSBankSelProc3c_0_r | 4'h1 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_318 = (4'h1 == addrSBankSelProc3c_0_r | 4'h1 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_321 = (4'h2 == addrSBankSelProc3c_0_r | 4'h2 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_322 = (4'h2 == addrSBankSelProc3c_0_r | 4'h2 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_325 = (4'h3 == addrSBankSelProc3c_0_r | 4'h3 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_326 = (4'h3 == addrSBankSelProc3c_0_r | 4'h3 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_329 = (4'h4 == addrSBankSelProc3c_0_r | 4'h4 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_330 = (4'h4 == addrSBankSelProc3c_0_r | 4'h4 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_333 = (4'h5 == addrSBankSelProc3c_0_r | 4'h5 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_334 = (4'h5 == addrSBankSelProc3c_0_r | 4'h5 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_337 = (4'h6 == addrSBankSelProc3c_0_r | 4'h6 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_338 = (4'h6 == addrSBankSelProc3c_0_r | 4'h6 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_341 = (4'h7 == addrSBankSelProc3c_0_r | 4'h7 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_342 = (4'h7 == addrSBankSelProc3c_0_r | 4'h7 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_345 = (4'h8 == addrSBankSelProc3c_0_r | 4'h8 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_346 = (4'h8 == addrSBankSelProc3c_0_r | 4'h8 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_349 = (4'h9 == addrSBankSelProc3c_0_r | 4'h9 == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_350 = (4'h9 == addrSBankSelProc3c_0_r | 4'h9 == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_353 = (4'ha == addrSBankSelProc3c_0_r | 4'ha == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_354 = (4'ha == addrSBankSelProc3c_0_r | 4'ha == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_357 = (4'hb == addrSBankSelProc3c_0_r | 4'hb == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_358 = (4'hb == addrSBankSelProc3c_0_r | 4'hb == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_361 = (4'hc == addrSBankSelProc3c_0_r | 4'hc == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_362 = (4'hc == addrSBankSelProc3c_0_r | 4'hc == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_365 = (4'hd == addrSBankSelProc3c_0_r | 4'hd == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_366 = (4'hd == addrSBankSelProc3c_0_r | 4'hd == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_369 = (4'he == addrSBankSelProc3c_0_r | 4'he == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_370 = (4'he == addrSBankSelProc3c_0_r | 4'he == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire  _GEN_373 = (4'hf == addrSBankSelProc3c_0_r | 4'hf == addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 515:94 516:52 519:52]
  wire  _GEN_374 = (4'hf == addrSBankSelProc3c_0_r | 4'hf == addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c
    ); // @[FFTEngine.scala 515:94 517:52 520:52]
  wire [3:0] _GEN_393 = 4'h0 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_394 = 4'h1 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_395 = 4'h2 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_396 = 4'h3 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_397 = 4'h4 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_398 = 4'h5 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_399 = 4'h6 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_400 = 4'h7 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_401 = 4'h8 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_402 = 4'h9 == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_403 = 4'ha == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_404 = 4'hb == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_405 = 4'hc == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_406 = 4'hd == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_407 = 4'he == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_408 = 4'hf == addrSBankSel ? addrS_0[3:0] : addrT_0[3:0]; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_569 = ~_radixInit_T_11 ? _GEN_393 : _GEN_393; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_570 = ~_radixInit_T_11 ? _GEN_394 : _GEN_394; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_571 = ~_radixInit_T_11 ? _GEN_395 : _GEN_395; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_572 = ~_radixInit_T_11 ? _GEN_396 : _GEN_396; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_573 = ~_radixInit_T_11 ? _GEN_397 : _GEN_397; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_574 = ~_radixInit_T_11 ? _GEN_398 : _GEN_398; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_575 = ~_radixInit_T_11 ? _GEN_399 : _GEN_399; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_576 = ~_radixInit_T_11 ? _GEN_400 : _GEN_400; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_577 = ~_radixInit_T_11 ? _GEN_401 : _GEN_401; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_578 = ~_radixInit_T_11 ? _GEN_402 : _GEN_402; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_579 = ~_radixInit_T_11 ? _GEN_403 : _GEN_403; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_580 = ~_radixInit_T_11 ? _GEN_404 : _GEN_404; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_581 = ~_radixInit_T_11 ? _GEN_405 : _GEN_405; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_582 = ~_radixInit_T_11 ? _GEN_406 : _GEN_406; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_583 = ~_radixInit_T_11 ? _GEN_407 : _GEN_407; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_584 = ~_radixInit_T_11 ? _GEN_408 : _GEN_408; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_601 = 4'h0 == addrTBankSel3c ? addrT3c : _GEN_569; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_602 = 4'h1 == addrTBankSel3c ? addrT3c : _GEN_570; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_603 = 4'h2 == addrTBankSel3c ? addrT3c : _GEN_571; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_604 = 4'h3 == addrTBankSel3c ? addrT3c : _GEN_572; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_605 = 4'h4 == addrTBankSel3c ? addrT3c : _GEN_573; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_606 = 4'h5 == addrTBankSel3c ? addrT3c : _GEN_574; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_607 = 4'h6 == addrTBankSel3c ? addrT3c : _GEN_575; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_608 = 4'h7 == addrTBankSel3c ? addrT3c : _GEN_576; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_609 = 4'h8 == addrTBankSel3c ? addrT3c : _GEN_577; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_610 = 4'h9 == addrTBankSel3c ? addrT3c : _GEN_578; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_611 = 4'ha == addrTBankSel3c ? addrT3c : _GEN_579; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_612 = 4'hb == addrTBankSel3c ? addrT3c : _GEN_580; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_613 = 4'hc == addrTBankSel3c ? addrT3c : _GEN_581; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_614 = 4'hd == addrTBankSel3c ? addrT3c : _GEN_582; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_615 = 4'he == addrTBankSel3c ? addrT3c : _GEN_583; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_616 = 4'hf == addrTBankSel3c ? addrT3c : _GEN_584; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_617 = 4'h0 == addrSBankSel3c ? addrS3c : _GEN_601; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_618 = 4'h1 == addrSBankSel3c ? addrS3c : _GEN_602; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_619 = 4'h2 == addrSBankSel3c ? addrS3c : _GEN_603; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_620 = 4'h3 == addrSBankSel3c ? addrS3c : _GEN_604; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_621 = 4'h4 == addrSBankSel3c ? addrS3c : _GEN_605; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_622 = 4'h5 == addrSBankSel3c ? addrS3c : _GEN_606; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_623 = 4'h6 == addrSBankSel3c ? addrS3c : _GEN_607; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_624 = 4'h7 == addrSBankSel3c ? addrS3c : _GEN_608; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_625 = 4'h8 == addrSBankSel3c ? addrS3c : _GEN_609; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_626 = 4'h9 == addrSBankSel3c ? addrS3c : _GEN_610; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_627 = 4'ha == addrSBankSel3c ? addrS3c : _GEN_611; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_628 = 4'hb == addrSBankSel3c ? addrS3c : _GEN_612; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_629 = 4'hc == addrSBankSel3c ? addrS3c : _GEN_613; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_630 = 4'hd == addrSBankSel3c ? addrS3c : _GEN_614; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_631 = 4'he == addrSBankSel3c ? addrS3c : _GEN_615; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_632 = 4'hf == addrSBankSel3c ? addrS3c : _GEN_616; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_665 = _srcBufferNext_T_3 ? _GEN_617 : _GEN_569; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_666 = _srcBufferNext_T_3 ? _GEN_618 : _GEN_570; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_667 = _srcBufferNext_T_3 ? _GEN_619 : _GEN_571; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_668 = _srcBufferNext_T_3 ? _GEN_620 : _GEN_572; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_669 = _srcBufferNext_T_3 ? _GEN_621 : _GEN_573; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_670 = _srcBufferNext_T_3 ? _GEN_622 : _GEN_574; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_671 = _srcBufferNext_T_3 ? _GEN_623 : _GEN_575; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_672 = _srcBufferNext_T_3 ? _GEN_624 : _GEN_576; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_673 = _srcBufferNext_T_3 ? _GEN_625 : _GEN_577; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_674 = _srcBufferNext_T_3 ? _GEN_626 : _GEN_578; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_675 = _srcBufferNext_T_3 ? _GEN_627 : _GEN_579; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_676 = _srcBufferNext_T_3 ? _GEN_628 : _GEN_580; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_677 = _srcBufferNext_T_3 ? _GEN_629 : _GEN_581; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_678 = _srcBufferNext_T_3 ? _GEN_630 : _GEN_582; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_679 = _srcBufferNext_T_3 ? _GEN_631 : _GEN_583; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_680 = _srcBufferNext_T_3 ? _GEN_632 : _GEN_584; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_681 = _srcBufferNext_T_3 ? _GEN_569 : _GEN_617; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_682 = _srcBufferNext_T_3 ? _GEN_570 : _GEN_618; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_683 = _srcBufferNext_T_3 ? _GEN_571 : _GEN_619; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_684 = _srcBufferNext_T_3 ? _GEN_572 : _GEN_620; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_685 = _srcBufferNext_T_3 ? _GEN_573 : _GEN_621; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_686 = _srcBufferNext_T_3 ? _GEN_574 : _GEN_622; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_687 = _srcBufferNext_T_3 ? _GEN_575 : _GEN_623; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_688 = _srcBufferNext_T_3 ? _GEN_576 : _GEN_624; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_689 = _srcBufferNext_T_3 ? _GEN_577 : _GEN_625; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_690 = _srcBufferNext_T_3 ? _GEN_578 : _GEN_626; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_691 = _srcBufferNext_T_3 ? _GEN_579 : _GEN_627; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_692 = _srcBufferNext_T_3 ? _GEN_580 : _GEN_628; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_693 = _srcBufferNext_T_3 ? _GEN_581 : _GEN_629; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_694 = _srcBufferNext_T_3 ? _GEN_582 : _GEN_630; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_695 = _srcBufferNext_T_3 ? _GEN_583 : _GEN_631; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_696 = _srcBufferNext_T_3 ? _GEN_584 : _GEN_632; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_793 = ~procState3c ? _GEN_665 : _GEN_665; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_794 = ~procState3c ? _GEN_666 : _GEN_666; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_795 = ~procState3c ? _GEN_667 : _GEN_667; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_796 = ~procState3c ? _GEN_668 : _GEN_668; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_797 = ~procState3c ? _GEN_669 : _GEN_669; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_798 = ~procState3c ? _GEN_670 : _GEN_670; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_799 = ~procState3c ? _GEN_671 : _GEN_671; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_800 = ~procState3c ? _GEN_672 : _GEN_672; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_801 = ~procState3c ? _GEN_673 : _GEN_673; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_802 = ~procState3c ? _GEN_674 : _GEN_674; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_803 = ~procState3c ? _GEN_675 : _GEN_675; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_804 = ~procState3c ? _GEN_676 : _GEN_676; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_805 = ~procState3c ? _GEN_677 : _GEN_677; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_806 = ~procState3c ? _GEN_678 : _GEN_678; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_807 = ~procState3c ? _GEN_679 : _GEN_679; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_808 = ~procState3c ? _GEN_680 : _GEN_680; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_809 = ~procState3c ? _GEN_681 : _GEN_681; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_810 = ~procState3c ? _GEN_682 : _GEN_682; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_811 = ~procState3c ? _GEN_683 : _GEN_683; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_812 = ~procState3c ? _GEN_684 : _GEN_684; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_813 = ~procState3c ? _GEN_685 : _GEN_685; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_814 = ~procState3c ? _GEN_686 : _GEN_686; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_815 = ~procState3c ? _GEN_687 : _GEN_687; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_816 = ~procState3c ? _GEN_688 : _GEN_688; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_817 = ~procState3c ? _GEN_689 : _GEN_689; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_818 = ~procState3c ? _GEN_690 : _GEN_690; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_819 = ~procState3c ? _GEN_691 : _GEN_691; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_820 = ~procState3c ? _GEN_692 : _GEN_692; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_821 = ~procState3c ? _GEN_693 : _GEN_693; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_822 = ~procState3c ? _GEN_694 : _GEN_694; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_823 = ~procState3c ? _GEN_695 : _GEN_695; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_824 = ~procState3c ? _GEN_696 : _GEN_696; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T = fftCalc_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T = writeDataTRPre3c[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_825 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T[14]}},_writeDataS3c_re_T}) : $signed(
    fftCalc_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_826 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T[14]}},_writeDataS3c_im_T}) : $signed(
    fftCalc_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_830 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c) : $signed(_GEN_826); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_834 = fftCalc_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_im = sameAddr3c ? $signed(_GEN_830) : $signed(_GEN_834); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_827 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_im) : $signed(writeDataTIPre3c); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_829 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_io_dataOutSR3c) : $signed(_GEN_825); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_833 = fftCalc_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_re = sameAddr3c ? $signed(_GEN_829) : $signed(_GEN_833); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_828 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_re) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_831 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_im) : $signed(_GEN_827); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_832 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_re) : $signed(_GEN_828); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_2 = 16'sh0 - $signed(writeDataTIPre3c); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_836 = _addrSBankSel3c_T_1 & addrTBankSel3c == 4'h8 & addrT3c == 4'h1 ? $signed(_writeDataT3c_im_T_2)
     : $signed(writeDataTIPre3c); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T = sameAddr3c ? $signed(_GEN_829) : $signed(_GEN_833); // @[FFTEngine.scala 604:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_1 = sameAddr3c ? $signed(_GEN_830) : $signed(_GEN_834); // @[FFTEngine.scala 604:66]
  wire [31:0] _io_writeDataSram0Bank_0_T_2 = {_io_writeDataSram0Bank_0_T_1,_io_writeDataSram0Bank_0_T}; // @[FFTEngine.scala 604:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_3 = sameAddr3c ? $signed(_GEN_832) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 607:66]
  wire [15:0] _io_writeDataSram0Bank_0_T_4 = sameAddr3c ? $signed(_GEN_831) : $signed(_GEN_836); // @[FFTEngine.scala 607:66]
  wire [31:0] _io_writeDataSram0Bank_0_T_5 = {_io_writeDataSram0Bank_0_T_4,_io_writeDataSram0Bank_0_T_3}; // @[FFTEngine.scala 607:66]
  wire [31:0] _GEN_843 = 4'h0 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_849 = procState3c ? _GEN_843 : _GEN_843; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_853 = 4'h1 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_859 = procState3c ? _GEN_853 : _GEN_853; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_863 = 4'h2 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_869 = procState3c ? _GEN_863 : _GEN_863; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_873 = 4'h3 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_879 = procState3c ? _GEN_873 : _GEN_873; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_883 = 4'h4 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_889 = procState3c ? _GEN_883 : _GEN_883; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_893 = 4'h5 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_899 = procState3c ? _GEN_893 : _GEN_893; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_903 = 4'h6 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_909 = procState3c ? _GEN_903 : _GEN_903; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_913 = 4'h7 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_919 = procState3c ? _GEN_913 : _GEN_913; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_923 = 4'h8 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_929 = procState3c ? _GEN_923 : _GEN_923; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_933 = 4'h9 == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_939 = procState3c ? _GEN_933 : _GEN_933; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_943 = 4'ha == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_949 = procState3c ? _GEN_943 : _GEN_943; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_953 = 4'hb == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_959 = procState3c ? _GEN_953 : _GEN_953; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_963 = 4'hc == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_969 = procState3c ? _GEN_963 : _GEN_963; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_973 = 4'hd == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_979 = procState3c ? _GEN_973 : _GEN_973; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_983 = 4'he == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_989 = procState3c ? _GEN_983 : _GEN_983; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_993 = 4'hf == addrSBankSel3c ? _io_writeDataSram0Bank_0_T_2 : _io_writeDataSram0Bank_0_T_5; // @[FFTEngine.scala 603:50 604:50]
  wire [31:0] _GEN_999 = procState3c ? _GEN_993 : _GEN_993; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_1; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_1; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_1; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_1; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_1; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_1; // @[Reg.scala 35:20]
  wire [3:0] _addrSBankSel_T_6 = _radixInit_T_11 ? addrSBankSelProc_1 : addrSBankSelKernel_1; // @[FFTEngine.scala 471:32]
  wire [3:0] _addrTBankSel_T_6 = _radixInit_T_11 ? addrTBankSelProc_1 : addrTBankSelKernel_1; // @[FFTEngine.scala 472:32]
  wire [3:0] _addrSBankSel_T_10 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_1 :
    addrSBankSelKernel_1; // @[FFTEngine.scala 474:32]
  wire [3:0] _addrTBankSel_T_10 = _addrSBankSel_T_4 ? addrTBankSelProc_1 : addrTBankSelKernel_1; // @[FFTEngine.scala 475:32]
  wire [3:0] addrSBankSel_1 = io_fftMode ? _addrSBankSel_T_6 : _addrSBankSel_T_10; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [3:0] addrTBankSel_1 = io_fftMode ? _addrTBankSel_T_6 : _addrTBankSel_T_10; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [3:0] addrSBankSel1c_1; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSel1c_1; // @[Reg.scala 35:20]
  wire [15:0] _GEN_1012 = 4'h1 == addrSBankSel1c_1 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1013 = 4'h2 == addrSBankSel1c_1 ? $signed(dataInPre_2_re) : $signed(_GEN_1012); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1014 = 4'h3 == addrSBankSel1c_1 ? $signed(dataInPre_3_re) : $signed(_GEN_1013); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1015 = 4'h4 == addrSBankSel1c_1 ? $signed(dataInPre_4_re) : $signed(_GEN_1014); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1016 = 4'h5 == addrSBankSel1c_1 ? $signed(dataInPre_5_re) : $signed(_GEN_1015); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1017 = 4'h6 == addrSBankSel1c_1 ? $signed(dataInPre_6_re) : $signed(_GEN_1016); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1018 = 4'h7 == addrSBankSel1c_1 ? $signed(dataInPre_7_re) : $signed(_GEN_1017); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1019 = 4'h8 == addrSBankSel1c_1 ? $signed(dataInPre_8_re) : $signed(_GEN_1018); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1020 = 4'h9 == addrSBankSel1c_1 ? $signed(dataInPre_9_re) : $signed(_GEN_1019); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1021 = 4'ha == addrSBankSel1c_1 ? $signed(dataInPre_10_re) : $signed(_GEN_1020); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1022 = 4'hb == addrSBankSel1c_1 ? $signed(dataInPre_11_re) : $signed(_GEN_1021); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1023 = 4'hc == addrSBankSel1c_1 ? $signed(dataInPre_12_re) : $signed(_GEN_1022); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1024 = 4'hd == addrSBankSel1c_1 ? $signed(dataInPre_13_re) : $signed(_GEN_1023); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1025 = 4'he == addrSBankSel1c_1 ? $signed(dataInPre_14_re) : $signed(_GEN_1024); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1028 = 4'h1 == addrSBankSel1c_1 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1029 = 4'h2 == addrSBankSel1c_1 ? $signed(dataInPre_2_im) : $signed(_GEN_1028); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1030 = 4'h3 == addrSBankSel1c_1 ? $signed(dataInPre_3_im) : $signed(_GEN_1029); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1031 = 4'h4 == addrSBankSel1c_1 ? $signed(dataInPre_4_im) : $signed(_GEN_1030); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1032 = 4'h5 == addrSBankSel1c_1 ? $signed(dataInPre_5_im) : $signed(_GEN_1031); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1033 = 4'h6 == addrSBankSel1c_1 ? $signed(dataInPre_6_im) : $signed(_GEN_1032); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1034 = 4'h7 == addrSBankSel1c_1 ? $signed(dataInPre_7_im) : $signed(_GEN_1033); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1035 = 4'h8 == addrSBankSel1c_1 ? $signed(dataInPre_8_im) : $signed(_GEN_1034); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1036 = 4'h9 == addrSBankSel1c_1 ? $signed(dataInPre_9_im) : $signed(_GEN_1035); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1037 = 4'ha == addrSBankSel1c_1 ? $signed(dataInPre_10_im) : $signed(_GEN_1036); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1038 = 4'hb == addrSBankSel1c_1 ? $signed(dataInPre_11_im) : $signed(_GEN_1037); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1039 = 4'hc == addrSBankSel1c_1 ? $signed(dataInPre_12_im) : $signed(_GEN_1038); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1040 = 4'hd == addrSBankSel1c_1 ? $signed(dataInPre_13_im) : $signed(_GEN_1039); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1041 = 4'he == addrSBankSel1c_1 ? $signed(dataInPre_14_im) : $signed(_GEN_1040); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1042 = 4'hf == addrSBankSel1c_1 ? $signed(dataInPre_15_im) : $signed(_GEN_1041); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1044 = 4'h1 == addrTBankSel1c_1 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1045 = 4'h2 == addrTBankSel1c_1 ? $signed(dataInPre_2_im) : $signed(_GEN_1044); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1046 = 4'h3 == addrTBankSel1c_1 ? $signed(dataInPre_3_im) : $signed(_GEN_1045); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1047 = 4'h4 == addrTBankSel1c_1 ? $signed(dataInPre_4_im) : $signed(_GEN_1046); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1048 = 4'h5 == addrTBankSel1c_1 ? $signed(dataInPre_5_im) : $signed(_GEN_1047); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1049 = 4'h6 == addrTBankSel1c_1 ? $signed(dataInPre_6_im) : $signed(_GEN_1048); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1050 = 4'h7 == addrTBankSel1c_1 ? $signed(dataInPre_7_im) : $signed(_GEN_1049); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1051 = 4'h8 == addrTBankSel1c_1 ? $signed(dataInPre_8_im) : $signed(_GEN_1050); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1052 = 4'h9 == addrTBankSel1c_1 ? $signed(dataInPre_9_im) : $signed(_GEN_1051); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1053 = 4'ha == addrTBankSel1c_1 ? $signed(dataInPre_10_im) : $signed(_GEN_1052); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1054 = 4'hb == addrTBankSel1c_1 ? $signed(dataInPre_11_im) : $signed(_GEN_1053); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1055 = 4'hc == addrTBankSel1c_1 ? $signed(dataInPre_12_im) : $signed(_GEN_1054); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1056 = 4'hd == addrTBankSel1c_1 ? $signed(dataInPre_13_im) : $signed(_GEN_1055); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1057 = 4'he == addrTBankSel1c_1 ? $signed(dataInPre_14_im) : $signed(_GEN_1056); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1058 = 4'hf == addrTBankSel1c_1 ? $signed(dataInPre_15_im) : $signed(_GEN_1057); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1060 = 4'h1 == addrTBankSel1c_1 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1061 = 4'h2 == addrTBankSel1c_1 ? $signed(dataInPre_2_re) : $signed(_GEN_1060); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1062 = 4'h3 == addrTBankSel1c_1 ? $signed(dataInPre_3_re) : $signed(_GEN_1061); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1063 = 4'h4 == addrTBankSel1c_1 ? $signed(dataInPre_4_re) : $signed(_GEN_1062); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1064 = 4'h5 == addrTBankSel1c_1 ? $signed(dataInPre_5_re) : $signed(_GEN_1063); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1065 = 4'h6 == addrTBankSel1c_1 ? $signed(dataInPre_6_re) : $signed(_GEN_1064); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1066 = 4'h7 == addrTBankSel1c_1 ? $signed(dataInPre_7_re) : $signed(_GEN_1065); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1067 = 4'h8 == addrTBankSel1c_1 ? $signed(dataInPre_8_re) : $signed(_GEN_1066); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1068 = 4'h9 == addrTBankSel1c_1 ? $signed(dataInPre_9_re) : $signed(_GEN_1067); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1069 = 4'ha == addrTBankSel1c_1 ? $signed(dataInPre_10_re) : $signed(_GEN_1068); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1070 = 4'hb == addrTBankSel1c_1 ? $signed(dataInPre_11_re) : $signed(_GEN_1069); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1071 = 4'hc == addrTBankSel1c_1 ? $signed(dataInPre_12_re) : $signed(_GEN_1070); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1072 = 4'hd == addrTBankSel1c_1 ? $signed(dataInPre_13_re) : $signed(_GEN_1071); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1073 = 4'he == addrTBankSel1c_1 ? $signed(dataInPre_14_re) : $signed(_GEN_1072); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1074 = 4'hf == addrTBankSel1c_1 ? $signed(dataInPre_15_re) : $signed(_GEN_1073); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_9 = 16'sh0 - $signed(fftCalc_1_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_10 = io_fftMode ? $signed(fftCalc_1_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_9); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_11 = _T_12 ? $signed(fftCalc_1_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_10); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_1 = procState3c ? $signed(_writeDataTRPre3c_T_11) : $signed(fftCalc_1_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_15 = 16'sh0 - $signed(fftCalc_1_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_16 = io_fftMode ? $signed(_writeDataTIPre3c_T_15) : $signed(fftCalc_1_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_17 = _T_12 ? $signed(_writeDataTRPre3c_T_9) : $signed(_writeDataTIPre3c_T_16); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_1 = procState3c ? $signed(_writeDataTIPre3c_T_17) : $signed(fftCalc_1_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [3:0] _addrSBankSel3c_T_8 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_1_r :
    addrSBankSelKernel3c_1_r; // @[FFTEngine.scala 505:34]
  wire [3:0] _addrTBankSel3c_T_8 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_1_r : addrTBankSelKernel3c_1_r; // @[FFTEngine.scala 506:34]
  wire [3:0] _addrSBankSel3c_T_9 = procState3c ? addrSBankSelProc3c_1_r : addrSBankSelKernel3c_1_r; // @[FFTEngine.scala 508:34]
  wire [3:0] _addrTBankSel3c_T_9 = procState3c ? addrTBankSelProc3c_1_r : addrTBankSelKernel3c_1_r; // @[FFTEngine.scala 509:34]
  wire [3:0] addrSBankSel3c_1 = io_fftMode ? _addrSBankSel3c_T_8 : _addrSBankSel3c_T_9; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [3:0] addrTBankSel3c_1 = io_fftMode ? _addrTBankSel3c_T_8 : _addrTBankSel3c_T_9; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [3:0] _GEN_1093 = 4'h0 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_809; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1094 = 4'h1 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_810; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1095 = 4'h2 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_811; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1096 = 4'h3 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_812; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1097 = 4'h4 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_813; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1098 = 4'h5 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_814; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1099 = 4'h6 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_815; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1100 = 4'h7 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_816; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1101 = 4'h8 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_817; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1102 = 4'h9 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_818; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1103 = 4'ha == addrTBankSel_1 ? addrT_1[3:0] : _GEN_819; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1104 = 4'hb == addrTBankSel_1 ? addrT_1[3:0] : _GEN_820; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1105 = 4'hc == addrTBankSel_1 ? addrT_1[3:0] : _GEN_821; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1106 = 4'hd == addrTBankSel_1 ? addrT_1[3:0] : _GEN_822; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1107 = 4'he == addrTBankSel_1 ? addrT_1[3:0] : _GEN_823; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1108 = 4'hf == addrTBankSel_1 ? addrT_1[3:0] : _GEN_824; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1109 = 4'h0 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1093; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1110 = 4'h1 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1094; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1111 = 4'h2 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1095; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1112 = 4'h3 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1096; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1113 = 4'h4 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1097; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1114 = 4'h5 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1098; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1115 = 4'h6 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1099; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1116 = 4'h7 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1100; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1117 = 4'h8 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1101; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1118 = 4'h9 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1102; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1119 = 4'ha == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1103; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1120 = 4'hb == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1104; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1121 = 4'hc == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1105; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1122 = 4'hd == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1106; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1123 = 4'he == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1107; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1124 = 4'hf == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1108; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1125 = 4'h0 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_793; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1126 = 4'h1 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_794; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1127 = 4'h2 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_795; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1128 = 4'h3 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_796; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1129 = 4'h4 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_797; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1130 = 4'h5 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_798; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1131 = 4'h6 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_799; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1132 = 4'h7 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_800; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1133 = 4'h8 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_801; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1134 = 4'h9 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_802; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1135 = 4'ha == addrTBankSel_1 ? addrT_1[3:0] : _GEN_803; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1136 = 4'hb == addrTBankSel_1 ? addrT_1[3:0] : _GEN_804; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1137 = 4'hc == addrTBankSel_1 ? addrT_1[3:0] : _GEN_805; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1138 = 4'hd == addrTBankSel_1 ? addrT_1[3:0] : _GEN_806; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1139 = 4'he == addrTBankSel_1 ? addrT_1[3:0] : _GEN_807; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1140 = 4'hf == addrTBankSel_1 ? addrT_1[3:0] : _GEN_808; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1141 = 4'h0 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1125; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1142 = 4'h1 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1126; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1143 = 4'h2 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1127; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1144 = 4'h3 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1128; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1145 = 4'h4 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1129; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1146 = 4'h5 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1130; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1147 = 4'h6 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1131; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1148 = 4'h7 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1132; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1149 = 4'h8 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1133; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1150 = 4'h9 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1134; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1151 = 4'ha == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1135; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1152 = 4'hb == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1136; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1153 = 4'hc == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1137; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1154 = 4'hd == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1138; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1155 = 4'he == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1139; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1156 = 4'hf == addrSBankSel_1 ? addrS_1[3:0] : _GEN_1140; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1157 = _srcBufferNext_T_3 ? _GEN_1109 : _GEN_809; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1158 = _srcBufferNext_T_3 ? _GEN_1110 : _GEN_810; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1159 = _srcBufferNext_T_3 ? _GEN_1111 : _GEN_811; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1160 = _srcBufferNext_T_3 ? _GEN_1112 : _GEN_812; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1161 = _srcBufferNext_T_3 ? _GEN_1113 : _GEN_813; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1162 = _srcBufferNext_T_3 ? _GEN_1114 : _GEN_814; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1163 = _srcBufferNext_T_3 ? _GEN_1115 : _GEN_815; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1164 = _srcBufferNext_T_3 ? _GEN_1116 : _GEN_816; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1165 = _srcBufferNext_T_3 ? _GEN_1117 : _GEN_817; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1166 = _srcBufferNext_T_3 ? _GEN_1118 : _GEN_818; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1167 = _srcBufferNext_T_3 ? _GEN_1119 : _GEN_819; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1168 = _srcBufferNext_T_3 ? _GEN_1120 : _GEN_820; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1169 = _srcBufferNext_T_3 ? _GEN_1121 : _GEN_821; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1170 = _srcBufferNext_T_3 ? _GEN_1122 : _GEN_822; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1171 = _srcBufferNext_T_3 ? _GEN_1123 : _GEN_823; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1172 = _srcBufferNext_T_3 ? _GEN_1124 : _GEN_824; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1173 = _srcBufferNext_T_3 ? _GEN_793 : _GEN_1141; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1174 = _srcBufferNext_T_3 ? _GEN_794 : _GEN_1142; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1175 = _srcBufferNext_T_3 ? _GEN_795 : _GEN_1143; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1176 = _srcBufferNext_T_3 ? _GEN_796 : _GEN_1144; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1177 = _srcBufferNext_T_3 ? _GEN_797 : _GEN_1145; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1178 = _srcBufferNext_T_3 ? _GEN_798 : _GEN_1146; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1179 = _srcBufferNext_T_3 ? _GEN_799 : _GEN_1147; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1180 = _srcBufferNext_T_3 ? _GEN_800 : _GEN_1148; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1181 = _srcBufferNext_T_3 ? _GEN_801 : _GEN_1149; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1182 = _srcBufferNext_T_3 ? _GEN_802 : _GEN_1150; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1183 = _srcBufferNext_T_3 ? _GEN_803 : _GEN_1151; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1184 = _srcBufferNext_T_3 ? _GEN_804 : _GEN_1152; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1185 = _srcBufferNext_T_3 ? _GEN_805 : _GEN_1153; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1186 = _srcBufferNext_T_3 ? _GEN_806 : _GEN_1154; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1187 = _srcBufferNext_T_3 ? _GEN_807 : _GEN_1155; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1188 = _srcBufferNext_T_3 ? _GEN_808 : _GEN_1156; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1189 = ~_radixInit_T_11 ? _GEN_1157 : _GEN_809; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1190 = ~_radixInit_T_11 ? _GEN_1158 : _GEN_810; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1191 = ~_radixInit_T_11 ? _GEN_1159 : _GEN_811; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1192 = ~_radixInit_T_11 ? _GEN_1160 : _GEN_812; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1193 = ~_radixInit_T_11 ? _GEN_1161 : _GEN_813; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1194 = ~_radixInit_T_11 ? _GEN_1162 : _GEN_814; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1195 = ~_radixInit_T_11 ? _GEN_1163 : _GEN_815; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1196 = ~_radixInit_T_11 ? _GEN_1164 : _GEN_816; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1197 = ~_radixInit_T_11 ? _GEN_1165 : _GEN_817; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1198 = ~_radixInit_T_11 ? _GEN_1166 : _GEN_818; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1199 = ~_radixInit_T_11 ? _GEN_1167 : _GEN_819; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1200 = ~_radixInit_T_11 ? _GEN_1168 : _GEN_820; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1201 = ~_radixInit_T_11 ? _GEN_1169 : _GEN_821; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1202 = ~_radixInit_T_11 ? _GEN_1170 : _GEN_822; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1203 = ~_radixInit_T_11 ? _GEN_1171 : _GEN_823; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1204 = ~_radixInit_T_11 ? _GEN_1172 : _GEN_824; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1205 = ~_radixInit_T_11 ? _GEN_1173 : _GEN_793; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1206 = ~_radixInit_T_11 ? _GEN_1174 : _GEN_794; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1207 = ~_radixInit_T_11 ? _GEN_1175 : _GEN_795; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1208 = ~_radixInit_T_11 ? _GEN_1176 : _GEN_796; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1209 = ~_radixInit_T_11 ? _GEN_1177 : _GEN_797; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1210 = ~_radixInit_T_11 ? _GEN_1178 : _GEN_798; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1211 = ~_radixInit_T_11 ? _GEN_1179 : _GEN_799; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1212 = ~_radixInit_T_11 ? _GEN_1180 : _GEN_800; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1213 = ~_radixInit_T_11 ? _GEN_1181 : _GEN_801; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1214 = ~_radixInit_T_11 ? _GEN_1182 : _GEN_802; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1215 = ~_radixInit_T_11 ? _GEN_1183 : _GEN_803; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1216 = ~_radixInit_T_11 ? _GEN_1184 : _GEN_804; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1217 = ~_radixInit_T_11 ? _GEN_1185 : _GEN_805; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1218 = ~_radixInit_T_11 ? _GEN_1186 : _GEN_806; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1219 = ~_radixInit_T_11 ? _GEN_1187 : _GEN_807; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1220 = ~_radixInit_T_11 ? _GEN_1188 : _GEN_808; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1221 = 4'h0 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1205; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1222 = 4'h1 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1206; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1223 = 4'h2 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1207; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1224 = 4'h3 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1208; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1225 = 4'h4 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1209; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1226 = 4'h5 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1210; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1227 = 4'h6 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1211; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1228 = 4'h7 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1212; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1229 = 4'h8 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1213; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1230 = 4'h9 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1214; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1231 = 4'ha == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1215; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1232 = 4'hb == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1216; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1233 = 4'hc == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1217; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1234 = 4'hd == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1218; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1235 = 4'he == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1219; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1236 = 4'hf == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1220; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1237 = 4'h0 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1221; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1238 = 4'h1 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1222; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1239 = 4'h2 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1223; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1240 = 4'h3 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1224; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1241 = 4'h4 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1225; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1242 = 4'h5 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1226; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1243 = 4'h6 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1227; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1244 = 4'h7 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1228; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1245 = 4'h8 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1229; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1246 = 4'h9 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1230; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1247 = 4'ha == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1231; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1248 = 4'hb == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1232; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1249 = 4'hc == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1233; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1250 = 4'hd == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1234; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1251 = 4'he == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1235; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1252 = 4'hf == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1236; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1253 = 4'h0 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1189; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1254 = 4'h1 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1190; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1255 = 4'h2 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1191; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1256 = 4'h3 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1192; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1257 = 4'h4 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1193; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1258 = 4'h5 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1194; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1259 = 4'h6 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1195; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1260 = 4'h7 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1196; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1261 = 4'h8 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1197; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1262 = 4'h9 == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1198; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1263 = 4'ha == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1199; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1264 = 4'hb == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1200; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1265 = 4'hc == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1201; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1266 = 4'hd == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1202; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1267 = 4'he == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1203; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1268 = 4'hf == addrTBankSel3c_1 ? addrT3c_1 : _GEN_1204; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1269 = 4'h0 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1253; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1270 = 4'h1 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1254; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1271 = 4'h2 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1255; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1272 = 4'h3 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1256; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1273 = 4'h4 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1257; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1274 = 4'h5 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1258; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1275 = 4'h6 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1259; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1276 = 4'h7 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1260; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1277 = 4'h8 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1261; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1278 = 4'h9 == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1262; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1279 = 4'ha == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1263; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1280 = 4'hb == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1264; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1281 = 4'hc == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1265; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1282 = 4'hd == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1266; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1283 = 4'he == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1267; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1284 = 4'hf == addrSBankSel3c_1 ? addrS3c_1 : _GEN_1268; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1285 = _srcBufferNext_T_3 ? _GEN_1237 : _GEN_1205; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1286 = _srcBufferNext_T_3 ? _GEN_1238 : _GEN_1206; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1287 = _srcBufferNext_T_3 ? _GEN_1239 : _GEN_1207; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1288 = _srcBufferNext_T_3 ? _GEN_1240 : _GEN_1208; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1289 = _srcBufferNext_T_3 ? _GEN_1241 : _GEN_1209; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1290 = _srcBufferNext_T_3 ? _GEN_1242 : _GEN_1210; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1291 = _srcBufferNext_T_3 ? _GEN_1243 : _GEN_1211; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1292 = _srcBufferNext_T_3 ? _GEN_1244 : _GEN_1212; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1293 = _srcBufferNext_T_3 ? _GEN_1245 : _GEN_1213; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1294 = _srcBufferNext_T_3 ? _GEN_1246 : _GEN_1214; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1295 = _srcBufferNext_T_3 ? _GEN_1247 : _GEN_1215; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1296 = _srcBufferNext_T_3 ? _GEN_1248 : _GEN_1216; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1297 = _srcBufferNext_T_3 ? _GEN_1249 : _GEN_1217; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1298 = _srcBufferNext_T_3 ? _GEN_1250 : _GEN_1218; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1299 = _srcBufferNext_T_3 ? _GEN_1251 : _GEN_1219; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1300 = _srcBufferNext_T_3 ? _GEN_1252 : _GEN_1220; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1301 = _srcBufferNext_T_3 ? _GEN_1189 : _GEN_1269; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1302 = _srcBufferNext_T_3 ? _GEN_1190 : _GEN_1270; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1303 = _srcBufferNext_T_3 ? _GEN_1191 : _GEN_1271; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1304 = _srcBufferNext_T_3 ? _GEN_1192 : _GEN_1272; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1305 = _srcBufferNext_T_3 ? _GEN_1193 : _GEN_1273; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1306 = _srcBufferNext_T_3 ? _GEN_1194 : _GEN_1274; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1307 = _srcBufferNext_T_3 ? _GEN_1195 : _GEN_1275; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1308 = _srcBufferNext_T_3 ? _GEN_1196 : _GEN_1276; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1309 = _srcBufferNext_T_3 ? _GEN_1197 : _GEN_1277; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1310 = _srcBufferNext_T_3 ? _GEN_1198 : _GEN_1278; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1311 = _srcBufferNext_T_3 ? _GEN_1199 : _GEN_1279; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1312 = _srcBufferNext_T_3 ? _GEN_1200 : _GEN_1280; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1313 = _srcBufferNext_T_3 ? _GEN_1201 : _GEN_1281; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1314 = _srcBufferNext_T_3 ? _GEN_1202 : _GEN_1282; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1315 = _srcBufferNext_T_3 ? _GEN_1203 : _GEN_1283; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1316 = _srcBufferNext_T_3 ? _GEN_1204 : _GEN_1284; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1317 = ~procState3c ? _GEN_1285 : _GEN_1205; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1318 = ~procState3c ? _GEN_1286 : _GEN_1206; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1319 = ~procState3c ? _GEN_1287 : _GEN_1207; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1320 = ~procState3c ? _GEN_1288 : _GEN_1208; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1321 = ~procState3c ? _GEN_1289 : _GEN_1209; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1322 = ~procState3c ? _GEN_1290 : _GEN_1210; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1323 = ~procState3c ? _GEN_1291 : _GEN_1211; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1324 = ~procState3c ? _GEN_1292 : _GEN_1212; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1325 = ~procState3c ? _GEN_1293 : _GEN_1213; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1326 = ~procState3c ? _GEN_1294 : _GEN_1214; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1327 = ~procState3c ? _GEN_1295 : _GEN_1215; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1328 = ~procState3c ? _GEN_1296 : _GEN_1216; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1329 = ~procState3c ? _GEN_1297 : _GEN_1217; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1330 = ~procState3c ? _GEN_1298 : _GEN_1218; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1331 = ~procState3c ? _GEN_1299 : _GEN_1219; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1332 = ~procState3c ? _GEN_1300 : _GEN_1220; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1333 = ~procState3c ? _GEN_1301 : _GEN_1189; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1334 = ~procState3c ? _GEN_1302 : _GEN_1190; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1335 = ~procState3c ? _GEN_1303 : _GEN_1191; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1336 = ~procState3c ? _GEN_1304 : _GEN_1192; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1337 = ~procState3c ? _GEN_1305 : _GEN_1193; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1338 = ~procState3c ? _GEN_1306 : _GEN_1194; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1339 = ~procState3c ? _GEN_1307 : _GEN_1195; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1340 = ~procState3c ? _GEN_1308 : _GEN_1196; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1341 = ~procState3c ? _GEN_1309 : _GEN_1197; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1342 = ~procState3c ? _GEN_1310 : _GEN_1198; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1343 = ~procState3c ? _GEN_1311 : _GEN_1199; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1344 = ~procState3c ? _GEN_1312 : _GEN_1200; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1345 = ~procState3c ? _GEN_1313 : _GEN_1201; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1346 = ~procState3c ? _GEN_1314 : _GEN_1202; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1347 = ~procState3c ? _GEN_1315 : _GEN_1203; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1348 = ~procState3c ? _GEN_1316 : _GEN_1204; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_1 = fftCalc_1_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_1 = writeDataTRPre3c_1[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_1349 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_1[14]}},_writeDataS3c_re_T_1}) : $signed(
    fftCalc_1_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_1350 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_1[14]}},_writeDataS3c_im_T_1}) : $signed(
    fftCalc_1_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_1354 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_1) : $signed(_GEN_1350); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_1358 = fftCalc_1_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_1_im = sameAddr3c ? $signed(_GEN_1354) : $signed(_GEN_1358); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_1351 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_1_im) : $signed(writeDataTIPre3c_1); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_1353 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_1_io_dataOutSR3c) : $signed(_GEN_1349); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_1357 = fftCalc_1_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_1_re = sameAddr3c ? $signed(_GEN_1353) : $signed(_GEN_1357); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_1352 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_1_re) : $signed(writeDataTRPre3c_1); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_1355 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_1_im) : $signed(_GEN_1351); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_1356 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_1_re) : $signed(_GEN_1352); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_5 = 16'sh0 - $signed(writeDataTIPre3c_1); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_1360 = _addrSBankSel3c_T_1 & addrTBankSel3c_1 == 4'h8 & addrT3c_1 == 4'h1 ? $signed(
    _writeDataT3c_im_T_5) : $signed(writeDataTIPre3c_1); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_12 = sameAddr3c ? $signed(_GEN_1353) : $signed(_GEN_1357); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_13 = sameAddr3c ? $signed(_GEN_1354) : $signed(_GEN_1358); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_14 = {_io_writeDataSram0Bank_0_T_13,_io_writeDataSram0Bank_0_T_12}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_15 = sameAddr3c ? $signed(_GEN_1356) : $signed(writeDataTRPre3c_1); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_16 = sameAddr3c ? $signed(_GEN_1355) : $signed(_GEN_1360); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_17 = {_io_writeDataSram0Bank_0_T_16,_io_writeDataSram0Bank_0_T_15}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_1365 = 4'h0 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_849; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1367 = 4'h0 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1365; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1369 = procState3c ? _GEN_849 : _GEN_1367; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1371 = 4'h1 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_859; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1373 = 4'h1 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1371; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1375 = procState3c ? _GEN_859 : _GEN_1373; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1377 = 4'h2 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_869; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1379 = 4'h2 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1377; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1381 = procState3c ? _GEN_869 : _GEN_1379; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1383 = 4'h3 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_879; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1385 = 4'h3 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1383; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1387 = procState3c ? _GEN_879 : _GEN_1385; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1389 = 4'h4 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_889; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1391 = 4'h4 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1389; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1393 = procState3c ? _GEN_889 : _GEN_1391; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1395 = 4'h5 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_899; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1397 = 4'h5 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1395; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1399 = procState3c ? _GEN_899 : _GEN_1397; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1401 = 4'h6 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_909; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1403 = 4'h6 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1401; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1405 = procState3c ? _GEN_909 : _GEN_1403; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1407 = 4'h7 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_919; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1409 = 4'h7 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1407; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1411 = procState3c ? _GEN_919 : _GEN_1409; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1413 = 4'h8 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_929; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1415 = 4'h8 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1413; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1417 = procState3c ? _GEN_929 : _GEN_1415; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1419 = 4'h9 == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_939; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1421 = 4'h9 == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1419; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1423 = procState3c ? _GEN_939 : _GEN_1421; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1425 = 4'ha == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_949; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1427 = 4'ha == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1425; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1429 = procState3c ? _GEN_949 : _GEN_1427; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1431 = 4'hb == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_959; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1433 = 4'hb == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1431; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1435 = procState3c ? _GEN_959 : _GEN_1433; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1437 = 4'hc == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_969; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1439 = 4'hc == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1437; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1441 = procState3c ? _GEN_969 : _GEN_1439; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1443 = 4'hd == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_979; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1445 = 4'hd == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1443; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1447 = procState3c ? _GEN_979 : _GEN_1445; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1449 = 4'he == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_989; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1451 = 4'he == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1449; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1453 = procState3c ? _GEN_989 : _GEN_1451; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1455 = 4'hf == addrTBankSel3c_1 ? _io_writeDataSram0Bank_0_T_17 : _GEN_999; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1457 = 4'hf == addrSBankSel3c_1 ? _io_writeDataSram0Bank_0_T_14 : _GEN_1455; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1459 = procState3c ? _GEN_999 : _GEN_1457; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_2; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_2; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_2; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_2; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_2; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_2; // @[Reg.scala 35:20]
  wire [3:0] _addrSBankSel_T_11 = _radixInit_T_11 ? addrSBankSelProc_2 : addrSBankSelKernel_2; // @[FFTEngine.scala 471:32]
  wire [3:0] _addrTBankSel_T_11 = _radixInit_T_11 ? addrTBankSelProc_2 : addrTBankSelKernel_2; // @[FFTEngine.scala 472:32]
  wire [3:0] _addrSBankSel_T_15 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_2 :
    addrSBankSelKernel_2; // @[FFTEngine.scala 474:32]
  wire [3:0] _addrTBankSel_T_15 = _addrSBankSel_T_4 ? addrTBankSelProc_2 : addrTBankSelKernel_2; // @[FFTEngine.scala 475:32]
  wire [3:0] addrSBankSel_2 = io_fftMode ? _addrSBankSel_T_11 : _addrSBankSel_T_15; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [3:0] addrTBankSel_2 = io_fftMode ? _addrTBankSel_T_11 : _addrTBankSel_T_15; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [3:0] addrSBankSel1c_2; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSel1c_2; // @[Reg.scala 35:20]
  wire [15:0] _GEN_1472 = 4'h1 == addrSBankSel1c_2 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1473 = 4'h2 == addrSBankSel1c_2 ? $signed(dataInPre_2_re) : $signed(_GEN_1472); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1474 = 4'h3 == addrSBankSel1c_2 ? $signed(dataInPre_3_re) : $signed(_GEN_1473); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1475 = 4'h4 == addrSBankSel1c_2 ? $signed(dataInPre_4_re) : $signed(_GEN_1474); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1476 = 4'h5 == addrSBankSel1c_2 ? $signed(dataInPre_5_re) : $signed(_GEN_1475); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1477 = 4'h6 == addrSBankSel1c_2 ? $signed(dataInPre_6_re) : $signed(_GEN_1476); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1478 = 4'h7 == addrSBankSel1c_2 ? $signed(dataInPre_7_re) : $signed(_GEN_1477); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1479 = 4'h8 == addrSBankSel1c_2 ? $signed(dataInPre_8_re) : $signed(_GEN_1478); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1480 = 4'h9 == addrSBankSel1c_2 ? $signed(dataInPre_9_re) : $signed(_GEN_1479); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1481 = 4'ha == addrSBankSel1c_2 ? $signed(dataInPre_10_re) : $signed(_GEN_1480); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1482 = 4'hb == addrSBankSel1c_2 ? $signed(dataInPre_11_re) : $signed(_GEN_1481); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1483 = 4'hc == addrSBankSel1c_2 ? $signed(dataInPre_12_re) : $signed(_GEN_1482); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1484 = 4'hd == addrSBankSel1c_2 ? $signed(dataInPre_13_re) : $signed(_GEN_1483); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1485 = 4'he == addrSBankSel1c_2 ? $signed(dataInPre_14_re) : $signed(_GEN_1484); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1488 = 4'h1 == addrSBankSel1c_2 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1489 = 4'h2 == addrSBankSel1c_2 ? $signed(dataInPre_2_im) : $signed(_GEN_1488); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1490 = 4'h3 == addrSBankSel1c_2 ? $signed(dataInPre_3_im) : $signed(_GEN_1489); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1491 = 4'h4 == addrSBankSel1c_2 ? $signed(dataInPre_4_im) : $signed(_GEN_1490); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1492 = 4'h5 == addrSBankSel1c_2 ? $signed(dataInPre_5_im) : $signed(_GEN_1491); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1493 = 4'h6 == addrSBankSel1c_2 ? $signed(dataInPre_6_im) : $signed(_GEN_1492); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1494 = 4'h7 == addrSBankSel1c_2 ? $signed(dataInPre_7_im) : $signed(_GEN_1493); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1495 = 4'h8 == addrSBankSel1c_2 ? $signed(dataInPre_8_im) : $signed(_GEN_1494); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1496 = 4'h9 == addrSBankSel1c_2 ? $signed(dataInPre_9_im) : $signed(_GEN_1495); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1497 = 4'ha == addrSBankSel1c_2 ? $signed(dataInPre_10_im) : $signed(_GEN_1496); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1498 = 4'hb == addrSBankSel1c_2 ? $signed(dataInPre_11_im) : $signed(_GEN_1497); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1499 = 4'hc == addrSBankSel1c_2 ? $signed(dataInPre_12_im) : $signed(_GEN_1498); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1500 = 4'hd == addrSBankSel1c_2 ? $signed(dataInPre_13_im) : $signed(_GEN_1499); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1501 = 4'he == addrSBankSel1c_2 ? $signed(dataInPre_14_im) : $signed(_GEN_1500); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1502 = 4'hf == addrSBankSel1c_2 ? $signed(dataInPre_15_im) : $signed(_GEN_1501); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1504 = 4'h1 == addrTBankSel1c_2 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1505 = 4'h2 == addrTBankSel1c_2 ? $signed(dataInPre_2_im) : $signed(_GEN_1504); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1506 = 4'h3 == addrTBankSel1c_2 ? $signed(dataInPre_3_im) : $signed(_GEN_1505); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1507 = 4'h4 == addrTBankSel1c_2 ? $signed(dataInPre_4_im) : $signed(_GEN_1506); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1508 = 4'h5 == addrTBankSel1c_2 ? $signed(dataInPre_5_im) : $signed(_GEN_1507); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1509 = 4'h6 == addrTBankSel1c_2 ? $signed(dataInPre_6_im) : $signed(_GEN_1508); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1510 = 4'h7 == addrTBankSel1c_2 ? $signed(dataInPre_7_im) : $signed(_GEN_1509); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1511 = 4'h8 == addrTBankSel1c_2 ? $signed(dataInPre_8_im) : $signed(_GEN_1510); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1512 = 4'h9 == addrTBankSel1c_2 ? $signed(dataInPre_9_im) : $signed(_GEN_1511); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1513 = 4'ha == addrTBankSel1c_2 ? $signed(dataInPre_10_im) : $signed(_GEN_1512); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1514 = 4'hb == addrTBankSel1c_2 ? $signed(dataInPre_11_im) : $signed(_GEN_1513); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1515 = 4'hc == addrTBankSel1c_2 ? $signed(dataInPre_12_im) : $signed(_GEN_1514); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1516 = 4'hd == addrTBankSel1c_2 ? $signed(dataInPre_13_im) : $signed(_GEN_1515); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1517 = 4'he == addrTBankSel1c_2 ? $signed(dataInPre_14_im) : $signed(_GEN_1516); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1518 = 4'hf == addrTBankSel1c_2 ? $signed(dataInPre_15_im) : $signed(_GEN_1517); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1520 = 4'h1 == addrTBankSel1c_2 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1521 = 4'h2 == addrTBankSel1c_2 ? $signed(dataInPre_2_re) : $signed(_GEN_1520); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1522 = 4'h3 == addrTBankSel1c_2 ? $signed(dataInPre_3_re) : $signed(_GEN_1521); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1523 = 4'h4 == addrTBankSel1c_2 ? $signed(dataInPre_4_re) : $signed(_GEN_1522); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1524 = 4'h5 == addrTBankSel1c_2 ? $signed(dataInPre_5_re) : $signed(_GEN_1523); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1525 = 4'h6 == addrTBankSel1c_2 ? $signed(dataInPre_6_re) : $signed(_GEN_1524); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1526 = 4'h7 == addrTBankSel1c_2 ? $signed(dataInPre_7_re) : $signed(_GEN_1525); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1527 = 4'h8 == addrTBankSel1c_2 ? $signed(dataInPre_8_re) : $signed(_GEN_1526); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1528 = 4'h9 == addrTBankSel1c_2 ? $signed(dataInPre_9_re) : $signed(_GEN_1527); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1529 = 4'ha == addrTBankSel1c_2 ? $signed(dataInPre_10_re) : $signed(_GEN_1528); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1530 = 4'hb == addrTBankSel1c_2 ? $signed(dataInPre_11_re) : $signed(_GEN_1529); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1531 = 4'hc == addrTBankSel1c_2 ? $signed(dataInPre_12_re) : $signed(_GEN_1530); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1532 = 4'hd == addrTBankSel1c_2 ? $signed(dataInPre_13_re) : $signed(_GEN_1531); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1533 = 4'he == addrTBankSel1c_2 ? $signed(dataInPre_14_re) : $signed(_GEN_1532); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1534 = 4'hf == addrTBankSel1c_2 ? $signed(dataInPre_15_re) : $signed(_GEN_1533); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_15 = 16'sh0 - $signed(fftCalc_2_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_16 = io_fftMode ? $signed(fftCalc_2_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_15); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_17 = _T_12 ? $signed(fftCalc_2_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_16); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_2 = procState3c ? $signed(_writeDataTRPre3c_T_17) : $signed(fftCalc_2_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_24 = 16'sh0 - $signed(fftCalc_2_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_25 = io_fftMode ? $signed(_writeDataTIPre3c_T_24) : $signed(fftCalc_2_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_26 = _T_12 ? $signed(_writeDataTRPre3c_T_15) : $signed(_writeDataTIPre3c_T_25); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_2 = procState3c ? $signed(_writeDataTIPre3c_T_26) : $signed(fftCalc_2_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [3:0] _addrSBankSel3c_T_13 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_2_r :
    addrSBankSelKernel3c_2_r; // @[FFTEngine.scala 505:34]
  wire [3:0] _addrTBankSel3c_T_13 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_2_r : addrTBankSelKernel3c_2_r; // @[FFTEngine.scala 506:34]
  wire [3:0] _addrSBankSel3c_T_14 = procState3c ? addrSBankSelProc3c_2_r : addrSBankSelKernel3c_2_r; // @[FFTEngine.scala 508:34]
  wire [3:0] _addrTBankSel3c_T_14 = procState3c ? addrTBankSelProc3c_2_r : addrTBankSelKernel3c_2_r; // @[FFTEngine.scala 509:34]
  wire [3:0] addrSBankSel3c_2 = io_fftMode ? _addrSBankSel3c_T_13 : _addrSBankSel3c_T_14; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [3:0] addrTBankSel3c_2 = io_fftMode ? _addrTBankSel3c_T_13 : _addrTBankSel3c_T_14; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [3:0] _GEN_1553 = 4'h0 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1333; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1554 = 4'h1 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1334; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1555 = 4'h2 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1335; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1556 = 4'h3 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1336; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1557 = 4'h4 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1337; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1558 = 4'h5 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1338; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1559 = 4'h6 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1339; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1560 = 4'h7 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1340; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1561 = 4'h8 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1341; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1562 = 4'h9 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1342; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1563 = 4'ha == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1343; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1564 = 4'hb == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1344; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1565 = 4'hc == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1345; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1566 = 4'hd == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1346; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1567 = 4'he == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1347; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1568 = 4'hf == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1348; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_1569 = 4'h0 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1553; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1570 = 4'h1 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1554; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1571 = 4'h2 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1555; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1572 = 4'h3 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1556; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1573 = 4'h4 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1557; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1574 = 4'h5 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1558; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1575 = 4'h6 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1559; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1576 = 4'h7 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1560; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1577 = 4'h8 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1561; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1578 = 4'h9 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1562; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1579 = 4'ha == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1563; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1580 = 4'hb == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1564; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1581 = 4'hc == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1565; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1582 = 4'hd == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1566; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1583 = 4'he == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1567; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1584 = 4'hf == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1568; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_1585 = 4'h0 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1317; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1586 = 4'h1 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1318; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1587 = 4'h2 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1319; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1588 = 4'h3 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1320; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1589 = 4'h4 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1321; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1590 = 4'h5 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1322; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1591 = 4'h6 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1323; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1592 = 4'h7 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1324; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1593 = 4'h8 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1325; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1594 = 4'h9 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1326; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1595 = 4'ha == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1327; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1596 = 4'hb == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1328; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1597 = 4'hc == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1329; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1598 = 4'hd == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1330; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1599 = 4'he == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1331; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1600 = 4'hf == addrTBankSel_2 ? addrT_2[3:0] : _GEN_1332; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_1601 = 4'h0 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1585; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1602 = 4'h1 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1586; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1603 = 4'h2 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1587; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1604 = 4'h3 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1588; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1605 = 4'h4 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1589; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1606 = 4'h5 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1590; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1607 = 4'h6 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1591; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1608 = 4'h7 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1592; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1609 = 4'h8 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1593; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1610 = 4'h9 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1594; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1611 = 4'ha == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1595; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1612 = 4'hb == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1596; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1613 = 4'hc == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1597; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1614 = 4'hd == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1598; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1615 = 4'he == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1599; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1616 = 4'hf == addrSBankSel_2 ? addrS_2[3:0] : _GEN_1600; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_1617 = _srcBufferNext_T_3 ? _GEN_1569 : _GEN_1333; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1618 = _srcBufferNext_T_3 ? _GEN_1570 : _GEN_1334; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1619 = _srcBufferNext_T_3 ? _GEN_1571 : _GEN_1335; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1620 = _srcBufferNext_T_3 ? _GEN_1572 : _GEN_1336; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1621 = _srcBufferNext_T_3 ? _GEN_1573 : _GEN_1337; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1622 = _srcBufferNext_T_3 ? _GEN_1574 : _GEN_1338; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1623 = _srcBufferNext_T_3 ? _GEN_1575 : _GEN_1339; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1624 = _srcBufferNext_T_3 ? _GEN_1576 : _GEN_1340; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1625 = _srcBufferNext_T_3 ? _GEN_1577 : _GEN_1341; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1626 = _srcBufferNext_T_3 ? _GEN_1578 : _GEN_1342; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1627 = _srcBufferNext_T_3 ? _GEN_1579 : _GEN_1343; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1628 = _srcBufferNext_T_3 ? _GEN_1580 : _GEN_1344; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1629 = _srcBufferNext_T_3 ? _GEN_1581 : _GEN_1345; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1630 = _srcBufferNext_T_3 ? _GEN_1582 : _GEN_1346; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1631 = _srcBufferNext_T_3 ? _GEN_1583 : _GEN_1347; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1632 = _srcBufferNext_T_3 ? _GEN_1584 : _GEN_1348; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1633 = _srcBufferNext_T_3 ? _GEN_1317 : _GEN_1601; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1634 = _srcBufferNext_T_3 ? _GEN_1318 : _GEN_1602; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1635 = _srcBufferNext_T_3 ? _GEN_1319 : _GEN_1603; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1636 = _srcBufferNext_T_3 ? _GEN_1320 : _GEN_1604; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1637 = _srcBufferNext_T_3 ? _GEN_1321 : _GEN_1605; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1638 = _srcBufferNext_T_3 ? _GEN_1322 : _GEN_1606; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1639 = _srcBufferNext_T_3 ? _GEN_1323 : _GEN_1607; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1640 = _srcBufferNext_T_3 ? _GEN_1324 : _GEN_1608; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1641 = _srcBufferNext_T_3 ? _GEN_1325 : _GEN_1609; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1642 = _srcBufferNext_T_3 ? _GEN_1326 : _GEN_1610; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1643 = _srcBufferNext_T_3 ? _GEN_1327 : _GEN_1611; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1644 = _srcBufferNext_T_3 ? _GEN_1328 : _GEN_1612; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1645 = _srcBufferNext_T_3 ? _GEN_1329 : _GEN_1613; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1646 = _srcBufferNext_T_3 ? _GEN_1330 : _GEN_1614; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1647 = _srcBufferNext_T_3 ? _GEN_1331 : _GEN_1615; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1648 = _srcBufferNext_T_3 ? _GEN_1332 : _GEN_1616; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_1649 = ~_radixInit_T_11 ? _GEN_1617 : _GEN_1333; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1650 = ~_radixInit_T_11 ? _GEN_1618 : _GEN_1334; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1651 = ~_radixInit_T_11 ? _GEN_1619 : _GEN_1335; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1652 = ~_radixInit_T_11 ? _GEN_1620 : _GEN_1336; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1653 = ~_radixInit_T_11 ? _GEN_1621 : _GEN_1337; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1654 = ~_radixInit_T_11 ? _GEN_1622 : _GEN_1338; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1655 = ~_radixInit_T_11 ? _GEN_1623 : _GEN_1339; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1656 = ~_radixInit_T_11 ? _GEN_1624 : _GEN_1340; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1657 = ~_radixInit_T_11 ? _GEN_1625 : _GEN_1341; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1658 = ~_radixInit_T_11 ? _GEN_1626 : _GEN_1342; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1659 = ~_radixInit_T_11 ? _GEN_1627 : _GEN_1343; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1660 = ~_radixInit_T_11 ? _GEN_1628 : _GEN_1344; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1661 = ~_radixInit_T_11 ? _GEN_1629 : _GEN_1345; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1662 = ~_radixInit_T_11 ? _GEN_1630 : _GEN_1346; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1663 = ~_radixInit_T_11 ? _GEN_1631 : _GEN_1347; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1664 = ~_radixInit_T_11 ? _GEN_1632 : _GEN_1348; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1665 = ~_radixInit_T_11 ? _GEN_1633 : _GEN_1317; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1666 = ~_radixInit_T_11 ? _GEN_1634 : _GEN_1318; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1667 = ~_radixInit_T_11 ? _GEN_1635 : _GEN_1319; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1668 = ~_radixInit_T_11 ? _GEN_1636 : _GEN_1320; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1669 = ~_radixInit_T_11 ? _GEN_1637 : _GEN_1321; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1670 = ~_radixInit_T_11 ? _GEN_1638 : _GEN_1322; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1671 = ~_radixInit_T_11 ? _GEN_1639 : _GEN_1323; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1672 = ~_radixInit_T_11 ? _GEN_1640 : _GEN_1324; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1673 = ~_radixInit_T_11 ? _GEN_1641 : _GEN_1325; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1674 = ~_radixInit_T_11 ? _GEN_1642 : _GEN_1326; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1675 = ~_radixInit_T_11 ? _GEN_1643 : _GEN_1327; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1676 = ~_radixInit_T_11 ? _GEN_1644 : _GEN_1328; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1677 = ~_radixInit_T_11 ? _GEN_1645 : _GEN_1329; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1678 = ~_radixInit_T_11 ? _GEN_1646 : _GEN_1330; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1679 = ~_radixInit_T_11 ? _GEN_1647 : _GEN_1331; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1680 = ~_radixInit_T_11 ? _GEN_1648 : _GEN_1332; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_1681 = 4'h0 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1665; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1682 = 4'h1 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1666; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1683 = 4'h2 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1667; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1684 = 4'h3 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1668; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1685 = 4'h4 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1669; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1686 = 4'h5 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1670; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1687 = 4'h6 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1671; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1688 = 4'h7 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1672; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1689 = 4'h8 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1673; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1690 = 4'h9 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1674; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1691 = 4'ha == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1675; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1692 = 4'hb == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1676; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1693 = 4'hc == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1677; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1694 = 4'hd == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1678; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1695 = 4'he == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1679; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1696 = 4'hf == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1680; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_1697 = 4'h0 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1681; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1698 = 4'h1 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1682; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1699 = 4'h2 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1683; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1700 = 4'h3 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1684; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1701 = 4'h4 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1685; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1702 = 4'h5 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1686; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1703 = 4'h6 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1687; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1704 = 4'h7 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1688; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1705 = 4'h8 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1689; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1706 = 4'h9 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1690; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1707 = 4'ha == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1691; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1708 = 4'hb == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1692; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1709 = 4'hc == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1693; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1710 = 4'hd == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1694; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1711 = 4'he == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1695; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1712 = 4'hf == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1696; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_1713 = 4'h0 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1649; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1714 = 4'h1 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1650; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1715 = 4'h2 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1651; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1716 = 4'h3 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1652; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1717 = 4'h4 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1653; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1718 = 4'h5 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1654; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1719 = 4'h6 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1655; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1720 = 4'h7 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1656; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1721 = 4'h8 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1657; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1722 = 4'h9 == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1658; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1723 = 4'ha == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1659; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1724 = 4'hb == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1660; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1725 = 4'hc == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1661; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1726 = 4'hd == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1662; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1727 = 4'he == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1663; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1728 = 4'hf == addrTBankSel3c_2 ? addrT3c_2 : _GEN_1664; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_1729 = 4'h0 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1713; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1730 = 4'h1 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1714; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1731 = 4'h2 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1715; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1732 = 4'h3 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1716; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1733 = 4'h4 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1717; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1734 = 4'h5 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1718; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1735 = 4'h6 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1719; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1736 = 4'h7 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1720; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1737 = 4'h8 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1721; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1738 = 4'h9 == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1722; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1739 = 4'ha == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1723; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1740 = 4'hb == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1724; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1741 = 4'hc == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1725; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1742 = 4'hd == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1726; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1743 = 4'he == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1727; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1744 = 4'hf == addrSBankSel3c_2 ? addrS3c_2 : _GEN_1728; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_1745 = _srcBufferNext_T_3 ? _GEN_1697 : _GEN_1665; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1746 = _srcBufferNext_T_3 ? _GEN_1698 : _GEN_1666; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1747 = _srcBufferNext_T_3 ? _GEN_1699 : _GEN_1667; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1748 = _srcBufferNext_T_3 ? _GEN_1700 : _GEN_1668; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1749 = _srcBufferNext_T_3 ? _GEN_1701 : _GEN_1669; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1750 = _srcBufferNext_T_3 ? _GEN_1702 : _GEN_1670; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1751 = _srcBufferNext_T_3 ? _GEN_1703 : _GEN_1671; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1752 = _srcBufferNext_T_3 ? _GEN_1704 : _GEN_1672; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1753 = _srcBufferNext_T_3 ? _GEN_1705 : _GEN_1673; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1754 = _srcBufferNext_T_3 ? _GEN_1706 : _GEN_1674; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1755 = _srcBufferNext_T_3 ? _GEN_1707 : _GEN_1675; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1756 = _srcBufferNext_T_3 ? _GEN_1708 : _GEN_1676; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1757 = _srcBufferNext_T_3 ? _GEN_1709 : _GEN_1677; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1758 = _srcBufferNext_T_3 ? _GEN_1710 : _GEN_1678; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1759 = _srcBufferNext_T_3 ? _GEN_1711 : _GEN_1679; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1760 = _srcBufferNext_T_3 ? _GEN_1712 : _GEN_1680; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1761 = _srcBufferNext_T_3 ? _GEN_1649 : _GEN_1729; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1762 = _srcBufferNext_T_3 ? _GEN_1650 : _GEN_1730; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1763 = _srcBufferNext_T_3 ? _GEN_1651 : _GEN_1731; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1764 = _srcBufferNext_T_3 ? _GEN_1652 : _GEN_1732; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1765 = _srcBufferNext_T_3 ? _GEN_1653 : _GEN_1733; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1766 = _srcBufferNext_T_3 ? _GEN_1654 : _GEN_1734; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1767 = _srcBufferNext_T_3 ? _GEN_1655 : _GEN_1735; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1768 = _srcBufferNext_T_3 ? _GEN_1656 : _GEN_1736; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1769 = _srcBufferNext_T_3 ? _GEN_1657 : _GEN_1737; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1770 = _srcBufferNext_T_3 ? _GEN_1658 : _GEN_1738; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1771 = _srcBufferNext_T_3 ? _GEN_1659 : _GEN_1739; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1772 = _srcBufferNext_T_3 ? _GEN_1660 : _GEN_1740; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1773 = _srcBufferNext_T_3 ? _GEN_1661 : _GEN_1741; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1774 = _srcBufferNext_T_3 ? _GEN_1662 : _GEN_1742; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1775 = _srcBufferNext_T_3 ? _GEN_1663 : _GEN_1743; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1776 = _srcBufferNext_T_3 ? _GEN_1664 : _GEN_1744; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_1777 = ~procState3c ? _GEN_1745 : _GEN_1665; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1778 = ~procState3c ? _GEN_1746 : _GEN_1666; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1779 = ~procState3c ? _GEN_1747 : _GEN_1667; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1780 = ~procState3c ? _GEN_1748 : _GEN_1668; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1781 = ~procState3c ? _GEN_1749 : _GEN_1669; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1782 = ~procState3c ? _GEN_1750 : _GEN_1670; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1783 = ~procState3c ? _GEN_1751 : _GEN_1671; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1784 = ~procState3c ? _GEN_1752 : _GEN_1672; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1785 = ~procState3c ? _GEN_1753 : _GEN_1673; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1786 = ~procState3c ? _GEN_1754 : _GEN_1674; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1787 = ~procState3c ? _GEN_1755 : _GEN_1675; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1788 = ~procState3c ? _GEN_1756 : _GEN_1676; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1789 = ~procState3c ? _GEN_1757 : _GEN_1677; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1790 = ~procState3c ? _GEN_1758 : _GEN_1678; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1791 = ~procState3c ? _GEN_1759 : _GEN_1679; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1792 = ~procState3c ? _GEN_1760 : _GEN_1680; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1793 = ~procState3c ? _GEN_1761 : _GEN_1649; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1794 = ~procState3c ? _GEN_1762 : _GEN_1650; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1795 = ~procState3c ? _GEN_1763 : _GEN_1651; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1796 = ~procState3c ? _GEN_1764 : _GEN_1652; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1797 = ~procState3c ? _GEN_1765 : _GEN_1653; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1798 = ~procState3c ? _GEN_1766 : _GEN_1654; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1799 = ~procState3c ? _GEN_1767 : _GEN_1655; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1800 = ~procState3c ? _GEN_1768 : _GEN_1656; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1801 = ~procState3c ? _GEN_1769 : _GEN_1657; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1802 = ~procState3c ? _GEN_1770 : _GEN_1658; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1803 = ~procState3c ? _GEN_1771 : _GEN_1659; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1804 = ~procState3c ? _GEN_1772 : _GEN_1660; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1805 = ~procState3c ? _GEN_1773 : _GEN_1661; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1806 = ~procState3c ? _GEN_1774 : _GEN_1662; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1807 = ~procState3c ? _GEN_1775 : _GEN_1663; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_1808 = ~procState3c ? _GEN_1776 : _GEN_1664; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_2 = fftCalc_2_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_2 = writeDataTRPre3c_2[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_1809 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_2[14]}},_writeDataS3c_re_T_2}) : $signed(
    fftCalc_2_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_1810 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_2[14]}},_writeDataS3c_im_T_2}) : $signed(
    fftCalc_2_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_1814 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_2) : $signed(_GEN_1810); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_1818 = fftCalc_2_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_2_im = sameAddr3c ? $signed(_GEN_1814) : $signed(_GEN_1818); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_1811 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_2_im) : $signed(writeDataTIPre3c_2); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_1813 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_2_io_dataOutSR3c) : $signed(_GEN_1809); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_1817 = fftCalc_2_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_2_re = sameAddr3c ? $signed(_GEN_1813) : $signed(_GEN_1817); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_1812 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_2_re) : $signed(writeDataTRPre3c_2); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_1815 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_2_im) : $signed(_GEN_1811); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_1816 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_2_re) : $signed(_GEN_1812); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_8 = 16'sh0 - $signed(writeDataTIPre3c_2); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_1820 = _addrSBankSel3c_T_1 & addrTBankSel3c_2 == 4'h8 & addrT3c_2 == 4'h1 ? $signed(
    _writeDataT3c_im_T_8) : $signed(writeDataTIPre3c_2); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_18 = sameAddr3c ? $signed(_GEN_1813) : $signed(_GEN_1817); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_19 = sameAddr3c ? $signed(_GEN_1814) : $signed(_GEN_1818); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_20 = {_io_writeDataSram0Bank_0_T_19,_io_writeDataSram0Bank_0_T_18}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_21 = sameAddr3c ? $signed(_GEN_1816) : $signed(writeDataTRPre3c_2); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_22 = sameAddr3c ? $signed(_GEN_1815) : $signed(_GEN_1820); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_23 = {_io_writeDataSram0Bank_0_T_22,_io_writeDataSram0Bank_0_T_21}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_1825 = 4'h0 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1369; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1827 = 4'h0 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1825; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1829 = procState3c ? _GEN_1369 : _GEN_1827; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1831 = 4'h1 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1375; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1833 = 4'h1 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1831; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1835 = procState3c ? _GEN_1375 : _GEN_1833; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1837 = 4'h2 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1381; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1839 = 4'h2 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1837; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1841 = procState3c ? _GEN_1381 : _GEN_1839; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1843 = 4'h3 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1387; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1845 = 4'h3 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1843; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1847 = procState3c ? _GEN_1387 : _GEN_1845; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1849 = 4'h4 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1393; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1851 = 4'h4 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1849; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1853 = procState3c ? _GEN_1393 : _GEN_1851; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1855 = 4'h5 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1399; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1857 = 4'h5 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1855; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1859 = procState3c ? _GEN_1399 : _GEN_1857; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1861 = 4'h6 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1405; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1863 = 4'h6 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1861; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1865 = procState3c ? _GEN_1405 : _GEN_1863; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1867 = 4'h7 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1411; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1869 = 4'h7 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1867; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1871 = procState3c ? _GEN_1411 : _GEN_1869; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1873 = 4'h8 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1417; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1875 = 4'h8 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1873; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1877 = procState3c ? _GEN_1417 : _GEN_1875; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1879 = 4'h9 == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1423; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1881 = 4'h9 == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1879; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1883 = procState3c ? _GEN_1423 : _GEN_1881; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1885 = 4'ha == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1429; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1887 = 4'ha == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1885; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1889 = procState3c ? _GEN_1429 : _GEN_1887; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1891 = 4'hb == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1435; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1893 = 4'hb == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1891; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1895 = procState3c ? _GEN_1435 : _GEN_1893; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1897 = 4'hc == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1441; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1899 = 4'hc == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1897; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1901 = procState3c ? _GEN_1441 : _GEN_1899; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1903 = 4'hd == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1447; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1905 = 4'hd == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1903; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1907 = procState3c ? _GEN_1447 : _GEN_1905; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1909 = 4'he == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1453; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1911 = 4'he == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1909; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1913 = procState3c ? _GEN_1453 : _GEN_1911; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_1915 = 4'hf == addrTBankSel3c_2 ? _io_writeDataSram0Bank_0_T_23 : _GEN_1459; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_1917 = 4'hf == addrSBankSel3c_2 ? _io_writeDataSram0Bank_0_T_20 : _GEN_1915; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_1919 = procState3c ? _GEN_1459 : _GEN_1917; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_3; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_3; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_3; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_3; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_3; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_3; // @[Reg.scala 35:20]
  wire [3:0] _addrSBankSel_T_16 = _radixInit_T_11 ? addrSBankSelProc_3 : addrSBankSelKernel_3; // @[FFTEngine.scala 471:32]
  wire [3:0] _addrTBankSel_T_16 = _radixInit_T_11 ? addrTBankSelProc_3 : addrTBankSelKernel_3; // @[FFTEngine.scala 472:32]
  wire [3:0] _addrSBankSel_T_20 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_3 :
    addrSBankSelKernel_3; // @[FFTEngine.scala 474:32]
  wire [3:0] _addrTBankSel_T_20 = _addrSBankSel_T_4 ? addrTBankSelProc_3 : addrTBankSelKernel_3; // @[FFTEngine.scala 475:32]
  wire [3:0] addrSBankSel_3 = io_fftMode ? _addrSBankSel_T_16 : _addrSBankSel_T_20; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [3:0] addrTBankSel_3 = io_fftMode ? _addrTBankSel_T_16 : _addrTBankSel_T_20; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [3:0] addrSBankSel1c_3; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSel1c_3; // @[Reg.scala 35:20]
  wire [15:0] _GEN_1932 = 4'h1 == addrSBankSel1c_3 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1933 = 4'h2 == addrSBankSel1c_3 ? $signed(dataInPre_2_re) : $signed(_GEN_1932); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1934 = 4'h3 == addrSBankSel1c_3 ? $signed(dataInPre_3_re) : $signed(_GEN_1933); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1935 = 4'h4 == addrSBankSel1c_3 ? $signed(dataInPre_4_re) : $signed(_GEN_1934); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1936 = 4'h5 == addrSBankSel1c_3 ? $signed(dataInPre_5_re) : $signed(_GEN_1935); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1937 = 4'h6 == addrSBankSel1c_3 ? $signed(dataInPre_6_re) : $signed(_GEN_1936); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1938 = 4'h7 == addrSBankSel1c_3 ? $signed(dataInPre_7_re) : $signed(_GEN_1937); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1939 = 4'h8 == addrSBankSel1c_3 ? $signed(dataInPre_8_re) : $signed(_GEN_1938); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1940 = 4'h9 == addrSBankSel1c_3 ? $signed(dataInPre_9_re) : $signed(_GEN_1939); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1941 = 4'ha == addrSBankSel1c_3 ? $signed(dataInPre_10_re) : $signed(_GEN_1940); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1942 = 4'hb == addrSBankSel1c_3 ? $signed(dataInPre_11_re) : $signed(_GEN_1941); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1943 = 4'hc == addrSBankSel1c_3 ? $signed(dataInPre_12_re) : $signed(_GEN_1942); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1944 = 4'hd == addrSBankSel1c_3 ? $signed(dataInPre_13_re) : $signed(_GEN_1943); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1945 = 4'he == addrSBankSel1c_3 ? $signed(dataInPre_14_re) : $signed(_GEN_1944); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_1948 = 4'h1 == addrSBankSel1c_3 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1949 = 4'h2 == addrSBankSel1c_3 ? $signed(dataInPre_2_im) : $signed(_GEN_1948); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1950 = 4'h3 == addrSBankSel1c_3 ? $signed(dataInPre_3_im) : $signed(_GEN_1949); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1951 = 4'h4 == addrSBankSel1c_3 ? $signed(dataInPre_4_im) : $signed(_GEN_1950); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1952 = 4'h5 == addrSBankSel1c_3 ? $signed(dataInPre_5_im) : $signed(_GEN_1951); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1953 = 4'h6 == addrSBankSel1c_3 ? $signed(dataInPre_6_im) : $signed(_GEN_1952); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1954 = 4'h7 == addrSBankSel1c_3 ? $signed(dataInPre_7_im) : $signed(_GEN_1953); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1955 = 4'h8 == addrSBankSel1c_3 ? $signed(dataInPre_8_im) : $signed(_GEN_1954); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1956 = 4'h9 == addrSBankSel1c_3 ? $signed(dataInPre_9_im) : $signed(_GEN_1955); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1957 = 4'ha == addrSBankSel1c_3 ? $signed(dataInPre_10_im) : $signed(_GEN_1956); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1958 = 4'hb == addrSBankSel1c_3 ? $signed(dataInPre_11_im) : $signed(_GEN_1957); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1959 = 4'hc == addrSBankSel1c_3 ? $signed(dataInPre_12_im) : $signed(_GEN_1958); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1960 = 4'hd == addrSBankSel1c_3 ? $signed(dataInPre_13_im) : $signed(_GEN_1959); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1961 = 4'he == addrSBankSel1c_3 ? $signed(dataInPre_14_im) : $signed(_GEN_1960); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1962 = 4'hf == addrSBankSel1c_3 ? $signed(dataInPre_15_im) : $signed(_GEN_1961); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_1964 = 4'h1 == addrTBankSel1c_3 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1965 = 4'h2 == addrTBankSel1c_3 ? $signed(dataInPre_2_im) : $signed(_GEN_1964); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1966 = 4'h3 == addrTBankSel1c_3 ? $signed(dataInPre_3_im) : $signed(_GEN_1965); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1967 = 4'h4 == addrTBankSel1c_3 ? $signed(dataInPre_4_im) : $signed(_GEN_1966); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1968 = 4'h5 == addrTBankSel1c_3 ? $signed(dataInPre_5_im) : $signed(_GEN_1967); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1969 = 4'h6 == addrTBankSel1c_3 ? $signed(dataInPre_6_im) : $signed(_GEN_1968); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1970 = 4'h7 == addrTBankSel1c_3 ? $signed(dataInPre_7_im) : $signed(_GEN_1969); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1971 = 4'h8 == addrTBankSel1c_3 ? $signed(dataInPre_8_im) : $signed(_GEN_1970); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1972 = 4'h9 == addrTBankSel1c_3 ? $signed(dataInPre_9_im) : $signed(_GEN_1971); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1973 = 4'ha == addrTBankSel1c_3 ? $signed(dataInPre_10_im) : $signed(_GEN_1972); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1974 = 4'hb == addrTBankSel1c_3 ? $signed(dataInPre_11_im) : $signed(_GEN_1973); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1975 = 4'hc == addrTBankSel1c_3 ? $signed(dataInPre_12_im) : $signed(_GEN_1974); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1976 = 4'hd == addrTBankSel1c_3 ? $signed(dataInPre_13_im) : $signed(_GEN_1975); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1977 = 4'he == addrTBankSel1c_3 ? $signed(dataInPre_14_im) : $signed(_GEN_1976); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1978 = 4'hf == addrTBankSel1c_3 ? $signed(dataInPre_15_im) : $signed(_GEN_1977); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1980 = 4'h1 == addrTBankSel1c_3 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1981 = 4'h2 == addrTBankSel1c_3 ? $signed(dataInPre_2_re) : $signed(_GEN_1980); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1982 = 4'h3 == addrTBankSel1c_3 ? $signed(dataInPre_3_re) : $signed(_GEN_1981); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1983 = 4'h4 == addrTBankSel1c_3 ? $signed(dataInPre_4_re) : $signed(_GEN_1982); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1984 = 4'h5 == addrTBankSel1c_3 ? $signed(dataInPre_5_re) : $signed(_GEN_1983); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1985 = 4'h6 == addrTBankSel1c_3 ? $signed(dataInPre_6_re) : $signed(_GEN_1984); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1986 = 4'h7 == addrTBankSel1c_3 ? $signed(dataInPre_7_re) : $signed(_GEN_1985); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1987 = 4'h8 == addrTBankSel1c_3 ? $signed(dataInPre_8_re) : $signed(_GEN_1986); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1988 = 4'h9 == addrTBankSel1c_3 ? $signed(dataInPre_9_re) : $signed(_GEN_1987); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1989 = 4'ha == addrTBankSel1c_3 ? $signed(dataInPre_10_re) : $signed(_GEN_1988); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1990 = 4'hb == addrTBankSel1c_3 ? $signed(dataInPre_11_re) : $signed(_GEN_1989); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1991 = 4'hc == addrTBankSel1c_3 ? $signed(dataInPre_12_re) : $signed(_GEN_1990); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1992 = 4'hd == addrTBankSel1c_3 ? $signed(dataInPre_13_re) : $signed(_GEN_1991); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1993 = 4'he == addrTBankSel1c_3 ? $signed(dataInPre_14_re) : $signed(_GEN_1992); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_1994 = 4'hf == addrTBankSel1c_3 ? $signed(dataInPre_15_re) : $signed(_GEN_1993); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_21 = 16'sh0 - $signed(fftCalc_3_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_22 = io_fftMode ? $signed(fftCalc_3_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_21); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_23 = _T_12 ? $signed(fftCalc_3_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_22); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_3 = procState3c ? $signed(_writeDataTRPre3c_T_23) : $signed(fftCalc_3_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_33 = 16'sh0 - $signed(fftCalc_3_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_34 = io_fftMode ? $signed(_writeDataTIPre3c_T_33) : $signed(fftCalc_3_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_35 = _T_12 ? $signed(_writeDataTRPre3c_T_21) : $signed(_writeDataTIPre3c_T_34); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_3 = procState3c ? $signed(_writeDataTIPre3c_T_35) : $signed(fftCalc_3_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [3:0] _addrSBankSel3c_T_18 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_3_r :
    addrSBankSelKernel3c_3_r; // @[FFTEngine.scala 505:34]
  wire [3:0] _addrTBankSel3c_T_18 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_3_r : addrTBankSelKernel3c_3_r; // @[FFTEngine.scala 506:34]
  wire [3:0] _addrSBankSel3c_T_19 = procState3c ? addrSBankSelProc3c_3_r : addrSBankSelKernel3c_3_r; // @[FFTEngine.scala 508:34]
  wire [3:0] _addrTBankSel3c_T_19 = procState3c ? addrTBankSelProc3c_3_r : addrTBankSelKernel3c_3_r; // @[FFTEngine.scala 509:34]
  wire [3:0] addrSBankSel3c_3 = io_fftMode ? _addrSBankSel3c_T_18 : _addrSBankSel3c_T_19; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [3:0] addrTBankSel3c_3 = io_fftMode ? _addrTBankSel3c_T_18 : _addrTBankSel3c_T_19; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [3:0] _GEN_2013 = 4'h0 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1793; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2014 = 4'h1 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1794; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2015 = 4'h2 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1795; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2016 = 4'h3 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1796; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2017 = 4'h4 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1797; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2018 = 4'h5 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1798; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2019 = 4'h6 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1799; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2020 = 4'h7 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1800; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2021 = 4'h8 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1801; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2022 = 4'h9 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1802; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2023 = 4'ha == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1803; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2024 = 4'hb == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1804; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2025 = 4'hc == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1805; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2026 = 4'hd == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1806; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2027 = 4'he == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1807; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2028 = 4'hf == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1808; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2029 = 4'h0 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2013; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2030 = 4'h1 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2014; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2031 = 4'h2 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2015; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2032 = 4'h3 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2016; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2033 = 4'h4 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2017; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2034 = 4'h5 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2018; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2035 = 4'h6 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2019; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2036 = 4'h7 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2020; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2037 = 4'h8 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2021; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2038 = 4'h9 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2022; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2039 = 4'ha == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2023; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2040 = 4'hb == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2024; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2041 = 4'hc == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2025; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2042 = 4'hd == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2026; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2043 = 4'he == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2027; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2044 = 4'hf == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2028; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2045 = 4'h0 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1777; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2046 = 4'h1 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1778; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2047 = 4'h2 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1779; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2048 = 4'h3 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1780; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2049 = 4'h4 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1781; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2050 = 4'h5 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1782; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2051 = 4'h6 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1783; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2052 = 4'h7 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1784; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2053 = 4'h8 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1785; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2054 = 4'h9 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1786; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2055 = 4'ha == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1787; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2056 = 4'hb == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1788; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2057 = 4'hc == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1789; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2058 = 4'hd == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1790; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2059 = 4'he == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1791; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2060 = 4'hf == addrTBankSel_3 ? addrT_3[3:0] : _GEN_1792; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2061 = 4'h0 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2045; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2062 = 4'h1 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2046; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2063 = 4'h2 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2047; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2064 = 4'h3 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2048; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2065 = 4'h4 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2049; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2066 = 4'h5 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2050; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2067 = 4'h6 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2051; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2068 = 4'h7 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2052; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2069 = 4'h8 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2053; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2070 = 4'h9 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2054; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2071 = 4'ha == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2055; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2072 = 4'hb == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2056; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2073 = 4'hc == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2057; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2074 = 4'hd == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2058; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2075 = 4'he == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2059; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2076 = 4'hf == addrSBankSel_3 ? addrS_3[3:0] : _GEN_2060; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2077 = _srcBufferNext_T_3 ? _GEN_2029 : _GEN_1793; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2078 = _srcBufferNext_T_3 ? _GEN_2030 : _GEN_1794; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2079 = _srcBufferNext_T_3 ? _GEN_2031 : _GEN_1795; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2080 = _srcBufferNext_T_3 ? _GEN_2032 : _GEN_1796; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2081 = _srcBufferNext_T_3 ? _GEN_2033 : _GEN_1797; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2082 = _srcBufferNext_T_3 ? _GEN_2034 : _GEN_1798; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2083 = _srcBufferNext_T_3 ? _GEN_2035 : _GEN_1799; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2084 = _srcBufferNext_T_3 ? _GEN_2036 : _GEN_1800; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2085 = _srcBufferNext_T_3 ? _GEN_2037 : _GEN_1801; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2086 = _srcBufferNext_T_3 ? _GEN_2038 : _GEN_1802; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2087 = _srcBufferNext_T_3 ? _GEN_2039 : _GEN_1803; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2088 = _srcBufferNext_T_3 ? _GEN_2040 : _GEN_1804; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2089 = _srcBufferNext_T_3 ? _GEN_2041 : _GEN_1805; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2090 = _srcBufferNext_T_3 ? _GEN_2042 : _GEN_1806; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2091 = _srcBufferNext_T_3 ? _GEN_2043 : _GEN_1807; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2092 = _srcBufferNext_T_3 ? _GEN_2044 : _GEN_1808; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2093 = _srcBufferNext_T_3 ? _GEN_1777 : _GEN_2061; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2094 = _srcBufferNext_T_3 ? _GEN_1778 : _GEN_2062; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2095 = _srcBufferNext_T_3 ? _GEN_1779 : _GEN_2063; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2096 = _srcBufferNext_T_3 ? _GEN_1780 : _GEN_2064; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2097 = _srcBufferNext_T_3 ? _GEN_1781 : _GEN_2065; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2098 = _srcBufferNext_T_3 ? _GEN_1782 : _GEN_2066; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2099 = _srcBufferNext_T_3 ? _GEN_1783 : _GEN_2067; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2100 = _srcBufferNext_T_3 ? _GEN_1784 : _GEN_2068; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2101 = _srcBufferNext_T_3 ? _GEN_1785 : _GEN_2069; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2102 = _srcBufferNext_T_3 ? _GEN_1786 : _GEN_2070; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2103 = _srcBufferNext_T_3 ? _GEN_1787 : _GEN_2071; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2104 = _srcBufferNext_T_3 ? _GEN_1788 : _GEN_2072; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2105 = _srcBufferNext_T_3 ? _GEN_1789 : _GEN_2073; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2106 = _srcBufferNext_T_3 ? _GEN_1790 : _GEN_2074; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2107 = _srcBufferNext_T_3 ? _GEN_1791 : _GEN_2075; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2108 = _srcBufferNext_T_3 ? _GEN_1792 : _GEN_2076; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2109 = ~_radixInit_T_11 ? _GEN_2077 : _GEN_1793; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2110 = ~_radixInit_T_11 ? _GEN_2078 : _GEN_1794; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2111 = ~_radixInit_T_11 ? _GEN_2079 : _GEN_1795; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2112 = ~_radixInit_T_11 ? _GEN_2080 : _GEN_1796; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2113 = ~_radixInit_T_11 ? _GEN_2081 : _GEN_1797; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2114 = ~_radixInit_T_11 ? _GEN_2082 : _GEN_1798; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2115 = ~_radixInit_T_11 ? _GEN_2083 : _GEN_1799; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2116 = ~_radixInit_T_11 ? _GEN_2084 : _GEN_1800; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2117 = ~_radixInit_T_11 ? _GEN_2085 : _GEN_1801; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2118 = ~_radixInit_T_11 ? _GEN_2086 : _GEN_1802; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2119 = ~_radixInit_T_11 ? _GEN_2087 : _GEN_1803; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2120 = ~_radixInit_T_11 ? _GEN_2088 : _GEN_1804; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2121 = ~_radixInit_T_11 ? _GEN_2089 : _GEN_1805; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2122 = ~_radixInit_T_11 ? _GEN_2090 : _GEN_1806; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2123 = ~_radixInit_T_11 ? _GEN_2091 : _GEN_1807; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2124 = ~_radixInit_T_11 ? _GEN_2092 : _GEN_1808; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2125 = ~_radixInit_T_11 ? _GEN_2093 : _GEN_1777; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2126 = ~_radixInit_T_11 ? _GEN_2094 : _GEN_1778; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2127 = ~_radixInit_T_11 ? _GEN_2095 : _GEN_1779; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2128 = ~_radixInit_T_11 ? _GEN_2096 : _GEN_1780; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2129 = ~_radixInit_T_11 ? _GEN_2097 : _GEN_1781; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2130 = ~_radixInit_T_11 ? _GEN_2098 : _GEN_1782; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2131 = ~_radixInit_T_11 ? _GEN_2099 : _GEN_1783; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2132 = ~_radixInit_T_11 ? _GEN_2100 : _GEN_1784; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2133 = ~_radixInit_T_11 ? _GEN_2101 : _GEN_1785; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2134 = ~_radixInit_T_11 ? _GEN_2102 : _GEN_1786; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2135 = ~_radixInit_T_11 ? _GEN_2103 : _GEN_1787; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2136 = ~_radixInit_T_11 ? _GEN_2104 : _GEN_1788; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2137 = ~_radixInit_T_11 ? _GEN_2105 : _GEN_1789; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2138 = ~_radixInit_T_11 ? _GEN_2106 : _GEN_1790; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2139 = ~_radixInit_T_11 ? _GEN_2107 : _GEN_1791; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2140 = ~_radixInit_T_11 ? _GEN_2108 : _GEN_1792; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2141 = 4'h0 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2125; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2142 = 4'h1 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2126; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2143 = 4'h2 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2127; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2144 = 4'h3 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2128; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2145 = 4'h4 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2129; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2146 = 4'h5 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2130; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2147 = 4'h6 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2131; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2148 = 4'h7 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2132; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2149 = 4'h8 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2133; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2150 = 4'h9 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2134; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2151 = 4'ha == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2135; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2152 = 4'hb == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2136; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2153 = 4'hc == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2137; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2154 = 4'hd == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2138; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2155 = 4'he == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2139; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2156 = 4'hf == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2140; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2157 = 4'h0 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2141; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2158 = 4'h1 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2142; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2159 = 4'h2 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2143; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2160 = 4'h3 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2144; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2161 = 4'h4 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2145; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2162 = 4'h5 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2146; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2163 = 4'h6 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2147; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2164 = 4'h7 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2148; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2165 = 4'h8 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2149; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2166 = 4'h9 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2150; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2167 = 4'ha == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2151; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2168 = 4'hb == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2152; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2169 = 4'hc == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2153; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2170 = 4'hd == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2154; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2171 = 4'he == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2155; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2172 = 4'hf == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2156; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2173 = 4'h0 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2109; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2174 = 4'h1 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2110; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2175 = 4'h2 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2111; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2176 = 4'h3 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2112; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2177 = 4'h4 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2113; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2178 = 4'h5 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2114; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2179 = 4'h6 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2115; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2180 = 4'h7 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2116; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2181 = 4'h8 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2117; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2182 = 4'h9 == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2118; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2183 = 4'ha == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2119; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2184 = 4'hb == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2120; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2185 = 4'hc == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2121; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2186 = 4'hd == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2122; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2187 = 4'he == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2123; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2188 = 4'hf == addrTBankSel3c_3 ? addrT3c_3 : _GEN_2124; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2189 = 4'h0 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2173; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2190 = 4'h1 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2174; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2191 = 4'h2 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2175; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2192 = 4'h3 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2176; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2193 = 4'h4 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2177; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2194 = 4'h5 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2178; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2195 = 4'h6 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2179; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2196 = 4'h7 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2180; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2197 = 4'h8 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2181; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2198 = 4'h9 == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2182; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2199 = 4'ha == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2183; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2200 = 4'hb == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2184; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2201 = 4'hc == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2185; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2202 = 4'hd == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2186; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2203 = 4'he == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2187; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2204 = 4'hf == addrSBankSel3c_3 ? addrS3c_3 : _GEN_2188; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2205 = _srcBufferNext_T_3 ? _GEN_2157 : _GEN_2125; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2206 = _srcBufferNext_T_3 ? _GEN_2158 : _GEN_2126; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2207 = _srcBufferNext_T_3 ? _GEN_2159 : _GEN_2127; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2208 = _srcBufferNext_T_3 ? _GEN_2160 : _GEN_2128; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2209 = _srcBufferNext_T_3 ? _GEN_2161 : _GEN_2129; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2210 = _srcBufferNext_T_3 ? _GEN_2162 : _GEN_2130; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2211 = _srcBufferNext_T_3 ? _GEN_2163 : _GEN_2131; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2212 = _srcBufferNext_T_3 ? _GEN_2164 : _GEN_2132; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2213 = _srcBufferNext_T_3 ? _GEN_2165 : _GEN_2133; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2214 = _srcBufferNext_T_3 ? _GEN_2166 : _GEN_2134; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2215 = _srcBufferNext_T_3 ? _GEN_2167 : _GEN_2135; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2216 = _srcBufferNext_T_3 ? _GEN_2168 : _GEN_2136; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2217 = _srcBufferNext_T_3 ? _GEN_2169 : _GEN_2137; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2218 = _srcBufferNext_T_3 ? _GEN_2170 : _GEN_2138; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2219 = _srcBufferNext_T_3 ? _GEN_2171 : _GEN_2139; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2220 = _srcBufferNext_T_3 ? _GEN_2172 : _GEN_2140; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2221 = _srcBufferNext_T_3 ? _GEN_2109 : _GEN_2189; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2222 = _srcBufferNext_T_3 ? _GEN_2110 : _GEN_2190; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2223 = _srcBufferNext_T_3 ? _GEN_2111 : _GEN_2191; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2224 = _srcBufferNext_T_3 ? _GEN_2112 : _GEN_2192; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2225 = _srcBufferNext_T_3 ? _GEN_2113 : _GEN_2193; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2226 = _srcBufferNext_T_3 ? _GEN_2114 : _GEN_2194; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2227 = _srcBufferNext_T_3 ? _GEN_2115 : _GEN_2195; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2228 = _srcBufferNext_T_3 ? _GEN_2116 : _GEN_2196; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2229 = _srcBufferNext_T_3 ? _GEN_2117 : _GEN_2197; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2230 = _srcBufferNext_T_3 ? _GEN_2118 : _GEN_2198; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2231 = _srcBufferNext_T_3 ? _GEN_2119 : _GEN_2199; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2232 = _srcBufferNext_T_3 ? _GEN_2120 : _GEN_2200; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2233 = _srcBufferNext_T_3 ? _GEN_2121 : _GEN_2201; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2234 = _srcBufferNext_T_3 ? _GEN_2122 : _GEN_2202; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2235 = _srcBufferNext_T_3 ? _GEN_2123 : _GEN_2203; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2236 = _srcBufferNext_T_3 ? _GEN_2124 : _GEN_2204; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2237 = ~procState3c ? _GEN_2205 : _GEN_2125; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2238 = ~procState3c ? _GEN_2206 : _GEN_2126; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2239 = ~procState3c ? _GEN_2207 : _GEN_2127; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2240 = ~procState3c ? _GEN_2208 : _GEN_2128; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2241 = ~procState3c ? _GEN_2209 : _GEN_2129; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2242 = ~procState3c ? _GEN_2210 : _GEN_2130; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2243 = ~procState3c ? _GEN_2211 : _GEN_2131; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2244 = ~procState3c ? _GEN_2212 : _GEN_2132; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2245 = ~procState3c ? _GEN_2213 : _GEN_2133; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2246 = ~procState3c ? _GEN_2214 : _GEN_2134; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2247 = ~procState3c ? _GEN_2215 : _GEN_2135; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2248 = ~procState3c ? _GEN_2216 : _GEN_2136; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2249 = ~procState3c ? _GEN_2217 : _GEN_2137; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2250 = ~procState3c ? _GEN_2218 : _GEN_2138; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2251 = ~procState3c ? _GEN_2219 : _GEN_2139; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2252 = ~procState3c ? _GEN_2220 : _GEN_2140; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2253 = ~procState3c ? _GEN_2221 : _GEN_2109; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2254 = ~procState3c ? _GEN_2222 : _GEN_2110; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2255 = ~procState3c ? _GEN_2223 : _GEN_2111; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2256 = ~procState3c ? _GEN_2224 : _GEN_2112; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2257 = ~procState3c ? _GEN_2225 : _GEN_2113; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2258 = ~procState3c ? _GEN_2226 : _GEN_2114; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2259 = ~procState3c ? _GEN_2227 : _GEN_2115; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2260 = ~procState3c ? _GEN_2228 : _GEN_2116; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2261 = ~procState3c ? _GEN_2229 : _GEN_2117; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2262 = ~procState3c ? _GEN_2230 : _GEN_2118; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2263 = ~procState3c ? _GEN_2231 : _GEN_2119; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2264 = ~procState3c ? _GEN_2232 : _GEN_2120; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2265 = ~procState3c ? _GEN_2233 : _GEN_2121; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2266 = ~procState3c ? _GEN_2234 : _GEN_2122; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2267 = ~procState3c ? _GEN_2235 : _GEN_2123; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2268 = ~procState3c ? _GEN_2236 : _GEN_2124; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_3 = fftCalc_3_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_3 = writeDataTRPre3c_3[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_2269 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_3[14]}},_writeDataS3c_re_T_3}) : $signed(
    fftCalc_3_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_2270 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_3[14]}},_writeDataS3c_im_T_3}) : $signed(
    fftCalc_3_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_2274 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_3) : $signed(_GEN_2270); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_2278 = fftCalc_3_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_3_im = sameAddr3c ? $signed(_GEN_2274) : $signed(_GEN_2278); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_2271 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_3_im) : $signed(writeDataTIPre3c_3); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_2273 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_3_io_dataOutSR3c) : $signed(_GEN_2269); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_2277 = fftCalc_3_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_3_re = sameAddr3c ? $signed(_GEN_2273) : $signed(_GEN_2277); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_2272 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_3_re) : $signed(writeDataTRPre3c_3); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_2275 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_3_im) : $signed(_GEN_2271); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_2276 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_3_re) : $signed(_GEN_2272); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_11 = 16'sh0 - $signed(writeDataTIPre3c_3); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_2280 = _addrSBankSel3c_T_1 & addrTBankSel3c_3 == 4'h8 & addrT3c_3 == 4'h1 ? $signed(
    _writeDataT3c_im_T_11) : $signed(writeDataTIPre3c_3); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_24 = sameAddr3c ? $signed(_GEN_2273) : $signed(_GEN_2277); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_25 = sameAddr3c ? $signed(_GEN_2274) : $signed(_GEN_2278); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_26 = {_io_writeDataSram0Bank_0_T_25,_io_writeDataSram0Bank_0_T_24}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_27 = sameAddr3c ? $signed(_GEN_2276) : $signed(writeDataTRPre3c_3); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_28 = sameAddr3c ? $signed(_GEN_2275) : $signed(_GEN_2280); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_29 = {_io_writeDataSram0Bank_0_T_28,_io_writeDataSram0Bank_0_T_27}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_2285 = 4'h0 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1829; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2287 = 4'h0 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2285; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2289 = procState3c ? _GEN_1829 : _GEN_2287; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2291 = 4'h1 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1835; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2293 = 4'h1 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2291; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2295 = procState3c ? _GEN_1835 : _GEN_2293; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2297 = 4'h2 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1841; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2299 = 4'h2 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2297; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2301 = procState3c ? _GEN_1841 : _GEN_2299; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2303 = 4'h3 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1847; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2305 = 4'h3 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2303; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2307 = procState3c ? _GEN_1847 : _GEN_2305; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2309 = 4'h4 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1853; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2311 = 4'h4 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2309; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2313 = procState3c ? _GEN_1853 : _GEN_2311; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2315 = 4'h5 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1859; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2317 = 4'h5 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2315; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2319 = procState3c ? _GEN_1859 : _GEN_2317; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2321 = 4'h6 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1865; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2323 = 4'h6 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2321; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2325 = procState3c ? _GEN_1865 : _GEN_2323; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2327 = 4'h7 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1871; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2329 = 4'h7 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2327; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2331 = procState3c ? _GEN_1871 : _GEN_2329; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2333 = 4'h8 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1877; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2335 = 4'h8 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2333; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2337 = procState3c ? _GEN_1877 : _GEN_2335; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2339 = 4'h9 == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1883; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2341 = 4'h9 == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2339; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2343 = procState3c ? _GEN_1883 : _GEN_2341; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2345 = 4'ha == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1889; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2347 = 4'ha == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2345; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2349 = procState3c ? _GEN_1889 : _GEN_2347; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2351 = 4'hb == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1895; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2353 = 4'hb == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2351; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2355 = procState3c ? _GEN_1895 : _GEN_2353; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2357 = 4'hc == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1901; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2359 = 4'hc == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2357; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2361 = procState3c ? _GEN_1901 : _GEN_2359; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2363 = 4'hd == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1907; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2365 = 4'hd == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2363; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2367 = procState3c ? _GEN_1907 : _GEN_2365; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2369 = 4'he == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1913; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2371 = 4'he == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2369; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2373 = procState3c ? _GEN_1913 : _GEN_2371; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2375 = 4'hf == addrTBankSel3c_3 ? _io_writeDataSram0Bank_0_T_29 : _GEN_1919; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2377 = 4'hf == addrSBankSel3c_3 ? _io_writeDataSram0Bank_0_T_26 : _GEN_2375; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2379 = procState3c ? _GEN_1919 : _GEN_2377; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_4; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_4; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_4; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_4; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_4; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_4; // @[Reg.scala 35:20]
  wire [3:0] _addrSBankSel_T_21 = _radixInit_T_11 ? addrSBankSelProc_4 : addrSBankSelKernel_4; // @[FFTEngine.scala 471:32]
  wire [3:0] _addrTBankSel_T_21 = _radixInit_T_11 ? addrTBankSelProc_4 : addrTBankSelKernel_4; // @[FFTEngine.scala 472:32]
  wire [3:0] _addrSBankSel_T_25 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_4 :
    addrSBankSelKernel_4; // @[FFTEngine.scala 474:32]
  wire [3:0] _addrTBankSel_T_25 = _addrSBankSel_T_4 ? addrTBankSelProc_4 : addrTBankSelKernel_4; // @[FFTEngine.scala 475:32]
  wire [3:0] addrSBankSel_4 = io_fftMode ? _addrSBankSel_T_21 : _addrSBankSel_T_25; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [3:0] addrTBankSel_4 = io_fftMode ? _addrTBankSel_T_21 : _addrTBankSel_T_25; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [3:0] addrSBankSel1c_4; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSel1c_4; // @[Reg.scala 35:20]
  wire [15:0] _GEN_2392 = 4'h1 == addrSBankSel1c_4 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2393 = 4'h2 == addrSBankSel1c_4 ? $signed(dataInPre_2_re) : $signed(_GEN_2392); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2394 = 4'h3 == addrSBankSel1c_4 ? $signed(dataInPre_3_re) : $signed(_GEN_2393); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2395 = 4'h4 == addrSBankSel1c_4 ? $signed(dataInPre_4_re) : $signed(_GEN_2394); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2396 = 4'h5 == addrSBankSel1c_4 ? $signed(dataInPre_5_re) : $signed(_GEN_2395); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2397 = 4'h6 == addrSBankSel1c_4 ? $signed(dataInPre_6_re) : $signed(_GEN_2396); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2398 = 4'h7 == addrSBankSel1c_4 ? $signed(dataInPre_7_re) : $signed(_GEN_2397); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2399 = 4'h8 == addrSBankSel1c_4 ? $signed(dataInPre_8_re) : $signed(_GEN_2398); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2400 = 4'h9 == addrSBankSel1c_4 ? $signed(dataInPre_9_re) : $signed(_GEN_2399); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2401 = 4'ha == addrSBankSel1c_4 ? $signed(dataInPre_10_re) : $signed(_GEN_2400); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2402 = 4'hb == addrSBankSel1c_4 ? $signed(dataInPre_11_re) : $signed(_GEN_2401); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2403 = 4'hc == addrSBankSel1c_4 ? $signed(dataInPre_12_re) : $signed(_GEN_2402); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2404 = 4'hd == addrSBankSel1c_4 ? $signed(dataInPre_13_re) : $signed(_GEN_2403); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2405 = 4'he == addrSBankSel1c_4 ? $signed(dataInPre_14_re) : $signed(_GEN_2404); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2408 = 4'h1 == addrSBankSel1c_4 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2409 = 4'h2 == addrSBankSel1c_4 ? $signed(dataInPre_2_im) : $signed(_GEN_2408); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2410 = 4'h3 == addrSBankSel1c_4 ? $signed(dataInPre_3_im) : $signed(_GEN_2409); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2411 = 4'h4 == addrSBankSel1c_4 ? $signed(dataInPre_4_im) : $signed(_GEN_2410); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2412 = 4'h5 == addrSBankSel1c_4 ? $signed(dataInPre_5_im) : $signed(_GEN_2411); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2413 = 4'h6 == addrSBankSel1c_4 ? $signed(dataInPre_6_im) : $signed(_GEN_2412); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2414 = 4'h7 == addrSBankSel1c_4 ? $signed(dataInPre_7_im) : $signed(_GEN_2413); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2415 = 4'h8 == addrSBankSel1c_4 ? $signed(dataInPre_8_im) : $signed(_GEN_2414); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2416 = 4'h9 == addrSBankSel1c_4 ? $signed(dataInPre_9_im) : $signed(_GEN_2415); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2417 = 4'ha == addrSBankSel1c_4 ? $signed(dataInPre_10_im) : $signed(_GEN_2416); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2418 = 4'hb == addrSBankSel1c_4 ? $signed(dataInPre_11_im) : $signed(_GEN_2417); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2419 = 4'hc == addrSBankSel1c_4 ? $signed(dataInPre_12_im) : $signed(_GEN_2418); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2420 = 4'hd == addrSBankSel1c_4 ? $signed(dataInPre_13_im) : $signed(_GEN_2419); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2421 = 4'he == addrSBankSel1c_4 ? $signed(dataInPre_14_im) : $signed(_GEN_2420); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2422 = 4'hf == addrSBankSel1c_4 ? $signed(dataInPre_15_im) : $signed(_GEN_2421); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2424 = 4'h1 == addrTBankSel1c_4 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2425 = 4'h2 == addrTBankSel1c_4 ? $signed(dataInPre_2_im) : $signed(_GEN_2424); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2426 = 4'h3 == addrTBankSel1c_4 ? $signed(dataInPre_3_im) : $signed(_GEN_2425); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2427 = 4'h4 == addrTBankSel1c_4 ? $signed(dataInPre_4_im) : $signed(_GEN_2426); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2428 = 4'h5 == addrTBankSel1c_4 ? $signed(dataInPre_5_im) : $signed(_GEN_2427); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2429 = 4'h6 == addrTBankSel1c_4 ? $signed(dataInPre_6_im) : $signed(_GEN_2428); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2430 = 4'h7 == addrTBankSel1c_4 ? $signed(dataInPre_7_im) : $signed(_GEN_2429); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2431 = 4'h8 == addrTBankSel1c_4 ? $signed(dataInPre_8_im) : $signed(_GEN_2430); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2432 = 4'h9 == addrTBankSel1c_4 ? $signed(dataInPre_9_im) : $signed(_GEN_2431); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2433 = 4'ha == addrTBankSel1c_4 ? $signed(dataInPre_10_im) : $signed(_GEN_2432); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2434 = 4'hb == addrTBankSel1c_4 ? $signed(dataInPre_11_im) : $signed(_GEN_2433); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2435 = 4'hc == addrTBankSel1c_4 ? $signed(dataInPre_12_im) : $signed(_GEN_2434); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2436 = 4'hd == addrTBankSel1c_4 ? $signed(dataInPre_13_im) : $signed(_GEN_2435); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2437 = 4'he == addrTBankSel1c_4 ? $signed(dataInPre_14_im) : $signed(_GEN_2436); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2438 = 4'hf == addrTBankSel1c_4 ? $signed(dataInPre_15_im) : $signed(_GEN_2437); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2440 = 4'h1 == addrTBankSel1c_4 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2441 = 4'h2 == addrTBankSel1c_4 ? $signed(dataInPre_2_re) : $signed(_GEN_2440); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2442 = 4'h3 == addrTBankSel1c_4 ? $signed(dataInPre_3_re) : $signed(_GEN_2441); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2443 = 4'h4 == addrTBankSel1c_4 ? $signed(dataInPre_4_re) : $signed(_GEN_2442); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2444 = 4'h5 == addrTBankSel1c_4 ? $signed(dataInPre_5_re) : $signed(_GEN_2443); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2445 = 4'h6 == addrTBankSel1c_4 ? $signed(dataInPre_6_re) : $signed(_GEN_2444); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2446 = 4'h7 == addrTBankSel1c_4 ? $signed(dataInPre_7_re) : $signed(_GEN_2445); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2447 = 4'h8 == addrTBankSel1c_4 ? $signed(dataInPre_8_re) : $signed(_GEN_2446); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2448 = 4'h9 == addrTBankSel1c_4 ? $signed(dataInPre_9_re) : $signed(_GEN_2447); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2449 = 4'ha == addrTBankSel1c_4 ? $signed(dataInPre_10_re) : $signed(_GEN_2448); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2450 = 4'hb == addrTBankSel1c_4 ? $signed(dataInPre_11_re) : $signed(_GEN_2449); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2451 = 4'hc == addrTBankSel1c_4 ? $signed(dataInPre_12_re) : $signed(_GEN_2450); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2452 = 4'hd == addrTBankSel1c_4 ? $signed(dataInPre_13_re) : $signed(_GEN_2451); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2453 = 4'he == addrTBankSel1c_4 ? $signed(dataInPre_14_re) : $signed(_GEN_2452); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2454 = 4'hf == addrTBankSel1c_4 ? $signed(dataInPre_15_re) : $signed(_GEN_2453); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_27 = 16'sh0 - $signed(fftCalc_4_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_28 = io_fftMode ? $signed(fftCalc_4_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_27); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_29 = _T_12 ? $signed(fftCalc_4_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_28); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_4 = procState3c ? $signed(_writeDataTRPre3c_T_29) : $signed(fftCalc_4_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_42 = 16'sh0 - $signed(fftCalc_4_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_43 = io_fftMode ? $signed(_writeDataTIPre3c_T_42) : $signed(fftCalc_4_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_44 = _T_12 ? $signed(_writeDataTRPre3c_T_27) : $signed(_writeDataTIPre3c_T_43); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_4 = procState3c ? $signed(_writeDataTIPre3c_T_44) : $signed(fftCalc_4_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [3:0] _addrSBankSel3c_T_23 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_4_r :
    addrSBankSelKernel3c_4_r; // @[FFTEngine.scala 505:34]
  wire [3:0] _addrTBankSel3c_T_23 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_4_r : addrTBankSelKernel3c_4_r; // @[FFTEngine.scala 506:34]
  wire [3:0] _addrSBankSel3c_T_24 = procState3c ? addrSBankSelProc3c_4_r : addrSBankSelKernel3c_4_r; // @[FFTEngine.scala 508:34]
  wire [3:0] _addrTBankSel3c_T_24 = procState3c ? addrTBankSelProc3c_4_r : addrTBankSelKernel3c_4_r; // @[FFTEngine.scala 509:34]
  wire [3:0] addrSBankSel3c_4 = io_fftMode ? _addrSBankSel3c_T_23 : _addrSBankSel3c_T_24; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [3:0] addrTBankSel3c_4 = io_fftMode ? _addrTBankSel3c_T_23 : _addrTBankSel3c_T_24; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [3:0] _GEN_2473 = 4'h0 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2253; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2474 = 4'h1 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2254; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2475 = 4'h2 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2255; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2476 = 4'h3 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2256; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2477 = 4'h4 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2257; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2478 = 4'h5 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2258; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2479 = 4'h6 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2259; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2480 = 4'h7 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2260; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2481 = 4'h8 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2261; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2482 = 4'h9 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2262; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2483 = 4'ha == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2263; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2484 = 4'hb == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2264; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2485 = 4'hc == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2265; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2486 = 4'hd == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2266; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2487 = 4'he == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2267; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2488 = 4'hf == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2268; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2489 = 4'h0 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2473; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2490 = 4'h1 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2474; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2491 = 4'h2 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2475; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2492 = 4'h3 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2476; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2493 = 4'h4 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2477; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2494 = 4'h5 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2478; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2495 = 4'h6 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2479; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2496 = 4'h7 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2480; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2497 = 4'h8 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2481; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2498 = 4'h9 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2482; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2499 = 4'ha == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2483; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2500 = 4'hb == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2484; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2501 = 4'hc == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2485; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2502 = 4'hd == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2486; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2503 = 4'he == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2487; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2504 = 4'hf == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2488; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2505 = 4'h0 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2237; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2506 = 4'h1 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2238; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2507 = 4'h2 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2239; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2508 = 4'h3 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2240; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2509 = 4'h4 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2241; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2510 = 4'h5 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2242; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2511 = 4'h6 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2243; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2512 = 4'h7 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2244; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2513 = 4'h8 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2245; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2514 = 4'h9 == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2246; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2515 = 4'ha == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2247; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2516 = 4'hb == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2248; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2517 = 4'hc == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2249; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2518 = 4'hd == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2250; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2519 = 4'he == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2251; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2520 = 4'hf == addrTBankSel_4 ? addrT_4[3:0] : _GEN_2252; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2521 = 4'h0 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2505; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2522 = 4'h1 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2506; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2523 = 4'h2 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2507; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2524 = 4'h3 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2508; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2525 = 4'h4 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2509; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2526 = 4'h5 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2510; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2527 = 4'h6 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2511; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2528 = 4'h7 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2512; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2529 = 4'h8 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2513; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2530 = 4'h9 == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2514; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2531 = 4'ha == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2515; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2532 = 4'hb == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2516; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2533 = 4'hc == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2517; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2534 = 4'hd == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2518; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2535 = 4'he == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2519; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2536 = 4'hf == addrSBankSel_4 ? addrS_4[3:0] : _GEN_2520; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2537 = _srcBufferNext_T_3 ? _GEN_2489 : _GEN_2253; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2538 = _srcBufferNext_T_3 ? _GEN_2490 : _GEN_2254; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2539 = _srcBufferNext_T_3 ? _GEN_2491 : _GEN_2255; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2540 = _srcBufferNext_T_3 ? _GEN_2492 : _GEN_2256; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2541 = _srcBufferNext_T_3 ? _GEN_2493 : _GEN_2257; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2542 = _srcBufferNext_T_3 ? _GEN_2494 : _GEN_2258; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2543 = _srcBufferNext_T_3 ? _GEN_2495 : _GEN_2259; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2544 = _srcBufferNext_T_3 ? _GEN_2496 : _GEN_2260; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2545 = _srcBufferNext_T_3 ? _GEN_2497 : _GEN_2261; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2546 = _srcBufferNext_T_3 ? _GEN_2498 : _GEN_2262; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2547 = _srcBufferNext_T_3 ? _GEN_2499 : _GEN_2263; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2548 = _srcBufferNext_T_3 ? _GEN_2500 : _GEN_2264; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2549 = _srcBufferNext_T_3 ? _GEN_2501 : _GEN_2265; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2550 = _srcBufferNext_T_3 ? _GEN_2502 : _GEN_2266; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2551 = _srcBufferNext_T_3 ? _GEN_2503 : _GEN_2267; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2552 = _srcBufferNext_T_3 ? _GEN_2504 : _GEN_2268; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2553 = _srcBufferNext_T_3 ? _GEN_2237 : _GEN_2521; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2554 = _srcBufferNext_T_3 ? _GEN_2238 : _GEN_2522; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2555 = _srcBufferNext_T_3 ? _GEN_2239 : _GEN_2523; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2556 = _srcBufferNext_T_3 ? _GEN_2240 : _GEN_2524; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2557 = _srcBufferNext_T_3 ? _GEN_2241 : _GEN_2525; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2558 = _srcBufferNext_T_3 ? _GEN_2242 : _GEN_2526; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2559 = _srcBufferNext_T_3 ? _GEN_2243 : _GEN_2527; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2560 = _srcBufferNext_T_3 ? _GEN_2244 : _GEN_2528; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2561 = _srcBufferNext_T_3 ? _GEN_2245 : _GEN_2529; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2562 = _srcBufferNext_T_3 ? _GEN_2246 : _GEN_2530; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2563 = _srcBufferNext_T_3 ? _GEN_2247 : _GEN_2531; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2564 = _srcBufferNext_T_3 ? _GEN_2248 : _GEN_2532; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2565 = _srcBufferNext_T_3 ? _GEN_2249 : _GEN_2533; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2566 = _srcBufferNext_T_3 ? _GEN_2250 : _GEN_2534; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2567 = _srcBufferNext_T_3 ? _GEN_2251 : _GEN_2535; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2568 = _srcBufferNext_T_3 ? _GEN_2252 : _GEN_2536; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2569 = ~_radixInit_T_11 ? _GEN_2537 : _GEN_2253; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2570 = ~_radixInit_T_11 ? _GEN_2538 : _GEN_2254; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2571 = ~_radixInit_T_11 ? _GEN_2539 : _GEN_2255; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2572 = ~_radixInit_T_11 ? _GEN_2540 : _GEN_2256; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2573 = ~_radixInit_T_11 ? _GEN_2541 : _GEN_2257; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2574 = ~_radixInit_T_11 ? _GEN_2542 : _GEN_2258; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2575 = ~_radixInit_T_11 ? _GEN_2543 : _GEN_2259; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2576 = ~_radixInit_T_11 ? _GEN_2544 : _GEN_2260; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2577 = ~_radixInit_T_11 ? _GEN_2545 : _GEN_2261; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2578 = ~_radixInit_T_11 ? _GEN_2546 : _GEN_2262; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2579 = ~_radixInit_T_11 ? _GEN_2547 : _GEN_2263; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2580 = ~_radixInit_T_11 ? _GEN_2548 : _GEN_2264; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2581 = ~_radixInit_T_11 ? _GEN_2549 : _GEN_2265; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2582 = ~_radixInit_T_11 ? _GEN_2550 : _GEN_2266; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2583 = ~_radixInit_T_11 ? _GEN_2551 : _GEN_2267; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2584 = ~_radixInit_T_11 ? _GEN_2552 : _GEN_2268; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2585 = ~_radixInit_T_11 ? _GEN_2553 : _GEN_2237; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2586 = ~_radixInit_T_11 ? _GEN_2554 : _GEN_2238; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2587 = ~_radixInit_T_11 ? _GEN_2555 : _GEN_2239; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2588 = ~_radixInit_T_11 ? _GEN_2556 : _GEN_2240; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2589 = ~_radixInit_T_11 ? _GEN_2557 : _GEN_2241; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2590 = ~_radixInit_T_11 ? _GEN_2558 : _GEN_2242; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2591 = ~_radixInit_T_11 ? _GEN_2559 : _GEN_2243; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2592 = ~_radixInit_T_11 ? _GEN_2560 : _GEN_2244; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2593 = ~_radixInit_T_11 ? _GEN_2561 : _GEN_2245; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2594 = ~_radixInit_T_11 ? _GEN_2562 : _GEN_2246; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2595 = ~_radixInit_T_11 ? _GEN_2563 : _GEN_2247; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2596 = ~_radixInit_T_11 ? _GEN_2564 : _GEN_2248; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2597 = ~_radixInit_T_11 ? _GEN_2565 : _GEN_2249; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2598 = ~_radixInit_T_11 ? _GEN_2566 : _GEN_2250; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2599 = ~_radixInit_T_11 ? _GEN_2567 : _GEN_2251; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2600 = ~_radixInit_T_11 ? _GEN_2568 : _GEN_2252; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_2601 = 4'h0 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2585; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2602 = 4'h1 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2586; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2603 = 4'h2 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2587; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2604 = 4'h3 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2588; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2605 = 4'h4 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2589; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2606 = 4'h5 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2590; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2607 = 4'h6 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2591; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2608 = 4'h7 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2592; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2609 = 4'h8 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2593; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2610 = 4'h9 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2594; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2611 = 4'ha == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2595; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2612 = 4'hb == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2596; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2613 = 4'hc == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2597; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2614 = 4'hd == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2598; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2615 = 4'he == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2599; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2616 = 4'hf == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2600; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_2617 = 4'h0 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2601; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2618 = 4'h1 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2602; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2619 = 4'h2 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2603; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2620 = 4'h3 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2604; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2621 = 4'h4 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2605; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2622 = 4'h5 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2606; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2623 = 4'h6 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2607; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2624 = 4'h7 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2608; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2625 = 4'h8 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2609; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2626 = 4'h9 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2610; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2627 = 4'ha == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2611; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2628 = 4'hb == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2612; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2629 = 4'hc == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2613; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2630 = 4'hd == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2614; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2631 = 4'he == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2615; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2632 = 4'hf == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2616; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_2633 = 4'h0 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2569; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2634 = 4'h1 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2570; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2635 = 4'h2 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2571; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2636 = 4'h3 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2572; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2637 = 4'h4 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2573; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2638 = 4'h5 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2574; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2639 = 4'h6 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2575; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2640 = 4'h7 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2576; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2641 = 4'h8 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2577; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2642 = 4'h9 == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2578; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2643 = 4'ha == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2579; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2644 = 4'hb == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2580; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2645 = 4'hc == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2581; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2646 = 4'hd == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2582; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2647 = 4'he == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2583; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2648 = 4'hf == addrTBankSel3c_4 ? addrT3c_4 : _GEN_2584; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_2649 = 4'h0 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2633; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2650 = 4'h1 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2634; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2651 = 4'h2 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2635; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2652 = 4'h3 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2636; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2653 = 4'h4 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2637; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2654 = 4'h5 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2638; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2655 = 4'h6 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2639; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2656 = 4'h7 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2640; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2657 = 4'h8 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2641; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2658 = 4'h9 == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2642; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2659 = 4'ha == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2643; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2660 = 4'hb == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2644; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2661 = 4'hc == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2645; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2662 = 4'hd == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2646; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2663 = 4'he == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2647; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2664 = 4'hf == addrSBankSel3c_4 ? addrS3c_4 : _GEN_2648; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_2665 = _srcBufferNext_T_3 ? _GEN_2617 : _GEN_2585; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2666 = _srcBufferNext_T_3 ? _GEN_2618 : _GEN_2586; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2667 = _srcBufferNext_T_3 ? _GEN_2619 : _GEN_2587; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2668 = _srcBufferNext_T_3 ? _GEN_2620 : _GEN_2588; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2669 = _srcBufferNext_T_3 ? _GEN_2621 : _GEN_2589; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2670 = _srcBufferNext_T_3 ? _GEN_2622 : _GEN_2590; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2671 = _srcBufferNext_T_3 ? _GEN_2623 : _GEN_2591; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2672 = _srcBufferNext_T_3 ? _GEN_2624 : _GEN_2592; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2673 = _srcBufferNext_T_3 ? _GEN_2625 : _GEN_2593; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2674 = _srcBufferNext_T_3 ? _GEN_2626 : _GEN_2594; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2675 = _srcBufferNext_T_3 ? _GEN_2627 : _GEN_2595; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2676 = _srcBufferNext_T_3 ? _GEN_2628 : _GEN_2596; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2677 = _srcBufferNext_T_3 ? _GEN_2629 : _GEN_2597; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2678 = _srcBufferNext_T_3 ? _GEN_2630 : _GEN_2598; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2679 = _srcBufferNext_T_3 ? _GEN_2631 : _GEN_2599; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2680 = _srcBufferNext_T_3 ? _GEN_2632 : _GEN_2600; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2681 = _srcBufferNext_T_3 ? _GEN_2569 : _GEN_2649; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2682 = _srcBufferNext_T_3 ? _GEN_2570 : _GEN_2650; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2683 = _srcBufferNext_T_3 ? _GEN_2571 : _GEN_2651; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2684 = _srcBufferNext_T_3 ? _GEN_2572 : _GEN_2652; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2685 = _srcBufferNext_T_3 ? _GEN_2573 : _GEN_2653; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2686 = _srcBufferNext_T_3 ? _GEN_2574 : _GEN_2654; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2687 = _srcBufferNext_T_3 ? _GEN_2575 : _GEN_2655; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2688 = _srcBufferNext_T_3 ? _GEN_2576 : _GEN_2656; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2689 = _srcBufferNext_T_3 ? _GEN_2577 : _GEN_2657; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2690 = _srcBufferNext_T_3 ? _GEN_2578 : _GEN_2658; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2691 = _srcBufferNext_T_3 ? _GEN_2579 : _GEN_2659; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2692 = _srcBufferNext_T_3 ? _GEN_2580 : _GEN_2660; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2693 = _srcBufferNext_T_3 ? _GEN_2581 : _GEN_2661; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2694 = _srcBufferNext_T_3 ? _GEN_2582 : _GEN_2662; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2695 = _srcBufferNext_T_3 ? _GEN_2583 : _GEN_2663; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2696 = _srcBufferNext_T_3 ? _GEN_2584 : _GEN_2664; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_2697 = ~procState3c ? _GEN_2665 : _GEN_2585; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2698 = ~procState3c ? _GEN_2666 : _GEN_2586; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2699 = ~procState3c ? _GEN_2667 : _GEN_2587; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2700 = ~procState3c ? _GEN_2668 : _GEN_2588; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2701 = ~procState3c ? _GEN_2669 : _GEN_2589; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2702 = ~procState3c ? _GEN_2670 : _GEN_2590; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2703 = ~procState3c ? _GEN_2671 : _GEN_2591; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2704 = ~procState3c ? _GEN_2672 : _GEN_2592; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2705 = ~procState3c ? _GEN_2673 : _GEN_2593; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2706 = ~procState3c ? _GEN_2674 : _GEN_2594; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2707 = ~procState3c ? _GEN_2675 : _GEN_2595; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2708 = ~procState3c ? _GEN_2676 : _GEN_2596; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2709 = ~procState3c ? _GEN_2677 : _GEN_2597; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2710 = ~procState3c ? _GEN_2678 : _GEN_2598; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2711 = ~procState3c ? _GEN_2679 : _GEN_2599; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2712 = ~procState3c ? _GEN_2680 : _GEN_2600; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2713 = ~procState3c ? _GEN_2681 : _GEN_2569; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2714 = ~procState3c ? _GEN_2682 : _GEN_2570; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2715 = ~procState3c ? _GEN_2683 : _GEN_2571; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2716 = ~procState3c ? _GEN_2684 : _GEN_2572; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2717 = ~procState3c ? _GEN_2685 : _GEN_2573; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2718 = ~procState3c ? _GEN_2686 : _GEN_2574; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2719 = ~procState3c ? _GEN_2687 : _GEN_2575; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2720 = ~procState3c ? _GEN_2688 : _GEN_2576; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2721 = ~procState3c ? _GEN_2689 : _GEN_2577; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2722 = ~procState3c ? _GEN_2690 : _GEN_2578; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2723 = ~procState3c ? _GEN_2691 : _GEN_2579; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2724 = ~procState3c ? _GEN_2692 : _GEN_2580; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2725 = ~procState3c ? _GEN_2693 : _GEN_2581; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2726 = ~procState3c ? _GEN_2694 : _GEN_2582; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2727 = ~procState3c ? _GEN_2695 : _GEN_2583; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_2728 = ~procState3c ? _GEN_2696 : _GEN_2584; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_4 = fftCalc_4_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_4 = writeDataTRPre3c_4[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_2729 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_4[14]}},_writeDataS3c_re_T_4}) : $signed(
    fftCalc_4_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_2730 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_4[14]}},_writeDataS3c_im_T_4}) : $signed(
    fftCalc_4_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_2734 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_4) : $signed(_GEN_2730); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_2738 = fftCalc_4_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_4_im = sameAddr3c ? $signed(_GEN_2734) : $signed(_GEN_2738); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_2731 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_4_im) : $signed(writeDataTIPre3c_4); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_2733 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_4_io_dataOutSR3c) : $signed(_GEN_2729); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_2737 = fftCalc_4_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_4_re = sameAddr3c ? $signed(_GEN_2733) : $signed(_GEN_2737); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_2732 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_4_re) : $signed(writeDataTRPre3c_4); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_2735 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_4_im) : $signed(_GEN_2731); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_2736 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_4_re) : $signed(_GEN_2732); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_14 = 16'sh0 - $signed(writeDataTIPre3c_4); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_2740 = _addrSBankSel3c_T_1 & addrTBankSel3c_4 == 4'h8 & addrT3c_4 == 4'h1 ? $signed(
    _writeDataT3c_im_T_14) : $signed(writeDataTIPre3c_4); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_30 = sameAddr3c ? $signed(_GEN_2733) : $signed(_GEN_2737); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_31 = sameAddr3c ? $signed(_GEN_2734) : $signed(_GEN_2738); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_32 = {_io_writeDataSram0Bank_0_T_31,_io_writeDataSram0Bank_0_T_30}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_33 = sameAddr3c ? $signed(_GEN_2736) : $signed(writeDataTRPre3c_4); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_34 = sameAddr3c ? $signed(_GEN_2735) : $signed(_GEN_2740); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_35 = {_io_writeDataSram0Bank_0_T_34,_io_writeDataSram0Bank_0_T_33}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_2745 = 4'h0 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2289; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2747 = 4'h0 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2745; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2749 = procState3c ? _GEN_2289 : _GEN_2747; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2751 = 4'h1 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2295; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2753 = 4'h1 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2751; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2755 = procState3c ? _GEN_2295 : _GEN_2753; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2757 = 4'h2 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2301; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2759 = 4'h2 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2757; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2761 = procState3c ? _GEN_2301 : _GEN_2759; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2763 = 4'h3 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2307; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2765 = 4'h3 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2763; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2767 = procState3c ? _GEN_2307 : _GEN_2765; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2769 = 4'h4 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2313; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2771 = 4'h4 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2769; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2773 = procState3c ? _GEN_2313 : _GEN_2771; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2775 = 4'h5 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2319; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2777 = 4'h5 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2775; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2779 = procState3c ? _GEN_2319 : _GEN_2777; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2781 = 4'h6 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2325; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2783 = 4'h6 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2781; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2785 = procState3c ? _GEN_2325 : _GEN_2783; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2787 = 4'h7 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2331; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2789 = 4'h7 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2787; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2791 = procState3c ? _GEN_2331 : _GEN_2789; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2793 = 4'h8 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2337; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2795 = 4'h8 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2793; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2797 = procState3c ? _GEN_2337 : _GEN_2795; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2799 = 4'h9 == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2343; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2801 = 4'h9 == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2799; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2803 = procState3c ? _GEN_2343 : _GEN_2801; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2805 = 4'ha == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2349; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2807 = 4'ha == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2805; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2809 = procState3c ? _GEN_2349 : _GEN_2807; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2811 = 4'hb == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2355; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2813 = 4'hb == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2811; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2815 = procState3c ? _GEN_2355 : _GEN_2813; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2817 = 4'hc == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2361; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2819 = 4'hc == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2817; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2821 = procState3c ? _GEN_2361 : _GEN_2819; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2823 = 4'hd == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2367; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2825 = 4'hd == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2823; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2827 = procState3c ? _GEN_2367 : _GEN_2825; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2829 = 4'he == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2373; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2831 = 4'he == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2829; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2833 = procState3c ? _GEN_2373 : _GEN_2831; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_2835 = 4'hf == addrTBankSel3c_4 ? _io_writeDataSram0Bank_0_T_35 : _GEN_2379; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_2837 = 4'hf == addrSBankSel3c_4 ? _io_writeDataSram0Bank_0_T_32 : _GEN_2835; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_2839 = procState3c ? _GEN_2379 : _GEN_2837; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_5; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_5; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_5; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_5; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_5; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_5; // @[Reg.scala 35:20]
  wire [3:0] _addrSBankSel_T_26 = _radixInit_T_11 ? addrSBankSelProc_5 : addrSBankSelKernel_5; // @[FFTEngine.scala 471:32]
  wire [3:0] _addrTBankSel_T_26 = _radixInit_T_11 ? addrTBankSelProc_5 : addrTBankSelKernel_5; // @[FFTEngine.scala 472:32]
  wire [3:0] _addrSBankSel_T_30 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_5 :
    addrSBankSelKernel_5; // @[FFTEngine.scala 474:32]
  wire [3:0] _addrTBankSel_T_30 = _addrSBankSel_T_4 ? addrTBankSelProc_5 : addrTBankSelKernel_5; // @[FFTEngine.scala 475:32]
  wire [3:0] addrSBankSel_5 = io_fftMode ? _addrSBankSel_T_26 : _addrSBankSel_T_30; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [3:0] addrTBankSel_5 = io_fftMode ? _addrTBankSel_T_26 : _addrTBankSel_T_30; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [3:0] addrSBankSel1c_5; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSel1c_5; // @[Reg.scala 35:20]
  wire [15:0] _GEN_2852 = 4'h1 == addrSBankSel1c_5 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2853 = 4'h2 == addrSBankSel1c_5 ? $signed(dataInPre_2_re) : $signed(_GEN_2852); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2854 = 4'h3 == addrSBankSel1c_5 ? $signed(dataInPre_3_re) : $signed(_GEN_2853); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2855 = 4'h4 == addrSBankSel1c_5 ? $signed(dataInPre_4_re) : $signed(_GEN_2854); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2856 = 4'h5 == addrSBankSel1c_5 ? $signed(dataInPre_5_re) : $signed(_GEN_2855); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2857 = 4'h6 == addrSBankSel1c_5 ? $signed(dataInPre_6_re) : $signed(_GEN_2856); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2858 = 4'h7 == addrSBankSel1c_5 ? $signed(dataInPre_7_re) : $signed(_GEN_2857); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2859 = 4'h8 == addrSBankSel1c_5 ? $signed(dataInPre_8_re) : $signed(_GEN_2858); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2860 = 4'h9 == addrSBankSel1c_5 ? $signed(dataInPre_9_re) : $signed(_GEN_2859); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2861 = 4'ha == addrSBankSel1c_5 ? $signed(dataInPre_10_re) : $signed(_GEN_2860); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2862 = 4'hb == addrSBankSel1c_5 ? $signed(dataInPre_11_re) : $signed(_GEN_2861); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2863 = 4'hc == addrSBankSel1c_5 ? $signed(dataInPre_12_re) : $signed(_GEN_2862); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2864 = 4'hd == addrSBankSel1c_5 ? $signed(dataInPre_13_re) : $signed(_GEN_2863); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2865 = 4'he == addrSBankSel1c_5 ? $signed(dataInPre_14_re) : $signed(_GEN_2864); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_2868 = 4'h1 == addrSBankSel1c_5 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2869 = 4'h2 == addrSBankSel1c_5 ? $signed(dataInPre_2_im) : $signed(_GEN_2868); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2870 = 4'h3 == addrSBankSel1c_5 ? $signed(dataInPre_3_im) : $signed(_GEN_2869); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2871 = 4'h4 == addrSBankSel1c_5 ? $signed(dataInPre_4_im) : $signed(_GEN_2870); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2872 = 4'h5 == addrSBankSel1c_5 ? $signed(dataInPre_5_im) : $signed(_GEN_2871); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2873 = 4'h6 == addrSBankSel1c_5 ? $signed(dataInPre_6_im) : $signed(_GEN_2872); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2874 = 4'h7 == addrSBankSel1c_5 ? $signed(dataInPre_7_im) : $signed(_GEN_2873); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2875 = 4'h8 == addrSBankSel1c_5 ? $signed(dataInPre_8_im) : $signed(_GEN_2874); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2876 = 4'h9 == addrSBankSel1c_5 ? $signed(dataInPre_9_im) : $signed(_GEN_2875); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2877 = 4'ha == addrSBankSel1c_5 ? $signed(dataInPre_10_im) : $signed(_GEN_2876); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2878 = 4'hb == addrSBankSel1c_5 ? $signed(dataInPre_11_im) : $signed(_GEN_2877); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2879 = 4'hc == addrSBankSel1c_5 ? $signed(dataInPre_12_im) : $signed(_GEN_2878); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2880 = 4'hd == addrSBankSel1c_5 ? $signed(dataInPre_13_im) : $signed(_GEN_2879); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2881 = 4'he == addrSBankSel1c_5 ? $signed(dataInPre_14_im) : $signed(_GEN_2880); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2882 = 4'hf == addrSBankSel1c_5 ? $signed(dataInPre_15_im) : $signed(_GEN_2881); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_2884 = 4'h1 == addrTBankSel1c_5 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2885 = 4'h2 == addrTBankSel1c_5 ? $signed(dataInPre_2_im) : $signed(_GEN_2884); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2886 = 4'h3 == addrTBankSel1c_5 ? $signed(dataInPre_3_im) : $signed(_GEN_2885); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2887 = 4'h4 == addrTBankSel1c_5 ? $signed(dataInPre_4_im) : $signed(_GEN_2886); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2888 = 4'h5 == addrTBankSel1c_5 ? $signed(dataInPre_5_im) : $signed(_GEN_2887); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2889 = 4'h6 == addrTBankSel1c_5 ? $signed(dataInPre_6_im) : $signed(_GEN_2888); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2890 = 4'h7 == addrTBankSel1c_5 ? $signed(dataInPre_7_im) : $signed(_GEN_2889); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2891 = 4'h8 == addrTBankSel1c_5 ? $signed(dataInPre_8_im) : $signed(_GEN_2890); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2892 = 4'h9 == addrTBankSel1c_5 ? $signed(dataInPre_9_im) : $signed(_GEN_2891); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2893 = 4'ha == addrTBankSel1c_5 ? $signed(dataInPre_10_im) : $signed(_GEN_2892); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2894 = 4'hb == addrTBankSel1c_5 ? $signed(dataInPre_11_im) : $signed(_GEN_2893); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2895 = 4'hc == addrTBankSel1c_5 ? $signed(dataInPre_12_im) : $signed(_GEN_2894); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2896 = 4'hd == addrTBankSel1c_5 ? $signed(dataInPre_13_im) : $signed(_GEN_2895); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2897 = 4'he == addrTBankSel1c_5 ? $signed(dataInPre_14_im) : $signed(_GEN_2896); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2898 = 4'hf == addrTBankSel1c_5 ? $signed(dataInPre_15_im) : $signed(_GEN_2897); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2900 = 4'h1 == addrTBankSel1c_5 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2901 = 4'h2 == addrTBankSel1c_5 ? $signed(dataInPre_2_re) : $signed(_GEN_2900); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2902 = 4'h3 == addrTBankSel1c_5 ? $signed(dataInPre_3_re) : $signed(_GEN_2901); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2903 = 4'h4 == addrTBankSel1c_5 ? $signed(dataInPre_4_re) : $signed(_GEN_2902); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2904 = 4'h5 == addrTBankSel1c_5 ? $signed(dataInPre_5_re) : $signed(_GEN_2903); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2905 = 4'h6 == addrTBankSel1c_5 ? $signed(dataInPre_6_re) : $signed(_GEN_2904); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2906 = 4'h7 == addrTBankSel1c_5 ? $signed(dataInPre_7_re) : $signed(_GEN_2905); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2907 = 4'h8 == addrTBankSel1c_5 ? $signed(dataInPre_8_re) : $signed(_GEN_2906); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2908 = 4'h9 == addrTBankSel1c_5 ? $signed(dataInPre_9_re) : $signed(_GEN_2907); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2909 = 4'ha == addrTBankSel1c_5 ? $signed(dataInPre_10_re) : $signed(_GEN_2908); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2910 = 4'hb == addrTBankSel1c_5 ? $signed(dataInPre_11_re) : $signed(_GEN_2909); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2911 = 4'hc == addrTBankSel1c_5 ? $signed(dataInPre_12_re) : $signed(_GEN_2910); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2912 = 4'hd == addrTBankSel1c_5 ? $signed(dataInPre_13_re) : $signed(_GEN_2911); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2913 = 4'he == addrTBankSel1c_5 ? $signed(dataInPre_14_re) : $signed(_GEN_2912); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_2914 = 4'hf == addrTBankSel1c_5 ? $signed(dataInPre_15_re) : $signed(_GEN_2913); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_33 = 16'sh0 - $signed(fftCalc_5_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_34 = io_fftMode ? $signed(fftCalc_5_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_33); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_35 = _T_12 ? $signed(fftCalc_5_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_34); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_5 = procState3c ? $signed(_writeDataTRPre3c_T_35) : $signed(fftCalc_5_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_51 = 16'sh0 - $signed(fftCalc_5_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_52 = io_fftMode ? $signed(_writeDataTIPre3c_T_51) : $signed(fftCalc_5_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_53 = _T_12 ? $signed(_writeDataTRPre3c_T_33) : $signed(_writeDataTIPre3c_T_52); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_5 = procState3c ? $signed(_writeDataTIPre3c_T_53) : $signed(fftCalc_5_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [3:0] _addrSBankSel3c_T_28 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_5_r :
    addrSBankSelKernel3c_5_r; // @[FFTEngine.scala 505:34]
  wire [3:0] _addrTBankSel3c_T_28 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_5_r : addrTBankSelKernel3c_5_r; // @[FFTEngine.scala 506:34]
  wire [3:0] _addrSBankSel3c_T_29 = procState3c ? addrSBankSelProc3c_5_r : addrSBankSelKernel3c_5_r; // @[FFTEngine.scala 508:34]
  wire [3:0] _addrTBankSel3c_T_29 = procState3c ? addrTBankSelProc3c_5_r : addrTBankSelKernel3c_5_r; // @[FFTEngine.scala 509:34]
  wire [3:0] addrSBankSel3c_5 = io_fftMode ? _addrSBankSel3c_T_28 : _addrSBankSel3c_T_29; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [3:0] addrTBankSel3c_5 = io_fftMode ? _addrTBankSel3c_T_28 : _addrTBankSel3c_T_29; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [3:0] _GEN_2933 = 4'h0 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2713; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2934 = 4'h1 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2714; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2935 = 4'h2 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2715; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2936 = 4'h3 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2716; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2937 = 4'h4 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2717; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2938 = 4'h5 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2718; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2939 = 4'h6 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2719; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2940 = 4'h7 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2720; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2941 = 4'h8 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2721; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2942 = 4'h9 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2722; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2943 = 4'ha == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2723; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2944 = 4'hb == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2724; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2945 = 4'hc == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2725; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2946 = 4'hd == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2726; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2947 = 4'he == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2727; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2948 = 4'hf == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2728; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_2949 = 4'h0 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2933; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2950 = 4'h1 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2934; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2951 = 4'h2 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2935; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2952 = 4'h3 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2936; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2953 = 4'h4 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2937; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2954 = 4'h5 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2938; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2955 = 4'h6 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2939; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2956 = 4'h7 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2940; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2957 = 4'h8 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2941; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2958 = 4'h9 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2942; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2959 = 4'ha == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2943; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2960 = 4'hb == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2944; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2961 = 4'hc == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2945; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2962 = 4'hd == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2946; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2963 = 4'he == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2947; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2964 = 4'hf == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2948; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_2965 = 4'h0 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2697; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2966 = 4'h1 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2698; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2967 = 4'h2 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2699; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2968 = 4'h3 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2700; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2969 = 4'h4 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2701; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2970 = 4'h5 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2702; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2971 = 4'h6 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2703; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2972 = 4'h7 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2704; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2973 = 4'h8 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2705; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2974 = 4'h9 == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2706; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2975 = 4'ha == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2707; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2976 = 4'hb == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2708; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2977 = 4'hc == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2709; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2978 = 4'hd == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2710; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2979 = 4'he == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2711; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2980 = 4'hf == addrTBankSel_5 ? addrT_5[3:0] : _GEN_2712; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_2981 = 4'h0 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2965; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2982 = 4'h1 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2966; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2983 = 4'h2 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2967; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2984 = 4'h3 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2968; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2985 = 4'h4 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2969; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2986 = 4'h5 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2970; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2987 = 4'h6 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2971; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2988 = 4'h7 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2972; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2989 = 4'h8 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2973; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2990 = 4'h9 == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2974; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2991 = 4'ha == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2975; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2992 = 4'hb == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2976; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2993 = 4'hc == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2977; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2994 = 4'hd == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2978; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2995 = 4'he == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2979; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2996 = 4'hf == addrSBankSel_5 ? addrS_5[3:0] : _GEN_2980; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_2997 = _srcBufferNext_T_3 ? _GEN_2949 : _GEN_2713; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2998 = _srcBufferNext_T_3 ? _GEN_2950 : _GEN_2714; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_2999 = _srcBufferNext_T_3 ? _GEN_2951 : _GEN_2715; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3000 = _srcBufferNext_T_3 ? _GEN_2952 : _GEN_2716; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3001 = _srcBufferNext_T_3 ? _GEN_2953 : _GEN_2717; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3002 = _srcBufferNext_T_3 ? _GEN_2954 : _GEN_2718; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3003 = _srcBufferNext_T_3 ? _GEN_2955 : _GEN_2719; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3004 = _srcBufferNext_T_3 ? _GEN_2956 : _GEN_2720; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3005 = _srcBufferNext_T_3 ? _GEN_2957 : _GEN_2721; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3006 = _srcBufferNext_T_3 ? _GEN_2958 : _GEN_2722; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3007 = _srcBufferNext_T_3 ? _GEN_2959 : _GEN_2723; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3008 = _srcBufferNext_T_3 ? _GEN_2960 : _GEN_2724; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3009 = _srcBufferNext_T_3 ? _GEN_2961 : _GEN_2725; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3010 = _srcBufferNext_T_3 ? _GEN_2962 : _GEN_2726; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3011 = _srcBufferNext_T_3 ? _GEN_2963 : _GEN_2727; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3012 = _srcBufferNext_T_3 ? _GEN_2964 : _GEN_2728; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3013 = _srcBufferNext_T_3 ? _GEN_2697 : _GEN_2981; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3014 = _srcBufferNext_T_3 ? _GEN_2698 : _GEN_2982; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3015 = _srcBufferNext_T_3 ? _GEN_2699 : _GEN_2983; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3016 = _srcBufferNext_T_3 ? _GEN_2700 : _GEN_2984; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3017 = _srcBufferNext_T_3 ? _GEN_2701 : _GEN_2985; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3018 = _srcBufferNext_T_3 ? _GEN_2702 : _GEN_2986; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3019 = _srcBufferNext_T_3 ? _GEN_2703 : _GEN_2987; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3020 = _srcBufferNext_T_3 ? _GEN_2704 : _GEN_2988; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3021 = _srcBufferNext_T_3 ? _GEN_2705 : _GEN_2989; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3022 = _srcBufferNext_T_3 ? _GEN_2706 : _GEN_2990; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3023 = _srcBufferNext_T_3 ? _GEN_2707 : _GEN_2991; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3024 = _srcBufferNext_T_3 ? _GEN_2708 : _GEN_2992; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3025 = _srcBufferNext_T_3 ? _GEN_2709 : _GEN_2993; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3026 = _srcBufferNext_T_3 ? _GEN_2710 : _GEN_2994; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3027 = _srcBufferNext_T_3 ? _GEN_2711 : _GEN_2995; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3028 = _srcBufferNext_T_3 ? _GEN_2712 : _GEN_2996; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3029 = ~_radixInit_T_11 ? _GEN_2997 : _GEN_2713; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3030 = ~_radixInit_T_11 ? _GEN_2998 : _GEN_2714; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3031 = ~_radixInit_T_11 ? _GEN_2999 : _GEN_2715; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3032 = ~_radixInit_T_11 ? _GEN_3000 : _GEN_2716; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3033 = ~_radixInit_T_11 ? _GEN_3001 : _GEN_2717; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3034 = ~_radixInit_T_11 ? _GEN_3002 : _GEN_2718; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3035 = ~_radixInit_T_11 ? _GEN_3003 : _GEN_2719; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3036 = ~_radixInit_T_11 ? _GEN_3004 : _GEN_2720; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3037 = ~_radixInit_T_11 ? _GEN_3005 : _GEN_2721; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3038 = ~_radixInit_T_11 ? _GEN_3006 : _GEN_2722; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3039 = ~_radixInit_T_11 ? _GEN_3007 : _GEN_2723; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3040 = ~_radixInit_T_11 ? _GEN_3008 : _GEN_2724; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3041 = ~_radixInit_T_11 ? _GEN_3009 : _GEN_2725; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3042 = ~_radixInit_T_11 ? _GEN_3010 : _GEN_2726; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3043 = ~_radixInit_T_11 ? _GEN_3011 : _GEN_2727; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3044 = ~_radixInit_T_11 ? _GEN_3012 : _GEN_2728; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3045 = ~_radixInit_T_11 ? _GEN_3013 : _GEN_2697; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3046 = ~_radixInit_T_11 ? _GEN_3014 : _GEN_2698; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3047 = ~_radixInit_T_11 ? _GEN_3015 : _GEN_2699; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3048 = ~_radixInit_T_11 ? _GEN_3016 : _GEN_2700; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3049 = ~_radixInit_T_11 ? _GEN_3017 : _GEN_2701; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3050 = ~_radixInit_T_11 ? _GEN_3018 : _GEN_2702; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3051 = ~_radixInit_T_11 ? _GEN_3019 : _GEN_2703; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3052 = ~_radixInit_T_11 ? _GEN_3020 : _GEN_2704; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3053 = ~_radixInit_T_11 ? _GEN_3021 : _GEN_2705; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3054 = ~_radixInit_T_11 ? _GEN_3022 : _GEN_2706; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3055 = ~_radixInit_T_11 ? _GEN_3023 : _GEN_2707; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3056 = ~_radixInit_T_11 ? _GEN_3024 : _GEN_2708; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3057 = ~_radixInit_T_11 ? _GEN_3025 : _GEN_2709; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3058 = ~_radixInit_T_11 ? _GEN_3026 : _GEN_2710; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3059 = ~_radixInit_T_11 ? _GEN_3027 : _GEN_2711; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3060 = ~_radixInit_T_11 ? _GEN_3028 : _GEN_2712; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3061 = 4'h0 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3045; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3062 = 4'h1 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3046; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3063 = 4'h2 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3047; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3064 = 4'h3 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3048; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3065 = 4'h4 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3049; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3066 = 4'h5 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3050; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3067 = 4'h6 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3051; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3068 = 4'h7 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3052; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3069 = 4'h8 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3053; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3070 = 4'h9 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3054; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3071 = 4'ha == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3055; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3072 = 4'hb == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3056; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3073 = 4'hc == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3057; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3074 = 4'hd == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3058; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3075 = 4'he == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3059; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3076 = 4'hf == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3060; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3077 = 4'h0 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3061; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3078 = 4'h1 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3062; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3079 = 4'h2 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3063; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3080 = 4'h3 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3064; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3081 = 4'h4 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3065; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3082 = 4'h5 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3066; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3083 = 4'h6 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3067; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3084 = 4'h7 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3068; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3085 = 4'h8 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3069; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3086 = 4'h9 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3070; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3087 = 4'ha == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3071; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3088 = 4'hb == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3072; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3089 = 4'hc == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3073; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3090 = 4'hd == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3074; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3091 = 4'he == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3075; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3092 = 4'hf == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3076; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3093 = 4'h0 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3029; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3094 = 4'h1 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3030; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3095 = 4'h2 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3031; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3096 = 4'h3 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3032; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3097 = 4'h4 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3033; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3098 = 4'h5 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3034; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3099 = 4'h6 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3035; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3100 = 4'h7 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3036; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3101 = 4'h8 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3037; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3102 = 4'h9 == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3038; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3103 = 4'ha == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3039; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3104 = 4'hb == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3040; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3105 = 4'hc == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3041; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3106 = 4'hd == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3042; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3107 = 4'he == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3043; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3108 = 4'hf == addrTBankSel3c_5 ? addrT3c_5 : _GEN_3044; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3109 = 4'h0 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3093; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3110 = 4'h1 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3094; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3111 = 4'h2 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3095; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3112 = 4'h3 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3096; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3113 = 4'h4 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3097; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3114 = 4'h5 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3098; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3115 = 4'h6 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3099; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3116 = 4'h7 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3100; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3117 = 4'h8 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3101; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3118 = 4'h9 == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3102; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3119 = 4'ha == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3103; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3120 = 4'hb == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3104; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3121 = 4'hc == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3105; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3122 = 4'hd == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3106; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3123 = 4'he == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3107; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3124 = 4'hf == addrSBankSel3c_5 ? addrS3c_5 : _GEN_3108; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3125 = _srcBufferNext_T_3 ? _GEN_3077 : _GEN_3045; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3126 = _srcBufferNext_T_3 ? _GEN_3078 : _GEN_3046; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3127 = _srcBufferNext_T_3 ? _GEN_3079 : _GEN_3047; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3128 = _srcBufferNext_T_3 ? _GEN_3080 : _GEN_3048; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3129 = _srcBufferNext_T_3 ? _GEN_3081 : _GEN_3049; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3130 = _srcBufferNext_T_3 ? _GEN_3082 : _GEN_3050; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3131 = _srcBufferNext_T_3 ? _GEN_3083 : _GEN_3051; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3132 = _srcBufferNext_T_3 ? _GEN_3084 : _GEN_3052; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3133 = _srcBufferNext_T_3 ? _GEN_3085 : _GEN_3053; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3134 = _srcBufferNext_T_3 ? _GEN_3086 : _GEN_3054; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3135 = _srcBufferNext_T_3 ? _GEN_3087 : _GEN_3055; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3136 = _srcBufferNext_T_3 ? _GEN_3088 : _GEN_3056; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3137 = _srcBufferNext_T_3 ? _GEN_3089 : _GEN_3057; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3138 = _srcBufferNext_T_3 ? _GEN_3090 : _GEN_3058; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3139 = _srcBufferNext_T_3 ? _GEN_3091 : _GEN_3059; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3140 = _srcBufferNext_T_3 ? _GEN_3092 : _GEN_3060; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3141 = _srcBufferNext_T_3 ? _GEN_3029 : _GEN_3109; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3142 = _srcBufferNext_T_3 ? _GEN_3030 : _GEN_3110; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3143 = _srcBufferNext_T_3 ? _GEN_3031 : _GEN_3111; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3144 = _srcBufferNext_T_3 ? _GEN_3032 : _GEN_3112; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3145 = _srcBufferNext_T_3 ? _GEN_3033 : _GEN_3113; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3146 = _srcBufferNext_T_3 ? _GEN_3034 : _GEN_3114; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3147 = _srcBufferNext_T_3 ? _GEN_3035 : _GEN_3115; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3148 = _srcBufferNext_T_3 ? _GEN_3036 : _GEN_3116; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3149 = _srcBufferNext_T_3 ? _GEN_3037 : _GEN_3117; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3150 = _srcBufferNext_T_3 ? _GEN_3038 : _GEN_3118; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3151 = _srcBufferNext_T_3 ? _GEN_3039 : _GEN_3119; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3152 = _srcBufferNext_T_3 ? _GEN_3040 : _GEN_3120; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3153 = _srcBufferNext_T_3 ? _GEN_3041 : _GEN_3121; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3154 = _srcBufferNext_T_3 ? _GEN_3042 : _GEN_3122; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3155 = _srcBufferNext_T_3 ? _GEN_3043 : _GEN_3123; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3156 = _srcBufferNext_T_3 ? _GEN_3044 : _GEN_3124; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3157 = ~procState3c ? _GEN_3125 : _GEN_3045; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3158 = ~procState3c ? _GEN_3126 : _GEN_3046; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3159 = ~procState3c ? _GEN_3127 : _GEN_3047; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3160 = ~procState3c ? _GEN_3128 : _GEN_3048; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3161 = ~procState3c ? _GEN_3129 : _GEN_3049; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3162 = ~procState3c ? _GEN_3130 : _GEN_3050; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3163 = ~procState3c ? _GEN_3131 : _GEN_3051; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3164 = ~procState3c ? _GEN_3132 : _GEN_3052; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3165 = ~procState3c ? _GEN_3133 : _GEN_3053; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3166 = ~procState3c ? _GEN_3134 : _GEN_3054; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3167 = ~procState3c ? _GEN_3135 : _GEN_3055; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3168 = ~procState3c ? _GEN_3136 : _GEN_3056; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3169 = ~procState3c ? _GEN_3137 : _GEN_3057; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3170 = ~procState3c ? _GEN_3138 : _GEN_3058; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3171 = ~procState3c ? _GEN_3139 : _GEN_3059; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3172 = ~procState3c ? _GEN_3140 : _GEN_3060; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3173 = ~procState3c ? _GEN_3141 : _GEN_3029; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3174 = ~procState3c ? _GEN_3142 : _GEN_3030; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3175 = ~procState3c ? _GEN_3143 : _GEN_3031; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3176 = ~procState3c ? _GEN_3144 : _GEN_3032; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3177 = ~procState3c ? _GEN_3145 : _GEN_3033; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3178 = ~procState3c ? _GEN_3146 : _GEN_3034; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3179 = ~procState3c ? _GEN_3147 : _GEN_3035; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3180 = ~procState3c ? _GEN_3148 : _GEN_3036; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3181 = ~procState3c ? _GEN_3149 : _GEN_3037; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3182 = ~procState3c ? _GEN_3150 : _GEN_3038; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3183 = ~procState3c ? _GEN_3151 : _GEN_3039; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3184 = ~procState3c ? _GEN_3152 : _GEN_3040; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3185 = ~procState3c ? _GEN_3153 : _GEN_3041; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3186 = ~procState3c ? _GEN_3154 : _GEN_3042; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3187 = ~procState3c ? _GEN_3155 : _GEN_3043; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3188 = ~procState3c ? _GEN_3156 : _GEN_3044; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_5 = fftCalc_5_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_5 = writeDataTRPre3c_5[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_3189 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_5[14]}},_writeDataS3c_re_T_5}) : $signed(
    fftCalc_5_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_3190 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_5[14]}},_writeDataS3c_im_T_5}) : $signed(
    fftCalc_5_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_3194 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_5) : $signed(_GEN_3190); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_3198 = fftCalc_5_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_5_im = sameAddr3c ? $signed(_GEN_3194) : $signed(_GEN_3198); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_3191 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_5_im) : $signed(writeDataTIPre3c_5); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_3193 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_5_io_dataOutSR3c) : $signed(_GEN_3189); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_3197 = fftCalc_5_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_5_re = sameAddr3c ? $signed(_GEN_3193) : $signed(_GEN_3197); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_3192 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_5_re) : $signed(writeDataTRPre3c_5); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_3195 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_5_im) : $signed(_GEN_3191); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_3196 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_5_re) : $signed(_GEN_3192); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_17 = 16'sh0 - $signed(writeDataTIPre3c_5); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_3200 = _addrSBankSel3c_T_1 & addrTBankSel3c_5 == 4'h8 & addrT3c_5 == 4'h1 ? $signed(
    _writeDataT3c_im_T_17) : $signed(writeDataTIPre3c_5); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_36 = sameAddr3c ? $signed(_GEN_3193) : $signed(_GEN_3197); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_37 = sameAddr3c ? $signed(_GEN_3194) : $signed(_GEN_3198); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_38 = {_io_writeDataSram0Bank_0_T_37,_io_writeDataSram0Bank_0_T_36}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_39 = sameAddr3c ? $signed(_GEN_3196) : $signed(writeDataTRPre3c_5); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_40 = sameAddr3c ? $signed(_GEN_3195) : $signed(_GEN_3200); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_41 = {_io_writeDataSram0Bank_0_T_40,_io_writeDataSram0Bank_0_T_39}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_3205 = 4'h0 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2749; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3207 = 4'h0 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3205; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3209 = procState3c ? _GEN_2749 : _GEN_3207; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3211 = 4'h1 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2755; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3213 = 4'h1 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3211; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3215 = procState3c ? _GEN_2755 : _GEN_3213; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3217 = 4'h2 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2761; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3219 = 4'h2 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3217; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3221 = procState3c ? _GEN_2761 : _GEN_3219; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3223 = 4'h3 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2767; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3225 = 4'h3 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3223; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3227 = procState3c ? _GEN_2767 : _GEN_3225; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3229 = 4'h4 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2773; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3231 = 4'h4 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3229; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3233 = procState3c ? _GEN_2773 : _GEN_3231; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3235 = 4'h5 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2779; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3237 = 4'h5 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3235; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3239 = procState3c ? _GEN_2779 : _GEN_3237; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3241 = 4'h6 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2785; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3243 = 4'h6 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3241; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3245 = procState3c ? _GEN_2785 : _GEN_3243; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3247 = 4'h7 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2791; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3249 = 4'h7 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3247; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3251 = procState3c ? _GEN_2791 : _GEN_3249; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3253 = 4'h8 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2797; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3255 = 4'h8 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3253; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3257 = procState3c ? _GEN_2797 : _GEN_3255; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3259 = 4'h9 == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2803; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3261 = 4'h9 == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3259; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3263 = procState3c ? _GEN_2803 : _GEN_3261; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3265 = 4'ha == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2809; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3267 = 4'ha == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3265; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3269 = procState3c ? _GEN_2809 : _GEN_3267; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3271 = 4'hb == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2815; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3273 = 4'hb == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3271; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3275 = procState3c ? _GEN_2815 : _GEN_3273; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3277 = 4'hc == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2821; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3279 = 4'hc == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3277; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3281 = procState3c ? _GEN_2821 : _GEN_3279; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3283 = 4'hd == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2827; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3285 = 4'hd == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3283; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3287 = procState3c ? _GEN_2827 : _GEN_3285; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3289 = 4'he == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2833; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3291 = 4'he == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3289; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3293 = procState3c ? _GEN_2833 : _GEN_3291; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3295 = 4'hf == addrTBankSel3c_5 ? _io_writeDataSram0Bank_0_T_41 : _GEN_2839; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3297 = 4'hf == addrSBankSel3c_5 ? _io_writeDataSram0Bank_0_T_38 : _GEN_3295; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3299 = procState3c ? _GEN_2839 : _GEN_3297; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_6; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_6; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_6; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_6; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_6; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_6; // @[Reg.scala 35:20]
  wire [3:0] _addrSBankSel_T_31 = _radixInit_T_11 ? addrSBankSelProc_6 : addrSBankSelKernel_6; // @[FFTEngine.scala 471:32]
  wire [3:0] _addrTBankSel_T_31 = _radixInit_T_11 ? addrTBankSelProc_6 : addrTBankSelKernel_6; // @[FFTEngine.scala 472:32]
  wire [3:0] _addrSBankSel_T_35 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_6 :
    addrSBankSelKernel_6; // @[FFTEngine.scala 474:32]
  wire [3:0] _addrTBankSel_T_35 = _addrSBankSel_T_4 ? addrTBankSelProc_6 : addrTBankSelKernel_6; // @[FFTEngine.scala 475:32]
  wire [3:0] addrSBankSel_6 = io_fftMode ? _addrSBankSel_T_31 : _addrSBankSel_T_35; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [3:0] addrTBankSel_6 = io_fftMode ? _addrTBankSel_T_31 : _addrTBankSel_T_35; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [3:0] addrSBankSel1c_6; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSel1c_6; // @[Reg.scala 35:20]
  wire [15:0] _GEN_3312 = 4'h1 == addrSBankSel1c_6 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3313 = 4'h2 == addrSBankSel1c_6 ? $signed(dataInPre_2_re) : $signed(_GEN_3312); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3314 = 4'h3 == addrSBankSel1c_6 ? $signed(dataInPre_3_re) : $signed(_GEN_3313); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3315 = 4'h4 == addrSBankSel1c_6 ? $signed(dataInPre_4_re) : $signed(_GEN_3314); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3316 = 4'h5 == addrSBankSel1c_6 ? $signed(dataInPre_5_re) : $signed(_GEN_3315); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3317 = 4'h6 == addrSBankSel1c_6 ? $signed(dataInPre_6_re) : $signed(_GEN_3316); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3318 = 4'h7 == addrSBankSel1c_6 ? $signed(dataInPre_7_re) : $signed(_GEN_3317); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3319 = 4'h8 == addrSBankSel1c_6 ? $signed(dataInPre_8_re) : $signed(_GEN_3318); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3320 = 4'h9 == addrSBankSel1c_6 ? $signed(dataInPre_9_re) : $signed(_GEN_3319); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3321 = 4'ha == addrSBankSel1c_6 ? $signed(dataInPre_10_re) : $signed(_GEN_3320); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3322 = 4'hb == addrSBankSel1c_6 ? $signed(dataInPre_11_re) : $signed(_GEN_3321); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3323 = 4'hc == addrSBankSel1c_6 ? $signed(dataInPre_12_re) : $signed(_GEN_3322); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3324 = 4'hd == addrSBankSel1c_6 ? $signed(dataInPre_13_re) : $signed(_GEN_3323); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3325 = 4'he == addrSBankSel1c_6 ? $signed(dataInPre_14_re) : $signed(_GEN_3324); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3328 = 4'h1 == addrSBankSel1c_6 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3329 = 4'h2 == addrSBankSel1c_6 ? $signed(dataInPre_2_im) : $signed(_GEN_3328); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3330 = 4'h3 == addrSBankSel1c_6 ? $signed(dataInPre_3_im) : $signed(_GEN_3329); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3331 = 4'h4 == addrSBankSel1c_6 ? $signed(dataInPre_4_im) : $signed(_GEN_3330); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3332 = 4'h5 == addrSBankSel1c_6 ? $signed(dataInPre_5_im) : $signed(_GEN_3331); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3333 = 4'h6 == addrSBankSel1c_6 ? $signed(dataInPre_6_im) : $signed(_GEN_3332); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3334 = 4'h7 == addrSBankSel1c_6 ? $signed(dataInPre_7_im) : $signed(_GEN_3333); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3335 = 4'h8 == addrSBankSel1c_6 ? $signed(dataInPre_8_im) : $signed(_GEN_3334); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3336 = 4'h9 == addrSBankSel1c_6 ? $signed(dataInPre_9_im) : $signed(_GEN_3335); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3337 = 4'ha == addrSBankSel1c_6 ? $signed(dataInPre_10_im) : $signed(_GEN_3336); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3338 = 4'hb == addrSBankSel1c_6 ? $signed(dataInPre_11_im) : $signed(_GEN_3337); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3339 = 4'hc == addrSBankSel1c_6 ? $signed(dataInPre_12_im) : $signed(_GEN_3338); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3340 = 4'hd == addrSBankSel1c_6 ? $signed(dataInPre_13_im) : $signed(_GEN_3339); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3341 = 4'he == addrSBankSel1c_6 ? $signed(dataInPre_14_im) : $signed(_GEN_3340); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3342 = 4'hf == addrSBankSel1c_6 ? $signed(dataInPre_15_im) : $signed(_GEN_3341); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3344 = 4'h1 == addrTBankSel1c_6 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3345 = 4'h2 == addrTBankSel1c_6 ? $signed(dataInPre_2_im) : $signed(_GEN_3344); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3346 = 4'h3 == addrTBankSel1c_6 ? $signed(dataInPre_3_im) : $signed(_GEN_3345); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3347 = 4'h4 == addrTBankSel1c_6 ? $signed(dataInPre_4_im) : $signed(_GEN_3346); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3348 = 4'h5 == addrTBankSel1c_6 ? $signed(dataInPre_5_im) : $signed(_GEN_3347); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3349 = 4'h6 == addrTBankSel1c_6 ? $signed(dataInPre_6_im) : $signed(_GEN_3348); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3350 = 4'h7 == addrTBankSel1c_6 ? $signed(dataInPre_7_im) : $signed(_GEN_3349); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3351 = 4'h8 == addrTBankSel1c_6 ? $signed(dataInPre_8_im) : $signed(_GEN_3350); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3352 = 4'h9 == addrTBankSel1c_6 ? $signed(dataInPre_9_im) : $signed(_GEN_3351); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3353 = 4'ha == addrTBankSel1c_6 ? $signed(dataInPre_10_im) : $signed(_GEN_3352); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3354 = 4'hb == addrTBankSel1c_6 ? $signed(dataInPre_11_im) : $signed(_GEN_3353); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3355 = 4'hc == addrTBankSel1c_6 ? $signed(dataInPre_12_im) : $signed(_GEN_3354); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3356 = 4'hd == addrTBankSel1c_6 ? $signed(dataInPre_13_im) : $signed(_GEN_3355); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3357 = 4'he == addrTBankSel1c_6 ? $signed(dataInPre_14_im) : $signed(_GEN_3356); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3358 = 4'hf == addrTBankSel1c_6 ? $signed(dataInPre_15_im) : $signed(_GEN_3357); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3360 = 4'h1 == addrTBankSel1c_6 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3361 = 4'h2 == addrTBankSel1c_6 ? $signed(dataInPre_2_re) : $signed(_GEN_3360); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3362 = 4'h3 == addrTBankSel1c_6 ? $signed(dataInPre_3_re) : $signed(_GEN_3361); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3363 = 4'h4 == addrTBankSel1c_6 ? $signed(dataInPre_4_re) : $signed(_GEN_3362); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3364 = 4'h5 == addrTBankSel1c_6 ? $signed(dataInPre_5_re) : $signed(_GEN_3363); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3365 = 4'h6 == addrTBankSel1c_6 ? $signed(dataInPre_6_re) : $signed(_GEN_3364); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3366 = 4'h7 == addrTBankSel1c_6 ? $signed(dataInPre_7_re) : $signed(_GEN_3365); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3367 = 4'h8 == addrTBankSel1c_6 ? $signed(dataInPre_8_re) : $signed(_GEN_3366); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3368 = 4'h9 == addrTBankSel1c_6 ? $signed(dataInPre_9_re) : $signed(_GEN_3367); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3369 = 4'ha == addrTBankSel1c_6 ? $signed(dataInPre_10_re) : $signed(_GEN_3368); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3370 = 4'hb == addrTBankSel1c_6 ? $signed(dataInPre_11_re) : $signed(_GEN_3369); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3371 = 4'hc == addrTBankSel1c_6 ? $signed(dataInPre_12_re) : $signed(_GEN_3370); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3372 = 4'hd == addrTBankSel1c_6 ? $signed(dataInPre_13_re) : $signed(_GEN_3371); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3373 = 4'he == addrTBankSel1c_6 ? $signed(dataInPre_14_re) : $signed(_GEN_3372); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3374 = 4'hf == addrTBankSel1c_6 ? $signed(dataInPre_15_re) : $signed(_GEN_3373); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_39 = 16'sh0 - $signed(fftCalc_6_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_40 = io_fftMode ? $signed(fftCalc_6_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_39); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_41 = _T_12 ? $signed(fftCalc_6_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_40); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_6 = procState3c ? $signed(_writeDataTRPre3c_T_41) : $signed(fftCalc_6_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_60 = 16'sh0 - $signed(fftCalc_6_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_61 = io_fftMode ? $signed(_writeDataTIPre3c_T_60) : $signed(fftCalc_6_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_62 = _T_12 ? $signed(_writeDataTRPre3c_T_39) : $signed(_writeDataTIPre3c_T_61); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_6 = procState3c ? $signed(_writeDataTIPre3c_T_62) : $signed(fftCalc_6_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [3:0] _addrSBankSel3c_T_33 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_6_r :
    addrSBankSelKernel3c_6_r; // @[FFTEngine.scala 505:34]
  wire [3:0] _addrTBankSel3c_T_33 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_6_r : addrTBankSelKernel3c_6_r; // @[FFTEngine.scala 506:34]
  wire [3:0] _addrSBankSel3c_T_34 = procState3c ? addrSBankSelProc3c_6_r : addrSBankSelKernel3c_6_r; // @[FFTEngine.scala 508:34]
  wire [3:0] _addrTBankSel3c_T_34 = procState3c ? addrTBankSelProc3c_6_r : addrTBankSelKernel3c_6_r; // @[FFTEngine.scala 509:34]
  wire [3:0] addrSBankSel3c_6 = io_fftMode ? _addrSBankSel3c_T_33 : _addrSBankSel3c_T_34; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [3:0] addrTBankSel3c_6 = io_fftMode ? _addrTBankSel3c_T_33 : _addrTBankSel3c_T_34; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [3:0] _GEN_3393 = 4'h0 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3173; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3394 = 4'h1 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3174; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3395 = 4'h2 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3175; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3396 = 4'h3 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3176; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3397 = 4'h4 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3177; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3398 = 4'h5 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3178; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3399 = 4'h6 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3179; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3400 = 4'h7 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3180; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3401 = 4'h8 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3181; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3402 = 4'h9 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3182; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3403 = 4'ha == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3183; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3404 = 4'hb == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3184; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3405 = 4'hc == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3185; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3406 = 4'hd == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3186; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3407 = 4'he == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3187; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3408 = 4'hf == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3188; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3409 = 4'h0 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3393; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3410 = 4'h1 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3394; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3411 = 4'h2 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3395; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3412 = 4'h3 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3396; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3413 = 4'h4 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3397; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3414 = 4'h5 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3398; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3415 = 4'h6 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3399; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3416 = 4'h7 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3400; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3417 = 4'h8 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3401; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3418 = 4'h9 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3402; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3419 = 4'ha == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3403; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3420 = 4'hb == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3404; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3421 = 4'hc == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3405; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3422 = 4'hd == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3406; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3423 = 4'he == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3407; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3424 = 4'hf == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3408; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3425 = 4'h0 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3157; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3426 = 4'h1 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3158; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3427 = 4'h2 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3159; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3428 = 4'h3 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3160; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3429 = 4'h4 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3161; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3430 = 4'h5 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3162; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3431 = 4'h6 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3163; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3432 = 4'h7 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3164; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3433 = 4'h8 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3165; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3434 = 4'h9 == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3166; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3435 = 4'ha == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3167; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3436 = 4'hb == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3168; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3437 = 4'hc == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3169; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3438 = 4'hd == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3170; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3439 = 4'he == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3171; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3440 = 4'hf == addrTBankSel_6 ? addrT_6[3:0] : _GEN_3172; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3441 = 4'h0 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3425; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3442 = 4'h1 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3426; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3443 = 4'h2 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3427; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3444 = 4'h3 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3428; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3445 = 4'h4 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3429; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3446 = 4'h5 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3430; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3447 = 4'h6 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3431; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3448 = 4'h7 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3432; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3449 = 4'h8 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3433; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3450 = 4'h9 == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3434; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3451 = 4'ha == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3435; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3452 = 4'hb == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3436; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3453 = 4'hc == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3437; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3454 = 4'hd == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3438; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3455 = 4'he == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3439; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3456 = 4'hf == addrSBankSel_6 ? addrS_6[3:0] : _GEN_3440; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3457 = _srcBufferNext_T_3 ? _GEN_3409 : _GEN_3173; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3458 = _srcBufferNext_T_3 ? _GEN_3410 : _GEN_3174; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3459 = _srcBufferNext_T_3 ? _GEN_3411 : _GEN_3175; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3460 = _srcBufferNext_T_3 ? _GEN_3412 : _GEN_3176; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3461 = _srcBufferNext_T_3 ? _GEN_3413 : _GEN_3177; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3462 = _srcBufferNext_T_3 ? _GEN_3414 : _GEN_3178; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3463 = _srcBufferNext_T_3 ? _GEN_3415 : _GEN_3179; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3464 = _srcBufferNext_T_3 ? _GEN_3416 : _GEN_3180; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3465 = _srcBufferNext_T_3 ? _GEN_3417 : _GEN_3181; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3466 = _srcBufferNext_T_3 ? _GEN_3418 : _GEN_3182; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3467 = _srcBufferNext_T_3 ? _GEN_3419 : _GEN_3183; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3468 = _srcBufferNext_T_3 ? _GEN_3420 : _GEN_3184; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3469 = _srcBufferNext_T_3 ? _GEN_3421 : _GEN_3185; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3470 = _srcBufferNext_T_3 ? _GEN_3422 : _GEN_3186; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3471 = _srcBufferNext_T_3 ? _GEN_3423 : _GEN_3187; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3472 = _srcBufferNext_T_3 ? _GEN_3424 : _GEN_3188; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3473 = _srcBufferNext_T_3 ? _GEN_3157 : _GEN_3441; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3474 = _srcBufferNext_T_3 ? _GEN_3158 : _GEN_3442; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3475 = _srcBufferNext_T_3 ? _GEN_3159 : _GEN_3443; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3476 = _srcBufferNext_T_3 ? _GEN_3160 : _GEN_3444; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3477 = _srcBufferNext_T_3 ? _GEN_3161 : _GEN_3445; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3478 = _srcBufferNext_T_3 ? _GEN_3162 : _GEN_3446; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3479 = _srcBufferNext_T_3 ? _GEN_3163 : _GEN_3447; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3480 = _srcBufferNext_T_3 ? _GEN_3164 : _GEN_3448; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3481 = _srcBufferNext_T_3 ? _GEN_3165 : _GEN_3449; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3482 = _srcBufferNext_T_3 ? _GEN_3166 : _GEN_3450; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3483 = _srcBufferNext_T_3 ? _GEN_3167 : _GEN_3451; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3484 = _srcBufferNext_T_3 ? _GEN_3168 : _GEN_3452; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3485 = _srcBufferNext_T_3 ? _GEN_3169 : _GEN_3453; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3486 = _srcBufferNext_T_3 ? _GEN_3170 : _GEN_3454; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3487 = _srcBufferNext_T_3 ? _GEN_3171 : _GEN_3455; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3488 = _srcBufferNext_T_3 ? _GEN_3172 : _GEN_3456; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3489 = ~_radixInit_T_11 ? _GEN_3457 : _GEN_3173; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3490 = ~_radixInit_T_11 ? _GEN_3458 : _GEN_3174; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3491 = ~_radixInit_T_11 ? _GEN_3459 : _GEN_3175; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3492 = ~_radixInit_T_11 ? _GEN_3460 : _GEN_3176; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3493 = ~_radixInit_T_11 ? _GEN_3461 : _GEN_3177; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3494 = ~_radixInit_T_11 ? _GEN_3462 : _GEN_3178; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3495 = ~_radixInit_T_11 ? _GEN_3463 : _GEN_3179; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3496 = ~_radixInit_T_11 ? _GEN_3464 : _GEN_3180; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3497 = ~_radixInit_T_11 ? _GEN_3465 : _GEN_3181; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3498 = ~_radixInit_T_11 ? _GEN_3466 : _GEN_3182; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3499 = ~_radixInit_T_11 ? _GEN_3467 : _GEN_3183; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3500 = ~_radixInit_T_11 ? _GEN_3468 : _GEN_3184; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3501 = ~_radixInit_T_11 ? _GEN_3469 : _GEN_3185; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3502 = ~_radixInit_T_11 ? _GEN_3470 : _GEN_3186; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3503 = ~_radixInit_T_11 ? _GEN_3471 : _GEN_3187; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3504 = ~_radixInit_T_11 ? _GEN_3472 : _GEN_3188; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3505 = ~_radixInit_T_11 ? _GEN_3473 : _GEN_3157; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3506 = ~_radixInit_T_11 ? _GEN_3474 : _GEN_3158; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3507 = ~_radixInit_T_11 ? _GEN_3475 : _GEN_3159; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3508 = ~_radixInit_T_11 ? _GEN_3476 : _GEN_3160; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3509 = ~_radixInit_T_11 ? _GEN_3477 : _GEN_3161; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3510 = ~_radixInit_T_11 ? _GEN_3478 : _GEN_3162; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3511 = ~_radixInit_T_11 ? _GEN_3479 : _GEN_3163; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3512 = ~_radixInit_T_11 ? _GEN_3480 : _GEN_3164; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3513 = ~_radixInit_T_11 ? _GEN_3481 : _GEN_3165; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3514 = ~_radixInit_T_11 ? _GEN_3482 : _GEN_3166; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3515 = ~_radixInit_T_11 ? _GEN_3483 : _GEN_3167; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3516 = ~_radixInit_T_11 ? _GEN_3484 : _GEN_3168; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3517 = ~_radixInit_T_11 ? _GEN_3485 : _GEN_3169; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3518 = ~_radixInit_T_11 ? _GEN_3486 : _GEN_3170; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3519 = ~_radixInit_T_11 ? _GEN_3487 : _GEN_3171; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3520 = ~_radixInit_T_11 ? _GEN_3488 : _GEN_3172; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3521 = 4'h0 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3505; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3522 = 4'h1 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3506; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3523 = 4'h2 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3507; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3524 = 4'h3 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3508; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3525 = 4'h4 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3509; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3526 = 4'h5 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3510; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3527 = 4'h6 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3511; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3528 = 4'h7 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3512; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3529 = 4'h8 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3513; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3530 = 4'h9 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3514; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3531 = 4'ha == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3515; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3532 = 4'hb == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3516; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3533 = 4'hc == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3517; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3534 = 4'hd == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3518; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3535 = 4'he == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3519; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3536 = 4'hf == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3520; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3537 = 4'h0 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3521; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3538 = 4'h1 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3522; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3539 = 4'h2 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3523; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3540 = 4'h3 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3524; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3541 = 4'h4 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3525; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3542 = 4'h5 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3526; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3543 = 4'h6 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3527; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3544 = 4'h7 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3528; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3545 = 4'h8 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3529; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3546 = 4'h9 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3530; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3547 = 4'ha == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3531; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3548 = 4'hb == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3532; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3549 = 4'hc == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3533; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3550 = 4'hd == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3534; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3551 = 4'he == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3535; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3552 = 4'hf == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3536; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3553 = 4'h0 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3489; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3554 = 4'h1 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3490; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3555 = 4'h2 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3491; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3556 = 4'h3 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3492; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3557 = 4'h4 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3493; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3558 = 4'h5 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3494; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3559 = 4'h6 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3495; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3560 = 4'h7 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3496; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3561 = 4'h8 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3497; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3562 = 4'h9 == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3498; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3563 = 4'ha == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3499; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3564 = 4'hb == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3500; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3565 = 4'hc == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3501; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3566 = 4'hd == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3502; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3567 = 4'he == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3503; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3568 = 4'hf == addrTBankSel3c_6 ? addrT3c_6 : _GEN_3504; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_3569 = 4'h0 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3553; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3570 = 4'h1 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3554; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3571 = 4'h2 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3555; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3572 = 4'h3 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3556; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3573 = 4'h4 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3557; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3574 = 4'h5 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3558; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3575 = 4'h6 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3559; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3576 = 4'h7 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3560; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3577 = 4'h8 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3561; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3578 = 4'h9 == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3562; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3579 = 4'ha == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3563; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3580 = 4'hb == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3564; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3581 = 4'hc == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3565; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3582 = 4'hd == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3566; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3583 = 4'he == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3567; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3584 = 4'hf == addrSBankSel3c_6 ? addrS3c_6 : _GEN_3568; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_3585 = _srcBufferNext_T_3 ? _GEN_3537 : _GEN_3505; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3586 = _srcBufferNext_T_3 ? _GEN_3538 : _GEN_3506; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3587 = _srcBufferNext_T_3 ? _GEN_3539 : _GEN_3507; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3588 = _srcBufferNext_T_3 ? _GEN_3540 : _GEN_3508; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3589 = _srcBufferNext_T_3 ? _GEN_3541 : _GEN_3509; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3590 = _srcBufferNext_T_3 ? _GEN_3542 : _GEN_3510; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3591 = _srcBufferNext_T_3 ? _GEN_3543 : _GEN_3511; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3592 = _srcBufferNext_T_3 ? _GEN_3544 : _GEN_3512; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3593 = _srcBufferNext_T_3 ? _GEN_3545 : _GEN_3513; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3594 = _srcBufferNext_T_3 ? _GEN_3546 : _GEN_3514; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3595 = _srcBufferNext_T_3 ? _GEN_3547 : _GEN_3515; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3596 = _srcBufferNext_T_3 ? _GEN_3548 : _GEN_3516; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3597 = _srcBufferNext_T_3 ? _GEN_3549 : _GEN_3517; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3598 = _srcBufferNext_T_3 ? _GEN_3550 : _GEN_3518; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3599 = _srcBufferNext_T_3 ? _GEN_3551 : _GEN_3519; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3600 = _srcBufferNext_T_3 ? _GEN_3552 : _GEN_3520; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3601 = _srcBufferNext_T_3 ? _GEN_3489 : _GEN_3569; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3602 = _srcBufferNext_T_3 ? _GEN_3490 : _GEN_3570; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3603 = _srcBufferNext_T_3 ? _GEN_3491 : _GEN_3571; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3604 = _srcBufferNext_T_3 ? _GEN_3492 : _GEN_3572; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3605 = _srcBufferNext_T_3 ? _GEN_3493 : _GEN_3573; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3606 = _srcBufferNext_T_3 ? _GEN_3494 : _GEN_3574; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3607 = _srcBufferNext_T_3 ? _GEN_3495 : _GEN_3575; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3608 = _srcBufferNext_T_3 ? _GEN_3496 : _GEN_3576; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3609 = _srcBufferNext_T_3 ? _GEN_3497 : _GEN_3577; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3610 = _srcBufferNext_T_3 ? _GEN_3498 : _GEN_3578; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3611 = _srcBufferNext_T_3 ? _GEN_3499 : _GEN_3579; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3612 = _srcBufferNext_T_3 ? _GEN_3500 : _GEN_3580; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3613 = _srcBufferNext_T_3 ? _GEN_3501 : _GEN_3581; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3614 = _srcBufferNext_T_3 ? _GEN_3502 : _GEN_3582; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3615 = _srcBufferNext_T_3 ? _GEN_3503 : _GEN_3583; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3616 = _srcBufferNext_T_3 ? _GEN_3504 : _GEN_3584; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_3617 = ~procState3c ? _GEN_3585 : _GEN_3505; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3618 = ~procState3c ? _GEN_3586 : _GEN_3506; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3619 = ~procState3c ? _GEN_3587 : _GEN_3507; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3620 = ~procState3c ? _GEN_3588 : _GEN_3508; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3621 = ~procState3c ? _GEN_3589 : _GEN_3509; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3622 = ~procState3c ? _GEN_3590 : _GEN_3510; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3623 = ~procState3c ? _GEN_3591 : _GEN_3511; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3624 = ~procState3c ? _GEN_3592 : _GEN_3512; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3625 = ~procState3c ? _GEN_3593 : _GEN_3513; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3626 = ~procState3c ? _GEN_3594 : _GEN_3514; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3627 = ~procState3c ? _GEN_3595 : _GEN_3515; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3628 = ~procState3c ? _GEN_3596 : _GEN_3516; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3629 = ~procState3c ? _GEN_3597 : _GEN_3517; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3630 = ~procState3c ? _GEN_3598 : _GEN_3518; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3631 = ~procState3c ? _GEN_3599 : _GEN_3519; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3632 = ~procState3c ? _GEN_3600 : _GEN_3520; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3633 = ~procState3c ? _GEN_3601 : _GEN_3489; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3634 = ~procState3c ? _GEN_3602 : _GEN_3490; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3635 = ~procState3c ? _GEN_3603 : _GEN_3491; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3636 = ~procState3c ? _GEN_3604 : _GEN_3492; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3637 = ~procState3c ? _GEN_3605 : _GEN_3493; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3638 = ~procState3c ? _GEN_3606 : _GEN_3494; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3639 = ~procState3c ? _GEN_3607 : _GEN_3495; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3640 = ~procState3c ? _GEN_3608 : _GEN_3496; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3641 = ~procState3c ? _GEN_3609 : _GEN_3497; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3642 = ~procState3c ? _GEN_3610 : _GEN_3498; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3643 = ~procState3c ? _GEN_3611 : _GEN_3499; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3644 = ~procState3c ? _GEN_3612 : _GEN_3500; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3645 = ~procState3c ? _GEN_3613 : _GEN_3501; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3646 = ~procState3c ? _GEN_3614 : _GEN_3502; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3647 = ~procState3c ? _GEN_3615 : _GEN_3503; // @[FFTEngine.scala 549:28]
  wire [3:0] _GEN_3648 = ~procState3c ? _GEN_3616 : _GEN_3504; // @[FFTEngine.scala 549:28]
  wire [14:0] _writeDataS3c_re_T_6 = fftCalc_6_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_6 = writeDataTRPre3c_6[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_3649 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_6[14]}},_writeDataS3c_re_T_6}) : $signed(
    fftCalc_6_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_3650 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_6[14]}},_writeDataS3c_im_T_6}) : $signed(
    fftCalc_6_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_3654 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_6) : $signed(_GEN_3650); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_3658 = fftCalc_6_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_6_im = sameAddr3c ? $signed(_GEN_3654) : $signed(_GEN_3658); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_3651 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_6_im) : $signed(writeDataTIPre3c_6); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_3653 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_6_io_dataOutSR3c) : $signed(_GEN_3649); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_3657 = fftCalc_6_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_6_re = sameAddr3c ? $signed(_GEN_3653) : $signed(_GEN_3657); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_3652 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_6_re) : $signed(writeDataTRPre3c_6); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_3655 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_6_im) : $signed(_GEN_3651); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_3656 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_6_re) : $signed(_GEN_3652); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_20 = 16'sh0 - $signed(writeDataTIPre3c_6); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_3660 = _addrSBankSel3c_T_1 & addrTBankSel3c_6 == 4'h8 & addrT3c_6 == 4'h1 ? $signed(
    _writeDataT3c_im_T_20) : $signed(writeDataTIPre3c_6); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_42 = sameAddr3c ? $signed(_GEN_3653) : $signed(_GEN_3657); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_43 = sameAddr3c ? $signed(_GEN_3654) : $signed(_GEN_3658); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_44 = {_io_writeDataSram0Bank_0_T_43,_io_writeDataSram0Bank_0_T_42}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_45 = sameAddr3c ? $signed(_GEN_3656) : $signed(writeDataTRPre3c_6); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_46 = sameAddr3c ? $signed(_GEN_3655) : $signed(_GEN_3660); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_47 = {_io_writeDataSram0Bank_0_T_46,_io_writeDataSram0Bank_0_T_45}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_3665 = 4'h0 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3209; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3667 = 4'h0 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3665; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3669 = procState3c ? _GEN_3209 : _GEN_3667; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3671 = 4'h1 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3215; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3673 = 4'h1 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3671; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3675 = procState3c ? _GEN_3215 : _GEN_3673; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3677 = 4'h2 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3221; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3679 = 4'h2 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3677; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3681 = procState3c ? _GEN_3221 : _GEN_3679; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3683 = 4'h3 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3227; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3685 = 4'h3 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3683; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3687 = procState3c ? _GEN_3227 : _GEN_3685; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3689 = 4'h4 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3233; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3691 = 4'h4 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3689; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3693 = procState3c ? _GEN_3233 : _GEN_3691; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3695 = 4'h5 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3239; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3697 = 4'h5 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3695; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3699 = procState3c ? _GEN_3239 : _GEN_3697; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3701 = 4'h6 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3245; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3703 = 4'h6 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3701; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3705 = procState3c ? _GEN_3245 : _GEN_3703; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3707 = 4'h7 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3251; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3709 = 4'h7 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3707; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3711 = procState3c ? _GEN_3251 : _GEN_3709; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3713 = 4'h8 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3257; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3715 = 4'h8 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3713; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3717 = procState3c ? _GEN_3257 : _GEN_3715; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3719 = 4'h9 == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3263; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3721 = 4'h9 == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3719; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3723 = procState3c ? _GEN_3263 : _GEN_3721; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3725 = 4'ha == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3269; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3727 = 4'ha == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3725; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3729 = procState3c ? _GEN_3269 : _GEN_3727; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3731 = 4'hb == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3275; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3733 = 4'hb == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3731; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3735 = procState3c ? _GEN_3275 : _GEN_3733; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3737 = 4'hc == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3281; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3739 = 4'hc == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3737; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3741 = procState3c ? _GEN_3281 : _GEN_3739; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3743 = 4'hd == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3287; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3745 = 4'hd == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3743; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3747 = procState3c ? _GEN_3287 : _GEN_3745; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3749 = 4'he == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3293; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3751 = 4'he == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3749; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3753 = procState3c ? _GEN_3293 : _GEN_3751; // @[FFTEngine.scala 601:30]
  wire [31:0] _GEN_3755 = 4'hf == addrTBankSel3c_6 ? _io_writeDataSram0Bank_0_T_47 : _GEN_3299; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_3757 = 4'hf == addrSBankSel3c_6 ? _io_writeDataSram0Bank_0_T_44 : _GEN_3755; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_3759 = procState3c ? _GEN_3299 : _GEN_3757; // @[FFTEngine.scala 601:30]
  reg [3:0] addrS1c_7; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_7; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_7; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_7; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_7; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_7; // @[Reg.scala 35:20]
  wire [3:0] _addrSBankSel_T_36 = _radixInit_T_11 ? addrSBankSelProc_7 : addrSBankSelKernel_7; // @[FFTEngine.scala 471:32]
  wire [3:0] _addrTBankSel_T_36 = _radixInit_T_11 ? addrTBankSelProc_7 : addrTBankSelKernel_7; // @[FFTEngine.scala 472:32]
  wire [3:0] _addrSBankSel_T_40 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0 ? addrSBankSelProc_7 :
    addrSBankSelKernel_7; // @[FFTEngine.scala 474:32]
  wire [3:0] _addrTBankSel_T_40 = _addrSBankSel_T_4 ? addrTBankSelProc_7 : addrTBankSelKernel_7; // @[FFTEngine.scala 475:32]
  wire [3:0] addrSBankSel_7 = io_fftMode ? _addrSBankSel_T_36 : _addrSBankSel_T_40; // @[FFTEngine.scala 470:21 471:26 474:26]
  wire [3:0] addrTBankSel_7 = io_fftMode ? _addrTBankSel_T_36 : _addrTBankSel_T_40; // @[FFTEngine.scala 470:21 472:26 475:26]
  reg [3:0] addrSBankSel1c_7; // @[Reg.scala 35:20]
  reg [3:0] addrTBankSel1c_7; // @[Reg.scala 35:20]
  wire [15:0] _GEN_3772 = 4'h1 == addrSBankSel1c_7 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3773 = 4'h2 == addrSBankSel1c_7 ? $signed(dataInPre_2_re) : $signed(_GEN_3772); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3774 = 4'h3 == addrSBankSel1c_7 ? $signed(dataInPre_3_re) : $signed(_GEN_3773); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3775 = 4'h4 == addrSBankSel1c_7 ? $signed(dataInPre_4_re) : $signed(_GEN_3774); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3776 = 4'h5 == addrSBankSel1c_7 ? $signed(dataInPre_5_re) : $signed(_GEN_3775); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3777 = 4'h6 == addrSBankSel1c_7 ? $signed(dataInPre_6_re) : $signed(_GEN_3776); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3778 = 4'h7 == addrSBankSel1c_7 ? $signed(dataInPre_7_re) : $signed(_GEN_3777); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3779 = 4'h8 == addrSBankSel1c_7 ? $signed(dataInPre_8_re) : $signed(_GEN_3778); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3780 = 4'h9 == addrSBankSel1c_7 ? $signed(dataInPre_9_re) : $signed(_GEN_3779); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3781 = 4'ha == addrSBankSel1c_7 ? $signed(dataInPre_10_re) : $signed(_GEN_3780); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3782 = 4'hb == addrSBankSel1c_7 ? $signed(dataInPre_11_re) : $signed(_GEN_3781); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3783 = 4'hc == addrSBankSel1c_7 ? $signed(dataInPre_12_re) : $signed(_GEN_3782); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3784 = 4'hd == addrSBankSel1c_7 ? $signed(dataInPre_13_re) : $signed(_GEN_3783); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3785 = 4'he == addrSBankSel1c_7 ? $signed(dataInPre_14_re) : $signed(_GEN_3784); // @[FFTEngine.scala 482:{29,29}]
  wire [15:0] _GEN_3788 = 4'h1 == addrSBankSel1c_7 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3789 = 4'h2 == addrSBankSel1c_7 ? $signed(dataInPre_2_im) : $signed(_GEN_3788); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3790 = 4'h3 == addrSBankSel1c_7 ? $signed(dataInPre_3_im) : $signed(_GEN_3789); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3791 = 4'h4 == addrSBankSel1c_7 ? $signed(dataInPre_4_im) : $signed(_GEN_3790); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3792 = 4'h5 == addrSBankSel1c_7 ? $signed(dataInPre_5_im) : $signed(_GEN_3791); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3793 = 4'h6 == addrSBankSel1c_7 ? $signed(dataInPre_6_im) : $signed(_GEN_3792); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3794 = 4'h7 == addrSBankSel1c_7 ? $signed(dataInPre_7_im) : $signed(_GEN_3793); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3795 = 4'h8 == addrSBankSel1c_7 ? $signed(dataInPre_8_im) : $signed(_GEN_3794); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3796 = 4'h9 == addrSBankSel1c_7 ? $signed(dataInPre_9_im) : $signed(_GEN_3795); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3797 = 4'ha == addrSBankSel1c_7 ? $signed(dataInPre_10_im) : $signed(_GEN_3796); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3798 = 4'hb == addrSBankSel1c_7 ? $signed(dataInPre_11_im) : $signed(_GEN_3797); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3799 = 4'hc == addrSBankSel1c_7 ? $signed(dataInPre_12_im) : $signed(_GEN_3798); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3800 = 4'hd == addrSBankSel1c_7 ? $signed(dataInPre_13_im) : $signed(_GEN_3799); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3801 = 4'he == addrSBankSel1c_7 ? $signed(dataInPre_14_im) : $signed(_GEN_3800); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3802 = 4'hf == addrSBankSel1c_7 ? $signed(dataInPre_15_im) : $signed(_GEN_3801); // @[FFTEngine.scala 483:{35,35}]
  wire [15:0] _GEN_3804 = 4'h1 == addrTBankSel1c_7 ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3805 = 4'h2 == addrTBankSel1c_7 ? $signed(dataInPre_2_im) : $signed(_GEN_3804); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3806 = 4'h3 == addrTBankSel1c_7 ? $signed(dataInPre_3_im) : $signed(_GEN_3805); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3807 = 4'h4 == addrTBankSel1c_7 ? $signed(dataInPre_4_im) : $signed(_GEN_3806); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3808 = 4'h5 == addrTBankSel1c_7 ? $signed(dataInPre_5_im) : $signed(_GEN_3807); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3809 = 4'h6 == addrTBankSel1c_7 ? $signed(dataInPre_6_im) : $signed(_GEN_3808); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3810 = 4'h7 == addrTBankSel1c_7 ? $signed(dataInPre_7_im) : $signed(_GEN_3809); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3811 = 4'h8 == addrTBankSel1c_7 ? $signed(dataInPre_8_im) : $signed(_GEN_3810); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3812 = 4'h9 == addrTBankSel1c_7 ? $signed(dataInPre_9_im) : $signed(_GEN_3811); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3813 = 4'ha == addrTBankSel1c_7 ? $signed(dataInPre_10_im) : $signed(_GEN_3812); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3814 = 4'hb == addrTBankSel1c_7 ? $signed(dataInPre_11_im) : $signed(_GEN_3813); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3815 = 4'hc == addrTBankSel1c_7 ? $signed(dataInPre_12_im) : $signed(_GEN_3814); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3816 = 4'hd == addrTBankSel1c_7 ? $signed(dataInPre_13_im) : $signed(_GEN_3815); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3817 = 4'he == addrTBankSel1c_7 ? $signed(dataInPre_14_im) : $signed(_GEN_3816); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3818 = 4'hf == addrTBankSel1c_7 ? $signed(dataInPre_15_im) : $signed(_GEN_3817); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3820 = 4'h1 == addrTBankSel1c_7 ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3821 = 4'h2 == addrTBankSel1c_7 ? $signed(dataInPre_2_re) : $signed(_GEN_3820); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3822 = 4'h3 == addrTBankSel1c_7 ? $signed(dataInPre_3_re) : $signed(_GEN_3821); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3823 = 4'h4 == addrTBankSel1c_7 ? $signed(dataInPre_4_re) : $signed(_GEN_3822); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3824 = 4'h5 == addrTBankSel1c_7 ? $signed(dataInPre_5_re) : $signed(_GEN_3823); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3825 = 4'h6 == addrTBankSel1c_7 ? $signed(dataInPre_6_re) : $signed(_GEN_3824); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3826 = 4'h7 == addrTBankSel1c_7 ? $signed(dataInPre_7_re) : $signed(_GEN_3825); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3827 = 4'h8 == addrTBankSel1c_7 ? $signed(dataInPre_8_re) : $signed(_GEN_3826); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3828 = 4'h9 == addrTBankSel1c_7 ? $signed(dataInPre_9_re) : $signed(_GEN_3827); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3829 = 4'ha == addrTBankSel1c_7 ? $signed(dataInPre_10_re) : $signed(_GEN_3828); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3830 = 4'hb == addrTBankSel1c_7 ? $signed(dataInPre_11_re) : $signed(_GEN_3829); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3831 = 4'hc == addrTBankSel1c_7 ? $signed(dataInPre_12_re) : $signed(_GEN_3830); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3832 = 4'hd == addrTBankSel1c_7 ? $signed(dataInPre_13_re) : $signed(_GEN_3831); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3833 = 4'he == addrTBankSel1c_7 ? $signed(dataInPre_14_re) : $signed(_GEN_3832); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _GEN_3834 = 4'hf == addrTBankSel1c_7 ? $signed(dataInPre_15_re) : $signed(_GEN_3833); // @[FFTEngine.scala 484:{35,35}]
  wire [15:0] _writeDataTRPre3c_T_45 = 16'sh0 - $signed(fftCalc_7_io_dataOutTI3c); // @[FFTEngine.scala 498:132]
  wire [15:0] _writeDataTRPre3c_T_46 = io_fftMode ? $signed(fftCalc_7_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_45); // @[FFTEngine.scala 498:100]
  wire [15:0] _writeDataTRPre3c_T_47 = _T_12 ? $signed(fftCalc_7_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_46); // @[FFTEngine.scala 498:52]
  wire [15:0] writeDataTRPre3c_7 = procState3c ? $signed(_writeDataTRPre3c_T_47) : $signed(fftCalc_7_io_dataOutTR3c); // @[FFTEngine.scala 498:35]
  wire [15:0] _writeDataTIPre3c_T_69 = 16'sh0 - $signed(fftCalc_7_io_dataOutTR3c); // @[FFTEngine.scala 499:109]
  wire [15:0] _writeDataTIPre3c_T_70 = io_fftMode ? $signed(_writeDataTIPre3c_T_69) : $signed(fftCalc_7_io_dataOutTR3c); // @[FFTEngine.scala 499:101]
  wire [15:0] _writeDataTIPre3c_T_71 = _T_12 ? $signed(_writeDataTRPre3c_T_45) : $signed(_writeDataTIPre3c_T_70); // @[FFTEngine.scala 499:52]
  wire [15:0] writeDataTIPre3c_7 = procState3c ? $signed(_writeDataTIPre3c_T_71) : $signed(fftCalc_7_io_dataOutTI3c); // @[FFTEngine.scala 499:35]
  wire [3:0] _addrSBankSel3c_T_38 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_7_r :
    addrSBankSelKernel3c_7_r; // @[FFTEngine.scala 505:34]
  wire [3:0] _addrTBankSel3c_T_38 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_7_r : addrTBankSelKernel3c_7_r; // @[FFTEngine.scala 506:34]
  wire [3:0] _addrSBankSel3c_T_39 = procState3c ? addrSBankSelProc3c_7_r : addrSBankSelKernel3c_7_r; // @[FFTEngine.scala 508:34]
  wire [3:0] _addrTBankSel3c_T_39 = procState3c ? addrTBankSelProc3c_7_r : addrTBankSelKernel3c_7_r; // @[FFTEngine.scala 509:34]
  wire [3:0] addrSBankSel3c_7 = io_fftMode ? _addrSBankSel3c_T_38 : _addrSBankSel3c_T_39; // @[FFTEngine.scala 504:21 505:28 508:28]
  wire [3:0] addrTBankSel3c_7 = io_fftMode ? _addrTBankSel3c_T_38 : _addrTBankSel3c_T_39; // @[FFTEngine.scala 504:21 506:28 509:28]
  wire [3:0] _GEN_3853 = 4'h0 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3633; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3854 = 4'h1 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3634; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3855 = 4'h2 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3635; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3856 = 4'h3 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3636; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3857 = 4'h4 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3637; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3858 = 4'h5 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3638; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3859 = 4'h6 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3639; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3860 = 4'h7 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3640; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3861 = 4'h8 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3641; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3862 = 4'h9 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3642; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3863 = 4'ha == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3643; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3864 = 4'hb == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3644; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3865 = 4'hc == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3645; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3866 = 4'hd == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3646; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3867 = 4'he == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3647; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3868 = 4'hf == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3648; // @[FFTEngine.scala 531:{48,48}]
  wire [3:0] _GEN_3869 = 4'h0 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3853; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3870 = 4'h1 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3854; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3871 = 4'h2 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3855; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3872 = 4'h3 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3856; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3873 = 4'h4 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3857; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3874 = 4'h5 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3858; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3875 = 4'h6 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3859; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3876 = 4'h7 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3860; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3877 = 4'h8 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3861; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3878 = 4'h9 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3862; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3879 = 4'ha == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3863; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3880 = 4'hb == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3864; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3881 = 4'hc == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3865; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3882 = 4'hd == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3866; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3883 = 4'he == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3867; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3884 = 4'hf == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3868; // @[FFTEngine.scala 532:{48,48}]
  wire [3:0] _GEN_3885 = 4'h0 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3617; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3886 = 4'h1 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3618; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3887 = 4'h2 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3619; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3888 = 4'h3 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3620; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3889 = 4'h4 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3621; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3890 = 4'h5 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3622; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3891 = 4'h6 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3623; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3892 = 4'h7 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3624; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3893 = 4'h8 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3625; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3894 = 4'h9 == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3626; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3895 = 4'ha == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3627; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3896 = 4'hb == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3628; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3897 = 4'hc == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3629; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3898 = 4'hd == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3630; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3899 = 4'he == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3631; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3900 = 4'hf == addrTBankSel_7 ? addrT_7[3:0] : _GEN_3632; // @[FFTEngine.scala 534:{48,48}]
  wire [3:0] _GEN_3901 = 4'h0 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3885; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3902 = 4'h1 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3886; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3903 = 4'h2 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3887; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3904 = 4'h3 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3888; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3905 = 4'h4 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3889; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3906 = 4'h5 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3890; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3907 = 4'h6 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3891; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3908 = 4'h7 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3892; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3909 = 4'h8 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3893; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3910 = 4'h9 == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3894; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3911 = 4'ha == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3895; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3912 = 4'hb == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3896; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3913 = 4'hc == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3897; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3914 = 4'hd == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3898; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3915 = 4'he == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3899; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3916 = 4'hf == addrSBankSel_7 ? addrS_7[3:0] : _GEN_3900; // @[FFTEngine.scala 535:{48,48}]
  wire [3:0] _GEN_3917 = _srcBufferNext_T_3 ? _GEN_3869 : _GEN_3633; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3918 = _srcBufferNext_T_3 ? _GEN_3870 : _GEN_3634; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3919 = _srcBufferNext_T_3 ? _GEN_3871 : _GEN_3635; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3920 = _srcBufferNext_T_3 ? _GEN_3872 : _GEN_3636; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3921 = _srcBufferNext_T_3 ? _GEN_3873 : _GEN_3637; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3922 = _srcBufferNext_T_3 ? _GEN_3874 : _GEN_3638; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3923 = _srcBufferNext_T_3 ? _GEN_3875 : _GEN_3639; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3924 = _srcBufferNext_T_3 ? _GEN_3876 : _GEN_3640; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3925 = _srcBufferNext_T_3 ? _GEN_3877 : _GEN_3641; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3926 = _srcBufferNext_T_3 ? _GEN_3878 : _GEN_3642; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3927 = _srcBufferNext_T_3 ? _GEN_3879 : _GEN_3643; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3928 = _srcBufferNext_T_3 ? _GEN_3880 : _GEN_3644; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3929 = _srcBufferNext_T_3 ? _GEN_3881 : _GEN_3645; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3930 = _srcBufferNext_T_3 ? _GEN_3882 : _GEN_3646; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3931 = _srcBufferNext_T_3 ? _GEN_3883 : _GEN_3647; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3932 = _srcBufferNext_T_3 ? _GEN_3884 : _GEN_3648; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3933 = _srcBufferNext_T_3 ? _GEN_3617 : _GEN_3901; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3934 = _srcBufferNext_T_3 ? _GEN_3618 : _GEN_3902; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3935 = _srcBufferNext_T_3 ? _GEN_3619 : _GEN_3903; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3936 = _srcBufferNext_T_3 ? _GEN_3620 : _GEN_3904; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3937 = _srcBufferNext_T_3 ? _GEN_3621 : _GEN_3905; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3938 = _srcBufferNext_T_3 ? _GEN_3622 : _GEN_3906; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3939 = _srcBufferNext_T_3 ? _GEN_3623 : _GEN_3907; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3940 = _srcBufferNext_T_3 ? _GEN_3624 : _GEN_3908; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3941 = _srcBufferNext_T_3 ? _GEN_3625 : _GEN_3909; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3942 = _srcBufferNext_T_3 ? _GEN_3626 : _GEN_3910; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3943 = _srcBufferNext_T_3 ? _GEN_3627 : _GEN_3911; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3944 = _srcBufferNext_T_3 ? _GEN_3628 : _GEN_3912; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3945 = _srcBufferNext_T_3 ? _GEN_3629 : _GEN_3913; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3946 = _srcBufferNext_T_3 ? _GEN_3630 : _GEN_3914; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3947 = _srcBufferNext_T_3 ? _GEN_3631 : _GEN_3915; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3948 = _srcBufferNext_T_3 ? _GEN_3632 : _GEN_3916; // @[FFTEngine.scala 530:37]
  wire [3:0] _GEN_3949 = ~_radixInit_T_11 ? _GEN_3917 : _GEN_3633; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3950 = ~_radixInit_T_11 ? _GEN_3918 : _GEN_3634; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3951 = ~_radixInit_T_11 ? _GEN_3919 : _GEN_3635; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3952 = ~_radixInit_T_11 ? _GEN_3920 : _GEN_3636; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3953 = ~_radixInit_T_11 ? _GEN_3921 : _GEN_3637; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3954 = ~_radixInit_T_11 ? _GEN_3922 : _GEN_3638; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3955 = ~_radixInit_T_11 ? _GEN_3923 : _GEN_3639; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3956 = ~_radixInit_T_11 ? _GEN_3924 : _GEN_3640; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3957 = ~_radixInit_T_11 ? _GEN_3925 : _GEN_3641; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3958 = ~_radixInit_T_11 ? _GEN_3926 : _GEN_3642; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3959 = ~_radixInit_T_11 ? _GEN_3927 : _GEN_3643; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3960 = ~_radixInit_T_11 ? _GEN_3928 : _GEN_3644; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3961 = ~_radixInit_T_11 ? _GEN_3929 : _GEN_3645; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3962 = ~_radixInit_T_11 ? _GEN_3930 : _GEN_3646; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3963 = ~_radixInit_T_11 ? _GEN_3931 : _GEN_3647; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3964 = ~_radixInit_T_11 ? _GEN_3932 : _GEN_3648; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3965 = ~_radixInit_T_11 ? _GEN_3933 : _GEN_3617; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3966 = ~_radixInit_T_11 ? _GEN_3934 : _GEN_3618; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3967 = ~_radixInit_T_11 ? _GEN_3935 : _GEN_3619; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3968 = ~_radixInit_T_11 ? _GEN_3936 : _GEN_3620; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3969 = ~_radixInit_T_11 ? _GEN_3937 : _GEN_3621; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3970 = ~_radixInit_T_11 ? _GEN_3938 : _GEN_3622; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3971 = ~_radixInit_T_11 ? _GEN_3939 : _GEN_3623; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3972 = ~_radixInit_T_11 ? _GEN_3940 : _GEN_3624; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3973 = ~_radixInit_T_11 ? _GEN_3941 : _GEN_3625; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3974 = ~_radixInit_T_11 ? _GEN_3942 : _GEN_3626; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3975 = ~_radixInit_T_11 ? _GEN_3943 : _GEN_3627; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3976 = ~_radixInit_T_11 ? _GEN_3944 : _GEN_3628; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3977 = ~_radixInit_T_11 ? _GEN_3945 : _GEN_3629; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3978 = ~_radixInit_T_11 ? _GEN_3946 : _GEN_3630; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3979 = ~_radixInit_T_11 ? _GEN_3947 : _GEN_3631; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3980 = ~_radixInit_T_11 ? _GEN_3948 : _GEN_3632; // @[FFTEngine.scala 529:26]
  wire [3:0] _GEN_3981 = 4'h0 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3965; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3982 = 4'h1 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3966; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3983 = 4'h2 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3967; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3984 = 4'h3 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3968; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3985 = 4'h4 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3969; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3986 = 4'h5 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3970; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3987 = 4'h6 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3971; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3988 = 4'h7 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3972; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3989 = 4'h8 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3973; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3990 = 4'h9 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3974; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3991 = 4'ha == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3975; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3992 = 4'hb == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3976; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3993 = 4'hc == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3977; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3994 = 4'hd == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3978; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3995 = 4'he == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3979; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3996 = 4'hf == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3980; // @[FFTEngine.scala 551:{50,50}]
  wire [3:0] _GEN_3997 = 4'h0 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3981; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3998 = 4'h1 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3982; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_3999 = 4'h2 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3983; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4000 = 4'h3 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3984; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4001 = 4'h4 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3985; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4002 = 4'h5 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3986; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4003 = 4'h6 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3987; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4004 = 4'h7 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3988; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4005 = 4'h8 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3989; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4006 = 4'h9 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3990; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4007 = 4'ha == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3991; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4008 = 4'hb == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3992; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4009 = 4'hc == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3993; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4010 = 4'hd == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3994; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4011 = 4'he == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3995; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4012 = 4'hf == addrSBankSel3c_7 ? addrS3c_7 : _GEN_3996; // @[FFTEngine.scala 552:{50,50}]
  wire [3:0] _GEN_4013 = 4'h0 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3949; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4014 = 4'h1 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3950; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4015 = 4'h2 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3951; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4016 = 4'h3 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3952; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4017 = 4'h4 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3953; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4018 = 4'h5 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3954; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4019 = 4'h6 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3955; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4020 = 4'h7 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3956; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4021 = 4'h8 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3957; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4022 = 4'h9 == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3958; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4023 = 4'ha == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3959; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4024 = 4'hb == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3960; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4025 = 4'hc == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3961; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4026 = 4'hd == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3962; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4027 = 4'he == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3963; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4028 = 4'hf == addrTBankSel3c_7 ? addrT3c_7 : _GEN_3964; // @[FFTEngine.scala 554:{50,50}]
  wire [3:0] _GEN_4029 = 4'h0 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4013; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4030 = 4'h1 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4014; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4031 = 4'h2 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4015; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4032 = 4'h3 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4016; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4033 = 4'h4 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4017; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4034 = 4'h5 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4018; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4035 = 4'h6 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4019; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4036 = 4'h7 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4020; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4037 = 4'h8 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4021; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4038 = 4'h9 == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4022; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4039 = 4'ha == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4023; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4040 = 4'hb == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4024; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4041 = 4'hc == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4025; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4042 = 4'hd == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4026; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4043 = 4'he == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4027; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4044 = 4'hf == addrSBankSel3c_7 ? addrS3c_7 : _GEN_4028; // @[FFTEngine.scala 555:{50,50}]
  wire [3:0] _GEN_4045 = _srcBufferNext_T_3 ? _GEN_3997 : _GEN_3965; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4046 = _srcBufferNext_T_3 ? _GEN_3998 : _GEN_3966; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4047 = _srcBufferNext_T_3 ? _GEN_3999 : _GEN_3967; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4048 = _srcBufferNext_T_3 ? _GEN_4000 : _GEN_3968; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4049 = _srcBufferNext_T_3 ? _GEN_4001 : _GEN_3969; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4050 = _srcBufferNext_T_3 ? _GEN_4002 : _GEN_3970; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4051 = _srcBufferNext_T_3 ? _GEN_4003 : _GEN_3971; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4052 = _srcBufferNext_T_3 ? _GEN_4004 : _GEN_3972; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4053 = _srcBufferNext_T_3 ? _GEN_4005 : _GEN_3973; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4054 = _srcBufferNext_T_3 ? _GEN_4006 : _GEN_3974; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4055 = _srcBufferNext_T_3 ? _GEN_4007 : _GEN_3975; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4056 = _srcBufferNext_T_3 ? _GEN_4008 : _GEN_3976; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4057 = _srcBufferNext_T_3 ? _GEN_4009 : _GEN_3977; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4058 = _srcBufferNext_T_3 ? _GEN_4010 : _GEN_3978; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4059 = _srcBufferNext_T_3 ? _GEN_4011 : _GEN_3979; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4060 = _srcBufferNext_T_3 ? _GEN_4012 : _GEN_3980; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4061 = _srcBufferNext_T_3 ? _GEN_3949 : _GEN_4029; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4062 = _srcBufferNext_T_3 ? _GEN_3950 : _GEN_4030; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4063 = _srcBufferNext_T_3 ? _GEN_3951 : _GEN_4031; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4064 = _srcBufferNext_T_3 ? _GEN_3952 : _GEN_4032; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4065 = _srcBufferNext_T_3 ? _GEN_3953 : _GEN_4033; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4066 = _srcBufferNext_T_3 ? _GEN_3954 : _GEN_4034; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4067 = _srcBufferNext_T_3 ? _GEN_3955 : _GEN_4035; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4068 = _srcBufferNext_T_3 ? _GEN_3956 : _GEN_4036; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4069 = _srcBufferNext_T_3 ? _GEN_3957 : _GEN_4037; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4070 = _srcBufferNext_T_3 ? _GEN_3958 : _GEN_4038; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4071 = _srcBufferNext_T_3 ? _GEN_3959 : _GEN_4039; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4072 = _srcBufferNext_T_3 ? _GEN_3960 : _GEN_4040; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4073 = _srcBufferNext_T_3 ? _GEN_3961 : _GEN_4041; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4074 = _srcBufferNext_T_3 ? _GEN_3962 : _GEN_4042; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4075 = _srcBufferNext_T_3 ? _GEN_3963 : _GEN_4043; // @[FFTEngine.scala 550:37]
  wire [3:0] _GEN_4076 = _srcBufferNext_T_3 ? _GEN_3964 : _GEN_4044; // @[FFTEngine.scala 550:37]
  wire [14:0] _writeDataS3c_re_T_7 = fftCalc_7_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 579:53]
  wire [14:0] _writeDataS3c_im_T_7 = writeDataTRPre3c_7[15:1]; // @[FFTEngine.scala 580:53]
  wire [15:0] _GEN_4109 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T_7[14]}},_writeDataS3c_re_T_7}) : $signed(
    fftCalc_7_io_dataOutSR3c); // @[FFTEngine.scala 578:55 579:33 583:33]
  wire [15:0] _GEN_4110 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T_7[14]}},_writeDataS3c_im_T_7}) : $signed(
    fftCalc_7_io_dataOutSI3c); // @[FFTEngine.scala 578:55 580:33 584:33]
  wire [15:0] _GEN_4114 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c_7) : $signed(_GEN_4110); // @[FFTEngine.scala 574:47 576:33]
  wire [15:0] _GEN_4118 = fftCalc_7_io_dataOutSI3c; // @[FFTEngine.scala 588:120 590:29 595:29]
  wire [15:0] writeDataS3c_7_im = sameAddr3c ? $signed(_GEN_4114) : $signed(_GEN_4118); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_4111 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_7_im) : $signed(writeDataTIPre3c_7); // @[FFTEngine.scala 578:55 581:30 586:33]
  wire [15:0] _GEN_4113 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_7_io_dataOutSR3c) : $signed(_GEN_4109); // @[FFTEngine.scala 574:47 575:33]
  wire [15:0] _GEN_4117 = fftCalc_7_io_dataOutSR3c; // @[FFTEngine.scala 588:120 589:29 594:29]
  wire [15:0] writeDataS3c_7_re = sameAddr3c ? $signed(_GEN_4113) : $signed(_GEN_4117); // @[FFTEngine.scala 573:26]
  wire [15:0] _GEN_4112 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_7_re) : $signed(writeDataTRPre3c_7); // @[FFTEngine.scala 578:55 581:30 585:33]
  wire [15:0] _GEN_4115 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_7_im) : $signed(_GEN_4111); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _GEN_4116 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_7_re) : $signed(_GEN_4112); // @[FFTEngine.scala 574:47 577:30]
  wire [15:0] _writeDataT3c_im_T_23 = 16'sh0 - $signed(writeDataTIPre3c_7); // @[FFTEngine.scala 592:32]
  wire [15:0] _GEN_4120 = _addrSBankSel3c_T_1 & addrTBankSel3c_7 == 4'h8 & addrT3c_7 == 4'h1 ? $signed(
    _writeDataT3c_im_T_23) : $signed(writeDataTIPre3c_7); // @[FFTEngine.scala 588:120 592:29 597:29]
  wire [15:0] _io_writeDataSram0Bank_0_T_48 = sameAddr3c ? $signed(_GEN_4113) : $signed(_GEN_4117); // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_49 = sameAddr3c ? $signed(_GEN_4114) : $signed(_GEN_4118); // @[FFTEngine.scala 613:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_50 = {_io_writeDataSram0Bank_0_T_49,_io_writeDataSram0Bank_0_T_48}; // @[FFTEngine.scala 613:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_51 = sameAddr3c ? $signed(_GEN_4116) : $signed(writeDataTRPre3c_7); // @[FFTEngine.scala 616:62]
  wire [15:0] _io_writeDataSram0Bank_0_T_52 = sameAddr3c ? $signed(_GEN_4115) : $signed(_GEN_4120); // @[FFTEngine.scala 616:62]
  wire [31:0] _io_writeDataSram0Bank_0_T_53 = {_io_writeDataSram0Bank_0_T_52,_io_writeDataSram0Bank_0_T_51}; // @[FFTEngine.scala 616:62]
  wire [31:0] _GEN_4125 = 4'h0 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3669; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4127 = 4'h0 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4125; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4131 = 4'h1 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3675; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4133 = 4'h1 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4131; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4137 = 4'h2 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3681; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4139 = 4'h2 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4137; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4143 = 4'h3 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3687; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4145 = 4'h3 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4143; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4149 = 4'h4 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3693; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4151 = 4'h4 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4149; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4155 = 4'h5 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3699; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4157 = 4'h5 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4155; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4161 = 4'h6 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3705; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4163 = 4'h6 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4161; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4167 = 4'h7 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3711; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4169 = 4'h7 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4167; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4173 = 4'h8 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3717; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4175 = 4'h8 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4173; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4179 = 4'h9 == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3723; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4181 = 4'h9 == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4179; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4185 = 4'ha == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3729; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4187 = 4'ha == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4185; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4191 = 4'hb == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3735; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4193 = 4'hb == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4191; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4197 = 4'hc == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3741; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4199 = 4'hc == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4197; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4203 = 4'hd == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3747; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4205 = 4'hd == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4203; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4209 = 4'he == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3753; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4211 = 4'he == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4209; // @[FFTEngine.scala 612:46 613:46]
  wire [31:0] _GEN_4215 = 4'hf == addrTBankSel3c_7 ? _io_writeDataSram0Bank_0_T_53 : _GEN_3759; // @[FFTEngine.scala 615:53 616:46]
  wire [31:0] _GEN_4217 = 4'hf == addrSBankSel3c_7 ? _io_writeDataSram0Bank_0_T_50 : _GEN_4215; // @[FFTEngine.scala 612:46 613:46]
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
  FFT3PipelineCalc_1 fftCalc_4 ( // @[FFTEngine.scala 481:29]
    .clock(fftCalc_4_clock),
    .reset(fftCalc_4_reset),
    .io_dataInSR(fftCalc_4_io_dataInSR),
    .io_dataInSI(fftCalc_4_io_dataInSI),
    .io_dataInTR(fftCalc_4_io_dataInTR),
    .io_dataInTI(fftCalc_4_io_dataInTI),
    .io_dataOutSR3c(fftCalc_4_io_dataOutSR3c),
    .io_dataOutSI3c(fftCalc_4_io_dataOutSI3c),
    .io_dataOutTR3c(fftCalc_4_io_dataOutTR3c),
    .io_dataOutTI3c(fftCalc_4_io_dataOutTI3c),
    .io_nk(fftCalc_4_io_nk),
    .io_rShiftSym(fftCalc_4_io_rShiftSym),
    .io_isFFT(fftCalc_4_io_isFFT),
    .io_procMode(fftCalc_4_io_procMode),
    .io_state1c(fftCalc_4_io_state1c),
    .io_state2c(fftCalc_4_io_state2c)
  );
  FFT3PipelineCalc_1 fftCalc_5 ( // @[FFTEngine.scala 481:29]
    .clock(fftCalc_5_clock),
    .reset(fftCalc_5_reset),
    .io_dataInSR(fftCalc_5_io_dataInSR),
    .io_dataInSI(fftCalc_5_io_dataInSI),
    .io_dataInTR(fftCalc_5_io_dataInTR),
    .io_dataInTI(fftCalc_5_io_dataInTI),
    .io_dataOutSR3c(fftCalc_5_io_dataOutSR3c),
    .io_dataOutSI3c(fftCalc_5_io_dataOutSI3c),
    .io_dataOutTR3c(fftCalc_5_io_dataOutTR3c),
    .io_dataOutTI3c(fftCalc_5_io_dataOutTI3c),
    .io_nk(fftCalc_5_io_nk),
    .io_rShiftSym(fftCalc_5_io_rShiftSym),
    .io_isFFT(fftCalc_5_io_isFFT),
    .io_procMode(fftCalc_5_io_procMode),
    .io_state1c(fftCalc_5_io_state1c),
    .io_state2c(fftCalc_5_io_state2c)
  );
  FFT3PipelineCalc_1 fftCalc_6 ( // @[FFTEngine.scala 481:29]
    .clock(fftCalc_6_clock),
    .reset(fftCalc_6_reset),
    .io_dataInSR(fftCalc_6_io_dataInSR),
    .io_dataInSI(fftCalc_6_io_dataInSI),
    .io_dataInTR(fftCalc_6_io_dataInTR),
    .io_dataInTI(fftCalc_6_io_dataInTI),
    .io_dataOutSR3c(fftCalc_6_io_dataOutSR3c),
    .io_dataOutSI3c(fftCalc_6_io_dataOutSI3c),
    .io_dataOutTR3c(fftCalc_6_io_dataOutTR3c),
    .io_dataOutTI3c(fftCalc_6_io_dataOutTI3c),
    .io_nk(fftCalc_6_io_nk),
    .io_rShiftSym(fftCalc_6_io_rShiftSym),
    .io_isFFT(fftCalc_6_io_isFFT),
    .io_procMode(fftCalc_6_io_procMode),
    .io_state1c(fftCalc_6_io_state1c),
    .io_state2c(fftCalc_6_io_state2c)
  );
  FFT3PipelineCalc_1 fftCalc_7 ( // @[FFTEngine.scala 481:29]
    .clock(fftCalc_7_clock),
    .reset(fftCalc_7_reset),
    .io_dataInSR(fftCalc_7_io_dataInSR),
    .io_dataInSI(fftCalc_7_io_dataInSI),
    .io_dataInTR(fftCalc_7_io_dataInTR),
    .io_dataInTI(fftCalc_7_io_dataInTI),
    .io_dataOutSR3c(fftCalc_7_io_dataOutSR3c),
    .io_dataOutSI3c(fftCalc_7_io_dataOutSI3c),
    .io_dataOutTR3c(fftCalc_7_io_dataOutTR3c),
    .io_dataOutTI3c(fftCalc_7_io_dataOutTI3c),
    .io_nk(fftCalc_7_io_nk),
    .io_rShiftSym(fftCalc_7_io_rShiftSym),
    .io_isFFT(fftCalc_7_io_isFFT),
    .io_procMode(fftCalc_7_io_procMode),
    .io_state1c(fftCalc_7_io_state1c),
    .io_state2c(fftCalc_7_io_state2c)
  );
  assign io_readEnableSram0Bank_0 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_1 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_2 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_3 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_4 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_5 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_6 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_7 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_8 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_9 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_10 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_11 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_12 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_13 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_14 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram0Bank_15 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 440:49]
  assign io_readEnableSram1Bank_0 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_1 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_2 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_3 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_4 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_5 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_6 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_7 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_8 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_9 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_10 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_11 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_12 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_13 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_14 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_readEnableSram1Bank_15 = readEnable & srcBuffer; // @[FFTEngine.scala 441:49]
  assign io_writeDataSram0Bank_0 = procState3c ? _GEN_3669 : _GEN_4127; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_1 = procState3c ? _GEN_3675 : _GEN_4133; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_2 = procState3c ? _GEN_3681 : _GEN_4139; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_3 = procState3c ? _GEN_3687 : _GEN_4145; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_4 = procState3c ? _GEN_3693 : _GEN_4151; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_5 = procState3c ? _GEN_3699 : _GEN_4157; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_6 = procState3c ? _GEN_3705 : _GEN_4163; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_7 = procState3c ? _GEN_3711 : _GEN_4169; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_8 = procState3c ? _GEN_3717 : _GEN_4175; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_9 = procState3c ? _GEN_3723 : _GEN_4181; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_10 = procState3c ? _GEN_3729 : _GEN_4187; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_11 = procState3c ? _GEN_3735 : _GEN_4193; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_12 = procState3c ? _GEN_3741 : _GEN_4199; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_13 = procState3c ? _GEN_3747 : _GEN_4205; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_14 = procState3c ? _GEN_3753 : _GEN_4211; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram0Bank_15 = procState3c ? _GEN_3759 : _GEN_4217; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_0 = procState3c ? _GEN_3669 : _GEN_4127; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_1 = procState3c ? _GEN_3675 : _GEN_4133; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_2 = procState3c ? _GEN_3681 : _GEN_4139; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_3 = procState3c ? _GEN_3687 : _GEN_4145; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_4 = procState3c ? _GEN_3693 : _GEN_4151; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_5 = procState3c ? _GEN_3699 : _GEN_4157; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_6 = procState3c ? _GEN_3705 : _GEN_4163; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_7 = procState3c ? _GEN_3711 : _GEN_4169; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_8 = procState3c ? _GEN_3717 : _GEN_4175; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_9 = procState3c ? _GEN_3723 : _GEN_4181; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_10 = procState3c ? _GEN_3729 : _GEN_4187; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_11 = procState3c ? _GEN_3735 : _GEN_4193; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_12 = procState3c ? _GEN_3741 : _GEN_4199; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_13 = procState3c ? _GEN_3747 : _GEN_4205; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_14 = procState3c ? _GEN_3753 : _GEN_4211; // @[FFTEngine.scala 601:30]
  assign io_writeDataSram1Bank_15 = procState3c ? _GEN_3759 : _GEN_4217; // @[FFTEngine.scala 601:30]
  assign io_writeEnableSram0Bank_0 = procState3c ? _GEN_313 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_1 = procState3c ? _GEN_317 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_2 = procState3c ? _GEN_321 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_3 = procState3c ? _GEN_325 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_4 = procState3c ? _GEN_329 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_5 = procState3c ? _GEN_333 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_6 = procState3c ? _GEN_337 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_7 = procState3c ? _GEN_341 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_8 = procState3c ? _GEN_345 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_9 = procState3c ? _GEN_349 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_10 = procState3c ? _GEN_353 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_11 = procState3c ? _GEN_357 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_12 = procState3c ? _GEN_361 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_13 = procState3c ? _GEN_365 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_14 = procState3c ? _GEN_369 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram0Bank_15 = procState3c ? _GEN_373 : srcBuffer & kernelState3c; // @[FFTEngine.scala 514:34 523:48]
  assign io_writeEnableSram1Bank_0 = procState3c ? _GEN_314 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_1 = procState3c ? _GEN_318 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_2 = procState3c ? _GEN_322 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_3 = procState3c ? _GEN_326 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_4 = procState3c ? _GEN_330 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_5 = procState3c ? _GEN_334 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_6 = procState3c ? _GEN_338 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_7 = procState3c ? _GEN_342 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_8 = procState3c ? _GEN_346 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_9 = procState3c ? _GEN_350 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_10 = procState3c ? _GEN_354 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_11 = procState3c ? _GEN_358 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_12 = procState3c ? _GEN_362 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_13 = procState3c ? _GEN_366 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_14 = procState3c ? _GEN_370 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_writeEnableSram1Bank_15 = procState3c ? _GEN_374 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 514:34 524:48]
  assign io_addrSram0Bank_0 = ~procState3c ? _GEN_4061 : _GEN_3949; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_1 = ~procState3c ? _GEN_4062 : _GEN_3950; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_2 = ~procState3c ? _GEN_4063 : _GEN_3951; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_3 = ~procState3c ? _GEN_4064 : _GEN_3952; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_4 = ~procState3c ? _GEN_4065 : _GEN_3953; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_5 = ~procState3c ? _GEN_4066 : _GEN_3954; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_6 = ~procState3c ? _GEN_4067 : _GEN_3955; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_7 = ~procState3c ? _GEN_4068 : _GEN_3956; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_8 = ~procState3c ? _GEN_4069 : _GEN_3957; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_9 = ~procState3c ? _GEN_4070 : _GEN_3958; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_10 = ~procState3c ? _GEN_4071 : _GEN_3959; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_11 = ~procState3c ? _GEN_4072 : _GEN_3960; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_12 = ~procState3c ? _GEN_4073 : _GEN_3961; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_13 = ~procState3c ? _GEN_4074 : _GEN_3962; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_14 = ~procState3c ? _GEN_4075 : _GEN_3963; // @[FFTEngine.scala 549:28]
  assign io_addrSram0Bank_15 = ~procState3c ? _GEN_4076 : _GEN_3964; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_0 = ~procState3c ? _GEN_4045 : _GEN_3965; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_1 = ~procState3c ? _GEN_4046 : _GEN_3966; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_2 = ~procState3c ? _GEN_4047 : _GEN_3967; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_3 = ~procState3c ? _GEN_4048 : _GEN_3968; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_4 = ~procState3c ? _GEN_4049 : _GEN_3969; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_5 = ~procState3c ? _GEN_4050 : _GEN_3970; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_6 = ~procState3c ? _GEN_4051 : _GEN_3971; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_7 = ~procState3c ? _GEN_4052 : _GEN_3972; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_8 = ~procState3c ? _GEN_4053 : _GEN_3973; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_9 = ~procState3c ? _GEN_4054 : _GEN_3974; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_10 = ~procState3c ? _GEN_4055 : _GEN_3975; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_11 = ~procState3c ? _GEN_4056 : _GEN_3976; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_12 = ~procState3c ? _GEN_4057 : _GEN_3977; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_13 = ~procState3c ? _GEN_4058 : _GEN_3978; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_14 = ~procState3c ? _GEN_4059 : _GEN_3979; // @[FFTEngine.scala 549:28]
  assign io_addrSram1Bank_15 = ~procState3c ? _GEN_4060 : _GEN_3980; // @[FFTEngine.scala 549:28]
  assign io_fftDone = fftDoneReg; // @[FFTEngine.scala 625:16]
  assign fftCalc_clock = clock;
  assign fftCalc_reset = reset;
  assign fftCalc_io_dataInSR = 4'hf == addrSBankSel1c ? $signed(dataInPre_15_re) : $signed(_GEN_237); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_254); // @[FFTEngine.scala 483:35]
  assign fftCalc_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_270) : $signed(_GEN_286); // @[FFTEngine.scala 484:35]
  assign fftCalc_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_270); // @[FFTEngine.scala 485:35]
  assign fftCalc_io_nk = _radixInit_T_11 ? addrSProc : _fftCalc_io_nk_T_2; // @[FFTEngine.scala 487:33]
  assign fftCalc_io_rShiftSym = kernelState1c ? _GEN_310 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_1_clock = clock;
  assign fftCalc_1_reset = reset;
  assign fftCalc_1_io_dataInSR = 4'hf == addrSBankSel1c_1 ? $signed(dataInPre_15_re) : $signed(_GEN_1025); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_1_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_1042); // @[FFTEngine.scala 483:35]
  assign fftCalc_1_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_1058) : $signed(_GEN_1074); // @[FFTEngine.scala 484:35]
  assign fftCalc_1_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_1058); // @[FFTEngine.scala 485:35]
  assign fftCalc_1_io_nk = nk_1[6:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_1_io_rShiftSym = kernelState1c ? _GEN_310 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_1_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_1_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_1_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_1_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_2_clock = clock;
  assign fftCalc_2_reset = reset;
  assign fftCalc_2_io_dataInSR = 4'hf == addrSBankSel1c_2 ? $signed(dataInPre_15_re) : $signed(_GEN_1485); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_2_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_1502); // @[FFTEngine.scala 483:35]
  assign fftCalc_2_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_1518) : $signed(_GEN_1534); // @[FFTEngine.scala 484:35]
  assign fftCalc_2_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_1518); // @[FFTEngine.scala 485:35]
  assign fftCalc_2_io_nk = nk_2[6:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_2_io_rShiftSym = kernelState1c ? _GEN_310 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_2_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_2_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_2_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_2_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_3_clock = clock;
  assign fftCalc_3_reset = reset;
  assign fftCalc_3_io_dataInSR = 4'hf == addrSBankSel1c_3 ? $signed(dataInPre_15_re) : $signed(_GEN_1945); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_3_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_1962); // @[FFTEngine.scala 483:35]
  assign fftCalc_3_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_1978) : $signed(_GEN_1994); // @[FFTEngine.scala 484:35]
  assign fftCalc_3_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_1978); // @[FFTEngine.scala 485:35]
  assign fftCalc_3_io_nk = nk_3[6:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_3_io_rShiftSym = kernelState1c ? _GEN_310 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_3_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_3_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_3_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_3_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_4_clock = clock;
  assign fftCalc_4_reset = reset;
  assign fftCalc_4_io_dataInSR = 4'hf == addrSBankSel1c_4 ? $signed(dataInPre_15_re) : $signed(_GEN_2405); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_4_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_2422); // @[FFTEngine.scala 483:35]
  assign fftCalc_4_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_2438) : $signed(_GEN_2454); // @[FFTEngine.scala 484:35]
  assign fftCalc_4_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_2438); // @[FFTEngine.scala 485:35]
  assign fftCalc_4_io_nk = nk_4[6:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_4_io_rShiftSym = kernelState1c ? _GEN_310 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_4_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_4_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_4_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_4_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_5_clock = clock;
  assign fftCalc_5_reset = reset;
  assign fftCalc_5_io_dataInSR = 4'hf == addrSBankSel1c_5 ? $signed(dataInPre_15_re) : $signed(_GEN_2865); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_5_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_2882); // @[FFTEngine.scala 483:35]
  assign fftCalc_5_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_2898) : $signed(_GEN_2914); // @[FFTEngine.scala 484:35]
  assign fftCalc_5_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_2898); // @[FFTEngine.scala 485:35]
  assign fftCalc_5_io_nk = nk_5[6:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_5_io_rShiftSym = kernelState1c ? _GEN_310 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_5_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_5_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_5_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_5_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_6_clock = clock;
  assign fftCalc_6_reset = reset;
  assign fftCalc_6_io_dataInSR = 4'hf == addrSBankSel1c_6 ? $signed(dataInPre_15_re) : $signed(_GEN_3325); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_6_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_3342); // @[FFTEngine.scala 483:35]
  assign fftCalc_6_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_3358) : $signed(_GEN_3374); // @[FFTEngine.scala 484:35]
  assign fftCalc_6_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_3358); // @[FFTEngine.scala 485:35]
  assign fftCalc_6_io_nk = nk_6[6:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_6_io_rShiftSym = kernelState1c ? _GEN_310 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_6_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_6_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_6_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_6_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
  assign fftCalc_7_clock = clock;
  assign fftCalc_7_reset = reset;
  assign fftCalc_7_io_dataInSR = 4'hf == addrSBankSel1c_7 ? $signed(dataInPre_15_re) : $signed(_GEN_3785); // @[FFTEngine.scala 482:{29,29}]
  assign fftCalc_7_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_3802); // @[FFTEngine.scala 483:35]
  assign fftCalc_7_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_3818) : $signed(_GEN_3834); // @[FFTEngine.scala 484:35]
  assign fftCalc_7_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_3818); // @[FFTEngine.scala 485:35]
  assign fftCalc_7_io_nk = nk_7[6:0]; // @[FFTEngine.scala 489:35]
  assign fftCalc_7_io_rShiftSym = kernelState1c ? _GEN_310 : phaseCount[0]; // @[FFTEngine.scala 491:36]
  assign fftCalc_7_io_isFFT = io_fftMode; // @[FFTEngine.scala 492:26]
  assign fftCalc_7_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 493:48]
  assign fftCalc_7_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 494:45]
  assign fftCalc_7_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 495:45]
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
      if (addrSProc == 8'hf) begin // @[FFTEngine.scala 62:50]
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
      addrSBankSelKernel1c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_0_r <= addrSBankSelKernelPre_0; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_0_r <= 4'h0; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_0_r <= addrSBankSelKernel1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_0_r <= addrSBankSelKernel2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_0_r <= 4'h1; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_0_r <= addrTBankSelKernelPre_0; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_0_r <= 4'h1; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_0_r <= 4'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_0_r <= addrTBankSelKernel1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_0_r <= 4'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_0_r <= addrTBankSelKernel2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_1_r <= addrSBankSelKernelPre_1; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_1_r <= 4'h2; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_1_r <= addrSBankSelKernel1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_1_r <= addrSBankSelKernel2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_1_r <= 4'h3; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_1_r <= addrTBankSelKernelPre_1; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_1_r <= 4'h3; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_1_r <= 4'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_1_r <= addrTBankSelKernel1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_1_r <= 4'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_1_r <= addrTBankSelKernel2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_2_r <= addrSBankSelKernelPre_2; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_2_r <= 4'h4; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_2_r <= addrSBankSelKernel1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_2_r <= addrSBankSelKernel2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_2_r <= 4'h5; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_2_r <= addrTBankSelKernelPre_2; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_2_r <= 4'h5; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_2_r <= 4'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_2_r <= addrTBankSelKernel1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_2_r <= 4'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_2_r <= addrTBankSelKernel2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_3_r <= addrSBankSelKernelPre_3; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_3_r <= 4'h6; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_3_r <= addrSBankSelKernel1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_3_r <= addrSBankSelKernel2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_3_r <= 4'h7; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_3_r <= addrTBankSelKernelPre_3; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_3_r <= 4'h7; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_3_r <= 4'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_3_r <= addrTBankSelKernel1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_3_r <= 4'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_3_r <= addrTBankSelKernel2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_4_r <= addrSBankSelKernelPre_4; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_4_r <= 4'h8; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_4_r <= addrSBankSelKernel1c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_4_r <= addrSBankSelKernel2c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_4_r <= 4'h9; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_4_r <= addrTBankSelKernelPre_4; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_4_r <= 4'h9; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_4_r <= 4'h9; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_4_r <= addrTBankSelKernel1c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_4_r <= 4'h9; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_4_r <= addrTBankSelKernel2c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_5_r <= addrSBankSelKernelPre_5; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_5_r <= 4'ha; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_5_r <= addrSBankSelKernel1c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_5_r <= addrSBankSelKernel2c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_5_r <= 4'hb; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_5_r <= addrTBankSelKernelPre_5; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_5_r <= 4'hb; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_5_r <= 4'hb; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_5_r <= addrTBankSelKernel1c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_5_r <= 4'hb; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_5_r <= addrTBankSelKernel2c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_6_r <= addrSBankSelKernelPre_6; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_6_r <= 4'hc; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_6_r <= addrSBankSelKernel1c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_6_r <= addrSBankSelKernel2c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_6_r <= 4'hd; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_6_r <= addrTBankSelKernelPre_6; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_6_r <= 4'hd; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_6_r <= 4'hd; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_6_r <= addrTBankSelKernel1c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_6_r <= 4'hd; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_6_r <= addrTBankSelKernel2c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel1c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrSBankSelKernel1c_7_r <= addrSBankSelKernelPre_7; // @[FFTEngine.scala 367:35]
    end else begin
      addrSBankSelKernel1c_7_r <= 4'he; // @[FFTEngine.scala 370:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel2c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel2c_7_r <= addrSBankSelKernel1c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelKernel3c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelKernel3c_7_r <= addrSBankSelKernel2c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel1c_7_r <= 4'hf; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 366:27]
      addrTBankSelKernel1c_7_r <= addrTBankSelKernelPre_7; // @[FFTEngine.scala 368:35]
    end else begin
      addrTBankSelKernel1c_7_r <= 4'hf; // @[FFTEngine.scala 371:35]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel2c_7_r <= 4'hf; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel2c_7_r <= addrTBankSelKernel1c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelKernel3c_7_r <= 4'hf; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelKernel3c_7_r <= addrTBankSelKernel2c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_0_r <= addrSBankSelProc_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_0_r <= addrSBankSelProc1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_0_r <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_0_r <= addrSBankSelProc2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_0_r <= 4'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_0_r <= addrTBankSelProc_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_0_r <= 4'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_0_r <= addrTBankSelProc1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_0_r <= 4'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_0_r <= addrTBankSelProc2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_1_r <= addrSBankSelProc_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_1_r <= addrSBankSelProc1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_1_r <= 4'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_1_r <= addrSBankSelProc2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_1_r <= 4'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_1_r <= addrTBankSelProc_1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_1_r <= 4'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_1_r <= addrTBankSelProc1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_1_r <= 4'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_1_r <= addrTBankSelProc2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_2_r <= addrSBankSelProc_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_2_r <= addrSBankSelProc1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_2_r <= 4'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_2_r <= addrSBankSelProc2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_2_r <= 4'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_2_r <= addrTBankSelProc_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_2_r <= 4'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_2_r <= addrTBankSelProc1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_2_r <= 4'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_2_r <= addrTBankSelProc2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_3_r <= addrSBankSelProc_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_3_r <= addrSBankSelProc1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_3_r <= 4'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_3_r <= addrSBankSelProc2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_3_r <= 4'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_3_r <= addrTBankSelProc_3;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_3_r <= 4'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_3_r <= addrTBankSelProc1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_3_r <= 4'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_3_r <= addrTBankSelProc2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_4_r <= addrSBankSelProc_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_4_r <= addrSBankSelProc1c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_4_r <= 4'h8; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_4_r <= addrSBankSelProc2c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_4_r <= 4'h9; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_4_r <= addrTBankSelProc_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_4_r <= 4'h9; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_4_r <= addrTBankSelProc1c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_4_r <= 4'h9; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_4_r <= addrTBankSelProc2c_4_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_5_r <= addrSBankSelProc_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_5_r <= addrSBankSelProc1c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_5_r <= 4'ha; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_5_r <= addrSBankSelProc2c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_5_r <= 4'hb; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_5_r <= addrTBankSelProc_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_5_r <= 4'hb; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_5_r <= addrTBankSelProc1c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_5_r <= 4'hb; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_5_r <= addrTBankSelProc2c_5_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_6_r <= addrSBankSelProc_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_6_r <= addrSBankSelProc1c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_6_r <= 4'hc; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_6_r <= addrSBankSelProc2c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_6_r <= 4'hd; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_6_r <= addrTBankSelProc_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_6_r <= 4'hd; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_6_r <= addrTBankSelProc1c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_6_r <= 4'hd; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_6_r <= addrTBankSelProc2c_6_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc1c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc1c_7_r <= addrSBankSelProc_7;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc2c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc2c_7_r <= addrSBankSelProc1c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSelProc3c_7_r <= 4'he; // @[Reg.scala 35:20]
    end else begin
      addrSBankSelProc3c_7_r <= addrSBankSelProc2c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc1c_7_r <= 4'hf; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc1c_7_r <= addrTBankSelProc_7;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc2c_7_r <= 4'hf; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc2c_7_r <= addrTBankSelProc1c_7_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSelProc3c_7_r <= 4'hf; // @[Reg.scala 35:20]
    end else begin
      addrTBankSelProc3c_7_r <= addrTBankSelProc2c_7_r;
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
      addrSBankSel1c <= 4'h0; // @[Reg.scala 35:20]
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
      addrTBankSel1c <= 4'h1; // @[Reg.scala 35:20]
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
      addrSBankSel1c_1 <= 4'h0; // @[Reg.scala 35:20]
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
      addrTBankSel1c_1 <= 4'h1; // @[Reg.scala 35:20]
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
      addrSBankSel1c_2 <= 4'h0; // @[Reg.scala 35:20]
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
      addrTBankSel1c_2 <= 4'h1; // @[Reg.scala 35:20]
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
      addrSBankSel1c_3 <= 4'h0; // @[Reg.scala 35:20]
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
      addrTBankSel1c_3 <= 4'h1; // @[Reg.scala 35:20]
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
    if (reset) begin // @[Reg.scala 35:20]
      addrS1c_4 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_4 <= addrS_4[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_4 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_4 <= addrS1c_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_4 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_4 <= addrS2c_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_4 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_4 <= addrT_4[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_4 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_4 <= addrT1c_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_4 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT3c_4 <= addrT2c_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_4 <= 4'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 471:32]
        addrSBankSel1c_4 <= addrSBankSelProc_4;
      end else begin
        addrSBankSel1c_4 <= addrSBankSelKernel_4;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0) begin // @[FFTEngine.scala 474:32]
      addrSBankSel1c_4 <= addrSBankSelProc_4;
    end else begin
      addrSBankSel1c_4 <= addrSBankSelKernel_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_4 <= 4'h1; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 472:32]
        addrTBankSel1c_4 <= addrTBankSelProc_4;
      end else begin
        addrTBankSel1c_4 <= addrTBankSelKernel_4;
      end
    end else if (_addrSBankSel_T_4) begin // @[FFTEngine.scala 475:32]
      addrTBankSel1c_4 <= addrTBankSelProc_4;
    end else begin
      addrTBankSel1c_4 <= addrTBankSelKernel_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS1c_5 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_5 <= addrS_5[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_5 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_5 <= addrS1c_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_5 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_5 <= addrS2c_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_5 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_5 <= addrT_5[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_5 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_5 <= addrT1c_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_5 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT3c_5 <= addrT2c_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_5 <= 4'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 471:32]
        addrSBankSel1c_5 <= addrSBankSelProc_5;
      end else begin
        addrSBankSel1c_5 <= addrSBankSelKernel_5;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0) begin // @[FFTEngine.scala 474:32]
      addrSBankSel1c_5 <= addrSBankSelProc_5;
    end else begin
      addrSBankSel1c_5 <= addrSBankSelKernel_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_5 <= 4'h1; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 472:32]
        addrTBankSel1c_5 <= addrTBankSelProc_5;
      end else begin
        addrTBankSel1c_5 <= addrTBankSelKernel_5;
      end
    end else if (_addrSBankSel_T_4) begin // @[FFTEngine.scala 475:32]
      addrTBankSel1c_5 <= addrTBankSelProc_5;
    end else begin
      addrTBankSel1c_5 <= addrTBankSelKernel_5;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS1c_6 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_6 <= addrS_6[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_6 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_6 <= addrS1c_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_6 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_6 <= addrS2c_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_6 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_6 <= addrT_6[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_6 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_6 <= addrT1c_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_6 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT3c_6 <= addrT2c_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_6 <= 4'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 471:32]
        addrSBankSel1c_6 <= addrSBankSelProc_6;
      end else begin
        addrSBankSel1c_6 <= addrSBankSelKernel_6;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0) begin // @[FFTEngine.scala 474:32]
      addrSBankSel1c_6 <= addrSBankSelProc_6;
    end else begin
      addrSBankSel1c_6 <= addrSBankSelKernel_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_6 <= 4'h1; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 472:32]
        addrTBankSel1c_6 <= addrTBankSelProc_6;
      end else begin
        addrTBankSel1c_6 <= addrTBankSelKernel_6;
      end
    end else if (_addrSBankSel_T_4) begin // @[FFTEngine.scala 475:32]
      addrTBankSel1c_6 <= addrTBankSelProc_6;
    end else begin
      addrTBankSel1c_6 <= addrTBankSelKernel_6;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS1c_7 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c_7 <= addrS_7[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c_7 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c_7 <= addrS1c_7;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c_7 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c_7 <= addrS2c_7;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c_7 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c_7 <= addrT_7[3:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c_7 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c_7 <= addrT1c_7;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c_7 <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrT3c_7 <= addrT2c_7;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_7 <= 4'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 471:32]
        addrSBankSel1c_7 <= addrSBankSelProc_7;
      end else begin
        addrSBankSel1c_7 <= addrSBankSelKernel_7;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 3'h0) begin // @[FFTEngine.scala 474:32]
      addrSBankSel1c_7 <= addrSBankSelProc_7;
    end else begin
      addrSBankSel1c_7 <= addrSBankSelKernel_7;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_7 <= 4'h1; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 470:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 472:32]
        addrTBankSel1c_7 <= addrTBankSelProc_7;
      end else begin
        addrTBankSel1c_7 <= addrTBankSelKernel_7;
      end
    end else if (_addrSBankSel_T_4) begin // @[FFTEngine.scala 475:32]
      addrTBankSel1c_7 <= addrTBankSelProc_7;
    end else begin
      addrTBankSel1c_7 <= addrTBankSelKernel_7;
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
  addrSProc = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  srcBuffer = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrSBankSelKernel1c_0_r = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  addrSBankSelKernel2c_0_r = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  addrSBankSelKernel3c_0_r = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  addrTBankSelKernel1c_0_r = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  addrTBankSelKernel2c_0_r = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  addrTBankSelKernel3c_0_r = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  addrSBankSelKernel1c_1_r = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  addrSBankSelKernel2c_1_r = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  addrSBankSelKernel3c_1_r = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  addrTBankSelKernel1c_1_r = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  addrTBankSelKernel2c_1_r = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  addrTBankSelKernel3c_1_r = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  addrSBankSelKernel1c_2_r = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  addrSBankSelKernel2c_2_r = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  addrSBankSelKernel3c_2_r = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  addrTBankSelKernel1c_2_r = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  addrTBankSelKernel2c_2_r = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  addrTBankSelKernel3c_2_r = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  addrSBankSelKernel1c_3_r = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  addrSBankSelKernel2c_3_r = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  addrSBankSelKernel3c_3_r = _RAND_24[3:0];
  _RAND_25 = {1{`RANDOM}};
  addrTBankSelKernel1c_3_r = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  addrTBankSelKernel2c_3_r = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  addrTBankSelKernel3c_3_r = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  addrSBankSelKernel1c_4_r = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  addrSBankSelKernel2c_4_r = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  addrSBankSelKernel3c_4_r = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  addrTBankSelKernel1c_4_r = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  addrTBankSelKernel2c_4_r = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  addrTBankSelKernel3c_4_r = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  addrSBankSelKernel1c_5_r = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  addrSBankSelKernel2c_5_r = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  addrSBankSelKernel3c_5_r = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  addrTBankSelKernel1c_5_r = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  addrTBankSelKernel2c_5_r = _RAND_38[3:0];
  _RAND_39 = {1{`RANDOM}};
  addrTBankSelKernel3c_5_r = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  addrSBankSelKernel1c_6_r = _RAND_40[3:0];
  _RAND_41 = {1{`RANDOM}};
  addrSBankSelKernel2c_6_r = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  addrSBankSelKernel3c_6_r = _RAND_42[3:0];
  _RAND_43 = {1{`RANDOM}};
  addrTBankSelKernel1c_6_r = _RAND_43[3:0];
  _RAND_44 = {1{`RANDOM}};
  addrTBankSelKernel2c_6_r = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  addrTBankSelKernel3c_6_r = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  addrSBankSelKernel1c_7_r = _RAND_46[3:0];
  _RAND_47 = {1{`RANDOM}};
  addrSBankSelKernel2c_7_r = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  addrSBankSelKernel3c_7_r = _RAND_48[3:0];
  _RAND_49 = {1{`RANDOM}};
  addrTBankSelKernel1c_7_r = _RAND_49[3:0];
  _RAND_50 = {1{`RANDOM}};
  addrTBankSelKernel2c_7_r = _RAND_50[3:0];
  _RAND_51 = {1{`RANDOM}};
  addrTBankSelKernel3c_7_r = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  addrSBankSelProc1c_0_r = _RAND_52[3:0];
  _RAND_53 = {1{`RANDOM}};
  addrSBankSelProc2c_0_r = _RAND_53[3:0];
  _RAND_54 = {1{`RANDOM}};
  addrSBankSelProc3c_0_r = _RAND_54[3:0];
  _RAND_55 = {1{`RANDOM}};
  addrTBankSelProc1c_0_r = _RAND_55[3:0];
  _RAND_56 = {1{`RANDOM}};
  addrTBankSelProc2c_0_r = _RAND_56[3:0];
  _RAND_57 = {1{`RANDOM}};
  addrTBankSelProc3c_0_r = _RAND_57[3:0];
  _RAND_58 = {1{`RANDOM}};
  addrSBankSelProc1c_1_r = _RAND_58[3:0];
  _RAND_59 = {1{`RANDOM}};
  addrSBankSelProc2c_1_r = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  addrSBankSelProc3c_1_r = _RAND_60[3:0];
  _RAND_61 = {1{`RANDOM}};
  addrTBankSelProc1c_1_r = _RAND_61[3:0];
  _RAND_62 = {1{`RANDOM}};
  addrTBankSelProc2c_1_r = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  addrTBankSelProc3c_1_r = _RAND_63[3:0];
  _RAND_64 = {1{`RANDOM}};
  addrSBankSelProc1c_2_r = _RAND_64[3:0];
  _RAND_65 = {1{`RANDOM}};
  addrSBankSelProc2c_2_r = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  addrSBankSelProc3c_2_r = _RAND_66[3:0];
  _RAND_67 = {1{`RANDOM}};
  addrTBankSelProc1c_2_r = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  addrTBankSelProc2c_2_r = _RAND_68[3:0];
  _RAND_69 = {1{`RANDOM}};
  addrTBankSelProc3c_2_r = _RAND_69[3:0];
  _RAND_70 = {1{`RANDOM}};
  addrSBankSelProc1c_3_r = _RAND_70[3:0];
  _RAND_71 = {1{`RANDOM}};
  addrSBankSelProc2c_3_r = _RAND_71[3:0];
  _RAND_72 = {1{`RANDOM}};
  addrSBankSelProc3c_3_r = _RAND_72[3:0];
  _RAND_73 = {1{`RANDOM}};
  addrTBankSelProc1c_3_r = _RAND_73[3:0];
  _RAND_74 = {1{`RANDOM}};
  addrTBankSelProc2c_3_r = _RAND_74[3:0];
  _RAND_75 = {1{`RANDOM}};
  addrTBankSelProc3c_3_r = _RAND_75[3:0];
  _RAND_76 = {1{`RANDOM}};
  addrSBankSelProc1c_4_r = _RAND_76[3:0];
  _RAND_77 = {1{`RANDOM}};
  addrSBankSelProc2c_4_r = _RAND_77[3:0];
  _RAND_78 = {1{`RANDOM}};
  addrSBankSelProc3c_4_r = _RAND_78[3:0];
  _RAND_79 = {1{`RANDOM}};
  addrTBankSelProc1c_4_r = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  addrTBankSelProc2c_4_r = _RAND_80[3:0];
  _RAND_81 = {1{`RANDOM}};
  addrTBankSelProc3c_4_r = _RAND_81[3:0];
  _RAND_82 = {1{`RANDOM}};
  addrSBankSelProc1c_5_r = _RAND_82[3:0];
  _RAND_83 = {1{`RANDOM}};
  addrSBankSelProc2c_5_r = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  addrSBankSelProc3c_5_r = _RAND_84[3:0];
  _RAND_85 = {1{`RANDOM}};
  addrTBankSelProc1c_5_r = _RAND_85[3:0];
  _RAND_86 = {1{`RANDOM}};
  addrTBankSelProc2c_5_r = _RAND_86[3:0];
  _RAND_87 = {1{`RANDOM}};
  addrTBankSelProc3c_5_r = _RAND_87[3:0];
  _RAND_88 = {1{`RANDOM}};
  addrSBankSelProc1c_6_r = _RAND_88[3:0];
  _RAND_89 = {1{`RANDOM}};
  addrSBankSelProc2c_6_r = _RAND_89[3:0];
  _RAND_90 = {1{`RANDOM}};
  addrSBankSelProc3c_6_r = _RAND_90[3:0];
  _RAND_91 = {1{`RANDOM}};
  addrTBankSelProc1c_6_r = _RAND_91[3:0];
  _RAND_92 = {1{`RANDOM}};
  addrTBankSelProc2c_6_r = _RAND_92[3:0];
  _RAND_93 = {1{`RANDOM}};
  addrTBankSelProc3c_6_r = _RAND_93[3:0];
  _RAND_94 = {1{`RANDOM}};
  addrSBankSelProc1c_7_r = _RAND_94[3:0];
  _RAND_95 = {1{`RANDOM}};
  addrSBankSelProc2c_7_r = _RAND_95[3:0];
  _RAND_96 = {1{`RANDOM}};
  addrSBankSelProc3c_7_r = _RAND_96[3:0];
  _RAND_97 = {1{`RANDOM}};
  addrTBankSelProc1c_7_r = _RAND_97[3:0];
  _RAND_98 = {1{`RANDOM}};
  addrTBankSelProc2c_7_r = _RAND_98[3:0];
  _RAND_99 = {1{`RANDOM}};
  addrTBankSelProc3c_7_r = _RAND_99[3:0];
  _RAND_100 = {1{`RANDOM}};
  kernelState1c = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  kernelState2c = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  kernelState3c = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  procState1c = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  procState2c = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  procState3c = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  sameAddr1c = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  sameAddr2c = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  sameAddr3c = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  addrS1c = _RAND_109[3:0];
  _RAND_110 = {1{`RANDOM}};
  addrS2c = _RAND_110[3:0];
  _RAND_111 = {1{`RANDOM}};
  addrS3c = _RAND_111[3:0];
  _RAND_112 = {1{`RANDOM}};
  addrT1c = _RAND_112[3:0];
  _RAND_113 = {1{`RANDOM}};
  addrT2c = _RAND_113[3:0];
  _RAND_114 = {1{`RANDOM}};
  addrT3c = _RAND_114[3:0];
  _RAND_115 = {1{`RANDOM}};
  addrSBankSel1c = _RAND_115[3:0];
  _RAND_116 = {1{`RANDOM}};
  addrTBankSel1c = _RAND_116[3:0];
  _RAND_117 = {1{`RANDOM}};
  addrS1c_1 = _RAND_117[3:0];
  _RAND_118 = {1{`RANDOM}};
  addrS2c_1 = _RAND_118[3:0];
  _RAND_119 = {1{`RANDOM}};
  addrS3c_1 = _RAND_119[3:0];
  _RAND_120 = {1{`RANDOM}};
  addrT1c_1 = _RAND_120[3:0];
  _RAND_121 = {1{`RANDOM}};
  addrT2c_1 = _RAND_121[3:0];
  _RAND_122 = {1{`RANDOM}};
  addrT3c_1 = _RAND_122[3:0];
  _RAND_123 = {1{`RANDOM}};
  addrSBankSel1c_1 = _RAND_123[3:0];
  _RAND_124 = {1{`RANDOM}};
  addrTBankSel1c_1 = _RAND_124[3:0];
  _RAND_125 = {1{`RANDOM}};
  addrS1c_2 = _RAND_125[3:0];
  _RAND_126 = {1{`RANDOM}};
  addrS2c_2 = _RAND_126[3:0];
  _RAND_127 = {1{`RANDOM}};
  addrS3c_2 = _RAND_127[3:0];
  _RAND_128 = {1{`RANDOM}};
  addrT1c_2 = _RAND_128[3:0];
  _RAND_129 = {1{`RANDOM}};
  addrT2c_2 = _RAND_129[3:0];
  _RAND_130 = {1{`RANDOM}};
  addrT3c_2 = _RAND_130[3:0];
  _RAND_131 = {1{`RANDOM}};
  addrSBankSel1c_2 = _RAND_131[3:0];
  _RAND_132 = {1{`RANDOM}};
  addrTBankSel1c_2 = _RAND_132[3:0];
  _RAND_133 = {1{`RANDOM}};
  addrS1c_3 = _RAND_133[3:0];
  _RAND_134 = {1{`RANDOM}};
  addrS2c_3 = _RAND_134[3:0];
  _RAND_135 = {1{`RANDOM}};
  addrS3c_3 = _RAND_135[3:0];
  _RAND_136 = {1{`RANDOM}};
  addrT1c_3 = _RAND_136[3:0];
  _RAND_137 = {1{`RANDOM}};
  addrT2c_3 = _RAND_137[3:0];
  _RAND_138 = {1{`RANDOM}};
  addrT3c_3 = _RAND_138[3:0];
  _RAND_139 = {1{`RANDOM}};
  addrSBankSel1c_3 = _RAND_139[3:0];
  _RAND_140 = {1{`RANDOM}};
  addrTBankSel1c_3 = _RAND_140[3:0];
  _RAND_141 = {1{`RANDOM}};
  addrS1c_4 = _RAND_141[3:0];
  _RAND_142 = {1{`RANDOM}};
  addrS2c_4 = _RAND_142[3:0];
  _RAND_143 = {1{`RANDOM}};
  addrS3c_4 = _RAND_143[3:0];
  _RAND_144 = {1{`RANDOM}};
  addrT1c_4 = _RAND_144[3:0];
  _RAND_145 = {1{`RANDOM}};
  addrT2c_4 = _RAND_145[3:0];
  _RAND_146 = {1{`RANDOM}};
  addrT3c_4 = _RAND_146[3:0];
  _RAND_147 = {1{`RANDOM}};
  addrSBankSel1c_4 = _RAND_147[3:0];
  _RAND_148 = {1{`RANDOM}};
  addrTBankSel1c_4 = _RAND_148[3:0];
  _RAND_149 = {1{`RANDOM}};
  addrS1c_5 = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  addrS2c_5 = _RAND_150[3:0];
  _RAND_151 = {1{`RANDOM}};
  addrS3c_5 = _RAND_151[3:0];
  _RAND_152 = {1{`RANDOM}};
  addrT1c_5 = _RAND_152[3:0];
  _RAND_153 = {1{`RANDOM}};
  addrT2c_5 = _RAND_153[3:0];
  _RAND_154 = {1{`RANDOM}};
  addrT3c_5 = _RAND_154[3:0];
  _RAND_155 = {1{`RANDOM}};
  addrSBankSel1c_5 = _RAND_155[3:0];
  _RAND_156 = {1{`RANDOM}};
  addrTBankSel1c_5 = _RAND_156[3:0];
  _RAND_157 = {1{`RANDOM}};
  addrS1c_6 = _RAND_157[3:0];
  _RAND_158 = {1{`RANDOM}};
  addrS2c_6 = _RAND_158[3:0];
  _RAND_159 = {1{`RANDOM}};
  addrS3c_6 = _RAND_159[3:0];
  _RAND_160 = {1{`RANDOM}};
  addrT1c_6 = _RAND_160[3:0];
  _RAND_161 = {1{`RANDOM}};
  addrT2c_6 = _RAND_161[3:0];
  _RAND_162 = {1{`RANDOM}};
  addrT3c_6 = _RAND_162[3:0];
  _RAND_163 = {1{`RANDOM}};
  addrSBankSel1c_6 = _RAND_163[3:0];
  _RAND_164 = {1{`RANDOM}};
  addrTBankSel1c_6 = _RAND_164[3:0];
  _RAND_165 = {1{`RANDOM}};
  addrS1c_7 = _RAND_165[3:0];
  _RAND_166 = {1{`RANDOM}};
  addrS2c_7 = _RAND_166[3:0];
  _RAND_167 = {1{`RANDOM}};
  addrS3c_7 = _RAND_167[3:0];
  _RAND_168 = {1{`RANDOM}};
  addrT1c_7 = _RAND_168[3:0];
  _RAND_169 = {1{`RANDOM}};
  addrT2c_7 = _RAND_169[3:0];
  _RAND_170 = {1{`RANDOM}};
  addrT3c_7 = _RAND_170[3:0];
  _RAND_171 = {1{`RANDOM}};
  addrSBankSel1c_7 = _RAND_171[3:0];
  _RAND_172 = {1{`RANDOM}};
  addrTBankSel1c_7 = _RAND_172[3:0];
  _RAND_173 = {1{`RANDOM}};
  fftDoneReg = _RAND_173[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
