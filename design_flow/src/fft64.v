`include "macros.h"

module fft64
#(
		//--- data bit-width
			parameter width = 24,
		//--- fft size
			parameter size=64
)
(
		//--- control
			input                   clk, rst, stall,              
		//--- inputs
			input    [width-1:0]    x0_in,                        
			input    [width-1:0]    x1_in,                        
			input    [width-1:0]    x2_in,                        
			input    [width-1:0]    x3_in,                        
			input    [width-1:0]    x4_in,                        
			input    [width-1:0]    x5_in,                        
			input    [width-1:0]    x6_in,                        
			input    [width-1:0]    x7_in,                        
			input    [width-1:0]    x8_in,                        
			input    [width-1:0]    x9_in,                        
			input    [width-1:0]    x10_in,                       
			input    [width-1:0]    x11_in,                       
			input    [width-1:0]    x12_in,                       
			input    [width-1:0]    x13_in,                       
			input    [width-1:0]    x14_in,                       
			input    [width-1:0]    x15_in,                       
			input    [width-1:0]    x16_in,                       
			input    [width-1:0]    x17_in,                       
			input    [width-1:0]    x18_in,                       
			input    [width-1:0]    x19_in,                       
			input    [width-1:0]    x20_in,                       
			input    [width-1:0]    x21_in,                       
			input    [width-1:0]    x22_in,                       
			input    [width-1:0]    x23_in,                       
			input    [width-1:0]    x24_in,                       
			input    [width-1:0]    x25_in,                       
			input    [width-1:0]    x26_in,                       
			input    [width-1:0]    x27_in,                       
			input    [width-1:0]    x28_in,                       
			input    [width-1:0]    x29_in,                       
			input    [width-1:0]    x30_in,                       
			input    [width-1:0]    x31_in,                       
			input    [width-1:0]    x32_in,                       
			input    [width-1:0]    x33_in,                       
			input    [width-1:0]    x34_in,                       
			input    [width-1:0]    x35_in,                       
			input    [width-1:0]    x36_in,                       
			input    [width-1:0]    x37_in,                       
			input    [width-1:0]    x38_in,                       
			input    [width-1:0]    x39_in,                       
			input    [width-1:0]    x40_in,                       
			input    [width-1:0]    x41_in,                       
			input    [width-1:0]    x42_in,                       
			input    [width-1:0]    x43_in,                       
			input    [width-1:0]    x44_in,                       
			input    [width-1:0]    x45_in,                       
			input    [width-1:0]    x46_in,                       
			input    [width-1:0]    x47_in,                       
			input    [width-1:0]    x48_in,                       
			input    [width-1:0]    x49_in,                       
			input    [width-1:0]    x50_in,                       
			input    [width-1:0]    x51_in,                       
			input    [width-1:0]    x52_in,                       
			input    [width-1:0]    x53_in,                       
			input    [width-1:0]    x54_in,                       
			input    [width-1:0]    x55_in,                       
			input    [width-1:0]    x56_in,                       
			input    [width-1:0]    x57_in,                       
			input    [width-1:0]    x58_in,                       
			input    [width-1:0]    x59_in,                       
			input    [width-1:0]    x60_in,                       
			input    [width-1:0]    x61_in,                       
			input    [width-1:0]    x62_in,                       
			input    [width-1:0]    x63_in,                       
		//--- outputs
			output                  stall_out,                    
			output   [width-1:0]    x0_out,                       
			output   [width-1:0]    x1_out,                       
			output   [width-1:0]    x2_out,                       
			output   [width-1:0]    x3_out,                       
			output   [width-1:0]    x4_out,                       
			output   [width-1:0]    x5_out,                       
			output   [width-1:0]    x6_out,                       
			output   [width-1:0]    x7_out,                       
			output   [width-1:0]    x8_out,                       
			output   [width-1:0]    x9_out,                       
			output   [width-1:0]    x10_out,                      
			output   [width-1:0]    x11_out,                      
			output   [width-1:0]    x12_out,                      
			output   [width-1:0]    x13_out,                      
			output   [width-1:0]    x14_out,                      
			output   [width-1:0]    x15_out,                      
			output   [width-1:0]    x16_out,                      
			output   [width-1:0]    x17_out,                      
			output   [width-1:0]    x18_out,                      
			output   [width-1:0]    x19_out,                      
			output   [width-1:0]    x20_out,                      
			output   [width-1:0]    x21_out,                      
			output   [width-1:0]    x22_out,                      
			output   [width-1:0]    x23_out,                      
			output   [width-1:0]    x24_out,                      
			output   [width-1:0]    x25_out,                      
			output   [width-1:0]    x26_out,                      
			output   [width-1:0]    x27_out,                      
			output   [width-1:0]    x28_out,                      
			output   [width-1:0]    x29_out,                      
			output   [width-1:0]    x30_out,                      
			output   [width-1:0]    x31_out,                      
			output   [width-1:0]    x32_out,                      
			output   [width-1:0]    x33_out,                      
			output   [width-1:0]    x34_out,                      
			output   [width-1:0]    x35_out,                      
			output   [width-1:0]    x36_out,                      
			output   [width-1:0]    x37_out,                      
			output   [width-1:0]    x38_out,                      
			output   [width-1:0]    x39_out,                      
			output   [width-1:0]    x40_out,                      
			output   [width-1:0]    x41_out,                      
			output   [width-1:0]    x42_out,                      
			output   [width-1:0]    x43_out,                      
			output   [width-1:0]    x44_out,                      
			output   [width-1:0]    x45_out,                      
			output   [width-1:0]    x46_out,                      
			output   [width-1:0]    x47_out,                      
			output   [width-1:0]    x48_out,                      
			output   [width-1:0]    x49_out,                      
			output   [width-1:0]    x50_out,                      
			output   [width-1:0]    x51_out,                      
			output   [width-1:0]    x52_out,                      
			output   [width-1:0]    x53_out,                      
			output   [width-1:0]    x54_out,                      
			output   [width-1:0]    x55_out,                      
			output   [width-1:0]    x56_out,                      
			output   [width-1:0]    x57_out,                      
			output   [width-1:0]    x58_out,                      
			output   [width-1:0]    x59_out,                      
			output   [width-1:0]    x60_out,                      
			output   [width-1:0]    x61_out,                      
			output   [width-1:0]    x62_out,                      
			output   [width-1:0]    x63_out                       
);

		//--- signal definition
			wire  [width-1:0]        coef[size-1:0];

			reg   [width-1:0]        a0_wr[size-1:0];
			wire  [width-1:0]        a1_wr[size-1:0];
			wire  [width-1:0]        a2_wr[size-1:0];
			wire  [width-1:0]        a3_wr[size-1:0];
			wire  [width-1:0]        a4_wr[size-1:0];
			wire  [width-1:0]        a5_wr[size-1:0];
			wire  [width-1:0]        a6_wr[size-1:0];
			wire                     comb_stall;

		//--- cofficient assignment
			assign coef[0] =    {12'b011111111111, 12'b000000000000};
			assign coef[1] =    {12'b011111110101, 12'b111100110111};
			assign coef[2] =    {12'b011111011000, 12'b111001110001};
			assign coef[3] =    {12'b011110100111, 12'b110110101110};
			assign coef[4] =    {12'b011101100011, 12'b110011110001};
			assign coef[5] =    {12'b011100001101, 12'b110000111011};
			assign coef[6] =    {12'b011010100110, 12'b101110001111};
			assign coef[7] =    {12'b011000101110, 12'b101011101101};
			assign coef[8] =    {12'b010110100111, 12'b101001011001};
			assign coef[9] =    {12'b010100010011, 12'b100111010010};
			assign coef[10] =   {12'b010001110001, 12'b100101011010};
			assign coef[11] =   {12'b001111000101, 12'b100011110011};
			assign coef[12] =   {12'b001100001111, 12'b100010011101};
			assign coef[13] =   {12'b001001010010, 12'b100001011001};
			assign coef[14] =   {12'b000110001111, 12'b100000101000};
			assign coef[15] =   {12'b000011001001, 12'b100000001011};
			assign coef[16] =   {12'b000000000000, 12'b100000000001};
			assign coef[17] =   {12'b111100110111, 12'b100000001011};
			assign coef[18] =   {12'b111001110001, 12'b100000101000};
			assign coef[19] =   {12'b110110101110, 12'b100001011001};
			assign coef[20] =   {12'b110011110001, 12'b100010011101};
			assign coef[21] =   {12'b110000111011, 12'b100011110011};
			assign coef[22] =   {12'b101110001111, 12'b100101011010};
			assign coef[23] =   {12'b101011101101, 12'b100111010010};
			assign coef[24] =   {12'b101001011001, 12'b101001011001};
			assign coef[25] =   {12'b100111010010, 12'b101011101101};
			assign coef[26] =   {12'b100101011010, 12'b101110001111};
			assign coef[27] =   {12'b100011110011, 12'b110000111011};
			assign coef[28] =   {12'b100010011101, 12'b110011110001};
			assign coef[29] =   {12'b100001011001, 12'b110110101110};
			assign coef[30] =   {12'b100000101000, 12'b111001110001};
			assign coef[31] =   {12'b100000001011, 12'b111100110111};

		//--- fifo stage
			localparam depth=`LOG2(size);
			fifo #(.depth(depth)) inst_fifo(.clk(clk), .rst(rst), .stall_in(stall), .stall_out(stall_out));

			assign comb_stall = stall_out & stall;

		//--- input stage
			always @(posedge clk or posedge rst) begin
				if (rst) begin
					a0_wr[0]       <= 0;                           
					a0_wr[1]       <= 0;                           
					a0_wr[2]       <= 0;                           
					a0_wr[3]       <= 0;                           
					a0_wr[4]       <= 0;                           
					a0_wr[5]       <= 0;                           
					a0_wr[6]       <= 0;                           
					a0_wr[7]       <= 0;                           
					a0_wr[8]       <= 0;                           
					a0_wr[9]       <= 0;                           
					a0_wr[10]      <= 0;                           
					a0_wr[11]      <= 0;                           
					a0_wr[12]      <= 0;                           
					a0_wr[13]      <= 0;                           
					a0_wr[14]      <= 0;                           
					a0_wr[15]      <= 0;                           
					a0_wr[16]      <= 0;                           
					a0_wr[17]      <= 0;                           
					a0_wr[18]      <= 0;                           
					a0_wr[19]      <= 0;                           
					a0_wr[20]      <= 0;                           
					a0_wr[21]      <= 0;                           
					a0_wr[22]      <= 0;                           
					a0_wr[23]      <= 0;                           
					a0_wr[24]      <= 0;                           
					a0_wr[25]      <= 0;                           
					a0_wr[26]      <= 0;                           
					a0_wr[27]      <= 0;                           
					a0_wr[28]      <= 0;                           
					a0_wr[29]      <= 0;                           
					a0_wr[30]      <= 0;                           
					a0_wr[31]      <= 0;                           
					a0_wr[32]      <= 0;                           
					a0_wr[33]      <= 0;                           
					a0_wr[34]      <= 0;                           
					a0_wr[35]      <= 0;                           
					a0_wr[36]      <= 0;                           
					a0_wr[37]      <= 0;                           
					a0_wr[38]      <= 0;                           
					a0_wr[39]      <= 0;                           
					a0_wr[40]      <= 0;                           
					a0_wr[41]      <= 0;                           
					a0_wr[42]      <= 0;                           
					a0_wr[43]      <= 0;                           
					a0_wr[44]      <= 0;                           
					a0_wr[45]      <= 0;                           
					a0_wr[46]      <= 0;                           
					a0_wr[47]      <= 0;                           
					a0_wr[48]      <= 0;                           
					a0_wr[49]      <= 0;                           
					a0_wr[50]      <= 0;                           
					a0_wr[51]      <= 0;                           
					a0_wr[52]      <= 0;                           
					a0_wr[53]      <= 0;                           
					a0_wr[54]      <= 0;                           
					a0_wr[55]      <= 0;                           
					a0_wr[56]      <= 0;                           
					a0_wr[57]      <= 0;                           
					a0_wr[58]      <= 0;                           
					a0_wr[59]      <= 0;                           
					a0_wr[60]      <= 0;                           
					a0_wr[61]      <= 0;                           
					a0_wr[62]      <= 0;                           
					a0_wr[63]      <= 0;                           
				end
				else begin
					if (!stall) begin
						a0_wr[0]      <= x0_in;                       
						a0_wr[1]      <= x1_in;                       
						a0_wr[2]      <= x2_in;                       
						a0_wr[3]      <= x3_in;                       
						a0_wr[4]      <= x4_in;                       
						a0_wr[5]      <= x5_in;                       
						a0_wr[6]      <= x6_in;                       
						a0_wr[7]      <= x7_in;                       
						a0_wr[8]      <= x8_in;                       
						a0_wr[9]      <= x9_in;                       
						a0_wr[10]     <= x10_in;                      
						a0_wr[11]     <= x11_in;                      
						a0_wr[12]     <= x12_in;                      
						a0_wr[13]     <= x13_in;                      
						a0_wr[14]     <= x14_in;                      
						a0_wr[15]     <= x15_in;                      
						a0_wr[16]     <= x16_in;                      
						a0_wr[17]     <= x17_in;                      
						a0_wr[18]     <= x18_in;                      
						a0_wr[19]     <= x19_in;                      
						a0_wr[20]     <= x20_in;                      
						a0_wr[21]     <= x21_in;                      
						a0_wr[22]     <= x22_in;                      
						a0_wr[23]     <= x23_in;                      
						a0_wr[24]     <= x24_in;                      
						a0_wr[25]     <= x25_in;                      
						a0_wr[26]     <= x26_in;                      
						a0_wr[27]     <= x27_in;                      
						a0_wr[28]     <= x28_in;                      
						a0_wr[29]     <= x29_in;                      
						a0_wr[30]     <= x30_in;                      
						a0_wr[31]     <= x31_in;                      
						a0_wr[32]     <= x32_in;                      
						a0_wr[33]     <= x33_in;                      
						a0_wr[34]     <= x34_in;                      
						a0_wr[35]     <= x35_in;                      
						a0_wr[36]     <= x36_in;                      
						a0_wr[37]     <= x37_in;                      
						a0_wr[38]     <= x38_in;                      
						a0_wr[39]     <= x39_in;                      
						a0_wr[40]     <= x40_in;                      
						a0_wr[41]     <= x41_in;                      
						a0_wr[42]     <= x42_in;                      
						a0_wr[43]     <= x43_in;                      
						a0_wr[44]     <= x44_in;                      
						a0_wr[45]     <= x45_in;                      
						a0_wr[46]     <= x46_in;                      
						a0_wr[47]     <= x47_in;                      
						a0_wr[48]     <= x48_in;                      
						a0_wr[49]     <= x49_in;                      
						a0_wr[50]     <= x50_in;                      
						a0_wr[51]     <= x51_in;                      
						a0_wr[52]     <= x52_in;                      
						a0_wr[53]     <= x53_in;                      
						a0_wr[54]     <= x54_in;                      
						a0_wr[55]     <= x55_in;                      
						a0_wr[56]     <= x56_in;                      
						a0_wr[57]     <= x57_in;                      
						a0_wr[58]     <= x58_in;                      
						a0_wr[59]     <= x59_in;                      
						a0_wr[60]     <= x60_in;                      
						a0_wr[61]     <= x61_in;                      
						a0_wr[62]     <= x62_in;                      
						a0_wr[63]     <= x63_in;                      
					end
				end
			end

		//--- radix stage 0
			radix2 #(.width(width)) rd_st0_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[0]), .rdlo_in(a0_wr[32]),  .coef_in(coef[0]), .rdup_out(a1_wr[0]), .rdlo_out(a1_wr[32]));
			radix2 #(.width(width)) rd_st0_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[1]), .rdlo_in(a0_wr[33]),  .coef_in(coef[1]), .rdup_out(a1_wr[1]), .rdlo_out(a1_wr[33]));
			radix2 #(.width(width)) rd_st0_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[2]), .rdlo_in(a0_wr[34]),  .coef_in(coef[2]), .rdup_out(a1_wr[2]), .rdlo_out(a1_wr[34]));
			radix2 #(.width(width)) rd_st0_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[3]), .rdlo_in(a0_wr[35]),  .coef_in(coef[3]), .rdup_out(a1_wr[3]), .rdlo_out(a1_wr[35]));
			radix2 #(.width(width)) rd_st0_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[4]), .rdlo_in(a0_wr[36]),  .coef_in(coef[4]), .rdup_out(a1_wr[4]), .rdlo_out(a1_wr[36]));
			radix2 #(.width(width)) rd_st0_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[5]), .rdlo_in(a0_wr[37]),  .coef_in(coef[5]), .rdup_out(a1_wr[5]), .rdlo_out(a1_wr[37]));
			radix2 #(.width(width)) rd_st0_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[6]), .rdlo_in(a0_wr[38]),  .coef_in(coef[6]), .rdup_out(a1_wr[6]), .rdlo_out(a1_wr[38]));
			radix2 #(.width(width)) rd_st0_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[7]), .rdlo_in(a0_wr[39]),  .coef_in(coef[7]), .rdup_out(a1_wr[7]), .rdlo_out(a1_wr[39]));
			radix2 #(.width(width)) rd_st0_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[8]), .rdlo_in(a0_wr[40]),  .coef_in(coef[8]), .rdup_out(a1_wr[8]), .rdlo_out(a1_wr[40]));
			radix2 #(.width(width)) rd_st0_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[9]), .rdlo_in(a0_wr[41]),  .coef_in(coef[9]), .rdup_out(a1_wr[9]), .rdlo_out(a1_wr[41]));
			radix2 #(.width(width)) rd_st0_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[10]), .rdlo_in(a0_wr[42]),  .coef_in(coef[10]), .rdup_out(a1_wr[10]), .rdlo_out(a1_wr[42]));
			radix2 #(.width(width)) rd_st0_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[11]), .rdlo_in(a0_wr[43]),  .coef_in(coef[11]), .rdup_out(a1_wr[11]), .rdlo_out(a1_wr[43]));
			radix2 #(.width(width)) rd_st0_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[12]), .rdlo_in(a0_wr[44]),  .coef_in(coef[12]), .rdup_out(a1_wr[12]), .rdlo_out(a1_wr[44]));
			radix2 #(.width(width)) rd_st0_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[13]), .rdlo_in(a0_wr[45]),  .coef_in(coef[13]), .rdup_out(a1_wr[13]), .rdlo_out(a1_wr[45]));
			radix2 #(.width(width)) rd_st0_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[14]), .rdlo_in(a0_wr[46]),  .coef_in(coef[14]), .rdup_out(a1_wr[14]), .rdlo_out(a1_wr[46]));
			radix2 #(.width(width)) rd_st0_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[15]), .rdlo_in(a0_wr[47]),  .coef_in(coef[15]), .rdup_out(a1_wr[15]), .rdlo_out(a1_wr[47]));
			radix2 #(.width(width)) rd_st0_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[16]), .rdlo_in(a0_wr[48]),  .coef_in(coef[16]), .rdup_out(a1_wr[16]), .rdlo_out(a1_wr[48]));
			radix2 #(.width(width)) rd_st0_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[17]), .rdlo_in(a0_wr[49]),  .coef_in(coef[17]), .rdup_out(a1_wr[17]), .rdlo_out(a1_wr[49]));
			radix2 #(.width(width)) rd_st0_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[18]), .rdlo_in(a0_wr[50]),  .coef_in(coef[18]), .rdup_out(a1_wr[18]), .rdlo_out(a1_wr[50]));
			radix2 #(.width(width)) rd_st0_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[19]), .rdlo_in(a0_wr[51]),  .coef_in(coef[19]), .rdup_out(a1_wr[19]), .rdlo_out(a1_wr[51]));
			radix2 #(.width(width)) rd_st0_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[20]), .rdlo_in(a0_wr[52]),  .coef_in(coef[20]), .rdup_out(a1_wr[20]), .rdlo_out(a1_wr[52]));
			radix2 #(.width(width)) rd_st0_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[21]), .rdlo_in(a0_wr[53]),  .coef_in(coef[21]), .rdup_out(a1_wr[21]), .rdlo_out(a1_wr[53]));
			radix2 #(.width(width)) rd_st0_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[22]), .rdlo_in(a0_wr[54]),  .coef_in(coef[22]), .rdup_out(a1_wr[22]), .rdlo_out(a1_wr[54]));
			radix2 #(.width(width)) rd_st0_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[23]), .rdlo_in(a0_wr[55]),  .coef_in(coef[23]), .rdup_out(a1_wr[23]), .rdlo_out(a1_wr[55]));
			radix2 #(.width(width)) rd_st0_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[24]), .rdlo_in(a0_wr[56]),  .coef_in(coef[24]), .rdup_out(a1_wr[24]), .rdlo_out(a1_wr[56]));
			radix2 #(.width(width)) rd_st0_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[25]), .rdlo_in(a0_wr[57]),  .coef_in(coef[25]), .rdup_out(a1_wr[25]), .rdlo_out(a1_wr[57]));
			radix2 #(.width(width)) rd_st0_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[26]), .rdlo_in(a0_wr[58]),  .coef_in(coef[26]), .rdup_out(a1_wr[26]), .rdlo_out(a1_wr[58]));
			radix2 #(.width(width)) rd_st0_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[27]), .rdlo_in(a0_wr[59]),  .coef_in(coef[27]), .rdup_out(a1_wr[27]), .rdlo_out(a1_wr[59]));
			radix2 #(.width(width)) rd_st0_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[28]), .rdlo_in(a0_wr[60]),  .coef_in(coef[28]), .rdup_out(a1_wr[28]), .rdlo_out(a1_wr[60]));
			radix2 #(.width(width)) rd_st0_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[29]), .rdlo_in(a0_wr[61]),  .coef_in(coef[29]), .rdup_out(a1_wr[29]), .rdlo_out(a1_wr[61]));
			radix2 #(.width(width)) rd_st0_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[30]), .rdlo_in(a0_wr[62]),  .coef_in(coef[30]), .rdup_out(a1_wr[30]), .rdlo_out(a1_wr[62]));
			radix2 #(.width(width)) rd_st0_31  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[31]), .rdlo_in(a0_wr[63]),  .coef_in(coef[31]), .rdup_out(a1_wr[31]), .rdlo_out(a1_wr[63]));

		//--- radix stage 1
			radix2 #(.width(width)) rd_st1_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[0]), .rdlo_in(a1_wr[16]),  .coef_in(coef[0]), .rdup_out(a2_wr[0]), .rdlo_out(a2_wr[16]));
			radix2 #(.width(width)) rd_st1_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[1]), .rdlo_in(a1_wr[17]),  .coef_in(coef[2]), .rdup_out(a2_wr[1]), .rdlo_out(a2_wr[17]));
			radix2 #(.width(width)) rd_st1_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[2]), .rdlo_in(a1_wr[18]),  .coef_in(coef[4]), .rdup_out(a2_wr[2]), .rdlo_out(a2_wr[18]));
			radix2 #(.width(width)) rd_st1_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[3]), .rdlo_in(a1_wr[19]),  .coef_in(coef[6]), .rdup_out(a2_wr[3]), .rdlo_out(a2_wr[19]));
			radix2 #(.width(width)) rd_st1_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[4]), .rdlo_in(a1_wr[20]),  .coef_in(coef[8]), .rdup_out(a2_wr[4]), .rdlo_out(a2_wr[20]));
			radix2 #(.width(width)) rd_st1_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[5]), .rdlo_in(a1_wr[21]),  .coef_in(coef[10]), .rdup_out(a2_wr[5]), .rdlo_out(a2_wr[21]));
			radix2 #(.width(width)) rd_st1_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[6]), .rdlo_in(a1_wr[22]),  .coef_in(coef[12]), .rdup_out(a2_wr[6]), .rdlo_out(a2_wr[22]));
			radix2 #(.width(width)) rd_st1_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[7]), .rdlo_in(a1_wr[23]),  .coef_in(coef[14]), .rdup_out(a2_wr[7]), .rdlo_out(a2_wr[23]));
			radix2 #(.width(width)) rd_st1_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[8]), .rdlo_in(a1_wr[24]),  .coef_in(coef[16]), .rdup_out(a2_wr[8]), .rdlo_out(a2_wr[24]));
			radix2 #(.width(width)) rd_st1_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[9]), .rdlo_in(a1_wr[25]),  .coef_in(coef[18]), .rdup_out(a2_wr[9]), .rdlo_out(a2_wr[25]));
			radix2 #(.width(width)) rd_st1_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[10]), .rdlo_in(a1_wr[26]),  .coef_in(coef[20]), .rdup_out(a2_wr[10]), .rdlo_out(a2_wr[26]));
			radix2 #(.width(width)) rd_st1_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[11]), .rdlo_in(a1_wr[27]),  .coef_in(coef[22]), .rdup_out(a2_wr[11]), .rdlo_out(a2_wr[27]));
			radix2 #(.width(width)) rd_st1_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[12]), .rdlo_in(a1_wr[28]),  .coef_in(coef[24]), .rdup_out(a2_wr[12]), .rdlo_out(a2_wr[28]));
			radix2 #(.width(width)) rd_st1_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[13]), .rdlo_in(a1_wr[29]),  .coef_in(coef[26]), .rdup_out(a2_wr[13]), .rdlo_out(a2_wr[29]));
			radix2 #(.width(width)) rd_st1_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[14]), .rdlo_in(a1_wr[30]),  .coef_in(coef[28]), .rdup_out(a2_wr[14]), .rdlo_out(a2_wr[30]));
			radix2 #(.width(width)) rd_st1_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[15]), .rdlo_in(a1_wr[31]),  .coef_in(coef[30]), .rdup_out(a2_wr[15]), .rdlo_out(a2_wr[31]));
			radix2 #(.width(width)) rd_st1_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[32]), .rdlo_in(a1_wr[48]),  .coef_in(coef[0]), .rdup_out(a2_wr[32]), .rdlo_out(a2_wr[48]));
			radix2 #(.width(width)) rd_st1_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[33]), .rdlo_in(a1_wr[49]),  .coef_in(coef[2]), .rdup_out(a2_wr[33]), .rdlo_out(a2_wr[49]));
			radix2 #(.width(width)) rd_st1_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[34]), .rdlo_in(a1_wr[50]),  .coef_in(coef[4]), .rdup_out(a2_wr[34]), .rdlo_out(a2_wr[50]));
			radix2 #(.width(width)) rd_st1_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[35]), .rdlo_in(a1_wr[51]),  .coef_in(coef[6]), .rdup_out(a2_wr[35]), .rdlo_out(a2_wr[51]));
			radix2 #(.width(width)) rd_st1_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[36]), .rdlo_in(a1_wr[52]),  .coef_in(coef[8]), .rdup_out(a2_wr[36]), .rdlo_out(a2_wr[52]));
			radix2 #(.width(width)) rd_st1_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[37]), .rdlo_in(a1_wr[53]),  .coef_in(coef[10]), .rdup_out(a2_wr[37]), .rdlo_out(a2_wr[53]));
			radix2 #(.width(width)) rd_st1_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[38]), .rdlo_in(a1_wr[54]),  .coef_in(coef[12]), .rdup_out(a2_wr[38]), .rdlo_out(a2_wr[54]));
			radix2 #(.width(width)) rd_st1_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[39]), .rdlo_in(a1_wr[55]),  .coef_in(coef[14]), .rdup_out(a2_wr[39]), .rdlo_out(a2_wr[55]));
			radix2 #(.width(width)) rd_st1_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[40]), .rdlo_in(a1_wr[56]),  .coef_in(coef[16]), .rdup_out(a2_wr[40]), .rdlo_out(a2_wr[56]));
			radix2 #(.width(width)) rd_st1_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[41]), .rdlo_in(a1_wr[57]),  .coef_in(coef[18]), .rdup_out(a2_wr[41]), .rdlo_out(a2_wr[57]));
			radix2 #(.width(width)) rd_st1_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[42]), .rdlo_in(a1_wr[58]),  .coef_in(coef[20]), .rdup_out(a2_wr[42]), .rdlo_out(a2_wr[58]));
			radix2 #(.width(width)) rd_st1_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[43]), .rdlo_in(a1_wr[59]),  .coef_in(coef[22]), .rdup_out(a2_wr[43]), .rdlo_out(a2_wr[59]));
			radix2 #(.width(width)) rd_st1_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[44]), .rdlo_in(a1_wr[60]),  .coef_in(coef[24]), .rdup_out(a2_wr[44]), .rdlo_out(a2_wr[60]));
			radix2 #(.width(width)) rd_st1_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[45]), .rdlo_in(a1_wr[61]),  .coef_in(coef[26]), .rdup_out(a2_wr[45]), .rdlo_out(a2_wr[61]));
			radix2 #(.width(width)) rd_st1_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[46]), .rdlo_in(a1_wr[62]),  .coef_in(coef[28]), .rdup_out(a2_wr[46]), .rdlo_out(a2_wr[62]));
			radix2 #(.width(width)) rd_st1_47  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[47]), .rdlo_in(a1_wr[63]),  .coef_in(coef[30]), .rdup_out(a2_wr[47]), .rdlo_out(a2_wr[63]));

		//--- radix stage 2
			radix2 #(.width(width)) rd_st2_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[0]), .rdlo_in(a2_wr[8]),  .coef_in(coef[0]), .rdup_out(a3_wr[0]), .rdlo_out(a3_wr[8]));
			radix2 #(.width(width)) rd_st2_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[1]), .rdlo_in(a2_wr[9]),  .coef_in(coef[4]), .rdup_out(a3_wr[1]), .rdlo_out(a3_wr[9]));
			radix2 #(.width(width)) rd_st2_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[2]), .rdlo_in(a2_wr[10]),  .coef_in(coef[8]), .rdup_out(a3_wr[2]), .rdlo_out(a3_wr[10]));
			radix2 #(.width(width)) rd_st2_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[3]), .rdlo_in(a2_wr[11]),  .coef_in(coef[12]), .rdup_out(a3_wr[3]), .rdlo_out(a3_wr[11]));
			radix2 #(.width(width)) rd_st2_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[4]), .rdlo_in(a2_wr[12]),  .coef_in(coef[16]), .rdup_out(a3_wr[4]), .rdlo_out(a3_wr[12]));
			radix2 #(.width(width)) rd_st2_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[5]), .rdlo_in(a2_wr[13]),  .coef_in(coef[20]), .rdup_out(a3_wr[5]), .rdlo_out(a3_wr[13]));
			radix2 #(.width(width)) rd_st2_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[6]), .rdlo_in(a2_wr[14]),  .coef_in(coef[24]), .rdup_out(a3_wr[6]), .rdlo_out(a3_wr[14]));
			radix2 #(.width(width)) rd_st2_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[7]), .rdlo_in(a2_wr[15]),  .coef_in(coef[28]), .rdup_out(a3_wr[7]), .rdlo_out(a3_wr[15]));
			radix2 #(.width(width)) rd_st2_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[16]), .rdlo_in(a2_wr[24]),  .coef_in(coef[0]), .rdup_out(a3_wr[16]), .rdlo_out(a3_wr[24]));
			radix2 #(.width(width)) rd_st2_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[17]), .rdlo_in(a2_wr[25]),  .coef_in(coef[4]), .rdup_out(a3_wr[17]), .rdlo_out(a3_wr[25]));
			radix2 #(.width(width)) rd_st2_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[18]), .rdlo_in(a2_wr[26]),  .coef_in(coef[8]), .rdup_out(a3_wr[18]), .rdlo_out(a3_wr[26]));
			radix2 #(.width(width)) rd_st2_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[19]), .rdlo_in(a2_wr[27]),  .coef_in(coef[12]), .rdup_out(a3_wr[19]), .rdlo_out(a3_wr[27]));
			radix2 #(.width(width)) rd_st2_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[20]), .rdlo_in(a2_wr[28]),  .coef_in(coef[16]), .rdup_out(a3_wr[20]), .rdlo_out(a3_wr[28]));
			radix2 #(.width(width)) rd_st2_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[21]), .rdlo_in(a2_wr[29]),  .coef_in(coef[20]), .rdup_out(a3_wr[21]), .rdlo_out(a3_wr[29]));
			radix2 #(.width(width)) rd_st2_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[22]), .rdlo_in(a2_wr[30]),  .coef_in(coef[24]), .rdup_out(a3_wr[22]), .rdlo_out(a3_wr[30]));
			radix2 #(.width(width)) rd_st2_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[23]), .rdlo_in(a2_wr[31]),  .coef_in(coef[28]), .rdup_out(a3_wr[23]), .rdlo_out(a3_wr[31]));
			radix2 #(.width(width)) rd_st2_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[32]), .rdlo_in(a2_wr[40]),  .coef_in(coef[0]), .rdup_out(a3_wr[32]), .rdlo_out(a3_wr[40]));
			radix2 #(.width(width)) rd_st2_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[33]), .rdlo_in(a2_wr[41]),  .coef_in(coef[4]), .rdup_out(a3_wr[33]), .rdlo_out(a3_wr[41]));
			radix2 #(.width(width)) rd_st2_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[34]), .rdlo_in(a2_wr[42]),  .coef_in(coef[8]), .rdup_out(a3_wr[34]), .rdlo_out(a3_wr[42]));
			radix2 #(.width(width)) rd_st2_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[35]), .rdlo_in(a2_wr[43]),  .coef_in(coef[12]), .rdup_out(a3_wr[35]), .rdlo_out(a3_wr[43]));
			radix2 #(.width(width)) rd_st2_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[36]), .rdlo_in(a2_wr[44]),  .coef_in(coef[16]), .rdup_out(a3_wr[36]), .rdlo_out(a3_wr[44]));
			radix2 #(.width(width)) rd_st2_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[37]), .rdlo_in(a2_wr[45]),  .coef_in(coef[20]), .rdup_out(a3_wr[37]), .rdlo_out(a3_wr[45]));
			radix2 #(.width(width)) rd_st2_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[38]), .rdlo_in(a2_wr[46]),  .coef_in(coef[24]), .rdup_out(a3_wr[38]), .rdlo_out(a3_wr[46]));
			radix2 #(.width(width)) rd_st2_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[39]), .rdlo_in(a2_wr[47]),  .coef_in(coef[28]), .rdup_out(a3_wr[39]), .rdlo_out(a3_wr[47]));
			radix2 #(.width(width)) rd_st2_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[48]), .rdlo_in(a2_wr[56]),  .coef_in(coef[0]), .rdup_out(a3_wr[48]), .rdlo_out(a3_wr[56]));
			radix2 #(.width(width)) rd_st2_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[49]), .rdlo_in(a2_wr[57]),  .coef_in(coef[4]), .rdup_out(a3_wr[49]), .rdlo_out(a3_wr[57]));
			radix2 #(.width(width)) rd_st2_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[50]), .rdlo_in(a2_wr[58]),  .coef_in(coef[8]), .rdup_out(a3_wr[50]), .rdlo_out(a3_wr[58]));
			radix2 #(.width(width)) rd_st2_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[51]), .rdlo_in(a2_wr[59]),  .coef_in(coef[12]), .rdup_out(a3_wr[51]), .rdlo_out(a3_wr[59]));
			radix2 #(.width(width)) rd_st2_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[52]), .rdlo_in(a2_wr[60]),  .coef_in(coef[16]), .rdup_out(a3_wr[52]), .rdlo_out(a3_wr[60]));
			radix2 #(.width(width)) rd_st2_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[53]), .rdlo_in(a2_wr[61]),  .coef_in(coef[20]), .rdup_out(a3_wr[53]), .rdlo_out(a3_wr[61]));
			radix2 #(.width(width)) rd_st2_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[54]), .rdlo_in(a2_wr[62]),  .coef_in(coef[24]), .rdup_out(a3_wr[54]), .rdlo_out(a3_wr[62]));
			radix2 #(.width(width)) rd_st2_55  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[55]), .rdlo_in(a2_wr[63]),  .coef_in(coef[28]), .rdup_out(a3_wr[55]), .rdlo_out(a3_wr[63]));

		//--- radix stage 3
			radix2 #(.width(width)) rd_st3_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[0]), .rdlo_in(a3_wr[4]),  .coef_in(coef[0]), .rdup_out(a4_wr[0]), .rdlo_out(a4_wr[4]));
			radix2 #(.width(width)) rd_st3_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[1]), .rdlo_in(a3_wr[5]),  .coef_in(coef[8]), .rdup_out(a4_wr[1]), .rdlo_out(a4_wr[5]));
			radix2 #(.width(width)) rd_st3_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[2]), .rdlo_in(a3_wr[6]),  .coef_in(coef[16]), .rdup_out(a4_wr[2]), .rdlo_out(a4_wr[6]));
			radix2 #(.width(width)) rd_st3_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[3]), .rdlo_in(a3_wr[7]),  .coef_in(coef[24]), .rdup_out(a4_wr[3]), .rdlo_out(a4_wr[7]));
			radix2 #(.width(width)) rd_st3_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[8]), .rdlo_in(a3_wr[12]),  .coef_in(coef[0]), .rdup_out(a4_wr[8]), .rdlo_out(a4_wr[12]));
			radix2 #(.width(width)) rd_st3_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[9]), .rdlo_in(a3_wr[13]),  .coef_in(coef[8]), .rdup_out(a4_wr[9]), .rdlo_out(a4_wr[13]));
			radix2 #(.width(width)) rd_st3_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[10]), .rdlo_in(a3_wr[14]),  .coef_in(coef[16]), .rdup_out(a4_wr[10]), .rdlo_out(a4_wr[14]));
			radix2 #(.width(width)) rd_st3_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[11]), .rdlo_in(a3_wr[15]),  .coef_in(coef[24]), .rdup_out(a4_wr[11]), .rdlo_out(a4_wr[15]));
			radix2 #(.width(width)) rd_st3_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[16]), .rdlo_in(a3_wr[20]),  .coef_in(coef[0]), .rdup_out(a4_wr[16]), .rdlo_out(a4_wr[20]));
			radix2 #(.width(width)) rd_st3_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[17]), .rdlo_in(a3_wr[21]),  .coef_in(coef[8]), .rdup_out(a4_wr[17]), .rdlo_out(a4_wr[21]));
			radix2 #(.width(width)) rd_st3_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[18]), .rdlo_in(a3_wr[22]),  .coef_in(coef[16]), .rdup_out(a4_wr[18]), .rdlo_out(a4_wr[22]));
			radix2 #(.width(width)) rd_st3_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[19]), .rdlo_in(a3_wr[23]),  .coef_in(coef[24]), .rdup_out(a4_wr[19]), .rdlo_out(a4_wr[23]));
			radix2 #(.width(width)) rd_st3_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[24]), .rdlo_in(a3_wr[28]),  .coef_in(coef[0]), .rdup_out(a4_wr[24]), .rdlo_out(a4_wr[28]));
			radix2 #(.width(width)) rd_st3_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[25]), .rdlo_in(a3_wr[29]),  .coef_in(coef[8]), .rdup_out(a4_wr[25]), .rdlo_out(a4_wr[29]));
			radix2 #(.width(width)) rd_st3_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[26]), .rdlo_in(a3_wr[30]),  .coef_in(coef[16]), .rdup_out(a4_wr[26]), .rdlo_out(a4_wr[30]));
			radix2 #(.width(width)) rd_st3_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[27]), .rdlo_in(a3_wr[31]),  .coef_in(coef[24]), .rdup_out(a4_wr[27]), .rdlo_out(a4_wr[31]));
			radix2 #(.width(width)) rd_st3_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[32]), .rdlo_in(a3_wr[36]),  .coef_in(coef[0]), .rdup_out(a4_wr[32]), .rdlo_out(a4_wr[36]));
			radix2 #(.width(width)) rd_st3_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[33]), .rdlo_in(a3_wr[37]),  .coef_in(coef[8]), .rdup_out(a4_wr[33]), .rdlo_out(a4_wr[37]));
			radix2 #(.width(width)) rd_st3_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[34]), .rdlo_in(a3_wr[38]),  .coef_in(coef[16]), .rdup_out(a4_wr[34]), .rdlo_out(a4_wr[38]));
			radix2 #(.width(width)) rd_st3_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[35]), .rdlo_in(a3_wr[39]),  .coef_in(coef[24]), .rdup_out(a4_wr[35]), .rdlo_out(a4_wr[39]));
			radix2 #(.width(width)) rd_st3_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[40]), .rdlo_in(a3_wr[44]),  .coef_in(coef[0]), .rdup_out(a4_wr[40]), .rdlo_out(a4_wr[44]));
			radix2 #(.width(width)) rd_st3_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[41]), .rdlo_in(a3_wr[45]),  .coef_in(coef[8]), .rdup_out(a4_wr[41]), .rdlo_out(a4_wr[45]));
			radix2 #(.width(width)) rd_st3_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[42]), .rdlo_in(a3_wr[46]),  .coef_in(coef[16]), .rdup_out(a4_wr[42]), .rdlo_out(a4_wr[46]));
			radix2 #(.width(width)) rd_st3_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[43]), .rdlo_in(a3_wr[47]),  .coef_in(coef[24]), .rdup_out(a4_wr[43]), .rdlo_out(a4_wr[47]));
			radix2 #(.width(width)) rd_st3_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[48]), .rdlo_in(a3_wr[52]),  .coef_in(coef[0]), .rdup_out(a4_wr[48]), .rdlo_out(a4_wr[52]));
			radix2 #(.width(width)) rd_st3_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[49]), .rdlo_in(a3_wr[53]),  .coef_in(coef[8]), .rdup_out(a4_wr[49]), .rdlo_out(a4_wr[53]));
			radix2 #(.width(width)) rd_st3_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[50]), .rdlo_in(a3_wr[54]),  .coef_in(coef[16]), .rdup_out(a4_wr[50]), .rdlo_out(a4_wr[54]));
			radix2 #(.width(width)) rd_st3_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[51]), .rdlo_in(a3_wr[55]),  .coef_in(coef[24]), .rdup_out(a4_wr[51]), .rdlo_out(a4_wr[55]));
			radix2 #(.width(width)) rd_st3_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[56]), .rdlo_in(a3_wr[60]),  .coef_in(coef[0]), .rdup_out(a4_wr[56]), .rdlo_out(a4_wr[60]));
			radix2 #(.width(width)) rd_st3_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[57]), .rdlo_in(a3_wr[61]),  .coef_in(coef[8]), .rdup_out(a4_wr[57]), .rdlo_out(a4_wr[61]));
			radix2 #(.width(width)) rd_st3_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[58]), .rdlo_in(a3_wr[62]),  .coef_in(coef[16]), .rdup_out(a4_wr[58]), .rdlo_out(a4_wr[62]));
			radix2 #(.width(width)) rd_st3_59  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[59]), .rdlo_in(a3_wr[63]),  .coef_in(coef[24]), .rdup_out(a4_wr[59]), .rdlo_out(a4_wr[63]));

		//--- radix stage 4
			radix2 #(.width(width)) rd_st4_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[0]), .rdlo_in(a4_wr[2]),  .coef_in(coef[0]), .rdup_out(a5_wr[0]), .rdlo_out(a5_wr[2]));
			radix2 #(.width(width)) rd_st4_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[1]), .rdlo_in(a4_wr[3]),  .coef_in(coef[16]), .rdup_out(a5_wr[1]), .rdlo_out(a5_wr[3]));
			radix2 #(.width(width)) rd_st4_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[4]), .rdlo_in(a4_wr[6]),  .coef_in(coef[0]), .rdup_out(a5_wr[4]), .rdlo_out(a5_wr[6]));
			radix2 #(.width(width)) rd_st4_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[5]), .rdlo_in(a4_wr[7]),  .coef_in(coef[16]), .rdup_out(a5_wr[5]), .rdlo_out(a5_wr[7]));
			radix2 #(.width(width)) rd_st4_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[8]), .rdlo_in(a4_wr[10]),  .coef_in(coef[0]), .rdup_out(a5_wr[8]), .rdlo_out(a5_wr[10]));
			radix2 #(.width(width)) rd_st4_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[9]), .rdlo_in(a4_wr[11]),  .coef_in(coef[16]), .rdup_out(a5_wr[9]), .rdlo_out(a5_wr[11]));
			radix2 #(.width(width)) rd_st4_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[12]), .rdlo_in(a4_wr[14]),  .coef_in(coef[0]), .rdup_out(a5_wr[12]), .rdlo_out(a5_wr[14]));
			radix2 #(.width(width)) rd_st4_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[13]), .rdlo_in(a4_wr[15]),  .coef_in(coef[16]), .rdup_out(a5_wr[13]), .rdlo_out(a5_wr[15]));
			radix2 #(.width(width)) rd_st4_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[16]), .rdlo_in(a4_wr[18]),  .coef_in(coef[0]), .rdup_out(a5_wr[16]), .rdlo_out(a5_wr[18]));
			radix2 #(.width(width)) rd_st4_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[17]), .rdlo_in(a4_wr[19]),  .coef_in(coef[16]), .rdup_out(a5_wr[17]), .rdlo_out(a5_wr[19]));
			radix2 #(.width(width)) rd_st4_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[20]), .rdlo_in(a4_wr[22]),  .coef_in(coef[0]), .rdup_out(a5_wr[20]), .rdlo_out(a5_wr[22]));
			radix2 #(.width(width)) rd_st4_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[21]), .rdlo_in(a4_wr[23]),  .coef_in(coef[16]), .rdup_out(a5_wr[21]), .rdlo_out(a5_wr[23]));
			radix2 #(.width(width)) rd_st4_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[24]), .rdlo_in(a4_wr[26]),  .coef_in(coef[0]), .rdup_out(a5_wr[24]), .rdlo_out(a5_wr[26]));
			radix2 #(.width(width)) rd_st4_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[25]), .rdlo_in(a4_wr[27]),  .coef_in(coef[16]), .rdup_out(a5_wr[25]), .rdlo_out(a5_wr[27]));
			radix2 #(.width(width)) rd_st4_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[28]), .rdlo_in(a4_wr[30]),  .coef_in(coef[0]), .rdup_out(a5_wr[28]), .rdlo_out(a5_wr[30]));
			radix2 #(.width(width)) rd_st4_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[29]), .rdlo_in(a4_wr[31]),  .coef_in(coef[16]), .rdup_out(a5_wr[29]), .rdlo_out(a5_wr[31]));
			radix2 #(.width(width)) rd_st4_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[32]), .rdlo_in(a4_wr[34]),  .coef_in(coef[0]), .rdup_out(a5_wr[32]), .rdlo_out(a5_wr[34]));
			radix2 #(.width(width)) rd_st4_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[33]), .rdlo_in(a4_wr[35]),  .coef_in(coef[16]), .rdup_out(a5_wr[33]), .rdlo_out(a5_wr[35]));
			radix2 #(.width(width)) rd_st4_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[36]), .rdlo_in(a4_wr[38]),  .coef_in(coef[0]), .rdup_out(a5_wr[36]), .rdlo_out(a5_wr[38]));
			radix2 #(.width(width)) rd_st4_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[37]), .rdlo_in(a4_wr[39]),  .coef_in(coef[16]), .rdup_out(a5_wr[37]), .rdlo_out(a5_wr[39]));
			radix2 #(.width(width)) rd_st4_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[40]), .rdlo_in(a4_wr[42]),  .coef_in(coef[0]), .rdup_out(a5_wr[40]), .rdlo_out(a5_wr[42]));
			radix2 #(.width(width)) rd_st4_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[41]), .rdlo_in(a4_wr[43]),  .coef_in(coef[16]), .rdup_out(a5_wr[41]), .rdlo_out(a5_wr[43]));
			radix2 #(.width(width)) rd_st4_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[44]), .rdlo_in(a4_wr[46]),  .coef_in(coef[0]), .rdup_out(a5_wr[44]), .rdlo_out(a5_wr[46]));
			radix2 #(.width(width)) rd_st4_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[45]), .rdlo_in(a4_wr[47]),  .coef_in(coef[16]), .rdup_out(a5_wr[45]), .rdlo_out(a5_wr[47]));
			radix2 #(.width(width)) rd_st4_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[48]), .rdlo_in(a4_wr[50]),  .coef_in(coef[0]), .rdup_out(a5_wr[48]), .rdlo_out(a5_wr[50]));
			radix2 #(.width(width)) rd_st4_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[49]), .rdlo_in(a4_wr[51]),  .coef_in(coef[16]), .rdup_out(a5_wr[49]), .rdlo_out(a5_wr[51]));
			radix2 #(.width(width)) rd_st4_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[52]), .rdlo_in(a4_wr[54]),  .coef_in(coef[0]), .rdup_out(a5_wr[52]), .rdlo_out(a5_wr[54]));
			radix2 #(.width(width)) rd_st4_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[53]), .rdlo_in(a4_wr[55]),  .coef_in(coef[16]), .rdup_out(a5_wr[53]), .rdlo_out(a5_wr[55]));
			radix2 #(.width(width)) rd_st4_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[56]), .rdlo_in(a4_wr[58]),  .coef_in(coef[0]), .rdup_out(a5_wr[56]), .rdlo_out(a5_wr[58]));
			radix2 #(.width(width)) rd_st4_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[57]), .rdlo_in(a4_wr[59]),  .coef_in(coef[16]), .rdup_out(a5_wr[57]), .rdlo_out(a5_wr[59]));
			radix2 #(.width(width)) rd_st4_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[60]), .rdlo_in(a4_wr[62]),  .coef_in(coef[0]), .rdup_out(a5_wr[60]), .rdlo_out(a5_wr[62]));
			radix2 #(.width(width)) rd_st4_61  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[61]), .rdlo_in(a4_wr[63]),  .coef_in(coef[16]), .rdup_out(a5_wr[61]), .rdlo_out(a5_wr[63]));

		//--- radix stage 5
			radix2 #(.width(width)) rd_st5_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[0]), .rdlo_in(a5_wr[1]),  .coef_in(coef[0]), .rdup_out(a6_wr[0]), .rdlo_out(a6_wr[1]));
			radix2 #(.width(width)) rd_st5_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[2]), .rdlo_in(a5_wr[3]),  .coef_in(coef[0]), .rdup_out(a6_wr[2]), .rdlo_out(a6_wr[3]));
			radix2 #(.width(width)) rd_st5_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[4]), .rdlo_in(a5_wr[5]),  .coef_in(coef[0]), .rdup_out(a6_wr[4]), .rdlo_out(a6_wr[5]));
			radix2 #(.width(width)) rd_st5_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[6]), .rdlo_in(a5_wr[7]),  .coef_in(coef[0]), .rdup_out(a6_wr[6]), .rdlo_out(a6_wr[7]));
			radix2 #(.width(width)) rd_st5_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[8]), .rdlo_in(a5_wr[9]),  .coef_in(coef[0]), .rdup_out(a6_wr[8]), .rdlo_out(a6_wr[9]));
			radix2 #(.width(width)) rd_st5_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[10]), .rdlo_in(a5_wr[11]),  .coef_in(coef[0]), .rdup_out(a6_wr[10]), .rdlo_out(a6_wr[11]));
			radix2 #(.width(width)) rd_st5_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[12]), .rdlo_in(a5_wr[13]),  .coef_in(coef[0]), .rdup_out(a6_wr[12]), .rdlo_out(a6_wr[13]));
			radix2 #(.width(width)) rd_st5_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[14]), .rdlo_in(a5_wr[15]),  .coef_in(coef[0]), .rdup_out(a6_wr[14]), .rdlo_out(a6_wr[15]));
			radix2 #(.width(width)) rd_st5_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[16]), .rdlo_in(a5_wr[17]),  .coef_in(coef[0]), .rdup_out(a6_wr[16]), .rdlo_out(a6_wr[17]));
			radix2 #(.width(width)) rd_st5_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[18]), .rdlo_in(a5_wr[19]),  .coef_in(coef[0]), .rdup_out(a6_wr[18]), .rdlo_out(a6_wr[19]));
			radix2 #(.width(width)) rd_st5_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[20]), .rdlo_in(a5_wr[21]),  .coef_in(coef[0]), .rdup_out(a6_wr[20]), .rdlo_out(a6_wr[21]));
			radix2 #(.width(width)) rd_st5_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[22]), .rdlo_in(a5_wr[23]),  .coef_in(coef[0]), .rdup_out(a6_wr[22]), .rdlo_out(a6_wr[23]));
			radix2 #(.width(width)) rd_st5_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[24]), .rdlo_in(a5_wr[25]),  .coef_in(coef[0]), .rdup_out(a6_wr[24]), .rdlo_out(a6_wr[25]));
			radix2 #(.width(width)) rd_st5_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[26]), .rdlo_in(a5_wr[27]),  .coef_in(coef[0]), .rdup_out(a6_wr[26]), .rdlo_out(a6_wr[27]));
			radix2 #(.width(width)) rd_st5_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[28]), .rdlo_in(a5_wr[29]),  .coef_in(coef[0]), .rdup_out(a6_wr[28]), .rdlo_out(a6_wr[29]));
			radix2 #(.width(width)) rd_st5_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[30]), .rdlo_in(a5_wr[31]),  .coef_in(coef[0]), .rdup_out(a6_wr[30]), .rdlo_out(a6_wr[31]));
			radix2 #(.width(width)) rd_st5_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[32]), .rdlo_in(a5_wr[33]),  .coef_in(coef[0]), .rdup_out(a6_wr[32]), .rdlo_out(a6_wr[33]));
			radix2 #(.width(width)) rd_st5_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[34]), .rdlo_in(a5_wr[35]),  .coef_in(coef[0]), .rdup_out(a6_wr[34]), .rdlo_out(a6_wr[35]));
			radix2 #(.width(width)) rd_st5_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[36]), .rdlo_in(a5_wr[37]),  .coef_in(coef[0]), .rdup_out(a6_wr[36]), .rdlo_out(a6_wr[37]));
			radix2 #(.width(width)) rd_st5_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[38]), .rdlo_in(a5_wr[39]),  .coef_in(coef[0]), .rdup_out(a6_wr[38]), .rdlo_out(a6_wr[39]));
			radix2 #(.width(width)) rd_st5_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[40]), .rdlo_in(a5_wr[41]),  .coef_in(coef[0]), .rdup_out(a6_wr[40]), .rdlo_out(a6_wr[41]));
			radix2 #(.width(width)) rd_st5_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[42]), .rdlo_in(a5_wr[43]),  .coef_in(coef[0]), .rdup_out(a6_wr[42]), .rdlo_out(a6_wr[43]));
			radix2 #(.width(width)) rd_st5_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[44]), .rdlo_in(a5_wr[45]),  .coef_in(coef[0]), .rdup_out(a6_wr[44]), .rdlo_out(a6_wr[45]));
			radix2 #(.width(width)) rd_st5_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[46]), .rdlo_in(a5_wr[47]),  .coef_in(coef[0]), .rdup_out(a6_wr[46]), .rdlo_out(a6_wr[47]));
			radix2 #(.width(width)) rd_st5_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[48]), .rdlo_in(a5_wr[49]),  .coef_in(coef[0]), .rdup_out(a6_wr[48]), .rdlo_out(a6_wr[49]));
			radix2 #(.width(width)) rd_st5_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[50]), .rdlo_in(a5_wr[51]),  .coef_in(coef[0]), .rdup_out(a6_wr[50]), .rdlo_out(a6_wr[51]));
			radix2 #(.width(width)) rd_st5_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[52]), .rdlo_in(a5_wr[53]),  .coef_in(coef[0]), .rdup_out(a6_wr[52]), .rdlo_out(a6_wr[53]));
			radix2 #(.width(width)) rd_st5_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[54]), .rdlo_in(a5_wr[55]),  .coef_in(coef[0]), .rdup_out(a6_wr[54]), .rdlo_out(a6_wr[55]));
			radix2 #(.width(width)) rd_st5_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[56]), .rdlo_in(a5_wr[57]),  .coef_in(coef[0]), .rdup_out(a6_wr[56]), .rdlo_out(a6_wr[57]));
			radix2 #(.width(width)) rd_st5_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[58]), .rdlo_in(a5_wr[59]),  .coef_in(coef[0]), .rdup_out(a6_wr[58]), .rdlo_out(a6_wr[59]));
			radix2 #(.width(width)) rd_st5_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[60]), .rdlo_in(a5_wr[61]),  .coef_in(coef[0]), .rdup_out(a6_wr[60]), .rdlo_out(a6_wr[61]));
			radix2 #(.width(width)) rd_st5_62  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[62]), .rdlo_in(a5_wr[63]),  .coef_in(coef[0]), .rdup_out(a6_wr[62]), .rdlo_out(a6_wr[63]));


				assign x0_out = a6_wr[0];
	assign x1_out = a6_wr[1];
	assign x2_out = a6_wr[2];
	assign x3_out = a6_wr[3];
	assign x4_out = a6_wr[4];
	assign x5_out = a6_wr[5];
	assign x6_out = a6_wr[6];
	assign x7_out = a6_wr[7];
	assign x8_out = a6_wr[8];
	assign x9_out = a6_wr[9];
	assign x10_out = a6_wr[10];
	assign x11_out = a6_wr[11];
	assign x12_out = a6_wr[12];
	assign x13_out = a6_wr[13];
	assign x14_out = a6_wr[14];
	assign x15_out = a6_wr[15];
	assign x16_out = a6_wr[16];
	assign x17_out = a6_wr[17];
	assign x18_out = a6_wr[18];
	assign x19_out = a6_wr[19];
	assign x20_out = a6_wr[20];
	assign x21_out = a6_wr[21];
	assign x22_out = a6_wr[22];
	assign x23_out = a6_wr[23];
	assign x24_out = a6_wr[24];
	assign x25_out = a6_wr[25];
	assign x26_out = a6_wr[26];
	assign x27_out = a6_wr[27];
	assign x28_out = a6_wr[28];
	assign x29_out = a6_wr[29];
	assign x30_out = a6_wr[30];
	assign x31_out = a6_wr[31];
	assign x32_out = a6_wr[32];
	assign x33_out = a6_wr[33];
	assign x34_out = a6_wr[34];
	assign x35_out = a6_wr[35];
	assign x36_out = a6_wr[36];
	assign x37_out = a6_wr[37];
	assign x38_out = a6_wr[38];
	assign x39_out = a6_wr[39];
	assign x40_out = a6_wr[40];
	assign x41_out = a6_wr[41];
	assign x42_out = a6_wr[42];
	assign x43_out = a6_wr[43];
	assign x44_out = a6_wr[44];
	assign x45_out = a6_wr[45];
	assign x46_out = a6_wr[46];
	assign x47_out = a6_wr[47];
	assign x48_out = a6_wr[48];
	assign x49_out = a6_wr[49];
	assign x50_out = a6_wr[50];
	assign x51_out = a6_wr[51];
	assign x52_out = a6_wr[52];
	assign x53_out = a6_wr[53];
	assign x54_out = a6_wr[54];
	assign x55_out = a6_wr[55];
	assign x56_out = a6_wr[56];
	assign x57_out = a6_wr[57];
	assign x58_out = a6_wr[58];
	assign x59_out = a6_wr[59];
	assign x60_out = a6_wr[60];
	assign x61_out = a6_wr[61];
	assign x62_out = a6_wr[62];
	assign x63_out = a6_wr[63];

			
		//--- output stage (bit reversal)
			// assign x0_out       = a6_wr[0];                    
			// assign x1_out       = a6_wr[32];                   
			// assign x2_out       = a6_wr[16];                   
			// assign x3_out       = a6_wr[48];                   
			// assign x4_out       = a6_wr[8];                    
			// assign x5_out       = a6_wr[40];                   
			// assign x6_out       = a6_wr[24];                   
			// assign x7_out       = a6_wr[56];                   
			// assign x8_out       = a6_wr[4];                    
			// assign x9_out       = a6_wr[36];                   
			// assign x10_out      = a6_wr[20];                   
			// assign x11_out      = a6_wr[52];                   
			// assign x12_out      = a6_wr[12];                   
			// assign x13_out      = a6_wr[44];                   
			// assign x14_out      = a6_wr[28];                   
			// assign x15_out      = a6_wr[60];                   
			// assign x16_out      = a6_wr[2];                    
			// assign x17_out      = a6_wr[34];                   
			// assign x18_out      = a6_wr[18];                   
			// assign x19_out      = a6_wr[50];                   
			// assign x20_out      = a6_wr[10];                   
			// assign x21_out      = a6_wr[42];                   
			// assign x22_out      = a6_wr[26];                   
			// assign x23_out      = a6_wr[58];                   
			// assign x24_out      = a6_wr[6];                    
			// assign x25_out      = a6_wr[38];                   
			// assign x26_out      = a6_wr[22];                   
			// assign x27_out      = a6_wr[54];                   
			// assign x28_out      = a6_wr[14];                   
			// assign x29_out      = a6_wr[46];                   
			// assign x30_out      = a6_wr[30];                   
			// assign x31_out      = a6_wr[62];                   
			// assign x32_out      = a6_wr[1];                    
			// assign x33_out      = a6_wr[33];                   
			// assign x34_out      = a6_wr[17];                   
			// assign x35_out      = a6_wr[49];                   
			// assign x36_out      = a6_wr[9];                    
			// assign x37_out      = a6_wr[41];                   
			// assign x38_out      = a6_wr[25];                   
			// assign x39_out      = a6_wr[57];                   
			// assign x40_out      = a6_wr[5];                    
			// assign x41_out      = a6_wr[37];                   
			// assign x42_out      = a6_wr[21];                   
			// assign x43_out      = a6_wr[53];                   
			// assign x44_out      = a6_wr[13];                   
			// assign x45_out      = a6_wr[45];                   
			// assign x46_out      = a6_wr[29];                   
			// assign x47_out      = a6_wr[61];                   
			// assign x48_out      = a6_wr[3];                    
			// assign x49_out      = a6_wr[35];                   
			// assign x50_out      = a6_wr[19];                   
			// assign x51_out      = a6_wr[51];                   
			// assign x52_out      = a6_wr[11];                   
			// assign x53_out      = a6_wr[43];                   
			// assign x54_out      = a6_wr[27];                   
			// assign x55_out      = a6_wr[59];                   
			// assign x56_out      = a6_wr[7];                    
			// assign x57_out      = a6_wr[39];                   
			// assign x58_out      = a6_wr[23];                   
			// assign x59_out      = a6_wr[55];                   
			// assign x60_out      = a6_wr[15];                   
			// assign x61_out      = a6_wr[47];                   
			// assign x62_out      = a6_wr[31];                   
			// assign x63_out      = a6_wr[63];                   


endmodule
