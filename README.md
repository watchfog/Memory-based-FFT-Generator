Chisel FFT Generator
=======================

A generator for memory-based parallel radix-2 FFT Engine and memory-based cache FFT.
Can be configed to calculate RFFT、CFFT. FFT length, datawidth, twiddle datawidth and number of calculate units can be configed.
Only calculation part's timing is designed to connect to multi-bank single-port SRAM.
Testbench is designed with virtual SRAM, not sure is it working at exact SRAM, work both for RFFT and IRFFT(HSIFFT if you wish more accurate). Explicit testbench for FFT/IFFT is not coded, just comment those proc stage if you wish.

Template from https://github.com/freechipsproject/chisel-template
FFT used in test from https://gist.github.com/ukrainskiysergey/eaf4de40205855f3d465 with a little modify.

Verilog was generated using /src/main/scala/fft/emitVerilog, emit any part of this circuit as you wish.
