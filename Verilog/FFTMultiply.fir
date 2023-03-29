circuit FFTMultiply :
  module FFTMultiply :
    output io : { flip data : { im : Fixed<16><<15>>, re : Fixed<16><<15>>}, flip wR : Fixed<14><<12>>, flip wI : Fixed<14><<12>>, product : { im : Fixed<16><<15>>, re : Fixed<16><<15>>}}

    node _multS_T = add(io.data.re, io.data.im) @[FFTMultiply.scala 15:29]
    node _multS_T_1 = tail(_multS_T, 1) @[FFTMultiply.scala 15:29]
    node _multS_T_2 = asFixedPoint(_multS_T_1, 15) @[FFTMultiply.scala 15:29]
    node _multS_T_3 = add(io.wR, io.wI) @[FFTMultiply.scala 15:52]
    node _multS_T_4 = tail(_multS_T_3, 1) @[FFTMultiply.scala 15:52]
    node _multS_T_5 = asFixedPoint(_multS_T_4, 12) @[FFTMultiply.scala 15:52]
    node multS = mul(_multS_T_2, _multS_T_5) @[FFTMultiply.scala 15:43]
    node multR = mul(io.data.re, io.wR) @[FFTMultiply.scala 16:28]
    node multI = mul(io.data.im, io.wI) @[FFTMultiply.scala 17:28]
    node _io_product_re_T = sub(multR, multI) @[FFTMultiply.scala 19:28]
    node _io_product_re_T_1 = tail(_io_product_re_T, 1) @[FFTMultiply.scala 19:28]
    node _io_product_re_T_2 = asFixedPoint(_io_product_re_T_1, 27) @[FFTMultiply.scala 19:28]
    io.product.re <= _io_product_re_T_2 @[FFTMultiply.scala 19:19]
    node _io_product_im_T = sub(multS, multR) @[FFTMultiply.scala 20:28]
    node _io_product_im_T_1 = tail(_io_product_im_T, 1) @[FFTMultiply.scala 20:28]
    node _io_product_im_T_2 = asFixedPoint(_io_product_im_T_1, 27) @[FFTMultiply.scala 20:28]
    node _io_product_im_T_3 = sub(_io_product_im_T_2, multI) @[FFTMultiply.scala 20:36]
    node _io_product_im_T_4 = tail(_io_product_im_T_3, 1) @[FFTMultiply.scala 20:36]
    node _io_product_im_T_5 = asFixedPoint(_io_product_im_T_4, 27) @[FFTMultiply.scala 20:36]
    io.product.im <= _io_product_im_T_5 @[FFTMultiply.scala 20:19]

