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
