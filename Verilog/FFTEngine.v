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
      qR3c <= qR2cKernel; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      qI3c <= 17'h0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      qI3c <= qI2cKernel; // @[Reg.scala 36:22]
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
  input         io_fftRShiftP0_6,
  input         io_fftRShiftP1_0,
  input         io_fftRShiftP1_1
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
`endif // RANDOMIZE_REG_INIT
  wire  fftCalc_clock; // @[FFTEngine.scala 302:29]
  wire  fftCalc_reset; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_io_dataInSR; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_io_dataInSI; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_io_dataInTR; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_io_dataInTI; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_io_dataOutSR3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_io_dataOutSI3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_io_dataOutTR3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_io_dataOutTI3c; // @[FFTEngine.scala 302:29]
  wire [6:0] fftCalc_io_nk; // @[FFTEngine.scala 302:29]
  wire  fftCalc_io_rShiftSym; // @[FFTEngine.scala 302:29]
  wire  fftCalc_io_isFFT; // @[FFTEngine.scala 302:29]
  wire  fftCalc_io_state1c; // @[FFTEngine.scala 302:29]
  wire  fftCalc_io_state2c; // @[FFTEngine.scala 302:29]
  wire  fftCalc_1_clock; // @[FFTEngine.scala 302:29]
  wire  fftCalc_1_reset; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_1_io_dataInSR; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_1_io_dataInSI; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_1_io_dataInTR; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_1_io_dataInTI; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_1_io_dataOutSR3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_1_io_dataOutSI3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_1_io_dataOutTR3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_1_io_dataOutTI3c; // @[FFTEngine.scala 302:29]
  wire [6:0] fftCalc_1_io_nk; // @[FFTEngine.scala 302:29]
  wire  fftCalc_1_io_rShiftSym; // @[FFTEngine.scala 302:29]
  wire  fftCalc_1_io_isFFT; // @[FFTEngine.scala 302:29]
  wire  fftCalc_1_io_state1c; // @[FFTEngine.scala 302:29]
  wire  fftCalc_1_io_state2c; // @[FFTEngine.scala 302:29]
  wire  fftCalc_2_clock; // @[FFTEngine.scala 302:29]
  wire  fftCalc_2_reset; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_2_io_dataInSR; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_2_io_dataInSI; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_2_io_dataInTR; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_2_io_dataInTI; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_2_io_dataOutSR3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_2_io_dataOutSI3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_2_io_dataOutTR3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_2_io_dataOutTI3c; // @[FFTEngine.scala 302:29]
  wire [6:0] fftCalc_2_io_nk; // @[FFTEngine.scala 302:29]
  wire  fftCalc_2_io_rShiftSym; // @[FFTEngine.scala 302:29]
  wire  fftCalc_2_io_isFFT; // @[FFTEngine.scala 302:29]
  wire  fftCalc_2_io_state1c; // @[FFTEngine.scala 302:29]
  wire  fftCalc_2_io_state2c; // @[FFTEngine.scala 302:29]
  wire  fftCalc_3_clock; // @[FFTEngine.scala 302:29]
  wire  fftCalc_3_reset; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_3_io_dataInSR; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_3_io_dataInSI; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_3_io_dataInTR; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_3_io_dataInTI; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_3_io_dataOutSR3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_3_io_dataOutSI3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_3_io_dataOutTR3c; // @[FFTEngine.scala 302:29]
  wire [15:0] fftCalc_3_io_dataOutTI3c; // @[FFTEngine.scala 302:29]
  wire [6:0] fftCalc_3_io_nk; // @[FFTEngine.scala 302:29]
  wire  fftCalc_3_io_rShiftSym; // @[FFTEngine.scala 302:29]
  wire  fftCalc_3_io_isFFT; // @[FFTEngine.scala 302:29]
  wire  fftCalc_3_io_state1c; // @[FFTEngine.scala 302:29]
  wire  fftCalc_3_io_state2c; // @[FFTEngine.scala 302:29]
  reg [2:0] stateReg; // @[FFTEngine.scala 42:27]
  reg [4:0] radixCount; // @[FFTEngine.scala 44:29]
  reg [2:0] phaseCount; // @[FFTEngine.scala 46:29]
  wire  _T_2 = radixCount == 5'hf; // @[FFTEngine.scala 57:29]
  wire  _T_4 = radixCount == 5'h3; // @[FFTEngine.scala 64:29]
  wire [2:0] _GEN_2 = radixCount == 5'h3 ? 3'h3 : stateReg; // @[FFTEngine.scala 64:45 65:26 67:26]
  wire  _T_6 = phaseCount == 3'h6; // @[FFTEngine.scala 71:29]
  wire [2:0] _GEN_3 = phaseCount == 3'h6 ? 3'h4 : 3'h1; // @[FFTEngine.scala 71:46 72:26 74:26]
  wire [2:0] _GEN_4 = 3'h4 == stateReg ? 3'h0 : stateReg; // @[FFTEngine.scala 48:22 78:22 42:27]
  wire [2:0] _GEN_5 = 3'h3 == stateReg ? _GEN_3 : _GEN_4; // @[FFTEngine.scala 48:22]
  wire  _radixInit_T = stateReg == 3'h0; // @[FFTEngine.scala 82:31]
  wire  _radixInit_T_1 = stateReg == 3'h1; // @[FFTEngine.scala 83:16]
  wire  _radixInit_T_3 = stateReg == 3'h1 & _T_2; // @[FFTEngine.scala 83:30]
  wire  _radixInit_T_4 = stateReg == 3'h0 | _radixInit_T_3; // @[FFTEngine.scala 82:45]
  wire  _radixInit_T_5 = stateReg == 3'h2; // @[FFTEngine.scala 84:16]
  wire  _radixInit_T_7 = stateReg == 3'h2 & _T_4; // @[FFTEngine.scala 84:31]
  wire  _radixInit_T_8 = _radixInit_T_4 | _radixInit_T_7; // @[FFTEngine.scala 83:63]
  wire  _radixInit_T_9 = stateReg == 3'h3; // @[FFTEngine.scala 85:15]
  wire  _radixInit_T_10 = _radixInit_T_8 | _radixInit_T_9; // @[FFTEngine.scala 84:63]
  wire  _radixInit_T_11 = stateReg == 3'h4; // @[FFTEngine.scala 86:15]
  wire  radixInit = _radixInit_T_10 | _radixInit_T_11; // @[FFTEngine.scala 85:32]
  wire  radixUp = _radixInit_T_1 | _radixInit_T_5; // @[FFTEngine.scala 88:43]
  wire [4:0] _radixCount_T_1 = radixCount + 5'h1; // @[FFTEngine.scala 93:34]
  wire  _phaseInit_T_3 = _radixInit_T_9 & _T_6; // @[FFTEngine.scala 99:33]
  wire  _phaseInit_T_4 = _radixInit_T | _phaseInit_T_3; // @[FFTEngine.scala 98:45]
  wire  phaseInit = _phaseInit_T_4 | _radixInit_T_11; // @[FFTEngine.scala 99:65]
  wire [2:0] _phaseCount_T_1 = phaseCount + 3'h1; // @[FFTEngine.scala 107:34]
  reg  srcBuffer; // @[FFTEngine.scala 112:28]
  wire  _srcBufferNext_T_1 = ~srcBuffer; // @[FFTEngine.scala 114:54]
  wire  srcBufferNext = _radixInit_T_9 & ~srcBuffer; // @[FFTEngine.scala 114:52]
  wire  srcUp = _radixInit_T | _radixInit_T_9; // @[FFTEngine.scala 116:41]
  wire [3:0] radixCountTemp = radixCount[3:0]; // @[FFTEngine.scala 128:36]
  wire [4:0] _nk_0_T_1 = {1'h0,radixCountTemp}; // @[Cat.scala 33:92]
  wire [4:0] _nk_1_T_1 = {1'h1,radixCountTemp}; // @[Cat.scala 33:92]
  wire [5:0] _nk_2_T_1 = {2'h2,radixCountTemp}; // @[Cat.scala 33:92]
  wire [5:0] _nk_3_T_1 = {2'h3,radixCountTemp}; // @[Cat.scala 33:92]
  wire  _T_9 = phaseCount == 3'h5; // @[FFTEngine.scala 155:32]
  wire [4:0] _nk_0_T_3 = {1'h0,radixCount[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _nk_1_T_3 = {1'h1,radixCount[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [5:0] _nk_2_T_3 = {2'h2,radixCount[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [5:0] _nk_3_T_3 = {2'h3,radixCount[3:1],1'h0}; // @[Cat.scala 33:92]
  wire [5:0] _nk_0_T_5 = {radixCountTemp,2'h0}; // @[Cat.scala 33:92]
  wire [6:0] _nk_0_T_8 = 7'h3f >> phaseCount; // @[FFTEngine.scala 167:164]
  wire [6:0] _nk_0_T_9 = ~_nk_0_T_8; // @[FFTEngine.scala 167:102]
  wire [6:0] _GEN_806 = {{1'd0}, _nk_0_T_5}; // @[FFTEngine.scala 167:100]
  wire [6:0] _nk_0_T_10 = _GEN_806 & _nk_0_T_9; // @[FFTEngine.scala 167:100]
  wire [5:0] _nk_1_T_5 = {radixCountTemp,2'h1}; // @[Cat.scala 33:92]
  wire [6:0] _GEN_807 = {{1'd0}, _nk_1_T_5}; // @[FFTEngine.scala 167:100]
  wire [6:0] _nk_1_T_10 = _GEN_807 & _nk_0_T_9; // @[FFTEngine.scala 167:100]
  wire [5:0] _nk_2_T_5 = {radixCountTemp,2'h2}; // @[Cat.scala 33:92]
  wire [6:0] _GEN_808 = {{1'd0}, _nk_2_T_5}; // @[FFTEngine.scala 167:100]
  wire [6:0] _nk_2_T_10 = _GEN_808 & _nk_0_T_9; // @[FFTEngine.scala 167:100]
  wire [5:0] _nk_3_T_5 = {radixCountTemp,2'h3}; // @[Cat.scala 33:92]
  wire [6:0] _GEN_809 = {{1'd0}, _nk_3_T_5}; // @[FFTEngine.scala 167:100]
  wire [6:0] _nk_3_T_10 = _GEN_809 & _nk_0_T_9; // @[FFTEngine.scala 167:100]
  wire [6:0] _GEN_14 = phaseCount == 3'h5 ? {{2'd0}, _nk_0_T_3} : _nk_0_T_10; // @[FFTEngine.scala 155:51 160:27 167:23]
  wire [6:0] _GEN_15 = phaseCount == 3'h5 ? {{2'd0}, _nk_1_T_3} : _nk_1_T_10; // @[FFTEngine.scala 155:51 160:27 167:23]
  wire [6:0] _GEN_16 = phaseCount == 3'h5 ? {{1'd0}, _nk_2_T_3} : _nk_2_T_10; // @[FFTEngine.scala 155:51 160:27 167:23]
  wire [6:0] _GEN_17 = phaseCount == 3'h5 ? {{1'd0}, _nk_3_T_3} : _nk_3_T_10; // @[FFTEngine.scala 155:51 160:27 167:23]
  wire [6:0] _addrSPre_0_T = {3'h0,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _addrTPre_0_T = {3'h4,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _addrSPre_1_T = {3'h1,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _addrTPre_1_T = {3'h5,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _addrSPre_2_T = {3'h2,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _addrTPre_2_T = {3'h6,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _addrSPre_3_T = {3'h3,radixCountTemp}; // @[Cat.scala 33:92]
  wire [6:0] _addrTPre_3_T = {3'h7,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] _addrSPre_0_dataTemp_T = {3'h0,radixCountTemp,3'h0,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrSPre_0_dataTemp = {{1'd0}, _addrSPre_0_dataTemp_T[13:1]}; // @[FFTEngine.scala 178:40]
  wire [13:0] _addrTPre_0_dataTemp_T = {3'h4,radixCountTemp,3'h4,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrTPre_0_dataTemp = {{1'd0}, _addrTPre_0_dataTemp_T[13:1]}; // @[FFTEngine.scala 178:40]
  wire [13:0] _addrSPre_1_dataTemp_T = {3'h1,radixCountTemp,3'h1,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrSPre_1_dataTemp = {{1'd0}, _addrSPre_1_dataTemp_T[13:1]}; // @[FFTEngine.scala 178:40]
  wire [13:0] _addrTPre_1_dataTemp_T = {3'h5,radixCountTemp,3'h5,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrTPre_1_dataTemp = {{1'd0}, _addrTPre_1_dataTemp_T[13:1]}; // @[FFTEngine.scala 178:40]
  wire [13:0] _addrSPre_2_dataTemp_T = {3'h2,radixCountTemp,3'h2,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrSPre_2_dataTemp = {{1'd0}, _addrSPre_2_dataTemp_T[13:1]}; // @[FFTEngine.scala 178:40]
  wire [13:0] _addrTPre_2_dataTemp_T = {3'h6,radixCountTemp,3'h6,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrTPre_2_dataTemp = {{1'd0}, _addrTPre_2_dataTemp_T[13:1]}; // @[FFTEngine.scala 178:40]
  wire [13:0] _addrSPre_3_dataTemp_T = {3'h3,radixCountTemp,3'h3,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrSPre_3_dataTemp = {{1'd0}, _addrSPre_3_dataTemp_T[13:1]}; // @[FFTEngine.scala 178:40]
  wire [13:0] _addrTPre_3_dataTemp_T = {3'h7,radixCountTemp,3'h7,radixCountTemp}; // @[Cat.scala 33:92]
  wire [13:0] addrTPre_3_dataTemp = {{1'd0}, _addrTPre_3_dataTemp_T[13:1]}; // @[FFTEngine.scala 178:40]
  wire [13:0] _addrSPre_0_dataTemp_T_1 = {radixCountTemp,2'h0,1'h0,radixCountTemp,2'h0,1'h0}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_18 = {{7'd0}, _addrSPre_0_dataTemp_T_1}; // @[FFTEngine.scala 173:40]
  wire [20:0] addrSPre_0_dataTemp_1 = _GEN_18 << phaseCount; // @[FFTEngine.scala 173:40]
  wire [13:0] _addrTPre_0_dataTemp_T_1 = {radixCountTemp,2'h0,1'h1,radixCountTemp,2'h0,1'h1}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_19 = {{7'd0}, _addrTPre_0_dataTemp_T_1}; // @[FFTEngine.scala 173:40]
  wire [20:0] addrTPre_0_dataTemp_1 = _GEN_19 << phaseCount; // @[FFTEngine.scala 173:40]
  wire [13:0] _addrSPre_1_dataTemp_T_1 = {radixCountTemp,2'h1,1'h0,radixCountTemp,2'h1,1'h0}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_20 = {{7'd0}, _addrSPre_1_dataTemp_T_1}; // @[FFTEngine.scala 173:40]
  wire [20:0] addrSPre_1_dataTemp_1 = _GEN_20 << phaseCount; // @[FFTEngine.scala 173:40]
  wire [13:0] _addrTPre_1_dataTemp_T_1 = {radixCountTemp,2'h1,1'h1,radixCountTemp,2'h1,1'h1}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_21 = {{7'd0}, _addrTPre_1_dataTemp_T_1}; // @[FFTEngine.scala 173:40]
  wire [20:0] addrTPre_1_dataTemp_1 = _GEN_21 << phaseCount; // @[FFTEngine.scala 173:40]
  wire [13:0] _addrSPre_2_dataTemp_T_1 = {radixCountTemp,2'h2,1'h0,radixCountTemp,2'h2,1'h0}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_30 = {{7'd0}, _addrSPre_2_dataTemp_T_1}; // @[FFTEngine.scala 173:40]
  wire [20:0] addrSPre_2_dataTemp_1 = _GEN_30 << phaseCount; // @[FFTEngine.scala 173:40]
  wire [13:0] _addrTPre_2_dataTemp_T_1 = {radixCountTemp,2'h2,1'h1,radixCountTemp,2'h2,1'h1}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_31 = {{7'd0}, _addrTPre_2_dataTemp_T_1}; // @[FFTEngine.scala 173:40]
  wire [20:0] addrTPre_2_dataTemp_1 = _GEN_31 << phaseCount; // @[FFTEngine.scala 173:40]
  wire [13:0] _addrSPre_3_dataTemp_T_1 = {radixCountTemp,2'h3,1'h0,radixCountTemp,2'h3,1'h0}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_32 = {{7'd0}, _addrSPre_3_dataTemp_T_1}; // @[FFTEngine.scala 173:40]
  wire [20:0] addrSPre_3_dataTemp_1 = _GEN_32 << phaseCount; // @[FFTEngine.scala 173:40]
  wire [13:0] _addrTPre_3_dataTemp_T_1 = {radixCountTemp,2'h3,1'h1,radixCountTemp,2'h3,1'h1}; // @[Cat.scala 33:92]
  wire [20:0] _GEN_33 = {{7'd0}, _addrTPre_3_dataTemp_T_1}; // @[FFTEngine.scala 173:40]
  wire [20:0] addrTPre_3_dataTemp_1 = _GEN_33 << phaseCount; // @[FFTEngine.scala 173:40]
  wire [6:0] _GEN_22 = _T_9 ? addrSPre_0_dataTemp[6:0] : addrSPre_0_dataTemp_1[13:7]; // @[FFTEngine.scala 206:51 208:29 213:29]
  wire [6:0] _GEN_23 = _T_9 ? addrTPre_0_dataTemp[6:0] : addrTPre_0_dataTemp_1[13:7]; // @[FFTEngine.scala 206:51 209:29 214:29]
  wire [6:0] _GEN_24 = _T_9 ? addrSPre_1_dataTemp[6:0] : addrSPre_1_dataTemp_1[13:7]; // @[FFTEngine.scala 206:51 208:29 213:29]
  wire [6:0] _GEN_25 = _T_9 ? addrTPre_1_dataTemp[6:0] : addrTPre_1_dataTemp_1[13:7]; // @[FFTEngine.scala 206:51 209:29 214:29]
  wire [6:0] _GEN_26 = _T_9 ? addrSPre_2_dataTemp[6:0] : addrSPre_2_dataTemp_1[13:7]; // @[FFTEngine.scala 206:51 208:29 213:29]
  wire [6:0] _GEN_27 = _T_9 ? addrTPre_2_dataTemp[6:0] : addrTPre_2_dataTemp_1[13:7]; // @[FFTEngine.scala 206:51 209:29 214:29]
  wire [6:0] _GEN_28 = _T_9 ? addrSPre_3_dataTemp[6:0] : addrSPre_3_dataTemp_1[13:7]; // @[FFTEngine.scala 206:51 208:29 213:29]
  wire [6:0] _GEN_29 = _T_9 ? addrTPre_3_dataTemp[6:0] : addrTPre_3_dataTemp_1[13:7]; // @[FFTEngine.scala 206:51 209:29 214:29]
  wire [6:0] addrSPre_0 = _T_6 ? _addrSPre_0_T : _GEN_22; // @[FFTEngine.scala 201:42 203:29]
  wire [6:0] addrTPre_0 = _T_6 ? _addrTPre_0_T : _GEN_23; // @[FFTEngine.scala 201:42 204:29]
  wire [6:0] addrSPre_1 = _T_6 ? _addrSPre_1_T : _GEN_24; // @[FFTEngine.scala 201:42 203:29]
  wire [6:0] addrTPre_1 = _T_6 ? _addrTPre_1_T : _GEN_25; // @[FFTEngine.scala 201:42 204:29]
  wire [6:0] addrSPre_2 = _T_6 ? _addrSPre_2_T : _GEN_26; // @[FFTEngine.scala 201:42 203:29]
  wire [6:0] addrTPre_2 = _T_6 ? _addrTPre_2_T : _GEN_27; // @[FFTEngine.scala 201:42 204:29]
  wire [6:0] addrSPre_3 = _T_6 ? _addrSPre_3_T : _GEN_28; // @[FFTEngine.scala 201:42 203:29]
  wire [6:0] addrTPre_3 = _T_6 ? _addrTPre_3_T : _GEN_29; // @[FFTEngine.scala 201:42 204:29]
  wire  addrS_temp_0 = addrSPre_0[6]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_1 = addrSPre_0[5]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_2 = addrSPre_0[4]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_3 = addrSPre_0[3]; // @[FFTEngine.scala 132:34]
  wire [6:0] addrS_0 = {addrSPre_0[0],addrSPre_0[1],addrSPre_0[2],addrS_temp_3,addrS_temp_2,addrS_temp_1,addrS_temp_0}; // @[FFTEngine.scala 219:125]
  wire  addrS_temp_0_1 = addrSPre_1[6]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_1_1 = addrSPre_1[5]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_2_1 = addrSPre_1[4]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_3_1 = addrSPre_1[3]; // @[FFTEngine.scala 132:34]
  wire [6:0] addrS_1 = {addrSPre_1[0],addrSPre_1[1],addrSPre_1[2],addrS_temp_3_1,addrS_temp_2_1,addrS_temp_1_1,
    addrS_temp_0_1}; // @[FFTEngine.scala 219:125]
  wire  addrS_temp_0_2 = addrSPre_2[6]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_1_2 = addrSPre_2[5]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_2_2 = addrSPre_2[4]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_3_2 = addrSPre_2[3]; // @[FFTEngine.scala 132:34]
  wire [6:0] addrS_2 = {addrSPre_2[0],addrSPre_2[1],addrSPre_2[2],addrS_temp_3_2,addrS_temp_2_2,addrS_temp_1_2,
    addrS_temp_0_2}; // @[FFTEngine.scala 219:125]
  wire  addrS_temp_0_3 = addrSPre_3[6]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_1_3 = addrSPre_3[5]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_2_3 = addrSPre_3[4]; // @[FFTEngine.scala 132:34]
  wire  addrS_temp_3_3 = addrSPre_3[3]; // @[FFTEngine.scala 132:34]
  wire [6:0] addrS_3 = {addrSPre_3[0],addrSPre_3[1],addrSPre_3[2],addrS_temp_3_3,addrS_temp_2_3,addrS_temp_1_3,
    addrS_temp_0_3}; // @[FFTEngine.scala 219:125]
  wire  addrT_temp_0 = addrTPre_0[6]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_1 = addrTPre_0[5]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_2 = addrTPre_0[4]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_3 = addrTPre_0[3]; // @[FFTEngine.scala 132:34]
  wire [6:0] addrT_0 = {addrTPre_0[0],addrTPre_0[1],addrTPre_0[2],addrT_temp_3,addrT_temp_2,addrT_temp_1,addrT_temp_0}; // @[FFTEngine.scala 220:125]
  wire  addrT_temp_0_1 = addrTPre_1[6]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_1_1 = addrTPre_1[5]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_2_1 = addrTPre_1[4]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_3_1 = addrTPre_1[3]; // @[FFTEngine.scala 132:34]
  wire [6:0] addrT_1 = {addrTPre_1[0],addrTPre_1[1],addrTPre_1[2],addrT_temp_3_1,addrT_temp_2_1,addrT_temp_1_1,
    addrT_temp_0_1}; // @[FFTEngine.scala 220:125]
  wire  addrT_temp_0_2 = addrTPre_2[6]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_1_2 = addrTPre_2[5]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_2_2 = addrTPre_2[4]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_3_2 = addrTPre_2[3]; // @[FFTEngine.scala 132:34]
  wire [6:0] addrT_2 = {addrTPre_2[0],addrTPre_2[1],addrTPre_2[2],addrT_temp_3_2,addrT_temp_2_2,addrT_temp_1_2,
    addrT_temp_0_2}; // @[FFTEngine.scala 220:125]
  wire  addrT_temp_0_3 = addrTPre_3[6]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_1_3 = addrTPre_3[5]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_2_3 = addrTPre_3[4]; // @[FFTEngine.scala 132:34]
  wire  addrT_temp_3_3 = addrTPre_3[3]; // @[FFTEngine.scala 132:34]
  wire [6:0] addrT_3 = {addrTPre_3[0],addrTPre_3[1],addrTPre_3[2],addrT_temp_3_3,addrT_temp_2_3,addrT_temp_1_3,
    addrT_temp_0_3}; // @[FFTEngine.scala 220:125]
  wire [6:0] _addrSBankSelPrePre_sum_T = {{2'd0}, addrS_0[6:2]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_819 = {{2'd0}, _addrSBankSelPrePre_sum_T[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_2 = {{1'd0}, _GEN_819}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_4 = {{5'd0}, addrS_0[6:5]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_821 = {{2'd0}, _addrSBankSelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_0_0 = _addrSBankSelPrePre_sum_T_2[2:0] + _GEN_821; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_7 = {{1'd0}, addrS_0[6:1]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_823 = {{2'd0}, _addrSBankSelPrePre_sum_T_7[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_9 = {{1'd0}, _GEN_823}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_11 = {{4'd0}, addrS_0[6:4]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_825 = {{2'd0}, _addrSBankSelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_0_1 = _addrSBankSelPrePre_sum_T_9[2:0] + _GEN_825; // @[FFTEngine.scala 223:107]
  wire [2:0] _GEN_826 = {{2'd0}, addrS_0[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_16 = {{1'd0}, _GEN_826}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_18 = {{3'd0}, addrS_0[6:3]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_828 = {{2'd0}, _addrSBankSelPrePre_sum_T_18[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] _addrSBankSelPrePre_sum_T_21 = _addrSBankSelPrePre_sum_T_16[2:0] + _GEN_828; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_22 = {{6'd0}, addrS_0[6]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_830 = {{2'd0}, _addrSBankSelPrePre_sum_T_22[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_0_2 = _addrSBankSelPrePre_sum_T_21 + _GEN_830; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_25 = {{2'd0}, addrS_1[6:2]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_832 = {{2'd0}, _addrSBankSelPrePre_sum_T_25[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_27 = {{1'd0}, _GEN_832}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_29 = {{5'd0}, addrS_1[6:5]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_834 = {{2'd0}, _addrSBankSelPrePre_sum_T_29[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_1_0 = _addrSBankSelPrePre_sum_T_27[2:0] + _GEN_834; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_32 = {{1'd0}, addrS_1[6:1]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_836 = {{2'd0}, _addrSBankSelPrePre_sum_T_32[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_34 = {{1'd0}, _GEN_836}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_36 = {{4'd0}, addrS_1[6:4]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_838 = {{2'd0}, _addrSBankSelPrePre_sum_T_36[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_1_1 = _addrSBankSelPrePre_sum_T_34[2:0] + _GEN_838; // @[FFTEngine.scala 223:107]
  wire [2:0] _GEN_839 = {{2'd0}, addrS_1[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_41 = {{1'd0}, _GEN_839}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_43 = {{3'd0}, addrS_1[6:3]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_841 = {{2'd0}, _addrSBankSelPrePre_sum_T_43[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] _addrSBankSelPrePre_sum_T_46 = _addrSBankSelPrePre_sum_T_41[2:0] + _GEN_841; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_47 = {{6'd0}, addrS_1[6]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_843 = {{2'd0}, _addrSBankSelPrePre_sum_T_47[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_1_2 = _addrSBankSelPrePre_sum_T_46 + _GEN_843; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_50 = {{2'd0}, addrS_2[6:2]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_845 = {{2'd0}, _addrSBankSelPrePre_sum_T_50[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_52 = {{1'd0}, _GEN_845}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_54 = {{5'd0}, addrS_2[6:5]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_847 = {{2'd0}, _addrSBankSelPrePre_sum_T_54[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_2_0 = _addrSBankSelPrePre_sum_T_52[2:0] + _GEN_847; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_57 = {{1'd0}, addrS_2[6:1]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_849 = {{2'd0}, _addrSBankSelPrePre_sum_T_57[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_59 = {{1'd0}, _GEN_849}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_61 = {{4'd0}, addrS_2[6:4]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_851 = {{2'd0}, _addrSBankSelPrePre_sum_T_61[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_2_1 = _addrSBankSelPrePre_sum_T_59[2:0] + _GEN_851; // @[FFTEngine.scala 223:107]
  wire [2:0] _GEN_852 = {{2'd0}, addrS_2[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_66 = {{1'd0}, _GEN_852}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_68 = {{3'd0}, addrS_2[6:3]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_854 = {{2'd0}, _addrSBankSelPrePre_sum_T_68[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] _addrSBankSelPrePre_sum_T_71 = _addrSBankSelPrePre_sum_T_66[2:0] + _GEN_854; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_72 = {{6'd0}, addrS_2[6]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_856 = {{2'd0}, _addrSBankSelPrePre_sum_T_72[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_2_2 = _addrSBankSelPrePre_sum_T_71 + _GEN_856; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_75 = {{2'd0}, addrS_3[6:2]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_858 = {{2'd0}, _addrSBankSelPrePre_sum_T_75[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_77 = {{1'd0}, _GEN_858}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_79 = {{5'd0}, addrS_3[6:5]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_860 = {{2'd0}, _addrSBankSelPrePre_sum_T_79[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_3_0 = _addrSBankSelPrePre_sum_T_77[2:0] + _GEN_860; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_82 = {{1'd0}, addrS_3[6:1]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_862 = {{2'd0}, _addrSBankSelPrePre_sum_T_82[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_84 = {{1'd0}, _GEN_862}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_86 = {{4'd0}, addrS_3[6:4]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_864 = {{2'd0}, _addrSBankSelPrePre_sum_T_86[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_3_1 = _addrSBankSelPrePre_sum_T_84[2:0] + _GEN_864; // @[FFTEngine.scala 223:107]
  wire [2:0] _GEN_865 = {{2'd0}, addrS_3[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPrePre_sum_T_91 = {{1'd0}, _GEN_865}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_93 = {{3'd0}, addrS_3[6:3]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_867 = {{2'd0}, _addrSBankSelPrePre_sum_T_93[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] _addrSBankSelPrePre_sum_T_96 = _addrSBankSelPrePre_sum_T_91[2:0] + _GEN_867; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrSBankSelPrePre_sum_T_97 = {{6'd0}, addrS_3[6]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_869 = {{2'd0}, _addrSBankSelPrePre_sum_T_97[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrSBankSelPrePre_3_2 = _addrSBankSelPrePre_sum_T_96 + _GEN_869; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrSBankSelPre_T_1 = {{1'd0}, addrSBankSelPrePre_0_0}; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_3 = {_addrSBankSelPre_T_1[2:0], 1'h0}; // @[FFTEngine.scala 229:126]
  wire [3:0] _GEN_870 = {{1'd0}, addrSBankSelPrePre_0_1}; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_5 = _addrSBankSelPre_T_3 + _GEN_870; // @[FFTEngine.scala 229:132]
  wire [4:0] _addrSBankSelPre_T_6 = {_addrSBankSelPre_T_5, 1'h0}; // @[FFTEngine.scala 229:126]
  wire [4:0] _GEN_871 = {{2'd0}, addrSBankSelPrePre_0_2}; // @[FFTEngine.scala 229:132]
  wire [4:0] _addrSBankSelPre_T_8 = _addrSBankSelPre_T_6 + _GEN_871; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_10 = {{1'd0}, addrSBankSelPrePre_1_0}; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_12 = {_addrSBankSelPre_T_10[2:0], 1'h0}; // @[FFTEngine.scala 229:126]
  wire [3:0] _GEN_872 = {{1'd0}, addrSBankSelPrePre_1_1}; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_14 = _addrSBankSelPre_T_12 + _GEN_872; // @[FFTEngine.scala 229:132]
  wire [4:0] _addrSBankSelPre_T_15 = {_addrSBankSelPre_T_14, 1'h0}; // @[FFTEngine.scala 229:126]
  wire [4:0] _GEN_873 = {{2'd0}, addrSBankSelPrePre_1_2}; // @[FFTEngine.scala 229:132]
  wire [4:0] _addrSBankSelPre_T_17 = _addrSBankSelPre_T_15 + _GEN_873; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_19 = {{1'd0}, addrSBankSelPrePre_2_0}; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_21 = {_addrSBankSelPre_T_19[2:0], 1'h0}; // @[FFTEngine.scala 229:126]
  wire [3:0] _GEN_874 = {{1'd0}, addrSBankSelPrePre_2_1}; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_23 = _addrSBankSelPre_T_21 + _GEN_874; // @[FFTEngine.scala 229:132]
  wire [4:0] _addrSBankSelPre_T_24 = {_addrSBankSelPre_T_23, 1'h0}; // @[FFTEngine.scala 229:126]
  wire [4:0] _GEN_875 = {{2'd0}, addrSBankSelPrePre_2_2}; // @[FFTEngine.scala 229:132]
  wire [4:0] _addrSBankSelPre_T_26 = _addrSBankSelPre_T_24 + _GEN_875; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_28 = {{1'd0}, addrSBankSelPrePre_3_0}; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_30 = {_addrSBankSelPre_T_28[2:0], 1'h0}; // @[FFTEngine.scala 229:126]
  wire [3:0] _GEN_876 = {{1'd0}, addrSBankSelPrePre_3_1}; // @[FFTEngine.scala 229:132]
  wire [3:0] _addrSBankSelPre_T_32 = _addrSBankSelPre_T_30 + _GEN_876; // @[FFTEngine.scala 229:132]
  wire [4:0] _addrSBankSelPre_T_33 = {_addrSBankSelPre_T_32, 1'h0}; // @[FFTEngine.scala 229:126]
  wire [4:0] _GEN_877 = {{2'd0}, addrSBankSelPrePre_3_2}; // @[FFTEngine.scala 229:132]
  wire [4:0] _addrSBankSelPre_T_35 = _addrSBankSelPre_T_33 + _GEN_877; // @[FFTEngine.scala 229:132]
  wire [2:0] addrSBankSelPre_0 = _addrSBankSelPre_T_8[2:0]; // @[FFTEngine.scala 229:148]
  wire [2:0] addrSBankSelPre_1 = _addrSBankSelPre_T_17[2:0]; // @[FFTEngine.scala 229:148]
  wire [2:0] addrSBankSelPre_2 = _addrSBankSelPre_T_26[2:0]; // @[FFTEngine.scala 229:148]
  wire [2:0] addrSBankSelPre_3 = _addrSBankSelPre_T_35[2:0]; // @[FFTEngine.scala 229:148]
  wire [2:0] _addrSBankSel_1_T_2 = addrSBankSelPre_0 + 3'h2; // @[FFTEngine.scala 239:52]
  wire [2:0] addrSBankSel_1 = _radixInit_T_1 ? addrSBankSelPre_1 : _addrSBankSel_1_T_2; // @[FFTEngine.scala 236:27 237:29 239:29]
  wire [2:0] _addrSBankSel_2_T_2 = addrSBankSelPre_0 + 3'h4; // @[FFTEngine.scala 239:52]
  wire [2:0] addrSBankSel_2 = _radixInit_T_1 ? addrSBankSelPre_2 : _addrSBankSel_2_T_2; // @[FFTEngine.scala 236:27 237:29 239:29]
  wire [2:0] _addrSBankSel_3_T_2 = addrSBankSelPre_0 + 3'h6; // @[FFTEngine.scala 239:52]
  wire [2:0] addrSBankSel_3 = _radixInit_T_1 ? addrSBankSelPre_3 : _addrSBankSel_3_T_2; // @[FFTEngine.scala 236:27 237:29 239:29]
  wire [6:0] _addrTBankSelPrePre_sum_T = {{2'd0}, addrT_0[6:2]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_879 = {{2'd0}, _addrTBankSelPrePre_sum_T[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_2 = {{1'd0}, _GEN_879}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_4 = {{5'd0}, addrT_0[6:5]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_881 = {{2'd0}, _addrTBankSelPrePre_sum_T_4[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_0_0 = _addrTBankSelPrePre_sum_T_2[2:0] + _GEN_881; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_7 = {{1'd0}, addrT_0[6:1]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_883 = {{2'd0}, _addrTBankSelPrePre_sum_T_7[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_9 = {{1'd0}, _GEN_883}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_11 = {{4'd0}, addrT_0[6:4]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_885 = {{2'd0}, _addrTBankSelPrePre_sum_T_11[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_0_1 = _addrTBankSelPrePre_sum_T_9[2:0] + _GEN_885; // @[FFTEngine.scala 223:107]
  wire [2:0] _GEN_886 = {{2'd0}, addrT_0[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_16 = {{1'd0}, _GEN_886}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_18 = {{3'd0}, addrT_0[6:3]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_888 = {{2'd0}, _addrTBankSelPrePre_sum_T_18[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] _addrTBankSelPrePre_sum_T_21 = _addrTBankSelPrePre_sum_T_16[2:0] + _GEN_888; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_22 = {{6'd0}, addrT_0[6]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_890 = {{2'd0}, _addrTBankSelPrePre_sum_T_22[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_0_2 = _addrTBankSelPrePre_sum_T_21 + _GEN_890; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_25 = {{2'd0}, addrT_1[6:2]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_892 = {{2'd0}, _addrTBankSelPrePre_sum_T_25[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_27 = {{1'd0}, _GEN_892}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_29 = {{5'd0}, addrT_1[6:5]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_894 = {{2'd0}, _addrTBankSelPrePre_sum_T_29[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_1_0 = _addrTBankSelPrePre_sum_T_27[2:0] + _GEN_894; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_32 = {{1'd0}, addrT_1[6:1]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_896 = {{2'd0}, _addrTBankSelPrePre_sum_T_32[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_34 = {{1'd0}, _GEN_896}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_36 = {{4'd0}, addrT_1[6:4]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_898 = {{2'd0}, _addrTBankSelPrePre_sum_T_36[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_1_1 = _addrTBankSelPrePre_sum_T_34[2:0] + _GEN_898; // @[FFTEngine.scala 223:107]
  wire [2:0] _GEN_899 = {{2'd0}, addrT_1[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_41 = {{1'd0}, _GEN_899}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_43 = {{3'd0}, addrT_1[6:3]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_901 = {{2'd0}, _addrTBankSelPrePre_sum_T_43[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] _addrTBankSelPrePre_sum_T_46 = _addrTBankSelPrePre_sum_T_41[2:0] + _GEN_901; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_47 = {{6'd0}, addrT_1[6]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_903 = {{2'd0}, _addrTBankSelPrePre_sum_T_47[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_1_2 = _addrTBankSelPrePre_sum_T_46 + _GEN_903; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_50 = {{2'd0}, addrT_2[6:2]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_905 = {{2'd0}, _addrTBankSelPrePre_sum_T_50[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_52 = {{1'd0}, _GEN_905}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_54 = {{5'd0}, addrT_2[6:5]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_907 = {{2'd0}, _addrTBankSelPrePre_sum_T_54[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_2_0 = _addrTBankSelPrePre_sum_T_52[2:0] + _GEN_907; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_57 = {{1'd0}, addrT_2[6:1]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_909 = {{2'd0}, _addrTBankSelPrePre_sum_T_57[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_59 = {{1'd0}, _GEN_909}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_61 = {{4'd0}, addrT_2[6:4]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_911 = {{2'd0}, _addrTBankSelPrePre_sum_T_61[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_2_1 = _addrTBankSelPrePre_sum_T_59[2:0] + _GEN_911; // @[FFTEngine.scala 223:107]
  wire [2:0] _GEN_912 = {{2'd0}, addrT_2[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_66 = {{1'd0}, _GEN_912}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_68 = {{3'd0}, addrT_2[6:3]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_914 = {{2'd0}, _addrTBankSelPrePre_sum_T_68[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] _addrTBankSelPrePre_sum_T_71 = _addrTBankSelPrePre_sum_T_66[2:0] + _GEN_914; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_72 = {{6'd0}, addrT_2[6]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_916 = {{2'd0}, _addrTBankSelPrePre_sum_T_72[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_2_2 = _addrTBankSelPrePre_sum_T_71 + _GEN_916; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_75 = {{2'd0}, addrT_3[6:2]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_918 = {{2'd0}, _addrTBankSelPrePre_sum_T_75[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_77 = {{1'd0}, _GEN_918}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_79 = {{5'd0}, addrT_3[6:5]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_920 = {{2'd0}, _addrTBankSelPrePre_sum_T_79[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_3_0 = _addrTBankSelPrePre_sum_T_77[2:0] + _GEN_920; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_82 = {{1'd0}, addrT_3[6:1]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_922 = {{2'd0}, _addrTBankSelPrePre_sum_T_82[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_84 = {{1'd0}, _GEN_922}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_86 = {{4'd0}, addrT_3[6:4]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_924 = {{2'd0}, _addrTBankSelPrePre_sum_T_86[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_3_1 = _addrTBankSelPrePre_sum_T_84[2:0] + _GEN_924; // @[FFTEngine.scala 223:107]
  wire [2:0] _GEN_925 = {{2'd0}, addrT_3[0]}; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPrePre_sum_T_91 = {{1'd0}, _GEN_925}; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_93 = {{3'd0}, addrT_3[6:3]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_927 = {{2'd0}, _addrTBankSelPrePre_sum_T_93[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] _addrTBankSelPrePre_sum_T_96 = _addrTBankSelPrePre_sum_T_91[2:0] + _GEN_927; // @[FFTEngine.scala 223:107]
  wire [6:0] _addrTBankSelPrePre_sum_T_97 = {{6'd0}, addrT_3[6]}; // @[FFTEngine.scala 223:115]
  wire [2:0] _GEN_929 = {{2'd0}, _addrTBankSelPrePre_sum_T_97[0]}; // @[FFTEngine.scala 223:107]
  wire [2:0] addrTBankSelPrePre_3_2 = _addrTBankSelPrePre_sum_T_96 + _GEN_929; // @[FFTEngine.scala 223:107]
  wire [3:0] _addrTBankSelPre_T_1 = {{1'd0}, addrTBankSelPrePre_0_0}; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_3 = {_addrTBankSelPre_T_1[2:0], 1'h0}; // @[FFTEngine.scala 245:126]
  wire [3:0] _GEN_930 = {{1'd0}, addrTBankSelPrePre_0_1}; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_5 = _addrTBankSelPre_T_3 + _GEN_930; // @[FFTEngine.scala 245:132]
  wire [4:0] _addrTBankSelPre_T_6 = {_addrTBankSelPre_T_5, 1'h0}; // @[FFTEngine.scala 245:126]
  wire [4:0] _GEN_931 = {{2'd0}, addrTBankSelPrePre_0_2}; // @[FFTEngine.scala 245:132]
  wire [4:0] _addrTBankSelPre_T_8 = _addrTBankSelPre_T_6 + _GEN_931; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_10 = {{1'd0}, addrTBankSelPrePre_1_0}; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_12 = {_addrTBankSelPre_T_10[2:0], 1'h0}; // @[FFTEngine.scala 245:126]
  wire [3:0] _GEN_932 = {{1'd0}, addrTBankSelPrePre_1_1}; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_14 = _addrTBankSelPre_T_12 + _GEN_932; // @[FFTEngine.scala 245:132]
  wire [4:0] _addrTBankSelPre_T_15 = {_addrTBankSelPre_T_14, 1'h0}; // @[FFTEngine.scala 245:126]
  wire [4:0] _GEN_933 = {{2'd0}, addrTBankSelPrePre_1_2}; // @[FFTEngine.scala 245:132]
  wire [4:0] _addrTBankSelPre_T_17 = _addrTBankSelPre_T_15 + _GEN_933; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_19 = {{1'd0}, addrTBankSelPrePre_2_0}; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_21 = {_addrTBankSelPre_T_19[2:0], 1'h0}; // @[FFTEngine.scala 245:126]
  wire [3:0] _GEN_934 = {{1'd0}, addrTBankSelPrePre_2_1}; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_23 = _addrTBankSelPre_T_21 + _GEN_934; // @[FFTEngine.scala 245:132]
  wire [4:0] _addrTBankSelPre_T_24 = {_addrTBankSelPre_T_23, 1'h0}; // @[FFTEngine.scala 245:126]
  wire [4:0] _GEN_935 = {{2'd0}, addrTBankSelPrePre_2_2}; // @[FFTEngine.scala 245:132]
  wire [4:0] _addrTBankSelPre_T_26 = _addrTBankSelPre_T_24 + _GEN_935; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_28 = {{1'd0}, addrTBankSelPrePre_3_0}; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_30 = {_addrTBankSelPre_T_28[2:0], 1'h0}; // @[FFTEngine.scala 245:126]
  wire [3:0] _GEN_936 = {{1'd0}, addrTBankSelPrePre_3_1}; // @[FFTEngine.scala 245:132]
  wire [3:0] _addrTBankSelPre_T_32 = _addrTBankSelPre_T_30 + _GEN_936; // @[FFTEngine.scala 245:132]
  wire [4:0] _addrTBankSelPre_T_33 = {_addrTBankSelPre_T_32, 1'h0}; // @[FFTEngine.scala 245:126]
  wire [4:0] _GEN_937 = {{2'd0}, addrTBankSelPrePre_3_2}; // @[FFTEngine.scala 245:132]
  wire [4:0] _addrTBankSelPre_T_35 = _addrTBankSelPre_T_33 + _GEN_937; // @[FFTEngine.scala 245:132]
  wire [2:0] addrTBankSelPre_0 = _addrTBankSelPre_T_8[2:0]; // @[FFTEngine.scala 245:148]
  wire [2:0] addrTBankSelPre_1 = _addrTBankSelPre_T_17[2:0]; // @[FFTEngine.scala 245:148]
  wire [2:0] addrTBankSelPre_2 = _addrTBankSelPre_T_26[2:0]; // @[FFTEngine.scala 245:148]
  wire [2:0] addrTBankSelPre_3 = _addrTBankSelPre_T_35[2:0]; // @[FFTEngine.scala 245:148]
  wire [2:0] addrTBankSel_0 = _radixInit_T_1 ? addrTBankSelPre_0 : 3'h1; // @[FFTEngine.scala 249:27]
  wire [2:0] _addrTBankSel_1_T_2 = addrTBankSelPre_0 + 3'h2; // @[FFTEngine.scala 255:52]
  wire [2:0] addrTBankSel_1 = _radixInit_T_1 ? addrTBankSelPre_1 : _addrTBankSel_1_T_2; // @[FFTEngine.scala 252:27 253:29 255:29]
  wire [2:0] _addrTBankSel_2_T_2 = addrTBankSelPre_0 + 3'h4; // @[FFTEngine.scala 255:52]
  wire [2:0] addrTBankSel_2 = _radixInit_T_1 ? addrTBankSelPre_2 : _addrTBankSel_2_T_2; // @[FFTEngine.scala 252:27 253:29 255:29]
  wire [2:0] _addrTBankSel_3_T_2 = addrTBankSelPre_0 + 3'h6; // @[FFTEngine.scala 255:52]
  wire [2:0] addrTBankSel_3 = _radixInit_T_1 ? addrTBankSelPre_3 : _addrTBankSel_3_T_2; // @[FFTEngine.scala 252:27 253:29 255:29]
  reg [2:0] addrSBankSel1c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel1c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel2c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel3c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel1c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel2c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel3c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel1c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel2c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrSBankSel3c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel2c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel3c_0_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel2c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel3c_1_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel2c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel3c_2_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel1c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel2c_3_r; // @[Reg.scala 35:20]
  reg [2:0] addrTBankSel3c_3_r; // @[Reg.scala 35:20]
  reg  kernelState1c; // @[Reg.scala 35:20]
  reg  kernelState2c; // @[Reg.scala 35:20]
  reg  kernelState3c; // @[Reg.scala 35:20]
  wire [15:0] dataInRPre_0 = srcBuffer ? io_readDataSram1Bank_0[15:0] : io_readDataSram0Bank_0[15:0]; // @[FFTEngine.scala 290:29]
  wire [15:0] dataInIPre_0 = srcBuffer ? io_readDataSram1Bank_0[31:16] : io_readDataSram0Bank_0[31:16]; // @[FFTEngine.scala 291:29]
  wire [15:0] dataInRPre_1 = srcBuffer ? io_readDataSram1Bank_1[15:0] : io_readDataSram0Bank_1[15:0]; // @[FFTEngine.scala 290:29]
  wire [15:0] dataInIPre_1 = srcBuffer ? io_readDataSram1Bank_1[31:16] : io_readDataSram0Bank_1[31:16]; // @[FFTEngine.scala 291:29]
  wire [15:0] dataInRPre_2 = srcBuffer ? io_readDataSram1Bank_2[15:0] : io_readDataSram0Bank_2[15:0]; // @[FFTEngine.scala 290:29]
  wire [15:0] dataInIPre_2 = srcBuffer ? io_readDataSram1Bank_2[31:16] : io_readDataSram0Bank_2[31:16]; // @[FFTEngine.scala 291:29]
  wire [15:0] dataInRPre_3 = srcBuffer ? io_readDataSram1Bank_3[15:0] : io_readDataSram0Bank_3[15:0]; // @[FFTEngine.scala 290:29]
  wire [15:0] dataInIPre_3 = srcBuffer ? io_readDataSram1Bank_3[31:16] : io_readDataSram0Bank_3[31:16]; // @[FFTEngine.scala 291:29]
  wire [15:0] dataInRPre_4 = srcBuffer ? io_readDataSram1Bank_4[15:0] : io_readDataSram0Bank_4[15:0]; // @[FFTEngine.scala 290:29]
  wire [15:0] dataInIPre_4 = srcBuffer ? io_readDataSram1Bank_4[31:16] : io_readDataSram0Bank_4[31:16]; // @[FFTEngine.scala 291:29]
  wire [15:0] dataInRPre_5 = srcBuffer ? io_readDataSram1Bank_5[15:0] : io_readDataSram0Bank_5[15:0]; // @[FFTEngine.scala 290:29]
  wire [15:0] dataInIPre_5 = srcBuffer ? io_readDataSram1Bank_5[31:16] : io_readDataSram0Bank_5[31:16]; // @[FFTEngine.scala 291:29]
  wire [15:0] dataInRPre_6 = srcBuffer ? io_readDataSram1Bank_6[15:0] : io_readDataSram0Bank_6[15:0]; // @[FFTEngine.scala 290:29]
  wire [15:0] dataInIPre_6 = srcBuffer ? io_readDataSram1Bank_6[31:16] : io_readDataSram0Bank_6[31:16]; // @[FFTEngine.scala 291:29]
  wire [15:0] dataInRPre_7 = srcBuffer ? io_readDataSram1Bank_7[15:0] : io_readDataSram0Bank_7[15:0]; // @[FFTEngine.scala 290:29]
  wire [15:0] dataInIPre_7 = srcBuffer ? io_readDataSram1Bank_7[31:16] : io_readDataSram0Bank_7[31:16]; // @[FFTEngine.scala 291:29]
  reg [3:0] addrS1c; // @[Reg.scala 35:20]
  reg [3:0] addrS2c; // @[Reg.scala 35:20]
  reg [3:0] addrS3c; // @[Reg.scala 35:20]
  reg [3:0] addrT1c; // @[Reg.scala 35:20]
  reg [3:0] addrT2c; // @[Reg.scala 35:20]
  reg [3:0] addrT3c; // @[Reg.scala 35:20]
  wire [15:0] _GEN_78 = 3'h1 == addrSBankSel1c_0_r ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_79 = 3'h2 == addrSBankSel1c_0_r ? dataInRPre_2 : _GEN_78; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_80 = 3'h3 == addrSBankSel1c_0_r ? dataInRPre_3 : _GEN_79; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_81 = 3'h4 == addrSBankSel1c_0_r ? dataInRPre_4 : _GEN_80; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_82 = 3'h5 == addrSBankSel1c_0_r ? dataInRPre_5 : _GEN_81; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_83 = 3'h6 == addrSBankSel1c_0_r ? dataInRPre_6 : _GEN_82; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_86 = 3'h1 == addrSBankSel1c_0_r ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_87 = 3'h2 == addrSBankSel1c_0_r ? dataInIPre_2 : _GEN_86; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_88 = 3'h3 == addrSBankSel1c_0_r ? dataInIPre_3 : _GEN_87; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_89 = 3'h4 == addrSBankSel1c_0_r ? dataInIPre_4 : _GEN_88; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_90 = 3'h5 == addrSBankSel1c_0_r ? dataInIPre_5 : _GEN_89; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_91 = 3'h6 == addrSBankSel1c_0_r ? dataInIPre_6 : _GEN_90; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_94 = 3'h1 == addrTBankSel1c_0_r ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_95 = 3'h2 == addrTBankSel1c_0_r ? dataInRPre_2 : _GEN_94; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_96 = 3'h3 == addrTBankSel1c_0_r ? dataInRPre_3 : _GEN_95; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_97 = 3'h4 == addrTBankSel1c_0_r ? dataInRPre_4 : _GEN_96; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_98 = 3'h5 == addrTBankSel1c_0_r ? dataInRPre_5 : _GEN_97; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_99 = 3'h6 == addrTBankSel1c_0_r ? dataInRPre_6 : _GEN_98; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_102 = 3'h1 == addrTBankSel1c_0_r ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_103 = 3'h2 == addrTBankSel1c_0_r ? dataInIPre_2 : _GEN_102; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_104 = 3'h3 == addrTBankSel1c_0_r ? dataInIPre_3 : _GEN_103; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_105 = 3'h4 == addrTBankSel1c_0_r ? dataInIPre_4 : _GEN_104; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_106 = 3'h5 == addrTBankSel1c_0_r ? dataInIPre_5 : _GEN_105; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_107 = 3'h6 == addrTBankSel1c_0_r ? dataInIPre_6 : _GEN_106; // @[FFTEngine.scala 306:{29,29}]
  wire  _GEN_110 = 3'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 308:{30,30}]
  wire  _GEN_111 = 3'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_110; // @[FFTEngine.scala 308:{30,30}]
  wire  _GEN_112 = 3'h3 == phaseCount ? io_fftRShiftP0_3 : _GEN_111; // @[FFTEngine.scala 308:{30,30}]
  wire  _GEN_113 = 3'h4 == phaseCount ? io_fftRShiftP0_4 : _GEN_112; // @[FFTEngine.scala 308:{30,30}]
  wire  _GEN_114 = 3'h5 == phaseCount ? io_fftRShiftP0_5 : _GEN_113; // @[FFTEngine.scala 308:{30,30}]
  wire [31:0] writeDataSPre = {fftCalc_io_dataOutSI3c,fftCalc_io_dataOutSR3c}; // @[Cat.scala 33:92]
  wire [31:0] writeDataTPre = {fftCalc_io_dataOutTI3c,fftCalc_io_dataOutTR3c}; // @[Cat.scala 33:92]
  wire  _io_writeEnableSram0Bank_T = srcBuffer & kernelState3c; // @[FFTEngine.scala 316:65]
  wire  _GEN_124 = 3'h0 == addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_125 = 3'h1 == addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_126 = 3'h2 == addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_127 = 3'h3 == addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_128 = 3'h4 == addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_129 = 3'h5 == addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_130 = 3'h6 == addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_131 = 3'h7 == addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 317:{52,52}]
  wire  _io_writeEnableSram1Bank_T_1 = _srcBufferNext_T_1 & kernelState3c; // @[FFTEngine.scala 318:66]
  wire  _GEN_140 = 3'h0 == addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_141 = 3'h1 == addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_142 = 3'h2 == addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_143 = 3'h3 == addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_144 = 3'h4 == addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_145 = 3'h5 == addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_146 = 3'h6 == addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_147 = 3'h7 == addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 319:{52,52}]
  wire [3:0] _GEN_156 = 3'h0 == addrTBankSel_0 ? addrT_0[3:0] : addrS_0[3:0]; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_157 = 3'h1 == addrTBankSel_0 ? addrT_0[3:0] : addrS_0[3:0]; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_158 = 3'h2 == addrTBankSel_0 ? addrT_0[3:0] : addrS_0[3:0]; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_159 = 3'h3 == addrTBankSel_0 ? addrT_0[3:0] : addrS_0[3:0]; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_160 = 3'h4 == addrTBankSel_0 ? addrT_0[3:0] : addrS_0[3:0]; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_161 = 3'h5 == addrTBankSel_0 ? addrT_0[3:0] : addrS_0[3:0]; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_162 = 3'h6 == addrTBankSel_0 ? addrT_0[3:0] : addrS_0[3:0]; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_163 = 3'h7 == addrTBankSel_0 ? addrT_0[3:0] : addrS_0[3:0]; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_172 = 3'h0 == addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_173 = 3'h1 == addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_174 = 3'h2 == addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_175 = 3'h3 == addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_176 = 3'h4 == addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_177 = 3'h5 == addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_178 = 3'h6 == addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_179 = 3'h7 == addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_212 = _srcBufferNext_T_1 ? _GEN_156 : _GEN_172; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_213 = _srcBufferNext_T_1 ? _GEN_157 : _GEN_173; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_214 = _srcBufferNext_T_1 ? _GEN_158 : _GEN_174; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_215 = _srcBufferNext_T_1 ? _GEN_159 : _GEN_175; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_216 = _srcBufferNext_T_1 ? _GEN_160 : _GEN_176; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_217 = _srcBufferNext_T_1 ? _GEN_161 : _GEN_177; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_218 = _srcBufferNext_T_1 ? _GEN_162 : _GEN_178; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_219 = _srcBufferNext_T_1 ? _GEN_163 : _GEN_179; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_220 = _srcBufferNext_T_1 ? _GEN_172 : _GEN_156; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_221 = _srcBufferNext_T_1 ? _GEN_173 : _GEN_157; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_222 = _srcBufferNext_T_1 ? _GEN_174 : _GEN_158; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_223 = _srcBufferNext_T_1 ? _GEN_175 : _GEN_159; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_224 = _srcBufferNext_T_1 ? _GEN_176 : _GEN_160; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_225 = _srcBufferNext_T_1 ? _GEN_177 : _GEN_161; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_226 = _srcBufferNext_T_1 ? _GEN_178 : _GEN_162; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_227 = _srcBufferNext_T_1 ? _GEN_179 : _GEN_163; // @[FFTEngine.scala 321:33]
  wire [31:0] _GEN_236 = 3'h0 == addrTBankSel3c_0_r ? writeDataTPre : writeDataSPre; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_237 = 3'h1 == addrTBankSel3c_0_r ? writeDataTPre : writeDataSPre; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_238 = 3'h2 == addrTBankSel3c_0_r ? writeDataTPre : writeDataSPre; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_239 = 3'h3 == addrTBankSel3c_0_r ? writeDataTPre : writeDataSPre; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_240 = 3'h4 == addrTBankSel3c_0_r ? writeDataTPre : writeDataSPre; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_241 = 3'h5 == addrTBankSel3c_0_r ? writeDataTPre : writeDataSPre; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_242 = 3'h6 == addrTBankSel3c_0_r ? writeDataTPre : writeDataSPre; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_243 = 3'h7 == addrTBankSel3c_0_r ? writeDataTPre : writeDataSPre; // @[FFTEngine.scala 334:{50,50}]
  reg [3:0] addrS1c_1; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_1; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_1; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_1; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_1; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_1; // @[Reg.scala 35:20]
  wire [15:0] _GEN_267 = 3'h1 == addrSBankSel1c_1_r ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_268 = 3'h2 == addrSBankSel1c_1_r ? dataInRPre_2 : _GEN_267; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_269 = 3'h3 == addrSBankSel1c_1_r ? dataInRPre_3 : _GEN_268; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_270 = 3'h4 == addrSBankSel1c_1_r ? dataInRPre_4 : _GEN_269; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_271 = 3'h5 == addrSBankSel1c_1_r ? dataInRPre_5 : _GEN_270; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_272 = 3'h6 == addrSBankSel1c_1_r ? dataInRPre_6 : _GEN_271; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_275 = 3'h1 == addrSBankSel1c_1_r ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_276 = 3'h2 == addrSBankSel1c_1_r ? dataInIPre_2 : _GEN_275; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_277 = 3'h3 == addrSBankSel1c_1_r ? dataInIPre_3 : _GEN_276; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_278 = 3'h4 == addrSBankSel1c_1_r ? dataInIPre_4 : _GEN_277; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_279 = 3'h5 == addrSBankSel1c_1_r ? dataInIPre_5 : _GEN_278; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_280 = 3'h6 == addrSBankSel1c_1_r ? dataInIPre_6 : _GEN_279; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_283 = 3'h1 == addrTBankSel1c_1_r ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_284 = 3'h2 == addrTBankSel1c_1_r ? dataInRPre_2 : _GEN_283; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_285 = 3'h3 == addrTBankSel1c_1_r ? dataInRPre_3 : _GEN_284; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_286 = 3'h4 == addrTBankSel1c_1_r ? dataInRPre_4 : _GEN_285; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_287 = 3'h5 == addrTBankSel1c_1_r ? dataInRPre_5 : _GEN_286; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_288 = 3'h6 == addrTBankSel1c_1_r ? dataInRPre_6 : _GEN_287; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_291 = 3'h1 == addrTBankSel1c_1_r ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_292 = 3'h2 == addrTBankSel1c_1_r ? dataInIPre_2 : _GEN_291; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_293 = 3'h3 == addrTBankSel1c_1_r ? dataInIPre_3 : _GEN_292; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_294 = 3'h4 == addrTBankSel1c_1_r ? dataInIPre_4 : _GEN_293; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_295 = 3'h5 == addrTBankSel1c_1_r ? dataInIPre_5 : _GEN_294; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_296 = 3'h6 == addrTBankSel1c_1_r ? dataInIPre_6 : _GEN_295; // @[FFTEngine.scala 306:{29,29}]
  wire [31:0] writeDataSPre_1 = {fftCalc_1_io_dataOutSI3c,fftCalc_1_io_dataOutSR3c}; // @[Cat.scala 33:92]
  wire [31:0] writeDataTPre_1 = {fftCalc_1_io_dataOutTI3c,fftCalc_1_io_dataOutTR3c}; // @[Cat.scala 33:92]
  wire  _GEN_298 = 3'h0 == addrSBankSel3c_1_r ? srcBuffer & kernelState3c : _GEN_124; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_299 = 3'h1 == addrSBankSel3c_1_r ? srcBuffer & kernelState3c : _GEN_125; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_300 = 3'h2 == addrSBankSel3c_1_r ? srcBuffer & kernelState3c : _GEN_126; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_301 = 3'h3 == addrSBankSel3c_1_r ? srcBuffer & kernelState3c : _GEN_127; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_302 = 3'h4 == addrSBankSel3c_1_r ? srcBuffer & kernelState3c : _GEN_128; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_303 = 3'h5 == addrSBankSel3c_1_r ? srcBuffer & kernelState3c : _GEN_129; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_304 = 3'h6 == addrSBankSel3c_1_r ? srcBuffer & kernelState3c : _GEN_130; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_305 = 3'h7 == addrSBankSel3c_1_r ? srcBuffer & kernelState3c : _GEN_131; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_306 = 3'h0 == addrTBankSel3c_1_r ? _io_writeEnableSram0Bank_T : _GEN_298; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_307 = 3'h1 == addrTBankSel3c_1_r ? _io_writeEnableSram0Bank_T : _GEN_299; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_308 = 3'h2 == addrTBankSel3c_1_r ? _io_writeEnableSram0Bank_T : _GEN_300; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_309 = 3'h3 == addrTBankSel3c_1_r ? _io_writeEnableSram0Bank_T : _GEN_301; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_310 = 3'h4 == addrTBankSel3c_1_r ? _io_writeEnableSram0Bank_T : _GEN_302; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_311 = 3'h5 == addrTBankSel3c_1_r ? _io_writeEnableSram0Bank_T : _GEN_303; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_312 = 3'h6 == addrTBankSel3c_1_r ? _io_writeEnableSram0Bank_T : _GEN_304; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_313 = 3'h7 == addrTBankSel3c_1_r ? _io_writeEnableSram0Bank_T : _GEN_305; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_314 = 3'h0 == addrSBankSel3c_1_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_140; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_315 = 3'h1 == addrSBankSel3c_1_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_141; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_316 = 3'h2 == addrSBankSel3c_1_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_142; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_317 = 3'h3 == addrSBankSel3c_1_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_143; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_318 = 3'h4 == addrSBankSel3c_1_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_144; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_319 = 3'h5 == addrSBankSel3c_1_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_145; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_320 = 3'h6 == addrSBankSel3c_1_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_146; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_321 = 3'h7 == addrSBankSel3c_1_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_147; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_322 = 3'h0 == addrTBankSel3c_1_r ? _io_writeEnableSram1Bank_T_1 : _GEN_314; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_323 = 3'h1 == addrTBankSel3c_1_r ? _io_writeEnableSram1Bank_T_1 : _GEN_315; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_324 = 3'h2 == addrTBankSel3c_1_r ? _io_writeEnableSram1Bank_T_1 : _GEN_316; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_325 = 3'h3 == addrTBankSel3c_1_r ? _io_writeEnableSram1Bank_T_1 : _GEN_317; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_326 = 3'h4 == addrTBankSel3c_1_r ? _io_writeEnableSram1Bank_T_1 : _GEN_318; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_327 = 3'h5 == addrTBankSel3c_1_r ? _io_writeEnableSram1Bank_T_1 : _GEN_319; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_328 = 3'h6 == addrTBankSel3c_1_r ? _io_writeEnableSram1Bank_T_1 : _GEN_320; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_329 = 3'h7 == addrTBankSel3c_1_r ? _io_writeEnableSram1Bank_T_1 : _GEN_321; // @[FFTEngine.scala 319:{52,52}]
  wire [3:0] _GEN_330 = 3'h0 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_212; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_331 = 3'h1 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_213; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_332 = 3'h2 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_214; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_333 = 3'h3 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_215; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_334 = 3'h4 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_216; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_335 = 3'h5 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_217; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_336 = 3'h6 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_218; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_337 = 3'h7 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_219; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_338 = 3'h0 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_330; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_339 = 3'h1 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_331; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_340 = 3'h2 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_332; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_341 = 3'h3 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_333; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_342 = 3'h4 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_334; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_343 = 3'h5 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_335; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_344 = 3'h6 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_336; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_345 = 3'h7 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_337; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_346 = 3'h0 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_220; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_347 = 3'h1 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_221; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_348 = 3'h2 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_222; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_349 = 3'h3 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_223; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_350 = 3'h4 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_224; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_351 = 3'h5 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_225; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_352 = 3'h6 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_226; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_353 = 3'h7 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_227; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_354 = 3'h0 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_346; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_355 = 3'h1 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_347; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_356 = 3'h2 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_348; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_357 = 3'h3 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_349; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_358 = 3'h4 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_350; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_359 = 3'h5 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_351; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_360 = 3'h6 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_352; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_361 = 3'h7 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_353; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_362 = 3'h0 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_212; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_363 = 3'h1 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_213; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_364 = 3'h2 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_214; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_365 = 3'h3 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_215; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_366 = 3'h4 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_216; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_367 = 3'h5 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_217; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_368 = 3'h6 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_218; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_369 = 3'h7 == addrSBankSel3c_1_r ? addrS3c_1 : _GEN_219; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_370 = 3'h0 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_362; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_371 = 3'h1 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_363; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_372 = 3'h2 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_364; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_373 = 3'h3 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_365; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_374 = 3'h4 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_366; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_375 = 3'h5 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_367; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_376 = 3'h6 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_368; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_377 = 3'h7 == addrTBankSel3c_1_r ? addrT3c_1 : _GEN_369; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_378 = 3'h0 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_220; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_379 = 3'h1 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_221; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_380 = 3'h2 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_222; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_381 = 3'h3 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_223; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_382 = 3'h4 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_224; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_383 = 3'h5 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_225; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_384 = 3'h6 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_226; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_385 = 3'h7 == addrSBankSel_1 ? addrS_1[3:0] : _GEN_227; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_386 = 3'h0 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_378; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_387 = 3'h1 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_379; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_388 = 3'h2 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_380; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_389 = 3'h3 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_381; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_390 = 3'h4 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_382; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_391 = 3'h5 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_383; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_392 = 3'h6 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_384; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_393 = 3'h7 == addrTBankSel_1 ? addrT_1[3:0] : _GEN_385; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_394 = _srcBufferNext_T_1 ? _GEN_338 : _GEN_370; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_395 = _srcBufferNext_T_1 ? _GEN_339 : _GEN_371; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_396 = _srcBufferNext_T_1 ? _GEN_340 : _GEN_372; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_397 = _srcBufferNext_T_1 ? _GEN_341 : _GEN_373; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_398 = _srcBufferNext_T_1 ? _GEN_342 : _GEN_374; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_399 = _srcBufferNext_T_1 ? _GEN_343 : _GEN_375; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_400 = _srcBufferNext_T_1 ? _GEN_344 : _GEN_376; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_401 = _srcBufferNext_T_1 ? _GEN_345 : _GEN_377; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_402 = _srcBufferNext_T_1 ? _GEN_354 : _GEN_386; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_403 = _srcBufferNext_T_1 ? _GEN_355 : _GEN_387; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_404 = _srcBufferNext_T_1 ? _GEN_356 : _GEN_388; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_405 = _srcBufferNext_T_1 ? _GEN_357 : _GEN_389; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_406 = _srcBufferNext_T_1 ? _GEN_358 : _GEN_390; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_407 = _srcBufferNext_T_1 ? _GEN_359 : _GEN_391; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_408 = _srcBufferNext_T_1 ? _GEN_360 : _GEN_392; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_409 = _srcBufferNext_T_1 ? _GEN_361 : _GEN_393; // @[FFTEngine.scala 321:33]
  wire [31:0] _GEN_410 = 3'h0 == addrSBankSel3c_1_r ? writeDataSPre_1 : _GEN_236; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_411 = 3'h1 == addrSBankSel3c_1_r ? writeDataSPre_1 : _GEN_237; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_412 = 3'h2 == addrSBankSel3c_1_r ? writeDataSPre_1 : _GEN_238; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_413 = 3'h3 == addrSBankSel3c_1_r ? writeDataSPre_1 : _GEN_239; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_414 = 3'h4 == addrSBankSel3c_1_r ? writeDataSPre_1 : _GEN_240; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_415 = 3'h5 == addrSBankSel3c_1_r ? writeDataSPre_1 : _GEN_241; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_416 = 3'h6 == addrSBankSel3c_1_r ? writeDataSPre_1 : _GEN_242; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_417 = 3'h7 == addrSBankSel3c_1_r ? writeDataSPre_1 : _GEN_243; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_418 = 3'h0 == addrTBankSel3c_1_r ? writeDataTPre_1 : _GEN_410; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_419 = 3'h1 == addrTBankSel3c_1_r ? writeDataTPre_1 : _GEN_411; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_420 = 3'h2 == addrTBankSel3c_1_r ? writeDataTPre_1 : _GEN_412; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_421 = 3'h3 == addrTBankSel3c_1_r ? writeDataTPre_1 : _GEN_413; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_422 = 3'h4 == addrTBankSel3c_1_r ? writeDataTPre_1 : _GEN_414; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_423 = 3'h5 == addrTBankSel3c_1_r ? writeDataTPre_1 : _GEN_415; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_424 = 3'h6 == addrTBankSel3c_1_r ? writeDataTPre_1 : _GEN_416; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_425 = 3'h7 == addrTBankSel3c_1_r ? writeDataTPre_1 : _GEN_417; // @[FFTEngine.scala 334:{50,50}]
  reg [3:0] addrS1c_2; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_2; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_2; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_2; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_2; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_2; // @[Reg.scala 35:20]
  wire [15:0] _GEN_449 = 3'h1 == addrSBankSel1c_2_r ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_450 = 3'h2 == addrSBankSel1c_2_r ? dataInRPre_2 : _GEN_449; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_451 = 3'h3 == addrSBankSel1c_2_r ? dataInRPre_3 : _GEN_450; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_452 = 3'h4 == addrSBankSel1c_2_r ? dataInRPre_4 : _GEN_451; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_453 = 3'h5 == addrSBankSel1c_2_r ? dataInRPre_5 : _GEN_452; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_454 = 3'h6 == addrSBankSel1c_2_r ? dataInRPre_6 : _GEN_453; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_457 = 3'h1 == addrSBankSel1c_2_r ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_458 = 3'h2 == addrSBankSel1c_2_r ? dataInIPre_2 : _GEN_457; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_459 = 3'h3 == addrSBankSel1c_2_r ? dataInIPre_3 : _GEN_458; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_460 = 3'h4 == addrSBankSel1c_2_r ? dataInIPre_4 : _GEN_459; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_461 = 3'h5 == addrSBankSel1c_2_r ? dataInIPre_5 : _GEN_460; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_462 = 3'h6 == addrSBankSel1c_2_r ? dataInIPre_6 : _GEN_461; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_465 = 3'h1 == addrTBankSel1c_2_r ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_466 = 3'h2 == addrTBankSel1c_2_r ? dataInRPre_2 : _GEN_465; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_467 = 3'h3 == addrTBankSel1c_2_r ? dataInRPre_3 : _GEN_466; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_468 = 3'h4 == addrTBankSel1c_2_r ? dataInRPre_4 : _GEN_467; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_469 = 3'h5 == addrTBankSel1c_2_r ? dataInRPre_5 : _GEN_468; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_470 = 3'h6 == addrTBankSel1c_2_r ? dataInRPre_6 : _GEN_469; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_473 = 3'h1 == addrTBankSel1c_2_r ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_474 = 3'h2 == addrTBankSel1c_2_r ? dataInIPre_2 : _GEN_473; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_475 = 3'h3 == addrTBankSel1c_2_r ? dataInIPre_3 : _GEN_474; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_476 = 3'h4 == addrTBankSel1c_2_r ? dataInIPre_4 : _GEN_475; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_477 = 3'h5 == addrTBankSel1c_2_r ? dataInIPre_5 : _GEN_476; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_478 = 3'h6 == addrTBankSel1c_2_r ? dataInIPre_6 : _GEN_477; // @[FFTEngine.scala 306:{29,29}]
  wire [31:0] writeDataSPre_2 = {fftCalc_2_io_dataOutSI3c,fftCalc_2_io_dataOutSR3c}; // @[Cat.scala 33:92]
  wire [31:0] writeDataTPre_2 = {fftCalc_2_io_dataOutTI3c,fftCalc_2_io_dataOutTR3c}; // @[Cat.scala 33:92]
  wire  _GEN_480 = 3'h0 == addrSBankSel3c_2_r ? srcBuffer & kernelState3c : _GEN_306; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_481 = 3'h1 == addrSBankSel3c_2_r ? srcBuffer & kernelState3c : _GEN_307; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_482 = 3'h2 == addrSBankSel3c_2_r ? srcBuffer & kernelState3c : _GEN_308; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_483 = 3'h3 == addrSBankSel3c_2_r ? srcBuffer & kernelState3c : _GEN_309; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_484 = 3'h4 == addrSBankSel3c_2_r ? srcBuffer & kernelState3c : _GEN_310; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_485 = 3'h5 == addrSBankSel3c_2_r ? srcBuffer & kernelState3c : _GEN_311; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_486 = 3'h6 == addrSBankSel3c_2_r ? srcBuffer & kernelState3c : _GEN_312; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_487 = 3'h7 == addrSBankSel3c_2_r ? srcBuffer & kernelState3c : _GEN_313; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_488 = 3'h0 == addrTBankSel3c_2_r ? _io_writeEnableSram0Bank_T : _GEN_480; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_489 = 3'h1 == addrTBankSel3c_2_r ? _io_writeEnableSram0Bank_T : _GEN_481; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_490 = 3'h2 == addrTBankSel3c_2_r ? _io_writeEnableSram0Bank_T : _GEN_482; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_491 = 3'h3 == addrTBankSel3c_2_r ? _io_writeEnableSram0Bank_T : _GEN_483; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_492 = 3'h4 == addrTBankSel3c_2_r ? _io_writeEnableSram0Bank_T : _GEN_484; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_493 = 3'h5 == addrTBankSel3c_2_r ? _io_writeEnableSram0Bank_T : _GEN_485; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_494 = 3'h6 == addrTBankSel3c_2_r ? _io_writeEnableSram0Bank_T : _GEN_486; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_495 = 3'h7 == addrTBankSel3c_2_r ? _io_writeEnableSram0Bank_T : _GEN_487; // @[FFTEngine.scala 317:{52,52}]
  wire  _GEN_496 = 3'h0 == addrSBankSel3c_2_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_322; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_497 = 3'h1 == addrSBankSel3c_2_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_323; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_498 = 3'h2 == addrSBankSel3c_2_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_324; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_499 = 3'h3 == addrSBankSel3c_2_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_325; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_500 = 3'h4 == addrSBankSel3c_2_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_326; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_501 = 3'h5 == addrSBankSel3c_2_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_327; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_502 = 3'h6 == addrSBankSel3c_2_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_328; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_503 = 3'h7 == addrSBankSel3c_2_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_329; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_504 = 3'h0 == addrTBankSel3c_2_r ? _io_writeEnableSram1Bank_T_1 : _GEN_496; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_505 = 3'h1 == addrTBankSel3c_2_r ? _io_writeEnableSram1Bank_T_1 : _GEN_497; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_506 = 3'h2 == addrTBankSel3c_2_r ? _io_writeEnableSram1Bank_T_1 : _GEN_498; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_507 = 3'h3 == addrTBankSel3c_2_r ? _io_writeEnableSram1Bank_T_1 : _GEN_499; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_508 = 3'h4 == addrTBankSel3c_2_r ? _io_writeEnableSram1Bank_T_1 : _GEN_500; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_509 = 3'h5 == addrTBankSel3c_2_r ? _io_writeEnableSram1Bank_T_1 : _GEN_501; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_510 = 3'h6 == addrTBankSel3c_2_r ? _io_writeEnableSram1Bank_T_1 : _GEN_502; // @[FFTEngine.scala 319:{52,52}]
  wire  _GEN_511 = 3'h7 == addrTBankSel3c_2_r ? _io_writeEnableSram1Bank_T_1 : _GEN_503; // @[FFTEngine.scala 319:{52,52}]
  wire [3:0] _GEN_512 = 3'h0 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_394; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_513 = 3'h1 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_395; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_514 = 3'h2 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_396; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_515 = 3'h3 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_397; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_516 = 3'h4 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_398; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_517 = 3'h5 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_399; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_518 = 3'h6 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_400; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_519 = 3'h7 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_401; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_520 = 3'h0 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_512; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_521 = 3'h1 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_513; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_522 = 3'h2 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_514; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_523 = 3'h3 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_515; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_524 = 3'h4 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_516; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_525 = 3'h5 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_517; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_526 = 3'h6 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_518; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_527 = 3'h7 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_519; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_528 = 3'h0 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_402; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_529 = 3'h1 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_403; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_530 = 3'h2 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_404; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_531 = 3'h3 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_405; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_532 = 3'h4 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_406; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_533 = 3'h5 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_407; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_534 = 3'h6 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_408; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_535 = 3'h7 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_409; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_536 = 3'h0 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_528; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_537 = 3'h1 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_529; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_538 = 3'h2 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_530; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_539 = 3'h3 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_531; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_540 = 3'h4 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_532; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_541 = 3'h5 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_533; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_542 = 3'h6 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_534; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_543 = 3'h7 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_535; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_544 = 3'h0 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_394; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_545 = 3'h1 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_395; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_546 = 3'h2 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_396; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_547 = 3'h3 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_397; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_548 = 3'h4 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_398; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_549 = 3'h5 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_399; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_550 = 3'h6 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_400; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_551 = 3'h7 == addrSBankSel3c_2_r ? addrS3c_2 : _GEN_401; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_552 = 3'h0 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_544; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_553 = 3'h1 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_545; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_554 = 3'h2 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_546; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_555 = 3'h3 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_547; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_556 = 3'h4 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_548; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_557 = 3'h5 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_549; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_558 = 3'h6 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_550; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_559 = 3'h7 == addrTBankSel3c_2_r ? addrT3c_2 : _GEN_551; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_560 = 3'h0 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_402; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_561 = 3'h1 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_403; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_562 = 3'h2 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_404; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_563 = 3'h3 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_405; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_564 = 3'h4 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_406; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_565 = 3'h5 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_407; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_566 = 3'h6 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_408; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_567 = 3'h7 == addrSBankSel_2 ? addrS_2[3:0] : _GEN_409; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_568 = 3'h0 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_560; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_569 = 3'h1 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_561; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_570 = 3'h2 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_562; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_571 = 3'h3 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_563; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_572 = 3'h4 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_564; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_573 = 3'h5 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_565; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_574 = 3'h6 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_566; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_575 = 3'h7 == addrTBankSel_2 ? addrT_2[3:0] : _GEN_567; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_576 = _srcBufferNext_T_1 ? _GEN_520 : _GEN_552; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_577 = _srcBufferNext_T_1 ? _GEN_521 : _GEN_553; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_578 = _srcBufferNext_T_1 ? _GEN_522 : _GEN_554; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_579 = _srcBufferNext_T_1 ? _GEN_523 : _GEN_555; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_580 = _srcBufferNext_T_1 ? _GEN_524 : _GEN_556; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_581 = _srcBufferNext_T_1 ? _GEN_525 : _GEN_557; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_582 = _srcBufferNext_T_1 ? _GEN_526 : _GEN_558; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_583 = _srcBufferNext_T_1 ? _GEN_527 : _GEN_559; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_584 = _srcBufferNext_T_1 ? _GEN_536 : _GEN_568; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_585 = _srcBufferNext_T_1 ? _GEN_537 : _GEN_569; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_586 = _srcBufferNext_T_1 ? _GEN_538 : _GEN_570; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_587 = _srcBufferNext_T_1 ? _GEN_539 : _GEN_571; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_588 = _srcBufferNext_T_1 ? _GEN_540 : _GEN_572; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_589 = _srcBufferNext_T_1 ? _GEN_541 : _GEN_573; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_590 = _srcBufferNext_T_1 ? _GEN_542 : _GEN_574; // @[FFTEngine.scala 321:33]
  wire [3:0] _GEN_591 = _srcBufferNext_T_1 ? _GEN_543 : _GEN_575; // @[FFTEngine.scala 321:33]
  wire [31:0] _GEN_592 = 3'h0 == addrSBankSel3c_2_r ? writeDataSPre_2 : _GEN_418; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_593 = 3'h1 == addrSBankSel3c_2_r ? writeDataSPre_2 : _GEN_419; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_594 = 3'h2 == addrSBankSel3c_2_r ? writeDataSPre_2 : _GEN_420; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_595 = 3'h3 == addrSBankSel3c_2_r ? writeDataSPre_2 : _GEN_421; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_596 = 3'h4 == addrSBankSel3c_2_r ? writeDataSPre_2 : _GEN_422; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_597 = 3'h5 == addrSBankSel3c_2_r ? writeDataSPre_2 : _GEN_423; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_598 = 3'h6 == addrSBankSel3c_2_r ? writeDataSPre_2 : _GEN_424; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_599 = 3'h7 == addrSBankSel3c_2_r ? writeDataSPre_2 : _GEN_425; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_600 = 3'h0 == addrTBankSel3c_2_r ? writeDataTPre_2 : _GEN_592; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_601 = 3'h1 == addrTBankSel3c_2_r ? writeDataTPre_2 : _GEN_593; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_602 = 3'h2 == addrTBankSel3c_2_r ? writeDataTPre_2 : _GEN_594; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_603 = 3'h3 == addrTBankSel3c_2_r ? writeDataTPre_2 : _GEN_595; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_604 = 3'h4 == addrTBankSel3c_2_r ? writeDataTPre_2 : _GEN_596; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_605 = 3'h5 == addrTBankSel3c_2_r ? writeDataTPre_2 : _GEN_597; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_606 = 3'h6 == addrTBankSel3c_2_r ? writeDataTPre_2 : _GEN_598; // @[FFTEngine.scala 334:{50,50}]
  wire [31:0] _GEN_607 = 3'h7 == addrTBankSel3c_2_r ? writeDataTPre_2 : _GEN_599; // @[FFTEngine.scala 334:{50,50}]
  reg [3:0] addrS1c_3; // @[Reg.scala 35:20]
  reg [3:0] addrS2c_3; // @[Reg.scala 35:20]
  reg [3:0] addrS3c_3; // @[Reg.scala 35:20]
  reg [3:0] addrT1c_3; // @[Reg.scala 35:20]
  reg [3:0] addrT2c_3; // @[Reg.scala 35:20]
  reg [3:0] addrT3c_3; // @[Reg.scala 35:20]
  wire [15:0] _GEN_631 = 3'h1 == addrSBankSel1c_3_r ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_632 = 3'h2 == addrSBankSel1c_3_r ? dataInRPre_2 : _GEN_631; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_633 = 3'h3 == addrSBankSel1c_3_r ? dataInRPre_3 : _GEN_632; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_634 = 3'h4 == addrSBankSel1c_3_r ? dataInRPre_4 : _GEN_633; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_635 = 3'h5 == addrSBankSel1c_3_r ? dataInRPre_5 : _GEN_634; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_636 = 3'h6 == addrSBankSel1c_3_r ? dataInRPre_6 : _GEN_635; // @[FFTEngine.scala 303:{29,29}]
  wire [15:0] _GEN_639 = 3'h1 == addrSBankSel1c_3_r ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_640 = 3'h2 == addrSBankSel1c_3_r ? dataInIPre_2 : _GEN_639; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_641 = 3'h3 == addrSBankSel1c_3_r ? dataInIPre_3 : _GEN_640; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_642 = 3'h4 == addrSBankSel1c_3_r ? dataInIPre_4 : _GEN_641; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_643 = 3'h5 == addrSBankSel1c_3_r ? dataInIPre_5 : _GEN_642; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_644 = 3'h6 == addrSBankSel1c_3_r ? dataInIPre_6 : _GEN_643; // @[FFTEngine.scala 304:{29,29}]
  wire [15:0] _GEN_647 = 3'h1 == addrTBankSel1c_3_r ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_648 = 3'h2 == addrTBankSel1c_3_r ? dataInRPre_2 : _GEN_647; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_649 = 3'h3 == addrTBankSel1c_3_r ? dataInRPre_3 : _GEN_648; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_650 = 3'h4 == addrTBankSel1c_3_r ? dataInRPre_4 : _GEN_649; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_651 = 3'h5 == addrTBankSel1c_3_r ? dataInRPre_5 : _GEN_650; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_652 = 3'h6 == addrTBankSel1c_3_r ? dataInRPre_6 : _GEN_651; // @[FFTEngine.scala 305:{29,29}]
  wire [15:0] _GEN_655 = 3'h1 == addrTBankSel1c_3_r ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_656 = 3'h2 == addrTBankSel1c_3_r ? dataInIPre_2 : _GEN_655; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_657 = 3'h3 == addrTBankSel1c_3_r ? dataInIPre_3 : _GEN_656; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_658 = 3'h4 == addrTBankSel1c_3_r ? dataInIPre_4 : _GEN_657; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_659 = 3'h5 == addrTBankSel1c_3_r ? dataInIPre_5 : _GEN_658; // @[FFTEngine.scala 306:{29,29}]
  wire [15:0] _GEN_660 = 3'h6 == addrTBankSel1c_3_r ? dataInIPre_6 : _GEN_659; // @[FFTEngine.scala 306:{29,29}]
  wire [31:0] writeDataSPre_3 = {fftCalc_3_io_dataOutSI3c,fftCalc_3_io_dataOutSR3c}; // @[Cat.scala 33:92]
  wire [31:0] writeDataTPre_3 = {fftCalc_3_io_dataOutTI3c,fftCalc_3_io_dataOutTR3c}; // @[Cat.scala 33:92]
  wire  _GEN_662 = 3'h0 == addrSBankSel3c_3_r ? srcBuffer & kernelState3c : _GEN_488; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_663 = 3'h1 == addrSBankSel3c_3_r ? srcBuffer & kernelState3c : _GEN_489; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_664 = 3'h2 == addrSBankSel3c_3_r ? srcBuffer & kernelState3c : _GEN_490; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_665 = 3'h3 == addrSBankSel3c_3_r ? srcBuffer & kernelState3c : _GEN_491; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_666 = 3'h4 == addrSBankSel3c_3_r ? srcBuffer & kernelState3c : _GEN_492; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_667 = 3'h5 == addrSBankSel3c_3_r ? srcBuffer & kernelState3c : _GEN_493; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_668 = 3'h6 == addrSBankSel3c_3_r ? srcBuffer & kernelState3c : _GEN_494; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_669 = 3'h7 == addrSBankSel3c_3_r ? srcBuffer & kernelState3c : _GEN_495; // @[FFTEngine.scala 316:{52,52}]
  wire  _GEN_678 = 3'h0 == addrSBankSel3c_3_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_504; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_679 = 3'h1 == addrSBankSel3c_3_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_505; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_680 = 3'h2 == addrSBankSel3c_3_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_506; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_681 = 3'h3 == addrSBankSel3c_3_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_507; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_682 = 3'h4 == addrSBankSel3c_3_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_508; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_683 = 3'h5 == addrSBankSel3c_3_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_509; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_684 = 3'h6 == addrSBankSel3c_3_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_510; // @[FFTEngine.scala 318:{52,52}]
  wire  _GEN_685 = 3'h7 == addrSBankSel3c_3_r ? _srcBufferNext_T_1 & kernelState3c : _GEN_511; // @[FFTEngine.scala 318:{52,52}]
  wire [3:0] _GEN_694 = 3'h0 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_576; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_695 = 3'h1 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_577; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_696 = 3'h2 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_578; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_697 = 3'h3 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_579; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_698 = 3'h4 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_580; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_699 = 3'h5 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_581; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_700 = 3'h6 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_582; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_701 = 3'h7 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_583; // @[FFTEngine.scala 322:{47,47}]
  wire [3:0] _GEN_702 = 3'h0 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_694; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_703 = 3'h1 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_695; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_704 = 3'h2 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_696; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_705 = 3'h3 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_697; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_706 = 3'h4 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_698; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_707 = 3'h5 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_699; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_708 = 3'h6 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_700; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_709 = 3'h7 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_701; // @[FFTEngine.scala 323:{47,47}]
  wire [3:0] _GEN_710 = 3'h0 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_584; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_711 = 3'h1 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_585; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_712 = 3'h2 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_586; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_713 = 3'h3 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_587; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_714 = 3'h4 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_588; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_715 = 3'h5 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_589; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_716 = 3'h6 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_590; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_717 = 3'h7 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_591; // @[FFTEngine.scala 324:{49,49}]
  wire [3:0] _GEN_718 = 3'h0 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_710; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_719 = 3'h1 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_711; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_720 = 3'h2 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_712; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_721 = 3'h3 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_713; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_722 = 3'h4 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_714; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_723 = 3'h5 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_715; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_724 = 3'h6 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_716; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_725 = 3'h7 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_717; // @[FFTEngine.scala 325:{49,49}]
  wire [3:0] _GEN_726 = 3'h0 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_576; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_727 = 3'h1 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_577; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_728 = 3'h2 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_578; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_729 = 3'h3 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_579; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_730 = 3'h4 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_580; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_731 = 3'h5 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_581; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_732 = 3'h6 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_582; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_733 = 3'h7 == addrSBankSel3c_3_r ? addrS3c_3 : _GEN_583; // @[FFTEngine.scala 327:{49,49}]
  wire [3:0] _GEN_734 = 3'h0 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_726; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_735 = 3'h1 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_727; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_736 = 3'h2 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_728; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_737 = 3'h3 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_729; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_738 = 3'h4 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_730; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_739 = 3'h5 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_731; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_740 = 3'h6 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_732; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_741 = 3'h7 == addrTBankSel3c_3_r ? addrT3c_3 : _GEN_733; // @[FFTEngine.scala 328:{49,49}]
  wire [3:0] _GEN_742 = 3'h0 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_584; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_743 = 3'h1 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_585; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_744 = 3'h2 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_586; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_745 = 3'h3 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_587; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_746 = 3'h4 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_588; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_747 = 3'h5 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_589; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_748 = 3'h6 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_590; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_749 = 3'h7 == addrSBankSel_3 ? addrS_3[3:0] : _GEN_591; // @[FFTEngine.scala 329:{47,47}]
  wire [3:0] _GEN_750 = 3'h0 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_742; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_751 = 3'h1 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_743; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_752 = 3'h2 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_744; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_753 = 3'h3 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_745; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_754 = 3'h4 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_746; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_755 = 3'h5 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_747; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_756 = 3'h6 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_748; // @[FFTEngine.scala 330:{47,47}]
  wire [3:0] _GEN_757 = 3'h7 == addrTBankSel_3 ? addrT_3[3:0] : _GEN_749; // @[FFTEngine.scala 330:{47,47}]
  wire [31:0] _GEN_774 = 3'h0 == addrSBankSel3c_3_r ? writeDataSPre_3 : _GEN_600; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_775 = 3'h1 == addrSBankSel3c_3_r ? writeDataSPre_3 : _GEN_601; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_776 = 3'h2 == addrSBankSel3c_3_r ? writeDataSPre_3 : _GEN_602; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_777 = 3'h3 == addrSBankSel3c_3_r ? writeDataSPre_3 : _GEN_603; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_778 = 3'h4 == addrSBankSel3c_3_r ? writeDataSPre_3 : _GEN_604; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_779 = 3'h5 == addrSBankSel3c_3_r ? writeDataSPre_3 : _GEN_605; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_780 = 3'h6 == addrSBankSel3c_3_r ? writeDataSPre_3 : _GEN_606; // @[FFTEngine.scala 333:{50,50}]
  wire [31:0] _GEN_781 = 3'h7 == addrSBankSel3c_3_r ? writeDataSPre_3 : _GEN_607; // @[FFTEngine.scala 333:{50,50}]
  reg  fftDoneReg; // @[FFTEngine.scala 340:29]
  FFT3PipelineCalc fftCalc ( // @[FFTEngine.scala 302:29]
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
    .io_state1c(fftCalc_io_state1c),
    .io_state2c(fftCalc_io_state2c)
  );
  FFT3PipelineCalc fftCalc_1 ( // @[FFTEngine.scala 302:29]
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
    .io_state1c(fftCalc_1_io_state1c),
    .io_state2c(fftCalc_1_io_state2c)
  );
  FFT3PipelineCalc fftCalc_2 ( // @[FFTEngine.scala 302:29]
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
    .io_state1c(fftCalc_2_io_state1c),
    .io_state2c(fftCalc_2_io_state2c)
  );
  FFT3PipelineCalc fftCalc_3 ( // @[FFTEngine.scala 302:29]
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
    .io_state1c(fftCalc_3_io_state1c),
    .io_state2c(fftCalc_3_io_state2c)
  );
  assign io_readEnableSram0Bank_0 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 259:86]
  assign io_readEnableSram0Bank_1 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 259:86]
  assign io_readEnableSram0Bank_2 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 259:86]
  assign io_readEnableSram0Bank_3 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 259:86]
  assign io_readEnableSram0Bank_4 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 259:86]
  assign io_readEnableSram0Bank_5 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 259:86]
  assign io_readEnableSram0Bank_6 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 259:86]
  assign io_readEnableSram0Bank_7 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 259:86]
  assign io_readEnableSram1Bank_0 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 260:86]
  assign io_readEnableSram1Bank_1 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 260:86]
  assign io_readEnableSram1Bank_2 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 260:86]
  assign io_readEnableSram1Bank_3 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 260:86]
  assign io_readEnableSram1Bank_4 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 260:86]
  assign io_readEnableSram1Bank_5 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 260:86]
  assign io_readEnableSram1Bank_6 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 260:86]
  assign io_readEnableSram1Bank_7 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 260:86]
  assign io_writeDataSram0Bank_0 = 3'h0 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_774; // @[FFTEngine.scala 334:{50,50}]
  assign io_writeDataSram0Bank_1 = 3'h1 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_775; // @[FFTEngine.scala 334:{50,50}]
  assign io_writeDataSram0Bank_2 = 3'h2 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_776; // @[FFTEngine.scala 334:{50,50}]
  assign io_writeDataSram0Bank_3 = 3'h3 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_777; // @[FFTEngine.scala 334:{50,50}]
  assign io_writeDataSram0Bank_4 = 3'h4 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_778; // @[FFTEngine.scala 334:{50,50}]
  assign io_writeDataSram0Bank_5 = 3'h5 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_779; // @[FFTEngine.scala 334:{50,50}]
  assign io_writeDataSram0Bank_6 = 3'h6 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_780; // @[FFTEngine.scala 334:{50,50}]
  assign io_writeDataSram0Bank_7 = 3'h7 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_781; // @[FFTEngine.scala 334:{50,50}]
  assign io_writeDataSram1Bank_0 = 3'h0 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_774; // @[FFTEngine.scala 336:{50,50}]
  assign io_writeDataSram1Bank_1 = 3'h1 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_775; // @[FFTEngine.scala 336:{50,50}]
  assign io_writeDataSram1Bank_2 = 3'h2 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_776; // @[FFTEngine.scala 336:{50,50}]
  assign io_writeDataSram1Bank_3 = 3'h3 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_777; // @[FFTEngine.scala 336:{50,50}]
  assign io_writeDataSram1Bank_4 = 3'h4 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_778; // @[FFTEngine.scala 336:{50,50}]
  assign io_writeDataSram1Bank_5 = 3'h5 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_779; // @[FFTEngine.scala 336:{50,50}]
  assign io_writeDataSram1Bank_6 = 3'h6 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_780; // @[FFTEngine.scala 336:{50,50}]
  assign io_writeDataSram1Bank_7 = 3'h7 == addrTBankSel3c_3_r ? writeDataTPre_3 : _GEN_781; // @[FFTEngine.scala 336:{50,50}]
  assign io_writeEnableSram0Bank_0 = 3'h0 == addrTBankSel3c_3_r ? _io_writeEnableSram0Bank_T : _GEN_662; // @[FFTEngine.scala 317:{52,52}]
  assign io_writeEnableSram0Bank_1 = 3'h1 == addrTBankSel3c_3_r ? _io_writeEnableSram0Bank_T : _GEN_663; // @[FFTEngine.scala 317:{52,52}]
  assign io_writeEnableSram0Bank_2 = 3'h2 == addrTBankSel3c_3_r ? _io_writeEnableSram0Bank_T : _GEN_664; // @[FFTEngine.scala 317:{52,52}]
  assign io_writeEnableSram0Bank_3 = 3'h3 == addrTBankSel3c_3_r ? _io_writeEnableSram0Bank_T : _GEN_665; // @[FFTEngine.scala 317:{52,52}]
  assign io_writeEnableSram0Bank_4 = 3'h4 == addrTBankSel3c_3_r ? _io_writeEnableSram0Bank_T : _GEN_666; // @[FFTEngine.scala 317:{52,52}]
  assign io_writeEnableSram0Bank_5 = 3'h5 == addrTBankSel3c_3_r ? _io_writeEnableSram0Bank_T : _GEN_667; // @[FFTEngine.scala 317:{52,52}]
  assign io_writeEnableSram0Bank_6 = 3'h6 == addrTBankSel3c_3_r ? _io_writeEnableSram0Bank_T : _GEN_668; // @[FFTEngine.scala 317:{52,52}]
  assign io_writeEnableSram0Bank_7 = 3'h7 == addrTBankSel3c_3_r ? _io_writeEnableSram0Bank_T : _GEN_669; // @[FFTEngine.scala 317:{52,52}]
  assign io_writeEnableSram1Bank_0 = 3'h0 == addrTBankSel3c_3_r ? _io_writeEnableSram1Bank_T_1 : _GEN_678; // @[FFTEngine.scala 319:{52,52}]
  assign io_writeEnableSram1Bank_1 = 3'h1 == addrTBankSel3c_3_r ? _io_writeEnableSram1Bank_T_1 : _GEN_679; // @[FFTEngine.scala 319:{52,52}]
  assign io_writeEnableSram1Bank_2 = 3'h2 == addrTBankSel3c_3_r ? _io_writeEnableSram1Bank_T_1 : _GEN_680; // @[FFTEngine.scala 319:{52,52}]
  assign io_writeEnableSram1Bank_3 = 3'h3 == addrTBankSel3c_3_r ? _io_writeEnableSram1Bank_T_1 : _GEN_681; // @[FFTEngine.scala 319:{52,52}]
  assign io_writeEnableSram1Bank_4 = 3'h4 == addrTBankSel3c_3_r ? _io_writeEnableSram1Bank_T_1 : _GEN_682; // @[FFTEngine.scala 319:{52,52}]
  assign io_writeEnableSram1Bank_5 = 3'h5 == addrTBankSel3c_3_r ? _io_writeEnableSram1Bank_T_1 : _GEN_683; // @[FFTEngine.scala 319:{52,52}]
  assign io_writeEnableSram1Bank_6 = 3'h6 == addrTBankSel3c_3_r ? _io_writeEnableSram1Bank_T_1 : _GEN_684; // @[FFTEngine.scala 319:{52,52}]
  assign io_writeEnableSram1Bank_7 = 3'h7 == addrTBankSel3c_3_r ? _io_writeEnableSram1Bank_T_1 : _GEN_685; // @[FFTEngine.scala 319:{52,52}]
  assign io_addrSram0Bank_0 = _srcBufferNext_T_1 ? _GEN_702 : _GEN_734; // @[FFTEngine.scala 321:33]
  assign io_addrSram0Bank_1 = _srcBufferNext_T_1 ? _GEN_703 : _GEN_735; // @[FFTEngine.scala 321:33]
  assign io_addrSram0Bank_2 = _srcBufferNext_T_1 ? _GEN_704 : _GEN_736; // @[FFTEngine.scala 321:33]
  assign io_addrSram0Bank_3 = _srcBufferNext_T_1 ? _GEN_705 : _GEN_737; // @[FFTEngine.scala 321:33]
  assign io_addrSram0Bank_4 = _srcBufferNext_T_1 ? _GEN_706 : _GEN_738; // @[FFTEngine.scala 321:33]
  assign io_addrSram0Bank_5 = _srcBufferNext_T_1 ? _GEN_707 : _GEN_739; // @[FFTEngine.scala 321:33]
  assign io_addrSram0Bank_6 = _srcBufferNext_T_1 ? _GEN_708 : _GEN_740; // @[FFTEngine.scala 321:33]
  assign io_addrSram0Bank_7 = _srcBufferNext_T_1 ? _GEN_709 : _GEN_741; // @[FFTEngine.scala 321:33]
  assign io_addrSram1Bank_0 = _srcBufferNext_T_1 ? _GEN_718 : _GEN_750; // @[FFTEngine.scala 321:33]
  assign io_addrSram1Bank_1 = _srcBufferNext_T_1 ? _GEN_719 : _GEN_751; // @[FFTEngine.scala 321:33]
  assign io_addrSram1Bank_2 = _srcBufferNext_T_1 ? _GEN_720 : _GEN_752; // @[FFTEngine.scala 321:33]
  assign io_addrSram1Bank_3 = _srcBufferNext_T_1 ? _GEN_721 : _GEN_753; // @[FFTEngine.scala 321:33]
  assign io_addrSram1Bank_4 = _srcBufferNext_T_1 ? _GEN_722 : _GEN_754; // @[FFTEngine.scala 321:33]
  assign io_addrSram1Bank_5 = _srcBufferNext_T_1 ? _GEN_723 : _GEN_755; // @[FFTEngine.scala 321:33]
  assign io_addrSram1Bank_6 = _srcBufferNext_T_1 ? _GEN_724 : _GEN_756; // @[FFTEngine.scala 321:33]
  assign io_addrSram1Bank_7 = _srcBufferNext_T_1 ? _GEN_725 : _GEN_757; // @[FFTEngine.scala 321:33]
  assign io_fftDone = fftDoneReg; // @[FFTEngine.scala 341:16]
  assign fftCalc_clock = clock;
  assign fftCalc_reset = reset;
  assign fftCalc_io_dataInSR = 3'h7 == addrSBankSel1c_0_r ? dataInRPre_7 : _GEN_83; // @[FFTEngine.scala 303:{29,29}]
  assign fftCalc_io_dataInSI = 3'h7 == addrSBankSel1c_0_r ? dataInIPre_7 : _GEN_91; // @[FFTEngine.scala 304:{29,29}]
  assign fftCalc_io_dataInTR = 3'h7 == addrTBankSel1c_0_r ? dataInRPre_7 : _GEN_99; // @[FFTEngine.scala 305:{29,29}]
  assign fftCalc_io_dataInTI = 3'h7 == addrTBankSel1c_0_r ? dataInIPre_7 : _GEN_107; // @[FFTEngine.scala 306:{29,29}]
  assign fftCalc_io_nk = _T_6 ? {{2'd0}, _nk_0_T_1} : _GEN_14; // @[FFTEngine.scala 151:42 153:23]
  assign fftCalc_io_rShiftSym = 3'h6 == phaseCount ? io_fftRShiftP0_6 : _GEN_114; // @[FFTEngine.scala 308:{30,30}]
  assign fftCalc_io_isFFT = ~io_fftMode; // @[FFTEngine.scala 40:17]
  assign fftCalc_io_state1c = kernelState1c; // @[FFTEngine.scala 311:28]
  assign fftCalc_io_state2c = kernelState2c; // @[FFTEngine.scala 312:28]
  assign fftCalc_1_clock = clock;
  assign fftCalc_1_reset = reset;
  assign fftCalc_1_io_dataInSR = 3'h7 == addrSBankSel1c_1_r ? dataInRPre_7 : _GEN_272; // @[FFTEngine.scala 303:{29,29}]
  assign fftCalc_1_io_dataInSI = 3'h7 == addrSBankSel1c_1_r ? dataInIPre_7 : _GEN_280; // @[FFTEngine.scala 304:{29,29}]
  assign fftCalc_1_io_dataInTR = 3'h7 == addrTBankSel1c_1_r ? dataInRPre_7 : _GEN_288; // @[FFTEngine.scala 305:{29,29}]
  assign fftCalc_1_io_dataInTI = 3'h7 == addrTBankSel1c_1_r ? dataInIPre_7 : _GEN_296; // @[FFTEngine.scala 306:{29,29}]
  assign fftCalc_1_io_nk = _T_6 ? {{2'd0}, _nk_1_T_1} : _GEN_15; // @[FFTEngine.scala 151:42 153:23]
  assign fftCalc_1_io_rShiftSym = 3'h6 == phaseCount ? io_fftRShiftP0_6 : _GEN_114; // @[FFTEngine.scala 308:{30,30}]
  assign fftCalc_1_io_isFFT = ~io_fftMode; // @[FFTEngine.scala 40:17]
  assign fftCalc_1_io_state1c = kernelState1c; // @[FFTEngine.scala 311:28]
  assign fftCalc_1_io_state2c = kernelState2c; // @[FFTEngine.scala 312:28]
  assign fftCalc_2_clock = clock;
  assign fftCalc_2_reset = reset;
  assign fftCalc_2_io_dataInSR = 3'h7 == addrSBankSel1c_2_r ? dataInRPre_7 : _GEN_454; // @[FFTEngine.scala 303:{29,29}]
  assign fftCalc_2_io_dataInSI = 3'h7 == addrSBankSel1c_2_r ? dataInIPre_7 : _GEN_462; // @[FFTEngine.scala 304:{29,29}]
  assign fftCalc_2_io_dataInTR = 3'h7 == addrTBankSel1c_2_r ? dataInRPre_7 : _GEN_470; // @[FFTEngine.scala 305:{29,29}]
  assign fftCalc_2_io_dataInTI = 3'h7 == addrTBankSel1c_2_r ? dataInIPre_7 : _GEN_478; // @[FFTEngine.scala 306:{29,29}]
  assign fftCalc_2_io_nk = _T_6 ? {{1'd0}, _nk_2_T_1} : _GEN_16; // @[FFTEngine.scala 151:42 153:23]
  assign fftCalc_2_io_rShiftSym = 3'h6 == phaseCount ? io_fftRShiftP0_6 : _GEN_114; // @[FFTEngine.scala 308:{30,30}]
  assign fftCalc_2_io_isFFT = ~io_fftMode; // @[FFTEngine.scala 40:17]
  assign fftCalc_2_io_state1c = kernelState1c; // @[FFTEngine.scala 311:28]
  assign fftCalc_2_io_state2c = kernelState2c; // @[FFTEngine.scala 312:28]
  assign fftCalc_3_clock = clock;
  assign fftCalc_3_reset = reset;
  assign fftCalc_3_io_dataInSR = 3'h7 == addrSBankSel1c_3_r ? dataInRPre_7 : _GEN_636; // @[FFTEngine.scala 303:{29,29}]
  assign fftCalc_3_io_dataInSI = 3'h7 == addrSBankSel1c_3_r ? dataInIPre_7 : _GEN_644; // @[FFTEngine.scala 304:{29,29}]
  assign fftCalc_3_io_dataInTR = 3'h7 == addrTBankSel1c_3_r ? dataInRPre_7 : _GEN_652; // @[FFTEngine.scala 305:{29,29}]
  assign fftCalc_3_io_dataInTI = 3'h7 == addrTBankSel1c_3_r ? dataInIPre_7 : _GEN_660; // @[FFTEngine.scala 306:{29,29}]
  assign fftCalc_3_io_nk = _T_6 ? {{1'd0}, _nk_3_T_1} : _GEN_17; // @[FFTEngine.scala 151:42 153:23]
  assign fftCalc_3_io_rShiftSym = 3'h6 == phaseCount ? io_fftRShiftP0_6 : _GEN_114; // @[FFTEngine.scala 308:{30,30}]
  assign fftCalc_3_io_isFFT = ~io_fftMode; // @[FFTEngine.scala 40:17]
  assign fftCalc_3_io_state1c = kernelState1c; // @[FFTEngine.scala 311:28]
  assign fftCalc_3_io_state2c = kernelState2c; // @[FFTEngine.scala 312:28]
  always @(posedge clock) begin
    if (reset) begin // @[FFTEngine.scala 42:27]
      stateReg <= 3'h0; // @[FFTEngine.scala 42:27]
    end else if (3'h0 == stateReg) begin // @[FFTEngine.scala 48:22]
      if (io_fftEngineKick) begin // @[FFTEngine.scala 50:36]
        stateReg <= 3'h1; // @[FFTEngine.scala 51:26]
      end
    end else if (3'h1 == stateReg) begin // @[FFTEngine.scala 48:22]
      if (radixCount == 5'hf) begin // @[FFTEngine.scala 57:46]
        stateReg <= 3'h2; // @[FFTEngine.scala 58:26]
      end
    end else if (3'h2 == stateReg) begin // @[FFTEngine.scala 48:22]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_5;
    end
    if (reset) begin // @[FFTEngine.scala 44:29]
      radixCount <= 5'h0; // @[FFTEngine.scala 44:29]
    end else if (radixInit) begin // @[FFTEngine.scala 90:21]
      radixCount <= 5'h0; // @[FFTEngine.scala 91:20]
    end else if (radixUp) begin // @[FFTEngine.scala 92:26]
      radixCount <= _radixCount_T_1; // @[FFTEngine.scala 93:20]
    end
    if (reset) begin // @[FFTEngine.scala 46:29]
      phaseCount <= 3'h0; // @[FFTEngine.scala 46:29]
    end else if (phaseInit) begin // @[FFTEngine.scala 104:21]
      phaseCount <= 3'h0; // @[FFTEngine.scala 105:20]
    end else if (_radixInit_T_9) begin // @[FFTEngine.scala 106:26]
      phaseCount <= _phaseCount_T_1; // @[FFTEngine.scala 107:20]
    end
    if (reset) begin // @[FFTEngine.scala 112:28]
      srcBuffer <= 1'h0; // @[FFTEngine.scala 112:28]
    end else if (srcUp) begin // @[FFTEngine.scala 118:17]
      srcBuffer <= srcBufferNext; // @[FFTEngine.scala 119:19]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_0_r <= 3'h0; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 233:27]
      addrSBankSel1c_0_r <= addrSBankSelPre_0;
    end else begin
      addrSBankSel1c_0_r <= 3'h0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 236:27]
      addrSBankSel1c_1_r <= addrSBankSelPre_1; // @[FFTEngine.scala 237:29]
    end else begin
      addrSBankSel1c_1_r <= _addrSBankSel_1_T_2; // @[FFTEngine.scala 239:29]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel2c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSel2c_1_r <= addrSBankSel1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel3c_1_r <= 3'h2; // @[Reg.scala 35:20]
    end else begin
      addrSBankSel3c_1_r <= addrSBankSel2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 236:27]
      addrSBankSel1c_2_r <= addrSBankSelPre_2; // @[FFTEngine.scala 237:29]
    end else begin
      addrSBankSel1c_2_r <= _addrSBankSel_2_T_2; // @[FFTEngine.scala 239:29]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel2c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSel2c_2_r <= addrSBankSel1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel3c_2_r <= 3'h4; // @[Reg.scala 35:20]
    end else begin
      addrSBankSel3c_2_r <= addrSBankSel2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel1c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 236:27]
      addrSBankSel1c_3_r <= addrSBankSelPre_3; // @[FFTEngine.scala 237:29]
    end else begin
      addrSBankSel1c_3_r <= _addrSBankSel_3_T_2; // @[FFTEngine.scala 239:29]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel2c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSel2c_3_r <= addrSBankSel1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrSBankSel3c_3_r <= 3'h6; // @[Reg.scala 35:20]
    end else begin
      addrSBankSel3c_3_r <= addrSBankSel2c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_0_r <= 3'h1; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 249:27]
      addrTBankSel1c_0_r <= addrTBankSelPre_0;
    end else begin
      addrTBankSel1c_0_r <= 3'h1;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel2c_0_r <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel2c_0_r <= addrTBankSel1c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel3c_0_r <= 3'h1; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel3c_0_r <= addrTBankSel2c_0_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_1_r <= 3'h3; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 252:27]
      addrTBankSel1c_1_r <= addrTBankSelPre_1; // @[FFTEngine.scala 253:29]
    end else begin
      addrTBankSel1c_1_r <= _addrTBankSel_1_T_2; // @[FFTEngine.scala 255:29]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel2c_1_r <= 3'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel2c_1_r <= addrTBankSel1c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel3c_1_r <= 3'h3; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel3c_1_r <= addrTBankSel2c_1_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_2_r <= 3'h5; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 252:27]
      addrTBankSel1c_2_r <= addrTBankSelPre_2; // @[FFTEngine.scala 253:29]
    end else begin
      addrTBankSel1c_2_r <= _addrTBankSel_2_T_2; // @[FFTEngine.scala 255:29]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel2c_2_r <= 3'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel2c_2_r <= addrTBankSel1c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel3c_2_r <= 3'h5; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel3c_2_r <= addrTBankSel2c_2_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel1c_3_r <= 3'h7; // @[Reg.scala 35:20]
    end else if (_radixInit_T_1) begin // @[FFTEngine.scala 252:27]
      addrTBankSel1c_3_r <= addrTBankSelPre_3; // @[FFTEngine.scala 253:29]
    end else begin
      addrTBankSel1c_3_r <= _addrTBankSel_3_T_2; // @[FFTEngine.scala 255:29]
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel2c_3_r <= 3'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel2c_3_r <= addrTBankSel1c_3_r;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrTBankSel3c_3_r <= 3'h7; // @[Reg.scala 35:20]
    end else begin
      addrTBankSel3c_3_r <= addrTBankSel2c_3_r;
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
    if (reset) begin // @[FFTEngine.scala 340:29]
      fftDoneReg <= 1'h0; // @[FFTEngine.scala 340:29]
    end else begin
      fftDoneReg <= _radixInit_T_11; // @[FFTEngine.scala 340:29]
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
  radixCount = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  srcBuffer = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrSBankSel1c_0_r = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  addrSBankSel1c_1_r = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  addrSBankSel2c_1_r = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  addrSBankSel3c_1_r = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  addrSBankSel1c_2_r = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  addrSBankSel2c_2_r = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  addrSBankSel3c_2_r = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  addrSBankSel1c_3_r = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  addrSBankSel2c_3_r = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  addrSBankSel3c_3_r = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  addrTBankSel1c_0_r = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  addrTBankSel2c_0_r = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  addrTBankSel3c_0_r = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  addrTBankSel1c_1_r = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  addrTBankSel2c_1_r = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  addrTBankSel3c_1_r = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  addrTBankSel1c_2_r = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  addrTBankSel2c_2_r = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  addrTBankSel3c_2_r = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  addrTBankSel1c_3_r = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  addrTBankSel2c_3_r = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  addrTBankSel3c_3_r = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  kernelState1c = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  kernelState2c = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  kernelState3c = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  addrS1c = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  addrS2c = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  addrS3c = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  addrT1c = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  addrT2c = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  addrT3c = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  addrS1c_1 = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  addrS2c_1 = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  addrS3c_1 = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  addrT1c_1 = _RAND_38[3:0];
  _RAND_39 = {1{`RANDOM}};
  addrT2c_1 = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  addrT3c_1 = _RAND_40[3:0];
  _RAND_41 = {1{`RANDOM}};
  addrS1c_2 = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  addrS2c_2 = _RAND_42[3:0];
  _RAND_43 = {1{`RANDOM}};
  addrS3c_2 = _RAND_43[3:0];
  _RAND_44 = {1{`RANDOM}};
  addrT1c_2 = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  addrT2c_2 = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  addrT3c_2 = _RAND_46[3:0];
  _RAND_47 = {1{`RANDOM}};
  addrS1c_3 = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  addrS2c_3 = _RAND_48[3:0];
  _RAND_49 = {1{`RANDOM}};
  addrS3c_3 = _RAND_49[3:0];
  _RAND_50 = {1{`RANDOM}};
  addrT1c_3 = _RAND_50[3:0];
  _RAND_51 = {1{`RANDOM}};
  addrT2c_3 = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  addrT3c_3 = _RAND_52[3:0];
  _RAND_53 = {1{`RANDOM}};
  fftDoneReg = _RAND_53[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
