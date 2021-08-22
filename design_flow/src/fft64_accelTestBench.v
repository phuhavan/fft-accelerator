//=====================================================
//
//
//=====================================================
`include "defines.h"
`include "macros.h"

module fftTestBench
#(
	//--- complex data width
		parameter	width 		= 24,
	//--- number of simulation cycle (# inputs)
		parameter simcycle 	= 100000
);
	
// synopsys translate_off
	localparam						hwidth 	= width/2;

	wire							lk, rst, stall, stall_out;
	wire 	signed [31:0]			cur_cycle;
	wire		     [ 4:0]			sel_fft;

	wire signed [hwidth-1:0] 		dt_in0, dt_in1, dt_in2, dt_in3, dt_in4, dt_in5, dt_in6, dt_in7, dt_in8, dt_in9, dt_in10, dt_in11, dt_in12, dt_in13, dt_in14, dt_in15, 
									dt_in16, dt_in17, dt_in18, dt_in19, dt_in20, dt_in21, dt_in22, dt_in23, dt_in24, dt_in25, dt_in26, dt_in27, dt_in28, dt_in29, dt_in30, dt_in31, 
									dt_in32, dt_in33, dt_in34, dt_in35, dt_in36, dt_in37, dt_in38, dt_in39, dt_in40, dt_in41, dt_in42, dt_in43, dt_in44, dt_in45, dt_in46, dt_in47, 
									dt_in48, dt_in49, dt_in50, dt_in51, dt_in52, dt_in53, dt_in54, dt_in55, dt_in56, dt_in57, dt_in58, dt_in59, dt_in60, dt_in61, dt_in62, dt_in63, 
									dt_in64, dt_in65, dt_in66, dt_in67, dt_in68, dt_in69, dt_in70, dt_in71, dt_in72, dt_in73, dt_in74, dt_in75, dt_in76, dt_in77, dt_in78, dt_in79, 
									dt_in80, dt_in81, dt_in82, dt_in83, dt_in84, dt_in85, dt_in86, dt_in87, dt_in88, dt_in89, dt_in90, dt_in91, dt_in92, dt_in93, dt_in94, dt_in95, 
									dt_in96, dt_in97, dt_in98, dt_in99, dt_in100, dt_in101, dt_in102, dt_in103, dt_in104, dt_in105, dt_in106, dt_in107, dt_in108, dt_in109, dt_in110, dt_in111, 
									dt_in112, dt_in113, dt_in114, dt_in115, dt_in116, dt_in117, dt_in118, dt_in119, dt_in120, dt_in121, dt_in122, dt_in123, dt_in124, dt_in125, dt_in126, dt_in127,;
									

	wire signed [hwidth-1:0] 		dt_out0, dt_out1, dt_out2, dt_out3, dt_out4, dt_out5, dt_out6, dt_out7, dt_out8, dt_out9, dt_out10, dt_out11, dt_out12, dt_out13, dt_out14, dt_out15, 
									dt_out16, dt_out17, dt_out18, dt_out19, dt_out20, dt_out21, dt_out22, dt_out23, dt_out24, dt_out25, dt_out26, dt_out27, dt_out28, dt_out29, dt_out30, dt_out31, 
									dt_out32, dt_out33, dt_out34, dt_out35, dt_out36, dt_out37, dt_out38, dt_out39, dt_out40, dt_out41, dt_out42, dt_out43, dt_out44, dt_out45, dt_out46, dt_out47, 
									dt_out48, dt_out49, dt_out50, dt_out51, dt_out52, dt_out53, dt_out54, dt_out55, dt_out56, dt_out57, dt_out58, dt_out59, dt_out60, dt_out61, dt_out62, dt_out63, 
									dt_out64, dt_out65, dt_out66, dt_out67, dt_out68, dt_out69, dt_out70, dt_out71, dt_out72, dt_out73, dt_out74, dt_out75, dt_out76, dt_out77, dt_out78, dt_out79, 
									dt_out80, dt_out81, dt_out82, dt_out83, dt_out84, dt_out85, dt_out86, dt_out87, dt_out88, dt_out89, dt_out90, dt_out91, dt_out92, dt_out93, dt_out94, dt_out95, 
									dt_out96, dt_out97, dt_out98, dt_out99, dt_out100, dt_out101, dt_out102, dt_out103, dt_out104, dt_out105, dt_out106, dt_out107, dt_out108, dt_out109, dt_out110, dt_out111, 
									dt_out112, dt_out113, dt_out114, dt_out115, dt_out116, dt_out117, dt_out118, dt_out119, dt_out120, dt_out121, dt_out122, dt_out123, dt_out124, dt_out125, dt_out126, dt_out127;
									
	// get fft size
		`ifdef SIM_FFT64_ACCEL
			localparam size = 64;
		`else 
			$display ("ERROR --- This is testbench for only FFT64 accelerator therefore SIM_FFT64_ACCEL must be defined in <defines.h>");
			$finish;
		`endif					

	// read input from file
		vcReadFile #(.size(2*size), .filename(`TV_INFILE), .hwidth(hwidth))
			inst_vcReadFile (clk, rst, 
							stall, 
			 				dt_in0, dt_in1, dt_in2, dt_in3, dt_in4, dt_in5, dt_in6, dt_in7, dt_in8, dt_in9, dt_in10, dt_in11, dt_in12, dt_in13, dt_in14, dt_in15, 
							dt_in16, dt_in17, dt_in18, dt_in19, dt_in20, dt_in21, dt_in22, dt_in23, dt_in24, dt_in25, dt_in26, dt_in27, dt_in28, dt_in29, dt_in30, dt_in31, 
							dt_in32, dt_in33, dt_in34, dt_in35, dt_in36, dt_in37, dt_in38, dt_in39, dt_in40, dt_in41, dt_in42, dt_in43, dt_in44, dt_in45, dt_in46, dt_in47, 
							dt_in48, dt_in49, dt_in50, dt_in51, dt_in52, dt_in53, dt_in54, dt_in55, dt_in56, dt_in57, dt_in58, dt_in59, dt_in60, dt_in61, dt_in62, dt_in63, 
							dt_in64, dt_in65, dt_in66, dt_in67, dt_in68, dt_in69, dt_in70, dt_in71, dt_in72, dt_in73, dt_in74, dt_in75, dt_in76, dt_in77, dt_in78, dt_in79, 
							dt_in80, dt_in81, dt_in82, dt_in83, dt_in84, dt_in85, dt_in86, dt_in87, dt_in88, dt_in89, dt_in90, dt_in91, dt_in92, dt_in93, dt_in94, dt_in95, 
							dt_in96, dt_in97, dt_in98, dt_in99, dt_in100, dt_in101, dt_in102, dt_in103, dt_in104, dt_in105, dt_in106, dt_in107, dt_in108, dt_in109, dt_in110, dt_in111, 
							dt_in112, dt_in113, dt_in114, dt_in115, dt_in116, dt_in117, dt_in118, dt_in119, 
							dt_in120, dt_in121, dt_in122, dt_in123, dt_in124, dt_in125, dt_in126, dt_in127);

	// write output data to file
		vcWriteFile #(.size(2*size), .filename(`TV_OUTFILE), .hwidth(hwidth))
			inst_vcWriteFile (clk, rst, 
							stall_out, 
			 				dt_out0, dt_out1, dt_out2, dt_out3, dt_out4, dt_out5, dt_out6, dt_out7, dt_out8, dt_out9, dt_out10, dt_out11, dt_out12, dt_out13, dt_out14, dt_out15, 
							dt_out16, dt_out17, dt_out18, dt_out19, dt_out20, dt_out21, dt_out22, dt_out23, dt_out24, dt_out25, dt_out26, dt_out27, dt_out28, dt_out29, dt_out30, dt_out31, 
							dt_out32, dt_out33, dt_out34, dt_out35, dt_out36, dt_out37, dt_out38, dt_out39, dt_out40, dt_out41, dt_out42, dt_out43, dt_out44, dt_out45, dt_out46, dt_out47, 
							dt_out48, dt_out49, dt_out50, dt_out51, dt_out52, dt_out53, dt_out54, dt_out55, dt_out56, dt_out57, dt_out58, dt_out59, dt_out60, dt_out61, dt_out62, dt_out63, 
							dt_out64, dt_out65, dt_out66, dt_out67, dt_out68, dt_out69, dt_out70, dt_out71, dt_out72, dt_out73, dt_out74, dt_out75, dt_out76, dt_out77, dt_out78, dt_out79, 
							dt_out80, dt_out81, dt_out82, dt_out83, dt_out84, dt_out85, dt_out86, dt_out87, dt_out88, dt_out89, dt_out90, dt_out91, dt_out92, dt_out93, dt_out94, dt_out95, 
							dt_out96, dt_out97, dt_out98, dt_out99, dt_out100, dt_out101, dt_out102, dt_out103, dt_out104, dt_out105, dt_out106, dt_out107, dt_out108, dt_out109, dt_out110, dt_out111, 
							dt_out112, dt_out113, dt_out114, dt_out115, dt_out116, dt_out117, dt_out118, dt_out119, 
							dt_out120, dt_out121, dt_out122, dt_out123, dt_out124, dt_out125, dt_out126, dt_out127);

	// dump signals into VCD file for power estimation
		always @(posedge clk) begin
			if (stall_out && cur_cycle > `LOG2(size)+4) begin	
				`ifdef GEN_VCD
					$display ("WARNS --- Generate VCD file !");
					`ifdef MODELSIM						// defined in <designs.h> file
						$dumpflush;
						$dumpoff;
					`elsif VCS
						$vcdplusflush;
						$vcdplusoff;
					`else
						$display ("ERROR --- Simulation tool is not supported (ModelSim or Synopsys VCS");
					`endif
				`else
					$display ("WARNS --- No VCD file is generated !");
				`endif
				$display ("INFOR --- Simulation is finished at cycle   %d", cur_cycle);
				$display ("INFOR --- CLOCK_PERIOD:                          %.3f", `CLOCK_PERIOD); 

				//$stop;
				$finish;
			end
		end

	// clock generator
		vcClockGen	 #(.clockperiod(`CLOCK_PERIOD)) 
			inst_vcClockGen(.clk(clk), .n_clk(n_clk), .rst(rst), .cur_cycle(cur_cycle));

	// open VCD file for power estimation
		initial
  		begin  			
			`ifdef GEN_VCD
				$dumpfile(`VCD_FILE);
				$dumpvars(0, dut_fft);			// dump all variables inside dut_fft instance into VCD file

				`ifdef MODELSIM
					$display ("INFOR --- Using ModelSim simulator");
				`elsif VCS
					$display ("INFOR --- Using Synopsys VCS simulator");
					$vcdpluson;
				`else
					$display ("ERROR --- Simulation tool is not supported (ModelSim or Synopsys VCS)");
				`endif				
			`endif
		end

	//======================================================
	// simulate Design-Under-Test (DUT)
	// NOTE: We use invert clock for DUT_FFT to avoid setup time for the input register
	//======================================================
		// TODO: should we use synchronous sel_fft
		`ifdef SIM_FFT64_ACCEL
			always @(posedge n_clk or posedge rst)				
				if (rst)
				`ifdef 	MODE_FFT32_on_FFT64
						sel_fft =5'b01111;
				`elsif	MODE_FFT16_on_FFT64
						sel_fft =5'b00111;
				`elsif	MODE_FFT8_on_FFT64
						sel_fft =5'b00011;
				`elsif	MODE_FFT4_on_FFT64
						sel_fft =5'b00001;
				`elsif	MODE_FFT2_on_FFT64
						sel_fft =5'b00000;
				`else 	// Default : MODE_FFT64_on_FFT64
						sel_fft =5'b11111;
				`endif
			end

			fft64_accel dut_fft (.clk(clk), .rst(rst), .stall(stall), .stall_out(stall_out),
							//--- mode controls
							.sel_fft(sel_fft),
							//--- inputs					
							.x0_in({dt_in0, dt_in1}), .x1_in({dt_in2, dt_in3}), .x2_in({dt_in4, dt_in5}), .x3_in({dt_in6, dt_in7}), 
							.x4_in({dt_in8, dt_in9}), .x5_in({dt_in10, dt_in11}), .x6_in({dt_in12, dt_in13}), .x7_in({dt_in14, dt_in15}), 
							.x8_in({dt_in16, dt_in17}), .x9_in({dt_in18, dt_in19}), .x10_in({dt_in20, dt_in21}), .x11_in({dt_in22, dt_in23}), 
							.x12_in({dt_in24, dt_in25}), .x13_in({dt_in26, dt_in27}), .x14_in({dt_in28, dt_in29}), .x15_in({dt_in30, dt_in31}), 
							.x16_in({dt_in32, dt_in33}), .x17_in({dt_in34, dt_in35}), .x18_in({dt_in36, dt_in37}), .x19_in({dt_in38, dt_in39}), 
							.x20_in({dt_in40, dt_in41}), .x21_in({dt_in42, dt_in43}), .x22_in({dt_in44, dt_in45}), .x23_in({dt_in46, dt_in47}), 
							.x24_in({dt_in48, dt_in49}), .x25_in({dt_in50, dt_in51}), .x26_in({dt_in52, dt_in53}), .x27_in({dt_in54, dt_in55}), 
							.x28_in({dt_in56, dt_in57}), .x29_in({dt_in58, dt_in59}), .x30_in({dt_in60, dt_in61}), .x31_in({dt_in62, dt_in63}), 
							.x32_in({dt_in64, dt_in65}), .x33_in({dt_in66, dt_in67}), .x34_in({dt_in68, dt_in69}), .x35_in({dt_in70, dt_in71}), 
							.x36_in({dt_in72, dt_in73}), .x37_in({dt_in74, dt_in75}), .x38_in({dt_in76, dt_in77}), .x39_in({dt_in78, dt_in79}), 
							.x40_in({dt_in80, dt_in81}), .x41_in({dt_in82, dt_in83}), .x42_in({dt_in84, dt_in85}), .x43_in({dt_in86, dt_in87}), 
							.x44_in({dt_in88, dt_in89}), .x45_in({dt_in90, dt_in91}), .x46_in({dt_in92, dt_in93}), .x47_in({dt_in94, dt_in95}), 
							.x48_in({dt_in96, dt_in97}), .x49_in({dt_in98, dt_in99}), .x50_in({dt_in100, dt_in101}), .x51_in({dt_in102, dt_in103}), 
							.x52_in({dt_in104, dt_in105}), .x53_in({dt_in106, dt_in107}), .x54_in({dt_in108, dt_in109}), .x55_in({dt_in110, dt_in111}), 
							.x56_in({dt_in112, dt_in113}), .x57_in({dt_in114, dt_in115}), .x58_in({dt_in116, dt_in117}), .x59_in({dt_in118, dt_in119}), 
							.x60_in({dt_in120, dt_in121}), .x61_in({dt_in122, dt_in123}), .x62_in({dt_in124, dt_in125}), .x63_in({dt_in126, dt_in127}),
							
							//--- outputs
							.x0_out({dt_out0, dt_out1}), .x1_out({dt_out2, dt_out3}), .x2_out({dt_out4, dt_out5}), .x3_out({dt_out6, dt_out7}), 
							.x4_out({dt_out8, dt_out9}), .x5_out({dt_out10, dt_out11}), .x6_out({dt_out12, dt_out13}), .x7_out({dt_out14, dt_out15}), 
							.x8_out({dt_out16, dt_out17}), .x9_out({dt_out18, dt_out19}), .x10_out({dt_out20, dt_out21}), .x11_out({dt_out22, dt_out23}), 
							.x12_out({dt_out24, dt_out25}), .x13_out({dt_out26, dt_out27}), .x14_out({dt_out28, dt_out29}), .x15_out({dt_out30, dt_out31}), 
							.x16_out({dt_out32, dt_out33}), .x17_out({dt_out34, dt_out35}), .x18_out({dt_out36, dt_out37}), .x19_out({dt_out38, dt_out39}), 
							.x20_out({dt_out40, dt_out41}), .x21_out({dt_out42, dt_out43}), .x22_out({dt_out44, dt_out45}), .x23_out({dt_out46, dt_out47}), 
							.x24_out({dt_out48, dt_out49}), .x25_out({dt_out50, dt_out51}), .x26_out({dt_out52, dt_out53}), .x27_out({dt_out54, dt_out55}), 
							.x28_out({dt_out56, dt_out57}), .x29_out({dt_out58, dt_out59}), .x30_out({dt_out60, dt_out61}), .x31_out({dt_out62, dt_out63}), 
							.x32_out({dt_out64, dt_out65}), .x33_out({dt_out66, dt_out67}), .x34_out({dt_out68, dt_out69}), .x35_out({dt_out70, dt_out71}), 
							.x36_out({dt_out72, dt_out73}), .x37_out({dt_out74, dt_out75}), .x38_out({dt_out76, dt_out77}), .x39_out({dt_out78, dt_out79}), 
							.x40_out({dt_out80, dt_out81}), .x41_out({dt_out82, dt_out83}), .x42_out({dt_out84, dt_out85}), .x43_out({dt_out86, dt_out87}), 
							.x44_out({dt_out88, dt_out89}), .x45_out({dt_out90, dt_out91}), .x46_out({dt_out92, dt_out93}), .x47_out({dt_out94, dt_out95}), 
							.x48_out({dt_out96, dt_out97}), .x49_out({dt_out98, dt_out99}), .x50_out({dt_out100, dt_out101}), .x51_out({dt_out102, dt_out103}), 
							.x52_out({dt_out104, dt_out105}), .x53_out({dt_out106, dt_out107}), .x54_out({dt_out108, dt_out109}), .x55_out({dt_out110, dt_out111}), 
							.x56_out({dt_out112, dt_out113}), .x57_out({dt_out114, dt_out115}), .x58_out({dt_out116, dt_out117}), .x59_out({dt_out118, dt_out119}), 
							.x60_out({dt_out120, dt_out121}), .x61_out({dt_out122, dt_out123}), .x62_out({dt_out124, dt_out125}), .x63_out({dt_out126, dt_out127}));

		`else
			$display ("ERROR --- DUT_FFT is undefined !");
			$display ("ERROR --- This is testbench for only FFT64 accelerator therefore SIM_FFT64_ACCEL must be defined in <defines.h>");			
			$finish;
		`endif
// synopsys translate_on

endmodule

