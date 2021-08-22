`include "macros.h"

`timescale  1ns/10ps

module vcClockGen
#(
	parameter clockperiod = 10	// in ns
)
(
	output 						clk, n_clk, rst,
	output reg signed [31:0]	cur_cycle
);

reg			tmp_clk, tmp_rst;

// synopsys translate_off
	initial begin
		$display("==============================");
		$display("INFOR --- Clock period = %.3f ns", clockperiod);
		$display("==============================");
		
		tmp_rst			= 1;
		tmp_clk		= 0;
		cur_cycle	 	= 0;

		#(clockperiod*1.0)
			tmp_rst		= 0;
	end

	always #(clockperiod/2) tmp_clk = ~tmp_clk;

	assign clk 		= tmp_clk;
	assign n_clk	= ~ tmp_clk;
	assign rst		= tmp_rst;

	always @(posedge tmp_clk)  begin
		if (!rst) 
			cur_cycle <= cur_cycle + 1;
	end
// synopsys translate_off

endmodule