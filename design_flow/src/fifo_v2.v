module fifo_v2
(
	input       	clk,rst, rst_fifo,
	input 	[6:0] 	shift_data,
	output 			stall_out
);
	reg [6:0] shift_reg;
	wire or_rst;

	assign stall_out = shift_reg[6];
	assign or_rst = rst || rst_fifo;

	
	always @ (posedge clk or posedge or_rst) begin
		if(or_rst) begin
			shift_reg <= shift_data;
		end
		else begin
			shift_reg[6:0] <= {shift_reg[5:0],1'b0};
		end
	end
	


endmodule