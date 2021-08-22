`include "macros.h"

module fft128_accel
#(
		//--- data bit-width
			parameter width = 24,
		//--- fft size
			parameter size = 128
)

(
		//--- control
			input			clk, rst, stall,
			input	[6:0]	sel_fft,

			input [6:0] shift_data,

		//--- inputs

			input	[width-1:0]	x0_in,
			input	[width-1:0]	x1_in,
			input	[width-1:0]	x2_in,
			input	[width-1:0]	x3_in,
			input	[width-1:0]	x4_in,
			input	[width-1:0]	x5_in,
			input	[width-1:0]	x6_in,
			input	[width-1:0]	x7_in,
			input	[width-1:0]	x8_in,
			input	[width-1:0]	x9_in,
			input	[width-1:0]	x10_in,
			input	[width-1:0]	x11_in,
			input	[width-1:0]	x12_in,
			input	[width-1:0]	x13_in,
			input	[width-1:0]	x14_in,
			input	[width-1:0]	x15_in,
			input	[width-1:0]	x16_in,
			input	[width-1:0]	x17_in,
			input	[width-1:0]	x18_in,
			input	[width-1:0]	x19_in,
			input	[width-1:0]	x20_in,
			input	[width-1:0]	x21_in,
			input	[width-1:0]	x22_in,
			input	[width-1:0]	x23_in,
			input	[width-1:0]	x24_in,
			input	[width-1:0]	x25_in,
			input	[width-1:0]	x26_in,
			input	[width-1:0]	x27_in,
			input	[width-1:0]	x28_in,
			input	[width-1:0]	x29_in,
			input	[width-1:0]	x30_in,
			input	[width-1:0]	x31_in,
			input	[width-1:0]	x32_in,
			input	[width-1:0]	x33_in,
			input	[width-1:0]	x34_in,
			input	[width-1:0]	x35_in,
			input	[width-1:0]	x36_in,
			input	[width-1:0]	x37_in,
			input	[width-1:0]	x38_in,
			input	[width-1:0]	x39_in,
			input	[width-1:0]	x40_in,
			input	[width-1:0]	x41_in,
			input	[width-1:0]	x42_in,
			input	[width-1:0]	x43_in,
			input	[width-1:0]	x44_in,
			input	[width-1:0]	x45_in,
			input	[width-1:0]	x46_in,
			input	[width-1:0]	x47_in,
			input	[width-1:0]	x48_in,
			input	[width-1:0]	x49_in,
			input	[width-1:0]	x50_in,
			input	[width-1:0]	x51_in,
			input	[width-1:0]	x52_in,
			input	[width-1:0]	x53_in,
			input	[width-1:0]	x54_in,
			input	[width-1:0]	x55_in,
			input	[width-1:0]	x56_in,
			input	[width-1:0]	x57_in,
			input	[width-1:0]	x58_in,
			input	[width-1:0]	x59_in,
			input	[width-1:0]	x60_in,
			input	[width-1:0]	x61_in,
			input	[width-1:0]	x62_in,
			input	[width-1:0]	x63_in,
			input	[width-1:0]	x64_in,
			input	[width-1:0]	x65_in,
			input	[width-1:0]	x66_in,
			input	[width-1:0]	x67_in,
			input	[width-1:0]	x68_in,
			input	[width-1:0]	x69_in,
			input	[width-1:0]	x70_in,
			input	[width-1:0]	x71_in,
			input	[width-1:0]	x72_in,
			input	[width-1:0]	x73_in,
			input	[width-1:0]	x74_in,
			input	[width-1:0]	x75_in,
			input	[width-1:0]	x76_in,
			input	[width-1:0]	x77_in,
			input	[width-1:0]	x78_in,
			input	[width-1:0]	x79_in,
			input	[width-1:0]	x80_in,
			input	[width-1:0]	x81_in,
			input	[width-1:0]	x82_in,
			input	[width-1:0]	x83_in,
			input	[width-1:0]	x84_in,
			input	[width-1:0]	x85_in,
			input	[width-1:0]	x86_in,
			input	[width-1:0]	x87_in,
			input	[width-1:0]	x88_in,
			input	[width-1:0]	x89_in,
			input	[width-1:0]	x90_in,
			input	[width-1:0]	x91_in,
			input	[width-1:0]	x92_in,
			input	[width-1:0]	x93_in,
			input	[width-1:0]	x94_in,
			input	[width-1:0]	x95_in,
			input	[width-1:0]	x96_in,
			input	[width-1:0]	x97_in,
			input	[width-1:0]	x98_in,
			input	[width-1:0]	x99_in,
			input	[width-1:0]	x100_in,
			input	[width-1:0]	x101_in,
			input	[width-1:0]	x102_in,
			input	[width-1:0]	x103_in,
			input	[width-1:0]	x104_in,
			input	[width-1:0]	x105_in,
			input	[width-1:0]	x106_in,
			input	[width-1:0]	x107_in,
			input	[width-1:0]	x108_in,
			input	[width-1:0]	x109_in,
			input	[width-1:0]	x110_in,
			input	[width-1:0]	x111_in,
			input	[width-1:0]	x112_in,
			input	[width-1:0]	x113_in,
			input	[width-1:0]	x114_in,
			input	[width-1:0]	x115_in,
			input	[width-1:0]	x116_in,
			input	[width-1:0]	x117_in,
			input	[width-1:0]	x118_in,
			input	[width-1:0]	x119_in,
			input	[width-1:0]	x120_in,
			input	[width-1:0]	x121_in,
			input	[width-1:0]	x122_in,
			input	[width-1:0]	x123_in,
			input	[width-1:0]	x124_in,
			input	[width-1:0]	x125_in,
			input	[width-1:0]	x126_in,
			input	[width-1:0]	x127_in,

		//--- outputs
			output 				stall_out,
			output	[width-1:0]	x0_out,
			output	[width-1:0]	x1_out,
			output	[width-1:0]	x2_out,
			output	[width-1:0]	x3_out,
			output	[width-1:0]	x4_out,
			output	[width-1:0]	x5_out,
			output	[width-1:0]	x6_out,
			output	[width-1:0]	x7_out,
			output	[width-1:0]	x8_out,
			output	[width-1:0]	x9_out,
			output	[width-1:0]	x10_out,
			output	[width-1:0]	x11_out,
			output	[width-1:0]	x12_out,
			output	[width-1:0]	x13_out,
			output	[width-1:0]	x14_out,
			output	[width-1:0]	x15_out,
			output	[width-1:0]	x16_out,
			output	[width-1:0]	x17_out,
			output	[width-1:0]	x18_out,
			output	[width-1:0]	x19_out,
			output	[width-1:0]	x20_out,
			output	[width-1:0]	x21_out,
			output	[width-1:0]	x22_out,
			output	[width-1:0]	x23_out,
			output	[width-1:0]	x24_out,
			output	[width-1:0]	x25_out,
			output	[width-1:0]	x26_out,
			output	[width-1:0]	x27_out,
			output	[width-1:0]	x28_out,
			output	[width-1:0]	x29_out,
			output	[width-1:0]	x30_out,
			output	[width-1:0]	x31_out,
			output	[width-1:0]	x32_out,
			output	[width-1:0]	x33_out,
			output	[width-1:0]	x34_out,
			output	[width-1:0]	x35_out,
			output	[width-1:0]	x36_out,
			output	[width-1:0]	x37_out,
			output	[width-1:0]	x38_out,
			output	[width-1:0]	x39_out,
			output	[width-1:0]	x40_out,
			output	[width-1:0]	x41_out,
			output	[width-1:0]	x42_out,
			output	[width-1:0]	x43_out,
			output	[width-1:0]	x44_out,
			output	[width-1:0]	x45_out,
			output	[width-1:0]	x46_out,
			output	[width-1:0]	x47_out,
			output	[width-1:0]	x48_out,
			output	[width-1:0]	x49_out,
			output	[width-1:0]	x50_out,
			output	[width-1:0]	x51_out,
			output	[width-1:0]	x52_out,
			output	[width-1:0]	x53_out,
			output	[width-1:0]	x54_out,
			output	[width-1:0]	x55_out,
			output	[width-1:0]	x56_out,
			output	[width-1:0]	x57_out,
			output	[width-1:0]	x58_out,
			output	[width-1:0]	x59_out,
			output	[width-1:0]	x60_out,
			output	[width-1:0]	x61_out,
			output	[width-1:0]	x62_out,
			output	[width-1:0]	x63_out,
			output	[width-1:0]	x64_out,
			output	[width-1:0]	x65_out,
			output	[width-1:0]	x66_out,
			output	[width-1:0]	x67_out,
			output	[width-1:0]	x68_out,
			output	[width-1:0]	x69_out,
			output	[width-1:0]	x70_out,
			output	[width-1:0]	x71_out,
			output	[width-1:0]	x72_out,
			output	[width-1:0]	x73_out,
			output	[width-1:0]	x74_out,
			output	[width-1:0]	x75_out,
			output	[width-1:0]	x76_out,
			output	[width-1:0]	x77_out,
			output	[width-1:0]	x78_out,
			output	[width-1:0]	x79_out,
			output	[width-1:0]	x80_out,
			output	[width-1:0]	x81_out,
			output	[width-1:0]	x82_out,
			output	[width-1:0]	x83_out,
			output	[width-1:0]	x84_out,
			output	[width-1:0]	x85_out,
			output	[width-1:0]	x86_out,
			output	[width-1:0]	x87_out,
			output	[width-1:0]	x88_out,
			output	[width-1:0]	x89_out,
			output	[width-1:0]	x90_out,
			output	[width-1:0]	x91_out,
			output	[width-1:0]	x92_out,
			output	[width-1:0]	x93_out,
			output	[width-1:0]	x94_out,
			output	[width-1:0]	x95_out,
			output	[width-1:0]	x96_out,
			output	[width-1:0]	x97_out,
			output	[width-1:0]	x98_out,
			output	[width-1:0]	x99_out,
			output	[width-1:0]	x100_out,
			output	[width-1:0]	x101_out,
			output	[width-1:0]	x102_out,
			output	[width-1:0]	x103_out,
			output	[width-1:0]	x104_out,
			output	[width-1:0]	x105_out,
			output	[width-1:0]	x106_out,
			output	[width-1:0]	x107_out,
			output	[width-1:0]	x108_out,
			output	[width-1:0]	x109_out,
			output	[width-1:0]	x110_out,
			output	[width-1:0]	x111_out,
			output	[width-1:0]	x112_out,
			output	[width-1:0]	x113_out,
			output	[width-1:0]	x114_out,
			output	[width-1:0]	x115_out,
			output	[width-1:0]	x116_out,
			output	[width-1:0]	x117_out,
			output	[width-1:0]	x118_out,
			output	[width-1:0]	x119_out,
			output	[width-1:0]	x120_out,
			output	[width-1:0]	x121_out,
			output	[width-1:0]	x122_out,
			output	[width-1:0]	x123_out,
			output	[width-1:0]	x124_out,
			output	[width-1:0]	x125_out,
			output	[width-1:0]	x126_out,
			output	[width-1:0]	x127_out
);

		//--- signal definition
			wire	[width-1:0]	coef[size-1:0];
			reg		[width-1:0]	a0_wr[size-1:0];
			wire	[width-1:0]	a1_wr[size-1:0];
			wire	[width-1:0]	a2_wr[size-1:0];
			wire	[width-1:0]	a3_wr[size-1:0];
			wire	[width-1:0]	a4_wr[size-1:0];
			wire	[width-1:0]	a5_wr[size-1:0];
			wire	[width-1:0]	a6_wr[size-1:0];
			wire	[width-1:0]	a7_wr[size-1:0];

			wire	[width-1:0]	mux_stage1[127:0];
			wire	[width-1:0]	mux_stage2[127:0];
			wire	[width-1:0]	mux_stage3[127:0];
			wire	[width-1:0]	mux_stage4[127:0];
			wire	[width-1:0]	mux_stage5[127:0];
			wire	[width-1:0]	mux_stage6[127:0];
			wire	[width-1:0]	mux_stage7[127:0];

			wire                     comb_stall;
			reg [6:0] sel_fft_latch;
			wire rst_fifo;

		//--- cofficient assignment
			assign coef[0] =    {12'b011111111111, 12'b000000000000};
			assign coef[1] =    {12'b011111111101, 12'b111110011100};
			assign coef[2] =    {12'b011111110101, 12'b111100110111};
			assign coef[3] =    {12'b011111101001, 12'b111011010100};
			assign coef[4] =    {12'b011111011000, 12'b111001110001};
			assign coef[5] =    {12'b011111000010, 12'b111000001111};
			assign coef[6] =    {12'b011110100111, 12'b110110101110};
			assign coef[7] =    {12'b011110000111, 12'b110101001110};
			assign coef[8] =    {12'b011101100011, 12'b110011110001};
			assign coef[9] =    {12'b011100111011, 12'b110010010101};
			assign coef[10] =   {12'b011100001101, 12'b110000111011};
			assign coef[11] =   {12'b011011011100, 12'b101111100100};
			assign coef[12] =   {12'b011010100110, 12'b101110001111};
			assign coef[13] =   {12'b011001101100, 12'b101100111101};
			assign coef[14] =   {12'b011000101110, 12'b101011101101};
			assign coef[15] =   {12'b010111101101, 12'b101010100001};
			assign coef[16] =   {12'b010110100111, 12'b101001011001};
			assign coef[17] =   {12'b010101011111, 12'b101000010011};
			assign coef[18] =   {12'b010100010011, 12'b100111010010};
			assign coef[19] =   {12'b010011000011, 12'b100110010100};
			assign coef[20] =   {12'b010001110001, 12'b100101011010};
			assign coef[21] =   {12'b010000011100, 12'b100100100100};
			assign coef[22] =   {12'b001111000101, 12'b100011110011};
			assign coef[23] =   {12'b001101101011, 12'b100011000101};
			assign coef[24] =   {12'b001100001111, 12'b100010011101};
			assign coef[25] =   {12'b001010110010, 12'b100001111001};
			assign coef[26] =   {12'b001001010010, 12'b100001011001};
			assign coef[27] =   {12'b000111110001, 12'b100000111110};
			assign coef[28] =   {12'b000110001111, 12'b100000101000};
			assign coef[29] =   {12'b000100101100, 12'b100000010111};
			assign coef[30] =   {12'b000011001001, 12'b100000001011};
			assign coef[31] =   {12'b000001100100, 12'b100000000011};
			assign coef[32] =   {12'b000000000000, 12'b100000000001};
			assign coef[33] =   {12'b111110011100, 12'b100000000011};
			assign coef[34] =   {12'b111100110111, 12'b100000001011};
			assign coef[35] =   {12'b111011010100, 12'b100000010111};
			assign coef[36] =   {12'b111001110001, 12'b100000101000};
			assign coef[37] =   {12'b111000001111, 12'b100000111110};
			assign coef[38] =   {12'b110110101110, 12'b100001011001};
			assign coef[39] =   {12'b110101001110, 12'b100001111001};
			assign coef[40] =   {12'b110011110001, 12'b100010011101};
			assign coef[41] =   {12'b110010010101, 12'b100011000101};
			assign coef[42] =   {12'b110000111011, 12'b100011110011};
			assign coef[43] =   {12'b101111100100, 12'b100100100100};
			assign coef[44] =   {12'b101110001111, 12'b100101011010};
			assign coef[45] =   {12'b101100111101, 12'b100110010100};
			assign coef[46] =   {12'b101011101101, 12'b100111010010};
			assign coef[47] =   {12'b101010100001, 12'b101000010011};
			assign coef[48] =   {12'b101001011001, 12'b101001011001};
			assign coef[49] =   {12'b101000010011, 12'b101010100001};
			assign coef[50] =   {12'b100111010010, 12'b101011101101};
			assign coef[51] =   {12'b100110010100, 12'b101100111101};
			assign coef[52] =   {12'b100101011010, 12'b101110001111};
			assign coef[53] =   {12'b100100100100, 12'b101111100100};
			assign coef[54] =   {12'b100011110011, 12'b110000111011};
			assign coef[55] =   {12'b100011000101, 12'b110010010101};
			assign coef[56] =   {12'b100010011101, 12'b110011110001};
			assign coef[57] =   {12'b100001111001, 12'b110101001110};
			assign coef[58] =   {12'b100001011001, 12'b110110101110};
			assign coef[59] =   {12'b100000111110, 12'b111000001111};
			assign coef[60] =   {12'b100000101000, 12'b111001110001};
			assign coef[61] =   {12'b100000010111, 12'b111011010100};
			assign coef[62] =   {12'b100000001011, 12'b111100110111};
			assign coef[63] =   {12'b100000000011, 12'b111110011100};

		//--- fifo stage
			
			fifo_v2 inst_fifo(.clk(clk), .rst(rst), .rst_fifo(rst_fifo), .shift_data(shift_data), .stall_out(stall_out));

			assign comb_stall = stall_out & stall;
			assign rst_fifo = (sel_fft_latch!=sel_fft) ? 1'b1 : 1'b0;

			always @ (posedge clk or posedge rst) begin
				if(rst) begin
					sel_fft_latch <= 7'b1111111;
				end
				else begin
					sel_fft_latch <= sel_fft;
				end
			end

			

		//--- input stage
			always @(posedge clk or posedge rst) begin
				if (rst) begin
					a0_wr[0]	<= 0;
					a0_wr[1]	<= 0;
					a0_wr[2]	<= 0;
					a0_wr[3]	<= 0;
					a0_wr[4]	<= 0;
					a0_wr[5]	<= 0;
					a0_wr[6]	<= 0;
					a0_wr[7]	<= 0;
					a0_wr[8]	<= 0;
					a0_wr[9]	<= 0;
					a0_wr[10]	<= 0;
					a0_wr[11]	<= 0;
					a0_wr[12]	<= 0;
					a0_wr[13]	<= 0;
					a0_wr[14]	<= 0;
					a0_wr[15]	<= 0;
					a0_wr[16]	<= 0;
					a0_wr[17]	<= 0;
					a0_wr[18]	<= 0;
					a0_wr[19]	<= 0;
					a0_wr[20]	<= 0;
					a0_wr[21]	<= 0;
					a0_wr[22]	<= 0;
					a0_wr[23]	<= 0;
					a0_wr[24]	<= 0;
					a0_wr[25]	<= 0;
					a0_wr[26]	<= 0;
					a0_wr[27]	<= 0;
					a0_wr[28]	<= 0;
					a0_wr[29]	<= 0;
					a0_wr[30]	<= 0;
					a0_wr[31]	<= 0;
					a0_wr[32]	<= 0;
					a0_wr[33]	<= 0;
					a0_wr[34]	<= 0;
					a0_wr[35]	<= 0;
					a0_wr[36]	<= 0;
					a0_wr[37]	<= 0;
					a0_wr[38]	<= 0;
					a0_wr[39]	<= 0;
					a0_wr[40]	<= 0;
					a0_wr[41]	<= 0;
					a0_wr[42]	<= 0;
					a0_wr[43]	<= 0;
					a0_wr[44]	<= 0;
					a0_wr[45]	<= 0;
					a0_wr[46]	<= 0;
					a0_wr[47]	<= 0;
					a0_wr[48]	<= 0;
					a0_wr[49]	<= 0;
					a0_wr[50]	<= 0;
					a0_wr[51]	<= 0;
					a0_wr[52]	<= 0;
					a0_wr[53]	<= 0;
					a0_wr[54]	<= 0;
					a0_wr[55]	<= 0;
					a0_wr[56]	<= 0;
					a0_wr[57]	<= 0;
					a0_wr[58]	<= 0;
					a0_wr[59]	<= 0;
					a0_wr[60]	<= 0;
					a0_wr[61]	<= 0;
					a0_wr[62]	<= 0;
					a0_wr[63]	<= 0;
					a0_wr[64]	<= 0;
					a0_wr[65]	<= 0;
					a0_wr[66]	<= 0;
					a0_wr[67]	<= 0;
					a0_wr[68]	<= 0;
					a0_wr[69]	<= 0;
					a0_wr[70]	<= 0;
					a0_wr[71]	<= 0;
					a0_wr[72]	<= 0;
					a0_wr[73]	<= 0;
					a0_wr[74]	<= 0;
					a0_wr[75]	<= 0;
					a0_wr[76]	<= 0;
					a0_wr[77]	<= 0;
					a0_wr[78]	<= 0;
					a0_wr[79]	<= 0;
					a0_wr[80]	<= 0;
					a0_wr[81]	<= 0;
					a0_wr[82]	<= 0;
					a0_wr[83]	<= 0;
					a0_wr[84]	<= 0;
					a0_wr[85]	<= 0;
					a0_wr[86]	<= 0;
					a0_wr[87]	<= 0;
					a0_wr[88]	<= 0;
					a0_wr[89]	<= 0;
					a0_wr[90]	<= 0;
					a0_wr[91]	<= 0;
					a0_wr[92]	<= 0;
					a0_wr[93]	<= 0;
					a0_wr[94]	<= 0;
					a0_wr[95]	<= 0;
					a0_wr[96]	<= 0;
					a0_wr[97]	<= 0;
					a0_wr[98]	<= 0;
					a0_wr[99]	<= 0;
					a0_wr[100]	<= 0;
					a0_wr[101]	<= 0;
					a0_wr[102]	<= 0;
					a0_wr[103]	<= 0;
					a0_wr[104]	<= 0;
					a0_wr[105]	<= 0;
					a0_wr[106]	<= 0;
					a0_wr[107]	<= 0;
					a0_wr[108]	<= 0;
					a0_wr[109]	<= 0;
					a0_wr[110]	<= 0;
					a0_wr[111]	<= 0;
					a0_wr[112]	<= 0;
					a0_wr[113]	<= 0;
					a0_wr[114]	<= 0;
					a0_wr[115]	<= 0;
					a0_wr[116]	<= 0;
					a0_wr[117]	<= 0;
					a0_wr[118]	<= 0;
					a0_wr[119]	<= 0;
					a0_wr[120]	<= 0;
					a0_wr[121]	<= 0;
					a0_wr[122]	<= 0;
					a0_wr[123]	<= 0;
					a0_wr[124]	<= 0;
					a0_wr[125]	<= 0;
					a0_wr[126]	<= 0;
					a0_wr[127]	<= 0;
				end
				else begin
					if (!stall) begin
						a0_wr[0]	<= x0_in;
						a0_wr[1]	<= x1_in;
						a0_wr[2]	<= x2_in;
						a0_wr[3]	<= x3_in;
						a0_wr[4]	<= x4_in;
						a0_wr[5]	<= x5_in;
						a0_wr[6]	<= x6_in;
						a0_wr[7]	<= x7_in;
						a0_wr[8]	<= x8_in;
						a0_wr[9]	<= x9_in;
						a0_wr[10]	<= x10_in;
						a0_wr[11]	<= x11_in;
						a0_wr[12]	<= x12_in;
						a0_wr[13]	<= x13_in;
						a0_wr[14]	<= x14_in;
						a0_wr[15]	<= x15_in;
						a0_wr[16]	<= x16_in;
						a0_wr[17]	<= x17_in;
						a0_wr[18]	<= x18_in;
						a0_wr[19]	<= x19_in;
						a0_wr[20]	<= x20_in;
						a0_wr[21]	<= x21_in;
						a0_wr[22]	<= x22_in;
						a0_wr[23]	<= x23_in;
						a0_wr[24]	<= x24_in;
						a0_wr[25]	<= x25_in;
						a0_wr[26]	<= x26_in;
						a0_wr[27]	<= x27_in;
						a0_wr[28]	<= x28_in;
						a0_wr[29]	<= x29_in;
						a0_wr[30]	<= x30_in;
						a0_wr[31]	<= x31_in;
						a0_wr[32]	<= x32_in;
						a0_wr[33]	<= x33_in;
						a0_wr[34]	<= x34_in;
						a0_wr[35]	<= x35_in;
						a0_wr[36]	<= x36_in;
						a0_wr[37]	<= x37_in;
						a0_wr[38]	<= x38_in;
						a0_wr[39]	<= x39_in;
						a0_wr[40]	<= x40_in;
						a0_wr[41]	<= x41_in;
						a0_wr[42]	<= x42_in;
						a0_wr[43]	<= x43_in;
						a0_wr[44]	<= x44_in;
						a0_wr[45]	<= x45_in;
						a0_wr[46]	<= x46_in;
						a0_wr[47]	<= x47_in;
						a0_wr[48]	<= x48_in;
						a0_wr[49]	<= x49_in;
						a0_wr[50]	<= x50_in;
						a0_wr[51]	<= x51_in;
						a0_wr[52]	<= x52_in;
						a0_wr[53]	<= x53_in;
						a0_wr[54]	<= x54_in;
						a0_wr[55]	<= x55_in;
						a0_wr[56]	<= x56_in;
						a0_wr[57]	<= x57_in;
						a0_wr[58]	<= x58_in;
						a0_wr[59]	<= x59_in;
						a0_wr[60]	<= x60_in;
						a0_wr[61]	<= x61_in;
						a0_wr[62]	<= x62_in;
						a0_wr[63]	<= x63_in;
						a0_wr[64]	<= x64_in;
						a0_wr[65]	<= x65_in;
						a0_wr[66]	<= x66_in;
						a0_wr[67]	<= x67_in;
						a0_wr[68]	<= x68_in;
						a0_wr[69]	<= x69_in;
						a0_wr[70]	<= x70_in;
						a0_wr[71]	<= x71_in;
						a0_wr[72]	<= x72_in;
						a0_wr[73]	<= x73_in;
						a0_wr[74]	<= x74_in;
						a0_wr[75]	<= x75_in;
						a0_wr[76]	<= x76_in;
						a0_wr[77]	<= x77_in;
						a0_wr[78]	<= x78_in;
						a0_wr[79]	<= x79_in;
						a0_wr[80]	<= x80_in;
						a0_wr[81]	<= x81_in;
						a0_wr[82]	<= x82_in;
						a0_wr[83]	<= x83_in;
						a0_wr[84]	<= x84_in;
						a0_wr[85]	<= x85_in;
						a0_wr[86]	<= x86_in;
						a0_wr[87]	<= x87_in;
						a0_wr[88]	<= x88_in;
						a0_wr[89]	<= x89_in;
						a0_wr[90]	<= x90_in;
						a0_wr[91]	<= x91_in;
						a0_wr[92]	<= x92_in;
						a0_wr[93]	<= x93_in;
						a0_wr[94]	<= x94_in;
						a0_wr[95]	<= x95_in;
						a0_wr[96]	<= x96_in;
						a0_wr[97]	<= x97_in;
						a0_wr[98]	<= x98_in;
						a0_wr[99]	<= x99_in;
						a0_wr[100]	<= x100_in;
						a0_wr[101]	<= x101_in;
						a0_wr[102]	<= x102_in;
						a0_wr[103]	<= x103_in;
						a0_wr[104]	<= x104_in;
						a0_wr[105]	<= x105_in;
						a0_wr[106]	<= x106_in;
						a0_wr[107]	<= x107_in;
						a0_wr[108]	<= x108_in;
						a0_wr[109]	<= x109_in;
						a0_wr[110]	<= x110_in;
						a0_wr[111]	<= x111_in;
						a0_wr[112]	<= x112_in;
						a0_wr[113]	<= x113_in;
						a0_wr[114]	<= x114_in;
						a0_wr[115]	<= x115_in;
						a0_wr[116]	<= x116_in;
						a0_wr[117]	<= x117_in;
						a0_wr[118]	<= x118_in;
						a0_wr[119]	<= x119_in;
						a0_wr[120]	<= x120_in;
						a0_wr[121]	<= x121_in;
						a0_wr[122]	<= x122_in;
						a0_wr[123]	<= x123_in;
						a0_wr[124]	<= x124_in;
						a0_wr[125]	<= x125_in;
						a0_wr[126]	<= x126_in;
						a0_wr[127]	<= x127_in;
					end
				end
			end

			//--- radix stage 0
			radix2 #(.width(width)) rd_st0_0   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[0]), .rdlo_in(a0_wr[64]),  .coef_in(coef[0]), .rdup_out(a1_wr[0]), .rdlo_out(a1_wr[64]));
			radix2 #(.width(width)) rd_st0_1   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[1]), .rdlo_in(a0_wr[65]),  .coef_in(coef[1]), .rdup_out(a1_wr[1]), .rdlo_out(a1_wr[65]));
			radix2 #(.width(width)) rd_st0_2   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[2]), .rdlo_in(a0_wr[66]),  .coef_in(coef[2]), .rdup_out(a1_wr[2]), .rdlo_out(a1_wr[66]));
			radix2 #(.width(width)) rd_st0_3   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[3]), .rdlo_in(a0_wr[67]),  .coef_in(coef[3]), .rdup_out(a1_wr[3]), .rdlo_out(a1_wr[67]));
			radix2 #(.width(width)) rd_st0_4   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[4]), .rdlo_in(a0_wr[68]),  .coef_in(coef[4]), .rdup_out(a1_wr[4]), .rdlo_out(a1_wr[68]));
			radix2 #(.width(width)) rd_st0_5   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[5]), .rdlo_in(a0_wr[69]),  .coef_in(coef[5]), .rdup_out(a1_wr[5]), .rdlo_out(a1_wr[69]));
			radix2 #(.width(width)) rd_st0_6   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[6]), .rdlo_in(a0_wr[70]),  .coef_in(coef[6]), .rdup_out(a1_wr[6]), .rdlo_out(a1_wr[70]));
			radix2 #(.width(width)) rd_st0_7   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[7]), .rdlo_in(a0_wr[71]),  .coef_in(coef[7]), .rdup_out(a1_wr[7]), .rdlo_out(a1_wr[71]));
			radix2 #(.width(width)) rd_st0_8   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[8]), .rdlo_in(a0_wr[72]),  .coef_in(coef[8]), .rdup_out(a1_wr[8]), .rdlo_out(a1_wr[72]));
			radix2 #(.width(width)) rd_st0_9   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[9]), .rdlo_in(a0_wr[73]),  .coef_in(coef[9]), .rdup_out(a1_wr[9]), .rdlo_out(a1_wr[73]));
			radix2 #(.width(width)) rd_st0_10   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[10]), .rdlo_in(a0_wr[74]),  .coef_in(coef[10]), .rdup_out(a1_wr[10]), .rdlo_out(a1_wr[74]));
			radix2 #(.width(width)) rd_st0_11   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[11]), .rdlo_in(a0_wr[75]),  .coef_in(coef[11]), .rdup_out(a1_wr[11]), .rdlo_out(a1_wr[75]));
			radix2 #(.width(width)) rd_st0_12   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[12]), .rdlo_in(a0_wr[76]),  .coef_in(coef[12]), .rdup_out(a1_wr[12]), .rdlo_out(a1_wr[76]));
			radix2 #(.width(width)) rd_st0_13   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[13]), .rdlo_in(a0_wr[77]),  .coef_in(coef[13]), .rdup_out(a1_wr[13]), .rdlo_out(a1_wr[77]));
			radix2 #(.width(width)) rd_st0_14   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[14]), .rdlo_in(a0_wr[78]),  .coef_in(coef[14]), .rdup_out(a1_wr[14]), .rdlo_out(a1_wr[78]));
			radix2 #(.width(width)) rd_st0_15   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[15]), .rdlo_in(a0_wr[79]),  .coef_in(coef[15]), .rdup_out(a1_wr[15]), .rdlo_out(a1_wr[79]));
			radix2 #(.width(width)) rd_st0_16   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[16]), .rdlo_in(a0_wr[80]),  .coef_in(coef[16]), .rdup_out(a1_wr[16]), .rdlo_out(a1_wr[80]));
			radix2 #(.width(width)) rd_st0_17   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[17]), .rdlo_in(a0_wr[81]),  .coef_in(coef[17]), .rdup_out(a1_wr[17]), .rdlo_out(a1_wr[81]));
			radix2 #(.width(width)) rd_st0_18   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[18]), .rdlo_in(a0_wr[82]),  .coef_in(coef[18]), .rdup_out(a1_wr[18]), .rdlo_out(a1_wr[82]));
			radix2 #(.width(width)) rd_st0_19   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[19]), .rdlo_in(a0_wr[83]),  .coef_in(coef[19]), .rdup_out(a1_wr[19]), .rdlo_out(a1_wr[83]));
			radix2 #(.width(width)) rd_st0_20   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[20]), .rdlo_in(a0_wr[84]),  .coef_in(coef[20]), .rdup_out(a1_wr[20]), .rdlo_out(a1_wr[84]));
			radix2 #(.width(width)) rd_st0_21   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[21]), .rdlo_in(a0_wr[85]),  .coef_in(coef[21]), .rdup_out(a1_wr[21]), .rdlo_out(a1_wr[85]));
			radix2 #(.width(width)) rd_st0_22   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[22]), .rdlo_in(a0_wr[86]),  .coef_in(coef[22]), .rdup_out(a1_wr[22]), .rdlo_out(a1_wr[86]));
			radix2 #(.width(width)) rd_st0_23   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[23]), .rdlo_in(a0_wr[87]),  .coef_in(coef[23]), .rdup_out(a1_wr[23]), .rdlo_out(a1_wr[87]));
			radix2 #(.width(width)) rd_st0_24   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[24]), .rdlo_in(a0_wr[88]),  .coef_in(coef[24]), .rdup_out(a1_wr[24]), .rdlo_out(a1_wr[88]));
			radix2 #(.width(width)) rd_st0_25   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[25]), .rdlo_in(a0_wr[89]),  .coef_in(coef[25]), .rdup_out(a1_wr[25]), .rdlo_out(a1_wr[89]));
			radix2 #(.width(width)) rd_st0_26   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[26]), .rdlo_in(a0_wr[90]),  .coef_in(coef[26]), .rdup_out(a1_wr[26]), .rdlo_out(a1_wr[90]));
			radix2 #(.width(width)) rd_st0_27   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[27]), .rdlo_in(a0_wr[91]),  .coef_in(coef[27]), .rdup_out(a1_wr[27]), .rdlo_out(a1_wr[91]));
			radix2 #(.width(width)) rd_st0_28   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[28]), .rdlo_in(a0_wr[92]),  .coef_in(coef[28]), .rdup_out(a1_wr[28]), .rdlo_out(a1_wr[92]));
			radix2 #(.width(width)) rd_st0_29   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[29]), .rdlo_in(a0_wr[93]),  .coef_in(coef[29]), .rdup_out(a1_wr[29]), .rdlo_out(a1_wr[93]));
			radix2 #(.width(width)) rd_st0_30   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[30]), .rdlo_in(a0_wr[94]),  .coef_in(coef[30]), .rdup_out(a1_wr[30]), .rdlo_out(a1_wr[94]));
			radix2 #(.width(width)) rd_st0_31   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[31]), .rdlo_in(a0_wr[95]),  .coef_in(coef[31]), .rdup_out(a1_wr[31]), .rdlo_out(a1_wr[95]));
			radix2 #(.width(width)) rd_st0_32   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[32]), .rdlo_in(a0_wr[96]),  .coef_in(coef[32]), .rdup_out(a1_wr[32]), .rdlo_out(a1_wr[96]));
			radix2 #(.width(width)) rd_st0_33   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[33]), .rdlo_in(a0_wr[97]),  .coef_in(coef[33]), .rdup_out(a1_wr[33]), .rdlo_out(a1_wr[97]));
			radix2 #(.width(width)) rd_st0_34   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[34]), .rdlo_in(a0_wr[98]),  .coef_in(coef[34]), .rdup_out(a1_wr[34]), .rdlo_out(a1_wr[98]));
			radix2 #(.width(width)) rd_st0_35   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[35]), .rdlo_in(a0_wr[99]),  .coef_in(coef[35]), .rdup_out(a1_wr[35]), .rdlo_out(a1_wr[99]));
			radix2 #(.width(width)) rd_st0_36   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[36]), .rdlo_in(a0_wr[100]),  .coef_in(coef[36]), .rdup_out(a1_wr[36]), .rdlo_out(a1_wr[100]));
			radix2 #(.width(width)) rd_st0_37   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[37]), .rdlo_in(a0_wr[101]),  .coef_in(coef[37]), .rdup_out(a1_wr[37]), .rdlo_out(a1_wr[101]));
			radix2 #(.width(width)) rd_st0_38   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[38]), .rdlo_in(a0_wr[102]),  .coef_in(coef[38]), .rdup_out(a1_wr[38]), .rdlo_out(a1_wr[102]));
			radix2 #(.width(width)) rd_st0_39   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[39]), .rdlo_in(a0_wr[103]),  .coef_in(coef[39]), .rdup_out(a1_wr[39]), .rdlo_out(a1_wr[103]));
			radix2 #(.width(width)) rd_st0_40   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[40]), .rdlo_in(a0_wr[104]),  .coef_in(coef[40]), .rdup_out(a1_wr[40]), .rdlo_out(a1_wr[104]));
			radix2 #(.width(width)) rd_st0_41   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[41]), .rdlo_in(a0_wr[105]),  .coef_in(coef[41]), .rdup_out(a1_wr[41]), .rdlo_out(a1_wr[105]));
			radix2 #(.width(width)) rd_st0_42   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[42]), .rdlo_in(a0_wr[106]),  .coef_in(coef[42]), .rdup_out(a1_wr[42]), .rdlo_out(a1_wr[106]));
			radix2 #(.width(width)) rd_st0_43   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[43]), .rdlo_in(a0_wr[107]),  .coef_in(coef[43]), .rdup_out(a1_wr[43]), .rdlo_out(a1_wr[107]));
			radix2 #(.width(width)) rd_st0_44   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[44]), .rdlo_in(a0_wr[108]),  .coef_in(coef[44]), .rdup_out(a1_wr[44]), .rdlo_out(a1_wr[108]));
			radix2 #(.width(width)) rd_st0_45   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[45]), .rdlo_in(a0_wr[109]),  .coef_in(coef[45]), .rdup_out(a1_wr[45]), .rdlo_out(a1_wr[109]));
			radix2 #(.width(width)) rd_st0_46   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[46]), .rdlo_in(a0_wr[110]),  .coef_in(coef[46]), .rdup_out(a1_wr[46]), .rdlo_out(a1_wr[110]));
			radix2 #(.width(width)) rd_st0_47   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[47]), .rdlo_in(a0_wr[111]),  .coef_in(coef[47]), .rdup_out(a1_wr[47]), .rdlo_out(a1_wr[111]));
			radix2 #(.width(width)) rd_st0_48   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[48]), .rdlo_in(a0_wr[112]),  .coef_in(coef[48]), .rdup_out(a1_wr[48]), .rdlo_out(a1_wr[112]));
			radix2 #(.width(width)) rd_st0_49   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[49]), .rdlo_in(a0_wr[113]),  .coef_in(coef[49]), .rdup_out(a1_wr[49]), .rdlo_out(a1_wr[113]));
			radix2 #(.width(width)) rd_st0_50   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[50]), .rdlo_in(a0_wr[114]),  .coef_in(coef[50]), .rdup_out(a1_wr[50]), .rdlo_out(a1_wr[114]));
			radix2 #(.width(width)) rd_st0_51   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[51]), .rdlo_in(a0_wr[115]),  .coef_in(coef[51]), .rdup_out(a1_wr[51]), .rdlo_out(a1_wr[115]));
			radix2 #(.width(width)) rd_st0_52   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[52]), .rdlo_in(a0_wr[116]),  .coef_in(coef[52]), .rdup_out(a1_wr[52]), .rdlo_out(a1_wr[116]));
			radix2 #(.width(width)) rd_st0_53   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[53]), .rdlo_in(a0_wr[117]),  .coef_in(coef[53]), .rdup_out(a1_wr[53]), .rdlo_out(a1_wr[117]));
			radix2 #(.width(width)) rd_st0_54   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[54]), .rdlo_in(a0_wr[118]),  .coef_in(coef[54]), .rdup_out(a1_wr[54]), .rdlo_out(a1_wr[118]));
			radix2 #(.width(width)) rd_st0_55   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[55]), .rdlo_in(a0_wr[119]),  .coef_in(coef[55]), .rdup_out(a1_wr[55]), .rdlo_out(a1_wr[119]));
			radix2 #(.width(width)) rd_st0_56   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[56]), .rdlo_in(a0_wr[120]),  .coef_in(coef[56]), .rdup_out(a1_wr[56]), .rdlo_out(a1_wr[120]));
			radix2 #(.width(width)) rd_st0_57   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[57]), .rdlo_in(a0_wr[121]),  .coef_in(coef[57]), .rdup_out(a1_wr[57]), .rdlo_out(a1_wr[121]));
			radix2 #(.width(width)) rd_st0_58   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[58]), .rdlo_in(a0_wr[122]),  .coef_in(coef[58]), .rdup_out(a1_wr[58]), .rdlo_out(a1_wr[122]));
			radix2 #(.width(width)) rd_st0_59   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[59]), .rdlo_in(a0_wr[123]),  .coef_in(coef[59]), .rdup_out(a1_wr[59]), .rdlo_out(a1_wr[123]));
			radix2 #(.width(width)) rd_st0_60   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[60]), .rdlo_in(a0_wr[124]),  .coef_in(coef[60]), .rdup_out(a1_wr[60]), .rdlo_out(a1_wr[124]));
			radix2 #(.width(width)) rd_st0_61   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[61]), .rdlo_in(a0_wr[125]),  .coef_in(coef[61]), .rdup_out(a1_wr[61]), .rdlo_out(a1_wr[125]));
			radix2 #(.width(width)) rd_st0_62   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[62]), .rdlo_in(a0_wr[126]),  .coef_in(coef[62]), .rdup_out(a1_wr[62]), .rdlo_out(a1_wr[126]));
			radix2 #(.width(width)) rd_st0_63   (.clk(clk), .rst(rst), .stall(sel_fft[6]), .rdup_in(a0_wr[63]), .rdlo_in(a0_wr[127]),  .coef_in(coef[63]), .rdup_out(a1_wr[63]), .rdlo_out(a1_wr[127]));

			//--- mux stage 0
			mux_fft #(.width(width)) mux_st0_0 (.sel0(sel_fft[6]), .in0(a0_wr[0]), .in1(a1_wr[0]), .out0(mux_stage1[0]));
			mux_fft #(.width(width)) mux_st0_1 (.sel0(sel_fft[6]), .in0(a0_wr[1]), .in1(a1_wr[1]), .out0(mux_stage1[1]));
			mux_fft #(.width(width)) mux_st0_2 (.sel0(sel_fft[6]), .in0(a0_wr[2]), .in1(a1_wr[2]), .out0(mux_stage1[2]));
			mux_fft #(.width(width)) mux_st0_3 (.sel0(sel_fft[6]), .in0(a0_wr[3]), .in1(a1_wr[3]), .out0(mux_stage1[3]));
			mux_fft #(.width(width)) mux_st0_4 (.sel0(sel_fft[6]), .in0(a0_wr[4]), .in1(a1_wr[4]), .out0(mux_stage1[4]));
			mux_fft #(.width(width)) mux_st0_5 (.sel0(sel_fft[6]), .in0(a0_wr[5]), .in1(a1_wr[5]), .out0(mux_stage1[5]));
			mux_fft #(.width(width)) mux_st0_6 (.sel0(sel_fft[6]), .in0(a0_wr[6]), .in1(a1_wr[6]), .out0(mux_stage1[6]));
			mux_fft #(.width(width)) mux_st0_7 (.sel0(sel_fft[6]), .in0(a0_wr[7]), .in1(a1_wr[7]), .out0(mux_stage1[7]));
			mux_fft #(.width(width)) mux_st0_8 (.sel0(sel_fft[6]), .in0(a0_wr[8]), .in1(a1_wr[8]), .out0(mux_stage1[8]));
			mux_fft #(.width(width)) mux_st0_9 (.sel0(sel_fft[6]), .in0(a0_wr[9]), .in1(a1_wr[9]), .out0(mux_stage1[9]));
			mux_fft #(.width(width)) mux_st0_10 (.sel0(sel_fft[6]), .in0(a0_wr[10]), .in1(a1_wr[10]), .out0(mux_stage1[10]));
			mux_fft #(.width(width)) mux_st0_11 (.sel0(sel_fft[6]), .in0(a0_wr[11]), .in1(a1_wr[11]), .out0(mux_stage1[11]));
			mux_fft #(.width(width)) mux_st0_12 (.sel0(sel_fft[6]), .in0(a0_wr[12]), .in1(a1_wr[12]), .out0(mux_stage1[12]));
			mux_fft #(.width(width)) mux_st0_13 (.sel0(sel_fft[6]), .in0(a0_wr[13]), .in1(a1_wr[13]), .out0(mux_stage1[13]));
			mux_fft #(.width(width)) mux_st0_14 (.sel0(sel_fft[6]), .in0(a0_wr[14]), .in1(a1_wr[14]), .out0(mux_stage1[14]));
			mux_fft #(.width(width)) mux_st0_15 (.sel0(sel_fft[6]), .in0(a0_wr[15]), .in1(a1_wr[15]), .out0(mux_stage1[15]));
			mux_fft #(.width(width)) mux_st0_16 (.sel0(sel_fft[6]), .in0(a0_wr[16]), .in1(a1_wr[16]), .out0(mux_stage1[16]));
			mux_fft #(.width(width)) mux_st0_17 (.sel0(sel_fft[6]), .in0(a0_wr[17]), .in1(a1_wr[17]), .out0(mux_stage1[17]));
			mux_fft #(.width(width)) mux_st0_18 (.sel0(sel_fft[6]), .in0(a0_wr[18]), .in1(a1_wr[18]), .out0(mux_stage1[18]));
			mux_fft #(.width(width)) mux_st0_19 (.sel0(sel_fft[6]), .in0(a0_wr[19]), .in1(a1_wr[19]), .out0(mux_stage1[19]));
			mux_fft #(.width(width)) mux_st0_20 (.sel0(sel_fft[6]), .in0(a0_wr[20]), .in1(a1_wr[20]), .out0(mux_stage1[20]));
			mux_fft #(.width(width)) mux_st0_21 (.sel0(sel_fft[6]), .in0(a0_wr[21]), .in1(a1_wr[21]), .out0(mux_stage1[21]));
			mux_fft #(.width(width)) mux_st0_22 (.sel0(sel_fft[6]), .in0(a0_wr[22]), .in1(a1_wr[22]), .out0(mux_stage1[22]));
			mux_fft #(.width(width)) mux_st0_23 (.sel0(sel_fft[6]), .in0(a0_wr[23]), .in1(a1_wr[23]), .out0(mux_stage1[23]));
			mux_fft #(.width(width)) mux_st0_24 (.sel0(sel_fft[6]), .in0(a0_wr[24]), .in1(a1_wr[24]), .out0(mux_stage1[24]));
			mux_fft #(.width(width)) mux_st0_25 (.sel0(sel_fft[6]), .in0(a0_wr[25]), .in1(a1_wr[25]), .out0(mux_stage1[25]));
			mux_fft #(.width(width)) mux_st0_26 (.sel0(sel_fft[6]), .in0(a0_wr[26]), .in1(a1_wr[26]), .out0(mux_stage1[26]));
			mux_fft #(.width(width)) mux_st0_27 (.sel0(sel_fft[6]), .in0(a0_wr[27]), .in1(a1_wr[27]), .out0(mux_stage1[27]));
			mux_fft #(.width(width)) mux_st0_28 (.sel0(sel_fft[6]), .in0(a0_wr[28]), .in1(a1_wr[28]), .out0(mux_stage1[28]));
			mux_fft #(.width(width)) mux_st0_29 (.sel0(sel_fft[6]), .in0(a0_wr[29]), .in1(a1_wr[29]), .out0(mux_stage1[29]));
			mux_fft #(.width(width)) mux_st0_30 (.sel0(sel_fft[6]), .in0(a0_wr[30]), .in1(a1_wr[30]), .out0(mux_stage1[30]));
			mux_fft #(.width(width)) mux_st0_31 (.sel0(sel_fft[6]), .in0(a0_wr[31]), .in1(a1_wr[31]), .out0(mux_stage1[31]));
			mux_fft #(.width(width)) mux_st0_32 (.sel0(sel_fft[6]), .in0(a0_wr[32]), .in1(a1_wr[32]), .out0(mux_stage1[32]));
			mux_fft #(.width(width)) mux_st0_33 (.sel0(sel_fft[6]), .in0(a0_wr[33]), .in1(a1_wr[33]), .out0(mux_stage1[33]));
			mux_fft #(.width(width)) mux_st0_34 (.sel0(sel_fft[6]), .in0(a0_wr[34]), .in1(a1_wr[34]), .out0(mux_stage1[34]));
			mux_fft #(.width(width)) mux_st0_35 (.sel0(sel_fft[6]), .in0(a0_wr[35]), .in1(a1_wr[35]), .out0(mux_stage1[35]));
			mux_fft #(.width(width)) mux_st0_36 (.sel0(sel_fft[6]), .in0(a0_wr[36]), .in1(a1_wr[36]), .out0(mux_stage1[36]));
			mux_fft #(.width(width)) mux_st0_37 (.sel0(sel_fft[6]), .in0(a0_wr[37]), .in1(a1_wr[37]), .out0(mux_stage1[37]));
			mux_fft #(.width(width)) mux_st0_38 (.sel0(sel_fft[6]), .in0(a0_wr[38]), .in1(a1_wr[38]), .out0(mux_stage1[38]));
			mux_fft #(.width(width)) mux_st0_39 (.sel0(sel_fft[6]), .in0(a0_wr[39]), .in1(a1_wr[39]), .out0(mux_stage1[39]));
			mux_fft #(.width(width)) mux_st0_40 (.sel0(sel_fft[6]), .in0(a0_wr[40]), .in1(a1_wr[40]), .out0(mux_stage1[40]));
			mux_fft #(.width(width)) mux_st0_41 (.sel0(sel_fft[6]), .in0(a0_wr[41]), .in1(a1_wr[41]), .out0(mux_stage1[41]));
			mux_fft #(.width(width)) mux_st0_42 (.sel0(sel_fft[6]), .in0(a0_wr[42]), .in1(a1_wr[42]), .out0(mux_stage1[42]));
			mux_fft #(.width(width)) mux_st0_43 (.sel0(sel_fft[6]), .in0(a0_wr[43]), .in1(a1_wr[43]), .out0(mux_stage1[43]));
			mux_fft #(.width(width)) mux_st0_44 (.sel0(sel_fft[6]), .in0(a0_wr[44]), .in1(a1_wr[44]), .out0(mux_stage1[44]));
			mux_fft #(.width(width)) mux_st0_45 (.sel0(sel_fft[6]), .in0(a0_wr[45]), .in1(a1_wr[45]), .out0(mux_stage1[45]));
			mux_fft #(.width(width)) mux_st0_46 (.sel0(sel_fft[6]), .in0(a0_wr[46]), .in1(a1_wr[46]), .out0(mux_stage1[46]));
			mux_fft #(.width(width)) mux_st0_47 (.sel0(sel_fft[6]), .in0(a0_wr[47]), .in1(a1_wr[47]), .out0(mux_stage1[47]));
			mux_fft #(.width(width)) mux_st0_48 (.sel0(sel_fft[6]), .in0(a0_wr[48]), .in1(a1_wr[48]), .out0(mux_stage1[48]));
			mux_fft #(.width(width)) mux_st0_49 (.sel0(sel_fft[6]), .in0(a0_wr[49]), .in1(a1_wr[49]), .out0(mux_stage1[49]));
			mux_fft #(.width(width)) mux_st0_50 (.sel0(sel_fft[6]), .in0(a0_wr[50]), .in1(a1_wr[50]), .out0(mux_stage1[50]));
			mux_fft #(.width(width)) mux_st0_51 (.sel0(sel_fft[6]), .in0(a0_wr[51]), .in1(a1_wr[51]), .out0(mux_stage1[51]));
			mux_fft #(.width(width)) mux_st0_52 (.sel0(sel_fft[6]), .in0(a0_wr[52]), .in1(a1_wr[52]), .out0(mux_stage1[52]));
			mux_fft #(.width(width)) mux_st0_53 (.sel0(sel_fft[6]), .in0(a0_wr[53]), .in1(a1_wr[53]), .out0(mux_stage1[53]));
			mux_fft #(.width(width)) mux_st0_54 (.sel0(sel_fft[6]), .in0(a0_wr[54]), .in1(a1_wr[54]), .out0(mux_stage1[54]));
			mux_fft #(.width(width)) mux_st0_55 (.sel0(sel_fft[6]), .in0(a0_wr[55]), .in1(a1_wr[55]), .out0(mux_stage1[55]));
			mux_fft #(.width(width)) mux_st0_56 (.sel0(sel_fft[6]), .in0(a0_wr[56]), .in1(a1_wr[56]), .out0(mux_stage1[56]));
			mux_fft #(.width(width)) mux_st0_57 (.sel0(sel_fft[6]), .in0(a0_wr[57]), .in1(a1_wr[57]), .out0(mux_stage1[57]));
			mux_fft #(.width(width)) mux_st0_58 (.sel0(sel_fft[6]), .in0(a0_wr[58]), .in1(a1_wr[58]), .out0(mux_stage1[58]));
			mux_fft #(.width(width)) mux_st0_59 (.sel0(sel_fft[6]), .in0(a0_wr[59]), .in1(a1_wr[59]), .out0(mux_stage1[59]));
			mux_fft #(.width(width)) mux_st0_60 (.sel0(sel_fft[6]), .in0(a0_wr[60]), .in1(a1_wr[60]), .out0(mux_stage1[60]));
			mux_fft #(.width(width)) mux_st0_61 (.sel0(sel_fft[6]), .in0(a0_wr[61]), .in1(a1_wr[61]), .out0(mux_stage1[61]));
			mux_fft #(.width(width)) mux_st0_62 (.sel0(sel_fft[6]), .in0(a0_wr[62]), .in1(a1_wr[62]), .out0(mux_stage1[62]));
			mux_fft #(.width(width)) mux_st0_63 (.sel0(sel_fft[6]), .in0(a0_wr[63]), .in1(a1_wr[63]), .out0(mux_stage1[63]));
			mux_fft #(.width(width)) mux_st0_64 (.sel0(sel_fft[6]), .in0(a0_wr[64]), .in1(a1_wr[64]), .out0(mux_stage1[64]));
			mux_fft #(.width(width)) mux_st0_65 (.sel0(sel_fft[6]), .in0(a0_wr[65]), .in1(a1_wr[65]), .out0(mux_stage1[65]));
			mux_fft #(.width(width)) mux_st0_66 (.sel0(sel_fft[6]), .in0(a0_wr[66]), .in1(a1_wr[66]), .out0(mux_stage1[66]));
			mux_fft #(.width(width)) mux_st0_67 (.sel0(sel_fft[6]), .in0(a0_wr[67]), .in1(a1_wr[67]), .out0(mux_stage1[67]));
			mux_fft #(.width(width)) mux_st0_68 (.sel0(sel_fft[6]), .in0(a0_wr[68]), .in1(a1_wr[68]), .out0(mux_stage1[68]));
			mux_fft #(.width(width)) mux_st0_69 (.sel0(sel_fft[6]), .in0(a0_wr[69]), .in1(a1_wr[69]), .out0(mux_stage1[69]));
			mux_fft #(.width(width)) mux_st0_70 (.sel0(sel_fft[6]), .in0(a0_wr[70]), .in1(a1_wr[70]), .out0(mux_stage1[70]));
			mux_fft #(.width(width)) mux_st0_71 (.sel0(sel_fft[6]), .in0(a0_wr[71]), .in1(a1_wr[71]), .out0(mux_stage1[71]));
			mux_fft #(.width(width)) mux_st0_72 (.sel0(sel_fft[6]), .in0(a0_wr[72]), .in1(a1_wr[72]), .out0(mux_stage1[72]));
			mux_fft #(.width(width)) mux_st0_73 (.sel0(sel_fft[6]), .in0(a0_wr[73]), .in1(a1_wr[73]), .out0(mux_stage1[73]));
			mux_fft #(.width(width)) mux_st0_74 (.sel0(sel_fft[6]), .in0(a0_wr[74]), .in1(a1_wr[74]), .out0(mux_stage1[74]));
			mux_fft #(.width(width)) mux_st0_75 (.sel0(sel_fft[6]), .in0(a0_wr[75]), .in1(a1_wr[75]), .out0(mux_stage1[75]));
			mux_fft #(.width(width)) mux_st0_76 (.sel0(sel_fft[6]), .in0(a0_wr[76]), .in1(a1_wr[76]), .out0(mux_stage1[76]));
			mux_fft #(.width(width)) mux_st0_77 (.sel0(sel_fft[6]), .in0(a0_wr[77]), .in1(a1_wr[77]), .out0(mux_stage1[77]));
			mux_fft #(.width(width)) mux_st0_78 (.sel0(sel_fft[6]), .in0(a0_wr[78]), .in1(a1_wr[78]), .out0(mux_stage1[78]));
			mux_fft #(.width(width)) mux_st0_79 (.sel0(sel_fft[6]), .in0(a0_wr[79]), .in1(a1_wr[79]), .out0(mux_stage1[79]));
			mux_fft #(.width(width)) mux_st0_80 (.sel0(sel_fft[6]), .in0(a0_wr[80]), .in1(a1_wr[80]), .out0(mux_stage1[80]));
			mux_fft #(.width(width)) mux_st0_81 (.sel0(sel_fft[6]), .in0(a0_wr[81]), .in1(a1_wr[81]), .out0(mux_stage1[81]));
			mux_fft #(.width(width)) mux_st0_82 (.sel0(sel_fft[6]), .in0(a0_wr[82]), .in1(a1_wr[82]), .out0(mux_stage1[82]));
			mux_fft #(.width(width)) mux_st0_83 (.sel0(sel_fft[6]), .in0(a0_wr[83]), .in1(a1_wr[83]), .out0(mux_stage1[83]));
			mux_fft #(.width(width)) mux_st0_84 (.sel0(sel_fft[6]), .in0(a0_wr[84]), .in1(a1_wr[84]), .out0(mux_stage1[84]));
			mux_fft #(.width(width)) mux_st0_85 (.sel0(sel_fft[6]), .in0(a0_wr[85]), .in1(a1_wr[85]), .out0(mux_stage1[85]));
			mux_fft #(.width(width)) mux_st0_86 (.sel0(sel_fft[6]), .in0(a0_wr[86]), .in1(a1_wr[86]), .out0(mux_stage1[86]));
			mux_fft #(.width(width)) mux_st0_87 (.sel0(sel_fft[6]), .in0(a0_wr[87]), .in1(a1_wr[87]), .out0(mux_stage1[87]));
			mux_fft #(.width(width)) mux_st0_88 (.sel0(sel_fft[6]), .in0(a0_wr[88]), .in1(a1_wr[88]), .out0(mux_stage1[88]));
			mux_fft #(.width(width)) mux_st0_89 (.sel0(sel_fft[6]), .in0(a0_wr[89]), .in1(a1_wr[89]), .out0(mux_stage1[89]));
			mux_fft #(.width(width)) mux_st0_90 (.sel0(sel_fft[6]), .in0(a0_wr[90]), .in1(a1_wr[90]), .out0(mux_stage1[90]));
			mux_fft #(.width(width)) mux_st0_91 (.sel0(sel_fft[6]), .in0(a0_wr[91]), .in1(a1_wr[91]), .out0(mux_stage1[91]));
			mux_fft #(.width(width)) mux_st0_92 (.sel0(sel_fft[6]), .in0(a0_wr[92]), .in1(a1_wr[92]), .out0(mux_stage1[92]));
			mux_fft #(.width(width)) mux_st0_93 (.sel0(sel_fft[6]), .in0(a0_wr[93]), .in1(a1_wr[93]), .out0(mux_stage1[93]));
			mux_fft #(.width(width)) mux_st0_94 (.sel0(sel_fft[6]), .in0(a0_wr[94]), .in1(a1_wr[94]), .out0(mux_stage1[94]));
			mux_fft #(.width(width)) mux_st0_95 (.sel0(sel_fft[6]), .in0(a0_wr[95]), .in1(a1_wr[95]), .out0(mux_stage1[95]));
			mux_fft #(.width(width)) mux_st0_96 (.sel0(sel_fft[6]), .in0(a0_wr[96]), .in1(a1_wr[96]), .out0(mux_stage1[96]));
			mux_fft #(.width(width)) mux_st0_97 (.sel0(sel_fft[6]), .in0(a0_wr[97]), .in1(a1_wr[97]), .out0(mux_stage1[97]));
			mux_fft #(.width(width)) mux_st0_98 (.sel0(sel_fft[6]), .in0(a0_wr[98]), .in1(a1_wr[98]), .out0(mux_stage1[98]));
			mux_fft #(.width(width)) mux_st0_99 (.sel0(sel_fft[6]), .in0(a0_wr[99]), .in1(a1_wr[99]), .out0(mux_stage1[99]));
			mux_fft #(.width(width)) mux_st0_100 (.sel0(sel_fft[6]), .in0(a0_wr[100]), .in1(a1_wr[100]), .out0(mux_stage1[100]));
			mux_fft #(.width(width)) mux_st0_101 (.sel0(sel_fft[6]), .in0(a0_wr[101]), .in1(a1_wr[101]), .out0(mux_stage1[101]));
			mux_fft #(.width(width)) mux_st0_102 (.sel0(sel_fft[6]), .in0(a0_wr[102]), .in1(a1_wr[102]), .out0(mux_stage1[102]));
			mux_fft #(.width(width)) mux_st0_103 (.sel0(sel_fft[6]), .in0(a0_wr[103]), .in1(a1_wr[103]), .out0(mux_stage1[103]));
			mux_fft #(.width(width)) mux_st0_104 (.sel0(sel_fft[6]), .in0(a0_wr[104]), .in1(a1_wr[104]), .out0(mux_stage1[104]));
			mux_fft #(.width(width)) mux_st0_105 (.sel0(sel_fft[6]), .in0(a0_wr[105]), .in1(a1_wr[105]), .out0(mux_stage1[105]));
			mux_fft #(.width(width)) mux_st0_106 (.sel0(sel_fft[6]), .in0(a0_wr[106]), .in1(a1_wr[106]), .out0(mux_stage1[106]));
			mux_fft #(.width(width)) mux_st0_107 (.sel0(sel_fft[6]), .in0(a0_wr[107]), .in1(a1_wr[107]), .out0(mux_stage1[107]));
			mux_fft #(.width(width)) mux_st0_108 (.sel0(sel_fft[6]), .in0(a0_wr[108]), .in1(a1_wr[108]), .out0(mux_stage1[108]));
			mux_fft #(.width(width)) mux_st0_109 (.sel0(sel_fft[6]), .in0(a0_wr[109]), .in1(a1_wr[109]), .out0(mux_stage1[109]));
			mux_fft #(.width(width)) mux_st0_110 (.sel0(sel_fft[6]), .in0(a0_wr[110]), .in1(a1_wr[110]), .out0(mux_stage1[110]));
			mux_fft #(.width(width)) mux_st0_111 (.sel0(sel_fft[6]), .in0(a0_wr[111]), .in1(a1_wr[111]), .out0(mux_stage1[111]));
			mux_fft #(.width(width)) mux_st0_112 (.sel0(sel_fft[6]), .in0(a0_wr[112]), .in1(a1_wr[112]), .out0(mux_stage1[112]));
			mux_fft #(.width(width)) mux_st0_113 (.sel0(sel_fft[6]), .in0(a0_wr[113]), .in1(a1_wr[113]), .out0(mux_stage1[113]));
			mux_fft #(.width(width)) mux_st0_114 (.sel0(sel_fft[6]), .in0(a0_wr[114]), .in1(a1_wr[114]), .out0(mux_stage1[114]));
			mux_fft #(.width(width)) mux_st0_115 (.sel0(sel_fft[6]), .in0(a0_wr[115]), .in1(a1_wr[115]), .out0(mux_stage1[115]));
			mux_fft #(.width(width)) mux_st0_116 (.sel0(sel_fft[6]), .in0(a0_wr[116]), .in1(a1_wr[116]), .out0(mux_stage1[116]));
			mux_fft #(.width(width)) mux_st0_117 (.sel0(sel_fft[6]), .in0(a0_wr[117]), .in1(a1_wr[117]), .out0(mux_stage1[117]));
			mux_fft #(.width(width)) mux_st0_118 (.sel0(sel_fft[6]), .in0(a0_wr[118]), .in1(a1_wr[118]), .out0(mux_stage1[118]));
			mux_fft #(.width(width)) mux_st0_119 (.sel0(sel_fft[6]), .in0(a0_wr[119]), .in1(a1_wr[119]), .out0(mux_stage1[119]));
			mux_fft #(.width(width)) mux_st0_120 (.sel0(sel_fft[6]), .in0(a0_wr[120]), .in1(a1_wr[120]), .out0(mux_stage1[120]));
			mux_fft #(.width(width)) mux_st0_121 (.sel0(sel_fft[6]), .in0(a0_wr[121]), .in1(a1_wr[121]), .out0(mux_stage1[121]));
			mux_fft #(.width(width)) mux_st0_122 (.sel0(sel_fft[6]), .in0(a0_wr[122]), .in1(a1_wr[122]), .out0(mux_stage1[122]));
			mux_fft #(.width(width)) mux_st0_123 (.sel0(sel_fft[6]), .in0(a0_wr[123]), .in1(a1_wr[123]), .out0(mux_stage1[123]));
			mux_fft #(.width(width)) mux_st0_124 (.sel0(sel_fft[6]), .in0(a0_wr[124]), .in1(a1_wr[124]), .out0(mux_stage1[124]));
			mux_fft #(.width(width)) mux_st0_125 (.sel0(sel_fft[6]), .in0(a0_wr[125]), .in1(a1_wr[125]), .out0(mux_stage1[125]));
			mux_fft #(.width(width)) mux_st0_126 (.sel0(sel_fft[6]), .in0(a0_wr[126]), .in1(a1_wr[126]), .out0(mux_stage1[126]));
			mux_fft #(.width(width)) mux_st0_127 (.sel0(sel_fft[6]), .in0(a0_wr[127]), .in1(a1_wr[127]), .out0(mux_stage1[127]));

			//--- radix stage 1
			radix2 #(.width(width)) rd_st1_0   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[0]), .rdlo_in(mux_stage1[32]),  .coef_in(coef[0]), .rdup_out(a2_wr[0]), .rdlo_out(a2_wr[32]));
			radix2 #(.width(width)) rd_st1_1   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[1]), .rdlo_in(mux_stage1[33]),  .coef_in(coef[2]), .rdup_out(a2_wr[1]), .rdlo_out(a2_wr[33]));
			radix2 #(.width(width)) rd_st1_2   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[2]), .rdlo_in(mux_stage1[34]),  .coef_in(coef[4]), .rdup_out(a2_wr[2]), .rdlo_out(a2_wr[34]));
			radix2 #(.width(width)) rd_st1_3   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[3]), .rdlo_in(mux_stage1[35]),  .coef_in(coef[6]), .rdup_out(a2_wr[3]), .rdlo_out(a2_wr[35]));
			radix2 #(.width(width)) rd_st1_4   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[4]), .rdlo_in(mux_stage1[36]),  .coef_in(coef[8]), .rdup_out(a2_wr[4]), .rdlo_out(a2_wr[36]));
			radix2 #(.width(width)) rd_st1_5   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[5]), .rdlo_in(mux_stage1[37]),  .coef_in(coef[10]), .rdup_out(a2_wr[5]), .rdlo_out(a2_wr[37]));
			radix2 #(.width(width)) rd_st1_6   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[6]), .rdlo_in(mux_stage1[38]),  .coef_in(coef[12]), .rdup_out(a2_wr[6]), .rdlo_out(a2_wr[38]));
			radix2 #(.width(width)) rd_st1_7   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[7]), .rdlo_in(mux_stage1[39]),  .coef_in(coef[14]), .rdup_out(a2_wr[7]), .rdlo_out(a2_wr[39]));
			radix2 #(.width(width)) rd_st1_8   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[8]), .rdlo_in(mux_stage1[40]),  .coef_in(coef[16]), .rdup_out(a2_wr[8]), .rdlo_out(a2_wr[40]));
			radix2 #(.width(width)) rd_st1_9   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[9]), .rdlo_in(mux_stage1[41]),  .coef_in(coef[18]), .rdup_out(a2_wr[9]), .rdlo_out(a2_wr[41]));
			radix2 #(.width(width)) rd_st1_10   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[10]), .rdlo_in(mux_stage1[42]),  .coef_in(coef[20]), .rdup_out(a2_wr[10]), .rdlo_out(a2_wr[42]));
			radix2 #(.width(width)) rd_st1_11   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[11]), .rdlo_in(mux_stage1[43]),  .coef_in(coef[22]), .rdup_out(a2_wr[11]), .rdlo_out(a2_wr[43]));
			radix2 #(.width(width)) rd_st1_12   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[12]), .rdlo_in(mux_stage1[44]),  .coef_in(coef[24]), .rdup_out(a2_wr[12]), .rdlo_out(a2_wr[44]));
			radix2 #(.width(width)) rd_st1_13   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[13]), .rdlo_in(mux_stage1[45]),  .coef_in(coef[26]), .rdup_out(a2_wr[13]), .rdlo_out(a2_wr[45]));
			radix2 #(.width(width)) rd_st1_14   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[14]), .rdlo_in(mux_stage1[46]),  .coef_in(coef[28]), .rdup_out(a2_wr[14]), .rdlo_out(a2_wr[46]));
			radix2 #(.width(width)) rd_st1_15   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[15]), .rdlo_in(mux_stage1[47]),  .coef_in(coef[30]), .rdup_out(a2_wr[15]), .rdlo_out(a2_wr[47]));
			radix2 #(.width(width)) rd_st1_16   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[16]), .rdlo_in(mux_stage1[48]),  .coef_in(coef[32]), .rdup_out(a2_wr[16]), .rdlo_out(a2_wr[48]));
			radix2 #(.width(width)) rd_st1_17   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[17]), .rdlo_in(mux_stage1[49]),  .coef_in(coef[34]), .rdup_out(a2_wr[17]), .rdlo_out(a2_wr[49]));
			radix2 #(.width(width)) rd_st1_18   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[18]), .rdlo_in(mux_stage1[50]),  .coef_in(coef[36]), .rdup_out(a2_wr[18]), .rdlo_out(a2_wr[50]));
			radix2 #(.width(width)) rd_st1_19   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[19]), .rdlo_in(mux_stage1[51]),  .coef_in(coef[38]), .rdup_out(a2_wr[19]), .rdlo_out(a2_wr[51]));
			radix2 #(.width(width)) rd_st1_20   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[20]), .rdlo_in(mux_stage1[52]),  .coef_in(coef[40]), .rdup_out(a2_wr[20]), .rdlo_out(a2_wr[52]));
			radix2 #(.width(width)) rd_st1_21   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[21]), .rdlo_in(mux_stage1[53]),  .coef_in(coef[42]), .rdup_out(a2_wr[21]), .rdlo_out(a2_wr[53]));
			radix2 #(.width(width)) rd_st1_22   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[22]), .rdlo_in(mux_stage1[54]),  .coef_in(coef[44]), .rdup_out(a2_wr[22]), .rdlo_out(a2_wr[54]));
			radix2 #(.width(width)) rd_st1_23   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[23]), .rdlo_in(mux_stage1[55]),  .coef_in(coef[46]), .rdup_out(a2_wr[23]), .rdlo_out(a2_wr[55]));
			radix2 #(.width(width)) rd_st1_24   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[24]), .rdlo_in(mux_stage1[56]),  .coef_in(coef[48]), .rdup_out(a2_wr[24]), .rdlo_out(a2_wr[56]));
			radix2 #(.width(width)) rd_st1_25   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[25]), .rdlo_in(mux_stage1[57]),  .coef_in(coef[50]), .rdup_out(a2_wr[25]), .rdlo_out(a2_wr[57]));
			radix2 #(.width(width)) rd_st1_26   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[26]), .rdlo_in(mux_stage1[58]),  .coef_in(coef[52]), .rdup_out(a2_wr[26]), .rdlo_out(a2_wr[58]));
			radix2 #(.width(width)) rd_st1_27   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[27]), .rdlo_in(mux_stage1[59]),  .coef_in(coef[54]), .rdup_out(a2_wr[27]), .rdlo_out(a2_wr[59]));
			radix2 #(.width(width)) rd_st1_28   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[28]), .rdlo_in(mux_stage1[60]),  .coef_in(coef[56]), .rdup_out(a2_wr[28]), .rdlo_out(a2_wr[60]));
			radix2 #(.width(width)) rd_st1_29   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[29]), .rdlo_in(mux_stage1[61]),  .coef_in(coef[58]), .rdup_out(a2_wr[29]), .rdlo_out(a2_wr[61]));
			radix2 #(.width(width)) rd_st1_30   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[30]), .rdlo_in(mux_stage1[62]),  .coef_in(coef[60]), .rdup_out(a2_wr[30]), .rdlo_out(a2_wr[62]));
			radix2 #(.width(width)) rd_st1_31   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[31]), .rdlo_in(mux_stage1[63]),  .coef_in(coef[62]), .rdup_out(a2_wr[31]), .rdlo_out(a2_wr[63]));
			radix2 #(.width(width)) rd_st1_32   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[64]), .rdlo_in(mux_stage1[96]),  .coef_in(coef[0]), .rdup_out(a2_wr[64]), .rdlo_out(a2_wr[96]));
			radix2 #(.width(width)) rd_st1_33   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[65]), .rdlo_in(mux_stage1[97]),  .coef_in(coef[2]), .rdup_out(a2_wr[65]), .rdlo_out(a2_wr[97]));
			radix2 #(.width(width)) rd_st1_34   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[66]), .rdlo_in(mux_stage1[98]),  .coef_in(coef[4]), .rdup_out(a2_wr[66]), .rdlo_out(a2_wr[98]));
			radix2 #(.width(width)) rd_st1_35   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[67]), .rdlo_in(mux_stage1[99]),  .coef_in(coef[6]), .rdup_out(a2_wr[67]), .rdlo_out(a2_wr[99]));
			radix2 #(.width(width)) rd_st1_36   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[68]), .rdlo_in(mux_stage1[100]),  .coef_in(coef[8]), .rdup_out(a2_wr[68]), .rdlo_out(a2_wr[100]));
			radix2 #(.width(width)) rd_st1_37   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[69]), .rdlo_in(mux_stage1[101]),  .coef_in(coef[10]), .rdup_out(a2_wr[69]), .rdlo_out(a2_wr[101]));
			radix2 #(.width(width)) rd_st1_38   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[70]), .rdlo_in(mux_stage1[102]),  .coef_in(coef[12]), .rdup_out(a2_wr[70]), .rdlo_out(a2_wr[102]));
			radix2 #(.width(width)) rd_st1_39   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[71]), .rdlo_in(mux_stage1[103]),  .coef_in(coef[14]), .rdup_out(a2_wr[71]), .rdlo_out(a2_wr[103]));
			radix2 #(.width(width)) rd_st1_40   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[72]), .rdlo_in(mux_stage1[104]),  .coef_in(coef[16]), .rdup_out(a2_wr[72]), .rdlo_out(a2_wr[104]));
			radix2 #(.width(width)) rd_st1_41   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[73]), .rdlo_in(mux_stage1[105]),  .coef_in(coef[18]), .rdup_out(a2_wr[73]), .rdlo_out(a2_wr[105]));
			radix2 #(.width(width)) rd_st1_42   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[74]), .rdlo_in(mux_stage1[106]),  .coef_in(coef[20]), .rdup_out(a2_wr[74]), .rdlo_out(a2_wr[106]));
			radix2 #(.width(width)) rd_st1_43   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[75]), .rdlo_in(mux_stage1[107]),  .coef_in(coef[22]), .rdup_out(a2_wr[75]), .rdlo_out(a2_wr[107]));
			radix2 #(.width(width)) rd_st1_44   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[76]), .rdlo_in(mux_stage1[108]),  .coef_in(coef[24]), .rdup_out(a2_wr[76]), .rdlo_out(a2_wr[108]));
			radix2 #(.width(width)) rd_st1_45   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[77]), .rdlo_in(mux_stage1[109]),  .coef_in(coef[26]), .rdup_out(a2_wr[77]), .rdlo_out(a2_wr[109]));
			radix2 #(.width(width)) rd_st1_46   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[78]), .rdlo_in(mux_stage1[110]),  .coef_in(coef[28]), .rdup_out(a2_wr[78]), .rdlo_out(a2_wr[110]));
			radix2 #(.width(width)) rd_st1_47   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[79]), .rdlo_in(mux_stage1[111]),  .coef_in(coef[30]), .rdup_out(a2_wr[79]), .rdlo_out(a2_wr[111]));
			radix2 #(.width(width)) rd_st1_48   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[80]), .rdlo_in(mux_stage1[112]),  .coef_in(coef[32]), .rdup_out(a2_wr[80]), .rdlo_out(a2_wr[112]));
			radix2 #(.width(width)) rd_st1_49   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[81]), .rdlo_in(mux_stage1[113]),  .coef_in(coef[34]), .rdup_out(a2_wr[81]), .rdlo_out(a2_wr[113]));
			radix2 #(.width(width)) rd_st1_50   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[82]), .rdlo_in(mux_stage1[114]),  .coef_in(coef[36]), .rdup_out(a2_wr[82]), .rdlo_out(a2_wr[114]));
			radix2 #(.width(width)) rd_st1_51   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[83]), .rdlo_in(mux_stage1[115]),  .coef_in(coef[38]), .rdup_out(a2_wr[83]), .rdlo_out(a2_wr[115]));
			radix2 #(.width(width)) rd_st1_52   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[84]), .rdlo_in(mux_stage1[116]),  .coef_in(coef[40]), .rdup_out(a2_wr[84]), .rdlo_out(a2_wr[116]));
			radix2 #(.width(width)) rd_st1_53   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[85]), .rdlo_in(mux_stage1[117]),  .coef_in(coef[42]), .rdup_out(a2_wr[85]), .rdlo_out(a2_wr[117]));
			radix2 #(.width(width)) rd_st1_54   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[86]), .rdlo_in(mux_stage1[118]),  .coef_in(coef[44]), .rdup_out(a2_wr[86]), .rdlo_out(a2_wr[118]));
			radix2 #(.width(width)) rd_st1_55   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[87]), .rdlo_in(mux_stage1[119]),  .coef_in(coef[46]), .rdup_out(a2_wr[87]), .rdlo_out(a2_wr[119]));
			radix2 #(.width(width)) rd_st1_56   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[88]), .rdlo_in(mux_stage1[120]),  .coef_in(coef[48]), .rdup_out(a2_wr[88]), .rdlo_out(a2_wr[120]));
			radix2 #(.width(width)) rd_st1_57   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[89]), .rdlo_in(mux_stage1[121]),  .coef_in(coef[50]), .rdup_out(a2_wr[89]), .rdlo_out(a2_wr[121]));
			radix2 #(.width(width)) rd_st1_58   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[90]), .rdlo_in(mux_stage1[122]),  .coef_in(coef[52]), .rdup_out(a2_wr[90]), .rdlo_out(a2_wr[122]));
			radix2 #(.width(width)) rd_st1_59   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[91]), .rdlo_in(mux_stage1[123]),  .coef_in(coef[54]), .rdup_out(a2_wr[91]), .rdlo_out(a2_wr[123]));
			radix2 #(.width(width)) rd_st1_60   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[92]), .rdlo_in(mux_stage1[124]),  .coef_in(coef[56]), .rdup_out(a2_wr[92]), .rdlo_out(a2_wr[124]));
			radix2 #(.width(width)) rd_st1_61   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[93]), .rdlo_in(mux_stage1[125]),  .coef_in(coef[58]), .rdup_out(a2_wr[93]), .rdlo_out(a2_wr[125]));
			radix2 #(.width(width)) rd_st1_62   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[94]), .rdlo_in(mux_stage1[126]),  .coef_in(coef[60]), .rdup_out(a2_wr[94]), .rdlo_out(a2_wr[126]));
			radix2 #(.width(width)) rd_st1_63   (.clk(clk), .rst(rst), .stall(sel_fft[5]), .rdup_in(mux_stage1[95]), .rdlo_in(mux_stage1[127]),  .coef_in(coef[62]), .rdup_out(a2_wr[95]), .rdlo_out(a2_wr[127]));

			//--- mux stage 1
			mux_fft #(.width(width)) mux_st1_0 (.sel0(sel_fft[5]), .in0(a0_wr[0]), .in1(a2_wr[0]), .out0(mux_stage2[0]));
			mux_fft #(.width(width)) mux_st1_1 (.sel0(sel_fft[5]), .in0(a0_wr[1]), .in1(a2_wr[1]), .out0(mux_stage2[1]));
			mux_fft #(.width(width)) mux_st1_2 (.sel0(sel_fft[5]), .in0(a0_wr[2]), .in1(a2_wr[2]), .out0(mux_stage2[2]));
			mux_fft #(.width(width)) mux_st1_3 (.sel0(sel_fft[5]), .in0(a0_wr[3]), .in1(a2_wr[3]), .out0(mux_stage2[3]));
			mux_fft #(.width(width)) mux_st1_4 (.sel0(sel_fft[5]), .in0(a0_wr[4]), .in1(a2_wr[4]), .out0(mux_stage2[4]));
			mux_fft #(.width(width)) mux_st1_5 (.sel0(sel_fft[5]), .in0(a0_wr[5]), .in1(a2_wr[5]), .out0(mux_stage2[5]));
			mux_fft #(.width(width)) mux_st1_6 (.sel0(sel_fft[5]), .in0(a0_wr[6]), .in1(a2_wr[6]), .out0(mux_stage2[6]));
			mux_fft #(.width(width)) mux_st1_7 (.sel0(sel_fft[5]), .in0(a0_wr[7]), .in1(a2_wr[7]), .out0(mux_stage2[7]));
			mux_fft #(.width(width)) mux_st1_8 (.sel0(sel_fft[5]), .in0(a0_wr[8]), .in1(a2_wr[8]), .out0(mux_stage2[8]));
			mux_fft #(.width(width)) mux_st1_9 (.sel0(sel_fft[5]), .in0(a0_wr[9]), .in1(a2_wr[9]), .out0(mux_stage2[9]));
			mux_fft #(.width(width)) mux_st1_10 (.sel0(sel_fft[5]), .in0(a0_wr[10]), .in1(a2_wr[10]), .out0(mux_stage2[10]));
			mux_fft #(.width(width)) mux_st1_11 (.sel0(sel_fft[5]), .in0(a0_wr[11]), .in1(a2_wr[11]), .out0(mux_stage2[11]));
			mux_fft #(.width(width)) mux_st1_12 (.sel0(sel_fft[5]), .in0(a0_wr[12]), .in1(a2_wr[12]), .out0(mux_stage2[12]));
			mux_fft #(.width(width)) mux_st1_13 (.sel0(sel_fft[5]), .in0(a0_wr[13]), .in1(a2_wr[13]), .out0(mux_stage2[13]));
			mux_fft #(.width(width)) mux_st1_14 (.sel0(sel_fft[5]), .in0(a0_wr[14]), .in1(a2_wr[14]), .out0(mux_stage2[14]));
			mux_fft #(.width(width)) mux_st1_15 (.sel0(sel_fft[5]), .in0(a0_wr[15]), .in1(a2_wr[15]), .out0(mux_stage2[15]));
			mux_fft #(.width(width)) mux_st1_16 (.sel0(sel_fft[5]), .in0(a0_wr[16]), .in1(a2_wr[16]), .out0(mux_stage2[16]));
			mux_fft #(.width(width)) mux_st1_17 (.sel0(sel_fft[5]), .in0(a0_wr[17]), .in1(a2_wr[17]), .out0(mux_stage2[17]));
			mux_fft #(.width(width)) mux_st1_18 (.sel0(sel_fft[5]), .in0(a0_wr[18]), .in1(a2_wr[18]), .out0(mux_stage2[18]));
			mux_fft #(.width(width)) mux_st1_19 (.sel0(sel_fft[5]), .in0(a0_wr[19]), .in1(a2_wr[19]), .out0(mux_stage2[19]));
			mux_fft #(.width(width)) mux_st1_20 (.sel0(sel_fft[5]), .in0(a0_wr[20]), .in1(a2_wr[20]), .out0(mux_stage2[20]));
			mux_fft #(.width(width)) mux_st1_21 (.sel0(sel_fft[5]), .in0(a0_wr[21]), .in1(a2_wr[21]), .out0(mux_stage2[21]));
			mux_fft #(.width(width)) mux_st1_22 (.sel0(sel_fft[5]), .in0(a0_wr[22]), .in1(a2_wr[22]), .out0(mux_stage2[22]));
			mux_fft #(.width(width)) mux_st1_23 (.sel0(sel_fft[5]), .in0(a0_wr[23]), .in1(a2_wr[23]), .out0(mux_stage2[23]));
			mux_fft #(.width(width)) mux_st1_24 (.sel0(sel_fft[5]), .in0(a0_wr[24]), .in1(a2_wr[24]), .out0(mux_stage2[24]));
			mux_fft #(.width(width)) mux_st1_25 (.sel0(sel_fft[5]), .in0(a0_wr[25]), .in1(a2_wr[25]), .out0(mux_stage2[25]));
			mux_fft #(.width(width)) mux_st1_26 (.sel0(sel_fft[5]), .in0(a0_wr[26]), .in1(a2_wr[26]), .out0(mux_stage2[26]));
			mux_fft #(.width(width)) mux_st1_27 (.sel0(sel_fft[5]), .in0(a0_wr[27]), .in1(a2_wr[27]), .out0(mux_stage2[27]));
			mux_fft #(.width(width)) mux_st1_28 (.sel0(sel_fft[5]), .in0(a0_wr[28]), .in1(a2_wr[28]), .out0(mux_stage2[28]));
			mux_fft #(.width(width)) mux_st1_29 (.sel0(sel_fft[5]), .in0(a0_wr[29]), .in1(a2_wr[29]), .out0(mux_stage2[29]));
			mux_fft #(.width(width)) mux_st1_30 (.sel0(sel_fft[5]), .in0(a0_wr[30]), .in1(a2_wr[30]), .out0(mux_stage2[30]));
			mux_fft #(.width(width)) mux_st1_31 (.sel0(sel_fft[5]), .in0(a0_wr[31]), .in1(a2_wr[31]), .out0(mux_stage2[31]));
			mux_fft #(.width(width)) mux_st1_32 (.sel0(sel_fft[5]), .in0(a0_wr[32]), .in1(a2_wr[32]), .out0(mux_stage2[32]));
			mux_fft #(.width(width)) mux_st1_33 (.sel0(sel_fft[5]), .in0(a0_wr[33]), .in1(a2_wr[33]), .out0(mux_stage2[33]));
			mux_fft #(.width(width)) mux_st1_34 (.sel0(sel_fft[5]), .in0(a0_wr[34]), .in1(a2_wr[34]), .out0(mux_stage2[34]));
			mux_fft #(.width(width)) mux_st1_35 (.sel0(sel_fft[5]), .in0(a0_wr[35]), .in1(a2_wr[35]), .out0(mux_stage2[35]));
			mux_fft #(.width(width)) mux_st1_36 (.sel0(sel_fft[5]), .in0(a0_wr[36]), .in1(a2_wr[36]), .out0(mux_stage2[36]));
			mux_fft #(.width(width)) mux_st1_37 (.sel0(sel_fft[5]), .in0(a0_wr[37]), .in1(a2_wr[37]), .out0(mux_stage2[37]));
			mux_fft #(.width(width)) mux_st1_38 (.sel0(sel_fft[5]), .in0(a0_wr[38]), .in1(a2_wr[38]), .out0(mux_stage2[38]));
			mux_fft #(.width(width)) mux_st1_39 (.sel0(sel_fft[5]), .in0(a0_wr[39]), .in1(a2_wr[39]), .out0(mux_stage2[39]));
			mux_fft #(.width(width)) mux_st1_40 (.sel0(sel_fft[5]), .in0(a0_wr[40]), .in1(a2_wr[40]), .out0(mux_stage2[40]));
			mux_fft #(.width(width)) mux_st1_41 (.sel0(sel_fft[5]), .in0(a0_wr[41]), .in1(a2_wr[41]), .out0(mux_stage2[41]));
			mux_fft #(.width(width)) mux_st1_42 (.sel0(sel_fft[5]), .in0(a0_wr[42]), .in1(a2_wr[42]), .out0(mux_stage2[42]));
			mux_fft #(.width(width)) mux_st1_43 (.sel0(sel_fft[5]), .in0(a0_wr[43]), .in1(a2_wr[43]), .out0(mux_stage2[43]));
			mux_fft #(.width(width)) mux_st1_44 (.sel0(sel_fft[5]), .in0(a0_wr[44]), .in1(a2_wr[44]), .out0(mux_stage2[44]));
			mux_fft #(.width(width)) mux_st1_45 (.sel0(sel_fft[5]), .in0(a0_wr[45]), .in1(a2_wr[45]), .out0(mux_stage2[45]));
			mux_fft #(.width(width)) mux_st1_46 (.sel0(sel_fft[5]), .in0(a0_wr[46]), .in1(a2_wr[46]), .out0(mux_stage2[46]));
			mux_fft #(.width(width)) mux_st1_47 (.sel0(sel_fft[5]), .in0(a0_wr[47]), .in1(a2_wr[47]), .out0(mux_stage2[47]));
			mux_fft #(.width(width)) mux_st1_48 (.sel0(sel_fft[5]), .in0(a0_wr[48]), .in1(a2_wr[48]), .out0(mux_stage2[48]));
			mux_fft #(.width(width)) mux_st1_49 (.sel0(sel_fft[5]), .in0(a0_wr[49]), .in1(a2_wr[49]), .out0(mux_stage2[49]));
			mux_fft #(.width(width)) mux_st1_50 (.sel0(sel_fft[5]), .in0(a0_wr[50]), .in1(a2_wr[50]), .out0(mux_stage2[50]));
			mux_fft #(.width(width)) mux_st1_51 (.sel0(sel_fft[5]), .in0(a0_wr[51]), .in1(a2_wr[51]), .out0(mux_stage2[51]));
			mux_fft #(.width(width)) mux_st1_52 (.sel0(sel_fft[5]), .in0(a0_wr[52]), .in1(a2_wr[52]), .out0(mux_stage2[52]));
			mux_fft #(.width(width)) mux_st1_53 (.sel0(sel_fft[5]), .in0(a0_wr[53]), .in1(a2_wr[53]), .out0(mux_stage2[53]));
			mux_fft #(.width(width)) mux_st1_54 (.sel0(sel_fft[5]), .in0(a0_wr[54]), .in1(a2_wr[54]), .out0(mux_stage2[54]));
			mux_fft #(.width(width)) mux_st1_55 (.sel0(sel_fft[5]), .in0(a0_wr[55]), .in1(a2_wr[55]), .out0(mux_stage2[55]));
			mux_fft #(.width(width)) mux_st1_56 (.sel0(sel_fft[5]), .in0(a0_wr[56]), .in1(a2_wr[56]), .out0(mux_stage2[56]));
			mux_fft #(.width(width)) mux_st1_57 (.sel0(sel_fft[5]), .in0(a0_wr[57]), .in1(a2_wr[57]), .out0(mux_stage2[57]));
			mux_fft #(.width(width)) mux_st1_58 (.sel0(sel_fft[5]), .in0(a0_wr[58]), .in1(a2_wr[58]), .out0(mux_stage2[58]));
			mux_fft #(.width(width)) mux_st1_59 (.sel0(sel_fft[5]), .in0(a0_wr[59]), .in1(a2_wr[59]), .out0(mux_stage2[59]));
			mux_fft #(.width(width)) mux_st1_60 (.sel0(sel_fft[5]), .in0(a0_wr[60]), .in1(a2_wr[60]), .out0(mux_stage2[60]));
			mux_fft #(.width(width)) mux_st1_61 (.sel0(sel_fft[5]), .in0(a0_wr[61]), .in1(a2_wr[61]), .out0(mux_stage2[61]));
			mux_fft #(.width(width)) mux_st1_62 (.sel0(sel_fft[5]), .in0(a0_wr[62]), .in1(a2_wr[62]), .out0(mux_stage2[62]));
			mux_fft #(.width(width)) mux_st1_63 (.sel0(sel_fft[5]), .in0(a0_wr[63]), .in1(a2_wr[63]), .out0(mux_stage2[63]));
			mux_fft #(.width(width)) mux_st1_64 (.sel0(sel_fft[5]), .in0(a0_wr[64]), .in1(a2_wr[64]), .out0(mux_stage2[64]));
			mux_fft #(.width(width)) mux_st1_65 (.sel0(sel_fft[5]), .in0(a0_wr[65]), .in1(a2_wr[65]), .out0(mux_stage2[65]));
			mux_fft #(.width(width)) mux_st1_66 (.sel0(sel_fft[5]), .in0(a0_wr[66]), .in1(a2_wr[66]), .out0(mux_stage2[66]));
			mux_fft #(.width(width)) mux_st1_67 (.sel0(sel_fft[5]), .in0(a0_wr[67]), .in1(a2_wr[67]), .out0(mux_stage2[67]));
			mux_fft #(.width(width)) mux_st1_68 (.sel0(sel_fft[5]), .in0(a0_wr[68]), .in1(a2_wr[68]), .out0(mux_stage2[68]));
			mux_fft #(.width(width)) mux_st1_69 (.sel0(sel_fft[5]), .in0(a0_wr[69]), .in1(a2_wr[69]), .out0(mux_stage2[69]));
			mux_fft #(.width(width)) mux_st1_70 (.sel0(sel_fft[5]), .in0(a0_wr[70]), .in1(a2_wr[70]), .out0(mux_stage2[70]));
			mux_fft #(.width(width)) mux_st1_71 (.sel0(sel_fft[5]), .in0(a0_wr[71]), .in1(a2_wr[71]), .out0(mux_stage2[71]));
			mux_fft #(.width(width)) mux_st1_72 (.sel0(sel_fft[5]), .in0(a0_wr[72]), .in1(a2_wr[72]), .out0(mux_stage2[72]));
			mux_fft #(.width(width)) mux_st1_73 (.sel0(sel_fft[5]), .in0(a0_wr[73]), .in1(a2_wr[73]), .out0(mux_stage2[73]));
			mux_fft #(.width(width)) mux_st1_74 (.sel0(sel_fft[5]), .in0(a0_wr[74]), .in1(a2_wr[74]), .out0(mux_stage2[74]));
			mux_fft #(.width(width)) mux_st1_75 (.sel0(sel_fft[5]), .in0(a0_wr[75]), .in1(a2_wr[75]), .out0(mux_stage2[75]));
			mux_fft #(.width(width)) mux_st1_76 (.sel0(sel_fft[5]), .in0(a0_wr[76]), .in1(a2_wr[76]), .out0(mux_stage2[76]));
			mux_fft #(.width(width)) mux_st1_77 (.sel0(sel_fft[5]), .in0(a0_wr[77]), .in1(a2_wr[77]), .out0(mux_stage2[77]));
			mux_fft #(.width(width)) mux_st1_78 (.sel0(sel_fft[5]), .in0(a0_wr[78]), .in1(a2_wr[78]), .out0(mux_stage2[78]));
			mux_fft #(.width(width)) mux_st1_79 (.sel0(sel_fft[5]), .in0(a0_wr[79]), .in1(a2_wr[79]), .out0(mux_stage2[79]));
			mux_fft #(.width(width)) mux_st1_80 (.sel0(sel_fft[5]), .in0(a0_wr[80]), .in1(a2_wr[80]), .out0(mux_stage2[80]));
			mux_fft #(.width(width)) mux_st1_81 (.sel0(sel_fft[5]), .in0(a0_wr[81]), .in1(a2_wr[81]), .out0(mux_stage2[81]));
			mux_fft #(.width(width)) mux_st1_82 (.sel0(sel_fft[5]), .in0(a0_wr[82]), .in1(a2_wr[82]), .out0(mux_stage2[82]));
			mux_fft #(.width(width)) mux_st1_83 (.sel0(sel_fft[5]), .in0(a0_wr[83]), .in1(a2_wr[83]), .out0(mux_stage2[83]));
			mux_fft #(.width(width)) mux_st1_84 (.sel0(sel_fft[5]), .in0(a0_wr[84]), .in1(a2_wr[84]), .out0(mux_stage2[84]));
			mux_fft #(.width(width)) mux_st1_85 (.sel0(sel_fft[5]), .in0(a0_wr[85]), .in1(a2_wr[85]), .out0(mux_stage2[85]));
			mux_fft #(.width(width)) mux_st1_86 (.sel0(sel_fft[5]), .in0(a0_wr[86]), .in1(a2_wr[86]), .out0(mux_stage2[86]));
			mux_fft #(.width(width)) mux_st1_87 (.sel0(sel_fft[5]), .in0(a0_wr[87]), .in1(a2_wr[87]), .out0(mux_stage2[87]));
			mux_fft #(.width(width)) mux_st1_88 (.sel0(sel_fft[5]), .in0(a0_wr[88]), .in1(a2_wr[88]), .out0(mux_stage2[88]));
			mux_fft #(.width(width)) mux_st1_89 (.sel0(sel_fft[5]), .in0(a0_wr[89]), .in1(a2_wr[89]), .out0(mux_stage2[89]));
			mux_fft #(.width(width)) mux_st1_90 (.sel0(sel_fft[5]), .in0(a0_wr[90]), .in1(a2_wr[90]), .out0(mux_stage2[90]));
			mux_fft #(.width(width)) mux_st1_91 (.sel0(sel_fft[5]), .in0(a0_wr[91]), .in1(a2_wr[91]), .out0(mux_stage2[91]));
			mux_fft #(.width(width)) mux_st1_92 (.sel0(sel_fft[5]), .in0(a0_wr[92]), .in1(a2_wr[92]), .out0(mux_stage2[92]));
			mux_fft #(.width(width)) mux_st1_93 (.sel0(sel_fft[5]), .in0(a0_wr[93]), .in1(a2_wr[93]), .out0(mux_stage2[93]));
			mux_fft #(.width(width)) mux_st1_94 (.sel0(sel_fft[5]), .in0(a0_wr[94]), .in1(a2_wr[94]), .out0(mux_stage2[94]));
			mux_fft #(.width(width)) mux_st1_95 (.sel0(sel_fft[5]), .in0(a0_wr[95]), .in1(a2_wr[95]), .out0(mux_stage2[95]));
			mux_fft #(.width(width)) mux_st1_96 (.sel0(sel_fft[5]), .in0(a0_wr[96]), .in1(a2_wr[96]), .out0(mux_stage2[96]));
			mux_fft #(.width(width)) mux_st1_97 (.sel0(sel_fft[5]), .in0(a0_wr[97]), .in1(a2_wr[97]), .out0(mux_stage2[97]));
			mux_fft #(.width(width)) mux_st1_98 (.sel0(sel_fft[5]), .in0(a0_wr[98]), .in1(a2_wr[98]), .out0(mux_stage2[98]));
			mux_fft #(.width(width)) mux_st1_99 (.sel0(sel_fft[5]), .in0(a0_wr[99]), .in1(a2_wr[99]), .out0(mux_stage2[99]));
			mux_fft #(.width(width)) mux_st1_100 (.sel0(sel_fft[5]), .in0(a0_wr[100]), .in1(a2_wr[100]), .out0(mux_stage2[100]));
			mux_fft #(.width(width)) mux_st1_101 (.sel0(sel_fft[5]), .in0(a0_wr[101]), .in1(a2_wr[101]), .out0(mux_stage2[101]));
			mux_fft #(.width(width)) mux_st1_102 (.sel0(sel_fft[5]), .in0(a0_wr[102]), .in1(a2_wr[102]), .out0(mux_stage2[102]));
			mux_fft #(.width(width)) mux_st1_103 (.sel0(sel_fft[5]), .in0(a0_wr[103]), .in1(a2_wr[103]), .out0(mux_stage2[103]));
			mux_fft #(.width(width)) mux_st1_104 (.sel0(sel_fft[5]), .in0(a0_wr[104]), .in1(a2_wr[104]), .out0(mux_stage2[104]));
			mux_fft #(.width(width)) mux_st1_105 (.sel0(sel_fft[5]), .in0(a0_wr[105]), .in1(a2_wr[105]), .out0(mux_stage2[105]));
			mux_fft #(.width(width)) mux_st1_106 (.sel0(sel_fft[5]), .in0(a0_wr[106]), .in1(a2_wr[106]), .out0(mux_stage2[106]));
			mux_fft #(.width(width)) mux_st1_107 (.sel0(sel_fft[5]), .in0(a0_wr[107]), .in1(a2_wr[107]), .out0(mux_stage2[107]));
			mux_fft #(.width(width)) mux_st1_108 (.sel0(sel_fft[5]), .in0(a0_wr[108]), .in1(a2_wr[108]), .out0(mux_stage2[108]));
			mux_fft #(.width(width)) mux_st1_109 (.sel0(sel_fft[5]), .in0(a0_wr[109]), .in1(a2_wr[109]), .out0(mux_stage2[109]));
			mux_fft #(.width(width)) mux_st1_110 (.sel0(sel_fft[5]), .in0(a0_wr[110]), .in1(a2_wr[110]), .out0(mux_stage2[110]));
			mux_fft #(.width(width)) mux_st1_111 (.sel0(sel_fft[5]), .in0(a0_wr[111]), .in1(a2_wr[111]), .out0(mux_stage2[111]));
			mux_fft #(.width(width)) mux_st1_112 (.sel0(sel_fft[5]), .in0(a0_wr[112]), .in1(a2_wr[112]), .out0(mux_stage2[112]));
			mux_fft #(.width(width)) mux_st1_113 (.sel0(sel_fft[5]), .in0(a0_wr[113]), .in1(a2_wr[113]), .out0(mux_stage2[113]));
			mux_fft #(.width(width)) mux_st1_114 (.sel0(sel_fft[5]), .in0(a0_wr[114]), .in1(a2_wr[114]), .out0(mux_stage2[114]));
			mux_fft #(.width(width)) mux_st1_115 (.sel0(sel_fft[5]), .in0(a0_wr[115]), .in1(a2_wr[115]), .out0(mux_stage2[115]));
			mux_fft #(.width(width)) mux_st1_116 (.sel0(sel_fft[5]), .in0(a0_wr[116]), .in1(a2_wr[116]), .out0(mux_stage2[116]));
			mux_fft #(.width(width)) mux_st1_117 (.sel0(sel_fft[5]), .in0(a0_wr[117]), .in1(a2_wr[117]), .out0(mux_stage2[117]));
			mux_fft #(.width(width)) mux_st1_118 (.sel0(sel_fft[5]), .in0(a0_wr[118]), .in1(a2_wr[118]), .out0(mux_stage2[118]));
			mux_fft #(.width(width)) mux_st1_119 (.sel0(sel_fft[5]), .in0(a0_wr[119]), .in1(a2_wr[119]), .out0(mux_stage2[119]));
			mux_fft #(.width(width)) mux_st1_120 (.sel0(sel_fft[5]), .in0(a0_wr[120]), .in1(a2_wr[120]), .out0(mux_stage2[120]));
			mux_fft #(.width(width)) mux_st1_121 (.sel0(sel_fft[5]), .in0(a0_wr[121]), .in1(a2_wr[121]), .out0(mux_stage2[121]));
			mux_fft #(.width(width)) mux_st1_122 (.sel0(sel_fft[5]), .in0(a0_wr[122]), .in1(a2_wr[122]), .out0(mux_stage2[122]));
			mux_fft #(.width(width)) mux_st1_123 (.sel0(sel_fft[5]), .in0(a0_wr[123]), .in1(a2_wr[123]), .out0(mux_stage2[123]));
			mux_fft #(.width(width)) mux_st1_124 (.sel0(sel_fft[5]), .in0(a0_wr[124]), .in1(a2_wr[124]), .out0(mux_stage2[124]));
			mux_fft #(.width(width)) mux_st1_125 (.sel0(sel_fft[5]), .in0(a0_wr[125]), .in1(a2_wr[125]), .out0(mux_stage2[125]));
			mux_fft #(.width(width)) mux_st1_126 (.sel0(sel_fft[5]), .in0(a0_wr[126]), .in1(a2_wr[126]), .out0(mux_stage2[126]));
			mux_fft #(.width(width)) mux_st1_127 (.sel0(sel_fft[5]), .in0(a0_wr[127]), .in1(a2_wr[127]), .out0(mux_stage2[127]));

			//--- radix stage 2
			radix2 #(.width(width)) rd_st2_0   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[0]), .rdlo_in(mux_stage2[16]),  .coef_in(coef[0]), .rdup_out(a3_wr[0]), .rdlo_out(a3_wr[16]));
			radix2 #(.width(width)) rd_st2_1   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[1]), .rdlo_in(mux_stage2[17]),  .coef_in(coef[4]), .rdup_out(a3_wr[1]), .rdlo_out(a3_wr[17]));
			radix2 #(.width(width)) rd_st2_2   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[2]), .rdlo_in(mux_stage2[18]),  .coef_in(coef[8]), .rdup_out(a3_wr[2]), .rdlo_out(a3_wr[18]));
			radix2 #(.width(width)) rd_st2_3   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[3]), .rdlo_in(mux_stage2[19]),  .coef_in(coef[12]), .rdup_out(a3_wr[3]), .rdlo_out(a3_wr[19]));
			radix2 #(.width(width)) rd_st2_4   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[4]), .rdlo_in(mux_stage2[20]),  .coef_in(coef[16]), .rdup_out(a3_wr[4]), .rdlo_out(a3_wr[20]));
			radix2 #(.width(width)) rd_st2_5   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[5]), .rdlo_in(mux_stage2[21]),  .coef_in(coef[20]), .rdup_out(a3_wr[5]), .rdlo_out(a3_wr[21]));
			radix2 #(.width(width)) rd_st2_6   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[6]), .rdlo_in(mux_stage2[22]),  .coef_in(coef[24]), .rdup_out(a3_wr[6]), .rdlo_out(a3_wr[22]));
			radix2 #(.width(width)) rd_st2_7   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[7]), .rdlo_in(mux_stage2[23]),  .coef_in(coef[28]), .rdup_out(a3_wr[7]), .rdlo_out(a3_wr[23]));
			radix2 #(.width(width)) rd_st2_8   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[8]), .rdlo_in(mux_stage2[24]),  .coef_in(coef[32]), .rdup_out(a3_wr[8]), .rdlo_out(a3_wr[24]));
			radix2 #(.width(width)) rd_st2_9   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[9]), .rdlo_in(mux_stage2[25]),  .coef_in(coef[36]), .rdup_out(a3_wr[9]), .rdlo_out(a3_wr[25]));
			radix2 #(.width(width)) rd_st2_10   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[10]), .rdlo_in(mux_stage2[26]),  .coef_in(coef[40]), .rdup_out(a3_wr[10]), .rdlo_out(a3_wr[26]));
			radix2 #(.width(width)) rd_st2_11   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[11]), .rdlo_in(mux_stage2[27]),  .coef_in(coef[44]), .rdup_out(a3_wr[11]), .rdlo_out(a3_wr[27]));
			radix2 #(.width(width)) rd_st2_12   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[12]), .rdlo_in(mux_stage2[28]),  .coef_in(coef[48]), .rdup_out(a3_wr[12]), .rdlo_out(a3_wr[28]));
			radix2 #(.width(width)) rd_st2_13   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[13]), .rdlo_in(mux_stage2[29]),  .coef_in(coef[52]), .rdup_out(a3_wr[13]), .rdlo_out(a3_wr[29]));
			radix2 #(.width(width)) rd_st2_14   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[14]), .rdlo_in(mux_stage2[30]),  .coef_in(coef[56]), .rdup_out(a3_wr[14]), .rdlo_out(a3_wr[30]));
			radix2 #(.width(width)) rd_st2_15   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[15]), .rdlo_in(mux_stage2[31]),  .coef_in(coef[60]), .rdup_out(a3_wr[15]), .rdlo_out(a3_wr[31]));
			radix2 #(.width(width)) rd_st2_16   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[32]), .rdlo_in(mux_stage2[48]),  .coef_in(coef[0]), .rdup_out(a3_wr[32]), .rdlo_out(a3_wr[48]));
			radix2 #(.width(width)) rd_st2_17   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[33]), .rdlo_in(mux_stage2[49]),  .coef_in(coef[4]), .rdup_out(a3_wr[33]), .rdlo_out(a3_wr[49]));
			radix2 #(.width(width)) rd_st2_18   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[34]), .rdlo_in(mux_stage2[50]),  .coef_in(coef[8]), .rdup_out(a3_wr[34]), .rdlo_out(a3_wr[50]));
			radix2 #(.width(width)) rd_st2_19   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[35]), .rdlo_in(mux_stage2[51]),  .coef_in(coef[12]), .rdup_out(a3_wr[35]), .rdlo_out(a3_wr[51]));
			radix2 #(.width(width)) rd_st2_20   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[36]), .rdlo_in(mux_stage2[52]),  .coef_in(coef[16]), .rdup_out(a3_wr[36]), .rdlo_out(a3_wr[52]));
			radix2 #(.width(width)) rd_st2_21   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[37]), .rdlo_in(mux_stage2[53]),  .coef_in(coef[20]), .rdup_out(a3_wr[37]), .rdlo_out(a3_wr[53]));
			radix2 #(.width(width)) rd_st2_22   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[38]), .rdlo_in(mux_stage2[54]),  .coef_in(coef[24]), .rdup_out(a3_wr[38]), .rdlo_out(a3_wr[54]));
			radix2 #(.width(width)) rd_st2_23   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[39]), .rdlo_in(mux_stage2[55]),  .coef_in(coef[28]), .rdup_out(a3_wr[39]), .rdlo_out(a3_wr[55]));
			radix2 #(.width(width)) rd_st2_24   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[40]), .rdlo_in(mux_stage2[56]),  .coef_in(coef[32]), .rdup_out(a3_wr[40]), .rdlo_out(a3_wr[56]));
			radix2 #(.width(width)) rd_st2_25   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[41]), .rdlo_in(mux_stage2[57]),  .coef_in(coef[36]), .rdup_out(a3_wr[41]), .rdlo_out(a3_wr[57]));
			radix2 #(.width(width)) rd_st2_26   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[42]), .rdlo_in(mux_stage2[58]),  .coef_in(coef[40]), .rdup_out(a3_wr[42]), .rdlo_out(a3_wr[58]));
			radix2 #(.width(width)) rd_st2_27   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[43]), .rdlo_in(mux_stage2[59]),  .coef_in(coef[44]), .rdup_out(a3_wr[43]), .rdlo_out(a3_wr[59]));
			radix2 #(.width(width)) rd_st2_28   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[44]), .rdlo_in(mux_stage2[60]),  .coef_in(coef[48]), .rdup_out(a3_wr[44]), .rdlo_out(a3_wr[60]));
			radix2 #(.width(width)) rd_st2_29   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[45]), .rdlo_in(mux_stage2[61]),  .coef_in(coef[52]), .rdup_out(a3_wr[45]), .rdlo_out(a3_wr[61]));
			radix2 #(.width(width)) rd_st2_30   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[46]), .rdlo_in(mux_stage2[62]),  .coef_in(coef[56]), .rdup_out(a3_wr[46]), .rdlo_out(a3_wr[62]));
			radix2 #(.width(width)) rd_st2_31   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[47]), .rdlo_in(mux_stage2[63]),  .coef_in(coef[60]), .rdup_out(a3_wr[47]), .rdlo_out(a3_wr[63]));
			radix2 #(.width(width)) rd_st2_32   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[64]), .rdlo_in(mux_stage2[80]),  .coef_in(coef[0]), .rdup_out(a3_wr[64]), .rdlo_out(a3_wr[80]));
			radix2 #(.width(width)) rd_st2_33   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[65]), .rdlo_in(mux_stage2[81]),  .coef_in(coef[4]), .rdup_out(a3_wr[65]), .rdlo_out(a3_wr[81]));
			radix2 #(.width(width)) rd_st2_34   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[66]), .rdlo_in(mux_stage2[82]),  .coef_in(coef[8]), .rdup_out(a3_wr[66]), .rdlo_out(a3_wr[82]));
			radix2 #(.width(width)) rd_st2_35   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[67]), .rdlo_in(mux_stage2[83]),  .coef_in(coef[12]), .rdup_out(a3_wr[67]), .rdlo_out(a3_wr[83]));
			radix2 #(.width(width)) rd_st2_36   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[68]), .rdlo_in(mux_stage2[84]),  .coef_in(coef[16]), .rdup_out(a3_wr[68]), .rdlo_out(a3_wr[84]));
			radix2 #(.width(width)) rd_st2_37   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[69]), .rdlo_in(mux_stage2[85]),  .coef_in(coef[20]), .rdup_out(a3_wr[69]), .rdlo_out(a3_wr[85]));
			radix2 #(.width(width)) rd_st2_38   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[70]), .rdlo_in(mux_stage2[86]),  .coef_in(coef[24]), .rdup_out(a3_wr[70]), .rdlo_out(a3_wr[86]));
			radix2 #(.width(width)) rd_st2_39   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[71]), .rdlo_in(mux_stage2[87]),  .coef_in(coef[28]), .rdup_out(a3_wr[71]), .rdlo_out(a3_wr[87]));
			radix2 #(.width(width)) rd_st2_40   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[72]), .rdlo_in(mux_stage2[88]),  .coef_in(coef[32]), .rdup_out(a3_wr[72]), .rdlo_out(a3_wr[88]));
			radix2 #(.width(width)) rd_st2_41   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[73]), .rdlo_in(mux_stage2[89]),  .coef_in(coef[36]), .rdup_out(a3_wr[73]), .rdlo_out(a3_wr[89]));
			radix2 #(.width(width)) rd_st2_42   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[74]), .rdlo_in(mux_stage2[90]),  .coef_in(coef[40]), .rdup_out(a3_wr[74]), .rdlo_out(a3_wr[90]));
			radix2 #(.width(width)) rd_st2_43   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[75]), .rdlo_in(mux_stage2[91]),  .coef_in(coef[44]), .rdup_out(a3_wr[75]), .rdlo_out(a3_wr[91]));
			radix2 #(.width(width)) rd_st2_44   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[76]), .rdlo_in(mux_stage2[92]),  .coef_in(coef[48]), .rdup_out(a3_wr[76]), .rdlo_out(a3_wr[92]));
			radix2 #(.width(width)) rd_st2_45   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[77]), .rdlo_in(mux_stage2[93]),  .coef_in(coef[52]), .rdup_out(a3_wr[77]), .rdlo_out(a3_wr[93]));
			radix2 #(.width(width)) rd_st2_46   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[78]), .rdlo_in(mux_stage2[94]),  .coef_in(coef[56]), .rdup_out(a3_wr[78]), .rdlo_out(a3_wr[94]));
			radix2 #(.width(width)) rd_st2_47   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[79]), .rdlo_in(mux_stage2[95]),  .coef_in(coef[60]), .rdup_out(a3_wr[79]), .rdlo_out(a3_wr[95]));
			radix2 #(.width(width)) rd_st2_48   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[96]), .rdlo_in(mux_stage2[112]),  .coef_in(coef[0]), .rdup_out(a3_wr[96]), .rdlo_out(a3_wr[112]));
			radix2 #(.width(width)) rd_st2_49   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[97]), .rdlo_in(mux_stage2[113]),  .coef_in(coef[4]), .rdup_out(a3_wr[97]), .rdlo_out(a3_wr[113]));
			radix2 #(.width(width)) rd_st2_50   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[98]), .rdlo_in(mux_stage2[114]),  .coef_in(coef[8]), .rdup_out(a3_wr[98]), .rdlo_out(a3_wr[114]));
			radix2 #(.width(width)) rd_st2_51   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[99]), .rdlo_in(mux_stage2[115]),  .coef_in(coef[12]), .rdup_out(a3_wr[99]), .rdlo_out(a3_wr[115]));
			radix2 #(.width(width)) rd_st2_52   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[100]), .rdlo_in(mux_stage2[116]),  .coef_in(coef[16]), .rdup_out(a3_wr[100]), .rdlo_out(a3_wr[116]));
			radix2 #(.width(width)) rd_st2_53   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[101]), .rdlo_in(mux_stage2[117]),  .coef_in(coef[20]), .rdup_out(a3_wr[101]), .rdlo_out(a3_wr[117]));
			radix2 #(.width(width)) rd_st2_54   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[102]), .rdlo_in(mux_stage2[118]),  .coef_in(coef[24]), .rdup_out(a3_wr[102]), .rdlo_out(a3_wr[118]));
			radix2 #(.width(width)) rd_st2_55   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[103]), .rdlo_in(mux_stage2[119]),  .coef_in(coef[28]), .rdup_out(a3_wr[103]), .rdlo_out(a3_wr[119]));
			radix2 #(.width(width)) rd_st2_56   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[104]), .rdlo_in(mux_stage2[120]),  .coef_in(coef[32]), .rdup_out(a3_wr[104]), .rdlo_out(a3_wr[120]));
			radix2 #(.width(width)) rd_st2_57   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[105]), .rdlo_in(mux_stage2[121]),  .coef_in(coef[36]), .rdup_out(a3_wr[105]), .rdlo_out(a3_wr[121]));
			radix2 #(.width(width)) rd_st2_58   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[106]), .rdlo_in(mux_stage2[122]),  .coef_in(coef[40]), .rdup_out(a3_wr[106]), .rdlo_out(a3_wr[122]));
			radix2 #(.width(width)) rd_st2_59   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[107]), .rdlo_in(mux_stage2[123]),  .coef_in(coef[44]), .rdup_out(a3_wr[107]), .rdlo_out(a3_wr[123]));
			radix2 #(.width(width)) rd_st2_60   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[108]), .rdlo_in(mux_stage2[124]),  .coef_in(coef[48]), .rdup_out(a3_wr[108]), .rdlo_out(a3_wr[124]));
			radix2 #(.width(width)) rd_st2_61   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[109]), .rdlo_in(mux_stage2[125]),  .coef_in(coef[52]), .rdup_out(a3_wr[109]), .rdlo_out(a3_wr[125]));
			radix2 #(.width(width)) rd_st2_62   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[110]), .rdlo_in(mux_stage2[126]),  .coef_in(coef[56]), .rdup_out(a3_wr[110]), .rdlo_out(a3_wr[126]));
			radix2 #(.width(width)) rd_st2_63   (.clk(clk), .rst(rst), .stall(sel_fft[4]), .rdup_in(mux_stage2[111]), .rdlo_in(mux_stage2[127]),  .coef_in(coef[60]), .rdup_out(a3_wr[111]), .rdlo_out(a3_wr[127]));

			//--- mux stage 2
			mux_fft #(.width(width)) mux_st2_0 (.sel0(sel_fft[4]), .in0(a0_wr[0]), .in1(a3_wr[0]), .out0(mux_stage3[0]));
			mux_fft #(.width(width)) mux_st2_1 (.sel0(sel_fft[4]), .in0(a0_wr[1]), .in1(a3_wr[1]), .out0(mux_stage3[1]));
			mux_fft #(.width(width)) mux_st2_2 (.sel0(sel_fft[4]), .in0(a0_wr[2]), .in1(a3_wr[2]), .out0(mux_stage3[2]));
			mux_fft #(.width(width)) mux_st2_3 (.sel0(sel_fft[4]), .in0(a0_wr[3]), .in1(a3_wr[3]), .out0(mux_stage3[3]));
			mux_fft #(.width(width)) mux_st2_4 (.sel0(sel_fft[4]), .in0(a0_wr[4]), .in1(a3_wr[4]), .out0(mux_stage3[4]));
			mux_fft #(.width(width)) mux_st2_5 (.sel0(sel_fft[4]), .in0(a0_wr[5]), .in1(a3_wr[5]), .out0(mux_stage3[5]));
			mux_fft #(.width(width)) mux_st2_6 (.sel0(sel_fft[4]), .in0(a0_wr[6]), .in1(a3_wr[6]), .out0(mux_stage3[6]));
			mux_fft #(.width(width)) mux_st2_7 (.sel0(sel_fft[4]), .in0(a0_wr[7]), .in1(a3_wr[7]), .out0(mux_stage3[7]));
			mux_fft #(.width(width)) mux_st2_8 (.sel0(sel_fft[4]), .in0(a0_wr[8]), .in1(a3_wr[8]), .out0(mux_stage3[8]));
			mux_fft #(.width(width)) mux_st2_9 (.sel0(sel_fft[4]), .in0(a0_wr[9]), .in1(a3_wr[9]), .out0(mux_stage3[9]));
			mux_fft #(.width(width)) mux_st2_10 (.sel0(sel_fft[4]), .in0(a0_wr[10]), .in1(a3_wr[10]), .out0(mux_stage3[10]));
			mux_fft #(.width(width)) mux_st2_11 (.sel0(sel_fft[4]), .in0(a0_wr[11]), .in1(a3_wr[11]), .out0(mux_stage3[11]));
			mux_fft #(.width(width)) mux_st2_12 (.sel0(sel_fft[4]), .in0(a0_wr[12]), .in1(a3_wr[12]), .out0(mux_stage3[12]));
			mux_fft #(.width(width)) mux_st2_13 (.sel0(sel_fft[4]), .in0(a0_wr[13]), .in1(a3_wr[13]), .out0(mux_stage3[13]));
			mux_fft #(.width(width)) mux_st2_14 (.sel0(sel_fft[4]), .in0(a0_wr[14]), .in1(a3_wr[14]), .out0(mux_stage3[14]));
			mux_fft #(.width(width)) mux_st2_15 (.sel0(sel_fft[4]), .in0(a0_wr[15]), .in1(a3_wr[15]), .out0(mux_stage3[15]));
			mux_fft #(.width(width)) mux_st2_16 (.sel0(sel_fft[4]), .in0(a0_wr[16]), .in1(a3_wr[16]), .out0(mux_stage3[16]));
			mux_fft #(.width(width)) mux_st2_17 (.sel0(sel_fft[4]), .in0(a0_wr[17]), .in1(a3_wr[17]), .out0(mux_stage3[17]));
			mux_fft #(.width(width)) mux_st2_18 (.sel0(sel_fft[4]), .in0(a0_wr[18]), .in1(a3_wr[18]), .out0(mux_stage3[18]));
			mux_fft #(.width(width)) mux_st2_19 (.sel0(sel_fft[4]), .in0(a0_wr[19]), .in1(a3_wr[19]), .out0(mux_stage3[19]));
			mux_fft #(.width(width)) mux_st2_20 (.sel0(sel_fft[4]), .in0(a0_wr[20]), .in1(a3_wr[20]), .out0(mux_stage3[20]));
			mux_fft #(.width(width)) mux_st2_21 (.sel0(sel_fft[4]), .in0(a0_wr[21]), .in1(a3_wr[21]), .out0(mux_stage3[21]));
			mux_fft #(.width(width)) mux_st2_22 (.sel0(sel_fft[4]), .in0(a0_wr[22]), .in1(a3_wr[22]), .out0(mux_stage3[22]));
			mux_fft #(.width(width)) mux_st2_23 (.sel0(sel_fft[4]), .in0(a0_wr[23]), .in1(a3_wr[23]), .out0(mux_stage3[23]));
			mux_fft #(.width(width)) mux_st2_24 (.sel0(sel_fft[4]), .in0(a0_wr[24]), .in1(a3_wr[24]), .out0(mux_stage3[24]));
			mux_fft #(.width(width)) mux_st2_25 (.sel0(sel_fft[4]), .in0(a0_wr[25]), .in1(a3_wr[25]), .out0(mux_stage3[25]));
			mux_fft #(.width(width)) mux_st2_26 (.sel0(sel_fft[4]), .in0(a0_wr[26]), .in1(a3_wr[26]), .out0(mux_stage3[26]));
			mux_fft #(.width(width)) mux_st2_27 (.sel0(sel_fft[4]), .in0(a0_wr[27]), .in1(a3_wr[27]), .out0(mux_stage3[27]));
			mux_fft #(.width(width)) mux_st2_28 (.sel0(sel_fft[4]), .in0(a0_wr[28]), .in1(a3_wr[28]), .out0(mux_stage3[28]));
			mux_fft #(.width(width)) mux_st2_29 (.sel0(sel_fft[4]), .in0(a0_wr[29]), .in1(a3_wr[29]), .out0(mux_stage3[29]));
			mux_fft #(.width(width)) mux_st2_30 (.sel0(sel_fft[4]), .in0(a0_wr[30]), .in1(a3_wr[30]), .out0(mux_stage3[30]));
			mux_fft #(.width(width)) mux_st2_31 (.sel0(sel_fft[4]), .in0(a0_wr[31]), .in1(a3_wr[31]), .out0(mux_stage3[31]));
			mux_fft #(.width(width)) mux_st2_32 (.sel0(sel_fft[4]), .in0(a0_wr[32]), .in1(a3_wr[32]), .out0(mux_stage3[32]));
			mux_fft #(.width(width)) mux_st2_33 (.sel0(sel_fft[4]), .in0(a0_wr[33]), .in1(a3_wr[33]), .out0(mux_stage3[33]));
			mux_fft #(.width(width)) mux_st2_34 (.sel0(sel_fft[4]), .in0(a0_wr[34]), .in1(a3_wr[34]), .out0(mux_stage3[34]));
			mux_fft #(.width(width)) mux_st2_35 (.sel0(sel_fft[4]), .in0(a0_wr[35]), .in1(a3_wr[35]), .out0(mux_stage3[35]));
			mux_fft #(.width(width)) mux_st2_36 (.sel0(sel_fft[4]), .in0(a0_wr[36]), .in1(a3_wr[36]), .out0(mux_stage3[36]));
			mux_fft #(.width(width)) mux_st2_37 (.sel0(sel_fft[4]), .in0(a0_wr[37]), .in1(a3_wr[37]), .out0(mux_stage3[37]));
			mux_fft #(.width(width)) mux_st2_38 (.sel0(sel_fft[4]), .in0(a0_wr[38]), .in1(a3_wr[38]), .out0(mux_stage3[38]));
			mux_fft #(.width(width)) mux_st2_39 (.sel0(sel_fft[4]), .in0(a0_wr[39]), .in1(a3_wr[39]), .out0(mux_stage3[39]));
			mux_fft #(.width(width)) mux_st2_40 (.sel0(sel_fft[4]), .in0(a0_wr[40]), .in1(a3_wr[40]), .out0(mux_stage3[40]));
			mux_fft #(.width(width)) mux_st2_41 (.sel0(sel_fft[4]), .in0(a0_wr[41]), .in1(a3_wr[41]), .out0(mux_stage3[41]));
			mux_fft #(.width(width)) mux_st2_42 (.sel0(sel_fft[4]), .in0(a0_wr[42]), .in1(a3_wr[42]), .out0(mux_stage3[42]));
			mux_fft #(.width(width)) mux_st2_43 (.sel0(sel_fft[4]), .in0(a0_wr[43]), .in1(a3_wr[43]), .out0(mux_stage3[43]));
			mux_fft #(.width(width)) mux_st2_44 (.sel0(sel_fft[4]), .in0(a0_wr[44]), .in1(a3_wr[44]), .out0(mux_stage3[44]));
			mux_fft #(.width(width)) mux_st2_45 (.sel0(sel_fft[4]), .in0(a0_wr[45]), .in1(a3_wr[45]), .out0(mux_stage3[45]));
			mux_fft #(.width(width)) mux_st2_46 (.sel0(sel_fft[4]), .in0(a0_wr[46]), .in1(a3_wr[46]), .out0(mux_stage3[46]));
			mux_fft #(.width(width)) mux_st2_47 (.sel0(sel_fft[4]), .in0(a0_wr[47]), .in1(a3_wr[47]), .out0(mux_stage3[47]));
			mux_fft #(.width(width)) mux_st2_48 (.sel0(sel_fft[4]), .in0(a0_wr[48]), .in1(a3_wr[48]), .out0(mux_stage3[48]));
			mux_fft #(.width(width)) mux_st2_49 (.sel0(sel_fft[4]), .in0(a0_wr[49]), .in1(a3_wr[49]), .out0(mux_stage3[49]));
			mux_fft #(.width(width)) mux_st2_50 (.sel0(sel_fft[4]), .in0(a0_wr[50]), .in1(a3_wr[50]), .out0(mux_stage3[50]));
			mux_fft #(.width(width)) mux_st2_51 (.sel0(sel_fft[4]), .in0(a0_wr[51]), .in1(a3_wr[51]), .out0(mux_stage3[51]));
			mux_fft #(.width(width)) mux_st2_52 (.sel0(sel_fft[4]), .in0(a0_wr[52]), .in1(a3_wr[52]), .out0(mux_stage3[52]));
			mux_fft #(.width(width)) mux_st2_53 (.sel0(sel_fft[4]), .in0(a0_wr[53]), .in1(a3_wr[53]), .out0(mux_stage3[53]));
			mux_fft #(.width(width)) mux_st2_54 (.sel0(sel_fft[4]), .in0(a0_wr[54]), .in1(a3_wr[54]), .out0(mux_stage3[54]));
			mux_fft #(.width(width)) mux_st2_55 (.sel0(sel_fft[4]), .in0(a0_wr[55]), .in1(a3_wr[55]), .out0(mux_stage3[55]));
			mux_fft #(.width(width)) mux_st2_56 (.sel0(sel_fft[4]), .in0(a0_wr[56]), .in1(a3_wr[56]), .out0(mux_stage3[56]));
			mux_fft #(.width(width)) mux_st2_57 (.sel0(sel_fft[4]), .in0(a0_wr[57]), .in1(a3_wr[57]), .out0(mux_stage3[57]));
			mux_fft #(.width(width)) mux_st2_58 (.sel0(sel_fft[4]), .in0(a0_wr[58]), .in1(a3_wr[58]), .out0(mux_stage3[58]));
			mux_fft #(.width(width)) mux_st2_59 (.sel0(sel_fft[4]), .in0(a0_wr[59]), .in1(a3_wr[59]), .out0(mux_stage3[59]));
			mux_fft #(.width(width)) mux_st2_60 (.sel0(sel_fft[4]), .in0(a0_wr[60]), .in1(a3_wr[60]), .out0(mux_stage3[60]));
			mux_fft #(.width(width)) mux_st2_61 (.sel0(sel_fft[4]), .in0(a0_wr[61]), .in1(a3_wr[61]), .out0(mux_stage3[61]));
			mux_fft #(.width(width)) mux_st2_62 (.sel0(sel_fft[4]), .in0(a0_wr[62]), .in1(a3_wr[62]), .out0(mux_stage3[62]));
			mux_fft #(.width(width)) mux_st2_63 (.sel0(sel_fft[4]), .in0(a0_wr[63]), .in1(a3_wr[63]), .out0(mux_stage3[63]));
			mux_fft #(.width(width)) mux_st2_64 (.sel0(sel_fft[4]), .in0(a0_wr[64]), .in1(a3_wr[64]), .out0(mux_stage3[64]));
			mux_fft #(.width(width)) mux_st2_65 (.sel0(sel_fft[4]), .in0(a0_wr[65]), .in1(a3_wr[65]), .out0(mux_stage3[65]));
			mux_fft #(.width(width)) mux_st2_66 (.sel0(sel_fft[4]), .in0(a0_wr[66]), .in1(a3_wr[66]), .out0(mux_stage3[66]));
			mux_fft #(.width(width)) mux_st2_67 (.sel0(sel_fft[4]), .in0(a0_wr[67]), .in1(a3_wr[67]), .out0(mux_stage3[67]));
			mux_fft #(.width(width)) mux_st2_68 (.sel0(sel_fft[4]), .in0(a0_wr[68]), .in1(a3_wr[68]), .out0(mux_stage3[68]));
			mux_fft #(.width(width)) mux_st2_69 (.sel0(sel_fft[4]), .in0(a0_wr[69]), .in1(a3_wr[69]), .out0(mux_stage3[69]));
			mux_fft #(.width(width)) mux_st2_70 (.sel0(sel_fft[4]), .in0(a0_wr[70]), .in1(a3_wr[70]), .out0(mux_stage3[70]));
			mux_fft #(.width(width)) mux_st2_71 (.sel0(sel_fft[4]), .in0(a0_wr[71]), .in1(a3_wr[71]), .out0(mux_stage3[71]));
			mux_fft #(.width(width)) mux_st2_72 (.sel0(sel_fft[4]), .in0(a0_wr[72]), .in1(a3_wr[72]), .out0(mux_stage3[72]));
			mux_fft #(.width(width)) mux_st2_73 (.sel0(sel_fft[4]), .in0(a0_wr[73]), .in1(a3_wr[73]), .out0(mux_stage3[73]));
			mux_fft #(.width(width)) mux_st2_74 (.sel0(sel_fft[4]), .in0(a0_wr[74]), .in1(a3_wr[74]), .out0(mux_stage3[74]));
			mux_fft #(.width(width)) mux_st2_75 (.sel0(sel_fft[4]), .in0(a0_wr[75]), .in1(a3_wr[75]), .out0(mux_stage3[75]));
			mux_fft #(.width(width)) mux_st2_76 (.sel0(sel_fft[4]), .in0(a0_wr[76]), .in1(a3_wr[76]), .out0(mux_stage3[76]));
			mux_fft #(.width(width)) mux_st2_77 (.sel0(sel_fft[4]), .in0(a0_wr[77]), .in1(a3_wr[77]), .out0(mux_stage3[77]));
			mux_fft #(.width(width)) mux_st2_78 (.sel0(sel_fft[4]), .in0(a0_wr[78]), .in1(a3_wr[78]), .out0(mux_stage3[78]));
			mux_fft #(.width(width)) mux_st2_79 (.sel0(sel_fft[4]), .in0(a0_wr[79]), .in1(a3_wr[79]), .out0(mux_stage3[79]));
			mux_fft #(.width(width)) mux_st2_80 (.sel0(sel_fft[4]), .in0(a0_wr[80]), .in1(a3_wr[80]), .out0(mux_stage3[80]));
			mux_fft #(.width(width)) mux_st2_81 (.sel0(sel_fft[4]), .in0(a0_wr[81]), .in1(a3_wr[81]), .out0(mux_stage3[81]));
			mux_fft #(.width(width)) mux_st2_82 (.sel0(sel_fft[4]), .in0(a0_wr[82]), .in1(a3_wr[82]), .out0(mux_stage3[82]));
			mux_fft #(.width(width)) mux_st2_83 (.sel0(sel_fft[4]), .in0(a0_wr[83]), .in1(a3_wr[83]), .out0(mux_stage3[83]));
			mux_fft #(.width(width)) mux_st2_84 (.sel0(sel_fft[4]), .in0(a0_wr[84]), .in1(a3_wr[84]), .out0(mux_stage3[84]));
			mux_fft #(.width(width)) mux_st2_85 (.sel0(sel_fft[4]), .in0(a0_wr[85]), .in1(a3_wr[85]), .out0(mux_stage3[85]));
			mux_fft #(.width(width)) mux_st2_86 (.sel0(sel_fft[4]), .in0(a0_wr[86]), .in1(a3_wr[86]), .out0(mux_stage3[86]));
			mux_fft #(.width(width)) mux_st2_87 (.sel0(sel_fft[4]), .in0(a0_wr[87]), .in1(a3_wr[87]), .out0(mux_stage3[87]));
			mux_fft #(.width(width)) mux_st2_88 (.sel0(sel_fft[4]), .in0(a0_wr[88]), .in1(a3_wr[88]), .out0(mux_stage3[88]));
			mux_fft #(.width(width)) mux_st2_89 (.sel0(sel_fft[4]), .in0(a0_wr[89]), .in1(a3_wr[89]), .out0(mux_stage3[89]));
			mux_fft #(.width(width)) mux_st2_90 (.sel0(sel_fft[4]), .in0(a0_wr[90]), .in1(a3_wr[90]), .out0(mux_stage3[90]));
			mux_fft #(.width(width)) mux_st2_91 (.sel0(sel_fft[4]), .in0(a0_wr[91]), .in1(a3_wr[91]), .out0(mux_stage3[91]));
			mux_fft #(.width(width)) mux_st2_92 (.sel0(sel_fft[4]), .in0(a0_wr[92]), .in1(a3_wr[92]), .out0(mux_stage3[92]));
			mux_fft #(.width(width)) mux_st2_93 (.sel0(sel_fft[4]), .in0(a0_wr[93]), .in1(a3_wr[93]), .out0(mux_stage3[93]));
			mux_fft #(.width(width)) mux_st2_94 (.sel0(sel_fft[4]), .in0(a0_wr[94]), .in1(a3_wr[94]), .out0(mux_stage3[94]));
			mux_fft #(.width(width)) mux_st2_95 (.sel0(sel_fft[4]), .in0(a0_wr[95]), .in1(a3_wr[95]), .out0(mux_stage3[95]));
			mux_fft #(.width(width)) mux_st2_96 (.sel0(sel_fft[4]), .in0(a0_wr[96]), .in1(a3_wr[96]), .out0(mux_stage3[96]));
			mux_fft #(.width(width)) mux_st2_97 (.sel0(sel_fft[4]), .in0(a0_wr[97]), .in1(a3_wr[97]), .out0(mux_stage3[97]));
			mux_fft #(.width(width)) mux_st2_98 (.sel0(sel_fft[4]), .in0(a0_wr[98]), .in1(a3_wr[98]), .out0(mux_stage3[98]));
			mux_fft #(.width(width)) mux_st2_99 (.sel0(sel_fft[4]), .in0(a0_wr[99]), .in1(a3_wr[99]), .out0(mux_stage3[99]));
			mux_fft #(.width(width)) mux_st2_100 (.sel0(sel_fft[4]), .in0(a0_wr[100]), .in1(a3_wr[100]), .out0(mux_stage3[100]));
			mux_fft #(.width(width)) mux_st2_101 (.sel0(sel_fft[4]), .in0(a0_wr[101]), .in1(a3_wr[101]), .out0(mux_stage3[101]));
			mux_fft #(.width(width)) mux_st2_102 (.sel0(sel_fft[4]), .in0(a0_wr[102]), .in1(a3_wr[102]), .out0(mux_stage3[102]));
			mux_fft #(.width(width)) mux_st2_103 (.sel0(sel_fft[4]), .in0(a0_wr[103]), .in1(a3_wr[103]), .out0(mux_stage3[103]));
			mux_fft #(.width(width)) mux_st2_104 (.sel0(sel_fft[4]), .in0(a0_wr[104]), .in1(a3_wr[104]), .out0(mux_stage3[104]));
			mux_fft #(.width(width)) mux_st2_105 (.sel0(sel_fft[4]), .in0(a0_wr[105]), .in1(a3_wr[105]), .out0(mux_stage3[105]));
			mux_fft #(.width(width)) mux_st2_106 (.sel0(sel_fft[4]), .in0(a0_wr[106]), .in1(a3_wr[106]), .out0(mux_stage3[106]));
			mux_fft #(.width(width)) mux_st2_107 (.sel0(sel_fft[4]), .in0(a0_wr[107]), .in1(a3_wr[107]), .out0(mux_stage3[107]));
			mux_fft #(.width(width)) mux_st2_108 (.sel0(sel_fft[4]), .in0(a0_wr[108]), .in1(a3_wr[108]), .out0(mux_stage3[108]));
			mux_fft #(.width(width)) mux_st2_109 (.sel0(sel_fft[4]), .in0(a0_wr[109]), .in1(a3_wr[109]), .out0(mux_stage3[109]));
			mux_fft #(.width(width)) mux_st2_110 (.sel0(sel_fft[4]), .in0(a0_wr[110]), .in1(a3_wr[110]), .out0(mux_stage3[110]));
			mux_fft #(.width(width)) mux_st2_111 (.sel0(sel_fft[4]), .in0(a0_wr[111]), .in1(a3_wr[111]), .out0(mux_stage3[111]));
			mux_fft #(.width(width)) mux_st2_112 (.sel0(sel_fft[4]), .in0(a0_wr[112]), .in1(a3_wr[112]), .out0(mux_stage3[112]));
			mux_fft #(.width(width)) mux_st2_113 (.sel0(sel_fft[4]), .in0(a0_wr[113]), .in1(a3_wr[113]), .out0(mux_stage3[113]));
			mux_fft #(.width(width)) mux_st2_114 (.sel0(sel_fft[4]), .in0(a0_wr[114]), .in1(a3_wr[114]), .out0(mux_stage3[114]));
			mux_fft #(.width(width)) mux_st2_115 (.sel0(sel_fft[4]), .in0(a0_wr[115]), .in1(a3_wr[115]), .out0(mux_stage3[115]));
			mux_fft #(.width(width)) mux_st2_116 (.sel0(sel_fft[4]), .in0(a0_wr[116]), .in1(a3_wr[116]), .out0(mux_stage3[116]));
			mux_fft #(.width(width)) mux_st2_117 (.sel0(sel_fft[4]), .in0(a0_wr[117]), .in1(a3_wr[117]), .out0(mux_stage3[117]));
			mux_fft #(.width(width)) mux_st2_118 (.sel0(sel_fft[4]), .in0(a0_wr[118]), .in1(a3_wr[118]), .out0(mux_stage3[118]));
			mux_fft #(.width(width)) mux_st2_119 (.sel0(sel_fft[4]), .in0(a0_wr[119]), .in1(a3_wr[119]), .out0(mux_stage3[119]));
			mux_fft #(.width(width)) mux_st2_120 (.sel0(sel_fft[4]), .in0(a0_wr[120]), .in1(a3_wr[120]), .out0(mux_stage3[120]));
			mux_fft #(.width(width)) mux_st2_121 (.sel0(sel_fft[4]), .in0(a0_wr[121]), .in1(a3_wr[121]), .out0(mux_stage3[121]));
			mux_fft #(.width(width)) mux_st2_122 (.sel0(sel_fft[4]), .in0(a0_wr[122]), .in1(a3_wr[122]), .out0(mux_stage3[122]));
			mux_fft #(.width(width)) mux_st2_123 (.sel0(sel_fft[4]), .in0(a0_wr[123]), .in1(a3_wr[123]), .out0(mux_stage3[123]));
			mux_fft #(.width(width)) mux_st2_124 (.sel0(sel_fft[4]), .in0(a0_wr[124]), .in1(a3_wr[124]), .out0(mux_stage3[124]));
			mux_fft #(.width(width)) mux_st2_125 (.sel0(sel_fft[4]), .in0(a0_wr[125]), .in1(a3_wr[125]), .out0(mux_stage3[125]));
			mux_fft #(.width(width)) mux_st2_126 (.sel0(sel_fft[4]), .in0(a0_wr[126]), .in1(a3_wr[126]), .out0(mux_stage3[126]));
			mux_fft #(.width(width)) mux_st2_127 (.sel0(sel_fft[4]), .in0(a0_wr[127]), .in1(a3_wr[127]), .out0(mux_stage3[127]));

			//--- radix stage 3
			radix2 #(.width(width)) rd_st3_0   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[0]), .rdlo_in(mux_stage3[8]),  .coef_in(coef[0]), .rdup_out(a4_wr[0]), .rdlo_out(a4_wr[8]));
			radix2 #(.width(width)) rd_st3_1   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[1]), .rdlo_in(mux_stage3[9]),  .coef_in(coef[8]), .rdup_out(a4_wr[1]), .rdlo_out(a4_wr[9]));
			radix2 #(.width(width)) rd_st3_2   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[2]), .rdlo_in(mux_stage3[10]),  .coef_in(coef[16]), .rdup_out(a4_wr[2]), .rdlo_out(a4_wr[10]));
			radix2 #(.width(width)) rd_st3_3   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[3]), .rdlo_in(mux_stage3[11]),  .coef_in(coef[24]), .rdup_out(a4_wr[3]), .rdlo_out(a4_wr[11]));
			radix2 #(.width(width)) rd_st3_4   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[4]), .rdlo_in(mux_stage3[12]),  .coef_in(coef[32]), .rdup_out(a4_wr[4]), .rdlo_out(a4_wr[12]));
			radix2 #(.width(width)) rd_st3_5   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[5]), .rdlo_in(mux_stage3[13]),  .coef_in(coef[40]), .rdup_out(a4_wr[5]), .rdlo_out(a4_wr[13]));
			radix2 #(.width(width)) rd_st3_6   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[6]), .rdlo_in(mux_stage3[14]),  .coef_in(coef[48]), .rdup_out(a4_wr[6]), .rdlo_out(a4_wr[14]));
			radix2 #(.width(width)) rd_st3_7   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[7]), .rdlo_in(mux_stage3[15]),  .coef_in(coef[56]), .rdup_out(a4_wr[7]), .rdlo_out(a4_wr[15]));
			radix2 #(.width(width)) rd_st3_8   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[16]), .rdlo_in(mux_stage3[24]),  .coef_in(coef[0]), .rdup_out(a4_wr[16]), .rdlo_out(a4_wr[24]));
			radix2 #(.width(width)) rd_st3_9   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[17]), .rdlo_in(mux_stage3[25]),  .coef_in(coef[8]), .rdup_out(a4_wr[17]), .rdlo_out(a4_wr[25]));
			radix2 #(.width(width)) rd_st3_10   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[18]), .rdlo_in(mux_stage3[26]),  .coef_in(coef[16]), .rdup_out(a4_wr[18]), .rdlo_out(a4_wr[26]));
			radix2 #(.width(width)) rd_st3_11   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[19]), .rdlo_in(mux_stage3[27]),  .coef_in(coef[24]), .rdup_out(a4_wr[19]), .rdlo_out(a4_wr[27]));
			radix2 #(.width(width)) rd_st3_12   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[20]), .rdlo_in(mux_stage3[28]),  .coef_in(coef[32]), .rdup_out(a4_wr[20]), .rdlo_out(a4_wr[28]));
			radix2 #(.width(width)) rd_st3_13   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[21]), .rdlo_in(mux_stage3[29]),  .coef_in(coef[40]), .rdup_out(a4_wr[21]), .rdlo_out(a4_wr[29]));
			radix2 #(.width(width)) rd_st3_14   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[22]), .rdlo_in(mux_stage3[30]),  .coef_in(coef[48]), .rdup_out(a4_wr[22]), .rdlo_out(a4_wr[30]));
			radix2 #(.width(width)) rd_st3_15   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[23]), .rdlo_in(mux_stage3[31]),  .coef_in(coef[56]), .rdup_out(a4_wr[23]), .rdlo_out(a4_wr[31]));
			radix2 #(.width(width)) rd_st3_16   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[32]), .rdlo_in(mux_stage3[40]),  .coef_in(coef[0]), .rdup_out(a4_wr[32]), .rdlo_out(a4_wr[40]));
			radix2 #(.width(width)) rd_st3_17   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[33]), .rdlo_in(mux_stage3[41]),  .coef_in(coef[8]), .rdup_out(a4_wr[33]), .rdlo_out(a4_wr[41]));
			radix2 #(.width(width)) rd_st3_18   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[34]), .rdlo_in(mux_stage3[42]),  .coef_in(coef[16]), .rdup_out(a4_wr[34]), .rdlo_out(a4_wr[42]));
			radix2 #(.width(width)) rd_st3_19   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[35]), .rdlo_in(mux_stage3[43]),  .coef_in(coef[24]), .rdup_out(a4_wr[35]), .rdlo_out(a4_wr[43]));
			radix2 #(.width(width)) rd_st3_20   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[36]), .rdlo_in(mux_stage3[44]),  .coef_in(coef[32]), .rdup_out(a4_wr[36]), .rdlo_out(a4_wr[44]));
			radix2 #(.width(width)) rd_st3_21   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[37]), .rdlo_in(mux_stage3[45]),  .coef_in(coef[40]), .rdup_out(a4_wr[37]), .rdlo_out(a4_wr[45]));
			radix2 #(.width(width)) rd_st3_22   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[38]), .rdlo_in(mux_stage3[46]),  .coef_in(coef[48]), .rdup_out(a4_wr[38]), .rdlo_out(a4_wr[46]));
			radix2 #(.width(width)) rd_st3_23   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[39]), .rdlo_in(mux_stage3[47]),  .coef_in(coef[56]), .rdup_out(a4_wr[39]), .rdlo_out(a4_wr[47]));
			radix2 #(.width(width)) rd_st3_24   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[48]), .rdlo_in(mux_stage3[56]),  .coef_in(coef[0]), .rdup_out(a4_wr[48]), .rdlo_out(a4_wr[56]));
			radix2 #(.width(width)) rd_st3_25   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[49]), .rdlo_in(mux_stage3[57]),  .coef_in(coef[8]), .rdup_out(a4_wr[49]), .rdlo_out(a4_wr[57]));
			radix2 #(.width(width)) rd_st3_26   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[50]), .rdlo_in(mux_stage3[58]),  .coef_in(coef[16]), .rdup_out(a4_wr[50]), .rdlo_out(a4_wr[58]));
			radix2 #(.width(width)) rd_st3_27   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[51]), .rdlo_in(mux_stage3[59]),  .coef_in(coef[24]), .rdup_out(a4_wr[51]), .rdlo_out(a4_wr[59]));
			radix2 #(.width(width)) rd_st3_28   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[52]), .rdlo_in(mux_stage3[60]),  .coef_in(coef[32]), .rdup_out(a4_wr[52]), .rdlo_out(a4_wr[60]));
			radix2 #(.width(width)) rd_st3_29   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[53]), .rdlo_in(mux_stage3[61]),  .coef_in(coef[40]), .rdup_out(a4_wr[53]), .rdlo_out(a4_wr[61]));
			radix2 #(.width(width)) rd_st3_30   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[54]), .rdlo_in(mux_stage3[62]),  .coef_in(coef[48]), .rdup_out(a4_wr[54]), .rdlo_out(a4_wr[62]));
			radix2 #(.width(width)) rd_st3_31   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[55]), .rdlo_in(mux_stage3[63]),  .coef_in(coef[56]), .rdup_out(a4_wr[55]), .rdlo_out(a4_wr[63]));
			radix2 #(.width(width)) rd_st3_32   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[64]), .rdlo_in(mux_stage3[72]),  .coef_in(coef[0]), .rdup_out(a4_wr[64]), .rdlo_out(a4_wr[72]));
			radix2 #(.width(width)) rd_st3_33   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[65]), .rdlo_in(mux_stage3[73]),  .coef_in(coef[8]), .rdup_out(a4_wr[65]), .rdlo_out(a4_wr[73]));
			radix2 #(.width(width)) rd_st3_34   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[66]), .rdlo_in(mux_stage3[74]),  .coef_in(coef[16]), .rdup_out(a4_wr[66]), .rdlo_out(a4_wr[74]));
			radix2 #(.width(width)) rd_st3_35   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[67]), .rdlo_in(mux_stage3[75]),  .coef_in(coef[24]), .rdup_out(a4_wr[67]), .rdlo_out(a4_wr[75]));
			radix2 #(.width(width)) rd_st3_36   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[68]), .rdlo_in(mux_stage3[76]),  .coef_in(coef[32]), .rdup_out(a4_wr[68]), .rdlo_out(a4_wr[76]));
			radix2 #(.width(width)) rd_st3_37   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[69]), .rdlo_in(mux_stage3[77]),  .coef_in(coef[40]), .rdup_out(a4_wr[69]), .rdlo_out(a4_wr[77]));
			radix2 #(.width(width)) rd_st3_38   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[70]), .rdlo_in(mux_stage3[78]),  .coef_in(coef[48]), .rdup_out(a4_wr[70]), .rdlo_out(a4_wr[78]));
			radix2 #(.width(width)) rd_st3_39   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[71]), .rdlo_in(mux_stage3[79]),  .coef_in(coef[56]), .rdup_out(a4_wr[71]), .rdlo_out(a4_wr[79]));
			radix2 #(.width(width)) rd_st3_40   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[80]), .rdlo_in(mux_stage3[88]),  .coef_in(coef[0]), .rdup_out(a4_wr[80]), .rdlo_out(a4_wr[88]));
			radix2 #(.width(width)) rd_st3_41   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[81]), .rdlo_in(mux_stage3[89]),  .coef_in(coef[8]), .rdup_out(a4_wr[81]), .rdlo_out(a4_wr[89]));
			radix2 #(.width(width)) rd_st3_42   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[82]), .rdlo_in(mux_stage3[90]),  .coef_in(coef[16]), .rdup_out(a4_wr[82]), .rdlo_out(a4_wr[90]));
			radix2 #(.width(width)) rd_st3_43   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[83]), .rdlo_in(mux_stage3[91]),  .coef_in(coef[24]), .rdup_out(a4_wr[83]), .rdlo_out(a4_wr[91]));
			radix2 #(.width(width)) rd_st3_44   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[84]), .rdlo_in(mux_stage3[92]),  .coef_in(coef[32]), .rdup_out(a4_wr[84]), .rdlo_out(a4_wr[92]));
			radix2 #(.width(width)) rd_st3_45   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[85]), .rdlo_in(mux_stage3[93]),  .coef_in(coef[40]), .rdup_out(a4_wr[85]), .rdlo_out(a4_wr[93]));
			radix2 #(.width(width)) rd_st3_46   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[86]), .rdlo_in(mux_stage3[94]),  .coef_in(coef[48]), .rdup_out(a4_wr[86]), .rdlo_out(a4_wr[94]));
			radix2 #(.width(width)) rd_st3_47   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[87]), .rdlo_in(mux_stage3[95]),  .coef_in(coef[56]), .rdup_out(a4_wr[87]), .rdlo_out(a4_wr[95]));
			radix2 #(.width(width)) rd_st3_48   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[96]), .rdlo_in(mux_stage3[104]),  .coef_in(coef[0]), .rdup_out(a4_wr[96]), .rdlo_out(a4_wr[104]));
			radix2 #(.width(width)) rd_st3_49   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[97]), .rdlo_in(mux_stage3[105]),  .coef_in(coef[8]), .rdup_out(a4_wr[97]), .rdlo_out(a4_wr[105]));
			radix2 #(.width(width)) rd_st3_50   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[98]), .rdlo_in(mux_stage3[106]),  .coef_in(coef[16]), .rdup_out(a4_wr[98]), .rdlo_out(a4_wr[106]));
			radix2 #(.width(width)) rd_st3_51   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[99]), .rdlo_in(mux_stage3[107]),  .coef_in(coef[24]), .rdup_out(a4_wr[99]), .rdlo_out(a4_wr[107]));
			radix2 #(.width(width)) rd_st3_52   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[100]), .rdlo_in(mux_stage3[108]),  .coef_in(coef[32]), .rdup_out(a4_wr[100]), .rdlo_out(a4_wr[108]));
			radix2 #(.width(width)) rd_st3_53   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[101]), .rdlo_in(mux_stage3[109]),  .coef_in(coef[40]), .rdup_out(a4_wr[101]), .rdlo_out(a4_wr[109]));
			radix2 #(.width(width)) rd_st3_54   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[102]), .rdlo_in(mux_stage3[110]),  .coef_in(coef[48]), .rdup_out(a4_wr[102]), .rdlo_out(a4_wr[110]));
			radix2 #(.width(width)) rd_st3_55   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[103]), .rdlo_in(mux_stage3[111]),  .coef_in(coef[56]), .rdup_out(a4_wr[103]), .rdlo_out(a4_wr[111]));
			radix2 #(.width(width)) rd_st3_56   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[112]), .rdlo_in(mux_stage3[120]),  .coef_in(coef[0]), .rdup_out(a4_wr[112]), .rdlo_out(a4_wr[120]));
			radix2 #(.width(width)) rd_st3_57   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[113]), .rdlo_in(mux_stage3[121]),  .coef_in(coef[8]), .rdup_out(a4_wr[113]), .rdlo_out(a4_wr[121]));
			radix2 #(.width(width)) rd_st3_58   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[114]), .rdlo_in(mux_stage3[122]),  .coef_in(coef[16]), .rdup_out(a4_wr[114]), .rdlo_out(a4_wr[122]));
			radix2 #(.width(width)) rd_st3_59   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[115]), .rdlo_in(mux_stage3[123]),  .coef_in(coef[24]), .rdup_out(a4_wr[115]), .rdlo_out(a4_wr[123]));
			radix2 #(.width(width)) rd_st3_60   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[116]), .rdlo_in(mux_stage3[124]),  .coef_in(coef[32]), .rdup_out(a4_wr[116]), .rdlo_out(a4_wr[124]));
			radix2 #(.width(width)) rd_st3_61   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[117]), .rdlo_in(mux_stage3[125]),  .coef_in(coef[40]), .rdup_out(a4_wr[117]), .rdlo_out(a4_wr[125]));
			radix2 #(.width(width)) rd_st3_62   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[118]), .rdlo_in(mux_stage3[126]),  .coef_in(coef[48]), .rdup_out(a4_wr[118]), .rdlo_out(a4_wr[126]));
			radix2 #(.width(width)) rd_st3_63   (.clk(clk), .rst(rst), .stall(sel_fft[3]), .rdup_in(mux_stage3[119]), .rdlo_in(mux_stage3[127]),  .coef_in(coef[56]), .rdup_out(a4_wr[119]), .rdlo_out(a4_wr[127]));

			//--- mux stage 3
			mux_fft #(.width(width)) mux_st3_0 (.sel0(sel_fft[3]), .in0(a0_wr[0]), .in1(a4_wr[0]), .out0(mux_stage4[0]));
			mux_fft #(.width(width)) mux_st3_1 (.sel0(sel_fft[3]), .in0(a0_wr[1]), .in1(a4_wr[1]), .out0(mux_stage4[1]));
			mux_fft #(.width(width)) mux_st3_2 (.sel0(sel_fft[3]), .in0(a0_wr[2]), .in1(a4_wr[2]), .out0(mux_stage4[2]));
			mux_fft #(.width(width)) mux_st3_3 (.sel0(sel_fft[3]), .in0(a0_wr[3]), .in1(a4_wr[3]), .out0(mux_stage4[3]));
			mux_fft #(.width(width)) mux_st3_4 (.sel0(sel_fft[3]), .in0(a0_wr[4]), .in1(a4_wr[4]), .out0(mux_stage4[4]));
			mux_fft #(.width(width)) mux_st3_5 (.sel0(sel_fft[3]), .in0(a0_wr[5]), .in1(a4_wr[5]), .out0(mux_stage4[5]));
			mux_fft #(.width(width)) mux_st3_6 (.sel0(sel_fft[3]), .in0(a0_wr[6]), .in1(a4_wr[6]), .out0(mux_stage4[6]));
			mux_fft #(.width(width)) mux_st3_7 (.sel0(sel_fft[3]), .in0(a0_wr[7]), .in1(a4_wr[7]), .out0(mux_stage4[7]));
			mux_fft #(.width(width)) mux_st3_8 (.sel0(sel_fft[3]), .in0(a0_wr[8]), .in1(a4_wr[8]), .out0(mux_stage4[8]));
			mux_fft #(.width(width)) mux_st3_9 (.sel0(sel_fft[3]), .in0(a0_wr[9]), .in1(a4_wr[9]), .out0(mux_stage4[9]));
			mux_fft #(.width(width)) mux_st3_10 (.sel0(sel_fft[3]), .in0(a0_wr[10]), .in1(a4_wr[10]), .out0(mux_stage4[10]));
			mux_fft #(.width(width)) mux_st3_11 (.sel0(sel_fft[3]), .in0(a0_wr[11]), .in1(a4_wr[11]), .out0(mux_stage4[11]));
			mux_fft #(.width(width)) mux_st3_12 (.sel0(sel_fft[3]), .in0(a0_wr[12]), .in1(a4_wr[12]), .out0(mux_stage4[12]));
			mux_fft #(.width(width)) mux_st3_13 (.sel0(sel_fft[3]), .in0(a0_wr[13]), .in1(a4_wr[13]), .out0(mux_stage4[13]));
			mux_fft #(.width(width)) mux_st3_14 (.sel0(sel_fft[3]), .in0(a0_wr[14]), .in1(a4_wr[14]), .out0(mux_stage4[14]));
			mux_fft #(.width(width)) mux_st3_15 (.sel0(sel_fft[3]), .in0(a0_wr[15]), .in1(a4_wr[15]), .out0(mux_stage4[15]));
			mux_fft #(.width(width)) mux_st3_16 (.sel0(sel_fft[3]), .in0(a0_wr[16]), .in1(a4_wr[16]), .out0(mux_stage4[16]));
			mux_fft #(.width(width)) mux_st3_17 (.sel0(sel_fft[3]), .in0(a0_wr[17]), .in1(a4_wr[17]), .out0(mux_stage4[17]));
			mux_fft #(.width(width)) mux_st3_18 (.sel0(sel_fft[3]), .in0(a0_wr[18]), .in1(a4_wr[18]), .out0(mux_stage4[18]));
			mux_fft #(.width(width)) mux_st3_19 (.sel0(sel_fft[3]), .in0(a0_wr[19]), .in1(a4_wr[19]), .out0(mux_stage4[19]));
			mux_fft #(.width(width)) mux_st3_20 (.sel0(sel_fft[3]), .in0(a0_wr[20]), .in1(a4_wr[20]), .out0(mux_stage4[20]));
			mux_fft #(.width(width)) mux_st3_21 (.sel0(sel_fft[3]), .in0(a0_wr[21]), .in1(a4_wr[21]), .out0(mux_stage4[21]));
			mux_fft #(.width(width)) mux_st3_22 (.sel0(sel_fft[3]), .in0(a0_wr[22]), .in1(a4_wr[22]), .out0(mux_stage4[22]));
			mux_fft #(.width(width)) mux_st3_23 (.sel0(sel_fft[3]), .in0(a0_wr[23]), .in1(a4_wr[23]), .out0(mux_stage4[23]));
			mux_fft #(.width(width)) mux_st3_24 (.sel0(sel_fft[3]), .in0(a0_wr[24]), .in1(a4_wr[24]), .out0(mux_stage4[24]));
			mux_fft #(.width(width)) mux_st3_25 (.sel0(sel_fft[3]), .in0(a0_wr[25]), .in1(a4_wr[25]), .out0(mux_stage4[25]));
			mux_fft #(.width(width)) mux_st3_26 (.sel0(sel_fft[3]), .in0(a0_wr[26]), .in1(a4_wr[26]), .out0(mux_stage4[26]));
			mux_fft #(.width(width)) mux_st3_27 (.sel0(sel_fft[3]), .in0(a0_wr[27]), .in1(a4_wr[27]), .out0(mux_stage4[27]));
			mux_fft #(.width(width)) mux_st3_28 (.sel0(sel_fft[3]), .in0(a0_wr[28]), .in1(a4_wr[28]), .out0(mux_stage4[28]));
			mux_fft #(.width(width)) mux_st3_29 (.sel0(sel_fft[3]), .in0(a0_wr[29]), .in1(a4_wr[29]), .out0(mux_stage4[29]));
			mux_fft #(.width(width)) mux_st3_30 (.sel0(sel_fft[3]), .in0(a0_wr[30]), .in1(a4_wr[30]), .out0(mux_stage4[30]));
			mux_fft #(.width(width)) mux_st3_31 (.sel0(sel_fft[3]), .in0(a0_wr[31]), .in1(a4_wr[31]), .out0(mux_stage4[31]));
			mux_fft #(.width(width)) mux_st3_32 (.sel0(sel_fft[3]), .in0(a0_wr[32]), .in1(a4_wr[32]), .out0(mux_stage4[32]));
			mux_fft #(.width(width)) mux_st3_33 (.sel0(sel_fft[3]), .in0(a0_wr[33]), .in1(a4_wr[33]), .out0(mux_stage4[33]));
			mux_fft #(.width(width)) mux_st3_34 (.sel0(sel_fft[3]), .in0(a0_wr[34]), .in1(a4_wr[34]), .out0(mux_stage4[34]));
			mux_fft #(.width(width)) mux_st3_35 (.sel0(sel_fft[3]), .in0(a0_wr[35]), .in1(a4_wr[35]), .out0(mux_stage4[35]));
			mux_fft #(.width(width)) mux_st3_36 (.sel0(sel_fft[3]), .in0(a0_wr[36]), .in1(a4_wr[36]), .out0(mux_stage4[36]));
			mux_fft #(.width(width)) mux_st3_37 (.sel0(sel_fft[3]), .in0(a0_wr[37]), .in1(a4_wr[37]), .out0(mux_stage4[37]));
			mux_fft #(.width(width)) mux_st3_38 (.sel0(sel_fft[3]), .in0(a0_wr[38]), .in1(a4_wr[38]), .out0(mux_stage4[38]));
			mux_fft #(.width(width)) mux_st3_39 (.sel0(sel_fft[3]), .in0(a0_wr[39]), .in1(a4_wr[39]), .out0(mux_stage4[39]));
			mux_fft #(.width(width)) mux_st3_40 (.sel0(sel_fft[3]), .in0(a0_wr[40]), .in1(a4_wr[40]), .out0(mux_stage4[40]));
			mux_fft #(.width(width)) mux_st3_41 (.sel0(sel_fft[3]), .in0(a0_wr[41]), .in1(a4_wr[41]), .out0(mux_stage4[41]));
			mux_fft #(.width(width)) mux_st3_42 (.sel0(sel_fft[3]), .in0(a0_wr[42]), .in1(a4_wr[42]), .out0(mux_stage4[42]));
			mux_fft #(.width(width)) mux_st3_43 (.sel0(sel_fft[3]), .in0(a0_wr[43]), .in1(a4_wr[43]), .out0(mux_stage4[43]));
			mux_fft #(.width(width)) mux_st3_44 (.sel0(sel_fft[3]), .in0(a0_wr[44]), .in1(a4_wr[44]), .out0(mux_stage4[44]));
			mux_fft #(.width(width)) mux_st3_45 (.sel0(sel_fft[3]), .in0(a0_wr[45]), .in1(a4_wr[45]), .out0(mux_stage4[45]));
			mux_fft #(.width(width)) mux_st3_46 (.sel0(sel_fft[3]), .in0(a0_wr[46]), .in1(a4_wr[46]), .out0(mux_stage4[46]));
			mux_fft #(.width(width)) mux_st3_47 (.sel0(sel_fft[3]), .in0(a0_wr[47]), .in1(a4_wr[47]), .out0(mux_stage4[47]));
			mux_fft #(.width(width)) mux_st3_48 (.sel0(sel_fft[3]), .in0(a0_wr[48]), .in1(a4_wr[48]), .out0(mux_stage4[48]));
			mux_fft #(.width(width)) mux_st3_49 (.sel0(sel_fft[3]), .in0(a0_wr[49]), .in1(a4_wr[49]), .out0(mux_stage4[49]));
			mux_fft #(.width(width)) mux_st3_50 (.sel0(sel_fft[3]), .in0(a0_wr[50]), .in1(a4_wr[50]), .out0(mux_stage4[50]));
			mux_fft #(.width(width)) mux_st3_51 (.sel0(sel_fft[3]), .in0(a0_wr[51]), .in1(a4_wr[51]), .out0(mux_stage4[51]));
			mux_fft #(.width(width)) mux_st3_52 (.sel0(sel_fft[3]), .in0(a0_wr[52]), .in1(a4_wr[52]), .out0(mux_stage4[52]));
			mux_fft #(.width(width)) mux_st3_53 (.sel0(sel_fft[3]), .in0(a0_wr[53]), .in1(a4_wr[53]), .out0(mux_stage4[53]));
			mux_fft #(.width(width)) mux_st3_54 (.sel0(sel_fft[3]), .in0(a0_wr[54]), .in1(a4_wr[54]), .out0(mux_stage4[54]));
			mux_fft #(.width(width)) mux_st3_55 (.sel0(sel_fft[3]), .in0(a0_wr[55]), .in1(a4_wr[55]), .out0(mux_stage4[55]));
			mux_fft #(.width(width)) mux_st3_56 (.sel0(sel_fft[3]), .in0(a0_wr[56]), .in1(a4_wr[56]), .out0(mux_stage4[56]));
			mux_fft #(.width(width)) mux_st3_57 (.sel0(sel_fft[3]), .in0(a0_wr[57]), .in1(a4_wr[57]), .out0(mux_stage4[57]));
			mux_fft #(.width(width)) mux_st3_58 (.sel0(sel_fft[3]), .in0(a0_wr[58]), .in1(a4_wr[58]), .out0(mux_stage4[58]));
			mux_fft #(.width(width)) mux_st3_59 (.sel0(sel_fft[3]), .in0(a0_wr[59]), .in1(a4_wr[59]), .out0(mux_stage4[59]));
			mux_fft #(.width(width)) mux_st3_60 (.sel0(sel_fft[3]), .in0(a0_wr[60]), .in1(a4_wr[60]), .out0(mux_stage4[60]));
			mux_fft #(.width(width)) mux_st3_61 (.sel0(sel_fft[3]), .in0(a0_wr[61]), .in1(a4_wr[61]), .out0(mux_stage4[61]));
			mux_fft #(.width(width)) mux_st3_62 (.sel0(sel_fft[3]), .in0(a0_wr[62]), .in1(a4_wr[62]), .out0(mux_stage4[62]));
			mux_fft #(.width(width)) mux_st3_63 (.sel0(sel_fft[3]), .in0(a0_wr[63]), .in1(a4_wr[63]), .out0(mux_stage4[63]));
			mux_fft #(.width(width)) mux_st3_64 (.sel0(sel_fft[3]), .in0(a0_wr[64]), .in1(a4_wr[64]), .out0(mux_stage4[64]));
			mux_fft #(.width(width)) mux_st3_65 (.sel0(sel_fft[3]), .in0(a0_wr[65]), .in1(a4_wr[65]), .out0(mux_stage4[65]));
			mux_fft #(.width(width)) mux_st3_66 (.sel0(sel_fft[3]), .in0(a0_wr[66]), .in1(a4_wr[66]), .out0(mux_stage4[66]));
			mux_fft #(.width(width)) mux_st3_67 (.sel0(sel_fft[3]), .in0(a0_wr[67]), .in1(a4_wr[67]), .out0(mux_stage4[67]));
			mux_fft #(.width(width)) mux_st3_68 (.sel0(sel_fft[3]), .in0(a0_wr[68]), .in1(a4_wr[68]), .out0(mux_stage4[68]));
			mux_fft #(.width(width)) mux_st3_69 (.sel0(sel_fft[3]), .in0(a0_wr[69]), .in1(a4_wr[69]), .out0(mux_stage4[69]));
			mux_fft #(.width(width)) mux_st3_70 (.sel0(sel_fft[3]), .in0(a0_wr[70]), .in1(a4_wr[70]), .out0(mux_stage4[70]));
			mux_fft #(.width(width)) mux_st3_71 (.sel0(sel_fft[3]), .in0(a0_wr[71]), .in1(a4_wr[71]), .out0(mux_stage4[71]));
			mux_fft #(.width(width)) mux_st3_72 (.sel0(sel_fft[3]), .in0(a0_wr[72]), .in1(a4_wr[72]), .out0(mux_stage4[72]));
			mux_fft #(.width(width)) mux_st3_73 (.sel0(sel_fft[3]), .in0(a0_wr[73]), .in1(a4_wr[73]), .out0(mux_stage4[73]));
			mux_fft #(.width(width)) mux_st3_74 (.sel0(sel_fft[3]), .in0(a0_wr[74]), .in1(a4_wr[74]), .out0(mux_stage4[74]));
			mux_fft #(.width(width)) mux_st3_75 (.sel0(sel_fft[3]), .in0(a0_wr[75]), .in1(a4_wr[75]), .out0(mux_stage4[75]));
			mux_fft #(.width(width)) mux_st3_76 (.sel0(sel_fft[3]), .in0(a0_wr[76]), .in1(a4_wr[76]), .out0(mux_stage4[76]));
			mux_fft #(.width(width)) mux_st3_77 (.sel0(sel_fft[3]), .in0(a0_wr[77]), .in1(a4_wr[77]), .out0(mux_stage4[77]));
			mux_fft #(.width(width)) mux_st3_78 (.sel0(sel_fft[3]), .in0(a0_wr[78]), .in1(a4_wr[78]), .out0(mux_stage4[78]));
			mux_fft #(.width(width)) mux_st3_79 (.sel0(sel_fft[3]), .in0(a0_wr[79]), .in1(a4_wr[79]), .out0(mux_stage4[79]));
			mux_fft #(.width(width)) mux_st3_80 (.sel0(sel_fft[3]), .in0(a0_wr[80]), .in1(a4_wr[80]), .out0(mux_stage4[80]));
			mux_fft #(.width(width)) mux_st3_81 (.sel0(sel_fft[3]), .in0(a0_wr[81]), .in1(a4_wr[81]), .out0(mux_stage4[81]));
			mux_fft #(.width(width)) mux_st3_82 (.sel0(sel_fft[3]), .in0(a0_wr[82]), .in1(a4_wr[82]), .out0(mux_stage4[82]));
			mux_fft #(.width(width)) mux_st3_83 (.sel0(sel_fft[3]), .in0(a0_wr[83]), .in1(a4_wr[83]), .out0(mux_stage4[83]));
			mux_fft #(.width(width)) mux_st3_84 (.sel0(sel_fft[3]), .in0(a0_wr[84]), .in1(a4_wr[84]), .out0(mux_stage4[84]));
			mux_fft #(.width(width)) mux_st3_85 (.sel0(sel_fft[3]), .in0(a0_wr[85]), .in1(a4_wr[85]), .out0(mux_stage4[85]));
			mux_fft #(.width(width)) mux_st3_86 (.sel0(sel_fft[3]), .in0(a0_wr[86]), .in1(a4_wr[86]), .out0(mux_stage4[86]));
			mux_fft #(.width(width)) mux_st3_87 (.sel0(sel_fft[3]), .in0(a0_wr[87]), .in1(a4_wr[87]), .out0(mux_stage4[87]));
			mux_fft #(.width(width)) mux_st3_88 (.sel0(sel_fft[3]), .in0(a0_wr[88]), .in1(a4_wr[88]), .out0(mux_stage4[88]));
			mux_fft #(.width(width)) mux_st3_89 (.sel0(sel_fft[3]), .in0(a0_wr[89]), .in1(a4_wr[89]), .out0(mux_stage4[89]));
			mux_fft #(.width(width)) mux_st3_90 (.sel0(sel_fft[3]), .in0(a0_wr[90]), .in1(a4_wr[90]), .out0(mux_stage4[90]));
			mux_fft #(.width(width)) mux_st3_91 (.sel0(sel_fft[3]), .in0(a0_wr[91]), .in1(a4_wr[91]), .out0(mux_stage4[91]));
			mux_fft #(.width(width)) mux_st3_92 (.sel0(sel_fft[3]), .in0(a0_wr[92]), .in1(a4_wr[92]), .out0(mux_stage4[92]));
			mux_fft #(.width(width)) mux_st3_93 (.sel0(sel_fft[3]), .in0(a0_wr[93]), .in1(a4_wr[93]), .out0(mux_stage4[93]));
			mux_fft #(.width(width)) mux_st3_94 (.sel0(sel_fft[3]), .in0(a0_wr[94]), .in1(a4_wr[94]), .out0(mux_stage4[94]));
			mux_fft #(.width(width)) mux_st3_95 (.sel0(sel_fft[3]), .in0(a0_wr[95]), .in1(a4_wr[95]), .out0(mux_stage4[95]));
			mux_fft #(.width(width)) mux_st3_96 (.sel0(sel_fft[3]), .in0(a0_wr[96]), .in1(a4_wr[96]), .out0(mux_stage4[96]));
			mux_fft #(.width(width)) mux_st3_97 (.sel0(sel_fft[3]), .in0(a0_wr[97]), .in1(a4_wr[97]), .out0(mux_stage4[97]));
			mux_fft #(.width(width)) mux_st3_98 (.sel0(sel_fft[3]), .in0(a0_wr[98]), .in1(a4_wr[98]), .out0(mux_stage4[98]));
			mux_fft #(.width(width)) mux_st3_99 (.sel0(sel_fft[3]), .in0(a0_wr[99]), .in1(a4_wr[99]), .out0(mux_stage4[99]));
			mux_fft #(.width(width)) mux_st3_100 (.sel0(sel_fft[3]), .in0(a0_wr[100]), .in1(a4_wr[100]), .out0(mux_stage4[100]));
			mux_fft #(.width(width)) mux_st3_101 (.sel0(sel_fft[3]), .in0(a0_wr[101]), .in1(a4_wr[101]), .out0(mux_stage4[101]));
			mux_fft #(.width(width)) mux_st3_102 (.sel0(sel_fft[3]), .in0(a0_wr[102]), .in1(a4_wr[102]), .out0(mux_stage4[102]));
			mux_fft #(.width(width)) mux_st3_103 (.sel0(sel_fft[3]), .in0(a0_wr[103]), .in1(a4_wr[103]), .out0(mux_stage4[103]));
			mux_fft #(.width(width)) mux_st3_104 (.sel0(sel_fft[3]), .in0(a0_wr[104]), .in1(a4_wr[104]), .out0(mux_stage4[104]));
			mux_fft #(.width(width)) mux_st3_105 (.sel0(sel_fft[3]), .in0(a0_wr[105]), .in1(a4_wr[105]), .out0(mux_stage4[105]));
			mux_fft #(.width(width)) mux_st3_106 (.sel0(sel_fft[3]), .in0(a0_wr[106]), .in1(a4_wr[106]), .out0(mux_stage4[106]));
			mux_fft #(.width(width)) mux_st3_107 (.sel0(sel_fft[3]), .in0(a0_wr[107]), .in1(a4_wr[107]), .out0(mux_stage4[107]));
			mux_fft #(.width(width)) mux_st3_108 (.sel0(sel_fft[3]), .in0(a0_wr[108]), .in1(a4_wr[108]), .out0(mux_stage4[108]));
			mux_fft #(.width(width)) mux_st3_109 (.sel0(sel_fft[3]), .in0(a0_wr[109]), .in1(a4_wr[109]), .out0(mux_stage4[109]));
			mux_fft #(.width(width)) mux_st3_110 (.sel0(sel_fft[3]), .in0(a0_wr[110]), .in1(a4_wr[110]), .out0(mux_stage4[110]));
			mux_fft #(.width(width)) mux_st3_111 (.sel0(sel_fft[3]), .in0(a0_wr[111]), .in1(a4_wr[111]), .out0(mux_stage4[111]));
			mux_fft #(.width(width)) mux_st3_112 (.sel0(sel_fft[3]), .in0(a0_wr[112]), .in1(a4_wr[112]), .out0(mux_stage4[112]));
			mux_fft #(.width(width)) mux_st3_113 (.sel0(sel_fft[3]), .in0(a0_wr[113]), .in1(a4_wr[113]), .out0(mux_stage4[113]));
			mux_fft #(.width(width)) mux_st3_114 (.sel0(sel_fft[3]), .in0(a0_wr[114]), .in1(a4_wr[114]), .out0(mux_stage4[114]));
			mux_fft #(.width(width)) mux_st3_115 (.sel0(sel_fft[3]), .in0(a0_wr[115]), .in1(a4_wr[115]), .out0(mux_stage4[115]));
			mux_fft #(.width(width)) mux_st3_116 (.sel0(sel_fft[3]), .in0(a0_wr[116]), .in1(a4_wr[116]), .out0(mux_stage4[116]));
			mux_fft #(.width(width)) mux_st3_117 (.sel0(sel_fft[3]), .in0(a0_wr[117]), .in1(a4_wr[117]), .out0(mux_stage4[117]));
			mux_fft #(.width(width)) mux_st3_118 (.sel0(sel_fft[3]), .in0(a0_wr[118]), .in1(a4_wr[118]), .out0(mux_stage4[118]));
			mux_fft #(.width(width)) mux_st3_119 (.sel0(sel_fft[3]), .in0(a0_wr[119]), .in1(a4_wr[119]), .out0(mux_stage4[119]));
			mux_fft #(.width(width)) mux_st3_120 (.sel0(sel_fft[3]), .in0(a0_wr[120]), .in1(a4_wr[120]), .out0(mux_stage4[120]));
			mux_fft #(.width(width)) mux_st3_121 (.sel0(sel_fft[3]), .in0(a0_wr[121]), .in1(a4_wr[121]), .out0(mux_stage4[121]));
			mux_fft #(.width(width)) mux_st3_122 (.sel0(sel_fft[3]), .in0(a0_wr[122]), .in1(a4_wr[122]), .out0(mux_stage4[122]));
			mux_fft #(.width(width)) mux_st3_123 (.sel0(sel_fft[3]), .in0(a0_wr[123]), .in1(a4_wr[123]), .out0(mux_stage4[123]));
			mux_fft #(.width(width)) mux_st3_124 (.sel0(sel_fft[3]), .in0(a0_wr[124]), .in1(a4_wr[124]), .out0(mux_stage4[124]));
			mux_fft #(.width(width)) mux_st3_125 (.sel0(sel_fft[3]), .in0(a0_wr[125]), .in1(a4_wr[125]), .out0(mux_stage4[125]));
			mux_fft #(.width(width)) mux_st3_126 (.sel0(sel_fft[3]), .in0(a0_wr[126]), .in1(a4_wr[126]), .out0(mux_stage4[126]));
			mux_fft #(.width(width)) mux_st3_127 (.sel0(sel_fft[3]), .in0(a0_wr[127]), .in1(a4_wr[127]), .out0(mux_stage4[127]));

			//--- radix stage 4
			radix2 #(.width(width)) rd_st4_0   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[0]), .rdlo_in(mux_stage4[4]),  .coef_in(coef[0]), .rdup_out(a5_wr[0]), .rdlo_out(a5_wr[4]));
			radix2 #(.width(width)) rd_st4_1   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[1]), .rdlo_in(mux_stage4[5]),  .coef_in(coef[16]), .rdup_out(a5_wr[1]), .rdlo_out(a5_wr[5]));
			radix2 #(.width(width)) rd_st4_2   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[2]), .rdlo_in(mux_stage4[6]),  .coef_in(coef[32]), .rdup_out(a5_wr[2]), .rdlo_out(a5_wr[6]));
			radix2 #(.width(width)) rd_st4_3   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[3]), .rdlo_in(mux_stage4[7]),  .coef_in(coef[48]), .rdup_out(a5_wr[3]), .rdlo_out(a5_wr[7]));
			radix2 #(.width(width)) rd_st4_4   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[8]), .rdlo_in(mux_stage4[12]),  .coef_in(coef[0]), .rdup_out(a5_wr[8]), .rdlo_out(a5_wr[12]));
			radix2 #(.width(width)) rd_st4_5   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[9]), .rdlo_in(mux_stage4[13]),  .coef_in(coef[16]), .rdup_out(a5_wr[9]), .rdlo_out(a5_wr[13]));
			radix2 #(.width(width)) rd_st4_6   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[10]), .rdlo_in(mux_stage4[14]),  .coef_in(coef[32]), .rdup_out(a5_wr[10]), .rdlo_out(a5_wr[14]));
			radix2 #(.width(width)) rd_st4_7   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[11]), .rdlo_in(mux_stage4[15]),  .coef_in(coef[48]), .rdup_out(a5_wr[11]), .rdlo_out(a5_wr[15]));
			radix2 #(.width(width)) rd_st4_8   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[16]), .rdlo_in(mux_stage4[20]),  .coef_in(coef[0]), .rdup_out(a5_wr[16]), .rdlo_out(a5_wr[20]));
			radix2 #(.width(width)) rd_st4_9   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[17]), .rdlo_in(mux_stage4[21]),  .coef_in(coef[16]), .rdup_out(a5_wr[17]), .rdlo_out(a5_wr[21]));
			radix2 #(.width(width)) rd_st4_10   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[18]), .rdlo_in(mux_stage4[22]),  .coef_in(coef[32]), .rdup_out(a5_wr[18]), .rdlo_out(a5_wr[22]));
			radix2 #(.width(width)) rd_st4_11   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[19]), .rdlo_in(mux_stage4[23]),  .coef_in(coef[48]), .rdup_out(a5_wr[19]), .rdlo_out(a5_wr[23]));
			radix2 #(.width(width)) rd_st4_12   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[24]), .rdlo_in(mux_stage4[28]),  .coef_in(coef[0]), .rdup_out(a5_wr[24]), .rdlo_out(a5_wr[28]));
			radix2 #(.width(width)) rd_st4_13   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[25]), .rdlo_in(mux_stage4[29]),  .coef_in(coef[16]), .rdup_out(a5_wr[25]), .rdlo_out(a5_wr[29]));
			radix2 #(.width(width)) rd_st4_14   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[26]), .rdlo_in(mux_stage4[30]),  .coef_in(coef[32]), .rdup_out(a5_wr[26]), .rdlo_out(a5_wr[30]));
			radix2 #(.width(width)) rd_st4_15   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[27]), .rdlo_in(mux_stage4[31]),  .coef_in(coef[48]), .rdup_out(a5_wr[27]), .rdlo_out(a5_wr[31]));
			radix2 #(.width(width)) rd_st4_16   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[32]), .rdlo_in(mux_stage4[36]),  .coef_in(coef[0]), .rdup_out(a5_wr[32]), .rdlo_out(a5_wr[36]));
			radix2 #(.width(width)) rd_st4_17   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[33]), .rdlo_in(mux_stage4[37]),  .coef_in(coef[16]), .rdup_out(a5_wr[33]), .rdlo_out(a5_wr[37]));
			radix2 #(.width(width)) rd_st4_18   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[34]), .rdlo_in(mux_stage4[38]),  .coef_in(coef[32]), .rdup_out(a5_wr[34]), .rdlo_out(a5_wr[38]));
			radix2 #(.width(width)) rd_st4_19   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[35]), .rdlo_in(mux_stage4[39]),  .coef_in(coef[48]), .rdup_out(a5_wr[35]), .rdlo_out(a5_wr[39]));
			radix2 #(.width(width)) rd_st4_20   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[40]), .rdlo_in(mux_stage4[44]),  .coef_in(coef[0]), .rdup_out(a5_wr[40]), .rdlo_out(a5_wr[44]));
			radix2 #(.width(width)) rd_st4_21   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[41]), .rdlo_in(mux_stage4[45]),  .coef_in(coef[16]), .rdup_out(a5_wr[41]), .rdlo_out(a5_wr[45]));
			radix2 #(.width(width)) rd_st4_22   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[42]), .rdlo_in(mux_stage4[46]),  .coef_in(coef[32]), .rdup_out(a5_wr[42]), .rdlo_out(a5_wr[46]));
			radix2 #(.width(width)) rd_st4_23   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[43]), .rdlo_in(mux_stage4[47]),  .coef_in(coef[48]), .rdup_out(a5_wr[43]), .rdlo_out(a5_wr[47]));
			radix2 #(.width(width)) rd_st4_24   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[48]), .rdlo_in(mux_stage4[52]),  .coef_in(coef[0]), .rdup_out(a5_wr[48]), .rdlo_out(a5_wr[52]));
			radix2 #(.width(width)) rd_st4_25   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[49]), .rdlo_in(mux_stage4[53]),  .coef_in(coef[16]), .rdup_out(a5_wr[49]), .rdlo_out(a5_wr[53]));
			radix2 #(.width(width)) rd_st4_26   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[50]), .rdlo_in(mux_stage4[54]),  .coef_in(coef[32]), .rdup_out(a5_wr[50]), .rdlo_out(a5_wr[54]));
			radix2 #(.width(width)) rd_st4_27   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[51]), .rdlo_in(mux_stage4[55]),  .coef_in(coef[48]), .rdup_out(a5_wr[51]), .rdlo_out(a5_wr[55]));
			radix2 #(.width(width)) rd_st4_28   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[56]), .rdlo_in(mux_stage4[60]),  .coef_in(coef[0]), .rdup_out(a5_wr[56]), .rdlo_out(a5_wr[60]));
			radix2 #(.width(width)) rd_st4_29   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[57]), .rdlo_in(mux_stage4[61]),  .coef_in(coef[16]), .rdup_out(a5_wr[57]), .rdlo_out(a5_wr[61]));
			radix2 #(.width(width)) rd_st4_30   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[58]), .rdlo_in(mux_stage4[62]),  .coef_in(coef[32]), .rdup_out(a5_wr[58]), .rdlo_out(a5_wr[62]));
			radix2 #(.width(width)) rd_st4_31   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[59]), .rdlo_in(mux_stage4[63]),  .coef_in(coef[48]), .rdup_out(a5_wr[59]), .rdlo_out(a5_wr[63]));
			radix2 #(.width(width)) rd_st4_32   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[64]), .rdlo_in(mux_stage4[68]),  .coef_in(coef[0]), .rdup_out(a5_wr[64]), .rdlo_out(a5_wr[68]));
			radix2 #(.width(width)) rd_st4_33   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[65]), .rdlo_in(mux_stage4[69]),  .coef_in(coef[16]), .rdup_out(a5_wr[65]), .rdlo_out(a5_wr[69]));
			radix2 #(.width(width)) rd_st4_34   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[66]), .rdlo_in(mux_stage4[70]),  .coef_in(coef[32]), .rdup_out(a5_wr[66]), .rdlo_out(a5_wr[70]));
			radix2 #(.width(width)) rd_st4_35   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[67]), .rdlo_in(mux_stage4[71]),  .coef_in(coef[48]), .rdup_out(a5_wr[67]), .rdlo_out(a5_wr[71]));
			radix2 #(.width(width)) rd_st4_36   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[72]), .rdlo_in(mux_stage4[76]),  .coef_in(coef[0]), .rdup_out(a5_wr[72]), .rdlo_out(a5_wr[76]));
			radix2 #(.width(width)) rd_st4_37   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[73]), .rdlo_in(mux_stage4[77]),  .coef_in(coef[16]), .rdup_out(a5_wr[73]), .rdlo_out(a5_wr[77]));
			radix2 #(.width(width)) rd_st4_38   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[74]), .rdlo_in(mux_stage4[78]),  .coef_in(coef[32]), .rdup_out(a5_wr[74]), .rdlo_out(a5_wr[78]));
			radix2 #(.width(width)) rd_st4_39   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[75]), .rdlo_in(mux_stage4[79]),  .coef_in(coef[48]), .rdup_out(a5_wr[75]), .rdlo_out(a5_wr[79]));
			radix2 #(.width(width)) rd_st4_40   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[80]), .rdlo_in(mux_stage4[84]),  .coef_in(coef[0]), .rdup_out(a5_wr[80]), .rdlo_out(a5_wr[84]));
			radix2 #(.width(width)) rd_st4_41   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[81]), .rdlo_in(mux_stage4[85]),  .coef_in(coef[16]), .rdup_out(a5_wr[81]), .rdlo_out(a5_wr[85]));
			radix2 #(.width(width)) rd_st4_42   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[82]), .rdlo_in(mux_stage4[86]),  .coef_in(coef[32]), .rdup_out(a5_wr[82]), .rdlo_out(a5_wr[86]));
			radix2 #(.width(width)) rd_st4_43   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[83]), .rdlo_in(mux_stage4[87]),  .coef_in(coef[48]), .rdup_out(a5_wr[83]), .rdlo_out(a5_wr[87]));
			radix2 #(.width(width)) rd_st4_44   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[88]), .rdlo_in(mux_stage4[92]),  .coef_in(coef[0]), .rdup_out(a5_wr[88]), .rdlo_out(a5_wr[92]));
			radix2 #(.width(width)) rd_st4_45   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[89]), .rdlo_in(mux_stage4[93]),  .coef_in(coef[16]), .rdup_out(a5_wr[89]), .rdlo_out(a5_wr[93]));
			radix2 #(.width(width)) rd_st4_46   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[90]), .rdlo_in(mux_stage4[94]),  .coef_in(coef[32]), .rdup_out(a5_wr[90]), .rdlo_out(a5_wr[94]));
			radix2 #(.width(width)) rd_st4_47   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[91]), .rdlo_in(mux_stage4[95]),  .coef_in(coef[48]), .rdup_out(a5_wr[91]), .rdlo_out(a5_wr[95]));
			radix2 #(.width(width)) rd_st4_48   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[96]), .rdlo_in(mux_stage4[100]),  .coef_in(coef[0]), .rdup_out(a5_wr[96]), .rdlo_out(a5_wr[100]));
			radix2 #(.width(width)) rd_st4_49   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[97]), .rdlo_in(mux_stage4[101]),  .coef_in(coef[16]), .rdup_out(a5_wr[97]), .rdlo_out(a5_wr[101]));
			radix2 #(.width(width)) rd_st4_50   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[98]), .rdlo_in(mux_stage4[102]),  .coef_in(coef[32]), .rdup_out(a5_wr[98]), .rdlo_out(a5_wr[102]));
			radix2 #(.width(width)) rd_st4_51   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[99]), .rdlo_in(mux_stage4[103]),  .coef_in(coef[48]), .rdup_out(a5_wr[99]), .rdlo_out(a5_wr[103]));
			radix2 #(.width(width)) rd_st4_52   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[104]), .rdlo_in(mux_stage4[108]),  .coef_in(coef[0]), .rdup_out(a5_wr[104]), .rdlo_out(a5_wr[108]));
			radix2 #(.width(width)) rd_st4_53   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[105]), .rdlo_in(mux_stage4[109]),  .coef_in(coef[16]), .rdup_out(a5_wr[105]), .rdlo_out(a5_wr[109]));
			radix2 #(.width(width)) rd_st4_54   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[106]), .rdlo_in(mux_stage4[110]),  .coef_in(coef[32]), .rdup_out(a5_wr[106]), .rdlo_out(a5_wr[110]));
			radix2 #(.width(width)) rd_st4_55   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[107]), .rdlo_in(mux_stage4[111]),  .coef_in(coef[48]), .rdup_out(a5_wr[107]), .rdlo_out(a5_wr[111]));
			radix2 #(.width(width)) rd_st4_56   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[112]), .rdlo_in(mux_stage4[116]),  .coef_in(coef[0]), .rdup_out(a5_wr[112]), .rdlo_out(a5_wr[116]));
			radix2 #(.width(width)) rd_st4_57   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[113]), .rdlo_in(mux_stage4[117]),  .coef_in(coef[16]), .rdup_out(a5_wr[113]), .rdlo_out(a5_wr[117]));
			radix2 #(.width(width)) rd_st4_58   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[114]), .rdlo_in(mux_stage4[118]),  .coef_in(coef[32]), .rdup_out(a5_wr[114]), .rdlo_out(a5_wr[118]));
			radix2 #(.width(width)) rd_st4_59   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[115]), .rdlo_in(mux_stage4[119]),  .coef_in(coef[48]), .rdup_out(a5_wr[115]), .rdlo_out(a5_wr[119]));
			radix2 #(.width(width)) rd_st4_60   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[120]), .rdlo_in(mux_stage4[124]),  .coef_in(coef[0]), .rdup_out(a5_wr[120]), .rdlo_out(a5_wr[124]));
			radix2 #(.width(width)) rd_st4_61   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[121]), .rdlo_in(mux_stage4[125]),  .coef_in(coef[16]), .rdup_out(a5_wr[121]), .rdlo_out(a5_wr[125]));
			radix2 #(.width(width)) rd_st4_62   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[122]), .rdlo_in(mux_stage4[126]),  .coef_in(coef[32]), .rdup_out(a5_wr[122]), .rdlo_out(a5_wr[126]));
			radix2 #(.width(width)) rd_st4_63   (.clk(clk), .rst(rst), .stall(sel_fft[2]), .rdup_in(mux_stage4[123]), .rdlo_in(mux_stage4[127]),  .coef_in(coef[48]), .rdup_out(a5_wr[123]), .rdlo_out(a5_wr[127]));

			//--- mux stage 4
			mux_fft #(.width(width)) mux_st4_0 (.sel0(sel_fft[2]), .in0(a0_wr[0]), .in1(a5_wr[0]), .out0(mux_stage5[0]));
			mux_fft #(.width(width)) mux_st4_1 (.sel0(sel_fft[2]), .in0(a0_wr[1]), .in1(a5_wr[1]), .out0(mux_stage5[1]));
			mux_fft #(.width(width)) mux_st4_2 (.sel0(sel_fft[2]), .in0(a0_wr[2]), .in1(a5_wr[2]), .out0(mux_stage5[2]));
			mux_fft #(.width(width)) mux_st4_3 (.sel0(sel_fft[2]), .in0(a0_wr[3]), .in1(a5_wr[3]), .out0(mux_stage5[3]));
			mux_fft #(.width(width)) mux_st4_4 (.sel0(sel_fft[2]), .in0(a0_wr[4]), .in1(a5_wr[4]), .out0(mux_stage5[4]));
			mux_fft #(.width(width)) mux_st4_5 (.sel0(sel_fft[2]), .in0(a0_wr[5]), .in1(a5_wr[5]), .out0(mux_stage5[5]));
			mux_fft #(.width(width)) mux_st4_6 (.sel0(sel_fft[2]), .in0(a0_wr[6]), .in1(a5_wr[6]), .out0(mux_stage5[6]));
			mux_fft #(.width(width)) mux_st4_7 (.sel0(sel_fft[2]), .in0(a0_wr[7]), .in1(a5_wr[7]), .out0(mux_stage5[7]));
			mux_fft #(.width(width)) mux_st4_8 (.sel0(sel_fft[2]), .in0(a0_wr[8]), .in1(a5_wr[8]), .out0(mux_stage5[8]));
			mux_fft #(.width(width)) mux_st4_9 (.sel0(sel_fft[2]), .in0(a0_wr[9]), .in1(a5_wr[9]), .out0(mux_stage5[9]));
			mux_fft #(.width(width)) mux_st4_10 (.sel0(sel_fft[2]), .in0(a0_wr[10]), .in1(a5_wr[10]), .out0(mux_stage5[10]));
			mux_fft #(.width(width)) mux_st4_11 (.sel0(sel_fft[2]), .in0(a0_wr[11]), .in1(a5_wr[11]), .out0(mux_stage5[11]));
			mux_fft #(.width(width)) mux_st4_12 (.sel0(sel_fft[2]), .in0(a0_wr[12]), .in1(a5_wr[12]), .out0(mux_stage5[12]));
			mux_fft #(.width(width)) mux_st4_13 (.sel0(sel_fft[2]), .in0(a0_wr[13]), .in1(a5_wr[13]), .out0(mux_stage5[13]));
			mux_fft #(.width(width)) mux_st4_14 (.sel0(sel_fft[2]), .in0(a0_wr[14]), .in1(a5_wr[14]), .out0(mux_stage5[14]));
			mux_fft #(.width(width)) mux_st4_15 (.sel0(sel_fft[2]), .in0(a0_wr[15]), .in1(a5_wr[15]), .out0(mux_stage5[15]));
			mux_fft #(.width(width)) mux_st4_16 (.sel0(sel_fft[2]), .in0(a0_wr[16]), .in1(a5_wr[16]), .out0(mux_stage5[16]));
			mux_fft #(.width(width)) mux_st4_17 (.sel0(sel_fft[2]), .in0(a0_wr[17]), .in1(a5_wr[17]), .out0(mux_stage5[17]));
			mux_fft #(.width(width)) mux_st4_18 (.sel0(sel_fft[2]), .in0(a0_wr[18]), .in1(a5_wr[18]), .out0(mux_stage5[18]));
			mux_fft #(.width(width)) mux_st4_19 (.sel0(sel_fft[2]), .in0(a0_wr[19]), .in1(a5_wr[19]), .out0(mux_stage5[19]));
			mux_fft #(.width(width)) mux_st4_20 (.sel0(sel_fft[2]), .in0(a0_wr[20]), .in1(a5_wr[20]), .out0(mux_stage5[20]));
			mux_fft #(.width(width)) mux_st4_21 (.sel0(sel_fft[2]), .in0(a0_wr[21]), .in1(a5_wr[21]), .out0(mux_stage5[21]));
			mux_fft #(.width(width)) mux_st4_22 (.sel0(sel_fft[2]), .in0(a0_wr[22]), .in1(a5_wr[22]), .out0(mux_stage5[22]));
			mux_fft #(.width(width)) mux_st4_23 (.sel0(sel_fft[2]), .in0(a0_wr[23]), .in1(a5_wr[23]), .out0(mux_stage5[23]));
			mux_fft #(.width(width)) mux_st4_24 (.sel0(sel_fft[2]), .in0(a0_wr[24]), .in1(a5_wr[24]), .out0(mux_stage5[24]));
			mux_fft #(.width(width)) mux_st4_25 (.sel0(sel_fft[2]), .in0(a0_wr[25]), .in1(a5_wr[25]), .out0(mux_stage5[25]));
			mux_fft #(.width(width)) mux_st4_26 (.sel0(sel_fft[2]), .in0(a0_wr[26]), .in1(a5_wr[26]), .out0(mux_stage5[26]));
			mux_fft #(.width(width)) mux_st4_27 (.sel0(sel_fft[2]), .in0(a0_wr[27]), .in1(a5_wr[27]), .out0(mux_stage5[27]));
			mux_fft #(.width(width)) mux_st4_28 (.sel0(sel_fft[2]), .in0(a0_wr[28]), .in1(a5_wr[28]), .out0(mux_stage5[28]));
			mux_fft #(.width(width)) mux_st4_29 (.sel0(sel_fft[2]), .in0(a0_wr[29]), .in1(a5_wr[29]), .out0(mux_stage5[29]));
			mux_fft #(.width(width)) mux_st4_30 (.sel0(sel_fft[2]), .in0(a0_wr[30]), .in1(a5_wr[30]), .out0(mux_stage5[30]));
			mux_fft #(.width(width)) mux_st4_31 (.sel0(sel_fft[2]), .in0(a0_wr[31]), .in1(a5_wr[31]), .out0(mux_stage5[31]));
			mux_fft #(.width(width)) mux_st4_32 (.sel0(sel_fft[2]), .in0(a0_wr[32]), .in1(a5_wr[32]), .out0(mux_stage5[32]));
			mux_fft #(.width(width)) mux_st4_33 (.sel0(sel_fft[2]), .in0(a0_wr[33]), .in1(a5_wr[33]), .out0(mux_stage5[33]));
			mux_fft #(.width(width)) mux_st4_34 (.sel0(sel_fft[2]), .in0(a0_wr[34]), .in1(a5_wr[34]), .out0(mux_stage5[34]));
			mux_fft #(.width(width)) mux_st4_35 (.sel0(sel_fft[2]), .in0(a0_wr[35]), .in1(a5_wr[35]), .out0(mux_stage5[35]));
			mux_fft #(.width(width)) mux_st4_36 (.sel0(sel_fft[2]), .in0(a0_wr[36]), .in1(a5_wr[36]), .out0(mux_stage5[36]));
			mux_fft #(.width(width)) mux_st4_37 (.sel0(sel_fft[2]), .in0(a0_wr[37]), .in1(a5_wr[37]), .out0(mux_stage5[37]));
			mux_fft #(.width(width)) mux_st4_38 (.sel0(sel_fft[2]), .in0(a0_wr[38]), .in1(a5_wr[38]), .out0(mux_stage5[38]));
			mux_fft #(.width(width)) mux_st4_39 (.sel0(sel_fft[2]), .in0(a0_wr[39]), .in1(a5_wr[39]), .out0(mux_stage5[39]));
			mux_fft #(.width(width)) mux_st4_40 (.sel0(sel_fft[2]), .in0(a0_wr[40]), .in1(a5_wr[40]), .out0(mux_stage5[40]));
			mux_fft #(.width(width)) mux_st4_41 (.sel0(sel_fft[2]), .in0(a0_wr[41]), .in1(a5_wr[41]), .out0(mux_stage5[41]));
			mux_fft #(.width(width)) mux_st4_42 (.sel0(sel_fft[2]), .in0(a0_wr[42]), .in1(a5_wr[42]), .out0(mux_stage5[42]));
			mux_fft #(.width(width)) mux_st4_43 (.sel0(sel_fft[2]), .in0(a0_wr[43]), .in1(a5_wr[43]), .out0(mux_stage5[43]));
			mux_fft #(.width(width)) mux_st4_44 (.sel0(sel_fft[2]), .in0(a0_wr[44]), .in1(a5_wr[44]), .out0(mux_stage5[44]));
			mux_fft #(.width(width)) mux_st4_45 (.sel0(sel_fft[2]), .in0(a0_wr[45]), .in1(a5_wr[45]), .out0(mux_stage5[45]));
			mux_fft #(.width(width)) mux_st4_46 (.sel0(sel_fft[2]), .in0(a0_wr[46]), .in1(a5_wr[46]), .out0(mux_stage5[46]));
			mux_fft #(.width(width)) mux_st4_47 (.sel0(sel_fft[2]), .in0(a0_wr[47]), .in1(a5_wr[47]), .out0(mux_stage5[47]));
			mux_fft #(.width(width)) mux_st4_48 (.sel0(sel_fft[2]), .in0(a0_wr[48]), .in1(a5_wr[48]), .out0(mux_stage5[48]));
			mux_fft #(.width(width)) mux_st4_49 (.sel0(sel_fft[2]), .in0(a0_wr[49]), .in1(a5_wr[49]), .out0(mux_stage5[49]));
			mux_fft #(.width(width)) mux_st4_50 (.sel0(sel_fft[2]), .in0(a0_wr[50]), .in1(a5_wr[50]), .out0(mux_stage5[50]));
			mux_fft #(.width(width)) mux_st4_51 (.sel0(sel_fft[2]), .in0(a0_wr[51]), .in1(a5_wr[51]), .out0(mux_stage5[51]));
			mux_fft #(.width(width)) mux_st4_52 (.sel0(sel_fft[2]), .in0(a0_wr[52]), .in1(a5_wr[52]), .out0(mux_stage5[52]));
			mux_fft #(.width(width)) mux_st4_53 (.sel0(sel_fft[2]), .in0(a0_wr[53]), .in1(a5_wr[53]), .out0(mux_stage5[53]));
			mux_fft #(.width(width)) mux_st4_54 (.sel0(sel_fft[2]), .in0(a0_wr[54]), .in1(a5_wr[54]), .out0(mux_stage5[54]));
			mux_fft #(.width(width)) mux_st4_55 (.sel0(sel_fft[2]), .in0(a0_wr[55]), .in1(a5_wr[55]), .out0(mux_stage5[55]));
			mux_fft #(.width(width)) mux_st4_56 (.sel0(sel_fft[2]), .in0(a0_wr[56]), .in1(a5_wr[56]), .out0(mux_stage5[56]));
			mux_fft #(.width(width)) mux_st4_57 (.sel0(sel_fft[2]), .in0(a0_wr[57]), .in1(a5_wr[57]), .out0(mux_stage5[57]));
			mux_fft #(.width(width)) mux_st4_58 (.sel0(sel_fft[2]), .in0(a0_wr[58]), .in1(a5_wr[58]), .out0(mux_stage5[58]));
			mux_fft #(.width(width)) mux_st4_59 (.sel0(sel_fft[2]), .in0(a0_wr[59]), .in1(a5_wr[59]), .out0(mux_stage5[59]));
			mux_fft #(.width(width)) mux_st4_60 (.sel0(sel_fft[2]), .in0(a0_wr[60]), .in1(a5_wr[60]), .out0(mux_stage5[60]));
			mux_fft #(.width(width)) mux_st4_61 (.sel0(sel_fft[2]), .in0(a0_wr[61]), .in1(a5_wr[61]), .out0(mux_stage5[61]));
			mux_fft #(.width(width)) mux_st4_62 (.sel0(sel_fft[2]), .in0(a0_wr[62]), .in1(a5_wr[62]), .out0(mux_stage5[62]));
			mux_fft #(.width(width)) mux_st4_63 (.sel0(sel_fft[2]), .in0(a0_wr[63]), .in1(a5_wr[63]), .out0(mux_stage5[63]));
			mux_fft #(.width(width)) mux_st4_64 (.sel0(sel_fft[2]), .in0(a0_wr[64]), .in1(a5_wr[64]), .out0(mux_stage5[64]));
			mux_fft #(.width(width)) mux_st4_65 (.sel0(sel_fft[2]), .in0(a0_wr[65]), .in1(a5_wr[65]), .out0(mux_stage5[65]));
			mux_fft #(.width(width)) mux_st4_66 (.sel0(sel_fft[2]), .in0(a0_wr[66]), .in1(a5_wr[66]), .out0(mux_stage5[66]));
			mux_fft #(.width(width)) mux_st4_67 (.sel0(sel_fft[2]), .in0(a0_wr[67]), .in1(a5_wr[67]), .out0(mux_stage5[67]));
			mux_fft #(.width(width)) mux_st4_68 (.sel0(sel_fft[2]), .in0(a0_wr[68]), .in1(a5_wr[68]), .out0(mux_stage5[68]));
			mux_fft #(.width(width)) mux_st4_69 (.sel0(sel_fft[2]), .in0(a0_wr[69]), .in1(a5_wr[69]), .out0(mux_stage5[69]));
			mux_fft #(.width(width)) mux_st4_70 (.sel0(sel_fft[2]), .in0(a0_wr[70]), .in1(a5_wr[70]), .out0(mux_stage5[70]));
			mux_fft #(.width(width)) mux_st4_71 (.sel0(sel_fft[2]), .in0(a0_wr[71]), .in1(a5_wr[71]), .out0(mux_stage5[71]));
			mux_fft #(.width(width)) mux_st4_72 (.sel0(sel_fft[2]), .in0(a0_wr[72]), .in1(a5_wr[72]), .out0(mux_stage5[72]));
			mux_fft #(.width(width)) mux_st4_73 (.sel0(sel_fft[2]), .in0(a0_wr[73]), .in1(a5_wr[73]), .out0(mux_stage5[73]));
			mux_fft #(.width(width)) mux_st4_74 (.sel0(sel_fft[2]), .in0(a0_wr[74]), .in1(a5_wr[74]), .out0(mux_stage5[74]));
			mux_fft #(.width(width)) mux_st4_75 (.sel0(sel_fft[2]), .in0(a0_wr[75]), .in1(a5_wr[75]), .out0(mux_stage5[75]));
			mux_fft #(.width(width)) mux_st4_76 (.sel0(sel_fft[2]), .in0(a0_wr[76]), .in1(a5_wr[76]), .out0(mux_stage5[76]));
			mux_fft #(.width(width)) mux_st4_77 (.sel0(sel_fft[2]), .in0(a0_wr[77]), .in1(a5_wr[77]), .out0(mux_stage5[77]));
			mux_fft #(.width(width)) mux_st4_78 (.sel0(sel_fft[2]), .in0(a0_wr[78]), .in1(a5_wr[78]), .out0(mux_stage5[78]));
			mux_fft #(.width(width)) mux_st4_79 (.sel0(sel_fft[2]), .in0(a0_wr[79]), .in1(a5_wr[79]), .out0(mux_stage5[79]));
			mux_fft #(.width(width)) mux_st4_80 (.sel0(sel_fft[2]), .in0(a0_wr[80]), .in1(a5_wr[80]), .out0(mux_stage5[80]));
			mux_fft #(.width(width)) mux_st4_81 (.sel0(sel_fft[2]), .in0(a0_wr[81]), .in1(a5_wr[81]), .out0(mux_stage5[81]));
			mux_fft #(.width(width)) mux_st4_82 (.sel0(sel_fft[2]), .in0(a0_wr[82]), .in1(a5_wr[82]), .out0(mux_stage5[82]));
			mux_fft #(.width(width)) mux_st4_83 (.sel0(sel_fft[2]), .in0(a0_wr[83]), .in1(a5_wr[83]), .out0(mux_stage5[83]));
			mux_fft #(.width(width)) mux_st4_84 (.sel0(sel_fft[2]), .in0(a0_wr[84]), .in1(a5_wr[84]), .out0(mux_stage5[84]));
			mux_fft #(.width(width)) mux_st4_85 (.sel0(sel_fft[2]), .in0(a0_wr[85]), .in1(a5_wr[85]), .out0(mux_stage5[85]));
			mux_fft #(.width(width)) mux_st4_86 (.sel0(sel_fft[2]), .in0(a0_wr[86]), .in1(a5_wr[86]), .out0(mux_stage5[86]));
			mux_fft #(.width(width)) mux_st4_87 (.sel0(sel_fft[2]), .in0(a0_wr[87]), .in1(a5_wr[87]), .out0(mux_stage5[87]));
			mux_fft #(.width(width)) mux_st4_88 (.sel0(sel_fft[2]), .in0(a0_wr[88]), .in1(a5_wr[88]), .out0(mux_stage5[88]));
			mux_fft #(.width(width)) mux_st4_89 (.sel0(sel_fft[2]), .in0(a0_wr[89]), .in1(a5_wr[89]), .out0(mux_stage5[89]));
			mux_fft #(.width(width)) mux_st4_90 (.sel0(sel_fft[2]), .in0(a0_wr[90]), .in1(a5_wr[90]), .out0(mux_stage5[90]));
			mux_fft #(.width(width)) mux_st4_91 (.sel0(sel_fft[2]), .in0(a0_wr[91]), .in1(a5_wr[91]), .out0(mux_stage5[91]));
			mux_fft #(.width(width)) mux_st4_92 (.sel0(sel_fft[2]), .in0(a0_wr[92]), .in1(a5_wr[92]), .out0(mux_stage5[92]));
			mux_fft #(.width(width)) mux_st4_93 (.sel0(sel_fft[2]), .in0(a0_wr[93]), .in1(a5_wr[93]), .out0(mux_stage5[93]));
			mux_fft #(.width(width)) mux_st4_94 (.sel0(sel_fft[2]), .in0(a0_wr[94]), .in1(a5_wr[94]), .out0(mux_stage5[94]));
			mux_fft #(.width(width)) mux_st4_95 (.sel0(sel_fft[2]), .in0(a0_wr[95]), .in1(a5_wr[95]), .out0(mux_stage5[95]));
			mux_fft #(.width(width)) mux_st4_96 (.sel0(sel_fft[2]), .in0(a0_wr[96]), .in1(a5_wr[96]), .out0(mux_stage5[96]));
			mux_fft #(.width(width)) mux_st4_97 (.sel0(sel_fft[2]), .in0(a0_wr[97]), .in1(a5_wr[97]), .out0(mux_stage5[97]));
			mux_fft #(.width(width)) mux_st4_98 (.sel0(sel_fft[2]), .in0(a0_wr[98]), .in1(a5_wr[98]), .out0(mux_stage5[98]));
			mux_fft #(.width(width)) mux_st4_99 (.sel0(sel_fft[2]), .in0(a0_wr[99]), .in1(a5_wr[99]), .out0(mux_stage5[99]));
			mux_fft #(.width(width)) mux_st4_100 (.sel0(sel_fft[2]), .in0(a0_wr[100]), .in1(a5_wr[100]), .out0(mux_stage5[100]));
			mux_fft #(.width(width)) mux_st4_101 (.sel0(sel_fft[2]), .in0(a0_wr[101]), .in1(a5_wr[101]), .out0(mux_stage5[101]));
			mux_fft #(.width(width)) mux_st4_102 (.sel0(sel_fft[2]), .in0(a0_wr[102]), .in1(a5_wr[102]), .out0(mux_stage5[102]));
			mux_fft #(.width(width)) mux_st4_103 (.sel0(sel_fft[2]), .in0(a0_wr[103]), .in1(a5_wr[103]), .out0(mux_stage5[103]));
			mux_fft #(.width(width)) mux_st4_104 (.sel0(sel_fft[2]), .in0(a0_wr[104]), .in1(a5_wr[104]), .out0(mux_stage5[104]));
			mux_fft #(.width(width)) mux_st4_105 (.sel0(sel_fft[2]), .in0(a0_wr[105]), .in1(a5_wr[105]), .out0(mux_stage5[105]));
			mux_fft #(.width(width)) mux_st4_106 (.sel0(sel_fft[2]), .in0(a0_wr[106]), .in1(a5_wr[106]), .out0(mux_stage5[106]));
			mux_fft #(.width(width)) mux_st4_107 (.sel0(sel_fft[2]), .in0(a0_wr[107]), .in1(a5_wr[107]), .out0(mux_stage5[107]));
			mux_fft #(.width(width)) mux_st4_108 (.sel0(sel_fft[2]), .in0(a0_wr[108]), .in1(a5_wr[108]), .out0(mux_stage5[108]));
			mux_fft #(.width(width)) mux_st4_109 (.sel0(sel_fft[2]), .in0(a0_wr[109]), .in1(a5_wr[109]), .out0(mux_stage5[109]));
			mux_fft #(.width(width)) mux_st4_110 (.sel0(sel_fft[2]), .in0(a0_wr[110]), .in1(a5_wr[110]), .out0(mux_stage5[110]));
			mux_fft #(.width(width)) mux_st4_111 (.sel0(sel_fft[2]), .in0(a0_wr[111]), .in1(a5_wr[111]), .out0(mux_stage5[111]));
			mux_fft #(.width(width)) mux_st4_112 (.sel0(sel_fft[2]), .in0(a0_wr[112]), .in1(a5_wr[112]), .out0(mux_stage5[112]));
			mux_fft #(.width(width)) mux_st4_113 (.sel0(sel_fft[2]), .in0(a0_wr[113]), .in1(a5_wr[113]), .out0(mux_stage5[113]));
			mux_fft #(.width(width)) mux_st4_114 (.sel0(sel_fft[2]), .in0(a0_wr[114]), .in1(a5_wr[114]), .out0(mux_stage5[114]));
			mux_fft #(.width(width)) mux_st4_115 (.sel0(sel_fft[2]), .in0(a0_wr[115]), .in1(a5_wr[115]), .out0(mux_stage5[115]));
			mux_fft #(.width(width)) mux_st4_116 (.sel0(sel_fft[2]), .in0(a0_wr[116]), .in1(a5_wr[116]), .out0(mux_stage5[116]));
			mux_fft #(.width(width)) mux_st4_117 (.sel0(sel_fft[2]), .in0(a0_wr[117]), .in1(a5_wr[117]), .out0(mux_stage5[117]));
			mux_fft #(.width(width)) mux_st4_118 (.sel0(sel_fft[2]), .in0(a0_wr[118]), .in1(a5_wr[118]), .out0(mux_stage5[118]));
			mux_fft #(.width(width)) mux_st4_119 (.sel0(sel_fft[2]), .in0(a0_wr[119]), .in1(a5_wr[119]), .out0(mux_stage5[119]));
			mux_fft #(.width(width)) mux_st4_120 (.sel0(sel_fft[2]), .in0(a0_wr[120]), .in1(a5_wr[120]), .out0(mux_stage5[120]));
			mux_fft #(.width(width)) mux_st4_121 (.sel0(sel_fft[2]), .in0(a0_wr[121]), .in1(a5_wr[121]), .out0(mux_stage5[121]));
			mux_fft #(.width(width)) mux_st4_122 (.sel0(sel_fft[2]), .in0(a0_wr[122]), .in1(a5_wr[122]), .out0(mux_stage5[122]));
			mux_fft #(.width(width)) mux_st4_123 (.sel0(sel_fft[2]), .in0(a0_wr[123]), .in1(a5_wr[123]), .out0(mux_stage5[123]));
			mux_fft #(.width(width)) mux_st4_124 (.sel0(sel_fft[2]), .in0(a0_wr[124]), .in1(a5_wr[124]), .out0(mux_stage5[124]));
			mux_fft #(.width(width)) mux_st4_125 (.sel0(sel_fft[2]), .in0(a0_wr[125]), .in1(a5_wr[125]), .out0(mux_stage5[125]));
			mux_fft #(.width(width)) mux_st4_126 (.sel0(sel_fft[2]), .in0(a0_wr[126]), .in1(a5_wr[126]), .out0(mux_stage5[126]));
			mux_fft #(.width(width)) mux_st4_127 (.sel0(sel_fft[2]), .in0(a0_wr[127]), .in1(a5_wr[127]), .out0(mux_stage5[127]));

			//--- radix stage 5
			radix2 #(.width(width)) rd_st5_0   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[0]), .rdlo_in(mux_stage5[2]),  .coef_in(coef[0]), .rdup_out(a6_wr[0]), .rdlo_out(a6_wr[2]));
			radix2 #(.width(width)) rd_st5_1   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[1]), .rdlo_in(mux_stage5[3]),  .coef_in(coef[32]), .rdup_out(a6_wr[1]), .rdlo_out(a6_wr[3]));
			radix2 #(.width(width)) rd_st5_2   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[4]), .rdlo_in(mux_stage5[6]),  .coef_in(coef[0]), .rdup_out(a6_wr[4]), .rdlo_out(a6_wr[6]));
			radix2 #(.width(width)) rd_st5_3   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[5]), .rdlo_in(mux_stage5[7]),  .coef_in(coef[32]), .rdup_out(a6_wr[5]), .rdlo_out(a6_wr[7]));
			radix2 #(.width(width)) rd_st5_4   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[8]), .rdlo_in(mux_stage5[10]),  .coef_in(coef[0]), .rdup_out(a6_wr[8]), .rdlo_out(a6_wr[10]));
			radix2 #(.width(width)) rd_st5_5   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[9]), .rdlo_in(mux_stage5[11]),  .coef_in(coef[32]), .rdup_out(a6_wr[9]), .rdlo_out(a6_wr[11]));
			radix2 #(.width(width)) rd_st5_6   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[12]), .rdlo_in(mux_stage5[14]),  .coef_in(coef[0]), .rdup_out(a6_wr[12]), .rdlo_out(a6_wr[14]));
			radix2 #(.width(width)) rd_st5_7   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[13]), .rdlo_in(mux_stage5[15]),  .coef_in(coef[32]), .rdup_out(a6_wr[13]), .rdlo_out(a6_wr[15]));
			radix2 #(.width(width)) rd_st5_8   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[16]), .rdlo_in(mux_stage5[18]),  .coef_in(coef[0]), .rdup_out(a6_wr[16]), .rdlo_out(a6_wr[18]));
			radix2 #(.width(width)) rd_st5_9   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[17]), .rdlo_in(mux_stage5[19]),  .coef_in(coef[32]), .rdup_out(a6_wr[17]), .rdlo_out(a6_wr[19]));
			radix2 #(.width(width)) rd_st5_10   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[20]), .rdlo_in(mux_stage5[22]),  .coef_in(coef[0]), .rdup_out(a6_wr[20]), .rdlo_out(a6_wr[22]));
			radix2 #(.width(width)) rd_st5_11   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[21]), .rdlo_in(mux_stage5[23]),  .coef_in(coef[32]), .rdup_out(a6_wr[21]), .rdlo_out(a6_wr[23]));
			radix2 #(.width(width)) rd_st5_12   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[24]), .rdlo_in(mux_stage5[26]),  .coef_in(coef[0]), .rdup_out(a6_wr[24]), .rdlo_out(a6_wr[26]));
			radix2 #(.width(width)) rd_st5_13   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[25]), .rdlo_in(mux_stage5[27]),  .coef_in(coef[32]), .rdup_out(a6_wr[25]), .rdlo_out(a6_wr[27]));
			radix2 #(.width(width)) rd_st5_14   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[28]), .rdlo_in(mux_stage5[30]),  .coef_in(coef[0]), .rdup_out(a6_wr[28]), .rdlo_out(a6_wr[30]));
			radix2 #(.width(width)) rd_st5_15   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[29]), .rdlo_in(mux_stage5[31]),  .coef_in(coef[32]), .rdup_out(a6_wr[29]), .rdlo_out(a6_wr[31]));
			radix2 #(.width(width)) rd_st5_16   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[32]), .rdlo_in(mux_stage5[34]),  .coef_in(coef[0]), .rdup_out(a6_wr[32]), .rdlo_out(a6_wr[34]));
			radix2 #(.width(width)) rd_st5_17   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[33]), .rdlo_in(mux_stage5[35]),  .coef_in(coef[32]), .rdup_out(a6_wr[33]), .rdlo_out(a6_wr[35]));
			radix2 #(.width(width)) rd_st5_18   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[36]), .rdlo_in(mux_stage5[38]),  .coef_in(coef[0]), .rdup_out(a6_wr[36]), .rdlo_out(a6_wr[38]));
			radix2 #(.width(width)) rd_st5_19   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[37]), .rdlo_in(mux_stage5[39]),  .coef_in(coef[32]), .rdup_out(a6_wr[37]), .rdlo_out(a6_wr[39]));
			radix2 #(.width(width)) rd_st5_20   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[40]), .rdlo_in(mux_stage5[42]),  .coef_in(coef[0]), .rdup_out(a6_wr[40]), .rdlo_out(a6_wr[42]));
			radix2 #(.width(width)) rd_st5_21   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[41]), .rdlo_in(mux_stage5[43]),  .coef_in(coef[32]), .rdup_out(a6_wr[41]), .rdlo_out(a6_wr[43]));
			radix2 #(.width(width)) rd_st5_22   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[44]), .rdlo_in(mux_stage5[46]),  .coef_in(coef[0]), .rdup_out(a6_wr[44]), .rdlo_out(a6_wr[46]));
			radix2 #(.width(width)) rd_st5_23   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[45]), .rdlo_in(mux_stage5[47]),  .coef_in(coef[32]), .rdup_out(a6_wr[45]), .rdlo_out(a6_wr[47]));
			radix2 #(.width(width)) rd_st5_24   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[48]), .rdlo_in(mux_stage5[50]),  .coef_in(coef[0]), .rdup_out(a6_wr[48]), .rdlo_out(a6_wr[50]));
			radix2 #(.width(width)) rd_st5_25   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[49]), .rdlo_in(mux_stage5[51]),  .coef_in(coef[32]), .rdup_out(a6_wr[49]), .rdlo_out(a6_wr[51]));
			radix2 #(.width(width)) rd_st5_26   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[52]), .rdlo_in(mux_stage5[54]),  .coef_in(coef[0]), .rdup_out(a6_wr[52]), .rdlo_out(a6_wr[54]));
			radix2 #(.width(width)) rd_st5_27   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[53]), .rdlo_in(mux_stage5[55]),  .coef_in(coef[32]), .rdup_out(a6_wr[53]), .rdlo_out(a6_wr[55]));
			radix2 #(.width(width)) rd_st5_28   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[56]), .rdlo_in(mux_stage5[58]),  .coef_in(coef[0]), .rdup_out(a6_wr[56]), .rdlo_out(a6_wr[58]));
			radix2 #(.width(width)) rd_st5_29   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[57]), .rdlo_in(mux_stage5[59]),  .coef_in(coef[32]), .rdup_out(a6_wr[57]), .rdlo_out(a6_wr[59]));
			radix2 #(.width(width)) rd_st5_30   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[60]), .rdlo_in(mux_stage5[62]),  .coef_in(coef[0]), .rdup_out(a6_wr[60]), .rdlo_out(a6_wr[62]));
			radix2 #(.width(width)) rd_st5_31   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[61]), .rdlo_in(mux_stage5[63]),  .coef_in(coef[32]), .rdup_out(a6_wr[61]), .rdlo_out(a6_wr[63]));
			radix2 #(.width(width)) rd_st5_32   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[64]), .rdlo_in(mux_stage5[66]),  .coef_in(coef[0]), .rdup_out(a6_wr[64]), .rdlo_out(a6_wr[66]));
			radix2 #(.width(width)) rd_st5_33   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[65]), .rdlo_in(mux_stage5[67]),  .coef_in(coef[32]), .rdup_out(a6_wr[65]), .rdlo_out(a6_wr[67]));
			radix2 #(.width(width)) rd_st5_34   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[68]), .rdlo_in(mux_stage5[70]),  .coef_in(coef[0]), .rdup_out(a6_wr[68]), .rdlo_out(a6_wr[70]));
			radix2 #(.width(width)) rd_st5_35   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[69]), .rdlo_in(mux_stage5[71]),  .coef_in(coef[32]), .rdup_out(a6_wr[69]), .rdlo_out(a6_wr[71]));
			radix2 #(.width(width)) rd_st5_36   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[72]), .rdlo_in(mux_stage5[74]),  .coef_in(coef[0]), .rdup_out(a6_wr[72]), .rdlo_out(a6_wr[74]));
			radix2 #(.width(width)) rd_st5_37   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[73]), .rdlo_in(mux_stage5[75]),  .coef_in(coef[32]), .rdup_out(a6_wr[73]), .rdlo_out(a6_wr[75]));
			radix2 #(.width(width)) rd_st5_38   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[76]), .rdlo_in(mux_stage5[78]),  .coef_in(coef[0]), .rdup_out(a6_wr[76]), .rdlo_out(a6_wr[78]));
			radix2 #(.width(width)) rd_st5_39   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[77]), .rdlo_in(mux_stage5[79]),  .coef_in(coef[32]), .rdup_out(a6_wr[77]), .rdlo_out(a6_wr[79]));
			radix2 #(.width(width)) rd_st5_40   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[80]), .rdlo_in(mux_stage5[82]),  .coef_in(coef[0]), .rdup_out(a6_wr[80]), .rdlo_out(a6_wr[82]));
			radix2 #(.width(width)) rd_st5_41   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[81]), .rdlo_in(mux_stage5[83]),  .coef_in(coef[32]), .rdup_out(a6_wr[81]), .rdlo_out(a6_wr[83]));
			radix2 #(.width(width)) rd_st5_42   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[84]), .rdlo_in(mux_stage5[86]),  .coef_in(coef[0]), .rdup_out(a6_wr[84]), .rdlo_out(a6_wr[86]));
			radix2 #(.width(width)) rd_st5_43   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[85]), .rdlo_in(mux_stage5[87]),  .coef_in(coef[32]), .rdup_out(a6_wr[85]), .rdlo_out(a6_wr[87]));
			radix2 #(.width(width)) rd_st5_44   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[88]), .rdlo_in(mux_stage5[90]),  .coef_in(coef[0]), .rdup_out(a6_wr[88]), .rdlo_out(a6_wr[90]));
			radix2 #(.width(width)) rd_st5_45   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[89]), .rdlo_in(mux_stage5[91]),  .coef_in(coef[32]), .rdup_out(a6_wr[89]), .rdlo_out(a6_wr[91]));
			radix2 #(.width(width)) rd_st5_46   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[92]), .rdlo_in(mux_stage5[94]),  .coef_in(coef[0]), .rdup_out(a6_wr[92]), .rdlo_out(a6_wr[94]));
			radix2 #(.width(width)) rd_st5_47   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[93]), .rdlo_in(mux_stage5[95]),  .coef_in(coef[32]), .rdup_out(a6_wr[93]), .rdlo_out(a6_wr[95]));
			radix2 #(.width(width)) rd_st5_48   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[96]), .rdlo_in(mux_stage5[98]),  .coef_in(coef[0]), .rdup_out(a6_wr[96]), .rdlo_out(a6_wr[98]));
			radix2 #(.width(width)) rd_st5_49   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[97]), .rdlo_in(mux_stage5[99]),  .coef_in(coef[32]), .rdup_out(a6_wr[97]), .rdlo_out(a6_wr[99]));
			radix2 #(.width(width)) rd_st5_50   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[100]), .rdlo_in(mux_stage5[102]),  .coef_in(coef[0]), .rdup_out(a6_wr[100]), .rdlo_out(a6_wr[102]));
			radix2 #(.width(width)) rd_st5_51   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[101]), .rdlo_in(mux_stage5[103]),  .coef_in(coef[32]), .rdup_out(a6_wr[101]), .rdlo_out(a6_wr[103]));
			radix2 #(.width(width)) rd_st5_52   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[104]), .rdlo_in(mux_stage5[106]),  .coef_in(coef[0]), .rdup_out(a6_wr[104]), .rdlo_out(a6_wr[106]));
			radix2 #(.width(width)) rd_st5_53   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[105]), .rdlo_in(mux_stage5[107]),  .coef_in(coef[32]), .rdup_out(a6_wr[105]), .rdlo_out(a6_wr[107]));
			radix2 #(.width(width)) rd_st5_54   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[108]), .rdlo_in(mux_stage5[110]),  .coef_in(coef[0]), .rdup_out(a6_wr[108]), .rdlo_out(a6_wr[110]));
			radix2 #(.width(width)) rd_st5_55   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[109]), .rdlo_in(mux_stage5[111]),  .coef_in(coef[32]), .rdup_out(a6_wr[109]), .rdlo_out(a6_wr[111]));
			radix2 #(.width(width)) rd_st5_56   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[112]), .rdlo_in(mux_stage5[114]),  .coef_in(coef[0]), .rdup_out(a6_wr[112]), .rdlo_out(a6_wr[114]));
			radix2 #(.width(width)) rd_st5_57   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[113]), .rdlo_in(mux_stage5[115]),  .coef_in(coef[32]), .rdup_out(a6_wr[113]), .rdlo_out(a6_wr[115]));
			radix2 #(.width(width)) rd_st5_58   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[116]), .rdlo_in(mux_stage5[118]),  .coef_in(coef[0]), .rdup_out(a6_wr[116]), .rdlo_out(a6_wr[118]));
			radix2 #(.width(width)) rd_st5_59   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[117]), .rdlo_in(mux_stage5[119]),  .coef_in(coef[32]), .rdup_out(a6_wr[117]), .rdlo_out(a6_wr[119]));
			radix2 #(.width(width)) rd_st5_60   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[120]), .rdlo_in(mux_stage5[122]),  .coef_in(coef[0]), .rdup_out(a6_wr[120]), .rdlo_out(a6_wr[122]));
			radix2 #(.width(width)) rd_st5_61   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[121]), .rdlo_in(mux_stage5[123]),  .coef_in(coef[32]), .rdup_out(a6_wr[121]), .rdlo_out(a6_wr[123]));
			radix2 #(.width(width)) rd_st5_62   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[124]), .rdlo_in(mux_stage5[126]),  .coef_in(coef[0]), .rdup_out(a6_wr[124]), .rdlo_out(a6_wr[126]));
			radix2 #(.width(width)) rd_st5_63   (.clk(clk), .rst(rst), .stall(sel_fft[1]), .rdup_in(mux_stage5[125]), .rdlo_in(mux_stage5[127]),  .coef_in(coef[32]), .rdup_out(a6_wr[125]), .rdlo_out(a6_wr[127]));

			//--- mux stage 5
			mux_fft #(.width(width)) mux_st5_0 (.sel0(sel_fft[1]), .in0(a0_wr[0]), .in1(a6_wr[0]), .out0(mux_stage6[0]));
			mux_fft #(.width(width)) mux_st5_1 (.sel0(sel_fft[1]), .in0(a0_wr[1]), .in1(a6_wr[1]), .out0(mux_stage6[1]));
			mux_fft #(.width(width)) mux_st5_2 (.sel0(sel_fft[1]), .in0(a0_wr[2]), .in1(a6_wr[2]), .out0(mux_stage6[2]));
			mux_fft #(.width(width)) mux_st5_3 (.sel0(sel_fft[1]), .in0(a0_wr[3]), .in1(a6_wr[3]), .out0(mux_stage6[3]));
			mux_fft #(.width(width)) mux_st5_4 (.sel0(sel_fft[1]), .in0(a0_wr[4]), .in1(a6_wr[4]), .out0(mux_stage6[4]));
			mux_fft #(.width(width)) mux_st5_5 (.sel0(sel_fft[1]), .in0(a0_wr[5]), .in1(a6_wr[5]), .out0(mux_stage6[5]));
			mux_fft #(.width(width)) mux_st5_6 (.sel0(sel_fft[1]), .in0(a0_wr[6]), .in1(a6_wr[6]), .out0(mux_stage6[6]));
			mux_fft #(.width(width)) mux_st5_7 (.sel0(sel_fft[1]), .in0(a0_wr[7]), .in1(a6_wr[7]), .out0(mux_stage6[7]));
			mux_fft #(.width(width)) mux_st5_8 (.sel0(sel_fft[1]), .in0(a0_wr[8]), .in1(a6_wr[8]), .out0(mux_stage6[8]));
			mux_fft #(.width(width)) mux_st5_9 (.sel0(sel_fft[1]), .in0(a0_wr[9]), .in1(a6_wr[9]), .out0(mux_stage6[9]));
			mux_fft #(.width(width)) mux_st5_10 (.sel0(sel_fft[1]), .in0(a0_wr[10]), .in1(a6_wr[10]), .out0(mux_stage6[10]));
			mux_fft #(.width(width)) mux_st5_11 (.sel0(sel_fft[1]), .in0(a0_wr[11]), .in1(a6_wr[11]), .out0(mux_stage6[11]));
			mux_fft #(.width(width)) mux_st5_12 (.sel0(sel_fft[1]), .in0(a0_wr[12]), .in1(a6_wr[12]), .out0(mux_stage6[12]));
			mux_fft #(.width(width)) mux_st5_13 (.sel0(sel_fft[1]), .in0(a0_wr[13]), .in1(a6_wr[13]), .out0(mux_stage6[13]));
			mux_fft #(.width(width)) mux_st5_14 (.sel0(sel_fft[1]), .in0(a0_wr[14]), .in1(a6_wr[14]), .out0(mux_stage6[14]));
			mux_fft #(.width(width)) mux_st5_15 (.sel0(sel_fft[1]), .in0(a0_wr[15]), .in1(a6_wr[15]), .out0(mux_stage6[15]));
			mux_fft #(.width(width)) mux_st5_16 (.sel0(sel_fft[1]), .in0(a0_wr[16]), .in1(a6_wr[16]), .out0(mux_stage6[16]));
			mux_fft #(.width(width)) mux_st5_17 (.sel0(sel_fft[1]), .in0(a0_wr[17]), .in1(a6_wr[17]), .out0(mux_stage6[17]));
			mux_fft #(.width(width)) mux_st5_18 (.sel0(sel_fft[1]), .in0(a0_wr[18]), .in1(a6_wr[18]), .out0(mux_stage6[18]));
			mux_fft #(.width(width)) mux_st5_19 (.sel0(sel_fft[1]), .in0(a0_wr[19]), .in1(a6_wr[19]), .out0(mux_stage6[19]));
			mux_fft #(.width(width)) mux_st5_20 (.sel0(sel_fft[1]), .in0(a0_wr[20]), .in1(a6_wr[20]), .out0(mux_stage6[20]));
			mux_fft #(.width(width)) mux_st5_21 (.sel0(sel_fft[1]), .in0(a0_wr[21]), .in1(a6_wr[21]), .out0(mux_stage6[21]));
			mux_fft #(.width(width)) mux_st5_22 (.sel0(sel_fft[1]), .in0(a0_wr[22]), .in1(a6_wr[22]), .out0(mux_stage6[22]));
			mux_fft #(.width(width)) mux_st5_23 (.sel0(sel_fft[1]), .in0(a0_wr[23]), .in1(a6_wr[23]), .out0(mux_stage6[23]));
			mux_fft #(.width(width)) mux_st5_24 (.sel0(sel_fft[1]), .in0(a0_wr[24]), .in1(a6_wr[24]), .out0(mux_stage6[24]));
			mux_fft #(.width(width)) mux_st5_25 (.sel0(sel_fft[1]), .in0(a0_wr[25]), .in1(a6_wr[25]), .out0(mux_stage6[25]));
			mux_fft #(.width(width)) mux_st5_26 (.sel0(sel_fft[1]), .in0(a0_wr[26]), .in1(a6_wr[26]), .out0(mux_stage6[26]));
			mux_fft #(.width(width)) mux_st5_27 (.sel0(sel_fft[1]), .in0(a0_wr[27]), .in1(a6_wr[27]), .out0(mux_stage6[27]));
			mux_fft #(.width(width)) mux_st5_28 (.sel0(sel_fft[1]), .in0(a0_wr[28]), .in1(a6_wr[28]), .out0(mux_stage6[28]));
			mux_fft #(.width(width)) mux_st5_29 (.sel0(sel_fft[1]), .in0(a0_wr[29]), .in1(a6_wr[29]), .out0(mux_stage6[29]));
			mux_fft #(.width(width)) mux_st5_30 (.sel0(sel_fft[1]), .in0(a0_wr[30]), .in1(a6_wr[30]), .out0(mux_stage6[30]));
			mux_fft #(.width(width)) mux_st5_31 (.sel0(sel_fft[1]), .in0(a0_wr[31]), .in1(a6_wr[31]), .out0(mux_stage6[31]));
			mux_fft #(.width(width)) mux_st5_32 (.sel0(sel_fft[1]), .in0(a0_wr[32]), .in1(a6_wr[32]), .out0(mux_stage6[32]));
			mux_fft #(.width(width)) mux_st5_33 (.sel0(sel_fft[1]), .in0(a0_wr[33]), .in1(a6_wr[33]), .out0(mux_stage6[33]));
			mux_fft #(.width(width)) mux_st5_34 (.sel0(sel_fft[1]), .in0(a0_wr[34]), .in1(a6_wr[34]), .out0(mux_stage6[34]));
			mux_fft #(.width(width)) mux_st5_35 (.sel0(sel_fft[1]), .in0(a0_wr[35]), .in1(a6_wr[35]), .out0(mux_stage6[35]));
			mux_fft #(.width(width)) mux_st5_36 (.sel0(sel_fft[1]), .in0(a0_wr[36]), .in1(a6_wr[36]), .out0(mux_stage6[36]));
			mux_fft #(.width(width)) mux_st5_37 (.sel0(sel_fft[1]), .in0(a0_wr[37]), .in1(a6_wr[37]), .out0(mux_stage6[37]));
			mux_fft #(.width(width)) mux_st5_38 (.sel0(sel_fft[1]), .in0(a0_wr[38]), .in1(a6_wr[38]), .out0(mux_stage6[38]));
			mux_fft #(.width(width)) mux_st5_39 (.sel0(sel_fft[1]), .in0(a0_wr[39]), .in1(a6_wr[39]), .out0(mux_stage6[39]));
			mux_fft #(.width(width)) mux_st5_40 (.sel0(sel_fft[1]), .in0(a0_wr[40]), .in1(a6_wr[40]), .out0(mux_stage6[40]));
			mux_fft #(.width(width)) mux_st5_41 (.sel0(sel_fft[1]), .in0(a0_wr[41]), .in1(a6_wr[41]), .out0(mux_stage6[41]));
			mux_fft #(.width(width)) mux_st5_42 (.sel0(sel_fft[1]), .in0(a0_wr[42]), .in1(a6_wr[42]), .out0(mux_stage6[42]));
			mux_fft #(.width(width)) mux_st5_43 (.sel0(sel_fft[1]), .in0(a0_wr[43]), .in1(a6_wr[43]), .out0(mux_stage6[43]));
			mux_fft #(.width(width)) mux_st5_44 (.sel0(sel_fft[1]), .in0(a0_wr[44]), .in1(a6_wr[44]), .out0(mux_stage6[44]));
			mux_fft #(.width(width)) mux_st5_45 (.sel0(sel_fft[1]), .in0(a0_wr[45]), .in1(a6_wr[45]), .out0(mux_stage6[45]));
			mux_fft #(.width(width)) mux_st5_46 (.sel0(sel_fft[1]), .in0(a0_wr[46]), .in1(a6_wr[46]), .out0(mux_stage6[46]));
			mux_fft #(.width(width)) mux_st5_47 (.sel0(sel_fft[1]), .in0(a0_wr[47]), .in1(a6_wr[47]), .out0(mux_stage6[47]));
			mux_fft #(.width(width)) mux_st5_48 (.sel0(sel_fft[1]), .in0(a0_wr[48]), .in1(a6_wr[48]), .out0(mux_stage6[48]));
			mux_fft #(.width(width)) mux_st5_49 (.sel0(sel_fft[1]), .in0(a0_wr[49]), .in1(a6_wr[49]), .out0(mux_stage6[49]));
			mux_fft #(.width(width)) mux_st5_50 (.sel0(sel_fft[1]), .in0(a0_wr[50]), .in1(a6_wr[50]), .out0(mux_stage6[50]));
			mux_fft #(.width(width)) mux_st5_51 (.sel0(sel_fft[1]), .in0(a0_wr[51]), .in1(a6_wr[51]), .out0(mux_stage6[51]));
			mux_fft #(.width(width)) mux_st5_52 (.sel0(sel_fft[1]), .in0(a0_wr[52]), .in1(a6_wr[52]), .out0(mux_stage6[52]));
			mux_fft #(.width(width)) mux_st5_53 (.sel0(sel_fft[1]), .in0(a0_wr[53]), .in1(a6_wr[53]), .out0(mux_stage6[53]));
			mux_fft #(.width(width)) mux_st5_54 (.sel0(sel_fft[1]), .in0(a0_wr[54]), .in1(a6_wr[54]), .out0(mux_stage6[54]));
			mux_fft #(.width(width)) mux_st5_55 (.sel0(sel_fft[1]), .in0(a0_wr[55]), .in1(a6_wr[55]), .out0(mux_stage6[55]));
			mux_fft #(.width(width)) mux_st5_56 (.sel0(sel_fft[1]), .in0(a0_wr[56]), .in1(a6_wr[56]), .out0(mux_stage6[56]));
			mux_fft #(.width(width)) mux_st5_57 (.sel0(sel_fft[1]), .in0(a0_wr[57]), .in1(a6_wr[57]), .out0(mux_stage6[57]));
			mux_fft #(.width(width)) mux_st5_58 (.sel0(sel_fft[1]), .in0(a0_wr[58]), .in1(a6_wr[58]), .out0(mux_stage6[58]));
			mux_fft #(.width(width)) mux_st5_59 (.sel0(sel_fft[1]), .in0(a0_wr[59]), .in1(a6_wr[59]), .out0(mux_stage6[59]));
			mux_fft #(.width(width)) mux_st5_60 (.sel0(sel_fft[1]), .in0(a0_wr[60]), .in1(a6_wr[60]), .out0(mux_stage6[60]));
			mux_fft #(.width(width)) mux_st5_61 (.sel0(sel_fft[1]), .in0(a0_wr[61]), .in1(a6_wr[61]), .out0(mux_stage6[61]));
			mux_fft #(.width(width)) mux_st5_62 (.sel0(sel_fft[1]), .in0(a0_wr[62]), .in1(a6_wr[62]), .out0(mux_stage6[62]));
			mux_fft #(.width(width)) mux_st5_63 (.sel0(sel_fft[1]), .in0(a0_wr[63]), .in1(a6_wr[63]), .out0(mux_stage6[63]));
			mux_fft #(.width(width)) mux_st5_64 (.sel0(sel_fft[1]), .in0(a0_wr[64]), .in1(a6_wr[64]), .out0(mux_stage6[64]));
			mux_fft #(.width(width)) mux_st5_65 (.sel0(sel_fft[1]), .in0(a0_wr[65]), .in1(a6_wr[65]), .out0(mux_stage6[65]));
			mux_fft #(.width(width)) mux_st5_66 (.sel0(sel_fft[1]), .in0(a0_wr[66]), .in1(a6_wr[66]), .out0(mux_stage6[66]));
			mux_fft #(.width(width)) mux_st5_67 (.sel0(sel_fft[1]), .in0(a0_wr[67]), .in1(a6_wr[67]), .out0(mux_stage6[67]));
			mux_fft #(.width(width)) mux_st5_68 (.sel0(sel_fft[1]), .in0(a0_wr[68]), .in1(a6_wr[68]), .out0(mux_stage6[68]));
			mux_fft #(.width(width)) mux_st5_69 (.sel0(sel_fft[1]), .in0(a0_wr[69]), .in1(a6_wr[69]), .out0(mux_stage6[69]));
			mux_fft #(.width(width)) mux_st5_70 (.sel0(sel_fft[1]), .in0(a0_wr[70]), .in1(a6_wr[70]), .out0(mux_stage6[70]));
			mux_fft #(.width(width)) mux_st5_71 (.sel0(sel_fft[1]), .in0(a0_wr[71]), .in1(a6_wr[71]), .out0(mux_stage6[71]));
			mux_fft #(.width(width)) mux_st5_72 (.sel0(sel_fft[1]), .in0(a0_wr[72]), .in1(a6_wr[72]), .out0(mux_stage6[72]));
			mux_fft #(.width(width)) mux_st5_73 (.sel0(sel_fft[1]), .in0(a0_wr[73]), .in1(a6_wr[73]), .out0(mux_stage6[73]));
			mux_fft #(.width(width)) mux_st5_74 (.sel0(sel_fft[1]), .in0(a0_wr[74]), .in1(a6_wr[74]), .out0(mux_stage6[74]));
			mux_fft #(.width(width)) mux_st5_75 (.sel0(sel_fft[1]), .in0(a0_wr[75]), .in1(a6_wr[75]), .out0(mux_stage6[75]));
			mux_fft #(.width(width)) mux_st5_76 (.sel0(sel_fft[1]), .in0(a0_wr[76]), .in1(a6_wr[76]), .out0(mux_stage6[76]));
			mux_fft #(.width(width)) mux_st5_77 (.sel0(sel_fft[1]), .in0(a0_wr[77]), .in1(a6_wr[77]), .out0(mux_stage6[77]));
			mux_fft #(.width(width)) mux_st5_78 (.sel0(sel_fft[1]), .in0(a0_wr[78]), .in1(a6_wr[78]), .out0(mux_stage6[78]));
			mux_fft #(.width(width)) mux_st5_79 (.sel0(sel_fft[1]), .in0(a0_wr[79]), .in1(a6_wr[79]), .out0(mux_stage6[79]));
			mux_fft #(.width(width)) mux_st5_80 (.sel0(sel_fft[1]), .in0(a0_wr[80]), .in1(a6_wr[80]), .out0(mux_stage6[80]));
			mux_fft #(.width(width)) mux_st5_81 (.sel0(sel_fft[1]), .in0(a0_wr[81]), .in1(a6_wr[81]), .out0(mux_stage6[81]));
			mux_fft #(.width(width)) mux_st5_82 (.sel0(sel_fft[1]), .in0(a0_wr[82]), .in1(a6_wr[82]), .out0(mux_stage6[82]));
			mux_fft #(.width(width)) mux_st5_83 (.sel0(sel_fft[1]), .in0(a0_wr[83]), .in1(a6_wr[83]), .out0(mux_stage6[83]));
			mux_fft #(.width(width)) mux_st5_84 (.sel0(sel_fft[1]), .in0(a0_wr[84]), .in1(a6_wr[84]), .out0(mux_stage6[84]));
			mux_fft #(.width(width)) mux_st5_85 (.sel0(sel_fft[1]), .in0(a0_wr[85]), .in1(a6_wr[85]), .out0(mux_stage6[85]));
			mux_fft #(.width(width)) mux_st5_86 (.sel0(sel_fft[1]), .in0(a0_wr[86]), .in1(a6_wr[86]), .out0(mux_stage6[86]));
			mux_fft #(.width(width)) mux_st5_87 (.sel0(sel_fft[1]), .in0(a0_wr[87]), .in1(a6_wr[87]), .out0(mux_stage6[87]));
			mux_fft #(.width(width)) mux_st5_88 (.sel0(sel_fft[1]), .in0(a0_wr[88]), .in1(a6_wr[88]), .out0(mux_stage6[88]));
			mux_fft #(.width(width)) mux_st5_89 (.sel0(sel_fft[1]), .in0(a0_wr[89]), .in1(a6_wr[89]), .out0(mux_stage6[89]));
			mux_fft #(.width(width)) mux_st5_90 (.sel0(sel_fft[1]), .in0(a0_wr[90]), .in1(a6_wr[90]), .out0(mux_stage6[90]));
			mux_fft #(.width(width)) mux_st5_91 (.sel0(sel_fft[1]), .in0(a0_wr[91]), .in1(a6_wr[91]), .out0(mux_stage6[91]));
			mux_fft #(.width(width)) mux_st5_92 (.sel0(sel_fft[1]), .in0(a0_wr[92]), .in1(a6_wr[92]), .out0(mux_stage6[92]));
			mux_fft #(.width(width)) mux_st5_93 (.sel0(sel_fft[1]), .in0(a0_wr[93]), .in1(a6_wr[93]), .out0(mux_stage6[93]));
			mux_fft #(.width(width)) mux_st5_94 (.sel0(sel_fft[1]), .in0(a0_wr[94]), .in1(a6_wr[94]), .out0(mux_stage6[94]));
			mux_fft #(.width(width)) mux_st5_95 (.sel0(sel_fft[1]), .in0(a0_wr[95]), .in1(a6_wr[95]), .out0(mux_stage6[95]));
			mux_fft #(.width(width)) mux_st5_96 (.sel0(sel_fft[1]), .in0(a0_wr[96]), .in1(a6_wr[96]), .out0(mux_stage6[96]));
			mux_fft #(.width(width)) mux_st5_97 (.sel0(sel_fft[1]), .in0(a0_wr[97]), .in1(a6_wr[97]), .out0(mux_stage6[97]));
			mux_fft #(.width(width)) mux_st5_98 (.sel0(sel_fft[1]), .in0(a0_wr[98]), .in1(a6_wr[98]), .out0(mux_stage6[98]));
			mux_fft #(.width(width)) mux_st5_99 (.sel0(sel_fft[1]), .in0(a0_wr[99]), .in1(a6_wr[99]), .out0(mux_stage6[99]));
			mux_fft #(.width(width)) mux_st5_100 (.sel0(sel_fft[1]), .in0(a0_wr[100]), .in1(a6_wr[100]), .out0(mux_stage6[100]));
			mux_fft #(.width(width)) mux_st5_101 (.sel0(sel_fft[1]), .in0(a0_wr[101]), .in1(a6_wr[101]), .out0(mux_stage6[101]));
			mux_fft #(.width(width)) mux_st5_102 (.sel0(sel_fft[1]), .in0(a0_wr[102]), .in1(a6_wr[102]), .out0(mux_stage6[102]));
			mux_fft #(.width(width)) mux_st5_103 (.sel0(sel_fft[1]), .in0(a0_wr[103]), .in1(a6_wr[103]), .out0(mux_stage6[103]));
			mux_fft #(.width(width)) mux_st5_104 (.sel0(sel_fft[1]), .in0(a0_wr[104]), .in1(a6_wr[104]), .out0(mux_stage6[104]));
			mux_fft #(.width(width)) mux_st5_105 (.sel0(sel_fft[1]), .in0(a0_wr[105]), .in1(a6_wr[105]), .out0(mux_stage6[105]));
			mux_fft #(.width(width)) mux_st5_106 (.sel0(sel_fft[1]), .in0(a0_wr[106]), .in1(a6_wr[106]), .out0(mux_stage6[106]));
			mux_fft #(.width(width)) mux_st5_107 (.sel0(sel_fft[1]), .in0(a0_wr[107]), .in1(a6_wr[107]), .out0(mux_stage6[107]));
			mux_fft #(.width(width)) mux_st5_108 (.sel0(sel_fft[1]), .in0(a0_wr[108]), .in1(a6_wr[108]), .out0(mux_stage6[108]));
			mux_fft #(.width(width)) mux_st5_109 (.sel0(sel_fft[1]), .in0(a0_wr[109]), .in1(a6_wr[109]), .out0(mux_stage6[109]));
			mux_fft #(.width(width)) mux_st5_110 (.sel0(sel_fft[1]), .in0(a0_wr[110]), .in1(a6_wr[110]), .out0(mux_stage6[110]));
			mux_fft #(.width(width)) mux_st5_111 (.sel0(sel_fft[1]), .in0(a0_wr[111]), .in1(a6_wr[111]), .out0(mux_stage6[111]));
			mux_fft #(.width(width)) mux_st5_112 (.sel0(sel_fft[1]), .in0(a0_wr[112]), .in1(a6_wr[112]), .out0(mux_stage6[112]));
			mux_fft #(.width(width)) mux_st5_113 (.sel0(sel_fft[1]), .in0(a0_wr[113]), .in1(a6_wr[113]), .out0(mux_stage6[113]));
			mux_fft #(.width(width)) mux_st5_114 (.sel0(sel_fft[1]), .in0(a0_wr[114]), .in1(a6_wr[114]), .out0(mux_stage6[114]));
			mux_fft #(.width(width)) mux_st5_115 (.sel0(sel_fft[1]), .in0(a0_wr[115]), .in1(a6_wr[115]), .out0(mux_stage6[115]));
			mux_fft #(.width(width)) mux_st5_116 (.sel0(sel_fft[1]), .in0(a0_wr[116]), .in1(a6_wr[116]), .out0(mux_stage6[116]));
			mux_fft #(.width(width)) mux_st5_117 (.sel0(sel_fft[1]), .in0(a0_wr[117]), .in1(a6_wr[117]), .out0(mux_stage6[117]));
			mux_fft #(.width(width)) mux_st5_118 (.sel0(sel_fft[1]), .in0(a0_wr[118]), .in1(a6_wr[118]), .out0(mux_stage6[118]));
			mux_fft #(.width(width)) mux_st5_119 (.sel0(sel_fft[1]), .in0(a0_wr[119]), .in1(a6_wr[119]), .out0(mux_stage6[119]));
			mux_fft #(.width(width)) mux_st5_120 (.sel0(sel_fft[1]), .in0(a0_wr[120]), .in1(a6_wr[120]), .out0(mux_stage6[120]));
			mux_fft #(.width(width)) mux_st5_121 (.sel0(sel_fft[1]), .in0(a0_wr[121]), .in1(a6_wr[121]), .out0(mux_stage6[121]));
			mux_fft #(.width(width)) mux_st5_122 (.sel0(sel_fft[1]), .in0(a0_wr[122]), .in1(a6_wr[122]), .out0(mux_stage6[122]));
			mux_fft #(.width(width)) mux_st5_123 (.sel0(sel_fft[1]), .in0(a0_wr[123]), .in1(a6_wr[123]), .out0(mux_stage6[123]));
			mux_fft #(.width(width)) mux_st5_124 (.sel0(sel_fft[1]), .in0(a0_wr[124]), .in1(a6_wr[124]), .out0(mux_stage6[124]));
			mux_fft #(.width(width)) mux_st5_125 (.sel0(sel_fft[1]), .in0(a0_wr[125]), .in1(a6_wr[125]), .out0(mux_stage6[125]));
			mux_fft #(.width(width)) mux_st5_126 (.sel0(sel_fft[1]), .in0(a0_wr[126]), .in1(a6_wr[126]), .out0(mux_stage6[126]));
			mux_fft #(.width(width)) mux_st5_127 (.sel0(sel_fft[1]), .in0(a0_wr[127]), .in1(a6_wr[127]), .out0(mux_stage6[127]));

			//--- radix stage 6
			radix2 #(.width(width)) rd_st6_0   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[0]), .rdlo_in(mux_stage6[1]),  .coef_in(coef[0]), .rdup_out(a7_wr[0]), .rdlo_out(a7_wr[1]));
			radix2 #(.width(width)) rd_st6_1   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[2]), .rdlo_in(mux_stage6[3]),  .coef_in(coef[0]), .rdup_out(a7_wr[2]), .rdlo_out(a7_wr[3]));
			radix2 #(.width(width)) rd_st6_2   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[4]), .rdlo_in(mux_stage6[5]),  .coef_in(coef[0]), .rdup_out(a7_wr[4]), .rdlo_out(a7_wr[5]));
			radix2 #(.width(width)) rd_st6_3   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[6]), .rdlo_in(mux_stage6[7]),  .coef_in(coef[0]), .rdup_out(a7_wr[6]), .rdlo_out(a7_wr[7]));
			radix2 #(.width(width)) rd_st6_4   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[8]), .rdlo_in(mux_stage6[9]),  .coef_in(coef[0]), .rdup_out(a7_wr[8]), .rdlo_out(a7_wr[9]));
			radix2 #(.width(width)) rd_st6_5   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[10]), .rdlo_in(mux_stage6[11]),  .coef_in(coef[0]), .rdup_out(a7_wr[10]), .rdlo_out(a7_wr[11]));
			radix2 #(.width(width)) rd_st6_6   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[12]), .rdlo_in(mux_stage6[13]),  .coef_in(coef[0]), .rdup_out(a7_wr[12]), .rdlo_out(a7_wr[13]));
			radix2 #(.width(width)) rd_st6_7   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[14]), .rdlo_in(mux_stage6[15]),  .coef_in(coef[0]), .rdup_out(a7_wr[14]), .rdlo_out(a7_wr[15]));
			radix2 #(.width(width)) rd_st6_8   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[16]), .rdlo_in(mux_stage6[17]),  .coef_in(coef[0]), .rdup_out(a7_wr[16]), .rdlo_out(a7_wr[17]));
			radix2 #(.width(width)) rd_st6_9   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[18]), .rdlo_in(mux_stage6[19]),  .coef_in(coef[0]), .rdup_out(a7_wr[18]), .rdlo_out(a7_wr[19]));
			radix2 #(.width(width)) rd_st6_10   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[20]), .rdlo_in(mux_stage6[21]),  .coef_in(coef[0]), .rdup_out(a7_wr[20]), .rdlo_out(a7_wr[21]));
			radix2 #(.width(width)) rd_st6_11   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[22]), .rdlo_in(mux_stage6[23]),  .coef_in(coef[0]), .rdup_out(a7_wr[22]), .rdlo_out(a7_wr[23]));
			radix2 #(.width(width)) rd_st6_12   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[24]), .rdlo_in(mux_stage6[25]),  .coef_in(coef[0]), .rdup_out(a7_wr[24]), .rdlo_out(a7_wr[25]));
			radix2 #(.width(width)) rd_st6_13   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[26]), .rdlo_in(mux_stage6[27]),  .coef_in(coef[0]), .rdup_out(a7_wr[26]), .rdlo_out(a7_wr[27]));
			radix2 #(.width(width)) rd_st6_14   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[28]), .rdlo_in(mux_stage6[29]),  .coef_in(coef[0]), .rdup_out(a7_wr[28]), .rdlo_out(a7_wr[29]));
			radix2 #(.width(width)) rd_st6_15   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[30]), .rdlo_in(mux_stage6[31]),  .coef_in(coef[0]), .rdup_out(a7_wr[30]), .rdlo_out(a7_wr[31]));
			radix2 #(.width(width)) rd_st6_16   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[32]), .rdlo_in(mux_stage6[33]),  .coef_in(coef[0]), .rdup_out(a7_wr[32]), .rdlo_out(a7_wr[33]));
			radix2 #(.width(width)) rd_st6_17   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[34]), .rdlo_in(mux_stage6[35]),  .coef_in(coef[0]), .rdup_out(a7_wr[34]), .rdlo_out(a7_wr[35]));
			radix2 #(.width(width)) rd_st6_18   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[36]), .rdlo_in(mux_stage6[37]),  .coef_in(coef[0]), .rdup_out(a7_wr[36]), .rdlo_out(a7_wr[37]));
			radix2 #(.width(width)) rd_st6_19   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[38]), .rdlo_in(mux_stage6[39]),  .coef_in(coef[0]), .rdup_out(a7_wr[38]), .rdlo_out(a7_wr[39]));
			radix2 #(.width(width)) rd_st6_20   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[40]), .rdlo_in(mux_stage6[41]),  .coef_in(coef[0]), .rdup_out(a7_wr[40]), .rdlo_out(a7_wr[41]));
			radix2 #(.width(width)) rd_st6_21   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[42]), .rdlo_in(mux_stage6[43]),  .coef_in(coef[0]), .rdup_out(a7_wr[42]), .rdlo_out(a7_wr[43]));
			radix2 #(.width(width)) rd_st6_22   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[44]), .rdlo_in(mux_stage6[45]),  .coef_in(coef[0]), .rdup_out(a7_wr[44]), .rdlo_out(a7_wr[45]));
			radix2 #(.width(width)) rd_st6_23   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[46]), .rdlo_in(mux_stage6[47]),  .coef_in(coef[0]), .rdup_out(a7_wr[46]), .rdlo_out(a7_wr[47]));
			radix2 #(.width(width)) rd_st6_24   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[48]), .rdlo_in(mux_stage6[49]),  .coef_in(coef[0]), .rdup_out(a7_wr[48]), .rdlo_out(a7_wr[49]));
			radix2 #(.width(width)) rd_st6_25   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[50]), .rdlo_in(mux_stage6[51]),  .coef_in(coef[0]), .rdup_out(a7_wr[50]), .rdlo_out(a7_wr[51]));
			radix2 #(.width(width)) rd_st6_26   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[52]), .rdlo_in(mux_stage6[53]),  .coef_in(coef[0]), .rdup_out(a7_wr[52]), .rdlo_out(a7_wr[53]));
			radix2 #(.width(width)) rd_st6_27   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[54]), .rdlo_in(mux_stage6[55]),  .coef_in(coef[0]), .rdup_out(a7_wr[54]), .rdlo_out(a7_wr[55]));
			radix2 #(.width(width)) rd_st6_28   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[56]), .rdlo_in(mux_stage6[57]),  .coef_in(coef[0]), .rdup_out(a7_wr[56]), .rdlo_out(a7_wr[57]));
			radix2 #(.width(width)) rd_st6_29   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[58]), .rdlo_in(mux_stage6[59]),  .coef_in(coef[0]), .rdup_out(a7_wr[58]), .rdlo_out(a7_wr[59]));
			radix2 #(.width(width)) rd_st6_30   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[60]), .rdlo_in(mux_stage6[61]),  .coef_in(coef[0]), .rdup_out(a7_wr[60]), .rdlo_out(a7_wr[61]));
			radix2 #(.width(width)) rd_st6_31   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[62]), .rdlo_in(mux_stage6[63]),  .coef_in(coef[0]), .rdup_out(a7_wr[62]), .rdlo_out(a7_wr[63]));
			radix2 #(.width(width)) rd_st6_32   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[64]), .rdlo_in(mux_stage6[65]),  .coef_in(coef[0]), .rdup_out(a7_wr[64]), .rdlo_out(a7_wr[65]));
			radix2 #(.width(width)) rd_st6_33   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[66]), .rdlo_in(mux_stage6[67]),  .coef_in(coef[0]), .rdup_out(a7_wr[66]), .rdlo_out(a7_wr[67]));
			radix2 #(.width(width)) rd_st6_34   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[68]), .rdlo_in(mux_stage6[69]),  .coef_in(coef[0]), .rdup_out(a7_wr[68]), .rdlo_out(a7_wr[69]));
			radix2 #(.width(width)) rd_st6_35   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[70]), .rdlo_in(mux_stage6[71]),  .coef_in(coef[0]), .rdup_out(a7_wr[70]), .rdlo_out(a7_wr[71]));
			radix2 #(.width(width)) rd_st6_36   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[72]), .rdlo_in(mux_stage6[73]),  .coef_in(coef[0]), .rdup_out(a7_wr[72]), .rdlo_out(a7_wr[73]));
			radix2 #(.width(width)) rd_st6_37   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[74]), .rdlo_in(mux_stage6[75]),  .coef_in(coef[0]), .rdup_out(a7_wr[74]), .rdlo_out(a7_wr[75]));
			radix2 #(.width(width)) rd_st6_38   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[76]), .rdlo_in(mux_stage6[77]),  .coef_in(coef[0]), .rdup_out(a7_wr[76]), .rdlo_out(a7_wr[77]));
			radix2 #(.width(width)) rd_st6_39   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[78]), .rdlo_in(mux_stage6[79]),  .coef_in(coef[0]), .rdup_out(a7_wr[78]), .rdlo_out(a7_wr[79]));
			radix2 #(.width(width)) rd_st6_40   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[80]), .rdlo_in(mux_stage6[81]),  .coef_in(coef[0]), .rdup_out(a7_wr[80]), .rdlo_out(a7_wr[81]));
			radix2 #(.width(width)) rd_st6_41   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[82]), .rdlo_in(mux_stage6[83]),  .coef_in(coef[0]), .rdup_out(a7_wr[82]), .rdlo_out(a7_wr[83]));
			radix2 #(.width(width)) rd_st6_42   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[84]), .rdlo_in(mux_stage6[85]),  .coef_in(coef[0]), .rdup_out(a7_wr[84]), .rdlo_out(a7_wr[85]));
			radix2 #(.width(width)) rd_st6_43   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[86]), .rdlo_in(mux_stage6[87]),  .coef_in(coef[0]), .rdup_out(a7_wr[86]), .rdlo_out(a7_wr[87]));
			radix2 #(.width(width)) rd_st6_44   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[88]), .rdlo_in(mux_stage6[89]),  .coef_in(coef[0]), .rdup_out(a7_wr[88]), .rdlo_out(a7_wr[89]));
			radix2 #(.width(width)) rd_st6_45   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[90]), .rdlo_in(mux_stage6[91]),  .coef_in(coef[0]), .rdup_out(a7_wr[90]), .rdlo_out(a7_wr[91]));
			radix2 #(.width(width)) rd_st6_46   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[92]), .rdlo_in(mux_stage6[93]),  .coef_in(coef[0]), .rdup_out(a7_wr[92]), .rdlo_out(a7_wr[93]));
			radix2 #(.width(width)) rd_st6_47   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[94]), .rdlo_in(mux_stage6[95]),  .coef_in(coef[0]), .rdup_out(a7_wr[94]), .rdlo_out(a7_wr[95]));
			radix2 #(.width(width)) rd_st6_48   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[96]), .rdlo_in(mux_stage6[97]),  .coef_in(coef[0]), .rdup_out(a7_wr[96]), .rdlo_out(a7_wr[97]));
			radix2 #(.width(width)) rd_st6_49   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[98]), .rdlo_in(mux_stage6[99]),  .coef_in(coef[0]), .rdup_out(a7_wr[98]), .rdlo_out(a7_wr[99]));
			radix2 #(.width(width)) rd_st6_50   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[100]), .rdlo_in(mux_stage6[101]),  .coef_in(coef[0]), .rdup_out(a7_wr[100]), .rdlo_out(a7_wr[101]));
			radix2 #(.width(width)) rd_st6_51   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[102]), .rdlo_in(mux_stage6[103]),  .coef_in(coef[0]), .rdup_out(a7_wr[102]), .rdlo_out(a7_wr[103]));
			radix2 #(.width(width)) rd_st6_52   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[104]), .rdlo_in(mux_stage6[105]),  .coef_in(coef[0]), .rdup_out(a7_wr[104]), .rdlo_out(a7_wr[105]));
			radix2 #(.width(width)) rd_st6_53   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[106]), .rdlo_in(mux_stage6[107]),  .coef_in(coef[0]), .rdup_out(a7_wr[106]), .rdlo_out(a7_wr[107]));
			radix2 #(.width(width)) rd_st6_54   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[108]), .rdlo_in(mux_stage6[109]),  .coef_in(coef[0]), .rdup_out(a7_wr[108]), .rdlo_out(a7_wr[109]));
			radix2 #(.width(width)) rd_st6_55   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[110]), .rdlo_in(mux_stage6[111]),  .coef_in(coef[0]), .rdup_out(a7_wr[110]), .rdlo_out(a7_wr[111]));
			radix2 #(.width(width)) rd_st6_56   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[112]), .rdlo_in(mux_stage6[113]),  .coef_in(coef[0]), .rdup_out(a7_wr[112]), .rdlo_out(a7_wr[113]));
			radix2 #(.width(width)) rd_st6_57   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[114]), .rdlo_in(mux_stage6[115]),  .coef_in(coef[0]), .rdup_out(a7_wr[114]), .rdlo_out(a7_wr[115]));
			radix2 #(.width(width)) rd_st6_58   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[116]), .rdlo_in(mux_stage6[117]),  .coef_in(coef[0]), .rdup_out(a7_wr[116]), .rdlo_out(a7_wr[117]));
			radix2 #(.width(width)) rd_st6_59   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[118]), .rdlo_in(mux_stage6[119]),  .coef_in(coef[0]), .rdup_out(a7_wr[118]), .rdlo_out(a7_wr[119]));
			radix2 #(.width(width)) rd_st6_60   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[120]), .rdlo_in(mux_stage6[121]),  .coef_in(coef[0]), .rdup_out(a7_wr[120]), .rdlo_out(a7_wr[121]));
			radix2 #(.width(width)) rd_st6_61   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[122]), .rdlo_in(mux_stage6[123]),  .coef_in(coef[0]), .rdup_out(a7_wr[122]), .rdlo_out(a7_wr[123]));
			radix2 #(.width(width)) rd_st6_62   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[124]), .rdlo_in(mux_stage6[125]),  .coef_in(coef[0]), .rdup_out(a7_wr[124]), .rdlo_out(a7_wr[125]));
			radix2 #(.width(width)) rd_st6_63   (.clk(clk), .rst(rst), .stall(sel_fft[0]), .rdup_in(mux_stage6[126]), .rdlo_in(mux_stage6[127]),  .coef_in(coef[0]), .rdup_out(a7_wr[126]), .rdlo_out(a7_wr[127]));

			//--- output stage (bit reversal)
			assign x0_out	= a7_wr[0]; 
			assign x1_out	= a7_wr[64]; 
			assign x2_out	= a7_wr[32]; 
			assign x3_out	= a7_wr[96]; 
			assign x4_out	= a7_wr[16]; 
			assign x5_out	= a7_wr[80]; 
			assign x6_out	= a7_wr[48]; 
			assign x7_out	= a7_wr[112]; 
			assign x8_out	= a7_wr[8]; 
			assign x9_out	= a7_wr[72]; 
			assign x10_out	= a7_wr[40]; 
			assign x11_out	= a7_wr[104]; 
			assign x12_out	= a7_wr[24]; 
			assign x13_out	= a7_wr[88]; 
			assign x14_out	= a7_wr[56]; 
			assign x15_out	= a7_wr[120]; 
			assign x16_out	= a7_wr[4]; 
			assign x17_out	= a7_wr[68]; 
			assign x18_out	= a7_wr[36]; 
			assign x19_out	= a7_wr[100]; 
			assign x20_out	= a7_wr[20]; 
			assign x21_out	= a7_wr[84]; 
			assign x22_out	= a7_wr[52]; 
			assign x23_out	= a7_wr[116]; 
			assign x24_out	= a7_wr[12]; 
			assign x25_out	= a7_wr[76]; 
			assign x26_out	= a7_wr[44]; 
			assign x27_out	= a7_wr[108]; 
			assign x28_out	= a7_wr[28]; 
			assign x29_out	= a7_wr[92]; 
			assign x30_out	= a7_wr[60]; 
			assign x31_out	= a7_wr[124]; 
			assign x32_out	= a7_wr[2]; 
			assign x33_out	= a7_wr[66]; 
			assign x34_out	= a7_wr[34]; 
			assign x35_out	= a7_wr[98]; 
			assign x36_out	= a7_wr[18]; 
			assign x37_out	= a7_wr[82]; 
			assign x38_out	= a7_wr[50]; 
			assign x39_out	= a7_wr[114]; 
			assign x40_out	= a7_wr[10]; 
			assign x41_out	= a7_wr[74]; 
			assign x42_out	= a7_wr[42]; 
			assign x43_out	= a7_wr[106]; 
			assign x44_out	= a7_wr[26]; 
			assign x45_out	= a7_wr[90]; 
			assign x46_out	= a7_wr[58]; 
			assign x47_out	= a7_wr[122]; 
			assign x48_out	= a7_wr[6]; 
			assign x49_out	= a7_wr[70]; 
			assign x50_out	= a7_wr[38]; 
			assign x51_out	= a7_wr[102]; 
			assign x52_out	= a7_wr[22]; 
			assign x53_out	= a7_wr[86]; 
			assign x54_out	= a7_wr[54]; 
			assign x55_out	= a7_wr[118]; 
			assign x56_out	= a7_wr[14]; 
			assign x57_out	= a7_wr[78]; 
			assign x58_out	= a7_wr[46]; 
			assign x59_out	= a7_wr[110]; 
			assign x60_out	= a7_wr[30]; 
			assign x61_out	= a7_wr[94]; 
			assign x62_out	= a7_wr[62]; 
			assign x63_out	= a7_wr[126]; 
			assign x64_out	= a7_wr[1]; 
			assign x65_out	= a7_wr[65]; 
			assign x66_out	= a7_wr[33]; 
			assign x67_out	= a7_wr[97]; 
			assign x68_out	= a7_wr[17]; 
			assign x69_out	= a7_wr[81]; 
			assign x70_out	= a7_wr[49]; 
			assign x71_out	= a7_wr[113]; 
			assign x72_out	= a7_wr[9]; 
			assign x73_out	= a7_wr[73]; 
			assign x74_out	= a7_wr[41]; 
			assign x75_out	= a7_wr[105]; 
			assign x76_out	= a7_wr[25]; 
			assign x77_out	= a7_wr[89]; 
			assign x78_out	= a7_wr[57]; 
			assign x79_out	= a7_wr[121]; 
			assign x80_out	= a7_wr[5]; 
			assign x81_out	= a7_wr[69]; 
			assign x82_out	= a7_wr[37]; 
			assign x83_out	= a7_wr[101]; 
			assign x84_out	= a7_wr[21]; 
			assign x85_out	= a7_wr[85]; 
			assign x86_out	= a7_wr[53]; 
			assign x87_out	= a7_wr[117]; 
			assign x88_out	= a7_wr[13]; 
			assign x89_out	= a7_wr[77]; 
			assign x90_out	= a7_wr[45]; 
			assign x91_out	= a7_wr[109]; 
			assign x92_out	= a7_wr[29]; 
			assign x93_out	= a7_wr[93]; 
			assign x94_out	= a7_wr[61]; 
			assign x95_out	= a7_wr[125]; 
			assign x96_out	= a7_wr[3]; 
			assign x97_out	= a7_wr[67]; 
			assign x98_out	= a7_wr[35]; 
			assign x99_out	= a7_wr[99]; 
			assign x100_out	= a7_wr[19]; 
			assign x101_out	= a7_wr[83]; 
			assign x102_out	= a7_wr[51]; 
			assign x103_out	= a7_wr[115]; 
			assign x104_out	= a7_wr[11]; 
			assign x105_out	= a7_wr[75]; 
			assign x106_out	= a7_wr[43]; 
			assign x107_out	= a7_wr[107]; 
			assign x108_out	= a7_wr[27]; 
			assign x109_out	= a7_wr[91]; 
			assign x110_out	= a7_wr[59]; 
			assign x111_out	= a7_wr[123]; 
			assign x112_out	= a7_wr[7]; 
			assign x113_out	= a7_wr[71]; 
			assign x114_out	= a7_wr[39]; 
			assign x115_out	= a7_wr[103]; 
			assign x116_out	= a7_wr[23]; 
			assign x117_out	= a7_wr[87]; 
			assign x118_out	= a7_wr[55]; 
			assign x119_out	= a7_wr[119]; 
			assign x120_out	= a7_wr[15]; 
			assign x121_out	= a7_wr[79]; 
			assign x122_out	= a7_wr[47]; 
			assign x123_out	= a7_wr[111]; 
			assign x124_out	= a7_wr[31]; 
			assign x125_out	= a7_wr[95]; 
			assign x126_out	= a7_wr[63]; 
			assign x127_out	= a7_wr[127]; 

endmodule
