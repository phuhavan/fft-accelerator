module adder_nonpp
(
	//--- input signeds
		input signed			[11:0]   a0,
		input signed			[11:0]   b0,
		input signed			[11:0]   a1,
		input signed			[11:0]   b1,

	//--- output signeds
		output signed 			[11:0]   out0,
		output signed 			[11:0]   out1
);

		wire signed [12:0] 	se_a0, 	  se_a1;
		wire signed [12:0] 	se_b0, 	  se_b1;
		wire signed [12:0] 	se_out0, se_out1;
 
		assign se_a0   = a0[11:0];			// automated signed extension
		assign se_b0   = b0[11:0];			// automated signed extension
		assign se_out0 = a0 + b0;
		assign out0 = se_out0[12:1];

		assign se_a1   = a1[11:0];			// automated signed extension
		assign se_b1   = b1[11:0];			// automated signed extension
		assign se_out1 = a1 + b1;
		assign out1 = se_out1[12:1];
				
endmodule

module add_alu
(
	input		[7:0] 	a,
	input		[7:0] 	b,
	output		[7:0] 	out
);
	assign out = a + b;
endmodule // module

module sub_alu
(
	input		[7:0] 	a,
	input		[7:0] 	b,
	output		[7:0] 	out
);
	assign out = a - b;
endmodule // module

module and_alu
(
	input		[7:0] 	a,
	input		[7:0] 	b,
	output		[7:0] 	out
);
	assign out = a & b;
endmodule // module

module or_alu
(
	input		[7:0] 	a,
	input		[7:0] 	b,
	output		[7:0] 	out
);
	assign out = a | b;
endmodule // module


module alu
(
	input		[7:0] 	a,
	input		[7:0] 	b,
	input		[1:0] 	op,
	output	reg	[7:0] 	out
);

	wire		[4*8-1:0]	tmp_out;


	add_alu 	inst_add_alu(.a(a), .b(b), .out(tmp_out[31:24]));
	sub_alu 	inst_sub_alu(.a(a), .b(b), .out(tmp_out[23:16]));
	and_alu 	inst_and_alu(.a(a), .b(b), .out(tmp_out[15:8]));
	or_alu		inst_or_alu(.a(a), .b(b), .out(tmp_out[7:0]));

	//assign out = tmp_out >> $unsigned(op);

	always @(op) begin
		case (op)
			0:	out = tmp_out[31:24];
			1:	out = tmp_out[23:16];
			2:	out = tmp_out[15:8];
			default:	out = tmp_out[7:0];
		endcase 
	end
endmodule

module adder
(
	//--- control
		input           					      clk, n_rst, n_stall,
	//--- input signeds
		input signed			[11:0]   a0,
		input signed			[11:0]   b0,
		input signed			[11:0]   a1,
		input signed			[11:0]   b1,

	//--- output signeds
		output reg signed 		[11:0]   out0,
		output reg signed 		[11:0]   out1
);

		reg signed [11:0] 	se_a0, 	  se_a1;
		reg signed [11:0] 	se_b0, 	  se_b1;

		wire signed [11:0] 	se_out0, se_out1;
 
 	// instance
		adder_nonpp inst_adder_nonpp (.a0(se_a0), .b0(se_b0), .a1(se_a1), .b1(se_b1), .out0(se_out0), .out1(se_out1));
		//assign se_out0 = se_a0 & se_b0;
		//assign se_out1 = se_a1 & se_b1;

	// pipeline regs
		always @(posedge clk or negedge n_rst)
		begin
			if (!n_rst) begin
				se_a0 <= 0;
				se_b0 <= 0;
				se_a1 <= 0;
				se_b1 <= 0;
				out0   <= 0;
				out1   <= 0;
			end 
			else begin
				if (n_stall) begin
					se_a0 <= a0;
					se_b0 <= b0;
					se_a1 <= a1;
					se_b1 <= b1;
					out0   <= se_out0;
					out1   <= se_out1;
				end
			end
		end
endmodule