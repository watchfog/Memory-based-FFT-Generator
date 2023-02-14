module FFTTwiddle(
  input  [6:0]  io_nk,
  input  [1:0]  io_twiLutCaseIndex,
  output [11:0] io_wR,
  output [11:0] io_wI
);
  wire  _idx_r_T_3 = io_nk[6] & |io_nk[5:0]; // @[FFTTwiddle.scala 35:43]
  wire [6:0] _idx_r_T_4 = ~io_nk; // @[FFTTwiddle.scala 35:80]
  wire [6:0] _idx_r_T_6 = _idx_r_T_4 + 7'h1; // @[FFTTwiddle.scala 35:87]
  wire [6:0] idx_r = io_nk[6] & |io_nk[5:0] ? _idx_r_T_6 : io_nk; // @[FFTTwiddle.scala 35:20]
  wire  chg_sign_flag_r = io_twiLutCaseIndex == 2'h2 ? ~_idx_r_T_3 : _idx_r_T_3; // @[FFTTwiddle.scala 47:30]
  wire  chg_sign_flag_i = io_twiLutCaseIndex == 2'h1 ? 1'h0 : 1'h1; // @[FFTTwiddle.scala 48:30]
  wire [11:0] _GEN_2 = 7'h2 == idx_r ? 12'h3ff : 12'h400; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_3 = 7'h3 == idx_r ? 12'h3fd : _GEN_2; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_4 = 7'h4 == idx_r ? 12'h3fb : _GEN_3; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_5 = 7'h5 == idx_r ? 12'h3f8 : _GEN_4; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_6 = 7'h6 == idx_r ? 12'h3f5 : _GEN_5; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_7 = 7'h7 == idx_r ? 12'h3f1 : _GEN_6; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_8 = 7'h8 == idx_r ? 12'h3ec : _GEN_7; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_9 = 7'h9 == idx_r ? 12'h3e7 : _GEN_8; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_10 = 7'ha == idx_r ? 12'h3e1 : _GEN_9; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_11 = 7'hb == idx_r ? 12'h3db : _GEN_10; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_12 = 7'hc == idx_r ? 12'h3d4 : _GEN_11; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_13 = 7'hd == idx_r ? 12'h3cc : _GEN_12; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_14 = 7'he == idx_r ? 12'h3c4 : _GEN_13; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_15 = 7'hf == idx_r ? 12'h3bb : _GEN_14; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_16 = 7'h10 == idx_r ? 12'h3b2 : _GEN_15; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_17 = 7'h11 == idx_r ? 12'h3a8 : _GEN_16; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_18 = 7'h12 == idx_r ? 12'h39e : _GEN_17; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_19 = 7'h13 == idx_r ? 12'h393 : _GEN_18; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_20 = 7'h14 == idx_r ? 12'h387 : _GEN_19; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_21 = 7'h15 == idx_r ? 12'h37b : _GEN_20; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_22 = 7'h16 == idx_r ? 12'h36e : _GEN_21; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_23 = 7'h17 == idx_r ? 12'h361 : _GEN_22; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_24 = 7'h18 == idx_r ? 12'h353 : _GEN_23; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_25 = 7'h19 == idx_r ? 12'h345 : _GEN_24; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_26 = 7'h1a == idx_r ? 12'h336 : _GEN_25; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_27 = 7'h1b == idx_r ? 12'h327 : _GEN_26; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_28 = 7'h1c == idx_r ? 12'h318 : _GEN_27; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_29 = 7'h1d == idx_r ? 12'h307 : _GEN_28; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_30 = 7'h1e == idx_r ? 12'h2f7 : _GEN_29; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_31 = 7'h1f == idx_r ? 12'h2e6 : _GEN_30; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_32 = 7'h20 == idx_r ? 12'h2d4 : _GEN_31; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_33 = 7'h21 == idx_r ? 12'h2c2 : _GEN_32; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_34 = 7'h22 == idx_r ? 12'h2b0 : _GEN_33; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_35 = 7'h23 == idx_r ? 12'h29d : _GEN_34; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_36 = 7'h24 == idx_r ? 12'h28a : _GEN_35; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_37 = 7'h25 == idx_r ? 12'h276 : _GEN_36; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_38 = 7'h26 == idx_r ? 12'h262 : _GEN_37; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_39 = 7'h27 == idx_r ? 12'h24e : _GEN_38; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_40 = 7'h28 == idx_r ? 12'h239 : _GEN_39; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_41 = 7'h29 == idx_r ? 12'h224 : _GEN_40; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_42 = 7'h2a == idx_r ? 12'h20e : _GEN_41; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_43 = 7'h2b == idx_r ? 12'h1f9 : _GEN_42; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_44 = 7'h2c == idx_r ? 12'h1e3 : _GEN_43; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_45 = 7'h2d == idx_r ? 12'h1cc : _GEN_44; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_46 = 7'h2e == idx_r ? 12'h1b6 : _GEN_45; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_47 = 7'h2f == idx_r ? 12'h19f : _GEN_46; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_48 = 7'h30 == idx_r ? 12'h188 : _GEN_47; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_49 = 7'h31 == idx_r ? 12'h171 : _GEN_48; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_50 = 7'h32 == idx_r ? 12'h159 : _GEN_49; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_51 = 7'h33 == idx_r ? 12'h141 : _GEN_50; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_52 = 7'h34 == idx_r ? 12'h129 : _GEN_51; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_53 = 7'h35 == idx_r ? 12'h111 : _GEN_52; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_54 = 7'h36 == idx_r ? 12'hf9 : _GEN_53; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_55 = 7'h37 == idx_r ? 12'he0 : _GEN_54; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_56 = 7'h38 == idx_r ? 12'hc8 : _GEN_55; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_57 = 7'h39 == idx_r ? 12'haf : _GEN_56; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_58 = 7'h3a == idx_r ? 12'h96 : _GEN_57; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_59 = 7'h3b == idx_r ? 12'h7d : _GEN_58; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_60 = 7'h3c == idx_r ? 12'h64 : _GEN_59; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_61 = 7'h3d == idx_r ? 12'h4b : _GEN_60; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_62 = 7'h3e == idx_r ? 12'h32 : _GEN_61; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_63 = 7'h3f == idx_r ? 12'h19 : _GEN_62; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_64 = 7'h40 == idx_r ? 12'h0 : _GEN_63; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_65 = 7'h41 == idx_r ? 12'h0 : _GEN_64; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_66 = 7'h42 == idx_r ? 12'h0 : _GEN_65; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_67 = 7'h43 == idx_r ? 12'h0 : _GEN_66; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_68 = 7'h44 == idx_r ? 12'h0 : _GEN_67; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_69 = 7'h45 == idx_r ? 12'h0 : _GEN_68; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_70 = 7'h46 == idx_r ? 12'h0 : _GEN_69; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_71 = 7'h47 == idx_r ? 12'h0 : _GEN_70; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_72 = 7'h48 == idx_r ? 12'h0 : _GEN_71; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_73 = 7'h49 == idx_r ? 12'h0 : _GEN_72; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_74 = 7'h4a == idx_r ? 12'h0 : _GEN_73; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_75 = 7'h4b == idx_r ? 12'h0 : _GEN_74; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_76 = 7'h4c == idx_r ? 12'h0 : _GEN_75; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_77 = 7'h4d == idx_r ? 12'h0 : _GEN_76; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_78 = 7'h4e == idx_r ? 12'h0 : _GEN_77; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_79 = 7'h4f == idx_r ? 12'h0 : _GEN_78; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_80 = 7'h50 == idx_r ? 12'h0 : _GEN_79; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_81 = 7'h51 == idx_r ? 12'h0 : _GEN_80; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_82 = 7'h52 == idx_r ? 12'h0 : _GEN_81; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_83 = 7'h53 == idx_r ? 12'h0 : _GEN_82; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_84 = 7'h54 == idx_r ? 12'h0 : _GEN_83; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_85 = 7'h55 == idx_r ? 12'h0 : _GEN_84; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_86 = 7'h56 == idx_r ? 12'h0 : _GEN_85; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_87 = 7'h57 == idx_r ? 12'h0 : _GEN_86; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_88 = 7'h58 == idx_r ? 12'h0 : _GEN_87; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_89 = 7'h59 == idx_r ? 12'h0 : _GEN_88; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_90 = 7'h5a == idx_r ? 12'h0 : _GEN_89; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_91 = 7'h5b == idx_r ? 12'h0 : _GEN_90; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_92 = 7'h5c == idx_r ? 12'h0 : _GEN_91; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_93 = 7'h5d == idx_r ? 12'h0 : _GEN_92; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_94 = 7'h5e == idx_r ? 12'h0 : _GEN_93; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_95 = 7'h5f == idx_r ? 12'h0 : _GEN_94; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_96 = 7'h60 == idx_r ? 12'h0 : _GEN_95; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_97 = 7'h61 == idx_r ? 12'h0 : _GEN_96; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_98 = 7'h62 == idx_r ? 12'h0 : _GEN_97; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_99 = 7'h63 == idx_r ? 12'h0 : _GEN_98; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_100 = 7'h64 == idx_r ? 12'h0 : _GEN_99; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_101 = 7'h65 == idx_r ? 12'h0 : _GEN_100; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_102 = 7'h66 == idx_r ? 12'h0 : _GEN_101; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_103 = 7'h67 == idx_r ? 12'h0 : _GEN_102; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_104 = 7'h68 == idx_r ? 12'h0 : _GEN_103; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_105 = 7'h69 == idx_r ? 12'h0 : _GEN_104; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_106 = 7'h6a == idx_r ? 12'h0 : _GEN_105; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_107 = 7'h6b == idx_r ? 12'h0 : _GEN_106; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_108 = 7'h6c == idx_r ? 12'h0 : _GEN_107; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_109 = 7'h6d == idx_r ? 12'h0 : _GEN_108; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_110 = 7'h6e == idx_r ? 12'h0 : _GEN_109; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_111 = 7'h6f == idx_r ? 12'h0 : _GEN_110; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_112 = 7'h70 == idx_r ? 12'h0 : _GEN_111; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_113 = 7'h71 == idx_r ? 12'h0 : _GEN_112; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_114 = 7'h72 == idx_r ? 12'h0 : _GEN_113; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_115 = 7'h73 == idx_r ? 12'h0 : _GEN_114; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_116 = 7'h74 == idx_r ? 12'h0 : _GEN_115; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_117 = 7'h75 == idx_r ? 12'h0 : _GEN_116; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_118 = 7'h76 == idx_r ? 12'h0 : _GEN_117; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_119 = 7'h77 == idx_r ? 12'h0 : _GEN_118; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_120 = 7'h78 == idx_r ? 12'h0 : _GEN_119; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_121 = 7'h79 == idx_r ? 12'h0 : _GEN_120; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_122 = 7'h7a == idx_r ? 12'h0 : _GEN_121; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_123 = 7'h7b == idx_r ? 12'h0 : _GEN_122; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_124 = 7'h7c == idx_r ? 12'h0 : _GEN_123; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_125 = 7'h7d == idx_r ? 12'h0 : _GEN_124; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_126 = 7'h7e == idx_r ? 12'h0 : _GEN_125; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_127 = 7'h7f == idx_r ? 12'h0 : _GEN_126; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _io_wR_T = ~_GEN_127; // @[FFTTwiddle.scala 50:36]
  wire [11:0] _io_wR_T_2 = _io_wR_T + 12'h1; // @[FFTTwiddle.scala 50:45]
  wire [11:0] _GEN_129 = 7'h1 == idx_r ? 12'h19 : 12'h0; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_130 = 7'h2 == idx_r ? 12'h32 : _GEN_129; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_131 = 7'h3 == idx_r ? 12'h4b : _GEN_130; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_132 = 7'h4 == idx_r ? 12'h64 : _GEN_131; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_133 = 7'h5 == idx_r ? 12'h7d : _GEN_132; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_134 = 7'h6 == idx_r ? 12'h96 : _GEN_133; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_135 = 7'h7 == idx_r ? 12'haf : _GEN_134; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_136 = 7'h8 == idx_r ? 12'hc8 : _GEN_135; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_137 = 7'h9 == idx_r ? 12'he0 : _GEN_136; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_138 = 7'ha == idx_r ? 12'hf9 : _GEN_137; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_139 = 7'hb == idx_r ? 12'h111 : _GEN_138; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_140 = 7'hc == idx_r ? 12'h129 : _GEN_139; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_141 = 7'hd == idx_r ? 12'h141 : _GEN_140; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_142 = 7'he == idx_r ? 12'h159 : _GEN_141; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_143 = 7'hf == idx_r ? 12'h171 : _GEN_142; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_144 = 7'h10 == idx_r ? 12'h188 : _GEN_143; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_145 = 7'h11 == idx_r ? 12'h19f : _GEN_144; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_146 = 7'h12 == idx_r ? 12'h1b6 : _GEN_145; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_147 = 7'h13 == idx_r ? 12'h1cc : _GEN_146; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_148 = 7'h14 == idx_r ? 12'h1e3 : _GEN_147; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_149 = 7'h15 == idx_r ? 12'h1f9 : _GEN_148; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_150 = 7'h16 == idx_r ? 12'h20e : _GEN_149; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_151 = 7'h17 == idx_r ? 12'h224 : _GEN_150; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_152 = 7'h18 == idx_r ? 12'h239 : _GEN_151; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_153 = 7'h19 == idx_r ? 12'h24e : _GEN_152; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_154 = 7'h1a == idx_r ? 12'h262 : _GEN_153; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_155 = 7'h1b == idx_r ? 12'h276 : _GEN_154; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_156 = 7'h1c == idx_r ? 12'h28a : _GEN_155; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_157 = 7'h1d == idx_r ? 12'h29d : _GEN_156; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_158 = 7'h1e == idx_r ? 12'h2b0 : _GEN_157; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_159 = 7'h1f == idx_r ? 12'h2c2 : _GEN_158; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_160 = 7'h20 == idx_r ? 12'h2d4 : _GEN_159; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_161 = 7'h21 == idx_r ? 12'h2e6 : _GEN_160; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_162 = 7'h22 == idx_r ? 12'h2f7 : _GEN_161; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_163 = 7'h23 == idx_r ? 12'h307 : _GEN_162; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_164 = 7'h24 == idx_r ? 12'h318 : _GEN_163; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_165 = 7'h25 == idx_r ? 12'h327 : _GEN_164; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_166 = 7'h26 == idx_r ? 12'h336 : _GEN_165; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_167 = 7'h27 == idx_r ? 12'h345 : _GEN_166; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_168 = 7'h28 == idx_r ? 12'h353 : _GEN_167; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_169 = 7'h29 == idx_r ? 12'h361 : _GEN_168; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_170 = 7'h2a == idx_r ? 12'h36e : _GEN_169; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_171 = 7'h2b == idx_r ? 12'h37b : _GEN_170; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_172 = 7'h2c == idx_r ? 12'h387 : _GEN_171; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_173 = 7'h2d == idx_r ? 12'h393 : _GEN_172; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_174 = 7'h2e == idx_r ? 12'h39e : _GEN_173; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_175 = 7'h2f == idx_r ? 12'h3a8 : _GEN_174; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_176 = 7'h30 == idx_r ? 12'h3b2 : _GEN_175; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_177 = 7'h31 == idx_r ? 12'h3bb : _GEN_176; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_178 = 7'h32 == idx_r ? 12'h3c4 : _GEN_177; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_179 = 7'h33 == idx_r ? 12'h3cc : _GEN_178; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_180 = 7'h34 == idx_r ? 12'h3d4 : _GEN_179; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_181 = 7'h35 == idx_r ? 12'h3db : _GEN_180; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_182 = 7'h36 == idx_r ? 12'h3e1 : _GEN_181; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_183 = 7'h37 == idx_r ? 12'h3e7 : _GEN_182; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_184 = 7'h38 == idx_r ? 12'h3ec : _GEN_183; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_185 = 7'h39 == idx_r ? 12'h3f1 : _GEN_184; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_186 = 7'h3a == idx_r ? 12'h3f5 : _GEN_185; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_187 = 7'h3b == idx_r ? 12'h3f8 : _GEN_186; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_188 = 7'h3c == idx_r ? 12'h3fb : _GEN_187; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_189 = 7'h3d == idx_r ? 12'h3fd : _GEN_188; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_190 = 7'h3e == idx_r ? 12'h3ff : _GEN_189; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_191 = 7'h3f == idx_r ? 12'h400 : _GEN_190; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_192 = 7'h40 == idx_r ? 12'h400 : _GEN_191; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_193 = 7'h41 == idx_r ? 12'h0 : _GEN_192; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_194 = 7'h42 == idx_r ? 12'h0 : _GEN_193; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_195 = 7'h43 == idx_r ? 12'h0 : _GEN_194; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_196 = 7'h44 == idx_r ? 12'h0 : _GEN_195; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_197 = 7'h45 == idx_r ? 12'h0 : _GEN_196; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_198 = 7'h46 == idx_r ? 12'h0 : _GEN_197; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_199 = 7'h47 == idx_r ? 12'h0 : _GEN_198; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_200 = 7'h48 == idx_r ? 12'h0 : _GEN_199; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_201 = 7'h49 == idx_r ? 12'h0 : _GEN_200; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_202 = 7'h4a == idx_r ? 12'h0 : _GEN_201; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_203 = 7'h4b == idx_r ? 12'h0 : _GEN_202; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_204 = 7'h4c == idx_r ? 12'h0 : _GEN_203; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_205 = 7'h4d == idx_r ? 12'h0 : _GEN_204; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_206 = 7'h4e == idx_r ? 12'h0 : _GEN_205; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_207 = 7'h4f == idx_r ? 12'h0 : _GEN_206; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_208 = 7'h50 == idx_r ? 12'h0 : _GEN_207; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_209 = 7'h51 == idx_r ? 12'h0 : _GEN_208; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_210 = 7'h52 == idx_r ? 12'h0 : _GEN_209; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_211 = 7'h53 == idx_r ? 12'h0 : _GEN_210; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_212 = 7'h54 == idx_r ? 12'h0 : _GEN_211; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_213 = 7'h55 == idx_r ? 12'h0 : _GEN_212; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_214 = 7'h56 == idx_r ? 12'h0 : _GEN_213; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_215 = 7'h57 == idx_r ? 12'h0 : _GEN_214; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_216 = 7'h58 == idx_r ? 12'h0 : _GEN_215; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_217 = 7'h59 == idx_r ? 12'h0 : _GEN_216; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_218 = 7'h5a == idx_r ? 12'h0 : _GEN_217; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_219 = 7'h5b == idx_r ? 12'h0 : _GEN_218; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_220 = 7'h5c == idx_r ? 12'h0 : _GEN_219; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_221 = 7'h5d == idx_r ? 12'h0 : _GEN_220; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_222 = 7'h5e == idx_r ? 12'h0 : _GEN_221; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_223 = 7'h5f == idx_r ? 12'h0 : _GEN_222; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_224 = 7'h60 == idx_r ? 12'h0 : _GEN_223; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_225 = 7'h61 == idx_r ? 12'h0 : _GEN_224; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_226 = 7'h62 == idx_r ? 12'h0 : _GEN_225; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_227 = 7'h63 == idx_r ? 12'h0 : _GEN_226; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_228 = 7'h64 == idx_r ? 12'h0 : _GEN_227; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_229 = 7'h65 == idx_r ? 12'h0 : _GEN_228; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_230 = 7'h66 == idx_r ? 12'h0 : _GEN_229; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_231 = 7'h67 == idx_r ? 12'h0 : _GEN_230; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_232 = 7'h68 == idx_r ? 12'h0 : _GEN_231; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_233 = 7'h69 == idx_r ? 12'h0 : _GEN_232; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_234 = 7'h6a == idx_r ? 12'h0 : _GEN_233; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_235 = 7'h6b == idx_r ? 12'h0 : _GEN_234; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_236 = 7'h6c == idx_r ? 12'h0 : _GEN_235; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_237 = 7'h6d == idx_r ? 12'h0 : _GEN_236; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_238 = 7'h6e == idx_r ? 12'h0 : _GEN_237; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_239 = 7'h6f == idx_r ? 12'h0 : _GEN_238; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_240 = 7'h70 == idx_r ? 12'h0 : _GEN_239; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_241 = 7'h71 == idx_r ? 12'h0 : _GEN_240; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_242 = 7'h72 == idx_r ? 12'h0 : _GEN_241; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_243 = 7'h73 == idx_r ? 12'h0 : _GEN_242; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_244 = 7'h74 == idx_r ? 12'h0 : _GEN_243; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_245 = 7'h75 == idx_r ? 12'h0 : _GEN_244; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_246 = 7'h76 == idx_r ? 12'h0 : _GEN_245; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_247 = 7'h77 == idx_r ? 12'h0 : _GEN_246; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_248 = 7'h78 == idx_r ? 12'h0 : _GEN_247; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_249 = 7'h79 == idx_r ? 12'h0 : _GEN_248; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_250 = 7'h7a == idx_r ? 12'h0 : _GEN_249; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_251 = 7'h7b == idx_r ? 12'h0 : _GEN_250; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_252 = 7'h7c == idx_r ? 12'h0 : _GEN_251; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_253 = 7'h7d == idx_r ? 12'h0 : _GEN_252; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_254 = 7'h7e == idx_r ? 12'h0 : _GEN_253; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_255 = 7'h7f == idx_r ? 12'h0 : _GEN_254; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _io_wI_T = ~_GEN_255; // @[FFTTwiddle.scala 51:36]
  wire [11:0] _io_wI_T_2 = _io_wI_T + 12'h1; // @[FFTTwiddle.scala 51:45]
  assign io_wR = chg_sign_flag_r ? _io_wR_T_2 : _GEN_127; // @[FFTTwiddle.scala 50:17]
  assign io_wI = chg_sign_flag_i ? _io_wI_T_2 : _GEN_255; // @[FFTTwiddle.scala 51:17]
