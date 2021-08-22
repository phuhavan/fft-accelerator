`include "macros.h"

module fft2
#(
		//--- data bit-width
			parameter width = 24,
		//--- fft size
			parameter size=2
)
(
		//--- control
			input                   clk, rst, stall,              
		//--- inputs
			input    [width-1:0]    x0_in,                        
			input    [width-1:0]    x1_in,                        
		//--- outputs
			output                  stall_out,                    
			output   [width-1:0]    x0_out,                       
			output   [width-1:0]    x1_out                        
);

		//--- signal definition
			wire  [width-1:0]        coef[size-1:0];

			reg   [width-1:0]        a0_wr[size-1:0];
			wire  [width-1:0]        a1_wr[size-1:0];
			wire                     comb_stall;

		//--- cofficient assignment
			assign coef[0] =    {12'b011111111111, 12'b000000000000};

		//--- fifo stage
			localparam depth=`LOG2(size);
			fifo #(.depth(depth)) inst_fifo(.clk(clk), .rst(rst), .stall_in(stall), .stall_out(stall_out));

			assign comb_stall = stall_out & stall;

		//--- input stage
			always @(posedge clk or posedge rst) begin
				if (rst) begin
					a0_wr[0]       <= 0;                           
					a0_wr[1]       <= 0;                           
				end
				else begin
					if (!stall) begin
						a0_wr[0]      <= x0_in;                       
						a0_wr[1]      <= x1_in;                       
					end
				end
			end

		//--- radix stage 0
			radix2 #(.width(width)) rd_st0_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[0]), .rdlo_in(a0_wr[1]),  .coef_in(coef[0]), .rdup_out(a1_wr[0]), .rdlo_out(a1_wr[1]));

		//--- output stage (bit reversal)
			assign x0_out       = a1_wr[0];                    
			assign x1_out       = a1_wr[1];                    


endmodule
