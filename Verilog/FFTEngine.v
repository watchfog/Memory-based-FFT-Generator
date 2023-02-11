module FFTTwiddle(
  input  [2:0]  io_nk,
  input  [1:0]  io_twiLutCaseIndex,
  output [11:0] io_wR,
  output [11:0] io_wI
);
  wire  _idx_r_T_3 = io_nk[2] & |io_nk[1:0]; // @[FFTTwiddle.scala 35:43]
  wire [2:0] _idx_r_T_4 = ~io_nk; // @[FFTTwiddle.scala 35:80]
  wire [2:0] _idx_r_T_6 = _idx_r_T_4 + 3'h1; // @[FFTTwiddle.scala 35:87]
  wire [2:0] idx_r = io_nk[2] & |io_nk[1:0] ? _idx_r_T_6 : io_nk; // @[FFTTwiddle.scala 35:20]
  wire  chg_sign_flag_r = io_twiLutCaseIndex == 2'h2 ? ~_idx_r_T_3 : _idx_r_T_3; // @[FFTTwiddle.scala 47:30]
  wire  chg_sign_flag_i = io_twiLutCaseIndex == 2'h1 ? 1'h0 : 1'h1; // @[FFTTwiddle.scala 48:30]
  wire [11:0] _GEN_1 = 3'h1 == idx_r ? 12'h3b2 : 12'h400; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_2 = 3'h2 == idx_r ? 12'h2d4 : _GEN_1; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_3 = 3'h3 == idx_r ? 12'h188 : _GEN_2; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_4 = 3'h4 == idx_r ? 12'h0 : _GEN_3; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_5 = 3'h5 == idx_r ? 12'h0 : _GEN_4; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_6 = 3'h6 == idx_r ? 12'h0 : _GEN_5; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _GEN_7 = 3'h7 == idx_r ? 12'h0 : _GEN_6; // @[FFTTwiddle.scala 50:{36,36}]
  wire [11:0] _io_wR_T = ~_GEN_7; // @[FFTTwiddle.scala 50:36]
  wire [11:0] _io_wR_T_2 = _io_wR_T + 12'h1; // @[FFTTwiddle.scala 50:45]
  wire [11:0] _GEN_9 = 3'h1 == idx_r ? 12'h188 : 12'h0; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_10 = 3'h2 == idx_r ? 12'h2d4 : _GEN_9; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_11 = 3'h3 == idx_r ? 12'h3b2 : _GEN_10; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_12 = 3'h4 == idx_r ? 12'h400 : _GEN_11; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_13 = 3'h5 == idx_r ? 12'h0 : _GEN_12; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_14 = 3'h6 == idx_r ? 12'h0 : _GEN_13; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _GEN_15 = 3'h7 == idx_r ? 12'h0 : _GEN_14; // @[FFTTwiddle.scala 51:{36,36}]
  wire [11:0] _io_wI_T = ~_GEN_15; // @[FFTTwiddle.scala 51:36]
  wire [11:0] _io_wI_T_2 = _io_wI_T + 12'h1; // @[FFTTwiddle.scala 51:45]
  assign io_wR = chg_sign_flag_r ? _io_wR_T_2 : _GEN_7; // @[FFTTwiddle.scala 50:17]
  assign io_wI = chg_sign_flag_i ? _io_wI_T_2 : _GEN_15; // @[FFTTwiddle.scala 51:17]
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
  output [1:0]  io_addrSram0Bank_0,
  output [1:0]  io_addrSram0Bank_1,
  output [1:0]  io_addrSram1Bank_0,
  output [1:0]  io_addrSram1Bank_1,
  output        io_fftDone,
  input         io_fftEnable,
  input         io_fftEngineKick,
  input         io_fftMode,
  input         io_fftRShiftP0_0,
  input         io_fftRShiftP0_1,
  input         io_fftRShiftP0_2,
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
`endif // RANDOMIZE_REG_INIT
  wire [2:0] fftTwiddle_io_nk; // @[FFTEngine.scala 293:32]
  wire [1:0] fftTwiddle_io_twiLutCaseIndex; // @[FFTEngine.scala 293:32]
  wire [11:0] fftTwiddle_io_wR; // @[FFTEngine.scala 293:32]
  wire [11:0] fftTwiddle_io_wI; // @[FFTEngine.scala 293:32]
  wire [17:0] fftMultiply_io_a; // @[FFTEngine.scala 314:33]
  wire [17:0] fftMultiply_io_b; // @[FFTEngine.scala 314:33]
  wire [35:0] fftMultiply_io_product; // @[FFTEngine.scala 314:33]
  wire  isFFT = ~io_fftMode; // @[FFTEngine.scala 40:17]
  reg [2:0] stateReg; // @[FFTEngine.scala 42:27]
  reg [2:0] radixCount; // @[FFTEngine.scala 44:29]
  reg [1:0] phaseCount; // @[FFTEngine.scala 46:29]
  wire  _T_2 = radixCount == 3'h3; // @[FFTEngine.scala 57:29]
  wire [2:0] _GEN_2 = _T_2 ? 3'h3 : stateReg; // @[FFTEngine.scala 64:45 65:26 67:26]
  wire  _T_6 = phaseCount == 2'h2; // @[FFTEngine.scala 71:29]
  wire [2:0] _GEN_3 = phaseCount == 2'h2 ? 3'h4 : 3'h1; // @[FFTEngine.scala 71:46 72:26 74:26]
  wire [2:0] _GEN_4 = 3'h4 == stateReg ? 3'h0 : stateReg; // @[FFTEngine.scala 48:22 78:22 42:27]
  wire [2:0] _GEN_5 = 3'h3 == stateReg ? _GEN_3 : _GEN_4; // @[FFTEngine.scala 48:22]
  wire  _radixInit_T = stateReg == 3'h0; // @[FFTEngine.scala 82:31]
  wire  _radixInit_T_1 = stateReg == 3'h1; // @[FFTEngine.scala 83:16]
  wire  _radixInit_T_3 = stateReg == 3'h1 & _T_2; // @[FFTEngine.scala 83:30]
  wire  _radixInit_T_4 = stateReg == 3'h0 | _radixInit_T_3; // @[FFTEngine.scala 82:45]
  wire  _radixInit_T_5 = stateReg == 3'h2; // @[FFTEngine.scala 84:16]
  wire  _radixInit_T_7 = stateReg == 3'h2 & _T_2; // @[FFTEngine.scala 84:31]
  wire  _radixInit_T_8 = _radixInit_T_4 | _radixInit_T_7; // @[FFTEngine.scala 83:63]
  wire  _radixInit_T_9 = stateReg == 3'h3; // @[FFTEngine.scala 85:15]
  wire  _radixInit_T_10 = _radixInit_T_8 | _radixInit_T_9; // @[FFTEngine.scala 84:63]
  wire  _radixInit_T_11 = stateReg == 3'h4; // @[FFTEngine.scala 86:15]
  wire  radixInit = _radixInit_T_10 | _radixInit_T_11; // @[FFTEngine.scala 85:32]
  wire  radixUp = _radixInit_T_1 | _radixInit_T_5; // @[FFTEngine.scala 88:43]
  wire [2:0] _radixCount_T_1 = radixCount + 3'h1; // @[FFTEngine.scala 93:34]
  wire  _phaseInit_T_3 = _radixInit_T_9 & _T_6; // @[FFTEngine.scala 99:33]
  wire  _phaseInit_T_4 = _radixInit_T | _phaseInit_T_3; // @[FFTEngine.scala 98:45]
  wire  phaseInit = _phaseInit_T_4 | _radixInit_T_11; // @[FFTEngine.scala 99:65]
  wire [1:0] _phaseCount_T_1 = phaseCount + 2'h1; // @[FFTEngine.scala 107:34]
  reg  srcBuffer; // @[FFTEngine.scala 112:28]
  wire  _srcBufferNext_T_1 = ~srcBuffer; // @[FFTEngine.scala 114:54]
  wire  srcBufferNext = _radixInit_T_9 & ~srcBuffer; // @[FFTEngine.scala 114:52]
  wire  srcUp = _radixInit_T | _radixInit_T_9; // @[FFTEngine.scala 116:41]
  wire [1:0] radixCountTemp = radixCount[1:0]; // @[FFTEngine.scala 128:36]
  wire [5:0] _dataTemp_T = {radixCountTemp,1'h0,radixCountTemp,1'h0}; // @[Cat.scala 33:92]
  wire [8:0] _GEN_14 = {{3'd0}, _dataTemp_T}; // @[FFTEngine.scala 131:40]
  wire [8:0] dataTemp = _GEN_14 << phaseCount; // @[FFTEngine.scala 131:40]
  wire [2:0] addrSPre_0 = dataTemp[5:3]; // @[FFTEngine.scala 132:17]
  wire [5:0] _dataTemp_T_1 = {radixCountTemp,1'h1,radixCountTemp,1'h1}; // @[Cat.scala 33:92]
  wire [8:0] _GEN_15 = {{3'd0}, _dataTemp_T_1}; // @[FFTEngine.scala 131:40]
  wire [8:0] dataTemp_1 = _GEN_15 << phaseCount; // @[FFTEngine.scala 131:40]
  wire [2:0] addrTPre_0 = dataTemp_1[5:3]; // @[FFTEngine.scala 132:17]
  wire [2:0] _T_15 = 3'h3 >> phaseCount; // @[FFTEngine.scala 164:171]
  wire [2:0] _T_16 = ~_T_15; // @[FFTEngine.scala 164:109]
  wire [2:0] _GEN_91 = {{1'd0}, radixCountTemp}; // @[FFTEngine.scala 164:107]
  wire [2:0] nk_0 = _GEN_91 & _T_16; // @[FFTEngine.scala 164:107]
  wire  addrS_addrTemp_0 = addrSPre_0[2]; // @[FFTEngine.scala 172:35]
  wire  addrS_addrTemp_1 = addrSPre_0[1]; // @[FFTEngine.scala 172:35]
  wire [2:0] addrS_0 = {addrSPre_0[0],addrS_addrTemp_1,addrS_addrTemp_0}; // @[FFTEngine.scala 176:133]
  wire  addrT_addrTemp_0 = addrTPre_0[2]; // @[FFTEngine.scala 172:35]
  wire  addrT_addrTemp_1 = addrTPre_0[1]; // @[FFTEngine.scala 172:35]
  wire [2:0] addrT_0 = {addrTPre_0[0],addrT_addrTemp_1,addrT_addrTemp_0}; // @[FFTEngine.scala 177:133]
  wire [1:0] _addrSBankSelPrePre_sum_T_2 = {{1'd0}, addrS_0[0]}; // @[FFTEngine.scala 181:107]
  wire [2:0] _addrSBankSelPrePre_sum_T_4 = {{1'd0}, addrS_0[2:1]}; // @[FFTEngine.scala 181:115]
  wire  _addrSBankSelPrePre_sum_T_7 = _addrSBankSelPrePre_sum_T_2[0] + _addrSBankSelPrePre_sum_T_4[0]; // @[FFTEngine.scala 181:107]
  wire [2:0] _addrSBankSelPrePre_sum_T_8 = {{2'd0}, addrS_0[2]}; // @[FFTEngine.scala 181:115]
  wire  addrSBankSelPrePre_0_0 = _addrSBankSelPrePre_sum_T_7 + _addrSBankSelPrePre_sum_T_8[0]; // @[FFTEngine.scala 181:107]
  wire [1:0] _GEN_94 = {{1'd0}, addrSBankSelPrePre_0_0}; // @[FFTEngine.scala 187:132]
  wire [2:0] _addrSBankSelPre_T_1 = {{1'd0}, _GEN_94}; // @[FFTEngine.scala 187:132]
  wire  addrSBankSelPre_0 = _addrSBankSelPre_T_1[0]; // @[FFTEngine.scala 187:148]
  wire  addrSBankSel_0 = _radixInit_T_1 & addrSBankSelPre_0; // @[FFTEngine.scala 191:27]
  wire [1:0] _addrTBankSelPrePre_sum_T_2 = {{1'd0}, addrT_0[0]}; // @[FFTEngine.scala 181:107]
  wire [2:0] _addrTBankSelPrePre_sum_T_4 = {{1'd0}, addrT_0[2:1]}; // @[FFTEngine.scala 181:115]
  wire  _addrTBankSelPrePre_sum_T_7 = _addrTBankSelPrePre_sum_T_2[0] + _addrTBankSelPrePre_sum_T_4[0]; // @[FFTEngine.scala 181:107]
  wire [2:0] _addrTBankSelPrePre_sum_T_8 = {{2'd0}, addrT_0[2]}; // @[FFTEngine.scala 181:115]
  wire  addrTBankSelPrePre_0_0 = _addrTBankSelPrePre_sum_T_7 + _addrTBankSelPrePre_sum_T_8[0]; // @[FFTEngine.scala 181:107]
  wire [1:0] _GEN_97 = {{1'd0}, addrTBankSelPrePre_0_0}; // @[FFTEngine.scala 203:132]
  wire [2:0] _addrTBankSelPre_T_1 = {{1'd0}, _GEN_97}; // @[FFTEngine.scala 203:132]
  wire  addrTBankSelPre_0 = _addrTBankSelPre_T_1[0]; // @[FFTEngine.scala 203:148]
  wire  addrTBankSel_0 = _radixInit_T_1 ? addrTBankSelPre_0 : 1'h1; // @[FFTEngine.scala 207:27]
  reg  addrTBankSel1c_0_r; // @[Reg.scala 35:20]
  reg  addrTBankSel2c_0_r; // @[Reg.scala 35:20]
  reg  addrTBankSel3c_0_r; // @[Reg.scala 35:20]
  reg  kernelState1c; // @[Reg.scala 35:20]
  reg  kernelState2c; // @[Reg.scala 35:20]
  reg  kernelState3c; // @[Reg.scala 35:20]
  wire [15:0] dataInRPre_0 = srcBuffer ? io_readDataSram1Bank_0[15:0] : io_readDataSram0Bank_0[15:0]; // @[FFTEngine.scala 258:29]
  wire [15:0] dataInIPre_0 = srcBuffer ? io_readDataSram1Bank_0[31:16] : io_readDataSram0Bank_0[31:16]; // @[FFTEngine.scala 259:29]
  wire [15:0] dataInRPre_1 = srcBuffer ? io_readDataSram1Bank_1[15:0] : io_readDataSram0Bank_1[15:0]; // @[FFTEngine.scala 258:29]
  wire [15:0] dataInIPre_1 = srcBuffer ? io_readDataSram1Bank_1[31:16] : io_readDataSram0Bank_1[31:16]; // @[FFTEngine.scala 259:29]
  reg [1:0] addrS1c; // @[Reg.scala 35:20]
  reg [1:0] addrS2c; // @[Reg.scala 35:20]
  reg [1:0] addrS3c; // @[Reg.scala 35:20]
  reg [1:0] addrT1c; // @[Reg.scala 35:20]
  reg [1:0] addrT2c; // @[Reg.scala 35:20]
  reg [1:0] addrT3c; // @[Reg.scala 35:20]
  wire [15:0] _GEN_34 = addrSBankSel_0 ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 277:{39,39}]
  wire [15:0] _dataInSRRnd_T_2 = {_GEN_34[15],_GEN_34[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSRRnd_T_5 = {15'h0,_GEN_34[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInSRRnd = _dataInSRRnd_T_2 + _dataInSRRnd_T_5; // @[FFTEngine.scala 277:90]
  wire [15:0] _GEN_36 = addrSBankSel_0 ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 278:{39,39}]
  wire [15:0] _dataInSIRnd_T_2 = {_GEN_36[15],_GEN_36[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInSIRnd_T_5 = {15'h0,_GEN_36[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInSIRnd = _dataInSIRnd_T_2 + _dataInSIRnd_T_5; // @[FFTEngine.scala 278:90]
  wire [15:0] _GEN_38 = addrTBankSel_0 ? dataInRPre_1 : dataInRPre_0; // @[FFTEngine.scala 279:{39,39}]
  wire [15:0] _dataInTRRnd_T_2 = {_GEN_38[15],_GEN_38[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTRRnd_T_5 = {15'h0,_GEN_38[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInTRRnd = _dataInTRRnd_T_2 + _dataInTRRnd_T_5; // @[FFTEngine.scala 279:90]
  wire [15:0] _GEN_40 = addrTBankSel_0 ? dataInIPre_1 : dataInIPre_0; // @[FFTEngine.scala 280:{39,39}]
  wire [15:0] _dataInTIRnd_T_2 = {_GEN_40[15],_GEN_40[15:1]}; // @[Cat.scala 33:92]
  wire [15:0] _dataInTIRnd_T_5 = {15'h0,_GEN_40[0]}; // @[Cat.scala 33:92]
  wire [15:0] dataInTIRnd = _dataInTIRnd_T_2 + _dataInTIRnd_T_5; // @[FFTEngine.scala 280:90]
  wire  _GEN_42 = 2'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 282:{29,29}]
  wire  _GEN_43 = 2'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_42; // @[FFTEngine.scala 282:{29,29}]
  reg [2:0] nk1c; // @[Reg.scala 35:20]
  reg [15:0] dataInSR2c; // @[Reg.scala 35:20]
  reg [15:0] dataInSI2c; // @[Reg.scala 35:20]
  reg [15:0] dataInTR2c; // @[Reg.scala 35:20]
  reg [15:0] dataInTI2c; // @[Reg.scala 35:20]
  wire [16:0] _wR2c_T_1 = {fftTwiddle_io_wR,5'h0}; // @[Cat.scala 33:92]
  reg [16:0] wR2c; // @[Reg.scala 35:20]
  wire [16:0] _wI2c_T_1 = {fftTwiddle_io_wI,5'h0}; // @[Cat.scala 33:92]
  reg [16:0] wI2c; // @[Reg.scala 35:20]
  wire [1:0] _addTRI_T_2 = dataInTR2c[15] ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [17:0] _addTRI_T_3 = {_addTRI_T_2,dataInTR2c}; // @[Cat.scala 33:92]
  wire [1:0] _addTRI_T_6 = dataInTI2c[15] ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [17:0] _addTRI_T_7 = {_addTRI_T_6,dataInTI2c}; // @[Cat.scala 33:92]
  wire [17:0] _addWRI_T_1 = {wR2c[16],wR2c}; // @[Cat.scala 33:92]
  wire [17:0] _addWRI_T_3 = {wI2c[16],wI2c}; // @[Cat.scala 33:92]
  wire [16:0] _multRPre_T_2 = dataInTR2c[15] ? 17'h1ffff : 17'h0; // @[Bitwise.scala 77:12]
  wire [32:0] _multRPre_T_3 = {_multRPre_T_2,dataInTR2c}; // @[Cat.scala 33:92]
  wire [15:0] _multRPre_T_6 = wR2c[16] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [32:0] _multRPre_T_7 = {_multRPre_T_6,wR2c}; // @[Cat.scala 33:92]
  wire [65:0] multRPre = _multRPre_T_3 * _multRPre_T_7; // @[FFTEngine.scala 320:82]
  wire [32:0] multR = multRPre[32:0]; // @[FFTEngine.scala 321:29]
  wire [16:0] _multIPre_T_2 = dataInTI2c[15] ? 17'h1ffff : 17'h0; // @[Bitwise.scala 77:12]
  wire [32:0] _multIPre_T_3 = {_multIPre_T_2,dataInTR2c}; // @[Cat.scala 33:92]
  wire [15:0] _multIPre_T_6 = wI2c[16] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [32:0] _multIPre_T_7 = {_multIPre_T_6,wI2c}; // @[Cat.scala 33:92]
  wire [65:0] multIPre = _multIPre_T_3 * _multIPre_T_7; // @[FFTEngine.scala 323:82]
  wire [32:0] multI = multIPre[32:0]; // @[FFTEngine.scala 324:29]
  wire [16:0] _qR2c_T_2 = {multR[32],multR[30:15]}; // @[Cat.scala 33:92]
  wire [16:0] _qR2c_T_5 = {multI[32],multI[30:15]}; // @[Cat.scala 33:92]
  wire [16:0] qR2c = _qR2c_T_2 - _qR2c_T_5; // @[FFTEngine.scala 326:106]
  wire [16:0] _qI2c_T_2 = {fftMultiply_io_product[35],fftMultiply_io_product[30:15]}; // @[Cat.scala 33:92]
  wire [16:0] _qI2c_T_7 = _qI2c_T_2 - _qR2c_T_2; // @[FFTEngine.scala 327:110]
  wire [16:0] qI2c = _qI2c_T_7 - _qR2c_T_5; // @[FFTEngine.scala 327:198]
  reg [15:0] sR3c; // @[Reg.scala 35:20]
  reg [15:0] sI3c; // @[Reg.scala 35:20]
  reg [16:0] qR3c; // @[Reg.scala 35:20]
  reg [16:0] qI3c; // @[Reg.scala 35:20]
  wire [1:0] _xR3cPre_T_2 = sR3c[15] ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [17:0] _xR3cPre_T_3 = {_xR3cPre_T_2,sR3c}; // @[Cat.scala 33:92]
  wire [17:0] _xR3cPre_T_5 = {qR3c[16],qR3c}; // @[Cat.scala 33:92]
  wire [17:0] xR3cPre = _xR3cPre_T_3 + _xR3cPre_T_5; // @[FFTEngine.scala 335:66]
  wire [1:0] _xI3cPre_T_2 = sI3c[15] ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [17:0] _xI3cPre_T_3 = {_xI3cPre_T_2,sI3c}; // @[Cat.scala 33:92]
  wire [17:0] _xI3cPre_T_5 = {qI3c[16],qI3c}; // @[Cat.scala 33:92]
  wire [17:0] xI3cPre = _xI3cPre_T_3 + _xI3cPre_T_5; // @[FFTEngine.scala 336:66]
  wire [14:0] _xR3c_T_6 = xR3cPre[17] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xR3c_T_7 = ~_xR3c_T_6; // @[FFTEngine.scala 338:112]
  wire [15:0] _xR3c_T_8 = {xR3cPre[17],_xR3c_T_7}; // @[Cat.scala 33:92]
  wire [15:0] _xR3c_T_19 = xR3cPre[17] ^ xR3cPre[15] ? _xR3c_T_8 : xR3cPre[15:0]; // @[FFTEngine.scala 338:168]
  wire [15:0] xR3c = xR3cPre[17] ^ xR3cPre[16] ? _xR3c_T_8 : _xR3c_T_19; // @[FFTEngine.scala 338:23]
  wire [14:0] _xI3c_T_6 = xI3cPre[17] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xI3c_T_7 = ~_xI3c_T_6; // @[FFTEngine.scala 339:112]
  wire [15:0] _xI3c_T_8 = {xI3cPre[17],_xI3c_T_7}; // @[Cat.scala 33:92]
  wire [15:0] _xI3c_T_19 = xI3cPre[17] ^ xI3cPre[15] ? _xI3c_T_8 : xI3cPre[15:0]; // @[FFTEngine.scala 339:168]
  wire [15:0] xI3c = xI3cPre[17] ^ xI3cPre[16] ? _xI3c_T_8 : _xI3c_T_19; // @[FFTEngine.scala 339:23]
  wire [17:0] yR3cPre = _xR3cPre_T_3 - _xR3cPre_T_5; // @[FFTEngine.scala 341:66]
  wire [17:0] yI3cPre = _xI3cPre_T_3 - _xI3cPre_T_5; // @[FFTEngine.scala 342:66]
  wire [14:0] _yR3c_T_6 = yR3cPre[17] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yR3c_T_7 = ~_yR3c_T_6; // @[FFTEngine.scala 344:112]
  wire [15:0] _yR3c_T_8 = {yR3cPre[17],_yR3c_T_7}; // @[Cat.scala 33:92]
  wire [15:0] _yR3c_T_19 = yR3cPre[17] ^ yR3cPre[15] ? _yR3c_T_8 : yR3cPre[15:0]; // @[FFTEngine.scala 344:168]
  wire [15:0] yR3c = yR3cPre[17] ^ yR3cPre[16] ? _yR3c_T_8 : _yR3c_T_19; // @[FFTEngine.scala 344:23]
  wire [14:0] _yI3c_T_6 = yI3cPre[17] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yI3c_T_7 = ~_yI3c_T_6; // @[FFTEngine.scala 345:112]
  wire [15:0] _yI3c_T_8 = {yI3cPre[17],_yI3c_T_7}; // @[Cat.scala 33:92]
  wire [15:0] _yI3c_T_19 = yI3cPre[17] ^ yI3cPre[15] ? _yI3c_T_8 : yI3cPre[15:0]; // @[FFTEngine.scala 345:168]
  wire [15:0] yI3c = yI3cPre[17] ^ yI3cPre[16] ? _yI3c_T_8 : _yI3c_T_19; // @[FFTEngine.scala 345:23]
  wire  _io_writeEnableSram0Bank_T = srcBuffer & kernelState3c; // @[FFTEngine.scala 347:65]
  wire  _io_writeEnableSram1Bank_T_1 = _srcBufferNext_T_1 & kernelState3c; // @[FFTEngine.scala 349:66]
  wire [1:0] _GEN_65 = ~addrTBankSel_0 ? addrT_0[1:0] : addrS_0[1:0]; // @[FFTEngine.scala 354:{47,47}]
  wire [1:0] _GEN_66 = addrTBankSel_0 ? addrT_0[1:0] : addrS_0[1:0]; // @[FFTEngine.scala 354:{47,47}]
  wire [1:0] _GEN_69 = ~addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 356:{49,49}]
  wire [1:0] _GEN_70 = addrTBankSel3c_0_r ? addrT3c : addrS3c; // @[FFTEngine.scala 356:{49,49}]
  wire [31:0] writeDataSram0SPre = {xI3c,xR3c}; // @[Cat.scala 33:92]
  wire [31:0] writeDataSram0TPre = {yI3c,yR3c}; // @[Cat.scala 33:92]
  reg  fftDoneReg; // @[FFTEngine.scala 374:29]
  FFTTwiddle fftTwiddle ( // @[FFTEngine.scala 293:32]
    .io_nk(fftTwiddle_io_nk),
    .io_twiLutCaseIndex(fftTwiddle_io_twiLutCaseIndex),
    .io_wR(fftTwiddle_io_wR),
    .io_wI(fftTwiddle_io_wI)
  );
  FFTMultiply fftMultiply ( // @[FFTEngine.scala 314:33]
    .io_a(fftMultiply_io_a),
    .io_b(fftMultiply_io_b),
    .io_product(fftMultiply_io_product)
  );
  assign io_readEnableSram0Bank_0 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 227:86]
  assign io_readEnableSram0Bank_1 = _radixInit_T_1 & _srcBufferNext_T_1; // @[FFTEngine.scala 227:86]
  assign io_readEnableSram1Bank_0 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 228:86]
  assign io_readEnableSram1Bank_1 = _radixInit_T_1 & srcBuffer; // @[FFTEngine.scala 228:86]
  assign io_writeDataSram0Bank_0 = ~addrTBankSel3c_0_r ? writeDataSram0TPre : writeDataSram0SPre; // @[FFTEngine.scala 368:{50,50}]
  assign io_writeDataSram0Bank_1 = addrTBankSel3c_0_r ? writeDataSram0TPre : writeDataSram0SPre; // @[FFTEngine.scala 368:{50,50}]
  assign io_writeDataSram1Bank_0 = ~addrTBankSel3c_0_r ? writeDataSram0TPre : writeDataSram0SPre; // @[FFTEngine.scala 370:{50,50}]
  assign io_writeDataSram1Bank_1 = addrTBankSel3c_0_r ? writeDataSram0TPre : writeDataSram0SPre; // @[FFTEngine.scala 370:{50,50}]
  assign io_writeEnableSram0Bank_0 = ~addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 348:{52,52}]
  assign io_writeEnableSram0Bank_1 = addrTBankSel3c_0_r ? _io_writeEnableSram0Bank_T : _io_writeEnableSram0Bank_T; // @[FFTEngine.scala 348:{52,52}]
  assign io_writeEnableSram1Bank_0 = ~addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 350:{52,52}]
  assign io_writeEnableSram1Bank_1 = addrTBankSel3c_0_r ? _io_writeEnableSram1Bank_T_1 : _io_writeEnableSram1Bank_T_1; // @[FFTEngine.scala 350:{52,52}]
  assign io_addrSram0Bank_0 = _srcBufferNext_T_1 ? _GEN_65 : _GEN_69; // @[FFTEngine.scala 352:33]
  assign io_addrSram0Bank_1 = _srcBufferNext_T_1 ? _GEN_66 : _GEN_70; // @[FFTEngine.scala 352:33]
  assign io_addrSram1Bank_0 = _srcBufferNext_T_1 ? _GEN_69 : _GEN_65; // @[FFTEngine.scala 352:33]
  assign io_addrSram1Bank_1 = _srcBufferNext_T_1 ? _GEN_70 : _GEN_66; // @[FFTEngine.scala 352:33]
  assign io_fftDone = fftDoneReg; // @[FFTEngine.scala 375:16]
  assign fftTwiddle_io_nk = {nk1c[1:0],1'h0}; // @[Cat.scala 33:92]
  assign fftTwiddle_io_twiLutCaseIndex = isFFT ? 2'h0 : 2'h1; // @[FFTEngine.scala 291:34]
  assign fftMultiply_io_a = _addTRI_T_3 + _addTRI_T_7; // @[FFTEngine.scala 312:65]
  assign fftMultiply_io_b = _addWRI_T_1 + _addWRI_T_3; // @[FFTEngine.scala 313:56]
  always @(posedge clock) begin
    if (reset) begin // @[FFTEngine.scala 42:27]
      stateReg <= 3'h0; // @[FFTEngine.scala 42:27]
    end else if (3'h0 == stateReg) begin // @[FFTEngine.scala 48:22]
      if (io_fftEngineKick) begin // @[FFTEngine.scala 50:36]
        stateReg <= 3'h1; // @[FFTEngine.scala 51:26]
      end
    end else if (3'h1 == stateReg) begin // @[FFTEngine.scala 48:22]
      if (radixCount == 3'h3) begin // @[FFTEngine.scala 57:46]
        stateReg <= 3'h2; // @[FFTEngine.scala 58:26]
      end
    end else if (3'h2 == stateReg) begin // @[FFTEngine.scala 48:22]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_5;
    end
    if (reset) begin // @[FFTEngine.scala 44:29]
      radixCount <= 3'h0; // @[FFTEngine.scala 44:29]
    end else if (radixInit) begin // @[FFTEngine.scala 90:21]
      radixCount <= 3'h0; // @[FFTEngine.scala 91:20]
    end else if (radixUp) begin // @[FFTEngine.scala 92:26]
      radixCount <= _radixCount_T_1; // @[FFTEngine.scala 93:20]
    end
    if (reset) begin // @[FFTEngine.scala 46:29]
      phaseCount <= 2'h0; // @[FFTEngine.scala 46:29]
    end else if (phaseInit) begin // @[FFTEngine.scala 104:21]
      phaseCount <= 2'h0; // @[FFTEngine.scala 105:20]
    end else if (_radixInit_T_9) begin // @[FFTEngine.scala 106:26]
      phaseCount <= _phaseCount_T_1; // @[FFTEngine.scala 107:20]
    end
    if (reset) begin // @[FFTEngine.scala 112:28]
      srcBuffer <= 1'h0; // @[FFTEngine.scala 112:28]
    end else if (srcUp) begin // @[FFTEngine.scala 118:17]
      srcBuffer <= srcBufferNext; // @[FFTEngine.scala 119:19]
    end
    addrTBankSel1c_0_r <= reset | addrTBankSel_0; // @[Reg.scala 35:{20,20}]
    addrTBankSel2c_0_r <= reset | addrTBankSel1c_0_r; // @[Reg.scala 35:{20,20}]
    addrTBankSel3c_0_r <= reset | addrTBankSel2c_0_r; // @[Reg.scala 35:{20,20}]
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
      addrS1c <= 2'h0; // @[Reg.scala 35:20]
    end else begin
      addrS1c <= addrS_0[1:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS2c <= 2'h0; // @[Reg.scala 35:20]
    end else begin
      addrS2c <= addrS1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrS3c <= 2'h0; // @[Reg.scala 35:20]
    end else begin
      addrS3c <= addrS2c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT1c <= 2'h0; // @[Reg.scala 35:20]
    end else begin
      addrT1c <= addrT_0[1:0];
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT2c <= 2'h0; // @[Reg.scala 35:20]
    end else begin
      addrT2c <= addrT1c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      addrT3c <= 2'h0; // @[Reg.scala 35:20]
    end else begin
      addrT3c <= addrT2c;
    end
    if (reset) begin // @[Reg.scala 35:20]
      nk1c <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      nk1c <= nk_0;
    end
    if (reset) begin // @[Reg.scala 35:20]
      dataInSR2c <= 16'h0; // @[Reg.scala 35:20]
    end else if (kernelState1c) begin // @[Reg.scala 36:18]
      if (_GEN_43) begin // @[FFTEngine.scala 282:29]
        dataInSR2c <= dataInSRRnd;
      end else if (addrSBankSel_0) begin // @[FFTEngine.scala 277:39]
        dataInSR2c <= dataInRPre_1; // @[FFTEngine.scala 277:39]
      end else begin
        dataInSR2c <= dataInRPre_0;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      dataInSI2c <= 16'h0; // @[Reg.scala 35:20]
    end else if (kernelState1c) begin // @[Reg.scala 36:18]
      if (_GEN_43) begin // @[FFTEngine.scala 283:29]
        dataInSI2c <= dataInSIRnd;
      end else if (addrSBankSel_0) begin // @[FFTEngine.scala 278:39]
        dataInSI2c <= dataInIPre_1; // @[FFTEngine.scala 278:39]
      end else begin
        dataInSI2c <= dataInIPre_0;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      dataInTR2c <= 16'h0; // @[Reg.scala 35:20]
    end else if (kernelState1c) begin // @[Reg.scala 36:18]
      if (_GEN_43) begin // @[FFTEngine.scala 284:29]
        dataInTR2c <= dataInTRRnd;
      end else if (addrTBankSel_0) begin // @[FFTEngine.scala 279:39]
        dataInTR2c <= dataInRPre_1; // @[FFTEngine.scala 279:39]
      end else begin
        dataInTR2c <= dataInRPre_0;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      dataInTI2c <= 16'h0; // @[Reg.scala 35:20]
    end else if (kernelState1c) begin // @[Reg.scala 36:18]
      if (_GEN_43) begin // @[FFTEngine.scala 285:29]
        dataInTI2c <= dataInTIRnd;
      end else if (addrTBankSel_0) begin // @[FFTEngine.scala 280:39]
        dataInTI2c <= dataInIPre_1; // @[FFTEngine.scala 280:39]
      end else begin
        dataInTI2c <= dataInIPre_0;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      wR2c <= 17'h0; // @[Reg.scala 35:20]
    end else if (kernelState1c) begin // @[Reg.scala 36:18]
      wR2c <= _wR2c_T_1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      wI2c <= 17'h0; // @[Reg.scala 35:20]
    end else if (kernelState1c) begin // @[Reg.scala 36:18]
      wI2c <= _wI2c_T_1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      sR3c <= 16'h0; // @[Reg.scala 35:20]
    end else if (kernelState2c) begin // @[Reg.scala 36:18]
      sR3c <= dataInSR2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      sI3c <= 16'h0; // @[Reg.scala 35:20]
    end else if (kernelState2c) begin // @[Reg.scala 36:18]
      sI3c <= dataInSI2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      qR3c <= 17'h0; // @[Reg.scala 35:20]
    end else if (kernelState2c) begin // @[Reg.scala 36:18]
      qR3c <= qR2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      qI3c <= 17'h0; // @[Reg.scala 35:20]
    end else if (kernelState2c) begin // @[Reg.scala 36:18]
      qI3c <= qI2c; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[FFTEngine.scala 374:29]
      fftDoneReg <= 1'h0; // @[FFTEngine.scala 374:29]
    end else begin
      fftDoneReg <= _radixInit_T_11; // @[FFTEngine.scala 374:29]
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
  radixCount = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  srcBuffer = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrTBankSel1c_0_r = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  addrTBankSel2c_0_r = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  addrTBankSel3c_0_r = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  kernelState1c = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  kernelState2c = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  kernelState3c = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  addrS1c = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  addrS2c = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  addrS3c = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  addrT1c = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  addrT2c = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  addrT3c = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  nk1c = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  dataInSR2c = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  dataInSI2c = _RAND_18[15:0];
  _RAND_19 = {1{`RANDOM}};
  dataInTR2c = _RAND_19[15:0];
  _RAND_20 = {1{`RANDOM}};
  dataInTI2c = _RAND_20[15:0];
  _RAND_21 = {1{`RANDOM}};
  wR2c = _RAND_21[16:0];
  _RAND_22 = {1{`RANDOM}};
  wI2c = _RAND_22[16:0];
  _RAND_23 = {1{`RANDOM}};
  sR3c = _RAND_23[15:0];
  _RAND_24 = {1{`RANDOM}};
  sI3c = _RAND_24[15:0];
  _RAND_25 = {1{`RANDOM}};
  qR3c = _RAND_25[16:0];
  _RAND_26 = {1{`RANDOM}};
  qI3c = _RAND_26[16:0];
  _RAND_27 = {1{`RANDOM}};
  fftDoneReg = _RAND_27[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