endmodule
module FFTMultiply(
  input  [17:0] io_a,
  input  [17:0] io_b,
  output [35:0] io_product
);
  wire [17:0] _temp_a_T_1 = ~io_a; // @[FFTMultiply.scala 14:51]
  wire [17:0] _temp_a_T_3 = _temp_a_T_1 + 18'h1; // @[FFTMultiply.scala 14:57]
  wire [17:0] temp_a = io_a[17] ? _temp_a_T_3 : io_a; // @[FFTMultiply.scala 14:21]
  wire [17:0] _temp_b_T_1 = ~io_b; // @[FFTMultiply.scala 15:51]
  wire [17:0] _temp_b_T_3 = _temp_b_T_1 + 18'h1; // @[FFTMultiply.scala 15:57]
  wire [17:0] temp_b = io_b[17] ? _temp_b_T_3 : io_b; // @[FFTMultiply.scala 15:21]
  wire [35:0] long_temp1 = temp_a * temp_b; // @[FFTMultiply.scala 17:29]
  wire [35:0] _long_temp2_T_1 = long_temp1 - 36'h1; // @[FFTMultiply.scala 18:35]
  wire [35:0] long_temp2 = ~_long_temp2_T_1; // @[FFTMultiply.scala 18:22]
  wire [36:0] _io_product_T_17 = {1'h1,long_temp2}; // @[Cat.scala 33:92]
  wire [36:0] _io_product_T_18 = {1'h0,long_temp1}; // @[Cat.scala 33:92]
  wire [36:0] _io_product_T_19 = (io_a[17] ^ io_b[17]) & |long_temp1 ? _io_product_T_17 : _io_product_T_18; // @[FFTMultiply.scala 20:187]
  assign io_product = _io_product_T_19[35:0]; // @[FFTMultiply.scala 20:16]
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
  input         io_dataMode,
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
  wire [6:0] fftTwiddle_io_nk; // @[FFT3PipelineCalc.scala 44:28]
  wire [1:0] fftTwiddle_io_twiLutCaseIndex; // @[FFT3PipelineCalc.scala 44:28]
  wire [11:0] fftTwiddle_io_wR; // @[FFT3PipelineCalc.scala 44:28]
  wire [11:0] fftTwiddle_io_wI; // @[FFT3PipelineCalc.scala 44:28]
  wire [17:0] fftMultiply_io_a; // @[FFT3PipelineCalc.scala 59:29]
  wire [17:0] fftMultiply_io_b; // @[FFT3PipelineCalc.scala 59:29]
  wire [35:0] fftMultiply_io_product; // @[FFT3PipelineCalc.scala 59:29]
  wire [15:0] _dataInSRRnd_T_2 = {io_dataInSR[15],io_dataInSR[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSRRnd_T_5 = {15'h0,io_dataInSR[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInSRRnd = _dataInSRRnd_T_2 + _dataInSRRnd_T_5; // @[FFT3PipelineCalc.scala 28:92]
  wire [15:0] _dataInSIRnd_T_2 = {io_dataInSI[15],io_dataInSI[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSIRnd_T_5 = {15'h0,io_dataInSI[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInSIRnd = _dataInSIRnd_T_2 + _dataInSIRnd_T_5; // @[FFT3PipelineCalc.scala 29:92]
  wire [15:0] _dataInTRRnd_T_2 = {io_dataInTR[15],io_dataInTR[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTRRnd_T_5 = {15'h0,io_dataInTR[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInTRRnd = _dataInTRRnd_T_2 + _dataInTRRnd_T_5; // @[FFT3PipelineCalc.scala 30:92]
  wire [15:0] _dataInTIRnd_T_2 = {io_dataInTI[15],io_dataInTI[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTIRnd_T_5 = {15'h0,io_dataInTI[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInTIRnd = _dataInTIRnd_T_2 + _dataInTIRnd_T_5; // @[FFT3PipelineCalc.scala 31:92]
  reg [6:0] nk1c; // @[Reg.scala 35:20]
  reg [15:0] sR2c; // @[Reg.scala 35:20]
  reg [15:0] sI2c; // @[Reg.scala 35:20]
  reg [15:0] tR2c; // @[Reg.scala 35:20]
  reg [15:0] tI2c; // @[Reg.scala 35:20]
  wire [16:0] _wR2c_T_1 = {fftTwiddle_io_wR,5'h0}; // @[Cat.scala 33:92]
  reg [16:0] wR2c; // @[Reg.scala 35:20]
  wire [16:0] _wI2c_T_1 = {fftTwiddle_io_wI,5'h0}; // @[Cat.scala 33:92]
  reg [16:0] wI2c; // @[Reg.scala 35:20]
  wire [1:0] _addTRI_T_2 = tR2c[15] ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [17:0] _addTRI_T_3 = {_addTRI_T_2,tR2c}; // @[Cat.scala 33:92]
  wire [1:0] _addTRI_T_6 = tI2c[15] ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [17:0] _addTRI_T_7 = {_addTRI_T_6,tI2c}; // @[Cat.scala 33:92]
  wire [17:0] _addWRI_T_1 = {wR2c[16],wR2c}; // @[Cat.scala 33:92]
  wire [17:0] _addWRI_T_3 = {wI2c[16],wI2c}; // @[Cat.scala 33:92]
  wire [16:0] _multRPre_T_2 = tR2c[15] ? 17'h1ffff : 17'h0; // @[Bitwise.scala 77:12]
  wire [32:0] _multRPre_T_3 = {_multRPre_T_2,tR2c}; // @[Cat.scala 33:92]
  wire [15:0] _multRPre_T_6 = wR2c[16] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [32:0] _multRPre_T_7 = {_multRPre_T_6,wR2c}; // @[Cat.scala 33:92]
  wire [65:0] multRPre = _multRPre_T_3 * _multRPre_T_7; // @[FFT3PipelineCalc.scala 65:78]
  wire [32:0] multR = multRPre[32:0]; // @[FFT3PipelineCalc.scala 66:25]
  wire [16:0] _multIPre_T_2 = tI2c[15] ? 17'h1ffff : 17'h0; // @[Bitwise.scala 77:12]
  wire [32:0] _multIPre_T_3 = {_multIPre_T_2,tI2c}; // @[Cat.scala 33:92]
  wire [15:0] _multIPre_T_6 = wI2c[16] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [32:0] _multIPre_T_7 = {_multIPre_T_6,wI2c}; // @[Cat.scala 33:92]
  wire [65:0] multIPre = _multIPre_T_3 * _multIPre_T_7; // @[FFT3PipelineCalc.scala 68:78]
  wire [32:0] multI = multIPre[32:0]; // @[FFT3PipelineCalc.scala 69:25]
  wire [16:0] _qR2cKernel_T_2 = {multR[32],multR[30:15]}; // @[Cat.scala 33:92]
  wire [16:0] _qR2cKernel_T_5 = {multI[32],multI[30:15]}; // @[Cat.scala 33:92]
  wire [16:0] qR2cKernel = _qR2cKernel_T_2 - _qR2cKernel_T_5; // @[FFT3PipelineCalc.scala 71:108]
  wire [16:0] _qI2cKernel_T_2 = {fftMultiply_io_product[35],fftMultiply_io_product[30:15]}; // @[Cat.scala 33:92]
  wire [16:0] _qI2cKernel_T_7 = _qI2cKernel_T_2 - _qR2cKernel_T_2; // @[FFT3PipelineCalc.scala 72:112]
  wire [16:0] qI2cKernel = _qI2cKernel_T_7 - _qR2cKernel_T_5; // @[FFT3PipelineCalc.scala 72:200]
  wire [16:0] qR2cProc = {tR2c[15],tR2c}; // @[Cat.scala 33:92]
  wire [16:0] _qI2cProc_T_1 = {tI2c[15],tI2c}; // @[Cat.scala 33:92]
  wire [16:0] _qI2cProc_T_2 = ~_qI2cProc_T_1; // @[FFT3PipelineCalc.scala 75:20]
  wire [16:0] qI2cProc = _qI2cProc_T_2 + 17'h1; // @[FFT3PipelineCalc.scala 75:55]
  reg [15:0] sR3c; // @[Reg.scala 35:20]
  reg [15:0] sI3c; // @[Reg.scala 35:20]
  reg [16:0] qR3c; // @[Reg.scala 35:20]
  reg [16:0] qI3c; // @[Reg.scala 35:20]
  wire [1:0] _xR3cPre_T_2 = sR3c[15] ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [17:0] _xR3cPre_T_3 = {_xR3cPre_T_2,sR3c}; // @[Cat.scala 33:92]
  wire [17:0] _xR3cPre_T_5 = {qR3c[16],qR3c}; // @[Cat.scala 33:92]
  wire [17:0] xR3cPre = _xR3cPre_T_3 + _xR3cPre_T_5; // @[FFT3PipelineCalc.scala 86:62]
  wire [1:0] _xI3cPre_T_2 = sI3c[15] ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [17:0] _xI3cPre_T_3 = {_xI3cPre_T_2,sI3c}; // @[Cat.scala 33:92]
  wire [17:0] _xI3cPre_T_5 = {qI3c[16],qI3c}; // @[Cat.scala 33:92]
  wire [17:0] xI3cPre = _xI3cPre_T_3 + _xI3cPre_T_5; // @[FFT3PipelineCalc.scala 87:62]
  wire [14:0] _xR3c_T_6 = xR3cPre[17] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xR3c_T_7 = ~_xR3c_T_6; // @[FFT3PipelineCalc.scala 89:108]
  wire [15:0] _xR3c_T_8 = {xR3cPre[17],_xR3c_T_7}; // @[Cat.scala 33:92]
  wire [15:0] _xR3c_T_19 = xR3cPre[17] ^ xR3cPre[15] ? _xR3c_T_8 : xR3cPre[15:0]; // @[FFT3PipelineCalc.scala 89:164]
  wire [14:0] _xI3c_T_6 = xI3cPre[17] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xI3c_T_7 = ~_xI3c_T_6; // @[FFT3PipelineCalc.scala 90:108]
  wire [15:0] _xI3c_T_8 = {xI3cPre[17],_xI3c_T_7}; // @[Cat.scala 33:92]
  wire [15:0] _xI3c_T_19 = xI3cPre[17] ^ xI3cPre[15] ? _xI3c_T_8 : xI3cPre[15:0]; // @[FFT3PipelineCalc.scala 90:164]
  wire [17:0] yR3cPre = _xR3cPre_T_3 - _xR3cPre_T_5; // @[FFT3PipelineCalc.scala 95:62]
  wire [17:0] yI3cPre = _xI3cPre_T_3 - _xI3cPre_T_5; // @[FFT3PipelineCalc.scala 96:62]
  wire [14:0] _yR3c_T_6 = yR3cPre[17] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yR3c_T_7 = ~_yR3c_T_6; // @[FFT3PipelineCalc.scala 98:108]
  wire [15:0] _yR3c_T_8 = {yR3cPre[17],_yR3c_T_7}; // @[Cat.scala 33:92]
  wire [15:0] _yR3c_T_19 = yR3cPre[17] ^ yR3cPre[15] ? _yR3c_T_8 : yR3cPre[15:0]; // @[FFT3PipelineCalc.scala 98:164]
  wire [14:0] _yI3c_T_6 = yI3cPre[17] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yI3c_T_7 = ~_yI3c_T_6; // @[FFT3PipelineCalc.scala 99:108]
  wire [15:0] _yI3c_T_8 = {yI3cPre[17],_yI3c_T_7}; // @[Cat.scala 33:92]
  wire [15:0] _yI3c_T_19 = yI3cPre[17] ^ yI3cPre[15] ? _yI3c_T_8 : yI3cPre[15:0]; // @[FFT3PipelineCalc.scala 99:164]
  FFTTwiddle fftTwiddle ( // @[FFT3PipelineCalc.scala 44:28]
    .io_nk(fftTwiddle_io_nk),
    .io_twiLutCaseIndex(fftTwiddle_io_twiLutCaseIndex),
    .io_wR(fftTwiddle_io_wR),
    .io_wI(fftTwiddle_io_wI)
  );
  FFTMultiply fftMultiply ( // @[FFT3PipelineCalc.scala 59:29]
    .io_a(fftMultiply_io_a),
    .io_b(fftMultiply_io_b),
    .io_product(fftMultiply_io_product)
  );
  assign io_dataOutSR3c = xR3cPre[17] ^ xR3cPre[16] ? _xR3c_T_8 : _xR3c_T_19; // @[FFT3PipelineCalc.scala 89:19]
  assign io_dataOutSI3c = xI3cPre[17] ^ xI3cPre[16] ? _xI3c_T_8 : _xI3c_T_19; // @[FFT3PipelineCalc.scala 90:19]
  assign io_dataOutTR3c = yR3cPre[17] ^ yR3cPre[16] ? _yR3c_T_8 : _yR3c_T_19; // @[FFT3PipelineCalc.scala 98:19]
  assign io_dataOutTI3c = yI3cPre[17] ^ yI3cPre[16] ? _yI3c_T_8 : _yI3c_T_19; // @[FFT3PipelineCalc.scala 99:19]
  assign fftTwiddle_io_nk = {nk1c[5:0],1'h0}; // @[Cat.scala 33:92]
  assign fftTwiddle_io_twiLutCaseIndex = io_isFFT ? 2'h0 : 2'h1; // @[FFT3PipelineCalc.scala 42:30]
  assign fftMultiply_io_a = _addTRI_T_3 + _addTRI_T_7; // @[FFT3PipelineCalc.scala 57:61]
  assign fftMultiply_io_b = _addWRI_T_1 + _addWRI_T_3; // @[FFT3PipelineCalc.scala 58:52]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      nk1c <= 7'h0; // @[Reg.scala 35:20]
    end else begin
      nk1c <= io_nk;
    end
    if (reset) begin // @[Reg.scala 35:20]
      sR2c <= 16'h0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 33:25]
        sR2c <= dataInSRRnd;
      end else begin
        sR2c <= io_dataInSR;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      sI2c <= 16'h0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 34:25]
        sI2c <= dataInSIRnd;
      end else begin
        sI2c <= io_dataInSI;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      tR2c <= 16'h0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 35:25]
        tR2c <= dataInTRRnd;
      end else begin
        tR2c <= io_dataInTR;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      tI2c <= 16'h0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      if (io_rShiftSym) begin // @[FFT3PipelineCalc.scala 36:25]
        tI2c <= dataInTIRnd;
      end else begin
        tI2c <= io_dataInTI;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c <= 17'h0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wR2c <= _wR2c_T_1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c <= 17'h0; // @[Reg.scala 35:20]
    end else if (io_state1c) begin // @[Reg.scala 36:18]
      wI2c <= _wI2c_T_1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      sR3c <= 16'h0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      sR3c <= sR2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      sI3c <= 16'h0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      sI3c <= sI2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      qR3c <= 17'h0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_dataMode) begin // @[FFT3PipelineCalc.scala 77:19]
        qR3c <= qR2cProc;
      end else begin
        qR3c <= qR2cKernel;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      qI3c <= 17'h0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_dataMode) begin // @[FFT3PipelineCalc.scala 78:19]
        qI3c <= qI2cProc;
      end else begin
        qI3c <= qI2cKernel;
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
  nk1c = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  sR2c = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  sI2c = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  tR2c = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  tI2c = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  wR2c = _RAND_5[16:0];
  _RAND_6 = {1{`RANDOM}};
  wI2c = _RAND_6[16:0];
  _RAND_7 = {1{`RANDOM}};
  sR3c = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  sI3c = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  qR3c = _RAND_9[16:0];
  _RAND_10 = {1{`RANDOM}};
  qI3c = _RAND_10[16:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFTDataProcess(
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
  output        io_procDone,
  input         io_procKick,
  input         io_fftMode
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
`endif // RANDOMIZE_REG_INIT
  wire  dataCalc_clock; // @[FFTDataProcess.scala 200:26]
  wire  dataCalc_reset; // @[FFTDataProcess.scala 200:26]
  wire [15:0] dataCalc_io_dataInSR; // @[FFTDataProcess.scala 200:26]
  wire [15:0] dataCalc_io_dataInSI; // @[FFTDataProcess.scala 200:26]
  wire [15:0] dataCalc_io_dataInTR; // @[FFTDataProcess.scala 200:26]
  wire [15:0] dataCalc_io_dataInTI; // @[FFTDataProcess.scala 200:26]
  wire [15:0] dataCalc_io_dataOutSR3c; // @[FFTDataProcess.scala 200:26]
  wire [15:0] dataCalc_io_dataOutSI3c; // @[FFTDataProcess.scala 200:26]
  wire [15:0] dataCalc_io_dataOutTR3c; // @[FFTDataProcess.scala 200:26]
  wire [15:0] dataCalc_io_dataOutTI3c; // @[FFTDataProcess.scala 200:26]
  wire [6:0] dataCalc_io_nk; // @[FFTDataProcess.scala 200:26]
  wire  dataCalc_io_rShiftSym; // @[FFTDataProcess.scala 200:26]
  wire  dataCalc_io_isFFT; // @[FFTDataProcess.scala 200:26]
  wire  dataCalc_io_dataMode; // @[FFTDataProcess.scala 200:26]
  wire  dataCalc_io_state1c; // @[FFTDataProcess.scala 200:26]
  wire  dataCalc_io_state2c; // @[FFTDataProcess.scala 200:26]
  reg [2:0] stateReg; // @[FFTDataProcess.scala 38:27]
  reg [6:0] radixCount; // @[FFTDataProcess.scala 40:29]
  reg [1:0] phaseCount; // @[FFTDataProcess.scala 42:29]
  wire  _T_2 = radixCount == 7'h3f; // @[FFTDataProcess.scala 53:29]
  wire  _T_4 = radixCount == 7'h3; // @[FFTDataProcess.scala 60:29]
  wire [2:0] _GEN_2 = radixCount == 7'h3 ? 3'h3 : stateReg; // @[FFTDataProcess.scala 60:46 61:26 63:26]
  wire  _T_6 = phaseCount == 2'h1; // @[FFTDataProcess.scala 67:29]
  wire [2:0] _GEN_3 = phaseCount == 2'h1 ? 3'h4 : 3'h1; // @[FFTDataProcess.scala 67:47 68:26 70:26]
  wire [2:0] _GEN_4 = 3'h4 == stateReg ? 3'h0 : stateReg; // @[FFTDataProcess.scala 44:22 74:22 38:27]
  wire [2:0] _GEN_5 = 3'h3 == stateReg ? _GEN_3 : _GEN_4; // @[FFTDataProcess.scala 44:22]
  wire  _radixInit_T = stateReg == 3'h0; // @[FFTDataProcess.scala 78:31]
  wire  _radixInit_T_1 = stateReg == 3'h1; // @[FFTDataProcess.scala 79:16]
  wire  _radixInit_T_3 = stateReg == 3'h1 & _T_2; // @[FFTDataProcess.scala 79:28]
  wire  _radixInit_T_4 = stateReg == 3'h0 | _radixInit_T_3; // @[FFTDataProcess.scala 78:45]
  wire  _radixInit_T_5 = stateReg == 3'h2; // @[FFTDataProcess.scala 80:16]
  wire  _radixInit_T_7 = stateReg == 3'h2 & _T_4; // @[FFTDataProcess.scala 80:29]
  wire  _radixInit_T_8 = _radixInit_T_4 | _radixInit_T_7; // @[FFTDataProcess.scala 79:62]
  wire  _radixInit_T_9 = stateReg == 3'h3; // @[FFTDataProcess.scala 81:15]
  wire  _radixInit_T_10 = _radixInit_T_8 | _radixInit_T_9; // @[FFTDataProcess.scala 80:62]
  wire  _radixInit_T_11 = stateReg == 3'h4; // @[FFTDataProcess.scala 82:15]
  wire  radixInit = _radixInit_T_10 | _radixInit_T_11; // @[FFTDataProcess.scala 81:30]
  wire  radixUp = _radixInit_T_1 | _radixInit_T_5; // @[FFTDataProcess.scala 84:41]
  wire [6:0] _radixCount_T_1 = radixCount + 7'h1; // @[FFTDataProcess.scala 89:34]
  wire  _phaseInit_T_3 = _radixInit_T_9 & _T_6; // @[FFTDataProcess.scala 95:31]
  wire  _phaseInit_T_4 = _radixInit_T | _phaseInit_T_3; // @[FFTDataProcess.scala 94:45]
  wire  phaseInit = _phaseInit_T_4 | _radixInit_T_11; // @[FFTDataProcess.scala 95:64]
  wire [1:0] _phaseCount_T_1 = phaseCount + 2'h1; // @[FFTDataProcess.scala 103:34]
  reg  srcBuffer; // @[FFTDataProcess.scala 108:28]
  wire  _srcBufferNext_T_1 = ~srcBuffer; // @[FFTDataProcess.scala 110:52]
  wire  srcBufferNext = _radixInit_T_9 & ~srcBuffer; // @[FFTDataProcess.scala 110:50]
  wire  srcUp = _radixInit_T | _radixInit_T_9; // @[FFTDataProcess.scala 112:41]
  wire  addrS_temp_0 = radixCount[6]; // @[FFTDataProcess.scala 126:34]
  wire  addrS_temp_1 = radixCount[5]; // @[FFTDataProcess.scala 126:34]
  wire  addrS_temp_2 = radixCount[4]; // @[FFTDataProcess.scala 126:34]
  wire  addrS_temp_3 = radixCount[3]; // @[FFTDataProcess.scala 126:34]
  wire [6:0] addrS = {radixCount[0],radixCount[1],radixCount[2],addrS_temp_3,addrS_temp_2,addrS_temp_1,addrS_temp_0}; // @[FFTDataProcess.scala 130:70]
  wire [6:0] _addrT_T = ~radixCount; // @[FFTDataProcess.scala 131:58]
  wire [6:0] _addrT_T_2 = _addrT_T + 7'h1; // @[FFTDataProcess.scala 131:70]
  wire  addrT_temp_0 = _addrT_T_2[6]; // @[FFTDataProcess.scala 126:34]
  wire  addrT_temp_1 = _addrT_T_2[5]; // @[FFTDataProcess.scala 126:34]
  wire  addrT_temp_2 = _addrT_T_2[4]; // @[FFTDataProcess.scala 126:34]
  wire  addrT_temp_3 = _addrT_T_2[3]; // @[FFTDataProcess.scala 126:34]
  wire [6:0] addrT = {_addrT_T_2[0],_addrT_T_2[1],_addrT_T_2[2],addrT_temp_3,addrT_temp_2,addrT_temp_1,addrT_temp_0}; // @[FFTDataProcess.scala 131:97]
  wire  sameAddr = addrS == addrT; // @[FFTDataProcess.scala 133:26]
  wire [6:0] _addrSBankSelPre_sum_T = {{2'd0}, addrS[6:2]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_291 = {{2'd0}, _addrSBankSelPre_sum_T[0]}; // @[FFTDataProcess.scala 136:107]
  wire [3:0] _addrSBankSelPre_sum_T_2 = {{1'd0}, _GEN_291}; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrSBankSelPre_sum_T_4 = {{5'd0}, addrS[6:5]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_293 = {{2'd0}, _addrSBankSelPre_sum_T_4[0]}; // @[FFTDataProcess.scala 136:107]
  wire [2:0] addrSBankSelPre_0 = _addrSBankSelPre_sum_T_2[2:0] + _GEN_293; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrSBankSelPre_sum_T_7 = {{1'd0}, addrS[6:1]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_295 = {{2'd0}, _addrSBankSelPre_sum_T_7[0]}; // @[FFTDataProcess.scala 136:107]
  wire [3:0] _addrSBankSelPre_sum_T_9 = {{1'd0}, _GEN_295}; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrSBankSelPre_sum_T_11 = {{4'd0}, addrS[6:4]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_297 = {{2'd0}, _addrSBankSelPre_sum_T_11[0]}; // @[FFTDataProcess.scala 136:107]
  wire [2:0] addrSBankSelPre_1 = _addrSBankSelPre_sum_T_9[2:0] + _GEN_297; // @[FFTDataProcess.scala 136:107]
  wire [2:0] _GEN_298 = {{2'd0}, addrS[0]}; // @[FFTDataProcess.scala 136:107]
  wire [3:0] _addrSBankSelPre_sum_T_16 = {{1'd0}, _GEN_298}; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrSBankSelPre_sum_T_18 = {{3'd0}, addrS[6:3]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_300 = {{2'd0}, _addrSBankSelPre_sum_T_18[0]}; // @[FFTDataProcess.scala 136:107]
  wire [2:0] _addrSBankSelPre_sum_T_21 = _addrSBankSelPre_sum_T_16[2:0] + _GEN_300; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrSBankSelPre_sum_T_22 = {{6'd0}, addrS[6]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_302 = {{2'd0}, _addrSBankSelPre_sum_T_22[0]}; // @[FFTDataProcess.scala 136:107]
  wire [2:0] addrSBankSelPre_2 = _addrSBankSelPre_sum_T_21 + _GEN_302; // @[FFTDataProcess.scala 136:107]
  wire [3:0] _addrSBankSel_T_1 = {{1'd0}, addrSBankSelPre_0}; // @[FFTDataProcess.scala 142:69]
  wire [3:0] _addrSBankSel_T_3 = {_addrSBankSel_T_1[2:0], 1'h0}; // @[FFTDataProcess.scala 142:63]
  wire [3:0] _GEN_303 = {{1'd0}, addrSBankSelPre_1}; // @[FFTDataProcess.scala 142:69]
  wire [3:0] _addrSBankSel_T_5 = _addrSBankSel_T_3 + _GEN_303; // @[FFTDataProcess.scala 142:69]
  wire [4:0] _addrSBankSel_T_6 = {_addrSBankSel_T_5, 1'h0}; // @[FFTDataProcess.scala 142:63]
  wire [4:0] _GEN_304 = {{2'd0}, addrSBankSelPre_2}; // @[FFTDataProcess.scala 142:69]
  wire [4:0] _addrSBankSel_T_8 = _addrSBankSel_T_6 + _GEN_304; // @[FFTDataProcess.scala 142:69]
  wire [2:0] addrSBankSel = _addrSBankSel_T_8[2:0]; // @[FFTDataProcess.scala 142:73]
  wire [6:0] _addrTBankSelPre_sum_T = {{2'd0}, addrT[6:2]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_306 = {{2'd0}, _addrTBankSelPre_sum_T[0]}; // @[FFTDataProcess.scala 136:107]
  wire [3:0] _addrTBankSelPre_sum_T_2 = {{1'd0}, _GEN_306}; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrTBankSelPre_sum_T_4 = {{5'd0}, addrT[6:5]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_308 = {{2'd0}, _addrTBankSelPre_sum_T_4[0]}; // @[FFTDataProcess.scala 136:107]
  wire [2:0] addrTBankSelPre_0 = _addrTBankSelPre_sum_T_2[2:0] + _GEN_308; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrTBankSelPre_sum_T_7 = {{1'd0}, addrT[6:1]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_310 = {{2'd0}, _addrTBankSelPre_sum_T_7[0]}; // @[FFTDataProcess.scala 136:107]
  wire [3:0] _addrTBankSelPre_sum_T_9 = {{1'd0}, _GEN_310}; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrTBankSelPre_sum_T_11 = {{4'd0}, addrT[6:4]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_312 = {{2'd0}, _addrTBankSelPre_sum_T_11[0]}; // @[FFTDataProcess.scala 136:107]
  wire [2:0] addrTBankSelPre_1 = _addrTBankSelPre_sum_T_9[2:0] + _GEN_312; // @[FFTDataProcess.scala 136:107]
  wire [2:0] _GEN_313 = {{2'd0}, addrT[0]}; // @[FFTDataProcess.scala 136:107]
  wire [3:0] _addrTBankSelPre_sum_T_16 = {{1'd0}, _GEN_313}; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrTBankSelPre_sum_T_18 = {{3'd0}, addrT[6:3]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_315 = {{2'd0}, _addrTBankSelPre_sum_T_18[0]}; // @[FFTDataProcess.scala 136:107]
  wire [2:0] _addrTBankSelPre_sum_T_21 = _addrTBankSelPre_sum_T_16[2:0] + _GEN_315; // @[FFTDataProcess.scala 136:107]
  wire [6:0] _addrTBankSelPre_sum_T_22 = {{6'd0}, addrT[6]}; // @[FFTDataProcess.scala 136:115]
  wire [2:0] _GEN_317 = {{2'd0}, _addrTBankSelPre_sum_T_22[0]}; // @[FFTDataProcess.scala 136:107]
  wire [2:0] addrTBankSelPre_2 = _addrTBankSelPre_sum_T_21 + _GEN_317; // @[FFTDataProcess.scala 136:107]
  wire [3:0] _addrTBankSel_T_1 = {{1'd0}, addrTBankSelPre_0}; // @[FFTDataProcess.scala 146:69]
  wire [3:0] _addrTBankSel_T_3 = {_addrTBankSel_T_1[2:0], 1'h0}; // @[FFTDataProcess.scala 146:63]
  wire [3:0] _GEN_318 = {{1'd0}, addrTBankSelPre_1}; // @[FFTDataProcess.scala 146:69]
  wire [3:0] _addrTBankSel_T_5 = _addrTBankSel_T_3 + _GEN_318; // @[FFTDataProcess.scala 146:69]
  wire [4:0] _addrTBankSel_T_6 = {_addrTBankSel_T_5, 1'h0}; // @[FFTDataProcess.scala 146:63]
  wire [4:0] _GEN_319 = {{2'd0}, addrTBankSelPre_2}; // @[FFTDataProcess.scala 146:69]
  wire [4:0] _addrTBankSel_T_8 = _addrTBankSel_T_6 + _GEN_319; // @[FFTDataProcess.scala 146:69]
  wire [2:0] addrTBankSel = _addrTBankSel_T_8[2:0]; // @[FFTDataProcess.scala 146:73]
  wire [3:0] _GEN_22 = 3'h0 == addrTBankSel ? addrT[3:0] : addrS[3:0]; // @[FFTDataProcess.scala 150:{40,40}]
  wire [3:0] _GEN_23 = 3'h1 == addrTBankSel ? addrT[3:0] : addrS[3:0]; // @[FFTDataProcess.scala 150:{40,40}]
  wire [3:0] _GEN_24 = 3'h2 == addrTBankSel ? addrT[3:0] : addrS[3:0]; // @[FFTDataProcess.scala 150:{40,40}]
  wire [3:0] _GEN_25 = 3'h3 == addrTBankSel ? addrT[3:0] : addrS[3:0]; // @[FFTDataProcess.scala 150:{40,40}]
  wire [3:0] _GEN_26 = 3'h4 == addrTBankSel ? addrT[3:0] : addrS[3:0]; // @[FFTDataProcess.scala 150:{40,40}]
  wire [3:0] _GEN_27 = 3'h5 == addrTBankSel ? addrT[3:0] : addrS[3:0]; // @[FFTDataProcess.scala 150:{40,40}]
  wire [3:0] _GEN_28 = 3'h6 == addrTBankSel ? addrT[3:0] : addrS[3:0]; // @[FFTDataProcess.scala 150:{40,40}]
  wire [3:0] _GEN_29 = 3'h7 == addrTBankSel ? addrT[3:0] : addrS[3:0]; // @[FFTDataProcess.scala 150:{40,40}]
  wire  _io_readEnableSram0Bank_0_T_1 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTDataProcess.scala 158:53]
  wire  _io_readEnableSram1Bank_0_T = _radixInit_T_1 & srcBuffer; // @[FFTDataProcess.scala 160:53]
  reg [2:0] addrSBankSel1c; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel2c; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel3c; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel2c; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel3c; // @[Reg.scala 35:20]
  reg  procState1c; // @[Reg.scala 35:20]
  reg  procState2c; // @[Reg.scala 35:20]
  reg  procState3c; // @[Reg.scala 35:20]
  reg [3:0] addrS1c; // @[Reg.scala 35:20]
  reg [3:0] addrS2c; // @[Reg.scala 35:20]
  reg [3:0] addrS3c; // @[Reg.scala 35:20]
  reg [3:0] addrT1c; // @[Reg.scala 35:20]
  reg [3:0] addrT2c; // @[Reg.scala 35:20]
  reg [3:0] addrT3c; // @[Reg.scala 35:20]
  reg  sameAddr1c; // @[Reg.scala 35:20]
  reg  sameAddr2c; // @[Reg.scala 35:20]
  reg  sameAddr3c; // @[Reg.scala 35:20]
  wire [31:0] _GEN_97 = 3'h1 == addrSBankSel1c ? io_readDataSram1Bank_1 : io_readDataSram1Bank_0; // @[FFTDataProcess.scala 194:{71,71}]
  wire [31:0] _GEN_98 = 3'h2 == addrSBankSel1c ? io_readDataSram1Bank_2 : _GEN_97; // @[FFTDataProcess.scala 194:{71,71}]
  wire [31:0] _GEN_99 = 3'h3 == addrSBankSel1c ? io_readDataSram1Bank_3 : _GEN_98; // @[FFTDataProcess.scala 194:{71,71}]
  wire [31:0] _GEN_100 = 3'h4 == addrSBankSel1c ? io_readDataSram1Bank_4 : _GEN_99; // @[FFTDataProcess.scala 194:{71,71}]
  wire [31:0] _GEN_101 = 3'h5 == addrSBankSel1c ? io_readDataSram1Bank_5 : _GEN_100; // @[FFTDataProcess.scala 194:{71,71}]
  wire [31:0] _GEN_102 = 3'h6 == addrSBankSel1c ? io_readDataSram1Bank_6 : _GEN_101; // @[FFTDataProcess.scala 194:{71,71}]
  wire [31:0] _GEN_103 = 3'h7 == addrSBankSel1c ? io_readDataSram1Bank_7 : _GEN_102; // @[FFTDataProcess.scala 194:{71,71}]
  wire [31:0] _GEN_105 = 3'h1 == addrSBankSel1c ? io_readDataSram0Bank_1 : io_readDataSram0Bank_0; // @[FFTDataProcess.scala 194:{130,130}]
  wire [31:0] _GEN_106 = 3'h2 == addrSBankSel1c ? io_readDataSram0Bank_2 : _GEN_105; // @[FFTDataProcess.scala 194:{130,130}]
  wire [31:0] _GEN_107 = 3'h3 == addrSBankSel1c ? io_readDataSram0Bank_3 : _GEN_106; // @[FFTDataProcess.scala 194:{130,130}]
  wire [31:0] _GEN_108 = 3'h4 == addrSBankSel1c ? io_readDataSram0Bank_4 : _GEN_107; // @[FFTDataProcess.scala 194:{130,130}]
  wire [31:0] _GEN_109 = 3'h5 == addrSBankSel1c ? io_readDataSram0Bank_5 : _GEN_108; // @[FFTDataProcess.scala 194:{130,130}]
  wire [31:0] _GEN_110 = 3'h6 == addrSBankSel1c ? io_readDataSram0Bank_6 : _GEN_109; // @[FFTDataProcess.scala 194:{130,130}]
  wire [31:0] _GEN_111 = 3'h7 == addrSBankSel1c ? io_readDataSram0Bank_7 : _GEN_110; // @[FFTDataProcess.scala 194:{130,130}]
  wire [15:0] dataInSI = srcBuffer ? _GEN_103[31:16] : _GEN_111[31:16]; // @[FFTDataProcess.scala 195:23]
  wire [31:0] _GEN_129 = 3'h1 == addrTBankSel1c ? io_readDataSram1Bank_1 : io_readDataSram1Bank_0; // @[FFTDataProcess.scala 197:{71,71}]
  wire [31:0] _GEN_130 = 3'h2 == addrTBankSel1c ? io_readDataSram1Bank_2 : _GEN_129; // @[FFTDataProcess.scala 197:{71,71}]
  wire [31:0] _GEN_131 = 3'h3 == addrTBankSel1c ? io_readDataSram1Bank_3 : _GEN_130; // @[FFTDataProcess.scala 197:{71,71}]
  wire [31:0] _GEN_132 = 3'h4 == addrTBankSel1c ? io_readDataSram1Bank_4 : _GEN_131; // @[FFTDataProcess.scala 197:{71,71}]
  wire [31:0] _GEN_133 = 3'h5 == addrTBankSel1c ? io_readDataSram1Bank_5 : _GEN_132; // @[FFTDataProcess.scala 197:{71,71}]
  wire [31:0] _GEN_134 = 3'h6 == addrTBankSel1c ? io_readDataSram1Bank_6 : _GEN_133; // @[FFTDataProcess.scala 197:{71,71}]
  wire [31:0] _GEN_135 = 3'h7 == addrTBankSel1c ? io_readDataSram1Bank_7 : _GEN_134; // @[FFTDataProcess.scala 197:{71,71}]
  wire [31:0] _GEN_137 = 3'h1 == addrTBankSel1c ? io_readDataSram0Bank_1 : io_readDataSram0Bank_0; // @[FFTDataProcess.scala 197:{130,130}]
  wire [31:0] _GEN_138 = 3'h2 == addrTBankSel1c ? io_readDataSram0Bank_2 : _GEN_137; // @[FFTDataProcess.scala 197:{130,130}]
  wire [31:0] _GEN_139 = 3'h3 == addrTBankSel1c ? io_readDataSram0Bank_3 : _GEN_138; // @[FFTDataProcess.scala 197:{130,130}]
  wire [31:0] _GEN_140 = 3'h4 == addrTBankSel1c ? io_readDataSram0Bank_4 : _GEN_139; // @[FFTDataProcess.scala 197:{130,130}]
  wire [31:0] _GEN_141 = 3'h5 == addrTBankSel1c ? io_readDataSram0Bank_5 : _GEN_140; // @[FFTDataProcess.scala 197:{130,130}]
  wire [31:0] _GEN_142 = 3'h6 == addrTBankSel1c ? io_readDataSram0Bank_6 : _GEN_141; // @[FFTDataProcess.scala 197:{130,130}]
  wire [31:0] _GEN_143 = 3'h7 == addrTBankSel1c ? io_readDataSram0Bank_7 : _GEN_142; // @[FFTDataProcess.scala 197:{130,130}]
  wire [15:0] dataInTR = srcBuffer ? _GEN_135[15:0] : _GEN_143[15:0]; // @[FFTDataProcess.scala 197:23]
  wire [15:0] dataInTI = srcBuffer ? _GEN_135[31:16] : _GEN_143[31:16]; // @[FFTDataProcess.scala 198:23]
  wire  _dataCalc_io_dataInSI_T_1 = sameAddr1c & _T_6; // @[FFTDataProcess.scala 202:44]
  wire [15:0] writeDataTRPre = _T_6 ? dataCalc_io_dataOutTR3c : dataCalc_io_dataOutTI3c; // @[FFTDataProcess.scala 213:29]
  wire [15:0] _writeDataTIPre_T_1 = ~dataCalc_io_dataOutTI3c; // @[FFTDataProcess.scala 214:50]
  wire [15:0] _writeDataTIPre_T_3 = _writeDataTIPre_T_1 + 16'h1; // @[FFTDataProcess.scala 214:75]
  wire [15:0] _writeDataTIPre_T_4 = ~dataCalc_io_dataOutTR3c; // @[FFTDataProcess.scala 214:82]
  wire [15:0] _writeDataTIPre_T_6 = _writeDataTIPre_T_4 + 16'h1; // @[FFTDataProcess.scala 214:107]
  wire [15:0] writeDataTIPre = _T_6 ? _writeDataTIPre_T_3 : _writeDataTIPre_T_6; // @[FFTDataProcess.scala 214:29]
  wire [31:0] _writeDataS_T = {writeDataTIPre,dataCalc_io_dataOutSR3c}; // @[Cat.scala 33:92]
  wire [31:0] _writeDataT_T_1 = {writeDataTRPre,dataCalc_io_dataOutSR3c}; // @[Cat.scala 33:92]
  wire [31:0] _writeDataT_T_2 = {dataCalc_io_dataOutSI3c,dataCalc_io_dataOutSR3c}; // @[Cat.scala 33:92]
  wire [31:0] _writeDataT_T_3 = phaseCount == 2'h0 ? _writeDataT_T_1 : _writeDataT_T_2; // @[FFTDataProcess.scala 220:26]
  wire [31:0] _writeDataT_T_4 = {writeDataTIPre,writeDataTRPre}; // @[Cat.scala 33:92]
  wire [31:0] writeDataS = sameAddr3c ? _writeDataS_T : _writeDataT_T_2; // @[FFTDataProcess.scala 218:22 219:20 222:20]
  wire [31:0] writeDataT = sameAddr3c ? _writeDataT_T_3 : _writeDataT_T_4; // @[FFTDataProcess.scala 218:22 220:20 223:20]
  wire  _io_writeEnableSram0Bank_0_T = srcBuffer & procState3c; // @[FFTDataProcess.scala 228:53]
  wire  _io_writeEnableSram1Bank_0_T_1 = _srcBufferNext_T_1 & procState3c; // @[FFTDataProcess.scala 230:54]
  wire [3:0] _GEN_178 = 3'h0 == addrSBankSel ? addrS[3:0] : _GEN_22; // @[FFTDataProcess.scala 241:{40,40}]
  wire [3:0] _GEN_179 = 3'h1 == addrSBankSel ? addrS[3:0] : _GEN_23; // @[FFTDataProcess.scala 241:{40,40}]
  wire [3:0] _GEN_180 = 3'h2 == addrSBankSel ? addrS[3:0] : _GEN_24; // @[FFTDataProcess.scala 241:{40,40}]
  wire [3:0] _GEN_181 = 3'h3 == addrSBankSel ? addrS[3:0] : _GEN_25; // @[FFTDataProcess.scala 241:{40,40}]
  wire [3:0] _GEN_182 = 3'h4 == addrSBankSel ? addrS[3:0] : _GEN_26; // @[FFTDataProcess.scala 241:{40,40}]
  wire [3:0] _GEN_183 = 3'h5 == addrSBankSel ? addrS[3:0] : _GEN_27; // @[FFTDataProcess.scala 241:{40,40}]
  wire [3:0] _GEN_184 = 3'h6 == addrSBankSel ? addrS[3:0] : _GEN_28; // @[FFTDataProcess.scala 241:{40,40}]
  wire [3:0] _GEN_185 = 3'h7 == addrSBankSel ? addrS[3:0] : _GEN_29; // @[FFTDataProcess.scala 241:{40,40}]
  wire [3:0] _GEN_186 = 3'h0 == addrTBankSel ? addrT[3:0] : _GEN_178; // @[FFTDataProcess.scala 242:{40,40}]
  wire [3:0] _GEN_187 = 3'h1 == addrTBankSel ? addrT[3:0] : _GEN_179; // @[FFTDataProcess.scala 242:{40,40}]
  wire [3:0] _GEN_188 = 3'h2 == addrTBankSel ? addrT[3:0] : _GEN_180; // @[FFTDataProcess.scala 242:{40,40}]
  wire [3:0] _GEN_189 = 3'h3 == addrTBankSel ? addrT[3:0] : _GEN_181; // @[FFTDataProcess.scala 242:{40,40}]
  wire [3:0] _GEN_190 = 3'h4 == addrTBankSel ? addrT[3:0] : _GEN_182; // @[FFTDataProcess.scala 242:{40,40}]
  wire [3:0] _GEN_191 = 3'h5 == addrTBankSel ? addrT[3:0] : _GEN_183; // @[FFTDataProcess.scala 242:{40,40}]
  wire [3:0] _GEN_192 = 3'h6 == addrTBankSel ? addrT[3:0] : _GEN_184; // @[FFTDataProcess.scala 242:{40,40}]
  wire [3:0] _GEN_193 = 3'h7 == addrTBankSel ? addrT[3:0] : _GEN_185; // @[FFTDataProcess.scala 242:{40,40}]
  wire [3:0] _GEN_194 = 3'h0 == addrSBankSel3c ? addrS3c : _GEN_22; // @[FFTDataProcess.scala 243:{42,42}]
  wire [3:0] _GEN_195 = 3'h1 == addrSBankSel3c ? addrS3c : _GEN_23; // @[FFTDataProcess.scala 243:{42,42}]
  wire [3:0] _GEN_196 = 3'h2 == addrSBankSel3c ? addrS3c : _GEN_24; // @[FFTDataProcess.scala 243:{42,42}]
  wire [3:0] _GEN_197 = 3'h3 == addrSBankSel3c ? addrS3c : _GEN_25; // @[FFTDataProcess.scala 243:{42,42}]
  wire [3:0] _GEN_198 = 3'h4 == addrSBankSel3c ? addrS3c : _GEN_26; // @[FFTDataProcess.scala 243:{42,42}]
  wire [3:0] _GEN_199 = 3'h5 == addrSBankSel3c ? addrS3c : _GEN_27; // @[FFTDataProcess.scala 243:{42,42}]
  wire [3:0] _GEN_200 = 3'h6 == addrSBankSel3c ? addrS3c : _GEN_28; // @[FFTDataProcess.scala 243:{42,42}]
  wire [3:0] _GEN_201 = 3'h7 == addrSBankSel3c ? addrS3c : _GEN_29; // @[FFTDataProcess.scala 243:{42,42}]
  wire [3:0] _GEN_202 = 3'h0 == addrTBankSel3c ? addrT3c : _GEN_194; // @[FFTDataProcess.scala 244:{42,42}]
  wire [3:0] _GEN_203 = 3'h1 == addrTBankSel3c ? addrT3c : _GEN_195; // @[FFTDataProcess.scala 244:{42,42}]
  wire [3:0] _GEN_204 = 3'h2 == addrTBankSel3c ? addrT3c : _GEN_196; // @[FFTDataProcess.scala 244:{42,42}]
  wire [3:0] _GEN_205 = 3'h3 == addrTBankSel3c ? addrT3c : _GEN_197; // @[FFTDataProcess.scala 244:{42,42}]
  wire [3:0] _GEN_206 = 3'h4 == addrTBankSel3c ? addrT3c : _GEN_198; // @[FFTDataProcess.scala 244:{42,42}]
  wire [3:0] _GEN_207 = 3'h5 == addrTBankSel3c ? addrT3c : _GEN_199; // @[FFTDataProcess.scala 244:{42,42}]
  wire [3:0] _GEN_208 = 3'h6 == addrTBankSel3c ? addrT3c : _GEN_200; // @[FFTDataProcess.scala 244:{42,42}]
  wire [3:0] _GEN_209 = 3'h7 == addrTBankSel3c ? addrT3c : _GEN_201; // @[FFTDataProcess.scala 244:{42,42}]
  reg  procDoneReg; // @[FFTDataProcess.scala 258:30]
  FFT3PipelineCalc dataCalc ( // @[FFTDataProcess.scala 200:26]
    .clock(dataCalc_clock),
    .reset(dataCalc_reset),
    .io_dataInSR(dataCalc_io_dataInSR),
    .io_dataInSI(dataCalc_io_dataInSI),
    .io_dataInTR(dataCalc_io_dataInTR),
    .io_dataInTI(dataCalc_io_dataInTI),
    .io_dataOutSR3c(dataCalc_io_dataOutSR3c),
    .io_dataOutSI3c(dataCalc_io_dataOutSI3c),
    .io_dataOutTR3c(dataCalc_io_dataOutTR3c),
    .io_dataOutTI3c(dataCalc_io_dataOutTI3c),
    .io_nk(dataCalc_io_nk),
    .io_rShiftSym(dataCalc_io_rShiftSym),
    .io_isFFT(dataCalc_io_isFFT),
    .io_dataMode(dataCalc_io_dataMode),
    .io_state1c(dataCalc_io_state1c),
    .io_state2c(dataCalc_io_state2c)
  );
  assign io_readEnableSram0Bank_0 = (3'h0 == addrSBankSel | 3'h0 == addrTBankSel) & _io_readEnableSram0Bank_0_T_1; // @[FFTDataProcess.scala 157:64 159:39 164:39]
  assign io_readEnableSram0Bank_1 = (3'h1 == addrSBankSel | 3'h1 == addrTBankSel) & _io_readEnableSram0Bank_0_T_1; // @[FFTDataProcess.scala 157:64 159:39 164:39]
  assign io_readEnableSram0Bank_2 = (3'h2 == addrSBankSel | 3'h2 == addrTBankSel) & _io_readEnableSram0Bank_0_T_1; // @[FFTDataProcess.scala 157:64 159:39 164:39]
  assign io_readEnableSram0Bank_3 = (3'h3 == addrSBankSel | 3'h3 == addrTBankSel) & _io_readEnableSram0Bank_0_T_1; // @[FFTDataProcess.scala 157:64 159:39 164:39]
  assign io_readEnableSram0Bank_4 = (3'h4 == addrSBankSel | 3'h4 == addrTBankSel) & _io_readEnableSram0Bank_0_T_1; // @[FFTDataProcess.scala 157:64 159:39 164:39]
  assign io_readEnableSram0Bank_5 = (3'h5 == addrSBankSel | 3'h5 == addrTBankSel) & _io_readEnableSram0Bank_0_T_1; // @[FFTDataProcess.scala 157:64 159:39 164:39]
  assign io_readEnableSram0Bank_6 = (3'h6 == addrSBankSel | 3'h6 == addrTBankSel) & _io_readEnableSram0Bank_0_T_1; // @[FFTDataProcess.scala 157:64 159:39 164:39]
  assign io_readEnableSram0Bank_7 = (3'h7 == addrSBankSel | 3'h7 == addrTBankSel) & _io_readEnableSram0Bank_0_T_1; // @[FFTDataProcess.scala 157:64 159:39 164:39]
  assign io_readEnableSram1Bank_0 = (3'h0 == addrSBankSel | 3'h0 == addrTBankSel) & _io_readEnableSram1Bank_0_T; // @[FFTDataProcess.scala 157:64 161:39 166:39]
  assign io_readEnableSram1Bank_1 = (3'h1 == addrSBankSel | 3'h1 == addrTBankSel) & _io_readEnableSram1Bank_0_T; // @[FFTDataProcess.scala 157:64 161:39 166:39]
  assign io_readEnableSram1Bank_2 = (3'h2 == addrSBankSel | 3'h2 == addrTBankSel) & _io_readEnableSram1Bank_0_T; // @[FFTDataProcess.scala 157:64 161:39 166:39]
  assign io_readEnableSram1Bank_3 = (3'h3 == addrSBankSel | 3'h3 == addrTBankSel) & _io_readEnableSram1Bank_0_T; // @[FFTDataProcess.scala 157:64 161:39 166:39]
  assign io_readEnableSram1Bank_4 = (3'h4 == addrSBankSel | 3'h4 == addrTBankSel) & _io_readEnableSram1Bank_0_T; // @[FFTDataProcess.scala 157:64 161:39 166:39]
  assign io_readEnableSram1Bank_5 = (3'h5 == addrSBankSel | 3'h5 == addrTBankSel) & _io_readEnableSram1Bank_0_T; // @[FFTDataProcess.scala 157:64 161:39 166:39]
  assign io_readEnableSram1Bank_6 = (3'h6 == addrSBankSel | 3'h6 == addrTBankSel) & _io_readEnableSram1Bank_0_T; // @[FFTDataProcess.scala 157:64 161:39 166:39]
  assign io_readEnableSram1Bank_7 = (3'h7 == addrSBankSel | 3'h7 == addrTBankSel) & _io_readEnableSram1Bank_0_T; // @[FFTDataProcess.scala 157:64 161:39 166:39]
  assign io_writeDataSram0Bank_0 = 3'h0 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 253:{43,43}]
  assign io_writeDataSram0Bank_1 = 3'h1 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 253:{43,43}]
  assign io_writeDataSram0Bank_2 = 3'h2 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 253:{43,43}]
  assign io_writeDataSram0Bank_3 = 3'h3 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 253:{43,43}]
  assign io_writeDataSram0Bank_4 = 3'h4 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 253:{43,43}]
  assign io_writeDataSram0Bank_5 = 3'h5 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 253:{43,43}]
  assign io_writeDataSram0Bank_6 = 3'h6 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 253:{43,43}]
  assign io_writeDataSram0Bank_7 = 3'h7 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 253:{43,43}]
  assign io_writeDataSram1Bank_0 = 3'h0 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 255:{43,43}]
  assign io_writeDataSram1Bank_1 = 3'h1 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 255:{43,43}]
  assign io_writeDataSram1Bank_2 = 3'h2 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 255:{43,43}]
  assign io_writeDataSram1Bank_3 = 3'h3 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 255:{43,43}]
  assign io_writeDataSram1Bank_4 = 3'h4 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 255:{43,43}]
  assign io_writeDataSram1Bank_5 = 3'h5 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 255:{43,43}]
  assign io_writeDataSram1Bank_6 = 3'h6 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 255:{43,43}]
  assign io_writeDataSram1Bank_7 = 3'h7 == addrSBankSel3c ? writeDataS : writeDataT; // @[FFTDataProcess.scala 255:{43,43}]
  assign io_writeEnableSram0Bank_0 = (3'h0 == addrSBankSel3c | 3'h0 == addrTBankSel3c) & _io_writeEnableSram0Bank_0_T; // @[FFTDataProcess.scala 227:68 229:40 234:40]
  assign io_writeEnableSram0Bank_1 = (3'h1 == addrSBankSel3c | 3'h1 == addrTBankSel3c) & _io_writeEnableSram0Bank_0_T; // @[FFTDataProcess.scala 227:68 229:40 234:40]
  assign io_writeEnableSram0Bank_2 = (3'h2 == addrSBankSel3c | 3'h2 == addrTBankSel3c) & _io_writeEnableSram0Bank_0_T; // @[FFTDataProcess.scala 227:68 229:40 234:40]
  assign io_writeEnableSram0Bank_3 = (3'h3 == addrSBankSel3c | 3'h3 == addrTBankSel3c) & _io_writeEnableSram0Bank_0_T; // @[FFTDataProcess.scala 227:68 229:40 234:40]
  assign io_writeEnableSram0Bank_4 = (3'h4 == addrSBankSel3c | 3'h4 == addrTBankSel3c) & _io_writeEnableSram0Bank_0_T; // @[FFTDataProcess.scala 227:68 229:40 234:40]
  assign io_writeEnableSram0Bank_5 = (3'h5 == addrSBankSel3c | 3'h5 == addrTBankSel3c) & _io_writeEnableSram0Bank_0_T; // @[FFTDataProcess.scala 227:68 229:40 234:40]
  assign io_writeEnableSram0Bank_6 = (3'h6 == addrSBankSel3c | 3'h6 == addrTBankSel3c) & _io_writeEnableSram0Bank_0_T; // @[FFTDataProcess.scala 227:68 229:40 234:40]
  assign io_writeEnableSram0Bank_7 = (3'h7 == addrSBankSel3c | 3'h7 == addrTBankSel3c) & _io_writeEnableSram0Bank_0_T; // @[FFTDataProcess.scala 227:68 229:40 234:40]
  assign io_writeEnableSram1Bank_0 = (3'h0 == addrSBankSel3c | 3'h0 == addrTBankSel3c) & _io_writeEnableSram1Bank_0_T_1; // @[FFTDataProcess.scala 227:68 231:40 236:40]
  assign io_writeEnableSram1Bank_1 = (3'h1 == addrSBankSel3c | 3'h1 == addrTBankSel3c) & _io_writeEnableSram1Bank_0_T_1; // @[FFTDataProcess.scala 227:68 231:40 236:40]
  assign io_writeEnableSram1Bank_2 = (3'h2 == addrSBankSel3c | 3'h2 == addrTBankSel3c) & _io_writeEnableSram1Bank_0_T_1; // @[FFTDataProcess.scala 227:68 231:40 236:40]
  assign io_writeEnableSram1Bank_3 = (3'h3 == addrSBankSel3c | 3'h3 == addrTBankSel3c) & _io_writeEnableSram1Bank_0_T_1; // @[FFTDataProcess.scala 227:68 231:40 236:40]
  assign io_writeEnableSram1Bank_4 = (3'h4 == addrSBankSel3c | 3'h4 == addrTBankSel3c) & _io_writeEnableSram1Bank_0_T_1; // @[FFTDataProcess.scala 227:68 231:40 236:40]
  assign io_writeEnableSram1Bank_5 = (3'h5 == addrSBankSel3c | 3'h5 == addrTBankSel3c) & _io_writeEnableSram1Bank_0_T_1; // @[FFTDataProcess.scala 227:68 231:40 236:40]
  assign io_writeEnableSram1Bank_6 = (3'h6 == addrSBankSel3c | 3'h6 == addrTBankSel3c) & _io_writeEnableSram1Bank_0_T_1; // @[FFTDataProcess.scala 227:68 231:40 236:40]
  assign io_writeEnableSram1Bank_7 = (3'h7 == addrSBankSel3c | 3'h7 == addrTBankSel3c) & _io_writeEnableSram1Bank_0_T_1; // @[FFTDataProcess.scala 227:68 231:40 236:40]
  assign io_addrSram0Bank_0 = _srcBufferNext_T_1 ? _GEN_186 : _GEN_202; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram0Bank_1 = _srcBufferNext_T_1 ? _GEN_187 : _GEN_203; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram0Bank_2 = _srcBufferNext_T_1 ? _GEN_188 : _GEN_204; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram0Bank_3 = _srcBufferNext_T_1 ? _GEN_189 : _GEN_205; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram0Bank_4 = _srcBufferNext_T_1 ? _GEN_190 : _GEN_206; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram0Bank_5 = _srcBufferNext_T_1 ? _GEN_191 : _GEN_207; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram0Bank_6 = _srcBufferNext_T_1 ? _GEN_192 : _GEN_208; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram0Bank_7 = _srcBufferNext_T_1 ? _GEN_193 : _GEN_209; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram1Bank_0 = _srcBufferNext_T_1 ? _GEN_202 : _GEN_186; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram1Bank_1 = _srcBufferNext_T_1 ? _GEN_203 : _GEN_187; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram1Bank_2 = _srcBufferNext_T_1 ? _GEN_204 : _GEN_188; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram1Bank_3 = _srcBufferNext_T_1 ? _GEN_205 : _GEN_189; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram1Bank_4 = _srcBufferNext_T_1 ? _GEN_206 : _GEN_190; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram1Bank_5 = _srcBufferNext_T_1 ? _GEN_207 : _GEN_191; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram1Bank_6 = _srcBufferNext_T_1 ? _GEN_208 : _GEN_192; // @[FFTDataProcess.scala 240:29]
  assign io_addrSram1Bank_7 = _srcBufferNext_T_1 ? _GEN_209 : _GEN_193; // @[FFTDataProcess.scala 240:29]
  assign io_procDone = procDoneReg; // @[FFTDataProcess.scala 259:17]
  assign dataCalc_clock = clock;
  assign dataCalc_reset = reset;
  assign dataCalc_io_dataInSR = srcBuffer ? _GEN_103[15:0] : _GEN_111[15:0]; // @[FFTDataProcess.scala 194:23]
  assign dataCalc_io_dataInSI = sameAddr1c & _T_6 ? 16'h0 : dataInSI; // @[FFTDataProcess.scala 202:32]
  assign dataCalc_io_dataInTR = _dataCalc_io_dataInSI_T_1 ? dataInTI : dataInTR; // @[FFTDataProcess.scala 203:32]
  assign dataCalc_io_dataInTI = _dataCalc_io_dataInSI_T_1 ? 16'h0 : dataInTI; // @[FFTDataProcess.scala 204:32]
  assign dataCalc_io_nk = radixCount; // @[FFTDataProcess.scala 205:33]
  assign dataCalc_io_rShiftSym = phaseCount[0]; // @[FFTDataProcess.scala 206:40]
  assign dataCalc_io_isFFT = ~io_fftMode; // @[FFTDataProcess.scala 36:17]
  assign dataCalc_io_dataMode = ~phaseCount[0]; // @[FFTDataProcess.scala 208:29]
  assign dataCalc_io_state1c = procState1c; // @[FFTDataProcess.scala 209:25]
  assign dataCalc_io_state2c = procState2c; // @[FFTDataProcess.scala 210:25]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDataProcess.scala 38:27]
      stateReg <= 3'h0; // @[FFTDataProcess.scala 38:27]
    end else if (3'h0 == stateReg) begin // @[FFTDataProcess.scala 44:22]
      if (io_procKick) begin // @[FFTDataProcess.scala 46:31]
        stateReg <= 3'h1; // @[FFTDataProcess.scala 47:26]
      end
    end else if (3'h1 == stateReg) begin // @[FFTDataProcess.scala 44:22]
      if (radixCount == 7'h3f) begin // @[FFTDataProcess.scala 53:47]
        stateReg <= 3'h2; // @[FFTDataProcess.scala 54:26]
      end
    end else if (3'h2 == stateReg) begin // @[FFTDataProcess.scala 44:22]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_5;
    end
    if (reset) begin // @[FFTDataProcess.scala 40:29]
      radixCount <= 7'h0; // @[FFTDataProcess.scala 40:29]
    end else if (radixInit) begin // @[FFTDataProcess.scala 86:21]
      radixCount <= 7'h0; // @[FFTDataProcess.scala 87:20]
    end else if (radixUp) begin // @[FFTDataProcess.scala 88:26]
      radixCount <= _radixCount_T_1; // @[FFTDataProcess.scala 89:20]
    end
    if (reset) begin // @[FFTDataProcess.scala 42:29]
      phaseCount <= 2'h0; // @[FFTDataProcess.scala 42:29]
    end else if (phaseInit) begin // @[FFTDataProcess.scala 100:21]
      phaseCount <= 2'h0; // @[FFTDataProcess.scala 101:20]
    end else if (_radixInit_T_9) begin // @[FFTDataProcess.scala 102:26]
      phaseCount <= _phaseCount_T_1; // @[FFTDataProcess.scala 103:20]
    end
    if (reset) begin // @[FFTDataProcess.scala 108:28]
      srcBuffer <= 1'h0; // @[FFTDataProcess.scala 108:28]
    end else if (srcUp) begin // @[FFTDataProcess.scala 114:17]
      srcBuffer <= srcBufferNext; // @[FFTDataProcess.scala 115:19]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSel1c <= addrSBankSel;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel2c <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSel2c <= addrSBankSel1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel3c <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      addrSBankSel3c <= addrSBankSel2c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel1c <= addrTBankSel;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel2c <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel2c <= addrTBankSel1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel3c <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel3c <= addrTBankSel2c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      procState1c <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      procState1c <= _radixInit_T_1;
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
      addrS1c <= 4'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c <= addrS[3:0];
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
      addrT1c <= addrT[3:0];
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
    if (reset) begin // @[FFTDataProcess.scala 258:30]
      procDoneReg <= 1'h0; // @[FFTDataProcess.scala 258:30]
    end else begin
      procDoneReg <= _radixInit_T_11; // @[FFTDataProcess.scala 258:30]
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
  radixCount = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  srcBuffer = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrSBankSel1c = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  addrSBankSel2c = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  addrSBankSel3c = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  addrTBankSel1c = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  addrTBankSel2c = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  addrTBankSel3c = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  procState1c = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  procState2c = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  procState3c = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  addrS1c = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  addrS2c = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  addrS3c = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  addrT1c = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  addrT2c = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  addrT3c = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  sameAddr1c = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  sameAddr2c = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  sameAddr3c = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  procDoneReg = _RAND_22[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
