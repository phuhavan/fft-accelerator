`include "localmem_defines.h"

//======================================================

module mul_tw
#(
	//--- data bit-width
			parameter width = 24
)
(	
	input 	clk, rst, ce,
	input	signed [`DM_BANK_COLS-1:0] in0,
	input	signed [`DM_BANK_COLS-1:0] in1,
	output	signed [`DM_BANK_COLS-1:0] out0,
	output 	reg 				ready
);
	
	wire 	[width-1:0] out0_wire [0:127];
	wire 	[width-1:0] in0_wire [0:127];
	wire 	[width-1:0] in1_wire [0:127];

	assign {in0_wire[127], in0_wire[126], in0_wire[125], in0_wire[124], in0_wire[123], in0_wire[122], in0_wire[121], in0_wire[120], in0_wire[119], in0_wire[118], in0_wire[117], in0_wire[116], in0_wire[115], in0_wire[114], in0_wire[113], in0_wire[112], in0_wire[111], in0_wire[110], in0_wire[109], in0_wire[108], in0_wire[107], in0_wire[106], in0_wire[105], in0_wire[104], in0_wire[103], in0_wire[102], in0_wire[101], in0_wire[100], in0_wire[99], in0_wire[98], in0_wire[97], in0_wire[96], in0_wire[95], in0_wire[94], in0_wire[93], in0_wire[92], in0_wire[91], in0_wire[90], in0_wire[89], in0_wire[88], in0_wire[87], in0_wire[86], in0_wire[85], in0_wire[84], in0_wire[83], in0_wire[82], in0_wire[81], in0_wire[80], in0_wire[79], in0_wire[78], in0_wire[77], in0_wire[76], in0_wire[75], in0_wire[74], in0_wire[73], in0_wire[72], in0_wire[71], in0_wire[70], in0_wire[69], in0_wire[68], in0_wire[67], in0_wire[66], in0_wire[65], in0_wire[64], in0_wire[63], in0_wire[62], in0_wire[61], in0_wire[60], in0_wire[59], in0_wire[58], in0_wire[57], in0_wire[56], in0_wire[55], in0_wire[54], in0_wire[53], in0_wire[52], in0_wire[51], in0_wire[50], in0_wire[49], in0_wire[48], in0_wire[47], in0_wire[46], in0_wire[45], in0_wire[44], in0_wire[43], in0_wire[42], in0_wire[41], in0_wire[40], in0_wire[39], in0_wire[38], in0_wire[37], in0_wire[36], in0_wire[35], in0_wire[34], in0_wire[33], in0_wire[32], in0_wire[31], in0_wire[30], in0_wire[29], in0_wire[28], in0_wire[27], in0_wire[26], in0_wire[25], in0_wire[24], in0_wire[23], in0_wire[22], in0_wire[21], in0_wire[20], in0_wire[19], in0_wire[18], in0_wire[17], in0_wire[16], in0_wire[15], in0_wire[14], in0_wire[13], in0_wire[12], in0_wire[11], in0_wire[10], in0_wire[9], in0_wire[8], in0_wire[7], in0_wire[6], in0_wire[5], in0_wire[4], in0_wire[3], in0_wire[2], in0_wire[1],in0_wire[0]}=in0;
	assign {in1_wire[127], in1_wire[126], in1_wire[125], in1_wire[124], in1_wire[123], in1_wire[122], in1_wire[121], in1_wire[120], in1_wire[119], in1_wire[118], in1_wire[117], in1_wire[116], in1_wire[115], in1_wire[114], in1_wire[113], in1_wire[112], in1_wire[111], in1_wire[110], in1_wire[109], in1_wire[108], in1_wire[107], in1_wire[106], in1_wire[105], in1_wire[104], in1_wire[103], in1_wire[102], in1_wire[101], in1_wire[100], in1_wire[99], in1_wire[98], in1_wire[97], in1_wire[96], in1_wire[95], in1_wire[94], in1_wire[93], in1_wire[92], in1_wire[91], in1_wire[90], in1_wire[89], in1_wire[88], in1_wire[87], in1_wire[86], in1_wire[85], in1_wire[84], in1_wire[83], in1_wire[82], in1_wire[81], in1_wire[80], in1_wire[79], in1_wire[78], in1_wire[77], in1_wire[76], in1_wire[75], in1_wire[74], in1_wire[73], in1_wire[72], in1_wire[71], in1_wire[70], in1_wire[69], in1_wire[68], in1_wire[67], in1_wire[66], in1_wire[65], in1_wire[64], in1_wire[63], in1_wire[62], in1_wire[61], in1_wire[60], in1_wire[59], in1_wire[58], in1_wire[57], in1_wire[56], in1_wire[55], in1_wire[54], in1_wire[53], in1_wire[52], in1_wire[51], in1_wire[50], in1_wire[49], in1_wire[48], in1_wire[47], in1_wire[46], in1_wire[45], in1_wire[44], in1_wire[43], in1_wire[42], in1_wire[41], in1_wire[40], in1_wire[39], in1_wire[38], in1_wire[37], in1_wire[36], in1_wire[35], in1_wire[34], in1_wire[33], in1_wire[32], in1_wire[31], in1_wire[30], in1_wire[29], in1_wire[28], in1_wire[27], in1_wire[26], in1_wire[25], in1_wire[24], in1_wire[23], in1_wire[22], in1_wire[21], in1_wire[20], in1_wire[19], in1_wire[18], in1_wire[17], in1_wire[16], in1_wire[15], in1_wire[14], in1_wire[13], in1_wire[12], in1_wire[11], in1_wire[10], in1_wire[9], in1_wire[8], in1_wire[7], in1_wire[6], in1_wire[5], in1_wire[4], in1_wire[3], in1_wire[2], in1_wire[1],in1_wire[0]}=in1;
	assign out0 = {out0_wire[127], out0_wire[126], out0_wire[125], out0_wire[124], out0_wire[123], out0_wire[122], out0_wire[121], out0_wire[120], out0_wire[119], out0_wire[118], out0_wire[117], out0_wire[116], out0_wire[115], out0_wire[114], out0_wire[113], out0_wire[112], out0_wire[111], out0_wire[110], out0_wire[109], out0_wire[108], out0_wire[107], out0_wire[106], out0_wire[105], out0_wire[104], out0_wire[103], out0_wire[102], out0_wire[101], out0_wire[100], out0_wire[99], out0_wire[98], out0_wire[97], out0_wire[96], out0_wire[95], out0_wire[94], out0_wire[93], out0_wire[92], out0_wire[91], out0_wire[90], out0_wire[89], out0_wire[88], out0_wire[87], out0_wire[86], out0_wire[85], out0_wire[84], out0_wire[83], out0_wire[82], out0_wire[81], out0_wire[80], out0_wire[79], out0_wire[78], out0_wire[77], out0_wire[76], out0_wire[75], out0_wire[74], out0_wire[73], out0_wire[72], out0_wire[71], out0_wire[70], out0_wire[69], out0_wire[68], out0_wire[67], out0_wire[66], out0_wire[65], out0_wire[64], out0_wire[63], out0_wire[62], out0_wire[61], out0_wire[60], out0_wire[59], out0_wire[58], out0_wire[57], out0_wire[56], out0_wire[55], out0_wire[54], out0_wire[53], out0_wire[52], out0_wire[51], out0_wire[50], out0_wire[49], out0_wire[48], out0_wire[47], out0_wire[46], out0_wire[45], out0_wire[44], out0_wire[43], out0_wire[42], out0_wire[41], out0_wire[40], out0_wire[39], out0_wire[38], out0_wire[37], out0_wire[36], out0_wire[35], out0_wire[34], out0_wire[33], out0_wire[32], out0_wire[31], out0_wire[30], out0_wire[29], out0_wire[28], out0_wire[27], out0_wire[26], out0_wire[25], out0_wire[24], out0_wire[23], out0_wire[22], out0_wire[21], out0_wire[20], out0_wire[19], out0_wire[18], out0_wire[17], out0_wire[16], out0_wire[15], out0_wire[14], out0_wire[13], out0_wire[12], out0_wire[11], out0_wire[10], out0_wire[9], out0_wire[8], out0_wire[7], out0_wire[6], out0_wire[5], out0_wire[4], out0_wire[3], out0_wire[2], out0_wire[1],out0_wire[0]};

	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			ready <= 0;
		end
		else begin
			if(ce) begin
				ready <= 1'b1;
			end
			if(ready) begin
				ready <= 1'b0;
			end
		end
	end

	mul_complex #(.width(width))
		i_mul_complex_0(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[0][width-1:0]),
			.q(in1_wire[0][width-1:0]),
			.r(out0_wire[0][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_1(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[1][width-1:0]),
			.q(in1_wire[1][width-1:0]),
			.r(out0_wire[1][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_2(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[2][width-1:0]),
			.q(in1_wire[2][width-1:0]),
			.r(out0_wire[2][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_3(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[3][width-1:0]),
			.q(in1_wire[3][width-1:0]),
			.r(out0_wire[3][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_4(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[4][width-1:0]),
			.q(in1_wire[4][width-1:0]),
			.r(out0_wire[4][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_5(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[5][width-1:0]),
			.q(in1_wire[5][width-1:0]),
			.r(out0_wire[5][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_6(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[6][width-1:0]),
			.q(in1_wire[6][width-1:0]),
			.r(out0_wire[6][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_7(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[7][width-1:0]),
			.q(in1_wire[7][width-1:0]),
			.r(out0_wire[7][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_8(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[8][width-1:0]),
			.q(in1_wire[8][width-1:0]),
			.r(out0_wire[8][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_9(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[9][width-1:0]),
			.q(in1_wire[9][width-1:0]),
			.r(out0_wire[9][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_10(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[10][width-1:0]),
			.q(in1_wire[10][width-1:0]),
			.r(out0_wire[10][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_11(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[11][width-1:0]),
			.q(in1_wire[11][width-1:0]),
			.r(out0_wire[11][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_12(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[12][width-1:0]),
			.q(in1_wire[12][width-1:0]),
			.r(out0_wire[12][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_13(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[13][width-1:0]),
			.q(in1_wire[13][width-1:0]),
			.r(out0_wire[13][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_14(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[14][width-1:0]),
			.q(in1_wire[14][width-1:0]),
			.r(out0_wire[14][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_15(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[15][width-1:0]),
			.q(in1_wire[15][width-1:0]),
			.r(out0_wire[15][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_16(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[16][width-1:0]),
			.q(in1_wire[16][width-1:0]),
			.r(out0_wire[16][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_17(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[17][width-1:0]),
			.q(in1_wire[17][width-1:0]),
			.r(out0_wire[17][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_18(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[18][width-1:0]),
			.q(in1_wire[18][width-1:0]),
			.r(out0_wire[18][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_19(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[19][width-1:0]),
			.q(in1_wire[19][width-1:0]),
			.r(out0_wire[19][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_20(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[20][width-1:0]),
			.q(in1_wire[20][width-1:0]),
			.r(out0_wire[20][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_21(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[21][width-1:0]),
			.q(in1_wire[21][width-1:0]),
			.r(out0_wire[21][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_22(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[22][width-1:0]),
			.q(in1_wire[22][width-1:0]),
			.r(out0_wire[22][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_23(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[23][width-1:0]),
			.q(in1_wire[23][width-1:0]),
			.r(out0_wire[23][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_24(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[24][width-1:0]),
			.q(in1_wire[24][width-1:0]),
			.r(out0_wire[24][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_25(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[25][width-1:0]),
			.q(in1_wire[25][width-1:0]),
			.r(out0_wire[25][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_26(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[26][width-1:0]),
			.q(in1_wire[26][width-1:0]),
			.r(out0_wire[26][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_27(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[27][width-1:0]),
			.q(in1_wire[27][width-1:0]),
			.r(out0_wire[27][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_28(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[28][width-1:0]),
			.q(in1_wire[28][width-1:0]),
			.r(out0_wire[28][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_29(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[29][width-1:0]),
			.q(in1_wire[29][width-1:0]),
			.r(out0_wire[29][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_30(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[30][width-1:0]),
			.q(in1_wire[30][width-1:0]),
			.r(out0_wire[30][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_31(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[31][width-1:0]),
			.q(in1_wire[31][width-1:0]),
			.r(out0_wire[31][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_32(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[32][width-1:0]),
			.q(in1_wire[32][width-1:0]),
			.r(out0_wire[32][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_33(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[33][width-1:0]),
			.q(in1_wire[33][width-1:0]),
			.r(out0_wire[33][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_34(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[34][width-1:0]),
			.q(in1_wire[34][width-1:0]),
			.r(out0_wire[34][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_35(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[35][width-1:0]),
			.q(in1_wire[35][width-1:0]),
			.r(out0_wire[35][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_36(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[36][width-1:0]),
			.q(in1_wire[36][width-1:0]),
			.r(out0_wire[36][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_37(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[37][width-1:0]),
			.q(in1_wire[37][width-1:0]),
			.r(out0_wire[37][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_38(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[38][width-1:0]),
			.q(in1_wire[38][width-1:0]),
			.r(out0_wire[38][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_39(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[39][width-1:0]),
			.q(in1_wire[39][width-1:0]),
			.r(out0_wire[39][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_40(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[40][width-1:0]),
			.q(in1_wire[40][width-1:0]),
			.r(out0_wire[40][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_41(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[41][width-1:0]),
			.q(in1_wire[41][width-1:0]),
			.r(out0_wire[41][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_42(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[42][width-1:0]),
			.q(in1_wire[42][width-1:0]),
			.r(out0_wire[42][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_43(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[43][width-1:0]),
			.q(in1_wire[43][width-1:0]),
			.r(out0_wire[43][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_44(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[44][width-1:0]),
			.q(in1_wire[44][width-1:0]),
			.r(out0_wire[44][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_45(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[45][width-1:0]),
			.q(in1_wire[45][width-1:0]),
			.r(out0_wire[45][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_46(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[46][width-1:0]),
			.q(in1_wire[46][width-1:0]),
			.r(out0_wire[46][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_47(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[47][width-1:0]),
			.q(in1_wire[47][width-1:0]),
			.r(out0_wire[47][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_48(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[48][width-1:0]),
			.q(in1_wire[48][width-1:0]),
			.r(out0_wire[48][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_49(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[49][width-1:0]),
			.q(in1_wire[49][width-1:0]),
			.r(out0_wire[49][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_50(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[50][width-1:0]),
			.q(in1_wire[50][width-1:0]),
			.r(out0_wire[50][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_51(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[51][width-1:0]),
			.q(in1_wire[51][width-1:0]),
			.r(out0_wire[51][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_52(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[52][width-1:0]),
			.q(in1_wire[52][width-1:0]),
			.r(out0_wire[52][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_53(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[53][width-1:0]),
			.q(in1_wire[53][width-1:0]),
			.r(out0_wire[53][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_54(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[54][width-1:0]),
			.q(in1_wire[54][width-1:0]),
			.r(out0_wire[54][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_55(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[55][width-1:0]),
			.q(in1_wire[55][width-1:0]),
			.r(out0_wire[55][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_56(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[56][width-1:0]),
			.q(in1_wire[56][width-1:0]),
			.r(out0_wire[56][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_57(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[57][width-1:0]),
			.q(in1_wire[57][width-1:0]),
			.r(out0_wire[57][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_58(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[58][width-1:0]),
			.q(in1_wire[58][width-1:0]),
			.r(out0_wire[58][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_59(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[59][width-1:0]),
			.q(in1_wire[59][width-1:0]),
			.r(out0_wire[59][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_60(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[60][width-1:0]),
			.q(in1_wire[60][width-1:0]),
			.r(out0_wire[60][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_61(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[61][width-1:0]),
			.q(in1_wire[61][width-1:0]),
			.r(out0_wire[61][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_62(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[62][width-1:0]),
			.q(in1_wire[62][width-1:0]),
			.r(out0_wire[62][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_63(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[63][width-1:0]),
			.q(in1_wire[63][width-1:0]),
			.r(out0_wire[63][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_64(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[64][width-1:0]),
			.q(in1_wire[64][width-1:0]),
			.r(out0_wire[64][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_65(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[65][width-1:0]),
			.q(in1_wire[65][width-1:0]),
			.r(out0_wire[65][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_66(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[66][width-1:0]),
			.q(in1_wire[66][width-1:0]),
			.r(out0_wire[66][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_67(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[67][width-1:0]),
			.q(in1_wire[67][width-1:0]),
			.r(out0_wire[67][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_68(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[68][width-1:0]),
			.q(in1_wire[68][width-1:0]),
			.r(out0_wire[68][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_69(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[69][width-1:0]),
			.q(in1_wire[69][width-1:0]),
			.r(out0_wire[69][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_70(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[70][width-1:0]),
			.q(in1_wire[70][width-1:0]),
			.r(out0_wire[70][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_71(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[71][width-1:0]),
			.q(in1_wire[71][width-1:0]),
			.r(out0_wire[71][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_72(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[72][width-1:0]),
			.q(in1_wire[72][width-1:0]),
			.r(out0_wire[72][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_73(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[73][width-1:0]),
			.q(in1_wire[73][width-1:0]),
			.r(out0_wire[73][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_74(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[74][width-1:0]),
			.q(in1_wire[74][width-1:0]),
			.r(out0_wire[74][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_75(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[75][width-1:0]),
			.q(in1_wire[75][width-1:0]),
			.r(out0_wire[75][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_76(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[76][width-1:0]),
			.q(in1_wire[76][width-1:0]),
			.r(out0_wire[76][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_77(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[77][width-1:0]),
			.q(in1_wire[77][width-1:0]),
			.r(out0_wire[77][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_78(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[78][width-1:0]),
			.q(in1_wire[78][width-1:0]),
			.r(out0_wire[78][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_79(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[79][width-1:0]),
			.q(in1_wire[79][width-1:0]),
			.r(out0_wire[79][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_80(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[80][width-1:0]),
			.q(in1_wire[80][width-1:0]),
			.r(out0_wire[80][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_81(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[81][width-1:0]),
			.q(in1_wire[81][width-1:0]),
			.r(out0_wire[81][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_82(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[82][width-1:0]),
			.q(in1_wire[82][width-1:0]),
			.r(out0_wire[82][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_83(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[83][width-1:0]),
			.q(in1_wire[83][width-1:0]),
			.r(out0_wire[83][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_84(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[84][width-1:0]),
			.q(in1_wire[84][width-1:0]),
			.r(out0_wire[84][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_85(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[85][width-1:0]),
			.q(in1_wire[85][width-1:0]),
			.r(out0_wire[85][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_86(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[86][width-1:0]),
			.q(in1_wire[86][width-1:0]),
			.r(out0_wire[86][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_87(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[87][width-1:0]),
			.q(in1_wire[87][width-1:0]),
			.r(out0_wire[87][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_88(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[88][width-1:0]),
			.q(in1_wire[88][width-1:0]),
			.r(out0_wire[88][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_89(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[89][width-1:0]),
			.q(in1_wire[89][width-1:0]),
			.r(out0_wire[89][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_90(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[90][width-1:0]),
			.q(in1_wire[90][width-1:0]),
			.r(out0_wire[90][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_91(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[91][width-1:0]),
			.q(in1_wire[91][width-1:0]),
			.r(out0_wire[91][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_92(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[92][width-1:0]),
			.q(in1_wire[92][width-1:0]),
			.r(out0_wire[92][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_93(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[93][width-1:0]),
			.q(in1_wire[93][width-1:0]),
			.r(out0_wire[93][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_94(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[94][width-1:0]),
			.q(in1_wire[94][width-1:0]),
			.r(out0_wire[94][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_95(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[95][width-1:0]),
			.q(in1_wire[95][width-1:0]),
			.r(out0_wire[95][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_96(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[96][width-1:0]),
			.q(in1_wire[96][width-1:0]),
			.r(out0_wire[96][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_97(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[97][width-1:0]),
			.q(in1_wire[97][width-1:0]),
			.r(out0_wire[97][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_98(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[98][width-1:0]),
			.q(in1_wire[98][width-1:0]),
			.r(out0_wire[98][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_99(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[99][width-1:0]),
			.q(in1_wire[99][width-1:0]),
			.r(out0_wire[99][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_100(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[100][width-1:0]),
			.q(in1_wire[100][width-1:0]),
			.r(out0_wire[100][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_101(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[101][width-1:0]),
			.q(in1_wire[101][width-1:0]),
			.r(out0_wire[101][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_102(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[102][width-1:0]),
			.q(in1_wire[102][width-1:0]),
			.r(out0_wire[102][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_103(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[103][width-1:0]),
			.q(in1_wire[103][width-1:0]),
			.r(out0_wire[103][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_104(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[104][width-1:0]),
			.q(in1_wire[104][width-1:0]),
			.r(out0_wire[104][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_105(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[105][width-1:0]),
			.q(in1_wire[105][width-1:0]),
			.r(out0_wire[105][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_106(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[106][width-1:0]),
			.q(in1_wire[106][width-1:0]),
			.r(out0_wire[106][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_107(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[107][width-1:0]),
			.q(in1_wire[107][width-1:0]),
			.r(out0_wire[107][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_108(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[108][width-1:0]),
			.q(in1_wire[108][width-1:0]),
			.r(out0_wire[108][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_109(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[109][width-1:0]),
			.q(in1_wire[109][width-1:0]),
			.r(out0_wire[109][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_110(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[110][width-1:0]),
			.q(in1_wire[110][width-1:0]),
			.r(out0_wire[110][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_111(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[111][width-1:0]),
			.q(in1_wire[111][width-1:0]),
			.r(out0_wire[111][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_112(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[112][width-1:0]),
			.q(in1_wire[112][width-1:0]),
			.r(out0_wire[112][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_113(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[113][width-1:0]),
			.q(in1_wire[113][width-1:0]),
			.r(out0_wire[113][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_114(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[114][width-1:0]),
			.q(in1_wire[114][width-1:0]),
			.r(out0_wire[114][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_115(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[115][width-1:0]),
			.q(in1_wire[115][width-1:0]),
			.r(out0_wire[115][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_116(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[116][width-1:0]),
			.q(in1_wire[116][width-1:0]),
			.r(out0_wire[116][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_117(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[117][width-1:0]),
			.q(in1_wire[117][width-1:0]),
			.r(out0_wire[117][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_118(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[118][width-1:0]),
			.q(in1_wire[118][width-1:0]),
			.r(out0_wire[118][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_119(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[119][width-1:0]),
			.q(in1_wire[119][width-1:0]),
			.r(out0_wire[119][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_120(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[120][width-1:0]),
			.q(in1_wire[120][width-1:0]),
			.r(out0_wire[120][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_121(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[121][width-1:0]),
			.q(in1_wire[121][width-1:0]),
			.r(out0_wire[121][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_122(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[122][width-1:0]),
			.q(in1_wire[122][width-1:0]),
			.r(out0_wire[122][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_123(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[123][width-1:0]),
			.q(in1_wire[123][width-1:0]),
			.r(out0_wire[123][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_124(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[124][width-1:0]),
			.q(in1_wire[124][width-1:0]),
			.r(out0_wire[124][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_125(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[125][width-1:0]),
			.q(in1_wire[125][width-1:0]),
			.r(out0_wire[125][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_126(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[126][width-1:0]),
			.q(in1_wire[126][width-1:0]),
			.r(out0_wire[126][width-1:0])
			);

	mul_complex #(.width(width))
		i_mul_complex_127(
			.clk(clk),
			.rst(rst),
			.p(in0_wire[127][width-1:0]),
			.q(in1_wire[127][width-1:0]),
			.r(out0_wire[127][width-1:0])
			);


	

endmodule // mul_tw