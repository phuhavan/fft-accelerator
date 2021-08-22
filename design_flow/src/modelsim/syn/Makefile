toplevel = fft4

width = 12

toplevel_uc = $(shell echo $(toplevel) | tr a-z A-Z)

defines_var = \
	`define 	      MODELSIM                   1\n\
	//`define              VCS                              1\n\
	`define              SIM_$(toplevel_uc)     1\n\
	`define              TV_INFILE                    "input_$(toplevel).txt"\n\
	`define              TV_OUTFILE                 "output_$(toplevel).txt"\n\
	`define              VCD_FILE                     "check.vcd"\n\
	`define              GEN_VCD                      1\n\
	`define              CLOCK_PERIOD           3.3\n\
	#`define			functional			    1\n\

rtlsrcdir								=   ../..
syn_results_dir 						= 	/home/hoangt/RESEARCH/EDABK/WORK/FFT_Accelerator/design_flow/build/dc-syn/current-dc/results

tvecdir  = ../input

TECHNOLOGY_PATH	 			= /home/hoangt/RESEARCH/EDABK/WORK/FFTAccelerator/design_flow/build/technology
STD_CELL_NAME 					= compact_saed32nm

verilog_cells						= $(TECHNOLOGY_PATH)/$(STD_CELL_NAME)/lib/stdcell_hvt/verilog/saed32nm_hvt.v

gen_defines = defines.h
$(gen_defines):
	rm -rf defines.h input_$(toplevel).txt output_$(toplevel).txt check.vcd
	ln -s $(tvecdir)/$(toplevel)_bw$(width)_input.txt 	input_$(toplevel).txt
	echo -e '$(defines_var)'		> defines.h

defines: $(gen_defines)

syn-comp:  defines
	vlog 	-timescale 1ns/10ps \
			+incdir+$(rtlsrcdir)/ \
			+incdir+$(rtlsrcdir)/vclib/ \
			+incdir+./ \
			$(verilog_cells) \
			$(rtlsrcdir)/fifo.v \
			$(rtlsrcdir)/vclib/vcFileAccess.v \
			$(rtlsrcdir)/vclib/vcClockGen.v \
			$(rtlsrcdir)/fftTestBench.v \
			$(rtlsrcdir)/adderTestBench.v \
			$(syn_results_dir)/$(toplevel).mapped.v \
			#$(syn_results_dir)/adder.mapped.v \
			

syn-sim:
	vsim 	-novopt -sdfnoerror -sdfnowarn \
			-sdftyp /dut_fft4=$(syn_results_dir)/fft4.mapped.sdf \
			work.fftTestBench

#			-sdftyp /dut_adder=$(syn_results_dir)/adder.mapped.sdf \
#			work.adderTestBench


wave:
	vcd2wlf -splitio check.vcd check.wlf

clean:
	rm -rf *.vcd *.log *.txt defines.h
