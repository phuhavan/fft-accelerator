toplevel = fft4

width = 12

toplevel_uc = $(shell echo $(toplevel) | tr a-z A-Z)

defines_var = \
	`define 	      	MODELSIM                   1\n\
	//`define            VCS                        	1\n\
	`define              SIM_$(toplevel_uc)     	1\n\
	`define              TV_INFILE                  	"input_$(toplevel).txt"\n\
	`define              TV_OUTFILE                 "output_$(toplevel).txt"\n\
	`define              VCD_FILE                     "check.vcd"\n\
	`define              GEN_VCD                     0\n\
	`define              CLOCK_PERIOD           	3.3\n\

rtlsrcdir 	= ../..
srcdir	 	= $(rtlsrcdir)
tvecdir  	= $(rtlsrcdir)/tools/Fixed24b-FFTScaled

#dut_name = fftTestBench
dut_name = localmemTestBench

TECHNOLOGY_PATH	 	= /home/hoangt/RESEARCH/EDABK/WORK/FFT_Accelerator/design_flow/build/technology
STD_CELL_NAME 		= compact_saed32nm
verilog_cells			= $(TECHNOLOGY_PATH)/$(STD_CELL_NAME)/lib/sram/verilog/saed32sram.v

lp_localmem_vlog 		= $(srcdir)/lp_dmem.v \
						    $(srcdir)/lp_fmem.v \
						    $(srcdir)/lp_tmem.v

localmem_vlog 			= $(srcdir)/dmem.v \
						    $(srcdir)/fmem.v \
						    $(srcdir)/tmem.v

gen_defines = defines.h

all: fft-comp fft-sim

$(gen_defines):
	rm -rf defines.h input_$(toplevel).txt output_$(toplevel).txt check.vcd reference_output_$(toplevel).txt
	ln -s $(tvecdir)/$(toplevel)_bw$(width)_input.txt 	input_$(toplevel).txt
	ln -s $(tvecdir)/$(toplevel)_bw$(width)_output.txt 	reference_output_$(toplevel).txt
	echo -e '$(defines_var)'	> defines.h

defines: $(gen_defines)

fft-comp:  clean 
	make defines toplevel=$(toplevel)
	vlog 	-64 -timescale 100ps/10ps \
			+incdir+$(rtlsrcdir)/ \
			+incdir+$(rtlsrcdir)/vclib/ \
			+incdir+./ -novopt \
			$(verilog_cells) \
			$(rtlsrcdir)/vclib/vcFileAccess.v \
			$(rtlsrcdir)/vclib/vcClockGen.v \
			$(rtlsrcdir)/fifo.v \
			$(rtlsrcdir)/radix2.v \
			$(rtlsrcdir)/fft2.v \
			$(rtlsrcdir)/fft4.v \
			$(rtlsrcdir)/fft32.v \
			$(rtlsrcdir)/fft64.v \
			$(rtlsrcdir)/fft64_accel.v \
			$(rtlsrcdir)/fft128.v \
			$(rtlsrcdir)/fft256.v \
			$(rtlsrcdir)/fft512.v \
			$(rtlsrcdir)/fftTestBench.v

fft-sim:
	vsim	work.fftTestBench

mem-comp: clean
	make defines toplevel=$(toplevel)
	vlog 	-64 -sv -timescale 100ps/10ps \
			+incdir+$(rtlsrcdir)/ \
			+incdir+$(rtlsrcdir)/vclib/ \
			+incdir+./ -novopt \
			$(verilog_cells) \
			$(rtlsrcdir)/vclib/vcFileAccess.v \
			$(rtlsrcdir)/vclib/vcClockGen.v \
			$(localmem_vlog) \
      		$(rtlsrcdir)/localmemTestBench.v \

mem-sim:
	vsim	work.localmemTestBench

wave:
	vcd2wlf -splitio check.vcd check.wlf

clean:
	rm -rf transcript *.vcd *.log defines.h output*txt
