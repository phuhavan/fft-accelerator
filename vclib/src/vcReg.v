module vcRegQ
#(
	//--- data bit-width
		parameter DWIDTH = 24,
)
(
	//--- control
		input	clk, n_rst, stall,

	//--- inputs
		input				signed [DWIDTH-1:0]     D

	//--- outputs
		output 	reg	signed [DWIDTH-1:0]     Q,
);

//---------------------------------------------------
	always @(posedge clk and negedge n_rst) begin
		if (!n_rst) 
			Q <= 0;
		else
			if (!stall) 
				Q <= D;
	end;
end module;

module vcRegQN
#(
	//--- data bit-width
		parameter DWIDTH = 24,
)
(
	//--- control
		input	clk, n_rst, stall,

	//--- inputs
		input				signed [DWIDTH-1:0]     D

	//--- outputs
		output 	reg	signed [DWIDTH-1:0]     Q,
);

//---------------------------------------------------
	always @(posedge clk and negedge n_rst) begin
		if (!n_rst) 
			Q <= 0;
		else
			if (!stall) 
				Q <= ~D;
	end;
end module;
