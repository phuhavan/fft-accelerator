module dmux_fft
#(
	parameter width = 24
)
(
	input				sel0,
	input	[width-1:0]	in0,
	output	[width-1:0]	out0,
	output	[width-1:0]	out1
);

	assign out0 =  (sel0) ? 0 : in0;
	assign out1 =  (sel0) ? in0 : 0;

endmodule

