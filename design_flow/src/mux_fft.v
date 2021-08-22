module mux_fft
#(
	parameter width = 24
)
(
	input				sel0,
	input	[width-1:0]	in0,
	input	[width-1:0]	in1,
	output	[width-1:0]	out0
);

	assign out0 =  (sel0) ? in0 : in1;
	
endmodule

