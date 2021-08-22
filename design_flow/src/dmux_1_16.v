module dmux_1_16
#(
	parameter width = 1,
	parameter width_out = 16
)
(
	input	[3:0]		sel0,
	input	[width-1:0]	in0,
	input 	const_va,
	output 	[width_out-1:0] out0
);

	genvar i;

	generate 
		for(i=0;i<16;i=i+1) begin
			assign out0[(i+1)*width-1:i*width] = (sel0 == i) ? in0 : {width{const_va}};
		end
	endgenerate

	// assign out0[width-1:0] = (sel0 == 4'd0) in0 : {width{const_va}};
	// assign out0[2*width-1:width] = (sel0 == 4'd1) in0 : {width{const_va}};
	// assign out0[3*width-1:2*width] = (sel0 == 4'd2) in0 : {width{const_va}};
	// assign out0[4*width-1:3*width] = (sel0 == 4'd3) in0 : {width{const_va}};
	// assign out0[5*width-1:4*width] = (sel0 == 4'd4) in0 : {width{const_va}};
	// assign out0[6*width-1:5*width] = (sel0 == 4'd5) in0 : {width{const_va}};
	// assign out0[7*width-1:6*width] = (sel0 == 4'd6) in0 : {width{const_va}};
	// assign out0[8*width-1:7*width] = (sel0 == 4'd7) in0 : {width{const_va}};
	// assign out0[9*width-1:8*width] = (sel0 == 4'd8) in0 : {width{const_va}};
	// assign out0[10*width-1:9*width] = (sel0 == 4'd9) in0 : {width{const_va}};
	// assign out0[11*width-1:10*width] = (sel0 == 4'd10) in0 : {width{const_va}};
	// assign out0[12*width-1:11*width] = (sel0 == 4'd11) in0 : {width{const_va}};
	// assign out0[13*width-1:12*width] = (sel0 == 4'd12) in0 : {width{const_va}};
	// assign out0[14*width-1:13*width] = (sel0 == 4'd13) in0 : {width{const_va}};
	// assign out0[15*width-1:14*width] = (sel0 == 4'd14) in0 : {width{const_va}};


endmodule

