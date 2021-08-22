`include "macros.h"

module fft4
#(
		//--- data bit-width
			parameter width = 24,
		//--- fft size
			parameter size=4
)
(
		//--- control
			input                   clk, rst, stall,              
		//--- inputs
			input    [width-1:0]    x0_in,                        
			input    [width-1:0]    x1_in,                        
			input    [width-1:0]    x2_in,                        
			input    [width-1:0]    x3_in,                        
		//--- outputs
			output                  stall_out,                    
			output   [width-1:0]    x0_out,                       
			output   [width-1:0]    x1_out,                       
			output   [width-1:0]    x2_out,                       
			output   [width-1:0]    x3_out                        
);

		//--- signal definition
			wire  [width-1:0]        coef[size-1:0];

			reg   [width-1:0]        a0_wr[size-1:0];
			wire  [width-1:0]        a1_wr[size-1:0];
			wire  [width-1:0]        a2_wr[size-1:0];
			wire                     comb_stall;

		//--- cofficient assignment
			assign coef[0] =    {12'b011111111111, 12'b000000000000};
			assign coef[1] =    {12'b000000000000, 12'b100000000001};

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
				end
				else begin
					if (!stall) begin
						a0_wr[0]      <= x0_in;                       
						a0_wr[1]      <= x1_in;                       
						a0_wr[2]      <= x2_in;                       
						a0_wr[3]      <= x3_in;                       
					end
				end
			end

		//--- radix stage 0
			radix2 #(.width(width)) rd_st0_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[0]), .rdlo_in(a0_wr[2]),  .coef_in(coef[0]), .rdup_out(a1_wr[0]), .rdlo_out(a1_wr[2]));
			radix2 #(.width(width)) rd_st0_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[1]), .rdlo_in(a0_wr[3]),  .coef_in(coef[1]), .rdup_out(a1_wr[1]), .rdlo_out(a1_wr[3]));

		//--- radix stage 1
			radix2 #(.width(width)) rd_st1_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[0]), .rdlo_in(a1_wr[1]),  .coef_in(coef[0]), .rdup_out(a2_wr[0]), .rdlo_out(a2_wr[1]));
			radix2 #(.width(width)) rd_st1_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[2]), .rdlo_in(a1_wr[3]),  .coef_in(coef[0]), .rdup_out(a2_wr[2]), .rdlo_out(a2_wr[3]));


	assign x0_out = a2_wr[0];
	assign x1_out = a2_wr[1];
	assign x2_out = a2_wr[2];
	assign x3_out = a2_wr[3];

			
		//--- output stage (bit reversal)
			// assign x0_out       = a2_wr[0];                    
			// assign x1_out       = a2_wr[2];                    
			// assign x2_out       = a2_wr[1];                    
			// assign x3_out       = a2_wr[3];                    


endmodule
