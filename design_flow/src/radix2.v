//=====================================================
//
//=====================================================
module scaled_add
#(
	//--- data bit-width
		parameter width = 12
)
(
	//--- input signeds
		input signed			[width-1:0]   a,
		input signed			[width-1:0]   b,
	//--- output signeds
		output signed 			[width-1:0]   out
);
		wire signed [width:0] 	se_a;
		wire signed [width:0] 	se_b;
		wire signed [width:0] 	se_out;
 
		assign se_a   = a[width-1:0];			// automated signed extension
		assign se_b   = b[width-1:0];			// automated signed extension

		assign se_out = a + b;

		assign out = se_out[width:1];
endmodule

//=====================================================
//
//=====================================================
module scaled_sub
#(
	//--- data bit-width
		parameter width = 12
)
(
	//--- input signeds
		input signed			[width-1:0]   a,
		input signed			[width-1:0]   b,
	//--- output signeds
		output signed 			[width-1:0]   out
);
		wire signed [width:0] 	se_a;
		wire signed [width:0] 	se_b;
		wire signed [width:0] 	se_out;
 
		assign se_a   = a[width-1:0];					// automated signed extension
		assign se_b   = b[width-1:0];

		assign se_out = a - b;

		assign out = se_out[width:1];
endmodule

//=====================================================
//
//=====================================================
module unscaled_mult
#(
	//--- data bit-width
		parameter width = 12
)
(
	//--- input signeds
		input signed			[width-1:0]     		a,
		input signed			[width-1:0]     		b,
	//--- output signeds
		output signed 			[2*width-1:0]    	out
);
		localparam width_X2 = width*2;

		wire signed [width-1:0] 		se_a;
		wire signed [width-1:0] 		se_b;
	
		assign se_a 		= a;
		assign se_b 		= b;
		assign out 			= se_a * se_b;

endmodule

//=====================================================
//
//=====================================================
module radix2
#(
	//--- data bit-width
		parameter width = 24
)
(
	//--- control
		input                		clk, rst, stall,

	//--- input signeds
		input signed			[width-1:0]     rdup_in,
		input signed			[width-1:0]     rdlo_in,
		input signed 			[width-1:0]		coef_in,

	//--- output signeds
		output reg	signed		[width-1:0]		rdup_out,
		output reg	signed		[width-1:0]     rdlo_out
);

//======================================	
	localparam width_div2  =  width/2;			

	wire  signed [width_div2-1:0] 		sc_add_re_wr,	sc_add_im_wr;					// sc_ = scaling down
	wire  signed [width_div2-1:0] 		sc_sub_re_wr,	sc_sub_im_wr;

	wire  signed [width_div2-1:0]		ue_coef_re_wr, 	ue_coef_im_wr;					// ue_ = NON-signed extension

	wire  signed [width-1:0] 			ue_m_rr_wr, ue_m_ii_wr, ue_m_ri_wr, ue_m_ir_wr;
	wire  signed [width-1:0] 			ue_mult_re_wr,	ue_mult_im_wr;
	wire  signed [width_div2-1:0] 		sc_mult_re_wr,	sc_mult_im_wr;

//======================================
	//--- upper branch of radix-2
		scaled_add #(.width(width_div2)) add_re  (.a(rdup_in[width-1:width_div2]), .b(rdlo_in[ width-1:width_div2]), .out(sc_add_re_wr));
		scaled_add #(.width(width_div2)) add_im (.a(rdup_in[width_div2-1:    0]),    .b(rdlo_in[width_div2-1:     0]),    .out(sc_add_im_wr));

	//--- lower branch of radix-2
		// substraction
			scaled_sub #(.width(width_div2)) sub_re (.a(rdup_in[ width-1:width_div2]), .b(rdlo_in[ width-1:width_div2]), .out(sc_sub_re_wr));
			scaled_sub #(.width(width_div2)) sub_im (.a(rdup_in[width_div2-1:     0]), .b(rdlo_in[width_div2-1:     0]), .out(sc_sub_im_wr));

		// complex multiplication
			assign  ue_coef_re_wr  	= coef_in[ width-1:width_div2];
			assign  ue_coef_im_wr  	= coef_in[width_div2-1:     0];

			unscaled_mult #(.width(width_div2)) mult_rr	(.a(sc_sub_re_wr), .b(ue_coef_re_wr), .out(ue_m_rr_wr));
			unscaled_mult #(.width(width_div2)) mult_ii	(.a(sc_sub_im_wr), .b(ue_coef_im_wr), .out(ue_m_ii_wr));
			unscaled_mult #(.width(width_div2)) mult_ri	(.a(sc_sub_re_wr), .b(ue_coef_im_wr), .out(ue_m_ri_wr));
			unscaled_mult #(.width(width_div2)) mult_ir	(.a(sc_sub_im_wr), .b(ue_coef_re_wr), .out(ue_m_ir_wr));

			assign  ue_mult_re_wr 	= (ue_m_rr_wr - ue_m_ii_wr);
			assign  ue_mult_im_wr 	= (ue_m_ri_wr + ue_m_ir_wr);

		// scaling output signed
			// unscaled multiplier's output signed (overflow, but simple hardware)		
				//assign  sc_mult_re_wr = ue_mult_re_wr[width_div2-1:0];
				//assign  sc_mult_im_wr = ue_mult_im_wr[width_div2-1:0];

			// scaled multiplier's output signed by factor of 2 (no-overflow)
				assign  sc_mult_re_wr = {ue_mult_re_wr[width-1], ue_mult_re_wr[width-4:width_div2-2]};
				assign  sc_mult_im_wr = {ue_mult_im_wr[width-1], ue_mult_im_wr[width-4:width_div2-2]};

	//--- reg out
		always @(posedge clk or posedge rst) begin
			if (rst)	begin
				rdup_out <= 0;
				rdlo_out   <= 0;
			end 
			else begin
				if (!stall) begin
					rdup_out  <= {sc_add_re_wr,  sc_add_im_wr};
					rdlo_out   <= {sc_mult_re_wr, sc_mult_im_wr};
				end
			end			
		end
endmodule
