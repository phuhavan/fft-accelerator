`include "macros.h"

module fft32
#(
		//--- data bit-width
			parameter width = 24,
		//--- fft size
			parameter size=32
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
			output   [width-1:0]    x31_out                       
);

		//--- signal definition
			wire  [width-1:0]        coef[size-1:0];

			reg   [width-1:0]        a0_wr[size-1:0];
			wire  [width-1:0]        a1_wr[size-1:0];
			wire  [width-1:0]        a2_wr[size-1:0];
			wire  [width-1:0]        a3_wr[size-1:0];
			wire  [width-1:0]        a4_wr[size-1:0];
			wire  [width-1:0]        a5_wr[size-1:0];
			wire                     comb_stall;

		//--- cofficient assignment
			assign coef[0] =    {12'b011111111111, 12'b000000000000};
			assign coef[1] =    {12'b011111011000, 12'b111001110001};
			assign coef[2] =    {12'b011101100011, 12'b110011110001};
			assign coef[3] =    {12'b011010100110, 12'b101110001111};
			assign coef[4] =    {12'b010110100111, 12'b101001011001};
			assign coef[5] =    {12'b010001110001, 12'b100101011010};
			assign coef[6] =    {12'b001100001111, 12'b100010011101};
			assign coef[7] =    {12'b000110001111, 12'b100000101000};
			assign coef[8] =    {12'b000000000000, 12'b100000000001};
			assign coef[9] =    {12'b111001110001, 12'b100000101000};
			assign coef[10] =   {12'b110011110001, 12'b100010011101};
			assign coef[11] =   {12'b101110001111, 12'b100101011010};
			assign coef[12] =   {12'b101001011001, 12'b101001011001};
			assign coef[13] =   {12'b100101011010, 12'b101110001111};
			assign coef[14] =   {12'b100010011101, 12'b110011110001};
			assign coef[15] =   {12'b100000101000, 12'b111001110001};

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
					end
				end
			end

		//--- radix stage 0
			radix2 #(.width(width)) rd_st0_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[0]), .rdlo_in(a0_wr[16]),  .coef_in(coef[0]), .rdup_out(a1_wr[0]), .rdlo_out(a1_wr[16]));
			radix2 #(.width(width)) rd_st0_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[1]), .rdlo_in(a0_wr[17]),  .coef_in(coef[1]), .rdup_out(a1_wr[1]), .rdlo_out(a1_wr[17]));
			radix2 #(.width(width)) rd_st0_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[2]), .rdlo_in(a0_wr[18]),  .coef_in(coef[2]), .rdup_out(a1_wr[2]), .rdlo_out(a1_wr[18]));
			radix2 #(.width(width)) rd_st0_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[3]), .rdlo_in(a0_wr[19]),  .coef_in(coef[3]), .rdup_out(a1_wr[3]), .rdlo_out(a1_wr[19]));
			radix2 #(.width(width)) rd_st0_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[4]), .rdlo_in(a0_wr[20]),  .coef_in(coef[4]), .rdup_out(a1_wr[4]), .rdlo_out(a1_wr[20]));
			radix2 #(.width(width)) rd_st0_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[5]), .rdlo_in(a0_wr[21]),  .coef_in(coef[5]), .rdup_out(a1_wr[5]), .rdlo_out(a1_wr[21]));
			radix2 #(.width(width)) rd_st0_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[6]), .rdlo_in(a0_wr[22]),  .coef_in(coef[6]), .rdup_out(a1_wr[6]), .rdlo_out(a1_wr[22]));
			radix2 #(.width(width)) rd_st0_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[7]), .rdlo_in(a0_wr[23]),  .coef_in(coef[7]), .rdup_out(a1_wr[7]), .rdlo_out(a1_wr[23]));
			radix2 #(.width(width)) rd_st0_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[8]), .rdlo_in(a0_wr[24]),  .coef_in(coef[8]), .rdup_out(a1_wr[8]), .rdlo_out(a1_wr[24]));
			radix2 #(.width(width)) rd_st0_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[9]), .rdlo_in(a0_wr[25]),  .coef_in(coef[9]), .rdup_out(a1_wr[9]), .rdlo_out(a1_wr[25]));
			radix2 #(.width(width)) rd_st0_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[10]), .rdlo_in(a0_wr[26]),  .coef_in(coef[10]), .rdup_out(a1_wr[10]), .rdlo_out(a1_wr[26]));
			radix2 #(.width(width)) rd_st0_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[11]), .rdlo_in(a0_wr[27]),  .coef_in(coef[11]), .rdup_out(a1_wr[11]), .rdlo_out(a1_wr[27]));
			radix2 #(.width(width)) rd_st0_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[12]), .rdlo_in(a0_wr[28]),  .coef_in(coef[12]), .rdup_out(a1_wr[12]), .rdlo_out(a1_wr[28]));
			radix2 #(.width(width)) rd_st0_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[13]), .rdlo_in(a0_wr[29]),  .coef_in(coef[13]), .rdup_out(a1_wr[13]), .rdlo_out(a1_wr[29]));
			radix2 #(.width(width)) rd_st0_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[14]), .rdlo_in(a0_wr[30]),  .coef_in(coef[14]), .rdup_out(a1_wr[14]), .rdlo_out(a1_wr[30]));
			radix2 #(.width(width)) rd_st0_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[15]), .rdlo_in(a0_wr[31]),  .coef_in(coef[15]), .rdup_out(a1_wr[15]), .rdlo_out(a1_wr[31]));

		//--- radix stage 1
			radix2 #(.width(width)) rd_st1_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[0]), .rdlo_in(a1_wr[8]),  .coef_in(coef[0]), .rdup_out(a2_wr[0]), .rdlo_out(a2_wr[8]));
			radix2 #(.width(width)) rd_st1_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[1]), .rdlo_in(a1_wr[9]),  .coef_in(coef[2]), .rdup_out(a2_wr[1]), .rdlo_out(a2_wr[9]));
			radix2 #(.width(width)) rd_st1_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[2]), .rdlo_in(a1_wr[10]),  .coef_in(coef[4]), .rdup_out(a2_wr[2]), .rdlo_out(a2_wr[10]));
			radix2 #(.width(width)) rd_st1_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[3]), .rdlo_in(a1_wr[11]),  .coef_in(coef[6]), .rdup_out(a2_wr[3]), .rdlo_out(a2_wr[11]));
			radix2 #(.width(width)) rd_st1_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[4]), .rdlo_in(a1_wr[12]),  .coef_in(coef[8]), .rdup_out(a2_wr[4]), .rdlo_out(a2_wr[12]));
			radix2 #(.width(width)) rd_st1_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[5]), .rdlo_in(a1_wr[13]),  .coef_in(coef[10]), .rdup_out(a2_wr[5]), .rdlo_out(a2_wr[13]));
			radix2 #(.width(width)) rd_st1_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[6]), .rdlo_in(a1_wr[14]),  .coef_in(coef[12]), .rdup_out(a2_wr[6]), .rdlo_out(a2_wr[14]));
			radix2 #(.width(width)) rd_st1_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[7]), .rdlo_in(a1_wr[15]),  .coef_in(coef[14]), .rdup_out(a2_wr[7]), .rdlo_out(a2_wr[15]));
			radix2 #(.width(width)) rd_st1_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[16]), .rdlo_in(a1_wr[24]),  .coef_in(coef[0]), .rdup_out(a2_wr[16]), .rdlo_out(a2_wr[24]));
			radix2 #(.width(width)) rd_st1_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[17]), .rdlo_in(a1_wr[25]),  .coef_in(coef[2]), .rdup_out(a2_wr[17]), .rdlo_out(a2_wr[25]));
			radix2 #(.width(width)) rd_st1_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[18]), .rdlo_in(a1_wr[26]),  .coef_in(coef[4]), .rdup_out(a2_wr[18]), .rdlo_out(a2_wr[26]));
			radix2 #(.width(width)) rd_st1_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[19]), .rdlo_in(a1_wr[27]),  .coef_in(coef[6]), .rdup_out(a2_wr[19]), .rdlo_out(a2_wr[27]));
			radix2 #(.width(width)) rd_st1_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[20]), .rdlo_in(a1_wr[28]),  .coef_in(coef[8]), .rdup_out(a2_wr[20]), .rdlo_out(a2_wr[28]));
			radix2 #(.width(width)) rd_st1_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[21]), .rdlo_in(a1_wr[29]),  .coef_in(coef[10]), .rdup_out(a2_wr[21]), .rdlo_out(a2_wr[29]));
			radix2 #(.width(width)) rd_st1_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[22]), .rdlo_in(a1_wr[30]),  .coef_in(coef[12]), .rdup_out(a2_wr[22]), .rdlo_out(a2_wr[30]));
			radix2 #(.width(width)) rd_st1_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[23]), .rdlo_in(a1_wr[31]),  .coef_in(coef[14]), .rdup_out(a2_wr[23]), .rdlo_out(a2_wr[31]));

		//--- radix stage 2
			radix2 #(.width(width)) rd_st2_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[0]), .rdlo_in(a2_wr[4]),  .coef_in(coef[0]), .rdup_out(a3_wr[0]), .rdlo_out(a3_wr[4]));
			radix2 #(.width(width)) rd_st2_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[1]), .rdlo_in(a2_wr[5]),  .coef_in(coef[4]), .rdup_out(a3_wr[1]), .rdlo_out(a3_wr[5]));
			radix2 #(.width(width)) rd_st2_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[2]), .rdlo_in(a2_wr[6]),  .coef_in(coef[8]), .rdup_out(a3_wr[2]), .rdlo_out(a3_wr[6]));
			radix2 #(.width(width)) rd_st2_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[3]), .rdlo_in(a2_wr[7]),  .coef_in(coef[12]), .rdup_out(a3_wr[3]), .rdlo_out(a3_wr[7]));
			radix2 #(.width(width)) rd_st2_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[8]), .rdlo_in(a2_wr[12]),  .coef_in(coef[0]), .rdup_out(a3_wr[8]), .rdlo_out(a3_wr[12]));
			radix2 #(.width(width)) rd_st2_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[9]), .rdlo_in(a2_wr[13]),  .coef_in(coef[4]), .rdup_out(a3_wr[9]), .rdlo_out(a3_wr[13]));
			radix2 #(.width(width)) rd_st2_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[10]), .rdlo_in(a2_wr[14]),  .coef_in(coef[8]), .rdup_out(a3_wr[10]), .rdlo_out(a3_wr[14]));
			radix2 #(.width(width)) rd_st2_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[11]), .rdlo_in(a2_wr[15]),  .coef_in(coef[12]), .rdup_out(a3_wr[11]), .rdlo_out(a3_wr[15]));
			radix2 #(.width(width)) rd_st2_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[16]), .rdlo_in(a2_wr[20]),  .coef_in(coef[0]), .rdup_out(a3_wr[16]), .rdlo_out(a3_wr[20]));
			radix2 #(.width(width)) rd_st2_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[17]), .rdlo_in(a2_wr[21]),  .coef_in(coef[4]), .rdup_out(a3_wr[17]), .rdlo_out(a3_wr[21]));
			radix2 #(.width(width)) rd_st2_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[18]), .rdlo_in(a2_wr[22]),  .coef_in(coef[8]), .rdup_out(a3_wr[18]), .rdlo_out(a3_wr[22]));
			radix2 #(.width(width)) rd_st2_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[19]), .rdlo_in(a2_wr[23]),  .coef_in(coef[12]), .rdup_out(a3_wr[19]), .rdlo_out(a3_wr[23]));
			radix2 #(.width(width)) rd_st2_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[24]), .rdlo_in(a2_wr[28]),  .coef_in(coef[0]), .rdup_out(a3_wr[24]), .rdlo_out(a3_wr[28]));
			radix2 #(.width(width)) rd_st2_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[25]), .rdlo_in(a2_wr[29]),  .coef_in(coef[4]), .rdup_out(a3_wr[25]), .rdlo_out(a3_wr[29]));
			radix2 #(.width(width)) rd_st2_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[26]), .rdlo_in(a2_wr[30]),  .coef_in(coef[8]), .rdup_out(a3_wr[26]), .rdlo_out(a3_wr[30]));
			radix2 #(.width(width)) rd_st2_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[27]), .rdlo_in(a2_wr[31]),  .coef_in(coef[12]), .rdup_out(a3_wr[27]), .rdlo_out(a3_wr[31]));

		//--- radix stage 3
			radix2 #(.width(width)) rd_st3_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[0]), .rdlo_in(a3_wr[2]),  .coef_in(coef[0]), .rdup_out(a4_wr[0]), .rdlo_out(a4_wr[2]));
			radix2 #(.width(width)) rd_st3_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[1]), .rdlo_in(a3_wr[3]),  .coef_in(coef[8]), .rdup_out(a4_wr[1]), .rdlo_out(a4_wr[3]));
			radix2 #(.width(width)) rd_st3_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[4]), .rdlo_in(a3_wr[6]),  .coef_in(coef[0]), .rdup_out(a4_wr[4]), .rdlo_out(a4_wr[6]));
			radix2 #(.width(width)) rd_st3_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[5]), .rdlo_in(a3_wr[7]),  .coef_in(coef[8]), .rdup_out(a4_wr[5]), .rdlo_out(a4_wr[7]));
			radix2 #(.width(width)) rd_st3_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[8]), .rdlo_in(a3_wr[10]),  .coef_in(coef[0]), .rdup_out(a4_wr[8]), .rdlo_out(a4_wr[10]));
			radix2 #(.width(width)) rd_st3_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[9]), .rdlo_in(a3_wr[11]),  .coef_in(coef[8]), .rdup_out(a4_wr[9]), .rdlo_out(a4_wr[11]));
			radix2 #(.width(width)) rd_st3_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[12]), .rdlo_in(a3_wr[14]),  .coef_in(coef[0]), .rdup_out(a4_wr[12]), .rdlo_out(a4_wr[14]));
			radix2 #(.width(width)) rd_st3_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[13]), .rdlo_in(a3_wr[15]),  .coef_in(coef[8]), .rdup_out(a4_wr[13]), .rdlo_out(a4_wr[15]));
			radix2 #(.width(width)) rd_st3_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[16]), .rdlo_in(a3_wr[18]),  .coef_in(coef[0]), .rdup_out(a4_wr[16]), .rdlo_out(a4_wr[18]));
			radix2 #(.width(width)) rd_st3_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[17]), .rdlo_in(a3_wr[19]),  .coef_in(coef[8]), .rdup_out(a4_wr[17]), .rdlo_out(a4_wr[19]));
			radix2 #(.width(width)) rd_st3_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[20]), .rdlo_in(a3_wr[22]),  .coef_in(coef[0]), .rdup_out(a4_wr[20]), .rdlo_out(a4_wr[22]));
			radix2 #(.width(width)) rd_st3_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[21]), .rdlo_in(a3_wr[23]),  .coef_in(coef[8]), .rdup_out(a4_wr[21]), .rdlo_out(a4_wr[23]));
			radix2 #(.width(width)) rd_st3_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[24]), .rdlo_in(a3_wr[26]),  .coef_in(coef[0]), .rdup_out(a4_wr[24]), .rdlo_out(a4_wr[26]));
			radix2 #(.width(width)) rd_st3_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[25]), .rdlo_in(a3_wr[27]),  .coef_in(coef[8]), .rdup_out(a4_wr[25]), .rdlo_out(a4_wr[27]));
			radix2 #(.width(width)) rd_st3_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[28]), .rdlo_in(a3_wr[30]),  .coef_in(coef[0]), .rdup_out(a4_wr[28]), .rdlo_out(a4_wr[30]));
			radix2 #(.width(width)) rd_st3_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[29]), .rdlo_in(a3_wr[31]),  .coef_in(coef[8]), .rdup_out(a4_wr[29]), .rdlo_out(a4_wr[31]));

		//--- radix stage 4
			radix2 #(.width(width)) rd_st4_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[0]), .rdlo_in(a4_wr[1]),  .coef_in(coef[0]), .rdup_out(a5_wr[0]), .rdlo_out(a5_wr[1]));
			radix2 #(.width(width)) rd_st4_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[2]), .rdlo_in(a4_wr[3]),  .coef_in(coef[0]), .rdup_out(a5_wr[2]), .rdlo_out(a5_wr[3]));
			radix2 #(.width(width)) rd_st4_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[4]), .rdlo_in(a4_wr[5]),  .coef_in(coef[0]), .rdup_out(a5_wr[4]), .rdlo_out(a5_wr[5]));
			radix2 #(.width(width)) rd_st4_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[6]), .rdlo_in(a4_wr[7]),  .coef_in(coef[0]), .rdup_out(a5_wr[6]), .rdlo_out(a5_wr[7]));
			radix2 #(.width(width)) rd_st4_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[8]), .rdlo_in(a4_wr[9]),  .coef_in(coef[0]), .rdup_out(a5_wr[8]), .rdlo_out(a5_wr[9]));
			radix2 #(.width(width)) rd_st4_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[10]), .rdlo_in(a4_wr[11]),  .coef_in(coef[0]), .rdup_out(a5_wr[10]), .rdlo_out(a5_wr[11]));
			radix2 #(.width(width)) rd_st4_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[12]), .rdlo_in(a4_wr[13]),  .coef_in(coef[0]), .rdup_out(a5_wr[12]), .rdlo_out(a5_wr[13]));
			radix2 #(.width(width)) rd_st4_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[14]), .rdlo_in(a4_wr[15]),  .coef_in(coef[0]), .rdup_out(a5_wr[14]), .rdlo_out(a5_wr[15]));
			radix2 #(.width(width)) rd_st4_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[16]), .rdlo_in(a4_wr[17]),  .coef_in(coef[0]), .rdup_out(a5_wr[16]), .rdlo_out(a5_wr[17]));
			radix2 #(.width(width)) rd_st4_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[18]), .rdlo_in(a4_wr[19]),  .coef_in(coef[0]), .rdup_out(a5_wr[18]), .rdlo_out(a5_wr[19]));
			radix2 #(.width(width)) rd_st4_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[20]), .rdlo_in(a4_wr[21]),  .coef_in(coef[0]), .rdup_out(a5_wr[20]), .rdlo_out(a5_wr[21]));
			radix2 #(.width(width)) rd_st4_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[22]), .rdlo_in(a4_wr[23]),  .coef_in(coef[0]), .rdup_out(a5_wr[22]), .rdlo_out(a5_wr[23]));
			radix2 #(.width(width)) rd_st4_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[24]), .rdlo_in(a4_wr[25]),  .coef_in(coef[0]), .rdup_out(a5_wr[24]), .rdlo_out(a5_wr[25]));
			radix2 #(.width(width)) rd_st4_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[26]), .rdlo_in(a4_wr[27]),  .coef_in(coef[0]), .rdup_out(a5_wr[26]), .rdlo_out(a5_wr[27]));
			radix2 #(.width(width)) rd_st4_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[28]), .rdlo_in(a4_wr[29]),  .coef_in(coef[0]), .rdup_out(a5_wr[28]), .rdlo_out(a5_wr[29]));
			radix2 #(.width(width)) rd_st4_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[30]), .rdlo_in(a4_wr[31]),  .coef_in(coef[0]), .rdup_out(a5_wr[30]), .rdlo_out(a5_wr[31]));


	assign x0_out = a5_wr[0];
	assign x1_out = a5_wr[1];
	assign x2_out = a5_wr[2];
	assign x3_out = a5_wr[3];
	assign x4_out = a5_wr[4];
	assign x5_out = a5_wr[5];
	assign x6_out = a5_wr[6];
	assign x7_out = a5_wr[7];
	assign x8_out = a5_wr[8];
	assign x9_out = a5_wr[9];
	assign x10_out = a5_wr[10];
	assign x11_out = a5_wr[11];
	assign x12_out = a5_wr[12];
	assign x13_out = a5_wr[13];
	assign x14_out = a5_wr[14];
	assign x15_out = a5_wr[15];
	assign x16_out = a5_wr[16];
	assign x17_out = a5_wr[17];
	assign x18_out = a5_wr[18];
	assign x19_out = a5_wr[19];
	assign x20_out = a5_wr[20];
	assign x21_out = a5_wr[21];
	assign x22_out = a5_wr[22];
	assign x23_out = a5_wr[23];
	assign x24_out = a5_wr[24];
	assign x25_out = a5_wr[25];
	assign x26_out = a5_wr[26];
	assign x27_out = a5_wr[27];
	assign x28_out = a5_wr[28];
	assign x29_out = a5_wr[29];
	assign x30_out = a5_wr[30];
	assign x31_out = a5_wr[31];

			
		//--- output stage (bit reversal)
			// assign x0_out       = a5_wr[0];                    
			// assign x1_out       = a5_wr[16];                   
			// assign x2_out       = a5_wr[8];                    
			// assign x3_out       = a5_wr[24];                   
			// assign x4_out       = a5_wr[4];                    
			// assign x5_out       = a5_wr[20];                   
			// assign x6_out       = a5_wr[12];                   
			// assign x7_out       = a5_wr[28];                   
			// assign x8_out       = a5_wr[2];                    
			// assign x9_out       = a5_wr[18];                   
			// assign x10_out      = a5_wr[10];                   
			// assign x11_out      = a5_wr[26];                   
			// assign x12_out      = a5_wr[6];                    
			// assign x13_out      = a5_wr[22];                   
			// assign x14_out      = a5_wr[14];                   
			// assign x15_out      = a5_wr[30];                   
			// assign x16_out      = a5_wr[1];                    
			// assign x17_out      = a5_wr[17];                   
			// assign x18_out      = a5_wr[9];                    
			// assign x19_out      = a5_wr[25];                   
			// assign x20_out      = a5_wr[5];                    
			// assign x21_out      = a5_wr[21];                   
			// assign x22_out      = a5_wr[13];                   
			// assign x23_out      = a5_wr[29];                   
			// assign x24_out      = a5_wr[3];                    
			// assign x25_out      = a5_wr[19];                   
			// assign x26_out      = a5_wr[11];                   
			// assign x27_out      = a5_wr[27];                   
			// assign x28_out      = a5_wr[7];                    
			// assign x29_out      = a5_wr[23];                   
			// assign x30_out      = a5_wr[15];                   
			// assign x31_out      = a5_wr[31];                   


endmodule
