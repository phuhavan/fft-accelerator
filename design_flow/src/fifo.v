module fifo
#(
	//--- fft depth
		parameter depth=4
)
(
	input       	clk,rst,
	input 		stall_in,
	output 		stall_out
);

	integer		i;
	reg 		next[depth-1:0];

	assign stall_out = next[depth-1];

	always @(posedge clk or posedge rst) 
	begin
		if  (rst)
			for (i=0; i<depth; i=i+1)
				next[i] <= 1;
		else 
		begin
			next[0] <= stall_in;
			for (i=1; i<depth; i=i+1)
				next[i] <= next[i-1]; 				
		end
	end

endmodule