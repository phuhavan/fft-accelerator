`include "localmem_defines.h"

//======================================================
module controller 
#(
	//--- data bus-width
		parameter bus_width = 128*24,
	//--- data bit-width
		parameter width = 24,
	//--- fft size
		parameter size=128
)
(
	input clk,    // Clock
	input rst,
	input ce_fft,
	input done_arrange_signal,
	input 	[2:0] 		fft_mode, 


	input 				stall_out,


	output reg 				stall_fft,
	output reg	[6:0]		sel_fft,


	output reg 	[6:0] 		shift_data,


	output reg				sel_mux0, sel_mux1, sel_mux2, sel_mux3,
	output reg 				sel_dmux0, sel_dmux1,
	output reg 				ce_mul,

	output reg [1:0] 		mode,
	output reg [3:0] 		position,	

	//--- DMEM control
	
	//port 1
	output reg 					dm_WEB1,
	output reg 					dm_OEB1,
	output reg 					dm_CSB1,
	output reg 	[`DM_ADDR-1:0] 	dm_A1,
	//port 2
	output reg 					dm_WEB2,
	output reg 					dm_OEB2,
	output reg 					dm_CSB2,
	output reg 	[`DM_ADDR-1:0]	dm_A2,
	//--- FMEM control
	//port 1
	output reg 					fm_WEB1,
	output reg 					fm_OEB1,
	output reg 					fm_CSB1,
	output reg 	[`FM_ADDR-1:0] 	fm_A1,
	//port 2
	output reg 					fm_WEB2,
	output reg 					fm_OEB2,
	output reg 					fm_CSB2,
	output reg 	[`FM_ADDR-1:0]	fm_A2,
	//--- TMEM control
	//--- Port 1
	output reg 						tm_WEB1,
	output reg 						tm_OEB1,
	output reg 	[`TM_BANK_NUM-1:0]	tm_CSB1,
	output reg 	[`TM_ADDR-1:0]		tm_A1,
	//--- Port 2
	output reg 						tm_WEB2,
	output reg 						tm_OEB2,
	output reg 	[`TM_BANK_NUM-1:0]	tm_CSB2,
	output reg 	[`TM_ADDR-1:0]		tm_A2,

	output  						finish_fft_process // finish
);

	reg [1:0] current_state, next_state;

	reg 	post_transpose; 	// before or after transpose

	reg [63:0] count_test;
	reg ce_count_test;

	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			count_test <= 64'b0;
		end
		else begin
			if(ce_count_test) begin
				count_test <= count_test + 64'b1;
			end
		end
	end
	

	

	localparam load_data_in = 2'b00;
	localparam fft_calculation = 2'b01;
	localparam multiplier = 2'b10;
	localparam read_data_out = 2'b11;


	reg [3:0] cnt_dm_addr_port1;
	reg ce_cnt_dm_addr_port1;

	reg [3:0] cnt_dm_addr_port2;
	reg ce_cnt_dm_addr_port2;

	reg stall_out_delay;



	reg [4:0] cnt_phase1;
	reg ce_cnt_phase1;

	reg [9:0] cnt_phase2;
	reg ce_cnt_phase2;

	reg [4:0] cnt_phase3;
	reg ce_cnt_phase3;

	reg [3:0] cnt_dm_addr_phase2;
	reg ce_cnt_dm_addr_phase2;
	
	reg done_arrange_signal_delay1,done_arrange_signal_delay2,done_arrange_signal_delay3,done_arrange_signal_delay4;

	reg [3:0] cnt_tm_addr_port1;
	reg ce_cnt_tm_addr_port1;

	reg [3:0] cnt_tm_addr_port2;
	reg ce_cnt_tm_addr_port2;
	reg [3:0] cnt_dm_addr_phase2_delay1,cnt_dm_addr_phase2_delay2,cnt_dm_addr_phase2_delay3;



	wire done_fft;

	reg ce_mul_reg,ce_mul_reg_delay;

	reg [1:0] cnt_finish;
	reg ce_cnt_finish;


	// --- counter finish
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			cnt_finish <= 2'b0;
		end
		else begin
			if(ce_cnt_finish) begin
				cnt_finish <= cnt_finish + 2'b1;
			end
		end
	end

	assign finish_fft_process = cnt_finish[0];

	//--- counter DM address, port 1 - phase 1
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			cnt_dm_addr_port1 <= 4'b0;
		end
		else if (ce_cnt_dm_addr_port1&&ce_fft) begin
			if((fft_mode == 3'd0) && (cnt_dm_addr_port1 == 0)) begin //fft64
				cnt_dm_addr_port1 <= 0;
			end
			else if((fft_mode == 3'd1)&&(cnt_dm_addr_port1 == 0)) begin //fft128
				cnt_dm_addr_port1 <= 0;
			end
			else if((fft_mode == 3'd2)&&(cnt_dm_addr_port1 == 1)) begin //fft256
				cnt_dm_addr_port1 <= 0;
			end
			else if((fft_mode == 3'd3)&&(cnt_dm_addr_port1 == 3)) begin //fft512
				cnt_dm_addr_port1 <= 0;
			end
			else if((fft_mode == 3'd4)&&(cnt_dm_addr_port1 == 7)) begin //fft1024
				cnt_dm_addr_port1 <= 0;
			end
			else if((fft_mode == 3'd5)&&(cnt_dm_addr_port1 == 15)) begin //fft2048
				cnt_dm_addr_port1 <= 0;
			end
			else begin
				cnt_dm_addr_port1 <= cnt_dm_addr_port1 + 4'b1;
			end
		end
		else if(!ce_cnt_dm_addr_port1)begin
			cnt_dm_addr_port1 <= 4'b0;
		end
	end

	//--- counter DM address, port 2 - phase 1
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			cnt_dm_addr_port2 <= 4'b0;
		end
		else begin
			if(ce_cnt_dm_addr_port2) begin
				cnt_dm_addr_port2 <= cnt_dm_addr_port2 + 4'b1;
			end
			else begin
				cnt_dm_addr_port2 <= 4'b0;
			end
		end
	end

	//--- delay 1 clk of stall_out (from fft128_accel.v)
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			stall_out_delay <= 0;
		end else begin
			stall_out_delay <= stall_out;
		end
	end


	//--- counter phase 1
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			cnt_phase1 <= 5'b0;
		end
		else begin
			if(ce_cnt_phase1) begin
				cnt_phase1 <= cnt_phase1 + 5'b1;
			end
			else begin
				cnt_phase1 <= 5'b0;
			end
		end
	end

	//--- counter phase 2
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			cnt_phase2 <= 10'b0;
		end
		else begin
			if(ce_cnt_phase2) begin
				cnt_phase2 <= cnt_phase2 + 10'b1;
			end
			else begin
				cnt_phase2 <= 10'b0;
			end
		end
	end



	//--- counter phase 3
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			cnt_phase3 <= 5'b0;
		end
		else begin
			if(ce_cnt_phase3) begin
				cnt_phase3 <= cnt_phase3 + 5'b1;
			end
			else begin
				cnt_phase3 <= 5'b0;
			end
		end
	end

	
	//--- counter DM address, port 2 - phase 2
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			cnt_dm_addr_phase2 <= 4'b0;
			cnt_dm_addr_phase2_delay1 <= 4'b0;
			cnt_dm_addr_phase2_delay2 <= 4'b0;
			cnt_dm_addr_phase2_delay3 <= 4'b0;

			ce_mul_reg <= 1'b0;
			ce_mul_reg_delay <= 1'b0;
		end
		else begin
			ce_mul_reg_delay <= ce_mul_reg;
			cnt_dm_addr_phase2_delay1 <= cnt_dm_addr_phase2;
			cnt_dm_addr_phase2_delay2 <= cnt_dm_addr_phase2_delay1;
			cnt_dm_addr_phase2_delay3 <= cnt_dm_addr_phase2_delay2;
			if(ce_cnt_dm_addr_phase2) begin
				if(done_arrange_signal) begin
					cnt_dm_addr_phase2 <= cnt_dm_addr_phase2 + 4'b1;
					ce_mul_reg <= 1'b1;
				end
				if (ce_mul_reg) begin
					ce_mul_reg <= 1'b0;
				end
			end
			else begin
				cnt_dm_addr_phase2 <= 4'b0;
			end
		end
	end


	//--- delay 1 clk of done_arrange_signal (from arrange.v)
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			done_arrange_signal_delay1 <= 1'b0;
			done_arrange_signal_delay2 <= 1'b0;
			done_arrange_signal_delay3 <= 1'b0;
			done_arrange_signal_delay4 <= 1'b0;
		end
		else begin
			done_arrange_signal_delay1 <= done_arrange_signal;
			done_arrange_signal_delay2 <= done_arrange_signal_delay1;
			done_arrange_signal_delay3 <= done_arrange_signal_delay2;
			done_arrange_signal_delay4 <= done_arrange_signal_delay3;
		end
	end

	//--- counter TM address, port 1 - phase 3
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			cnt_tm_addr_port1 <= 4'b0;
		end
		else if (ce_cnt_tm_addr_port1&&ce_fft) begin
			if((fft_mode == 3'd2)&&(cnt_tm_addr_port1 == 1)) begin //fft256
				cnt_tm_addr_port1 <= 0;
			end
			else if((fft_mode == 3'd3)&&(cnt_tm_addr_port1 == 3)) begin //fft512
				cnt_tm_addr_port1 <= 0;
			end
			else if((fft_mode == 3'd4)&&(cnt_tm_addr_port1 == 7)) begin //fft1024
				cnt_tm_addr_port1 <= 0;
			end
			else if((fft_mode == 3'd5)&&(cnt_tm_addr_port1 == 15)) begin //fft2048
				cnt_tm_addr_port1 <= 0;
			end
			else begin
				cnt_tm_addr_port1 <= cnt_tm_addr_port1 + 4'b1;
			end
		end
		else if(!ce_cnt_tm_addr_port1)begin
			cnt_tm_addr_port1 <= 4'b0;
		end
	end

	//--- counter TM address, port 2 - phase 3
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			cnt_tm_addr_port2 <= 4'b0;
		end
		else begin
			if(ce_cnt_tm_addr_port2) begin
				cnt_tm_addr_port2 <= cnt_tm_addr_port2 + 4'b1;
			end
			else begin
				cnt_tm_addr_port2 <= 4'b0;
			end
		end
	end

	assign done_fft = stall_out | stall_out_delay;

	// Transitions
	always @ (posedge clk or posedge rst)begin
		if(rst)begin
			current_state <= load_data_in;
		end
		else if(ce_fft) begin
			current_state <= next_state;
		end
	end

	always @ (current_state,fft_mode,done_arrange_signal,cnt_dm_addr_port1, post_transpose, ce_fft, cnt_phase1, cnt_dm_addr_phase2, cnt_dm_addr_phase2_delay2, done_arrange_signal_delay3, cnt_tm_addr_port1, done_fft, cnt_dm_addr_port2, cnt_phase2, ce_mul_reg_delay, cnt_phase3, cnt_tm_addr_port2, cnt_finish) begin
		next_state = load_data_in;


		ce_count_test = 1'b0;

		ce_cnt_dm_addr_port1 = 1'b0;
		ce_cnt_dm_addr_port2 = 1'b0;

		shift_data = 7'b0000000;

		ce_cnt_phase1 = 1'b0;
		ce_cnt_phase2 = 1'b0;
		ce_cnt_phase3 = 1'b0;
		ce_cnt_dm_addr_phase2 = 1'b0;
		ce_cnt_tm_addr_port1 = 1'b0;
		ce_cnt_tm_addr_port2 = 1'b0;

		ce_cnt_finish = 1'b0;
		

		//post_transpose = 1'b0;
		stall_fft = 1'b1;
		sel_fft = 7'b1111111;
		sel_mux0 = 1'b0;
		sel_mux1 = 1'b0;
		sel_mux2 = 1'b0;
		sel_mux3 = 1'b0;
		sel_dmux0 = 1'b0;
		sel_dmux1 = 1'b0;
		ce_mul = 1'b0;
		mode = 2'b00;
		position = 4'b0;

		dm_WEB1 = 1'b1;
		dm_OEB1 = 1'b1;
		dm_CSB1 = 1'b1;
		dm_A1 = {`DM_ADDR{1'b0}};
		dm_WEB2 = 1'b1;
		dm_OEB2 = 1'b1;
		dm_CSB2 = 1'b1;
		dm_A2 = {`DM_ADDR{1'b0}};

		fm_WEB1 = 1'b1;
		fm_OEB1 = 1'b1;
		fm_CSB1 = 1'b1;
		fm_A1 = {`FM_ADDR{1'b0}};
		fm_WEB2 = 1'b1;
		fm_OEB2 = 1'b1;
		fm_CSB2 = 1'b1;
		fm_A2 = {`FM_ADDR{1'b0}};

		tm_WEB1 = 1'b1;
		tm_OEB1 = 1'b1;
		tm_CSB1 = {`TM_BANK_NUM{1'b1}};
		tm_A1 = {`TM_ADDR{1'b0}};
		tm_WEB2 = 1'b1;
		tm_OEB2 = 1'b1;
		tm_CSB2 = {`TM_BANK_NUM{1'b1}};
		tm_A2 = {`TM_ADDR{1'b0}};

		case (current_state)
			load_data_in: 
				begin
					if(ce_fft) begin
						// default:


						ce_count_test = 1'b0;

						ce_cnt_finish = 1'b0;
						ce_cnt_phase1 = 1'b0;
						ce_cnt_phase2 = 1'b0;
						ce_cnt_phase3 = 1'b0;
						ce_cnt_dm_addr_phase2 = 1'b0;
						ce_cnt_tm_addr_port1 = 1'b0;
						ce_cnt_tm_addr_port2 = 1'b0;
						ce_cnt_dm_addr_port2 = 1'b0;

						stall_fft = 1'b1;
						sel_fft = 7'b1111111;

						shift_data = 7'b0000000;
						
						sel_mux1 = 1'b0;
						sel_mux2 = 1'b0;
						sel_mux3 = 1'b0;
						sel_dmux0 = 1'b0;
						sel_dmux1 = 1'b0;
						ce_mul = 1'b0;
						mode = 2'b00;
						position = 4'b0;

						

						tm_WEB1 = 1'b1;
						tm_OEB1 = 1'b1;
						tm_CSB1 = {`TM_BANK_NUM{1'b1}};
						tm_A1 = {`TM_ADDR{1'b0}};
						tm_WEB2 = 1'b1;
						tm_OEB2 = 1'b1;
						tm_CSB2 = {`TM_BANK_NUM{1'b1}};
						tm_A2 = {`TM_ADDR{1'b0}};


						// control:
						post_transpose = 1'b0;
						sel_mux0 = 1'b1;
						dm_WEB1 = 1'b0;
						dm_OEB1 = 1'b1;
						dm_CSB1 = 1'b0;
						dm_A1 = cnt_dm_addr_port1;
						dm_WEB2 = 1'b1;
						dm_OEB2 = 1'b1;
						dm_CSB2 = 1'b1;
						dm_A2 = {`DM_ADDR{1'b0}};

						fm_WEB1 = 1'b0;
						fm_OEB1 = 1'b1;
						fm_CSB1 = 1'b0;
						fm_A1 = cnt_dm_addr_port1;
						fm_WEB2 = 1'b1;
						fm_OEB2 = 1'b1;
						fm_CSB2 = 1'b1;
						fm_A2 = {`FM_ADDR{1'b0}};

						
						if((fft_mode == 3'd0) && (cnt_dm_addr_port1 == 0)) begin //fft64
							ce_cnt_dm_addr_port1 = 1'b0;
							next_state = fft_calculation;
						end
						else if((fft_mode == 3'd1)&&(cnt_dm_addr_port1 == 0)) begin //fft128
							ce_cnt_dm_addr_port1 = 1'b0;
							next_state = fft_calculation;
						end
						else if((fft_mode == 3'd2)&&(cnt_dm_addr_port1 == 1)) begin //fft256
							ce_cnt_dm_addr_port1 = 1'b0;
							next_state = fft_calculation;
						end
						else if((fft_mode == 3'd3)&&(cnt_dm_addr_port1 == 3)) begin //fft512
							ce_cnt_dm_addr_port1 = 1'b0;
							next_state = fft_calculation;
						end
						else if((fft_mode == 3'd4)&&(cnt_dm_addr_port1 == 7)) begin //fft1024
							ce_cnt_dm_addr_port1 = 1'b0; 
							next_state = fft_calculation;
						end
						else if((fft_mode == 3'd5)&&(cnt_dm_addr_port1 == 15)) begin //fft2048
							ce_cnt_dm_addr_port1 = 1'b0; 
							next_state = fft_calculation;
						end
						else begin
							ce_cnt_dm_addr_port1 = 1'b1;
							next_state = load_data_in;
						end
					end
				end
			fft_calculation: 
				begin 


					


					ce_cnt_finish = 1'b0;

					// post_transpose = 1'b0;
					ce_cnt_phase2 = 1'b0;

					ce_cnt_dm_addr_phase2 = 1'b0;

					stall_fft = 1'b0;
					
					sel_mux0 = 1'b0;
					sel_mux3 = 1'b0;
					
					
					sel_dmux0 = 1'b0;
					
					ce_mul = 1'b0;
					mode = 2'b00;
					position = 4'b0;

					

					fm_WEB1 = 1'b1;
					fm_OEB1 = 1'b1;
					fm_CSB1 = 1'b1;
					fm_A1 = {`FM_ADDR{1'b0}};
					fm_WEB2 = 1'b1;
					fm_OEB2 = 1'b1;
					fm_CSB2 = 1'b1;
					fm_A2 = {`FM_ADDR{1'b0}};

					

					if(post_transpose == 1'b0) begin	// phase 1

						ce_count_test = 1'b1;

						sel_mux2 = 1'b0;
						sel_mux1 = 1'b0;
						sel_dmux1 = 1'b0;
						
						

						if(fft_mode == 3'd0) begin
							sel_fft = 7'b1000000;
							shift_data = 7'b1111110;
						end
						else begin
							sel_fft = 7'b0000000;
							shift_data = 7'b1111111;
						end

						ce_cnt_tm_addr_port1 = 1'b0;
						ce_cnt_tm_addr_port2 = 1'b0;

						//ce_cnt = 1'b1;
						// ce_cnt_phase1 = 1'b0;
						ce_cnt_phase3 = 1'b0;

						dm_WEB1 = 1'b1;
						dm_OEB1 = 1'b0;
						dm_CSB1 = 1'b0;
						dm_A1 = cnt_dm_addr_port1;
						

						tm_WEB1 = 1'b1;
						tm_OEB1 = 1'b1;
						tm_CSB1 = {`TM_BANK_NUM{1'b1}};
						tm_A1 = {`TM_ADDR{1'b0}};
						tm_WEB2 = 1'b1;
						tm_OEB2 = 1'b1;
						tm_CSB2 = {`TM_BANK_NUM{1'b1}};
						tm_A2 = {`TM_ADDR{1'b0}};

						if(done_fft == 1'b1) begin
							ce_cnt_dm_addr_port2 = 1'b0;
							dm_WEB2 = 1'b1;
							dm_OEB2 = 1'b1;
							dm_CSB2 = 1'b1;
							dm_A2 = {`DM_ADDR{1'b0}};
						end
						else begin
							ce_cnt_dm_addr_port2 = 1'b1;
							dm_WEB2 = 1'b0;
							dm_OEB2 = 1'b1;
							dm_CSB2 = 1'b0;
							dm_A2 = cnt_dm_addr_port2;
						end

						if((fft_mode == 3'd0) && (cnt_phase1 >= 4'd0)) begin //fft64
							ce_cnt_dm_addr_port1 = 1'b0;
						end
						else if((fft_mode == 3'd1)&&(cnt_phase1 >= 4'd0)) begin //fft128
							ce_cnt_dm_addr_port1 = 1'b0;
						end
						else if((fft_mode == 3'd2)&&(cnt_phase1 >= 4'd1)) begin //fft256
							ce_cnt_dm_addr_port1 = 1'b0;
						end
						else if((fft_mode == 3'd3)&&(cnt_phase1 >= 4'd3)) begin //fft512
							ce_cnt_dm_addr_port1 = 1'b0;
						end
						else if((fft_mode == 3'd4)&&(cnt_phase1 >= 4'd7)) begin //fft1024
							ce_cnt_dm_addr_port1 = 1'b0; 
						end
						else if((fft_mode == 3'd5)&&(cnt_phase1 >= 4'd15)) begin //fft2048
							ce_cnt_dm_addr_port1 = 1'b0; 
						end
						else begin
							ce_cnt_dm_addr_port1 = 1'b1;
						end


						if((fft_mode == 3'd0) && (cnt_phase1 == 5'd8)) begin //fft64
							next_state = read_data_out;
							ce_cnt_dm_addr_port2 = 1'b0;
							ce_cnt_phase1 = 1'b0;
						end
						else if((fft_mode == 3'd1)&&(cnt_phase1 == 5'd9)) begin //fft128
							next_state = read_data_out;
							ce_cnt_dm_addr_port2 = 1'b0;
							ce_cnt_phase1 = 1'b0;
						end
						else if((fft_mode == 3'd2)&&(cnt_phase1 == 5'd10)) begin //fft256
							next_state = multiplier;
							ce_cnt_dm_addr_port2 = 1'b0;
							ce_cnt_phase1 = 1'b0;

							// control
							sel_mux2 = 1'b0;

							dm_WEB1 = 1'b1;
							dm_OEB1 = 1'b0;
							dm_CSB1 = 1'b0;
							dm_A1 = cnt_dm_addr_phase2;

							fm_WEB1 = 1'b1;
							fm_OEB1 = 1'b0;
							fm_CSB1 = 1'b0;
							fm_A1 = cnt_dm_addr_phase2;
						end
						else if((fft_mode == 3'd3)&&(cnt_phase1 == 5'd12)) begin //fft512
							next_state = multiplier;
							ce_cnt_dm_addr_port2 = 1'b0;
							ce_cnt_phase1 = 1'b0;

							// control
							sel_mux2 = 1'b0;

							dm_WEB1 = 1'b1;
							dm_OEB1 = 1'b0;
							dm_CSB1 = 1'b0;
							dm_A1 = cnt_dm_addr_phase2;

							fm_WEB1 = 1'b1;
							fm_OEB1 = 1'b0;
							fm_CSB1 = 1'b0;
							fm_A1 = cnt_dm_addr_phase2;
						end
						else if((fft_mode == 3'd4)&&(cnt_phase1 == 5'd16)) begin //fft1024
							next_state = multiplier;
							ce_cnt_dm_addr_port2 = 1'b0;
							ce_cnt_phase1 = 1'b0;

							// control
							sel_mux2 = 1'b0;

							dm_WEB1 = 1'b1;
							dm_OEB1 = 1'b0;
							dm_CSB1 = 1'b0;
							dm_A1 = cnt_dm_addr_phase2;

							fm_WEB1 = 1'b1;
							fm_OEB1 = 1'b0;
							fm_CSB1 = 1'b0;
							fm_A1 = cnt_dm_addr_phase2;
						end
						else if((fft_mode == 3'd5)&&(cnt_phase1 == 5'd24)) begin //fft2048
							next_state = multiplier;
							ce_cnt_dm_addr_port2 = 1'b0;
							ce_cnt_phase1 = 1'b0;

							// control
							sel_mux2 = 1'b0;

							dm_WEB1 = 1'b1;
							dm_OEB1 = 1'b0;
							dm_CSB1 = 1'b0;
							dm_A1 = cnt_dm_addr_phase2;

							fm_WEB1 = 1'b1;
							fm_OEB1 = 1'b0;
							fm_CSB1 = 1'b0;
							fm_A1 = cnt_dm_addr_phase2;
						end
						else begin
							ce_cnt_phase1 = 1'b1;
							next_state = fft_calculation;
						end

					end
					else begin	// phase 3



						ce_count_test = 1'b1;



						ce_cnt_dm_addr_port1 = 1'b0;

						ce_cnt_phase1 = 1'b0;
						
						
						ce_cnt_dm_addr_port2 = 1'b0;


						dm_WEB1 = 1'b1;
						dm_OEB1 = 1'b1;
						dm_CSB1 = 1'b1;
						dm_A1 = {`DM_ADDR{1'b0}};
						dm_WEB2 = 1'b1;
						dm_OEB2 = 1'b1;
						dm_CSB2 = 1'b1;
						dm_A2 = {`DM_ADDR{1'b0}};

						

						// control:


						

						sel_mux1 = 1'b1;
						sel_dmux1 = 1'b0;
						sel_mux2 = 1'b1;

						ce_cnt_phase3 = 1'b1;

						tm_WEB1 = 1'b1;
						tm_OEB1 = 1'b0;
						tm_CSB1 = 16'b0;
						tm_A1 = cnt_tm_addr_port1;

						
						if(done_fft == 1'b1) begin
							ce_cnt_tm_addr_port2 = 1'b0;
							tm_WEB2 = 1'b1;
							tm_OEB2 = 1'b1;
							tm_CSB2 = 1'b1;
							tm_A2 = {`DM_ADDR{1'b0}};
						end
						else begin
							ce_cnt_tm_addr_port2 = 1'b1;
							tm_WEB2 = 1'b0;
							tm_OEB2 = 1'b1;
							tm_CSB2 = 1'b0;
							tm_A2 = cnt_tm_addr_port2;
						end
						
						if(fft_mode == 3'd5) begin	// fft16
							sel_fft = 7'b1110000;
							shift_data = 7'b1111000;
						end
						else if(fft_mode == 3'd4) begin // fft8
							sel_fft = 7'b1111000;
							shift_data = 7'b1110000;
						end
						else if(fft_mode == 3'd3) begin	// fft4
							sel_fft = 7'b1111100;
							shift_data = 7'b1100000;
						end
						else if(fft_mode == 3'd2) begin //fft2
							sel_fft = 7'b1111110;
							shift_data = 7'b1000000;
						end

						
						

						if((fft_mode == 3'd2)&&(cnt_tm_addr_port1 >= 1)) begin //fft256
							ce_cnt_tm_addr_port1 = 1'b0;
						end
						else if((fft_mode == 3'd3)&&(cnt_tm_addr_port1 >= 3)) begin //fft512
							ce_cnt_tm_addr_port1 = 1'b0;
						end
						else if((fft_mode == 3'd4)&&(cnt_tm_addr_port1 >= 7)) begin //fft1024
							ce_cnt_tm_addr_port1 = 1'b0;
						end
						else if((fft_mode == 3'd5)&&(cnt_tm_addr_port1 >= 15)) begin //fft2048
							ce_cnt_tm_addr_port1 = 1'b0;
						end
						else begin
							ce_cnt_tm_addr_port1 = 1'b1;
						end


						if((fft_mode == 3'd2)&&(cnt_phase3 == 5'd4)) begin //fft256
							next_state = read_data_out;
							ce_cnt_tm_addr_port2 = 1'b0;
							ce_cnt_phase3 = 1'b0;
						end
						else if((fft_mode == 3'd3)&&(cnt_phase3 == 5'd7)) begin //fft512
							next_state = read_data_out;
							ce_cnt_tm_addr_port2 = 1'b0;
							ce_cnt_phase3 = 1'b0;
						end
						else if((fft_mode == 3'd4)&&(cnt_phase3 == 5'd12)) begin //fft1024
							next_state = read_data_out;
							ce_cnt_tm_addr_port2 = 1'b0;
							ce_cnt_phase3 = 1'b0;
						end
						else if((fft_mode == 3'd5)&&(cnt_phase3 == 5'd21)) begin //fft2048
							next_state = read_data_out;
							ce_cnt_tm_addr_port2 = 1'b0;
							ce_cnt_phase3 = 1'b0;
						end
						else begin
							ce_cnt_phase3 = 1'b1;
							next_state = fft_calculation;
						end

					end
				end
			
			multiplier:	// phase 2
				begin 


					ce_count_test = 1'b1;



					ce_cnt_finish = 1'b0;

					ce_cnt_phase1 = 1'b0;
					ce_cnt_phase2 = 1'b1;
					ce_cnt_phase3 = 1'b0;

					ce_cnt_tm_addr_port1 = 1'b0;
					ce_cnt_tm_addr_port2 = 1'b0;

					ce_cnt_dm_addr_port1 = 1'b0;
					
					post_transpose = 1'b1;
					stall_fft = 1'b1;
					sel_fft = 7'b1111111;
					shift_data = 7'b0000000;

					sel_mux0 = 1'b0;
					sel_mux1 = 1'b0;
					sel_mux3 = 1'b0;
					
					sel_dmux0 = 1'b0;
					sel_dmux1 = 1'b0;
					

					dm_WEB2 = 1'b1;
					dm_OEB2 = 1'b1;
					dm_CSB2 = 1'b1;
					dm_A2 = {`DM_ADDR{1'b0}};
					

					
					fm_WEB2 = 1'b1;
					fm_OEB2 = 1'b1;
					fm_CSB2 = 1'b1;
					fm_A2 = {`FM_ADDR{1'b0}};

					tm_WEB1 = 1'b1;
					tm_OEB1 = 1'b1;
					tm_CSB1 = {`TM_BANK_NUM{1'b1}};
					tm_A1 = {`TM_ADDR{1'b0}};
					tm_WEB2 = 1'b1;
					tm_OEB2 = 1'b1;
					tm_CSB2 = {`TM_BANK_NUM{1'b1}};
					tm_A2 = {`TM_ADDR{1'b0}};


					//Control:
					sel_mux2 = 1'b0;

					dm_WEB1 = 1'b1;
					dm_OEB1 = 1'b0;
					dm_CSB1 = 1'b0;
					dm_A1 = cnt_dm_addr_phase2;

					fm_WEB1 = 1'b1;
					fm_OEB1 = 1'b0;
					fm_CSB1 = 1'b0;
					fm_A1 = cnt_dm_addr_phase2;

					

					if(cnt_phase2 == 10'd0) ce_mul = 1'b1;
					else if(cnt_phase2 == 10'd1) ce_mul = 1'b0;
					else if(cnt_phase2 >= 10'd2) ce_mul = ce_mul_reg_delay;

					
					if(fft_mode == 3'd5) begin	//fft2048
						mode = 2'b00;	//fft16
					end
					else if(fft_mode == 3'd4) begin	//fft1024
						mode = 2'b01;	//fft8
					end
					else if(fft_mode == 3'd3) begin	//fft512
						mode = 2'b10;	//fft4
					end
					else if(fft_mode == 3'd2) begin	//fft256
						mode = 2'b11;	//fft2
					end

					position = cnt_dm_addr_phase2_delay3;



					if((fft_mode == 3'd5) && (done_arrange_signal_delay3) && (cnt_dm_addr_phase2_delay2 == 4'd0)) begin //fft2048
						next_state = fft_calculation;
						ce_cnt_dm_addr_phase2 = 1'b0;
					end
					else if((fft_mode == 3'd4) && (done_arrange_signal_delay3) && (cnt_dm_addr_phase2_delay2 == 4'd8)) begin //fft1024
						next_state = fft_calculation;
						ce_cnt_dm_addr_phase2 = 1'b0;
					end
					else if((fft_mode == 3'd3) && (done_arrange_signal_delay3) && (cnt_dm_addr_phase2_delay2 == 4'd4)) begin //fft512
						next_state = fft_calculation;
						ce_cnt_dm_addr_phase2 = 1'b0;
					end
					else if((fft_mode == 3'd2) && (done_arrange_signal_delay3) && (cnt_dm_addr_phase2_delay2 == 4'd2)) begin //fft256
						next_state = fft_calculation;
						ce_cnt_dm_addr_phase2 = 1'b0;
					end
					else begin
						ce_cnt_dm_addr_phase2 = 1'b1;
						next_state = multiplier;
					end
				end

			read_data_out:
				begin	
					next_state = read_data_out;

					ce_count_test = 1'b0;

					// default part

					ce_cnt_dm_addr_port1 = 1'b0;
					ce_cnt_dm_addr_port2 = 1'b0;

					shift_data = 7'b0000000;

					ce_cnt_phase1 = 1'b0;
					ce_cnt_phase2 = 1'b0;
					ce_cnt_phase3 = 1'b0;
					ce_cnt_dm_addr_phase2 = 1'b0;
					ce_cnt_tm_addr_port1 = 1'b0;
					ce_cnt_tm_addr_port2 = 1'b0;

					
					

					//post_transpose = 1'b0;
					stall_fft = 1'b1;
					sel_fft = 7'b1111111;
					sel_mux0 = 1'b0;
					sel_mux1 = 1'b0;
					sel_mux2 = 1'b0;
					
					sel_dmux0 = 1'b0;
					sel_dmux1 = 1'b0;
					ce_mul = 1'b0;
					mode = 2'b00;
					position = 4'b0;

					
					dm_WEB2 = 1'b1;
					dm_OEB2 = 1'b1;
					dm_CSB2 = 1'b1;
					dm_A2 = {`DM_ADDR{1'b0}};

					fm_WEB1 = 1'b1;
					fm_OEB1 = 1'b1;
					fm_CSB1 = 1'b1;
					fm_A1 = {`FM_ADDR{1'b0}};
					fm_WEB2 = 1'b1;
					fm_OEB2 = 1'b1;
					fm_CSB2 = 1'b1;
					fm_A2 = {`FM_ADDR{1'b0}};

					
					tm_WEB2 = 1'b1;
					tm_OEB2 = 1'b1;
					tm_CSB2 = {`TM_BANK_NUM{1'b1}};
					tm_A2 = {`TM_ADDR{1'b0}};

					// control part

					
					if(cnt_finish == 0) begin
						ce_cnt_finish = 1'b1;
					end
					else if(cnt_finish == 1) begin
						ce_cnt_finish = 1'b1;
					end
					else if(cnt_finish == 2'd2) begin
						ce_cnt_finish = 1'b0;
					end

					if(fft_mode == 3'd0) begin //fft64
						sel_mux3 = 1'b0;
					end
					else if(fft_mode == 3'd1) begin //fft128
						sel_mux3 = 1'b0;
					end
					else if(fft_mode == 3'd2) begin //fft256
						sel_mux3 = 1'b1;
					end
					else if(fft_mode == 3'd3) begin //fft512
						sel_mux3 = 1'b1;
					end
					else if(fft_mode == 3'd4) begin //fft1024
						sel_mux3 = 1'b1;
					end
					else if(fft_mode == 3'd5) begin //fft2048
						sel_mux3 = 1'b1;
					end


					if((fft_mode == 3'd0) && (cnt_dm_addr_port1 >= 4'd0)) begin //fft64
						ce_cnt_dm_addr_port1 = 1'b0;
					end
					else if((fft_mode == 3'd1)&&(cnt_dm_addr_port1 >= 4'd0)) begin //fft128
						ce_cnt_dm_addr_port1 = 1'b0;
					end
					else if((fft_mode == 3'd2)&&(cnt_dm_addr_port1 >= 4'd1)) begin //fft256
						ce_cnt_dm_addr_port1 = 1'b0;
					end
					else if((fft_mode == 3'd3)&&(cnt_dm_addr_port1 >= 4'd3)) begin //fft512
						ce_cnt_dm_addr_port1 = 1'b0;
					end
					else if((fft_mode == 3'd4)&&(cnt_dm_addr_port1 >= 4'd7)) begin //fft1024
						ce_cnt_dm_addr_port1 = 1'b0; 
					end
					else if((fft_mode == 3'd5)&&(cnt_dm_addr_port1 >= 4'd15)) begin //fft2048
						ce_cnt_dm_addr_port1 = 1'b0; 
					end
					else begin
						ce_cnt_dm_addr_port1 = 1'b1;
					end


					dm_WEB1 = 1'b1;
					dm_OEB1 = 1'b0;
					dm_CSB1 = 1'b0;
					dm_A1 = cnt_dm_addr_port1;

					tm_WEB1 = 1'b1;
					tm_OEB1 = 1'b0;
					tm_CSB1 = 16'b0;
					tm_A1 = cnt_dm_addr_port1;	// Dung chung cnt_dm_addr_port1


				end
			// default : 
			// 	begin

			// 	end
		endcase
	end

endmodule