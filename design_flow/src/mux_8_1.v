module mux_8_1
#(
	parameter width = 24*2,
	parameter width_group = 24*16
)
(
	input	[2:0]		sel0,
	input	[width_group-1:0]	in0,
	output	[width-1:0]			out0
);

	assign out0 = (sel0 == 3'b0) ? in0[width-1:0] : 
					((sel0 == 3'd1) ? in0[2*width-1:width] : 
					((sel0 == 3'd2) ? in0[3*width-1:2*width] : 
					((sel0 == 3'd3) ? in0[4*width-1:3*width] : 
					((sel0 == 3'd4) ? in0[5*width-1:4*width] :
					((sel0 == 3'd5) ? in0[6*width-1:5*width] :
					((sel0 == 3'd6) ? in0[7*width-1:6*width] : in0[8*width-1:7*width]))))));
	
endmodule

