`include "localmem_defines.h"


//======================================================
module datapath
#(
		//--- data bus-width
			parameter bus_width = 128*24,
		//--- data bit-width
			parameter width = 24,
		//--- fft size
			parameter size=128
)
(
		//--- general control
			input	    		clk, rst, stall,
			input 				ce_fft,
			input	[6:0]		sel_fft,

			input  	[6:0] 		shift_data,

			input				sel_mux0, sel_mux1, sel_mux2, sel_mux3,
			input 				sel_dmux0, sel_dmux1,
			input 				ce_mul,

			input [2:0] 		fft_mode,
			input [1:0] 		mode,
			input [3:0] 		position,
		//--- DMEM control
			//port 1
			input 								dm_CE1,
			input 								dm_WEB1,
			input 								dm_OEB1,
			input 								dm_CSB1,
			input 	[`DM_ADDR-1:0] 				dm_A1,
			//port 2
			input 								dm_CE2,			
			input 								dm_WEB2,
			input 								dm_OEB2,
			input 								dm_CSB2,
			input 	[`DM_ADDR-1:0]				dm_A2,
		//--- FMEM control
			//port 1
			input 								fm_CE1,
			input 								fm_WEB1,
			input 								fm_OEB1,
			input 								fm_CSB1,
			input 	[`FM_ADDR-1:0] 				fm_A1,
			//port 2
			input 								fm_CE2,			
			input 								fm_WEB2,
			input 								fm_OEB2,
			input 								fm_CSB2,
			input 	[`FM_ADDR-1:0]				fm_A2,
		//--- TMEM control
			//--- Port 1
			input 								tm_CE1,
			input 								tm_WEB1,
			input 								tm_OEB1,
			input 	[`TM_BANK_NUM-1:0]			tm_CSB1,
			input 	[`TM_ADDR-1:0]				tm_A1,
			//--- Port 2
			input 								tm_CE2,
			input 								tm_WEB2,
			input 								tm_OEB2,
			input 	[`TM_BANK_NUM-1:0]			tm_CSB2,
			input 	[`TM_ADDR-1:0]				tm_A2,

		//--- input
			input	[bus_width-1:0]				data_in,
			input 	[bus_width-1:0]				data_in_fmem,
		//--- output	
			output	[bus_width-1:0] 			data_out,
			output 								done_arrange_signal,
			output  stall_out
);
			

			reg dm_OEB1_reg, dm_OEB2_reg;
			reg fm_OEB1_reg, fm_OEB2_reg;
			reg tm_OEB1_reg, tm_OEB2_reg;



		//--- signal definition
			//mux0
			wire		[bus_width-1:0]		mux0_in0_wr;
			wire		[bus_width-1:0]		mux0_in1_wr;
			wire		[bus_width-1:0] 	mux0_out0_wr;

			//mux1
			wire		[bus_width-1:0]		mux1_in0_wr;
			wire		[bus_width-1:0]		mux1_in1_wr;
			wire		[bus_width-1:0] 	mux1_out0_wr;

			//mux2
			wire		[bus_width-1:0]		mux2_in_tm1_in0_wr;
			wire		[bus_width-1:0]		mux2_in_tm1_in1_wr;
			wire		[bus_width-1:0] 	mux2_out_tm1_out0_wr;

			//mux3
			wire		[bus_width-1:0]		mux3_in_tm2_in0_wr;
			wire		[bus_width-1:0]		mux3_in_tm2_in1_wr;
			wire		[bus_width-1:0] 	mux3_out_tm2_out0_wr;

			//mux4
			wire		[15:0]		mux4_in_csb1_0_wr;
			wire		[15:0]		mux4_in_csb1_1_wr;
			wire		[15:0] 		mux4_out_csb1_0_wr;

			//mux5
			wire		[3:0]		mux5_in_addr1_0_wr;
			wire		[3:0]		mux5_in_addr1_1_wr;
			wire		[3:0] 		mux5_out_addr1_0_wr;

			//mux6
			wire					mux6_in_oeb1_0_wr;
			wire					mux6_in_oeb1_1_wr;
			wire			 		mux6_out_oeb1_0_wr;

			//mux7
			wire					mux7_in_web1_0_wr;
			wire					mux7_in_web1_1_wr;
			wire			 		mux7_out_web1_0_wr;

			//mux8
			wire		[15:0]		mux8_in_csb2_0_wr;
			wire		[15:0]		mux8_in_csb2_1_wr;
			wire		[15:0] 		mux8_out_csb2_0_wr;

			//mux9
			wire		[3:0]		mux9_in_addr2_0_wr;
			wire		[3:0]		mux9_in_addr2_1_wr;
			wire		[3:0] 		mux9_out_addr2_0_wr;

			//mux10
			wire					mux10_in_oeb2_0_wr;
			wire					mux10_in_oeb2_1_wr;
			wire			 		mux10_out_oeb2_0_wr;

			//mux11
			wire					mux11_in_web2_0_wr;
			wire					mux11_in_web2_1_wr;
			wire			 		mux11_out_web2_0_wr;

			//mux12
			wire		[bus_width-1:0]		mux12_in_output_0_wr;
			wire		[bus_width-1:0]		mux12_in_output_1_wr;
			wire		[bus_width-1:0] 	mux12_out_output_0_wr;

			//dmux0
			wire		[bus_width-1:0] 	dmux0_in0_wr;
			wire		[bus_width-1:0] 	dmux0_out0_wr;
			wire		[bus_width-1:0] 	dmux0_out1_wr;

			//dmux1
			wire		[bus_width-1:0] 	dmux1_in0_wr;
			wire		[bus_width-1:0] 	dmux1_out0_wr;
			wire		[bus_width-1:0] 	dmux1_out1_wr;

			//dmem
			wire [`DM_COLS-1:0] dm_I1;
			wire [`DM_COLS-1:0] dm_O1;
			wire [`DM_COLS-1:0] dm_I2;
			wire [`DM_COLS-1:0] dm_O2;

			//fmem
			wire [`FM_COLS-1:0] fm_I1;
			wire [`FM_COLS-1:0] fm_O1;
			wire [`FM_COLS-1:0] fm_I2;
			wire [`FM_COLS-1:0] fm_O2;

			//tmem
			wire [`TM_FFT_WIDTH-1:0] tm_I1;
			wire [`TM_FFT_WIDTH-1:0] tm_O1;
			wire [`TM_FFT_WIDTH-1:0] tm_I2;
			wire [`TM_FFT_WIDTH-1:0] tm_O2;

			//mul tw
			wire [`DM_BANK_COLS-1:0] multw_in0;
			wire [`DM_BANK_COLS-1:0] multw_in1;
			wire [`DM_BANK_COLS-1:0] multw_out0;
			wire mul_ready;

			//arrange
			wire read_data;
			
			wire [`TM_BANK_NUM-1:0] tm_csb1_arrange;
			wire [`TM_ADDR-1:0] tm_addr1_arrange;
			wire [16*24*8-1:0] tm_out1_arrange;
			wire tm_oeb1_arrange;
			wire tm_web1_arrange;
			wire [`TM_BANK_NUM-1:0] tm_csb2_arrange;
			wire [`TM_ADDR-1:0] tm_addr2_arrange;
			wire [16*24*8-1:0] tm_out2_arrange;
			wire tm_oeb2_arrange;
			wire tm_web2_arrange;
			wire done_arrange;


			wire [`TM_BANK_NUM-1:0] mux_tm_csb1;
			wire [`TM_ADDR-1:0] mux_tm_addr1;
			wire mux_tm_oeb1;
			wire mux_tm_web1;
			wire [`TM_BANK_NUM-1:0] mux_tm_csb2;
			wire [`TM_ADDR-1:0] mux_tm_addr2;
			wire mux_tm_oeb2;
			wire mux_tm_web2;


			// test 
			wire [width-1:0] x0_test;
			wire [width-1:0] x1_test;
			wire [width-1:0] x2_test;
			wire [width-1:0] x3_test;
			wire [width-1:0] x4_test;
			wire [width-1:0] x5_test;
			wire [width-1:0] x6_test;
			wire [width-1:0] x7_test;
			wire [width-1:0] x8_test;
			wire [width-1:0] x9_test;
			wire [width-1:0] x10_test;
			wire [width-1:0] x11_test;
			wire [width-1:0] x12_test;
			wire [width-1:0] x13_test;
			wire [width-1:0] x14_test;
			wire [width-1:0] x15_test;
			wire [width-1:0] x16_test;
			wire [width-1:0] x17_test;
			wire [width-1:0] x18_test;
			wire [width-1:0] x19_test;
			wire [width-1:0] x20_test;
			wire [width-1:0] x21_test;
			wire [width-1:0] x22_test;
			wire [width-1:0] x23_test;
			wire [width-1:0] x24_test;
			wire [width-1:0] x25_test;
			wire [width-1:0] x26_test;
			wire [width-1:0] x27_test;
			wire [width-1:0] x28_test;
			wire [width-1:0] x29_test;
			wire [width-1:0] x30_test;
			wire [width-1:0] x31_test;
			wire [width-1:0] x32_test;
			wire [width-1:0] x33_test;
			wire [width-1:0] x34_test;
			wire [width-1:0] x35_test;
			wire [width-1:0] x36_test;
			wire [width-1:0] x37_test;
			wire [width-1:0] x38_test;
			wire [width-1:0] x39_test;
			wire [width-1:0] x40_test;
			wire [width-1:0] x41_test;
			wire [width-1:0] x42_test;
			wire [width-1:0] x43_test;
			wire [width-1:0] x44_test;
			wire [width-1:0] x45_test;
			wire [width-1:0] x46_test;
			wire [width-1:0] x47_test;
			wire [width-1:0] x48_test;
			wire [width-1:0] x49_test;
			wire [width-1:0] x50_test;
			wire [width-1:0] x51_test;
			wire [width-1:0] x52_test;
			wire [width-1:0] x53_test;
			wire [width-1:0] x54_test;
			wire [width-1:0] x55_test;
			wire [width-1:0] x56_test;
			wire [width-1:0] x57_test;
			wire [width-1:0] x58_test;
			wire [width-1:0] x59_test;
			wire [width-1:0] x60_test;
			wire [width-1:0] x61_test;
			wire [width-1:0] x62_test;
			wire [width-1:0] x63_test;
			wire [width-1:0] x64_test;
			wire [width-1:0] x65_test;
			wire [width-1:0] x66_test;
			wire [width-1:0] x67_test;
			wire [width-1:0] x68_test;
			wire [width-1:0] x69_test;
			wire [width-1:0] x70_test;
			wire [width-1:0] x71_test;
			wire [width-1:0] x72_test;
			wire [width-1:0] x73_test;
			wire [width-1:0] x74_test;
			wire [width-1:0] x75_test;
			wire [width-1:0] x76_test;
			wire [width-1:0] x77_test;
			wire [width-1:0] x78_test;
			wire [width-1:0] x79_test;
			wire [width-1:0] x80_test;
			wire [width-1:0] x81_test;
			wire [width-1:0] x82_test;
			wire [width-1:0] x83_test;
			wire [width-1:0] x84_test;
			wire [width-1:0] x85_test;
			wire [width-1:0] x86_test;
			wire [width-1:0] x87_test;
			wire [width-1:0] x88_test;
			wire [width-1:0] x89_test;
			wire [width-1:0] x90_test;
			wire [width-1:0] x91_test;
			wire [width-1:0] x92_test;
			wire [width-1:0] x93_test;
			wire [width-1:0] x94_test;
			wire [width-1:0] x95_test;
			wire [width-1:0] x96_test;
			wire [width-1:0] x97_test;
			wire [width-1:0] x98_test;
			wire [width-1:0] x99_test;
			wire [width-1:0] x100_test;
			wire [width-1:0] x101_test;
			wire [width-1:0] x102_test;
			wire [width-1:0] x103_test;
			wire [width-1:0] x104_test;
			wire [width-1:0] x105_test;
			wire [width-1:0] x106_test;
			wire [width-1:0] x107_test;
			wire [width-1:0] x108_test;
			wire [width-1:0] x109_test;
			wire [width-1:0] x110_test;
			wire [width-1:0] x111_test;
			wire [width-1:0] x112_test;
			wire [width-1:0] x113_test;
			wire [width-1:0] x114_test;
			wire [width-1:0] x115_test;
			wire [width-1:0] x116_test;
			wire [width-1:0] x117_test;
			wire [width-1:0] x118_test;
			wire [width-1:0] x119_test;
			wire [width-1:0] x120_test;
			wire [width-1:0] x121_test;
			wire [width-1:0] x122_test;
			wire [width-1:0] x123_test;
			wire [width-1:0] x124_test;
			wire [width-1:0] x125_test;
			wire [width-1:0] x126_test;
			wire [width-1:0] x127_test;

			//fft_accel

			wire [width-1:0] x0_in;
			wire [width-1:0] x1_in;
			wire [width-1:0] x2_in;
			wire [width-1:0] x3_in;
			wire [width-1:0] x4_in;
			wire [width-1:0] x5_in;
			wire [width-1:0] x6_in;
			wire [width-1:0] x7_in;
			wire [width-1:0] x8_in;
			wire [width-1:0] x9_in;
			wire [width-1:0] x10_in;
			wire [width-1:0] x11_in;
			wire [width-1:0] x12_in;
			wire [width-1:0] x13_in;
			wire [width-1:0] x14_in;
			wire [width-1:0] x15_in;
			wire [width-1:0] x16_in;
			wire [width-1:0] x17_in;
			wire [width-1:0] x18_in;
			wire [width-1:0] x19_in;
			wire [width-1:0] x20_in;
			wire [width-1:0] x21_in;
			wire [width-1:0] x22_in;
			wire [width-1:0] x23_in;
			wire [width-1:0] x24_in;
			wire [width-1:0] x25_in;
			wire [width-1:0] x26_in;
			wire [width-1:0] x27_in;
			wire [width-1:0] x28_in;
			wire [width-1:0] x29_in;
			wire [width-1:0] x30_in;
			wire [width-1:0] x31_in;
			wire [width-1:0] x32_in;
			wire [width-1:0] x33_in;
			wire [width-1:0] x34_in;
			wire [width-1:0] x35_in;
			wire [width-1:0] x36_in;
			wire [width-1:0] x37_in;
			wire [width-1:0] x38_in;
			wire [width-1:0] x39_in;
			wire [width-1:0] x40_in;
			wire [width-1:0] x41_in;
			wire [width-1:0] x42_in;
			wire [width-1:0] x43_in;
			wire [width-1:0] x44_in;
			wire [width-1:0] x45_in;
			wire [width-1:0] x46_in;
			wire [width-1:0] x47_in;
			wire [width-1:0] x48_in;
			wire [width-1:0] x49_in;
			wire [width-1:0] x50_in;
			wire [width-1:0] x51_in;
			wire [width-1:0] x52_in;
			wire [width-1:0] x53_in;
			wire [width-1:0] x54_in;
			wire [width-1:0] x55_in;
			wire [width-1:0] x56_in;
			wire [width-1:0] x57_in;
			wire [width-1:0] x58_in;
			wire [width-1:0] x59_in;
			wire [width-1:0] x60_in;
			wire [width-1:0] x61_in;
			wire [width-1:0] x62_in;
			wire [width-1:0] x63_in;
			wire [width-1:0] x64_in;
			wire [width-1:0] x65_in;
			wire [width-1:0] x66_in;
			wire [width-1:0] x67_in;
			wire [width-1:0] x68_in;
			wire [width-1:0] x69_in;
			wire [width-1:0] x70_in;
			wire [width-1:0] x71_in;
			wire [width-1:0] x72_in;
			wire [width-1:0] x73_in;
			wire [width-1:0] x74_in;
			wire [width-1:0] x75_in;
			wire [width-1:0] x76_in;
			wire [width-1:0] x77_in;
			wire [width-1:0] x78_in;
			wire [width-1:0] x79_in;
			wire [width-1:0] x80_in;
			wire [width-1:0] x81_in;
			wire [width-1:0] x82_in;
			wire [width-1:0] x83_in;
			wire [width-1:0] x84_in;
			wire [width-1:0] x85_in;
			wire [width-1:0] x86_in;
			wire [width-1:0] x87_in;
			wire [width-1:0] x88_in;
			wire [width-1:0] x89_in;
			wire [width-1:0] x90_in;
			wire [width-1:0] x91_in;
			wire [width-1:0] x92_in;
			wire [width-1:0] x93_in;
			wire [width-1:0] x94_in;
			wire [width-1:0] x95_in;
			wire [width-1:0] x96_in;
			wire [width-1:0] x97_in;
			wire [width-1:0] x98_in;
			wire [width-1:0] x99_in;
			wire [width-1:0] x100_in;
			wire [width-1:0] x101_in;
			wire [width-1:0] x102_in;
			wire [width-1:0] x103_in;
			wire [width-1:0] x104_in;
			wire [width-1:0] x105_in;
			wire [width-1:0] x106_in;
			wire [width-1:0] x107_in;
			wire [width-1:0] x108_in;
			wire [width-1:0] x109_in;
			wire [width-1:0] x110_in;
			wire [width-1:0] x111_in;
			wire [width-1:0] x112_in;
			wire [width-1:0] x113_in;
			wire [width-1:0] x114_in;
			wire [width-1:0] x115_in;
			wire [width-1:0] x116_in;
			wire [width-1:0] x117_in;
			wire [width-1:0] x118_in;
			wire [width-1:0] x119_in;
			wire [width-1:0] x120_in;
			wire [width-1:0] x121_in;
			wire [width-1:0] x122_in;
			wire [width-1:0] x123_in;
			wire [width-1:0] x124_in;
			wire [width-1:0] x125_in;
			wire [width-1:0] x126_in;
			wire [width-1:0] x127_in;
			
			wire [width-1:0] x0_out;
			wire [width-1:0] x1_out;
			wire [width-1:0] x2_out;
			wire [width-1:0] x3_out;
			wire [width-1:0] x4_out;
			wire [width-1:0] x5_out;
			wire [width-1:0] x6_out;
			wire [width-1:0] x7_out;
			wire [width-1:0] x8_out;
			wire [width-1:0] x9_out;
			wire [width-1:0] x10_out;
			wire [width-1:0] x11_out;
			wire [width-1:0] x12_out;
			wire [width-1:0] x13_out;
			wire [width-1:0] x14_out;
			wire [width-1:0] x15_out;
			wire [width-1:0] x16_out;
			wire [width-1:0] x17_out;
			wire [width-1:0] x18_out;
			wire [width-1:0] x19_out;
			wire [width-1:0] x20_out;
			wire [width-1:0] x21_out;
			wire [width-1:0] x22_out;
			wire [width-1:0] x23_out;
			wire [width-1:0] x24_out;
			wire [width-1:0] x25_out;
			wire [width-1:0] x26_out;
			wire [width-1:0] x27_out;
			wire [width-1:0] x28_out;
			wire [width-1:0] x29_out;
			wire [width-1:0] x30_out;
			wire [width-1:0] x31_out;
			wire [width-1:0] x32_out;
			wire [width-1:0] x33_out;
			wire [width-1:0] x34_out;
			wire [width-1:0] x35_out;
			wire [width-1:0] x36_out;
			wire [width-1:0] x37_out;
			wire [width-1:0] x38_out;
			wire [width-1:0] x39_out;
			wire [width-1:0] x40_out;
			wire [width-1:0] x41_out;
			wire [width-1:0] x42_out;
			wire [width-1:0] x43_out;
			wire [width-1:0] x44_out;
			wire [width-1:0] x45_out;
			wire [width-1:0] x46_out;
			wire [width-1:0] x47_out;
			wire [width-1:0] x48_out;
			wire [width-1:0] x49_out;
			wire [width-1:0] x50_out;
			wire [width-1:0] x51_out;
			wire [width-1:0] x52_out;
			wire [width-1:0] x53_out;
			wire [width-1:0] x54_out;
			wire [width-1:0] x55_out;
			wire [width-1:0] x56_out;
			wire [width-1:0] x57_out;
			wire [width-1:0] x58_out;
			wire [width-1:0] x59_out;
			wire [width-1:0] x60_out;
			wire [width-1:0] x61_out;
			wire [width-1:0] x62_out;
			wire [width-1:0] x63_out;
			wire [width-1:0] x64_out;
			wire [width-1:0] x65_out;
			wire [width-1:0] x66_out;
			wire [width-1:0] x67_out;
			wire [width-1:0] x68_out;
			wire [width-1:0] x69_out;
			wire [width-1:0] x70_out;
			wire [width-1:0] x71_out;
			wire [width-1:0] x72_out;
			wire [width-1:0] x73_out;
			wire [width-1:0] x74_out;
			wire [width-1:0] x75_out;
			wire [width-1:0] x76_out;
			wire [width-1:0] x77_out;
			wire [width-1:0] x78_out;
			wire [width-1:0] x79_out;
			wire [width-1:0] x80_out;
			wire [width-1:0] x81_out;
			wire [width-1:0] x82_out;
			wire [width-1:0] x83_out;
			wire [width-1:0] x84_out;
			wire [width-1:0] x85_out;
			wire [width-1:0] x86_out;
			wire [width-1:0] x87_out;
			wire [width-1:0] x88_out;
			wire [width-1:0] x89_out;
			wire [width-1:0] x90_out;
			wire [width-1:0] x91_out;
			wire [width-1:0] x92_out;
			wire [width-1:0] x93_out;
			wire [width-1:0] x94_out;
			wire [width-1:0] x95_out;
			wire [width-1:0] x96_out;
			wire [width-1:0] x97_out;
			wire [width-1:0] x98_out;
			wire [width-1:0] x99_out;
			wire [width-1:0] x100_out;
			wire [width-1:0] x101_out;
			wire [width-1:0] x102_out;
			wire [width-1:0] x103_out;
			wire [width-1:0] x104_out;
			wire [width-1:0] x105_out;
			wire [width-1:0] x106_out;
			wire [width-1:0] x107_out;
			wire [width-1:0] x108_out;
			wire [width-1:0] x109_out;
			wire [width-1:0] x110_out;
			wire [width-1:0] x111_out;
			wire [width-1:0] x112_out;
			wire [width-1:0] x113_out;
			wire [width-1:0] x114_out;
			wire [width-1:0] x115_out;
			wire [width-1:0] x116_out;
			wire [width-1:0] x117_out;
			wire [width-1:0] x118_out;
			wire [width-1:0] x119_out;
			wire [width-1:0] x120_out;
			wire [width-1:0] x121_out;
			wire [width-1:0] x122_out;
			wire [width-1:0] x123_out;
			wire [width-1:0] x124_out;
			wire [width-1:0] x125_out;
			wire [width-1:0] x126_out;
			wire [width-1:0] x127_out;

			wire [bus_width-1:0]	din_fft_accel;
			wire [bus_width-1:0] 	dout_fft_accel;
			

		//--- assign signals
		assign done_arrange_signal = done_arrange;

		// put data to input of fmem
		assign fm_I1 = data_in_fmem;

		// put data to input of dmem
		assign dm_I1 = data_in;
		assign dm_I2 = dmux0_out0_wr;

		// merge 128 samples in/output of FFT_accel - done
		assign {x127_in,x126_in,x125_in,x124_in,x123_in,x122_in,x121_in,x120_in,x119_in,x118_in,x117_in,x116_in,x115_in,x114_in,x113_in,x112_in,x111_in,x110_in,x109_in,x108_in,x107_in,x106_in,x105_in,x104_in,x103_in,x102_in,x101_in,x100_in,x99_in,x98_in,x97_in,x96_in,x95_in,x94_in,x93_in,x92_in,x91_in,x90_in,x89_in,x88_in,x87_in,x86_in,x85_in,x84_in,x83_in,x82_in,x81_in,x80_in,x79_in,x78_in,x77_in,x76_in,x75_in,x74_in,x73_in,x72_in,x71_in,x70_in,x69_in,x68_in,x67_in,x66_in,x65_in,x64_in,x63_in,x62_in,x61_in,x60_in,x59_in,x58_in,x57_in,x56_in,x55_in,x54_in,x53_in,x52_in,x51_in,x50_in,x49_in,x48_in,x47_in,x46_in,x45_in,x44_in,x43_in,x42_in,x41_in,x40_in,x39_in,x38_in,x37_in,x36_in,x35_in,x34_in,x33_in,x32_in,x31_in,x30_in,x29_in,x28_in,x27_in,x26_in,x25_in,x24_in,x23_in,x22_in,x21_in,x20_in,x19_in,x18_in,x17_in,x16_in,x15_in,x14_in,x13_in,x12_in,x11_in,x10_in,x9_in,x8_in,x7_in,x6_in,x5_in,x4_in,x3_in,x2_in,x1_in,x0_in} = din_fft_accel;
		assign {x127_test,x126_test,x125_test,x124_test,x123_test,x122_test,x121_test,x120_test,x119_test,x118_test,x117_test,x116_test,x115_test,x114_test,x113_test,x112_test,x111_test,x110_test,x109_test,x108_test,x107_test,x106_test,x105_test,x104_test,x103_test,x102_test,x101_test,x100_test,x99_test,x98_test,x97_test,x96_test,x95_test,x94_test,x93_test,x92_test,x91_test,x90_test,x89_test,x88_test,x87_test,x86_test,x85_test,x84_test,x83_test,x82_test,x81_test,x80_test,x79_test,x78_test,x77_test,x76_test,x75_test,x74_test,x73_test,x72_test,x71_test,x70_test,x69_test,x68_test,x67_test,x66_test,x65_test,x64_test,x63_test,x62_test,x61_test,x60_test,x59_test,x58_test,x57_test,x56_test,x55_test,x54_test,x53_test,x52_test,x51_test,x50_test,x49_test,x48_test,x47_test,x46_test,x45_test,x44_test,x43_test,x42_test,x41_test,x40_test,x39_test,x38_test,x37_test,x36_test,x35_test,x34_test,x33_test,x32_test,x31_test,x30_test,x29_test,x28_test,x27_test,x26_test,x25_test,x24_test,x23_test,x22_test,x21_test,x20_test,x19_test,x18_test,x17_test,x16_test,x15_test,x14_test,x13_test,x12_test,x11_test,x10_test,x9_test,x8_test,x7_test,x6_test,x5_test,x4_test,x3_test,x2_test,x1_test,x0_test} = dm_O1;
		assign dout_fft_accel = {x127_out,x126_out,x125_out,x124_out,x123_out,x122_out,x121_out,x120_out,x119_out,x118_out,x117_out,x116_out,x115_out,x114_out,x113_out,x112_out,x111_out,x110_out,x109_out,x108_out,x107_out,x106_out,x105_out,x104_out,x103_out,x102_out,x101_out,x100_out,x99_out,x98_out,x97_out,x96_out,x95_out,x94_out,x93_out,x92_out,x91_out,x90_out,x89_out,x88_out,x87_out,x86_out,x85_out,x84_out,x83_out,x82_out,x81_out,x80_out,x79_out,x78_out,x77_out,x76_out,x75_out,x74_out,x73_out,x72_out,x71_out,x70_out,x69_out,x68_out,x67_out,x66_out,x65_out,x64_out,x63_out,x62_out,x61_out,x60_out,x59_out,x58_out,x57_out,x56_out,x55_out,x54_out,x53_out,x52_out,x51_out,x50_out,x49_out,x48_out,x47_out,x46_out,x45_out,x44_out,x43_out,x42_out,x41_out,x40_out,x39_out,x38_out,x37_out,x36_out,x35_out,x34_out,x33_out,x32_out,x31_out,x30_out,x29_out,x28_out,x27_out,x26_out,x25_out,x24_out,x23_out,x22_out,x21_out,x20_out,x19_out,x18_out,x17_out,x16_out,x15_out,x14_out,x13_out,x12_out,x11_out,x10_out,x9_out,x8_out,x7_out,x6_out,x5_out,x4_out,x3_out,x2_out,x1_out,x0_out};

		// mux0 IO - done
		// assign mux0_in0_wr = dmux0_out0_wr;
		// assign mux0_in1_wr = data_in;
		// assign dm_I1 = mux0_out0_wr;

		// mux1 IO - done
		assign mux1_in0_wr = dm_O1;
		assign mux1_in1_wr = dmux1_out0_wr;
		assign din_fft_accel = mux1_out0_wr;

		// mux2 IO
		assign mux2_in_tm1_in0_wr = tm_out1_arrange;
		assign mux2_in_tm1_in1_wr = dmux0_out1_wr;

		// mux3 IO
		assign mux3_in_tm2_in0_wr = tm_out2_arrange;
		assign mux3_in_tm2_in1_wr = 0;

		// mux4 IO
		assign mux4_in_csb1_0_wr = tm_csb1_arrange;
		assign mux4_in_csb1_1_wr = tm_CSB1;

		// mux5 IO
		assign mux5_in_addr1_0_wr = tm_addr1_arrange;
		assign mux5_in_addr1_1_wr = tm_A1;

		// mux6 IO
		assign mux6_in_oeb1_0_wr = tm_oeb1_arrange;
		assign mux6_in_oeb1_1_wr = tm_OEB1;

		// mux7 IO
		assign mux7_in_web1_0_wr = tm_web1_arrange;
		assign mux7_in_web1_1_wr = tm_WEB1;

		// mux8 IO
		assign mux8_in_csb2_0_wr = tm_csb2_arrange;
		assign mux8_in_csb2_1_wr = tm_CSB2;

		// mux9 IO
		assign mux9_in_addr2_0_wr = tm_addr2_arrange;
		assign mux9_in_addr2_1_wr = tm_A2;

		// mux10 IO
		assign mux10_in_oeb2_0_wr = tm_oeb2_arrange;
		assign mux10_in_oeb2_1_wr = tm_OEB2;

		// mux11 IO
		assign mux11_in_web2_0_wr = tm_web2_arrange;
		assign mux11_in_web2_1_wr = tm_WEB2;

		// mux12 IO
		assign mux12_in_output_0_wr = dm_O1;
		assign mux12_in_output_1_wr = tm_O1;
		assign data_out = mux12_out_output_0_wr;

		// dmux0 IO - done
		assign dmux0_in0_wr = dout_fft_accel;

		//dmux1 IO - done
		assign dmux1_in0_wr = tm_O1;
		

		// multw - mapping IO
		assign multw_in0 = fm_O1;
		assign multw_in1 = dm_O1;

		// tmem input/output
		assign tm_I1 = mux2_out_tm1_out0_wr;
		assign tm_I2 = tm_out2_arrange;

		

		//--- instantiate hardware

			//--- mux0
			// mux_data	#(.width(bus_width)) mux_0(.sel0(sel_mux0), .in0(mux0_in0_wr), .in1(mux0_in1_wr), .out0(mux0_out0_wr));

			//--- mux1
			mux_data #(.width(bus_width)) mux_1(.sel0(sel_mux1), .in0(mux1_in0_wr), .in1(mux1_in1_wr), .out0(mux1_out0_wr));

			//--- mux2
			mux_data #(.width(bus_width)) mux_2(.sel0(sel_mux2), .in0(mux2_in_tm1_in0_wr), .in1(mux2_in_tm1_in1_wr), .out0(mux2_out_tm1_out0_wr));

			//--- mux3
			mux_data #(.width(bus_width)) mux_3(.sel0(sel_mux2), .in0(mux3_in_tm2_in0_wr), .in1(mux3_in_tm2_in1_wr), .out0(mux3_out_tm2_out0_wr));

			//--- mux4
			mux_data #(.width(16)) mux_4(.sel0(sel_mux2), .in0(mux4_in_csb1_0_wr), .in1(mux4_in_csb1_1_wr), .out0(mux4_out_csb1_0_wr));

			//--- mux5
			mux_data #(.width(4)) mux_5(.sel0(sel_mux2), .in0(mux5_in_addr1_0_wr), .in1(mux5_in_addr1_1_wr), .out0(mux5_out_addr1_0_wr));

			//--- mux6
			mux_data #(.width(1)) mux_6(.sel0(sel_mux2), .in0(mux6_in_oeb1_0_wr), .in1(mux6_in_oeb1_1_wr), .out0(mux6_out_oeb1_0_wr));

			//--- mux7
			mux_data #(.width(1)) mux_7(.sel0(sel_mux2), .in0(mux7_in_web1_0_wr), .in1(mux7_in_web1_1_wr), .out0(mux7_out_web1_0_wr));

			//--- mux8
			mux_data #(.width(16)) mux_8(.sel0(sel_mux2), .in0(mux8_in_csb2_0_wr), .in1(mux8_in_csb2_1_wr), .out0(mux8_out_csb2_0_wr));

			//--- mux9
			mux_data #(.width(4)) mux_9(.sel0(sel_mux2), .in0(mux9_in_addr2_0_wr), .in1(mux9_in_addr2_1_wr), .out0(mux9_out_addr2_0_wr));

			//--- mux10
			mux_data #(.width(1)) mux_10(.sel0(sel_mux2), .in0(mux10_in_oeb2_0_wr), .in1(mux10_in_oeb2_1_wr), .out0(mux10_out_oeb2_0_wr));

			//--- mux11
			mux_data #(.width(1)) mux_11(.sel0(sel_mux2), .in0(mux11_in_web2_0_wr), .in1(mux11_in_web2_1_wr), .out0(mux11_out_web2_0_wr));

			//--- mux12
			mux_data #(.width(bus_width)) mux_12(.sel0(sel_mux3), .in0(mux12_in_output_0_wr), .in1(mux12_in_output_1_wr), .out0(mux12_out_output_0_wr));


			
			//--- dmux0
			dmux_fft #(.width(bus_width)) dmux0(.sel0(sel_dmux0), .in0(dmux0_in0_wr), .out0(dmux0_out0_wr), .out1(dmux0_out1_wr));

			//--- dmux1
			dmux_fft #(.width(bus_width)) dmux1(.sel0(sel_dmux1), .in0(dmux1_in0_wr), .out0(dmux1_out0_wr), .out1(dmux1_out1_wr));
			
			
			
			mul_tw #(.width(width)) 
				inst_mul_tw 
				(
					.clk  (clk),
					.rst  (rst),
					.ce   (ce_mul),
					.in0  (multw_in0),
					.in1  (multw_in1),
					.out0 (multw_out0),
					.ready(mul_ready)
				);

			initial begin
				#430
				$display("multw_in0=%d",multw_in0);
				$display("multw_in1=%d",multw_in1);
			end

			//--- arrange

			
		arrange inst_arrange 
			(
				.clk       (clk),
				.rst       (rst),
				.data_valid(mul_ready),
				.read_data (read_data),
				.mode      (mode),
				.position  (position),
				.in_data   (multw_out0),
				.tm_csb1   (tm_csb1_arrange),
				.tm_addr1  (tm_addr1_arrange),
				.out1      (tm_out1_arrange),
				.tm_oeb1   (tm_oeb1_arrange),
				.tm_web1   (tm_web1_arrange),
				.tm_csb2   (tm_csb2_arrange),
				.tm_addr2  (tm_addr2_arrange),
				.out2      (tm_out2_arrange),
				.tm_oeb2   (tm_oeb2_arrange),
				.tm_web2   (tm_web2_arrange),
				.done      (done_arrange)
			);

			always @ (posedge clk or posedge rst) begin
				if(rst) begin
					dm_OEB1_reg <= 0;
					dm_OEB2_reg <= 0;
					fm_OEB1_reg <= 0;
					fm_OEB2_reg <= 0;
					tm_OEB1_reg <= 0;
					tm_OEB2_reg <= 0;
				end
				else begin
					dm_OEB1_reg <= dm_OEB1;
					dm_OEB2_reg <= dm_OEB2;
					fm_OEB1_reg <= fm_OEB1;
					fm_OEB2_reg <= fm_OEB2;
					tm_OEB1_reg <= mux6_out_oeb1_0_wr;
					tm_OEB2_reg <= mux10_out_oeb2_0_wr;
				end
			end
			//-- dmem
			dmem inst_dmem 
			(
				.CE1 (dm_CE1),
				.WEB1(dm_WEB1),
				.OEB1(dm_OEB1_reg),
				.CSB1(dm_CSB1),
				.A1  (dm_A1),
				.I1  (dm_I1),
				.O1  (dm_O1),
				.CE2 (dm_CE2),
				.WEB2(dm_WEB2),
				.OEB2(dm_OEB2_reg),
				.CSB2(dm_CSB2),
				.A2  (dm_A2),
				.I2  (dm_I2),
				.O2  (dm_O2)
			);

			//-- fmem
			fmem inst_fmem 
			(
				.CE1 (fm_CE1),
				.WEB1(fm_WEB1),
				.OEB1(fm_OEB1_reg),
				.CSB1(fm_CSB1),
				.A1  (fm_A1),
				.I1  (fm_I1),
				.O1  (fm_O1), 
				.CE2 (fm_CE2),
				.WEB2(fm_WEB2),
				.OEB2(fm_OEB2_reg),
				.CSB2(fm_CSB2),
				.A2  (fm_A2),
				.I2  (fm_I2),
				.O2  (fm_O2) 
			);

			//-- tmem
			tmem inst_tmem 
			(
				.CE1 (tm_CE1),
				.WEB1(mux7_out_web1_0_wr), 
				.OEB1(tm_OEB1_reg), 
				.CSB1(mux4_out_csb1_0_wr), 
				.A1  (mux5_out_addr1_0_wr), 
				.I1  (tm_I1), 
				.O1  (tm_O1), 
				.CE2 (tm_CE2),
				.WEB2(mux11_out_web2_0_wr),
				.OEB2(tm_OEB2_reg),
				.CSB2(mux8_out_csb2_0_wr),
				.A2  (mux9_out_addr2_0_wr),
				.I2  (tm_I2), 
				.O2  (tm_O2)
			);


			//-- fft128_accel

	
			fft128_accel #(.width(width), .size(size)) 
				inst_fft128_accel 
				(
					.clk      (clk      ),
					.rst      (rst      ),
					.stall    (stall    ),
					.sel_fft  (sel_fft  ),
					.shift_data(shift_data),
					.x0_in    (x0_in    ),
					.x1_in    (x1_in    ),
					.x2_in    (x2_in    ),
					.x3_in    (x3_in    ),
					.x4_in    (x4_in    ),
					.x5_in    (x5_in    ),
					.x6_in    (x6_in    ),
					.x7_in    (x7_in    ),
					.x8_in    (x8_in    ),
					.x9_in    (x9_in    ),
					.x10_in   (x10_in   ),
					.x11_in   (x11_in   ),
					.x12_in   (x12_in   ),
					.x13_in   (x13_in   ),
					.x14_in   (x14_in   ),
					.x15_in   (x15_in   ),
					.x16_in   (x16_in   ),
					.x17_in   (x17_in   ),
					.x18_in   (x18_in   ),
					.x19_in   (x19_in   ),
					.x20_in   (x20_in   ),
					.x21_in   (x21_in   ),
					.x22_in   (x22_in   ),
					.x23_in   (x23_in   ),
					.x24_in   (x24_in   ),
					.x25_in   (x25_in   ),
					.x26_in   (x26_in   ),
					.x27_in   (x27_in   ),
					.x28_in   (x28_in   ),
					.x29_in   (x29_in   ),
					.x30_in   (x30_in   ),
					.x31_in   (x31_in   ),
					.x32_in   (x32_in   ),
					.x33_in   (x33_in   ),
					.x34_in   (x34_in   ),
					.x35_in   (x35_in   ),
					.x36_in   (x36_in   ),
					.x37_in   (x37_in   ),
					.x38_in   (x38_in   ),
					.x39_in   (x39_in   ),
					.x40_in   (x40_in   ),
					.x41_in   (x41_in   ),
					.x42_in   (x42_in   ),
					.x43_in   (x43_in   ),
					.x44_in   (x44_in   ),
					.x45_in   (x45_in   ),
					.x46_in   (x46_in   ),
					.x47_in   (x47_in   ),
					.x48_in   (x48_in   ),
					.x49_in   (x49_in   ),
					.x50_in   (x50_in   ),
					.x51_in   (x51_in   ),
					.x52_in   (x52_in   ),
					.x53_in   (x53_in   ),
					.x54_in   (x54_in   ),
					.x55_in   (x55_in   ),
					.x56_in   (x56_in   ),
					.x57_in   (x57_in   ),
					.x58_in   (x58_in   ),
					.x59_in   (x59_in   ),
					.x60_in   (x60_in   ),
					.x61_in   (x61_in   ),
					.x62_in   (x62_in   ),
					.x63_in   (x63_in   ),
					.x64_in   (x64_in   ),
					.x65_in   (x65_in   ),
					.x66_in   (x66_in   ),
					.x67_in   (x67_in   ),
					.x68_in   (x68_in   ),
					.x69_in   (x69_in   ),
					.x70_in   (x70_in   ),
					.x71_in   (x71_in   ),
					.x72_in   (x72_in   ),
					.x73_in   (x73_in   ),
					.x74_in   (x74_in   ),
					.x75_in   (x75_in   ),
					.x76_in   (x76_in   ),
					.x77_in   (x77_in   ),
					.x78_in   (x78_in   ),
					.x79_in   (x79_in   ),
					.x80_in   (x80_in   ),
					.x81_in   (x81_in   ),
					.x82_in   (x82_in   ),
					.x83_in   (x83_in   ),
					.x84_in   (x84_in   ),
					.x85_in   (x85_in   ),
					.x86_in   (x86_in   ),
					.x87_in   (x87_in   ),
					.x88_in   (x88_in   ),
					.x89_in   (x89_in   ),
					.x90_in   (x90_in   ),
					.x91_in   (x91_in   ),
					.x92_in   (x92_in   ),
					.x93_in   (x93_in   ),
					.x94_in   (x94_in   ),
					.x95_in   (x95_in   ),
					.x96_in   (x96_in   ),
					.x97_in   (x97_in   ),
					.x98_in   (x98_in   ),
					.x99_in   (x99_in   ),
					.x100_in  (x100_in  ),
					.x101_in  (x101_in  ),
					.x102_in  (x102_in  ),
					.x103_in  (x103_in  ),
					.x104_in  (x104_in  ),
					.x105_in  (x105_in  ),
					.x106_in  (x106_in  ),
					.x107_in  (x107_in  ),
					.x108_in  (x108_in  ),
					.x109_in  (x109_in  ),
					.x110_in  (x110_in  ),
					.x111_in  (x111_in  ),
					.x112_in  (x112_in  ),
					.x113_in  (x113_in  ),
					.x114_in  (x114_in  ),
					.x115_in  (x115_in  ),
					.x116_in  (x116_in  ),
					.x117_in  (x117_in  ),
					.x118_in  (x118_in  ),
					.x119_in  (x119_in  ),
					.x120_in  (x120_in  ),
					.x121_in  (x121_in  ),
					.x122_in  (x122_in  ),
					.x123_in  (x123_in  ),
					.x124_in  (x124_in  ),
					.x125_in  (x125_in  ),
					.x126_in  (x126_in  ),
					.x127_in  (x127_in  ),
					.stall_out(stall_out),
					.x0_out   (x0_out   ),
					.x1_out   (x1_out   ),
					.x2_out   (x2_out   ),
					.x3_out   (x3_out   ),
					.x4_out   (x4_out   ),
					.x5_out   (x5_out   ),
					.x6_out   (x6_out   ),
					.x7_out   (x7_out   ),
					.x8_out   (x8_out   ),
					.x9_out   (x9_out   ),
					.x10_out  (x10_out  ),
					.x11_out  (x11_out  ),
					.x12_out  (x12_out  ),
					.x13_out  (x13_out  ),
					.x14_out  (x14_out  ),
					.x15_out  (x15_out  ),
					.x16_out  (x16_out  ),
					.x17_out  (x17_out  ),
					.x18_out  (x18_out  ),
					.x19_out  (x19_out  ),
					.x20_out  (x20_out  ),
					.x21_out  (x21_out  ),
					.x22_out  (x22_out  ),
					.x23_out  (x23_out  ),
					.x24_out  (x24_out  ),
					.x25_out  (x25_out  ),
					.x26_out  (x26_out  ),
					.x27_out  (x27_out  ),
					.x28_out  (x28_out  ),
					.x29_out  (x29_out  ),
					.x30_out  (x30_out  ),
					.x31_out  (x31_out  ),
					.x32_out  (x32_out  ),
					.x33_out  (x33_out  ),
					.x34_out  (x34_out  ),
					.x35_out  (x35_out  ),
					.x36_out  (x36_out  ),
					.x37_out  (x37_out  ),
					.x38_out  (x38_out  ),
					.x39_out  (x39_out  ),
					.x40_out  (x40_out  ),
					.x41_out  (x41_out  ),
					.x42_out  (x42_out  ),
					.x43_out  (x43_out  ),
					.x44_out  (x44_out  ),
					.x45_out  (x45_out  ),
					.x46_out  (x46_out  ),
					.x47_out  (x47_out  ),
					.x48_out  (x48_out  ),
					.x49_out  (x49_out  ),
					.x50_out  (x50_out  ),
					.x51_out  (x51_out  ),
					.x52_out  (x52_out  ),
					.x53_out  (x53_out  ),
					.x54_out  (x54_out  ),
					.x55_out  (x55_out  ),
					.x56_out  (x56_out  ),
					.x57_out  (x57_out  ),
					.x58_out  (x58_out  ),
					.x59_out  (x59_out  ),
					.x60_out  (x60_out  ),
					.x61_out  (x61_out  ),
					.x62_out  (x62_out  ),
					.x63_out  (x63_out  ),
					.x64_out  (x64_out  ),
					.x65_out  (x65_out  ),
					.x66_out  (x66_out  ),
					.x67_out  (x67_out  ),
					.x68_out  (x68_out  ),
					.x69_out  (x69_out  ),
					.x70_out  (x70_out  ),
					.x71_out  (x71_out  ),
					.x72_out  (x72_out  ),
					.x73_out  (x73_out  ),
					.x74_out  (x74_out  ),
					.x75_out  (x75_out  ),
					.x76_out  (x76_out  ),
					.x77_out  (x77_out  ),
					.x78_out  (x78_out  ),
					.x79_out  (x79_out  ),
					.x80_out  (x80_out  ),
					.x81_out  (x81_out  ),
					.x82_out  (x82_out  ),
					.x83_out  (x83_out  ),
					.x84_out  (x84_out  ),
					.x85_out  (x85_out  ),
					.x86_out  (x86_out  ),
					.x87_out  (x87_out  ),
					.x88_out  (x88_out  ),
					.x89_out  (x89_out  ),
					.x90_out  (x90_out  ),
					.x91_out  (x91_out  ),
					.x92_out  (x92_out  ),
					.x93_out  (x93_out  ),
					.x94_out  (x94_out  ),
					.x95_out  (x95_out  ),
					.x96_out  (x96_out  ),
					.x97_out  (x97_out  ),
					.x98_out  (x98_out  ),
					.x99_out  (x99_out  ),
					.x100_out (x100_out ),
					.x101_out (x101_out ),
					.x102_out (x102_out ),
					.x103_out (x103_out ),
					.x104_out (x104_out ),
					.x105_out (x105_out ),
					.x106_out (x106_out ),
					.x107_out (x107_out ),
					.x108_out (x108_out ),
					.x109_out (x109_out ),
					.x110_out (x110_out ),
					.x111_out (x111_out ),
					.x112_out (x112_out ),
					.x113_out (x113_out ),
					.x114_out (x114_out ),
					.x115_out (x115_out ),
					.x116_out (x116_out ),
					.x117_out (x117_out ),
					.x118_out (x118_out ),
					.x119_out (x119_out ),
					.x120_out (x120_out ),
					.x121_out (x121_out ),
					.x122_out (x122_out ),
					.x123_out (x123_out ),
					.x124_out (x124_out ),
					.x125_out (x125_out ),
					.x126_out (x126_out ),
					.x127_out (x127_out )
				);

			
			


endmodule // datapath