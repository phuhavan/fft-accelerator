comp:
	vlog 	+incdir+src/ \
			+incdir+./ \
			fifo.v \
			radix2.v \
			fft4.v \
			fft32.v \
			fft64.v \
			fft128.v \
			fft256.v \
			fft512.v \
			vclib/vcFileAccess.v \
			vclib/vcClockGen.v \
			fftTestBench.v

sim:
	vsim	work.fftTestBench

wave:
	vcd2wlf -splitio check.vcd check.wlf
