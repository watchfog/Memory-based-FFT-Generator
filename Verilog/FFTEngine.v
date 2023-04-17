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
  input         io_rShiftSym,
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
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
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
  reg [15:0] sR2c; // @[Reg.scala 35:20]
  reg [15:0] sI2c; // @[Reg.scala 35:20]
  reg [15:0] qR2cProc; // @[Reg.scala 35:20]
  reg [15:0] tI2c; // @[Reg.scala 35:20]
  wire [15:0] addTRI = $signed(qR2cProc) + $signed(tI2c); // @[FFT3PipelineCalc.scala 58:23]
  wire [32:0] multS = $signed(addTRI) * 17'sh0; // @[FFT3PipelineCalc.scala 64:24]
  wire [32:0] multR = $signed(qR2cProc) * 17'sh0; // @[FFT3PipelineCalc.scala 66:25]
  wire [32:0] multI = $signed(tI2c) * 17'sh0; // @[FFT3PipelineCalc.scala 69:25]
  wire [32:0] qR2cKernel = $signed(multR) - $signed(multI); // @[FFT3PipelineCalc.scala 72:28]
  wire [32:0] _qI2cKernel_T_2 = $signed(multS) - $signed(multR); // @[FFT3PipelineCalc.scala 73:28]
  wire [32:0] qI2cKernel = $signed(_qI2cKernel_T_2) - $signed(multI); // @[FFT3PipelineCalc.scala 73:36]
  wire [15:0] qI2cProc = 16'sh0 - $signed(tI2c); // @[FFT3PipelineCalc.scala 76:20]
  reg [15:0] sR3c; // @[Reg.scala 35:20]
  reg [15:0] sI3c; // @[Reg.scala 35:20]
  reg [32:0] qR3c; // @[Reg.scala 35:20]
  reg [32:0] qI3c; // @[Reg.scala 35:20]
  wire [32:0] _GEN_11 = {{17{sR3c[15]}},sR3c}; // @[FFT3PipelineCalc.scala 87:27]
  wire [32:0] xR3cPrePre = $signed(_GEN_11) + $signed(qR3c); // @[FFT3PipelineCalc.scala 87:27]
  wire [32:0] _GEN_12 = {{17{sI3c[15]}},sI3c}; // @[FFT3PipelineCalc.scala 88:27]
  wire [32:0] xI3cPrePre = $signed(_GEN_12) + $signed(qI3c); // @[FFT3PipelineCalc.scala 88:27]
  wire [15:0] xR3cPre = xR3cPrePre[32:17]; // @[FFT3PipelineCalc.scala 90:111]
  wire [15:0] xI3cPre = xI3cPrePre[32:17]; // @[FFT3PipelineCalc.scala 91:111]
  wire [14:0] _xR3c_T_10 = xR3cPre[15] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xR3c_T_11 = ~_xR3c_T_10; // @[FFT3PipelineCalc.scala 93:173]
  wire [15:0] _xR3c_T_13 = {xR3cPre[15],_xR3c_T_11}; // @[FFT3PipelineCalc.scala 93:241]
  wire [14:0] _xI3c_T_10 = xI3cPre[15] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _xI3c_T_11 = ~_xI3c_T_10; // @[FFT3PipelineCalc.scala 94:173]
  wire [15:0] _xI3c_T_13 = {xI3cPre[15],_xI3c_T_11}; // @[FFT3PipelineCalc.scala 94:241]
  wire [32:0] yR3cPre = $signed(_GEN_11) - $signed(qR3c); // @[FFT3PipelineCalc.scala 99:24]
  wire [32:0] yI3cPre = $signed(_GEN_12) - $signed(qI3c); // @[FFT3PipelineCalc.scala 100:24]
  wire [14:0] _yR3c_T_10 = yR3cPre[32] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yR3c_T_11 = ~_yR3c_T_10; // @[FFT3PipelineCalc.scala 102:173]
  wire [15:0] _yR3c_T_13 = {yR3cPre[32],_yR3c_T_11}; // @[FFT3PipelineCalc.scala 102:241]
  wire [32:0] yR3c = sR3c[15] != qR3c[32] & sR3c[15] != yR3cPre[32] ? $signed({{17{_yR3c_T_13[15]}},_yR3c_T_13}) :
    $signed(yR3cPre); // @[FFT3PipelineCalc.scala 102:19]
  wire [14:0] _yI3c_T_10 = yI3cPre[32] ? 15'h7fff : 15'h0; // @[Bitwise.scala 77:12]
  wire [14:0] _yI3c_T_11 = ~_yI3c_T_10; // @[FFT3PipelineCalc.scala 103:173]
  wire [15:0] _yI3c_T_13 = {yI3cPre[32],_yI3c_T_11}; // @[FFT3PipelineCalc.scala 103:241]
  wire [32:0] yI3c = sI3c[15] != qI3c[32] & sI3c[15] != yI3cPre[32] ? $signed({{17{_yI3c_T_13[15]}},_yI3c_T_13}) :
    $signed(yI3cPre); // @[FFT3PipelineCalc.scala 103:19]
  assign io_dataOutSR3c = sR3c[15] == qR3c[32] & sR3c[15] != xR3cPre[15] ? $signed(_xR3c_T_13) : $signed(xR3cPre); // @[FFT3PipelineCalc.scala 93:19]
  assign io_dataOutSI3c = sI3c[15] == qI3c[32] & sI3c[15] != xI3cPre[15] ? $signed(_xI3c_T_13) : $signed(xI3cPre); // @[FFT3PipelineCalc.scala 94:19]
  assign io_dataOutTR3c = yR3c[15:0]; // @[FFT3PipelineCalc.scala 106:20]
  assign io_dataOutTI3c = yI3c[15:0]; // @[FFT3PipelineCalc.scala 107:20]
  always @(posedge clock) begin
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
      qR3c <= 33'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_procMode) begin // @[FFT3PipelineCalc.scala 78:19]
        qR3c <= {{17{qR2cProc[15]}},qR2cProc};
      end else begin
        qR3c <= qR2cKernel;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      qI3c <= 33'sh0; // @[Reg.scala 35:20]
    end else if (io_state2c) begin // @[Reg.scala 36:18]
      if (io_procMode) begin // @[FFT3PipelineCalc.scala 79:19]
        qI3c <= {{17{qI2cProc[15]}},qI2cProc};
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
  sR2c = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  sI2c = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  qR2cProc = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  tI2c = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  sR3c = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  sI3c = _RAND_5[15:0];
  _RAND_6 = {2{`RANDOM}};
  qR3c = _RAND_6[32:0];
  _RAND_7 = {2{`RANDOM}};
  qI3c = _RAND_7[32:0];
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
  input  [15:0] io_readDataSram0Bank_0_im,
  input  [15:0] io_readDataSram0Bank_0_re,
  input  [15:0] io_readDataSram0Bank_1_im,
  input  [15:0] io_readDataSram0Bank_1_re,
  input  [15:0] io_readDataSram1Bank_0_im,
  input  [15:0] io_readDataSram1Bank_0_re,
  input  [15:0] io_readDataSram1Bank_1_im,
  input  [15:0] io_readDataSram1Bank_1_re,
  output        io_readEnableSram0Bank_0,
  output        io_readEnableSram0Bank_1,
  output        io_readEnableSram1Bank_0,
  output        io_readEnableSram1Bank_1,
  output [15:0] io_writeDataSram0Bank_0_im,
  output [15:0] io_writeDataSram0Bank_0_re,
  output [15:0] io_writeDataSram0Bank_1_im,
  output [15:0] io_writeDataSram0Bank_1_re,
  output [15:0] io_writeDataSram1Bank_0_im,
  output [15:0] io_writeDataSram1Bank_0_re,
  output [15:0] io_writeDataSram1Bank_1_im,
  output [15:0] io_writeDataSram1Bank_1_re,
  output        io_writeEnableSram0Bank_0,
  output        io_writeEnableSram0Bank_1,
  output        io_writeEnableSram1Bank_0,
  output        io_writeEnableSram1Bank_1,
  output [1:0]  io_addrSram0Bank_0,
  output [1:0]  io_addrSram0Bank_1,
  output [1:0]  io_addrSram1Bank_0,
  output [1:0]  io_addrSram1Bank_1,
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
`endif // RANDOMIZE_REG_INIT
  wire  fftCalc_clock; // @[FFTEngine.scala 393:29]
  wire  fftCalc_reset; // @[FFTEngine.scala 393:29]
  wire [15:0] fftCalc_io_dataInSR; // @[FFTEngine.scala 393:29]
  wire [15:0] fftCalc_io_dataInSI; // @[FFTEngine.scala 393:29]
  wire [15:0] fftCalc_io_dataInTR; // @[FFTEngine.scala 393:29]
  wire [15:0] fftCalc_io_dataInTI; // @[FFTEngine.scala 393:29]
  wire [15:0] fftCalc_io_dataOutSR3c; // @[FFTEngine.scala 393:29]
  wire [15:0] fftCalc_io_dataOutSI3c; // @[FFTEngine.scala 393:29]
  wire [15:0] fftCalc_io_dataOutTR3c; // @[FFTEngine.scala 393:29]
  wire [15:0] fftCalc_io_dataOutTI3c; // @[FFTEngine.scala 393:29]
  wire  fftCalc_io_rShiftSym; // @[FFTEngine.scala 393:29]
  wire  fftCalc_io_procMode; // @[FFTEngine.scala 393:29]
  wire  fftCalc_io_state1c; // @[FFTEngine.scala 393:29]
  wire  fftCalc_io_state2c; // @[FFTEngine.scala 393:29]
  reg [2:0] stateReg; // @[FFTEngine.scala 46:27]
  reg [2:0] addrSProc; // @[FFTEngine.scala 48:29]
  reg [1:0] phaseCount; // @[FFTEngine.scala 50:29]
  wire  _T_2 = addrSProc == 3'h3; // @[FFTEngine.scala 61:29]
  wire [2:0] _GEN_2 = _T_2 ? 3'h3 : stateReg; // @[FFTEngine.scala 68:45 69:26 71:26]
  wire  _T_6 = phaseCount == 2'h2; // @[FFTEngine.scala 75:29]
  wire [2:0] _stateReg_T_1 = io_fftMode ? 3'h4 : 3'h7; // @[FFTEngine.scala 76:32]
  wire [2:0] _GEN_3 = phaseCount == 2'h2 ? _stateReg_T_1 : 3'h1; // @[FFTEngine.scala 75:46 76:26 78:26]
  wire [2:0] _GEN_4 = _T_2 ? 3'h5 : stateReg; // @[FFTEngine.scala 82:47 83:26 85:26]
  wire [2:0] _GEN_5 = _T_2 ? 3'h6 : stateReg; // @[FFTEngine.scala 89:46 90:26 92:26]
  wire  _T_12 = phaseCount == 2'h1; // @[FFTEngine.scala 96:29]
  wire [2:0] _stateReg_T_2 = io_fftMode ? 3'h7 : 3'h1; // @[FFTEngine.scala 97:32]
  wire [2:0] _GEN_6 = phaseCount == 2'h1 ? _stateReg_T_2 : 3'h4; // @[FFTEngine.scala 96:47 97:26 99:26]
  wire [2:0] _GEN_7 = 3'h7 == stateReg ? 3'h0 : stateReg; // @[FFTEngine.scala 103:22 52:22 46:27]
  wire [2:0] _GEN_8 = 3'h6 == stateReg ? _GEN_6 : _GEN_7; // @[FFTEngine.scala 52:22]
  wire [2:0] _GEN_9 = 3'h5 == stateReg ? _GEN_5 : _GEN_8; // @[FFTEngine.scala 52:22]
  wire [2:0] _GEN_10 = 3'h4 == stateReg ? _GEN_4 : _GEN_9; // @[FFTEngine.scala 52:22]
  wire [2:0] _GEN_11 = 3'h3 == stateReg ? _GEN_3 : _GEN_10; // @[FFTEngine.scala 52:22]
  wire  _radixInit_T = stateReg == 3'h0; // @[FFTEngine.scala 107:31]
  wire  _radixInit_T_1 = stateReg == 3'h1; // @[FFTEngine.scala 108:16]
  wire  _radixInit_T_3 = stateReg == 3'h1 & _T_2; // @[FFTEngine.scala 108:30]
  wire  _radixInit_T_4 = stateReg == 3'h0 | _radixInit_T_3; // @[FFTEngine.scala 107:45]
  wire  _radixInit_T_5 = stateReg == 3'h2; // @[FFTEngine.scala 109:16]
  wire  _radixInit_T_7 = stateReg == 3'h2 & _T_2; // @[FFTEngine.scala 109:31]
  wire  _radixInit_T_8 = _radixInit_T_4 | _radixInit_T_7; // @[FFTEngine.scala 108:63]
  wire  _radixInit_T_9 = stateReg == 3'h3; // @[FFTEngine.scala 110:15]
  wire  _radixInit_T_10 = _radixInit_T_8 | _radixInit_T_9; // @[FFTEngine.scala 109:63]
  wire  _radixInit_T_11 = stateReg == 3'h4; // @[FFTEngine.scala 111:16]
  wire  _radixInit_T_13 = stateReg == 3'h4 & _T_2; // @[FFTEngine.scala 111:28]
  wire  _radixInit_T_14 = _radixInit_T_10 | _radixInit_T_13; // @[FFTEngine.scala 110:32]
  wire  _radixInit_T_15 = stateReg == 3'h5; // @[FFTEngine.scala 112:16]
  wire  _radixInit_T_17 = stateReg == 3'h5 & _T_2; // @[FFTEngine.scala 112:29]
  wire  _radixInit_T_18 = _radixInit_T_14 | _radixInit_T_17; // @[FFTEngine.scala 111:62]
  wire  _radixInit_T_19 = stateReg == 3'h6; // @[FFTEngine.scala 113:15]
  wire  _radixInit_T_20 = _radixInit_T_18 | _radixInit_T_19; // @[FFTEngine.scala 112:62]
  wire  _radixInit_T_21 = stateReg == 3'h7; // @[FFTEngine.scala 114:15]
  wire  radixInit = _radixInit_T_20 | _radixInit_T_21; // @[FFTEngine.scala 113:30]
  wire  _radixUp_T_4 = _radixInit_T_1 | _radixInit_T_5 | _radixInit_T_11; // @[FFTEngine.scala 116:70]
  wire  radixUp = _radixUp_T_4 | _radixInit_T_15; // @[FFTEngine.scala 117:27]
  wire [2:0] _radixCount_T_1 = addrSProc + 3'h1; // @[FFTEngine.scala 123:34]
  wire  _phaseInit_T_3 = _radixInit_T_9 & _T_6; // @[FFTEngine.scala 129:33]
  wire  _phaseInit_T_4 = _radixInit_T | _phaseInit_T_3; // @[FFTEngine.scala 128:45]
  wire  _phaseInit_T_7 = _radixInit_T_19 & _T_12; // @[FFTEngine.scala 130:31]
  wire  _phaseInit_T_8 = _phaseInit_T_4 | _phaseInit_T_7; // @[FFTEngine.scala 129:65]
  wire  phaseInit = _phaseInit_T_8 | _radixInit_T_21; // @[FFTEngine.scala 130:64]
  wire  phaseUp = _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 133:46]
  wire [1:0] _phaseCount_T_1 = phaseCount + 2'h1; // @[FFTEngine.scala 138:34]
  reg  srcBuffer; // @[FFTEngine.scala 143:28]
  wire  _srcBufferNext_T_3 = ~srcBuffer; // @[FFTEngine.scala 145:79]
  wire  srcBufferNext = phaseUp & ~srcBuffer; // @[FFTEngine.scala 145:77]
  wire  srcUp = _radixInit_T | _radixInit_T_9 | _radixInit_T_19; // @[FFTEngine.scala 147:70]
  wire  readEnable = _radixInit_T_1 | _radixInit_T_11; // @[FFTEngine.scala 158:34]
  wire [1:0] radixCountTemp = addrSProc[1:0]; // @[FFTEngine.scala 160:36]
  wire [5:0] _dataTemp_T = {radixCountTemp,1'h0,radixCountTemp,1'h0}; // @[Cat.scala 33:92]
  wire [8:0] _GEN_20 = {{3'd0}, _dataTemp_T}; // @[FFTEngine.scala 204:40]
  wire [8:0] dataTemp = _GEN_20 << phaseCount; // @[FFTEngine.scala 204:40]
  wire [2:0] addrSKernelPre_0 = dataTemp[5:3]; // @[FFTEngine.scala 205:17]
  wire [5:0] _dataTemp_T_1 = {radixCountTemp,1'h1,radixCountTemp,1'h1}; // @[Cat.scala 33:92]
  wire [8:0] _GEN_21 = {{3'd0}, _dataTemp_T_1}; // @[FFTEngine.scala 204:40]
  wire [8:0] dataTemp_1 = _GEN_21 << phaseCount; // @[FFTEngine.scala 204:40]
  wire [2:0] addrTKernelPre_0 = dataTemp_1[5:3]; // @[FFTEngine.scala 205:17]
  wire [2:0] _addrTProc_T = ~addrSProc; // @[FFTEngine.scala 251:22]
  wire [2:0] addrTProc = _addrTProc_T + 3'h1; // @[FFTEngine.scala 251:34]
  wire  addrS_0_temp_0 = io_fftMode ? addrSProc[2] : addrSProc[0]; // @[FFTEngine.scala 164:26]
  wire  addrS_0_temp_1 = io_fftMode ? addrSProc[1] : addrSProc[1]; // @[FFTEngine.scala 164:26]
  wire  addrS_0_temp_2 = io_fftMode ? addrSProc[0] : addrSProc[2]; // @[FFTEngine.scala 164:26]
  wire [2:0] _addrS_0_T = {addrS_0_temp_2,addrS_0_temp_1,addrS_0_temp_0}; // @[FFTEngine.scala 165:23]
  wire  addrS_0_temp_0_1 = addrSKernelPre_0[2]; // @[FFTEngine.scala 164:34]
  wire  addrS_0_temp_1_1 = addrSKernelPre_0[1]; // @[FFTEngine.scala 164:34]
  wire [2:0] _addrS_0_T_1 = {addrSKernelPre_0[0],addrS_0_temp_1_1,addrS_0_temp_0_1}; // @[FFTEngine.scala 165:23]
  wire [2:0] addrS_0 = _radixInit_T_11 ? _addrS_0_T : _addrS_0_T_1; // @[FFTEngine.scala 257:28]
  wire  addrT_0_temp_0 = io_fftMode ? addrTProc[2] : addrTProc[0]; // @[FFTEngine.scala 164:26]
  wire  addrT_0_temp_1 = io_fftMode ? addrTProc[1] : addrTProc[1]; // @[FFTEngine.scala 164:26]
  wire  addrT_0_temp_2 = io_fftMode ? addrTProc[0] : addrTProc[2]; // @[FFTEngine.scala 164:26]
  wire [2:0] _addrT_0_T = {addrT_0_temp_2,addrT_0_temp_1,addrT_0_temp_0}; // @[FFTEngine.scala 165:23]
  wire  addrT_0_temp_0_1 = addrTKernelPre_0[2]; // @[FFTEngine.scala 164:34]
  wire  addrT_0_temp_1_1 = addrTKernelPre_0[1]; // @[FFTEngine.scala 164:34]
  wire [2:0] _addrT_0_T_1 = {addrTKernelPre_0[0],addrT_0_temp_1_1,addrT_0_temp_0_1}; // @[FFTEngine.scala 165:23]
  wire [2:0] addrT_0 = _radixInit_T_11 ? _addrT_0_T : _addrT_0_T_1; // @[FFTEngine.scala 258:28]
  wire  sameAddr = addrS_0 == addrT_0; // @[FFTEngine.scala 265:29]
  wire [1:0] _addrSBankSelKernelPrePre_sum_T_2 = {{1'd0}, addrS_0[0]}; // @[FFTEngine.scala 268:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_4 = {{1'd0}, addrS_0[2:1]}; // @[FFTEngine.scala 268:115]
  wire  _addrSBankSelKernelPrePre_sum_T_7 = _addrSBankSelKernelPrePre_sum_T_2[0] + _addrSBankSelKernelPrePre_sum_T_4[0]; // @[FFTEngine.scala 268:107]
  wire [2:0] _addrSBankSelKernelPrePre_sum_T_8 = {{2'd0}, addrS_0[2]}; // @[FFTEngine.scala 268:115]
  wire  addrSBankSelKernelPrePre_0_0 = _addrSBankSelKernelPrePre_sum_T_7 + _addrSBankSelKernelPrePre_sum_T_8[0]; // @[FFTEngine.scala 268:107]
  wire [1:0] _GEN_167 = {{1'd0}, addrSBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 274:144]
  wire [2:0] _addrSBankSelKernelPre_T_1 = {{1'd0}, _GEN_167}; // @[FFTEngine.scala 274:144]
  wire  addrSBankSelKernelPre_0 = _addrSBankSelKernelPre_T_1[0]; // @[FFTEngine.scala 274:160]
  wire [1:0] _addrTBankSelKernelPrePre_sum_T_2 = {{1'd0}, addrT_0[0]}; // @[FFTEngine.scala 268:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_4 = {{1'd0}, addrT_0[2:1]}; // @[FFTEngine.scala 268:115]
  wire  _addrTBankSelKernelPrePre_sum_T_7 = _addrTBankSelKernelPrePre_sum_T_2[0] + _addrTBankSelKernelPrePre_sum_T_4[0]; // @[FFTEngine.scala 268:107]
  wire [2:0] _addrTBankSelKernelPrePre_sum_T_8 = {{2'd0}, addrT_0[2]}; // @[FFTEngine.scala 268:115]
  wire  addrTBankSelKernelPrePre_0_0 = _addrTBankSelKernelPrePre_sum_T_7 + _addrTBankSelKernelPrePre_sum_T_8[0]; // @[FFTEngine.scala 268:107]
  wire [1:0] _GEN_170 = {{1'd0}, addrTBankSelKernelPrePre_0_0}; // @[FFTEngine.scala 280:144]
  wire [2:0] _addrTBankSelKernelPre_T_1 = {{1'd0}, _GEN_170}; // @[FFTEngine.scala 280:144]
  wire  addrTBankSelKernelPre_0 = _addrTBankSelKernelPre_T_1[0]; // @[FFTEngine.scala 280:160]
  wire  addrSBankSelKernel_0 = _radixInit_T_1 & addrSBankSelKernelPre_0; // @[FFTEngine.scala 285:27 286:35 289:35]
  wire  addrTBankSelKernel_0 = _radixInit_T_1 ? addrTBankSelKernelPre_0 : 1'h1; // @[FFTEngine.scala 285:27 287:35 290:35]
  wire  addrSBankSelProcPre_0 = addrS_0[0] ^ addrS_0[2]; // @[FFTEngine.scala 300:51]
  wire  addrTBankSelProcPre_0 = addrT_0[0] ^ addrT_0[2]; // @[FFTEngine.scala 301:51]
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
  wire [15:0] dataInPre_0_im = srcBuffer ? $signed(io_readDataSram1Bank_0_im) : $signed(io_readDataSram0Bank_0_im); // @[FFTEngine.scala 359:28]
  wire [15:0] dataInPre_0_re = srcBuffer ? $signed(io_readDataSram1Bank_0_re) : $signed(io_readDataSram0Bank_0_re); // @[FFTEngine.scala 359:28]
  wire [15:0] dataInPre_1_im = srcBuffer ? $signed(io_readDataSram1Bank_1_im) : $signed(io_readDataSram0Bank_1_im); // @[FFTEngine.scala 359:28]
  wire [15:0] dataInPre_1_re = srcBuffer ? $signed(io_readDataSram1Bank_1_re) : $signed(io_readDataSram0Bank_1_re); // @[FFTEngine.scala 359:28]
  reg [1:0] addrS1c; // @[Reg.scala 35:20]
  reg [1:0] addrS2c; // @[Reg.scala 35:20]
  reg [1:0] addrS3c; // @[Reg.scala 35:20]
  reg [1:0] addrT1c; // @[Reg.scala 35:20]
  reg [1:0] addrT2c; // @[Reg.scala 35:20]
  reg [1:0] addrT3c; // @[Reg.scala 35:20]
  wire  _addrSBankSel_T_1 = _radixInit_T_11 ? addrSBankSelProcPre_0 : addrSBankSelKernel_0; // @[FFTEngine.scala 383:32]
  wire  _addrTBankSel_T_1 = _radixInit_T_11 ? addrTBankSelProcPre_0 : addrTBankSelKernel_0; // @[FFTEngine.scala 384:32]
  wire  _addrSBankSel_T_2 = phaseCount == 2'h0; // @[FFTEngine.scala 386:72]
  wire  _addrSBankSel_T_4 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0; // @[FFTEngine.scala 386:43]
  wire  _addrSBankSel_T_5 = _radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0 ? addrSBankSelProcPre_0 :
    addrSBankSelKernel_0; // @[FFTEngine.scala 386:32]
  wire  _addrTBankSel_T_5 = _addrSBankSel_T_4 ? addrTBankSelProcPre_0 : addrTBankSelKernel_0; // @[FFTEngine.scala 387:32]
  wire  addrSBankSel = io_fftMode ? _addrSBankSel_T_1 : _addrSBankSel_T_5; // @[FFTEngine.scala 382:21 383:26 386:26]
  wire  addrTBankSel = io_fftMode ? _addrTBankSel_T_1 : _addrTBankSel_T_5; // @[FFTEngine.scala 382:21 384:26 387:26]
  reg  addrSBankSel1c; // @[Reg.scala 35:20]
  reg  addrTBankSel1c; // @[Reg.scala 35:20]
  wire  _fftCalc_io_dataInSI_T_1 = sameAddr1c & _T_12; // @[FFTEngine.scala 395:47]
  wire [15:0] _GEN_56 = addrSBankSel1c ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 395:{35,35}]
  wire [15:0] _GEN_58 = addrTBankSel1c ? $signed(dataInPre_1_im) : $signed(dataInPre_0_im); // @[FFTEngine.scala 396:{35,35}]
  wire [15:0] _GEN_60 = addrTBankSel1c ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 396:{35,35}]
  wire  _GEN_64 = 2'h1 == phaseCount ? io_fftRShiftP0_1 : io_fftRShiftP0_0; // @[FFTEngine.scala 399:{36,36}]
  wire  _GEN_65 = 2'h2 == phaseCount ? io_fftRShiftP0_2 : _GEN_64; // @[FFTEngine.scala 399:{36,36}]
  wire [15:0] _writeDataTRPre3c_T_3 = 16'sh0 - $signed(fftCalc_io_dataOutTI3c); // @[FFTEngine.scala 406:132]
  wire [15:0] _writeDataTRPre3c_T_4 = io_fftMode ? $signed(fftCalc_io_dataOutTI3c) : $signed(_writeDataTRPre3c_T_3); // @[FFTEngine.scala 406:100]
  wire [15:0] _writeDataTRPre3c_T_5 = _T_12 ? $signed(fftCalc_io_dataOutTR3c) : $signed(_writeDataTRPre3c_T_4); // @[FFTEngine.scala 406:52]
  wire [15:0] writeDataTRPre3c = procState3c ? $signed(_writeDataTRPre3c_T_5) : $signed(fftCalc_io_dataOutTR3c); // @[FFTEngine.scala 406:35]
  wire [15:0] _writeDataTIPre3c_T_6 = 16'sh0 - $signed(fftCalc_io_dataOutTR3c); // @[FFTEngine.scala 407:109]
  wire [15:0] _writeDataTIPre3c_T_7 = io_fftMode ? $signed(_writeDataTIPre3c_T_6) : $signed(fftCalc_io_dataOutTR3c); // @[FFTEngine.scala 407:101]
  wire [15:0] _writeDataTIPre3c_T_8 = _T_12 ? $signed(_writeDataTRPre3c_T_3) : $signed(_writeDataTIPre3c_T_7); // @[FFTEngine.scala 407:52]
  wire [15:0] writeDataTIPre3c = procState3c ? $signed(_writeDataTIPre3c_T_8) : $signed(fftCalc_io_dataOutTI3c); // @[FFTEngine.scala 407:35]
  wire  _addrSBankSel3c_T_2 = procState3c | kernelState3c & _T_6; // @[FFTEngine.scala 413:47]
  wire  _addrSBankSel3c_T_3 = procState3c | kernelState3c & _T_6 ? addrSBankSelProc3c_0_r : addrSBankSelKernel3c_0_r; // @[FFTEngine.scala 413:34]
  wire  _addrTBankSel3c_T_3 = _addrSBankSel3c_T_2 ? addrTBankSelProc3c_0_r : addrTBankSelKernel3c_0_r; // @[FFTEngine.scala 414:34]
  wire  _addrSBankSel3c_T_4 = procState3c ? addrSBankSelProc3c_0_r : addrSBankSelKernel3c_0_r; // @[FFTEngine.scala 416:34]
  wire  _addrTBankSel3c_T_4 = procState3c ? addrTBankSelProc3c_0_r : addrTBankSelKernel3c_0_r; // @[FFTEngine.scala 417:34]
  wire  addrSBankSel3c = io_fftMode ? _addrSBankSel3c_T_3 : _addrSBankSel3c_T_4; // @[FFTEngine.scala 412:21 413:28 416:28]
  wire  addrTBankSel3c = io_fftMode ? _addrTBankSel3c_T_3 : _addrTBankSel3c_T_4; // @[FFTEngine.scala 412:21 414:28 417:28]
  wire  _GEN_68 = (~addrSBankSelProc3c_0_r | ~addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 423:94 424:52 427:52]
  wire  _GEN_69 = (~addrSBankSelProc3c_0_r | ~addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c); // @[FFTEngine.scala 423:94 425:52 428:52]
  wire  _GEN_72 = (addrSBankSelProc3c_0_r | addrTBankSelProc3c_0_r) & (srcBuffer & procState3c); // @[FFTEngine.scala 423:94 424:52 427:52]
  wire  _GEN_73 = (addrSBankSelProc3c_0_r | addrTBankSelProc3c_0_r) & (_srcBufferNext_T_3 & procState3c); // @[FFTEngine.scala 423:94 425:52 428:52]
  wire [1:0] _GEN_78 = ~addrSBankSel ? addrS_0[1:0] : addrT_0[1:0]; // @[FFTEngine.scala 440:{48,48}]
  wire [1:0] _GEN_79 = addrSBankSel ? addrS_0[1:0] : addrT_0[1:0]; // @[FFTEngine.scala 440:{48,48}]
  wire [1:0] _GEN_100 = ~_radixInit_T_11 ? _GEN_78 : _GEN_78; // @[FFTEngine.scala 437:26]
  wire [1:0] _GEN_101 = ~_radixInit_T_11 ? _GEN_79 : _GEN_79; // @[FFTEngine.scala 437:26]
  wire [1:0] _GEN_104 = ~addrTBankSel3c ? addrT3c : _GEN_100; // @[FFTEngine.scala 459:{50,50}]
  wire [1:0] _GEN_105 = addrTBankSel3c ? addrT3c : _GEN_101; // @[FFTEngine.scala 459:{50,50}]
  wire [1:0] _GEN_106 = ~addrSBankSel3c ? addrS3c : _GEN_104; // @[FFTEngine.scala 460:{50,50}]
  wire [1:0] _GEN_107 = addrSBankSel3c ? addrS3c : _GEN_105; // @[FFTEngine.scala 460:{50,50}]
  wire [1:0] _GEN_112 = _srcBufferNext_T_3 ? _GEN_106 : _GEN_100; // @[FFTEngine.scala 458:37]
  wire [1:0] _GEN_113 = _srcBufferNext_T_3 ? _GEN_107 : _GEN_101; // @[FFTEngine.scala 458:37]
  wire [1:0] _GEN_114 = _srcBufferNext_T_3 ? _GEN_100 : _GEN_106; // @[FFTEngine.scala 458:37]
  wire [1:0] _GEN_115 = _srcBufferNext_T_3 ? _GEN_101 : _GEN_107; // @[FFTEngine.scala 458:37]
  wire [14:0] _writeDataS3c_re_T = fftCalc_io_dataOutSR3c[15:1]; // @[FFTEngine.scala 487:53]
  wire [14:0] _writeDataS3c_im_T = writeDataTRPre3c[15:1]; // @[FFTEngine.scala 488:53]
  wire [15:0] _GEN_132 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_re_T[14]}},_writeDataS3c_re_T}) : $signed(
    fftCalc_io_dataOutSR3c); // @[FFTEngine.scala 486:55 487:33 491:33]
  wire [15:0] _GEN_133 = ~io_fftMode & _T_12 ? $signed({{1{_writeDataS3c_im_T[14]}},_writeDataS3c_im_T}) : $signed(
    fftCalc_io_dataOutSI3c); // @[FFTEngine.scala 486:55 488:33 492:33]
  wire [15:0] _GEN_137 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataTRPre3c) : $signed(_GEN_133); // @[FFTEngine.scala 482:47 484:33]
  wire [15:0] writeDataS3c_im = sameAddr3c ? $signed(_GEN_137) : $signed(fftCalc_io_dataOutSI3c); // @[FFTEngine.scala 481:26 498:29]
  wire [15:0] _GEN_134 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_im) : $signed(writeDataTIPre3c); // @[FFTEngine.scala 486:55 489:30 494:33]
  wire [15:0] _GEN_136 = io_fftMode & _addrSBankSel_T_2 ? $signed(fftCalc_io_dataOutSR3c) : $signed(_GEN_132); // @[FFTEngine.scala 482:47 483:33]
  wire [15:0] writeDataS3c_re = sameAddr3c ? $signed(_GEN_136) : $signed(fftCalc_io_dataOutSR3c); // @[FFTEngine.scala 481:26 497:29]
  wire [15:0] _GEN_135 = ~io_fftMode & _T_12 ? $signed(writeDataS3c_re) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 486:55 489:30 493:33]
  wire [15:0] _GEN_138 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_im) : $signed(_GEN_134); // @[FFTEngine.scala 482:47 485:30]
  wire [15:0] _GEN_139 = io_fftMode & _addrSBankSel_T_2 ? $signed(writeDataS3c_re) : $signed(_GEN_135); // @[FFTEngine.scala 482:47 485:30]
  wire [15:0] writeDataT3c_im = sameAddr3c ? $signed(_GEN_138) : $signed(writeDataTIPre3c); // @[FFTEngine.scala 481:26 500:29]
  wire [15:0] writeDataT3c_re = sameAddr3c ? $signed(_GEN_139) : $signed(writeDataTRPre3c); // @[FFTEngine.scala 481:26 499:29]
  wire [15:0] _GEN_146 = ~addrSBankSel3c ? $signed(writeDataS3c_im) : $signed(writeDataT3c_im); // @[FFTEngine.scala 506:50 507:50]
  wire [15:0] _GEN_147 = ~addrSBankSel3c ? $signed(writeDataS3c_re) : $signed(writeDataT3c_re); // @[FFTEngine.scala 506:50 507:50]
  wire [15:0] _GEN_156 = addrSBankSel3c ? $signed(writeDataS3c_im) : $signed(writeDataT3c_im); // @[FFTEngine.scala 506:50 507:50]
  wire [15:0] _GEN_157 = addrSBankSel3c ? $signed(writeDataS3c_re) : $signed(writeDataT3c_re); // @[FFTEngine.scala 506:50 507:50]
  reg  fftDoneReg; // @[FFTEngine.scala 527:29]
  FFT3PipelineCalc fftCalc ( // @[FFTEngine.scala 393:29]
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
    .io_rShiftSym(fftCalc_io_rShiftSym),
    .io_procMode(fftCalc_io_procMode),
    .io_state1c(fftCalc_io_state1c),
    .io_state2c(fftCalc_io_state2c)
  );
  assign io_readEnableSram0Bank_0 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 352:49]
  assign io_readEnableSram0Bank_1 = readEnable & _srcBufferNext_T_3; // @[FFTEngine.scala 352:49]
  assign io_readEnableSram1Bank_0 = readEnable & srcBuffer; // @[FFTEngine.scala 353:49]
  assign io_readEnableSram1Bank_1 = readEnable & srcBuffer; // @[FFTEngine.scala 353:49]
  assign io_writeDataSram0Bank_0_im = procState3c ? $signed(_GEN_146) : $signed(_GEN_146); // @[FFTEngine.scala 504:30]
  assign io_writeDataSram0Bank_0_re = procState3c ? $signed(_GEN_147) : $signed(_GEN_147); // @[FFTEngine.scala 504:30]
  assign io_writeDataSram0Bank_1_im = procState3c ? $signed(_GEN_156) : $signed(_GEN_156); // @[FFTEngine.scala 504:30]
  assign io_writeDataSram0Bank_1_re = procState3c ? $signed(_GEN_157) : $signed(_GEN_157); // @[FFTEngine.scala 504:30]
  assign io_writeDataSram1Bank_0_im = procState3c ? $signed(_GEN_146) : $signed(_GEN_146); // @[FFTEngine.scala 504:30]
  assign io_writeDataSram1Bank_0_re = procState3c ? $signed(_GEN_147) : $signed(_GEN_147); // @[FFTEngine.scala 504:30]
  assign io_writeDataSram1Bank_1_im = procState3c ? $signed(_GEN_156) : $signed(_GEN_156); // @[FFTEngine.scala 504:30]
  assign io_writeDataSram1Bank_1_re = procState3c ? $signed(_GEN_157) : $signed(_GEN_157); // @[FFTEngine.scala 504:30]
  assign io_writeEnableSram0Bank_0 = procState3c ? _GEN_68 : srcBuffer & kernelState3c; // @[FFTEngine.scala 422:34 431:48]
  assign io_writeEnableSram0Bank_1 = procState3c ? _GEN_72 : srcBuffer & kernelState3c; // @[FFTEngine.scala 422:34 431:48]
  assign io_writeEnableSram1Bank_0 = procState3c ? _GEN_69 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 422:34 432:48]
  assign io_writeEnableSram1Bank_1 = procState3c ? _GEN_73 : _srcBufferNext_T_3 & kernelState3c; // @[FFTEngine.scala 422:34 432:48]
  assign io_addrSram0Bank_0 = ~procState3c ? _GEN_114 : _GEN_114; // @[FFTEngine.scala 457:28]
  assign io_addrSram0Bank_1 = ~procState3c ? _GEN_115 : _GEN_115; // @[FFTEngine.scala 457:28]
  assign io_addrSram1Bank_0 = ~procState3c ? _GEN_112 : _GEN_112; // @[FFTEngine.scala 457:28]
  assign io_addrSram1Bank_1 = ~procState3c ? _GEN_113 : _GEN_113; // @[FFTEngine.scala 457:28]
  assign io_fftDone = fftDoneReg; // @[FFTEngine.scala 528:16]
  assign fftCalc_clock = clock;
  assign fftCalc_reset = reset;
  assign fftCalc_io_dataInSR = addrSBankSel1c ? $signed(dataInPre_1_re) : $signed(dataInPre_0_re); // @[FFTEngine.scala 394:{29,29}]
  assign fftCalc_io_dataInSI = sameAddr1c & _T_12 ? $signed(16'sh0) : $signed(_GEN_56); // @[FFTEngine.scala 395:35]
  assign fftCalc_io_dataInTR = _fftCalc_io_dataInSI_T_1 ? $signed(_GEN_58) : $signed(_GEN_60); // @[FFTEngine.scala 396:35]
  assign fftCalc_io_dataInTI = _fftCalc_io_dataInSI_T_1 ? $signed(16'sh0) : $signed(_GEN_58); // @[FFTEngine.scala 397:35]
  assign fftCalc_io_rShiftSym = kernelState1c ? _GEN_65 : phaseCount[0]; // @[FFTEngine.scala 399:36]
  assign fftCalc_io_procMode = ~phaseCount[0] & procState2c; // @[FFTEngine.scala 401:48]
  assign fftCalc_io_state1c = kernelState1c | procState1c; // @[FFTEngine.scala 402:45]
  assign fftCalc_io_state2c = kernelState2c | procState2c; // @[FFTEngine.scala 403:45]
  always @(posedge clock) begin
    if (reset) begin // @[FFTEngine.scala 46:27]
      stateReg <= 3'h0; // @[FFTEngine.scala 46:27]
    end else if (3'h0 == stateReg) begin // @[FFTEngine.scala 52:22]
      if (io_fftEngineKick) begin // @[FFTEngine.scala 54:36]
        if (io_fftMode) begin // @[FFTEngine.scala 55:32]
          stateReg <= 3'h1;
        end else begin
          stateReg <= 3'h4;
        end
      end
    end else if (3'h1 == stateReg) begin // @[FFTEngine.scala 52:22]
      if (addrSProc == 3'h3) begin // @[FFTEngine.scala 61:46]
        stateReg <= 3'h2; // @[FFTEngine.scala 62:26]
      end
    end else if (3'h2 == stateReg) begin // @[FFTEngine.scala 52:22]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_11;
    end
    if (reset) begin // @[FFTEngine.scala 48:29]
      addrSProc <= 3'h0; // @[FFTEngine.scala 48:29]
    end else if (radixInit) begin // @[FFTEngine.scala 120:21]
      addrSProc <= 3'h0; // @[FFTEngine.scala 121:20]
    end else if (radixUp) begin // @[FFTEngine.scala 122:26]
      addrSProc <= _radixCount_T_1; // @[FFTEngine.scala 123:20]
    end
    if (reset) begin // @[FFTEngine.scala 50:29]
      phaseCount <= 2'h0; // @[FFTEngine.scala 50:29]
    end else if (phaseInit) begin // @[FFTEngine.scala 135:21]
      phaseCount <= 2'h0; // @[FFTEngine.scala 136:20]
    end else if (phaseUp) begin // @[FFTEngine.scala 137:26]
      phaseCount <= _phaseCount_T_1; // @[FFTEngine.scala 138:20]
    end
    if (reset) begin // @[FFTEngine.scala 143:28]
      srcBuffer <= 1'h0; // @[FFTEngine.scala 143:28]
    end else if (srcUp) begin // @[FFTEngine.scala 149:17]
      srcBuffer <= srcBufferNext; // @[FFTEngine.scala 150:19]
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
      addrSBankSel1c <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_fftMode) begin // @[FFTEngine.scala 382:21]
      if (_radixInit_T_11) begin // @[FFTEngine.scala 383:32]
        addrSBankSel1c <= addrSBankSelProcPre_0;
      end else begin
        addrSBankSel1c <= addrSBankSelKernel_0;
      end
    end else if (_radixInit_T_11 | _radixInit_T_1 & phaseCount == 2'h0) begin // @[FFTEngine.scala 386:32]
      addrSBankSel1c <= addrSBankSelProcPre_0;
    end else begin
      addrSBankSel1c <= addrSBankSelKernel_0;
    end
    addrTBankSel1c <= reset | addrTBankSel; // @[Reg.scala 35:{20,20}]
    if (reset) begin // @[FFTEngine.scala 527:29]
      fftDoneReg <= 1'h0; // @[FFTEngine.scala 527:29]
    end else begin
      fftDoneReg <= _radixInit_T_21; // @[FFTEngine.scala 527:29]
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
  addrSProc = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  phaseCount = _RAND_2[1:0];
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
  addrS1c = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  addrS2c = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  addrS3c = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  addrT1c = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  addrT2c = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  addrT3c = _RAND_30[1:0];
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
