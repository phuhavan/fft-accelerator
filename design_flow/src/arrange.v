`include "localmem_defines.h"

//======================================================
module arrange
#(
	//--- data bit-width
		parameter width = 24,
		parameter width_r = 16*24,
		parameter width_out = 16*24*8 // 16 points, 24 bit/1point, 8 streams.
)
(
	input	clk, rst, 
	input 	data_valid,
	input 	read_data,
	input 	[1:0] 				mode, 	// fft16, fft8, fft4, fft2
	input 	[3:0] 				position, // position of 16 samples

	input	[`DM_BANK_COLS-1:0] in_data,

	output 	[`TM_BANK_NUM-1:0]	tm_csb1,
	output 	[`TM_ADDR-1:0]		tm_addr1,
	output 	[width_out-1:0] 	out1,
	output 						tm_oeb1,
	output						tm_web1,

	output 	[`TM_BANK_NUM-1:0]	tm_csb2,
	output 	[`TM_ADDR-1:0]		tm_addr2,
	output 	[width_out-1:0] 	out2,
	output 						tm_oeb2,
	output						tm_web2,

	
	output 	reg 				done
);
	reg 	[`DM_BANK_COLS-1:0] data_latch;
	reg 	[2:0] 				count;
	reg 	[2:0] 				count_mux;
	reg 	[3:0] 				count_mode;
	reg 	[3:0]				count_dmux;
	reg 	ready_8;
	reg 	ready;
	reg 	oeb;
	reg		web;
	//reg 	done_delay;
	wire 	[`TM_BLOCK_NUM-1:0]	tm_csb_wr;

	reg [3:0] position_latch;
	wire enable_rst;

	wire 	[width_r-1:0] 	in0_wr;
	wire 	[width_r-1:0] 	in1_wr;
	wire 	[width_r-1:0] 	in2_wr;
	wire 	[width_r-1:0] 	in3_wr;
	wire 	[width_r-1:0] 	in4_wr;
	wire 	[width_r-1:0] 	in5_wr;
	wire 	[width_r-1:0] 	in6_wr;
	wire 	[width_r-1:0] 	in7_wr;

	wire 	[width_r-1:0] 	out0_wr;
	wire 	[width_r-1:0] 	out1_wr;
	wire 	[width_r-1:0] 	out2_wr;
	wire 	[width_r-1:0] 	out3_wr;
	wire 	[width_r-1:0] 	out4_wr;
	wire 	[width_r-1:0] 	out5_wr;
	wire 	[width_r-1:0] 	out6_wr;
	wire 	[width_r-1:0] 	out7_wr;
	wire 	[width_r-1:0] 	out8_wr;
	wire 	[width_r-1:0] 	out9_wr;
	wire 	[width_r-1:0] 	out10_wr;
	wire 	[width_r-1:0] 	out11_wr;
	wire 	[width_r-1:0] 	out12_wr;
	wire 	[width_r-1:0] 	out13_wr;
	wire 	[width_r-1:0] 	out14_wr;
	wire 	[width_r-1:0] 	out15_wr;

	wire 	[width-1:0] 	out_mux0_0_wr;
	wire 	[width-1:0] 	out_mux1_0_wr;
	wire 	[width-1:0] 	out_mux2_0_wr;
	wire 	[width-1:0] 	out_mux3_0_wr;
	wire 	[width-1:0] 	out_mux4_0_wr;
	wire 	[width-1:0] 	out_mux5_0_wr;
	wire 	[width-1:0] 	out_mux6_0_wr;
	wire 	[width-1:0] 	out_mux7_0_wr;
	wire 	[width-1:0] 	out_mux0_1_wr;
	wire 	[width-1:0] 	out_mux1_1_wr;
	wire 	[width-1:0] 	out_mux2_1_wr;
	wire 	[width-1:0] 	out_mux3_1_wr;
	wire 	[width-1:0] 	out_mux4_1_wr;
	wire 	[width-1:0] 	out_mux5_1_wr;
	wire 	[width-1:0] 	out_mux6_1_wr;
	wire 	[width-1:0] 	out_mux7_1_wr;


	assign {in7_wr,in6_wr,in5_wr,in4_wr,in3_wr,in2_wr,in1_wr,in0_wr} = data_latch;
	
	assign out1 = {out14_wr,out12_wr,out10_wr,out8_wr,out6_wr,out4_wr,out2_wr,out0_wr};
	assign out2 = {out15_wr,out13_wr,out11_wr,out9_wr,out7_wr,out5_wr,out3_wr,out1_wr};
	assign tm_addr1 = count_mode;
	assign tm_addr2 = count_mode + 4'b1;

	assign tm_oeb1 = oeb;
	assign tm_oeb2 = oeb;

	assign tm_web1 = web;
	assign tm_web2 = web;

	assign tm_csb1 = tm_csb_wr;
	assign tm_csb2 = tm_csb_wr;


	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			data_latch <= 0;
			ready <= 1'b0;
		end
		else begin
			if (data_valid) begin
				data_latch <= in_data;
				ready <= 1'b1;
			end
			if(ready) begin
				ready <= 1'b0;
			end
		end
	end

	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			count <= 3'b0;
			ready_8 <= 1'b0;
			oeb <= 1'b0;
			web <= 1'b1;
			//done_delay <= 1'b0;
			done <= 1'b0;
		end
		else begin

			//done <= done_delay;

			if(ready || (count>3'b0)) begin
				count <= count + 3'b1;
				ready_8 <= 1'b1;
				oeb <= 1'b1;
				web <= 1'b0;
			end
			else begin
				count <= count;
				ready_8 <= 1'b0;
				oeb <= 1'b0;
				web <= 1'b1;
			end
			if(count == 3'd4) begin
				//done_delay <= 1'b1;
				done <= 1'b1;
			end
			else begin
				//done_delay <= 1'b0;
				done <= 1'b0;
			end
		end
	end

	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			position_latch <= 0;
		end
		else begin
			position_latch <= position;
		end
	end

	assign enable_rst = (position_latch!=position) ? 1'b1 : 1'b0;

	wire or_rst;
	assign or_rst = enable_rst || rst;

	always @ (posedge clk or posedge or_rst) begin
		if(or_rst) begin
			count_mode <= 4'b0;
			count_dmux <= position;
			count_mux <= 3'b0;
		end
		else begin
			if (ready_8) begin
				count_mux <= count_mux + 3'b1;

				if((mode == 2'b0) && (count_mode == 4'd14)) begin // fft16
					count_mode <= 4'd0;
					count_dmux <= count_dmux + 4'd0;
				end
				else if((mode == 2'b01) && (count_mode == 4'd6)) begin // fft8
					count_mode <= 4'd0;
					count_dmux <= count_dmux + 4'd8;
				end
				else if((mode == 2'b10) && (count_mode == 4'd2)) begin // fft4
					count_mode <= 4'd0;
					count_dmux <= count_dmux + 4'd4;
				end
				else if((mode == 2'b11) && (count_mode == 4'd0)) begin // fft2
					count_mode <= 4'd0;
					count_dmux <= count_dmux + 4'd2;
				end
				else begin
					count_mode <= count_mode + 4'd2;
				end
			end
		end
	end

	// instantiate 
	dmux_1_16 #(.width (1), .width_out(16))
		inst_dmux_1_16_csb
		(
			.in0 (1'b0),
			.sel0(count_dmux),
			.const_va(1'b1),
			.out0(tm_csb_wr)
		);

	mux_8_1 #(.width (width*2), .width_group(width_r))
		inst_mux_8_1_0
		(
			.in0 (in0_wr),
			.sel0(count_mux),
			.out0({out_mux0_1_wr,out_mux0_0_wr})
		);

	mux_8_1 #(.width (width*2), .width_group(width_r))
		inst_mux_8_1_1
		(
			.in0 (in1_wr),
			.sel0(count_mux),
			.out0({out_mux1_1_wr,out_mux1_0_wr})
		);

	mux_8_1 #(.width (width*2), .width_group(width_r))
		inst_mux_8_1_2
		(
			.in0 (in2_wr),
			.sel0(count_mux),
			.out0({out_mux2_1_wr,out_mux2_0_wr})
		);

	mux_8_1 #(.width (width*2), .width_group(width_r))
		inst_mux_8_1_3
		(
			.in0 (in3_wr),
			.sel0(count_mux),
			.out0({out_mux3_1_wr,out_mux3_0_wr})
		);

	mux_8_1 #(.width (width*2), .width_group(width_r))
		inst_mux_8_1_4
		(
			.in0 (in4_wr),
			.sel0(count_mux),
			.out0({out_mux4_1_wr,out_mux4_0_wr})
		);

	mux_8_1 #(.width (width*2), .width_group(width_r))
		inst_mux_8_1_5
		(
			.in0 (in5_wr),
			.sel0(count_mux),
			.out0({out_mux5_1_wr,out_mux5_0_wr})
		);

	mux_8_1 #(.width (width*2), .width_group(width_r))
		inst_mux_8_1_6
		(
			.in0 (in6_wr),
			.sel0(count_mux),
			.out0({out_mux6_1_wr,out_mux6_0_wr})
		);

	mux_8_1 #(.width (width*2), .width_group(width_r))
		inst_mux_8_1_7
		(
			.in0 (in7_wr),
			.sel0(count_mux),
			.out0({out_mux7_1_wr,out_mux7_0_wr})
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_0
		(
			.in0 (out_mux0_0_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out0_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_1
		(
			.in0 (out_mux0_1_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out1_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_2
		(
			.in0 (out_mux1_0_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out2_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_3
		(
			.in0 (out_mux1_1_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out3_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_4
		(
			.in0 (out_mux2_0_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out4_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_5
		(
			.in0 (out_mux2_1_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out5_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_6
		(
			.in0 (out_mux3_0_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out6_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_7
		(
			.in0 (out_mux3_1_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out7_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_8
		(
			.in0 (out_mux4_0_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out8_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_9
		(
			.in0 (out_mux4_1_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out9_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_10
		(
			.in0 (out_mux5_0_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out10_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_11
		(
			.in0 (out_mux5_1_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out11_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_12
		(
			.in0 (out_mux6_0_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out12_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_13
		(
			.in0 (out_mux6_1_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out13_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_14
		(
			.in0 (out_mux7_0_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out14_wr)
		);

	dmux_1_16 #(.width    (width), .width_out(width_r))
		inst_dmux_1_16_out_15
		(
			.in0 (out_mux7_1_wr),
			.sel0(count_dmux),
			.const_va(1'b0),
			.out0(out15_wr)
		);

	


endmodule // arrange
