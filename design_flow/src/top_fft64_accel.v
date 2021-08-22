`include "localmem_defines.h"

//======================================================
module top_fft64_accel
#(
		//--- data bus-width
			parameter bus_width = 96*16,
		//--- data bit-width
			parameter width = 24,
		//--- fft size
			parameter size=64,
		//--- parameter of tmem
		parameter   num_bank = 32
)
(
		//--- general control
			input	    			clk, rst, stall,
			input	[4:0]		sel_fft,

			input				sel_mux0, sel_mux1,
			input 				sel_dmux0, sel_dmux1,
		//--- DMEM control
			//port 1
			input 	[`DMEM_NUM_BANK-1:0]	dmem_CE1,
			input 								dmem_WEB1,
			input 								dmem_OEB1,
			input 	[`DMEM_ADDR-1:0] 		dmem_A1,
			//port 2
			input 	[`DMEM_NUM_BANK-1:0]	dmem_CE2,			
			input 								dmem_WEB2,
			input 								dmem_OEB2,
			input 	[`DMEM_ADDR-1:0]			dmem_A2,
		//--- FMEM control
			input 								fmem_CE1,
			input 								fmem_WEB1,
			input 								fmem_OEB1,
			input 								fmem_CSB1,
			input 	[`FM_ADDR-1:0] 			fmem_A1,
		//--- TMEM control
			//--- Port 1
			input 								tmem_CE1,
			input 								tmem_WEB1,
			input 								tmem_OEB1,
			input 								tmem_CSB1,
			input 	[5:0] 						tmem_A1,
			//--- Port 2
			input 								tmem_CE2,
			input 								tmem_WEB2,
			input 								tmem_OEB2,
			input 								tmem_CSB2,
			input 	[5:0] 						tmem_A2,
		//--- input
			input	[bus_width-1:0]			data_in,
			input 	[bus_width-1:0]			data_in_fmem,
		//--- output
			output	[bus_width-1:0] 			data_out

);
		
		//--- signal definition
			//mux0
			wire		[bus_width-1:0]	mux0_in0_wr;
			wire		[bus_width-1:0]	mux0_in1_wr;
			wire		[bus_width-1:0] 	mux0_out0_wr;

			//mux1
			wire		[bus_width-1:0]	mux1_in0_wr;
			wire		[bus_width-1:0]	mux1_in1_wr;
			wire		[bus_width-1:0] 	mux1_out0_wr;

			//dmux0
			wire		[bus_width-1:0] 	dmux0_in0_wr;
			wire		[bus_width-1:0] 	dmux0_out0_wr;
			wire		[bus_width-1:0] 	dmux0_out1_wr;

			//dmux1
			wire		[bus_width-1:0] 	dmux1_in0_wr;
			wire		[bus_width-1:0] 	dmux1_out0_wr;
			wire		[bus_width-1:0] 	dmux1_out1_wr;

			//dmem
			wire	 	[`DM_COLS-1:0] 	dmem_I1;
			wire	 	[`DM_COLS-1:0] 	dmem_O1;
			wire	 	[`DM_COLS-1:0] 	dmem_I2;
			wire	 	[`DM_COLS-1:0]	dmem_O2;
			wire	 	[`DM_BANK_COLS-1:0] dmem_SEQ_O1;
			wire	 	[`DM_BANK_COLS-1:0] dmem_SEQ_O2;

			//fmem
			wire	 	[`FM_COLS-1:0] 		fmem_I1;
			wire	 	[`FM_COLS-1:0] 		fmem_O1;
			wire	 	[`FM_BANK_COLS-1:0] fmem_SEQ_O1;

			//tmem
			wire	 	[24*num_bank-1:0] 	tmem_I1;
			wire	 	[24*num_bank-1:0] 	tmem_O1;
			wire	 	[24*num_bank-1:0] 	tmem_I2;
			wire	 	[24*num_bank-1:0]	tmem_O2;

			//mul tw
			wire		[`DM_BANK_COLS-1:0] multw_in0;
			wire		[`DM_BANK_COLS-1:0] multw_in1;
			wire		[`DM_BANK_COLS-1:0] multw_out0;

			//fft_accel
			wire       [width-1:0]       fft_x0_in;
			wire       [width-1:0]       fft_x1_in;
			wire       [width-1:0]       fft_x2_in;
			wire       [width-1:0]       fft_x3_in;
			wire       [width-1:0]       fft_x4_in;
			wire       [width-1:0]       fft_x5_in;
			wire       [width-1:0]       fft_x6_in;
			wire       [width-1:0]       fft_x7_in;
			wire       [width-1:0]       fft_x8_in;
			wire       [width-1:0]       fft_x9_in;
			wire       [width-1:0]       fft_x10_in;
			wire       [width-1:0]       fft_x11_in;
			wire       [width-1:0]       fft_x12_in;
			wire       [width-1:0]       fft_x13_in;
			wire       [width-1:0]       fft_x14_in;
			wire       [width-1:0]       fft_x15_in;
			wire       [width-1:0]       fft_x16_in;
			wire       [width-1:0]       fft_x17_in;
			wire       [width-1:0]       fft_x18_in;
			wire       [width-1:0]       fft_x19_in;
			wire       [width-1:0]       fft_x20_in;
			wire       [width-1:0]       fft_x21_in;
			wire       [width-1:0]       fft_x22_in;
			wire       [width-1:0]       fft_x23_in;
			wire       [width-1:0]       fft_x24_in;
			wire       [width-1:0]       fft_x25_in;
			wire       [width-1:0]       fft_x26_in;
			wire       [width-1:0]       fft_x27_in;
			wire       [width-1:0]       fft_x28_in;
			wire       [width-1:0]       fft_x29_in;
			wire       [width-1:0]       fft_x30_in;
			wire       [width-1:0]       fft_x31_in;
			wire       [width-1:0]       fft_x32_in;
			wire       [width-1:0]       fft_x33_in;
			wire       [width-1:0]       fft_x34_in;
			wire       [width-1:0]       fft_x35_in;
			wire       [width-1:0]       fft_x36_in;
			wire       [width-1:0]       fft_x37_in;
			wire       [width-1:0]       fft_x38_in;
			wire       [width-1:0]       fft_x39_in;
			wire       [width-1:0]       fft_x40_in;
			wire       [width-1:0]       fft_x41_in;
			wire       [width-1:0]       fft_x42_in;
			wire       [width-1:0]       fft_x43_in;
			wire       [width-1:0]       fft_x44_in;
			wire       [width-1:0]       fft_x45_in;
			wire       [width-1:0]       fft_x46_in;
			wire       [width-1:0]       fft_x47_in;
			wire       [width-1:0]       fft_x48_in;
			wire       [width-1:0]       fft_x49_in;
			wire       [width-1:0]       fft_x50_in;
			wire       [width-1:0]       fft_x51_in;
			wire       [width-1:0]       fft_x52_in;
			wire       [width-1:0]       fft_x53_in;
			wire       [width-1:0]       fft_x54_in;
			wire       [width-1:0]       fft_x55_in;
			wire       [width-1:0]       fft_x56_in;
			wire       [width-1:0]       fft_x57_in;
			wire       [width-1:0]       fft_x58_in;
			wire       [width-1:0]       fft_x59_in;
			wire       [width-1:0]       fft_x60_in;
			wire       [width-1:0]       fft_x61_in;
			wire       [width-1:0]       fft_x62_in;
			wire       [width-1:0]       fft_x63_in;
			wire        [width-1:0]       fft_x0_out; 
			wire        [width-1:0]       fft_x1_out; 
			wire        [width-1:0]       fft_x2_out; 
			wire        [width-1:0]       fft_x3_out; 
			wire        [width-1:0]       fft_x4_out; 
			wire        [width-1:0]       fft_x5_out; 
			wire        [width-1:0]       fft_x6_out; 
			wire        [width-1:0]       fft_x7_out; 
			wire        [width-1:0]       fft_x8_out; 
			wire        [width-1:0]       fft_x9_out; 
			wire        [width-1:0]       fft_x10_out;
			wire        [width-1:0]       fft_x11_out;
			wire        [width-1:0]       fft_x12_out;
			wire        [width-1:0]       fft_x13_out;
			wire        [width-1:0]       fft_x14_out;
			wire        [width-1:0]       fft_x15_out;
			wire        [width-1:0]       fft_x16_out;
			wire        [width-1:0]       fft_x17_out;
			wire        [width-1:0]       fft_x18_out;
			wire        [width-1:0]       fft_x19_out;
			wire        [width-1:0]       fft_x20_out;
			wire        [width-1:0]       fft_x21_out;
			wire        [width-1:0]       fft_x22_out;
			wire        [width-1:0]       fft_x23_out;
			wire        [width-1:0]       fft_x24_out;
			wire        [width-1:0]       fft_x25_out;
			wire        [width-1:0]       fft_x26_out;
			wire        [width-1:0]       fft_x27_out;
			wire        [width-1:0]       fft_x28_out;
			wire        [width-1:0]       fft_x29_out;
			wire        [width-1:0]       fft_x30_out;
			wire        [width-1:0]       fft_x31_out;
			wire        [width-1:0]       fft_x32_out;
			wire        [width-1:0]       fft_x33_out;
			wire        [width-1:0]       fft_x34_out;
			wire        [width-1:0]       fft_x35_out;
			wire        [width-1:0]       fft_x36_out;
			wire        [width-1:0]       fft_x37_out;
			wire        [width-1:0]       fft_x38_out;
			wire        [width-1:0]       fft_x39_out;
			wire        [width-1:0]       fft_x40_out;
			wire        [width-1:0]       fft_x41_out;
			wire        [width-1:0]       fft_x42_out;
			wire        [width-1:0]       fft_x43_out;
			wire        [width-1:0]       fft_x44_out;
			wire        [width-1:0]       fft_x45_out;
			wire        [width-1:0]       fft_x46_out;
			wire        [width-1:0]       fft_x47_out;
			wire        [width-1:0]       fft_x48_out;
			wire        [width-1:0]       fft_x49_out;
			wire        [width-1:0]       fft_x50_out;
			wire        [width-1:0]       fft_x51_out;
			wire        [width-1:0]       fft_x52_out;
			wire        [width-1:0]       fft_x53_out;
			wire        [width-1:0]       fft_x54_out;
			wire        [width-1:0]       fft_x55_out;
			wire        [width-1:0]       fft_x56_out;
			wire        [width-1:0]       fft_x57_out;
			wire        [width-1:0]       fft_x58_out;
			wire        [width-1:0]       fft_x59_out;
			wire        [width-1:0]       fft_x60_out;
			wire        [width-1:0]       fft_x61_out;
			wire        [width-1:0]       fft_x62_out;
			wire        [width-1:0]       fft_x63_out;

			wire		[bus_width-1:0]	din_fft_accel;
			wire		[bus_width-1:0] dout_fft_accel;

		//--- assign control signals
		// put data to input of fmem
		assign fmem_I1 = data_in_fmem;

		// merge 64 samples in/output of FFT_accel
		assign  {fft_x63_in,fft_x62_in,fft_x61_in,fft_x60_in,fft_x59_in,fft_x58_in,fft_x57_in,fft_x56_in,fft_x55_in,fft_x54_in,fft_x53_in,fft_x52_in,fft_x51_in,fft_x50_in,fft_x49_in,fft_x48_in,fft_x47_in,fft_x46_in,fft_x45_in,fft_x44_in,fft_x43_in,fft_x42_in,fft_x41_in,fft_x40_in,fft_x39_in,fft_x38_in,fft_x37_in,fft_x36_in,fft_x35_in,fft_x34_in,fft_x33_in,fft_x32_in,fft_x31_in,fft_x30_in,fft_x29_in,fft_x28_in,fft_x27_in,fft_x26_in,fft_x25_in,fft_x24_in,fft_x23_in,fft_x22_in,fft_x21_in,fft_x20_in,fft_x19_in,fft_x18_in,fft_x17_in,fft_x16_in,fft_x15_in,fft_x14_in,fft_x13_in,fft_x12_in,fft_x11_in,fft_x10_in,fft_x9_in,fft_x8_in,fft_x7_in,fft_x6_in,fft_x5_in,fft_x4_in,fft_x3_in,fft_x2_in,fft_x1_in,fft_x0_in} = din_fft_accel;
		assign dout_fft_accel = {fft_x63_out,fft_x62_out,fft_x61_out,fft_x60_out,fft_x59_out,fft_x58_out,fft_x57_out,fft_x56_out,fft_x55_out,fft_x54_out,fft_x53_out,fft_x52_out,fft_x51_out,fft_x50_out,fft_x49_out,fft_x48_out,fft_x47_out,fft_x46_out,fft_x45_out,fft_x44_out,fft_x43_out,fft_x42_out,fft_x41_out,fft_x40_out,fft_x39_out,fft_x38_out,fft_x37_out,fft_x36_out,fft_x35_out,fft_x34_out,fft_x33_out,fft_x32_out,fft_x31_out,fft_x30_out,fft_x29_out,fft_x28_out,fft_x27_out,fft_x26_out,fft_x25_out,fft_x24_out,fft_x23_out,fft_x22_out,fft_x21_out,fft_x20_out,fft_x19_out,fft_x18_out,fft_x17_out,fft_x16_out,fft_x15_out,fft_x14_out,fft_x13_out,fft_x12_out,fft_x11_out,fft_x10_out,fft_x9_out,fft_x8_out,fft_x7_out,fft_x6_out,fft_x5_out,fft_x4_out,fft_x3_out,fft_x2_out,fft_x1_out,fft_x0_out};

		// mux0 IO - done
		assign mux0_in0_wr = data_in;
		assign mux0_in1_wr = dmux0_out0_wr;
		assign dmem_I1 = mux0_out0_wr;
		// mux1 IO - done
		assign mux1_in0_wr = dmem_O1;
		assign mux1_in1_wr = dmux1_out0_wr;
		assign din_fft_accel = mux1_out0_wr;
		// dmux0 IO - done
		assign dmux0_in0_wr = dout_fft_accel;
		//dmux1 IO - done
		assign dmux1_in0_wr = {tmem_O2,tmem_O1};
		assign data_out = dmux1_out1_wr;
		// multw - mapping IO
		assign multw_in0 = dmem_SEQ_O2;
		assign multw_in1 = fmem_SEQ_O1;
		// tmem input/output
		assign tmem_I1 = ;
		//--- Instantiations
		//--- mux0
			mux_fft	#(.width(bus_width)) mux_0(.sel0(sel_mux0), .in0(mux0_in0_wr), .in1(mux0_in1_wr), .out0(mux0_out0_wr));

		//--- mux1
			mux_fft #(.width(bus_width)) mux_1(.sel0(sel_mux1), .in0(mux1_in0_wr), .in1(mux1_in1_wr),. out0(mux1_out0_wr));
		
		//--- dmux0
			dmux_fft #(width(bus_width)) dmux0(.sel0(sel_dmux0), .in0(dmux0_in0_wr), .out0(dmux0_out0_wr), .out1(dmux0_out1_wr));

		//--- dmux1
			dmux_fft #(width(bus_width)) dmux1(.sel0(sel_dmux1), .in0(dmux1_in0_wr), .out0(dmux1_out0_wr), .out1(dmux1_out1_wr));
		
		//--- DMEM instantiate
			dmem inst_dmem
			(
				.CE1	 (dmem_CE1),
				.WEB1    (dmem_WEB1),
				.OEB1    (dmem_OEB1),
				.CSB1    (dmem_CSB1),
				.A1      (dmem_A1),
				.I1      (dmem_I1),
				.O1      (dmem_O1),

				.CE2     (dmem_CE2),
				.WEB2    (dmem_WEB2),
				.OEB2    (dmem_OEB2),
				.CSB2    (dmem_CSB2),
				.A2      (dmem_A2),
				.I2      (dmem_I2),
				.O2      (dmem_O2),

				.SEQ_O1  (dmem_SEQ_O1),
				.SEQ_O2  (dmem_SEQ_O2)
			);

		//--- FMEM instantiate
			fmem inst_fmem
			(
				.CE1	 (fmem_CE1),
				.WEB1    (fmem_WEB1),
				.OEB1    (fmem_OEB1),
				.CSB1    (fmem_CSB1),
				.A1      (fmem_A1),
				.I1      (fmem_I1),
				.O1      (fmem_O1),
				.SEQ_O1  (fmem_SEQ_O1),
			);
		//--- TMEM instantiate
			tmem #(.num_bank(num_bank))
				inst_tmem
				(
					.CE1	 (tmem_CE1),
					.WEB1    (tmem_WEB1),
					.OEB1    (tmem_OEB1),
					.CSB1    (tmem_CSB1),
					.A1      (tmem_A1),
					.I1      (tmem_I1),
					.O1      (tmem_O1),

					.CE2     (tmem_CE2),
					.WEB2    (tmem_WEB2),
					.OEB2    (tmem_OEB2),
					.CSB2    (tmem_CSB2),
					.A2      (tmem_A2),
					.I2      (tmem_I2),
					.O2      (tmem_O2)
				);
		//--- mul twiddle factor
			mul_tw inst_mul_tw (.in0(multw_in0), .in1(multw_in1), .out0(multw_out0));

		//--- FFT64 accelerator
			fft64_accel (.width(width), .size(size))
				inst_fft64_accel
				(
					.clk 		(clk), 
					.rst        (rst), 
					.stall      (stall),
					.sel_fft    (sel_fft),
					.x0_in      (fft_x0_in),                 
					.x1_in      (fft_x1_in),                 
					.x2_in      (fft_x2_in),                 
					.x3_in      (fft_x3_in),                 
					.x4_in      (fft_x4_in),                 
					.x5_in      (fft_x5_in),                 
					.x6_in      (fft_x6_in),                 
					.x7_in      (fft_x7_in),                 
					.x8_in      (fft_x8_in),                 
					.x9_in      (fft_x9_in),                 
					.x10_in     (fft_x10_in),                
					.x11_in     (fft_x11_in),                
					.x12_in     (fft_x12_in),                
					.x13_in     (fft_x13_in),                
					.x14_in     (fft_x14_in),                
					.x15_in     (fft_x15_in),                
					.x16_in     (fft_x16_in),                
					.x17_in     (fft_x17_in),                
					.x18_in     (fft_x18_in),                
					.x19_in     (fft_x19_in),                
					.x20_in     (fft_x20_in),                
					.x21_in     (fft_x21_in),                
					.x22_in     (fft_x22_in),                
					.x23_in     (fft_x23_in),                
					.x24_in     (fft_x24_in),                
					.x25_in     (fft_x25_in),                
					.x26_in     (fft_x26_in),                
					.x27_in     (fft_x27_in),                
					.x28_in     (fft_x28_in),                
					.x29_in     (fft_x29_in),                
					.x30_in     (fft_x30_in),                
					.x31_in     (fft_x31_in),                
					.x32_in     (fft_x32_in),                
					.x33_in     (fft_x33_in),                
					.x34_in     (fft_x34_in),                
					.x35_in     (fft_x35_in),                
					.x36_in     (fft_x36_in),                
					.x37_in     (fft_x37_in),                
					.x38_in     (fft_x38_in),                
					.x39_in     (fft_x39_in),                
					.x40_in     (fft_x40_in),                
					.x41_in     (fft_x41_in),                
					.x42_in     (fft_x42_in),                
					.x43_in     (fft_x43_in),                
					.x44_in     (fft_x44_in),                
					.x45_in     (fft_x45_in),                
					.x46_in     (fft_x46_in),                
					.x47_in     (fft_x47_in),                
					.x48_in     (fft_x48_in),                
					.x49_in     (fft_x49_in),                
					.x50_in     (fft_x50_in),                
					.x51_in     (fft_x51_in),                
					.x52_in     (fft_x52_in),                
					.x53_in     (fft_x53_in),                
					.x54_in     (fft_x54_in),                
					.x55_in     (fft_x55_in),                
					.x56_in     (fft_x56_in),                
					.x57_in     (fft_x57_in),                
					.x58_in     (fft_x58_in),                
					.x59_in     (fft_x59_in),                
					.x60_in     (fft_x60_in),                
					.x61_in     (fft_x61_in),                
					.x62_in     (fft_x62_in),                
					.x63_in     (fft_x63_in),                
					.x0_out     (fft_x0_out),                
					.x1_out     (fft_x1_out),                
					.x2_out     (fft_x2_out),                
					.x3_out     (fft_x3_out),                
					.x4_out     (fft_x4_out),                
					.x5_out     (fft_x5_out),                
					.x6_out     (fft_x6_out),                
					.x7_out     (fft_x7_out),                
					.x8_out     (fft_x8_out),                
					.x9_out     (fft_x9_out),                
					.x10_out    (fft_x10_out),               
					.x11_out    (fft_x11_out),               
					.x12_out    (fft_x12_out),               
					.x13_out    (fft_x13_out),               
					.x14_out    (fft_x14_out),               
					.x15_out    (fft_x15_out),               
					.x16_out    (fft_x16_out),               
					.x17_out    (fft_x17_out),               
					.x18_out    (fft_x18_out),               
					.x19_out    (fft_x19_out),               
					.x20_out    (fft_x20_out),               
					.x21_out    (fft_x21_out),               
					.x22_out    (fft_x22_out),               
					.x23_out    (fft_x23_out),               
					.x24_out    (fft_x24_out),               
					.x25_out    (fft_x25_out),               
					.x26_out    (fft_x26_out),               
					.x27_out    (fft_x27_out),               
					.x28_out    (fft_x28_out),               
					.x29_out    (fft_x29_out),               
					.x30_out    (fft_x30_out),               
					.x31_out    (fft_x31_out),               
					.x32_out    (fft_x32_out),               
					.x33_out    (fft_x33_out),               
					.x34_out    (fft_x34_out),               
					.x35_out    (fft_x35_out),               
					.x36_out    (fft_x36_out),               
					.x37_out    (fft_x37_out),               
					.x38_out    (fft_x38_out),               
					.x39_out    (fft_x39_out),               
					.x40_out    (fft_x40_out),               
					.x41_out    (fft_x41_out),               
					.x42_out    (fft_x42_out),               
					.x43_out    (fft_x43_out),               
					.x44_out    (fft_x44_out),               
					.x45_out    (fft_x45_out),               
					.x46_out    (fft_x46_out),               
					.x47_out    (fft_x47_out),               
					.x48_out    (fft_x48_out),               
					.x49_out    (fft_x49_out),               
					.x50_out    (fft_x50_out),               
					.x51_out    (fft_x51_out),               
					.x52_out    (fft_x52_out),               
					.x53_out    (fft_x53_out),               
					.x54_out    (fft_x54_out),               
					.x55_out    (fft_x55_out),               
					.x56_out    (fft_x56_out),               
					.x57_out    (fft_x57_out),               
					.x58_out    (fft_x58_out),               
					.x59_out    (fft_x59_out),               
					.x60_out    (fft_x60_out),               
					.x61_out    (fft_x61_out),               
					.x62_out    (fft_x62_out),               
					.x63_out    (fft_x63_out)
				);
	
endmodule	// top_fft64_accel
