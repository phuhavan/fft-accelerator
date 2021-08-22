`include "localmem_defines.h"

//======================================================
module top_fft_accelerator 
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

	input 	[3:0] 			mode_application,	// 16 cases
	input	[bus_width-1:0]	data_in,
	input 	[bus_width-1:0]	data_in_fmem,
	
	output	[bus_width-1:0] data_out,
	output 					out_valid,
	output 					finish_fft_process
);
	
	wire clk_n;

	wire [2:0] fft_mode;
	wire stall;
	wire [6:0] sel_fft;
	wire sel_mux0;
	wire sel_mux1;
	wire sel_mux2;
	wire sel_mux3;
	wire sel_dmux0;
	wire sel_dmux1;
	wire ce_mul;
	wire [3:0] position;
	wire dm_CE1;
	wire dm_WEB1;
	wire dm_OEB1;
	wire dm_CSB1;
	wire [`DM_ADDR-1:0] dm_A1;
	wire dm_CE2;
	wire dm_WEB2;
	wire dm_OEB2;
	wire dm_CSB2;
	wire [`DM_ADDR-1:0] dm_A2;
	wire fm_CE1;
	wire fm_WEB1;
	wire fm_OEB1;
	wire fm_CSB1;
	wire [`FM_ADDR-1:0] fm_A1;
	wire fm_CE2;
	wire fm_WEB2;
	wire fm_OEB2;
	wire fm_CSB2;
	wire [`FM_ADDR-1:0] fm_A2;
	wire tm_CE1;
	wire tm_WEB1;
	wire tm_OEB1;
	wire [`TM_BANK_NUM-1:0] tm_CSB1;
	wire [`TM_ADDR-1:0] tm_A1;
	wire tm_CE2;
	wire tm_WEB2;
	wire tm_OEB2;
	wire [`TM_BANK_NUM-1:0] tm_CSB2;
	wire [`TM_ADDR-1:0] tm_A2;
	wire done_arrange_signal;
	wire [1:0] mode;

	wire stall_out;

	wire [6:0] shift_data;

	assign fft_mode = ((mode_application == 4'd4)||(mode_application == 4'd6)||(mode_application == 4'd8)||(mode_application == 4'd10)) ? 3'b0 : 
						(((mode_application == 4'd2)||(mode_application == 4'd3)||(mode_application == 4'd5)||(mode_application == 4'd7)||(mode_application == 4'd9)||(mode_application == 4'd15)) ? 3'd1 : 
						((mode_application == 4'd1) || (mode_application == 4'd14)) ? 3'd2 : 
						((mode_application == 4'd0) || (mode_application == 4'd13)) ? 3'd3 :
						((mode_application == 4'd11)) ? 3'd4 : 
						((mode_application == 4'd12)) ? 3'd5 : 3'd6);

	assign clk_n = ~clk;


datapath #(.bus_width(bus_width), .width(width), .size(size)) 
	inst_datapath 
	(
		.clk                (clk                ),
		.rst                (rst                ),
		.stall              (stall              ),
		.ce_fft				(ce_fft),
		.sel_fft            (sel_fft            ),
		.sel_mux0           (sel_mux0           ),
		.sel_mux1           (sel_mux1           ),
		.sel_mux2           (sel_mux2           ),
		.sel_dmux0          (sel_dmux0          ),
		.sel_dmux1          (sel_dmux1          ),
		.ce_mul             (ce_mul             ),
		.mode               (mode   			), 
		.fft_mode		    (fft_mode),
		.position           (position           ),
		.dm_CE1             (clk             ),
		.dm_WEB1            (dm_WEB1            ),
		.dm_OEB1            (dm_OEB1            ),
		.dm_CSB1            (dm_CSB1            ),
		.dm_A1              (dm_A1              ),
		.dm_CE2             (clk             ),
		.dm_WEB2            (dm_WEB2            ),
		.dm_OEB2            (dm_OEB2            ),
		.dm_CSB2            (dm_CSB2            ),
		.dm_A2              (dm_A2              ),
		.fm_CE1             (clk             ),
		.fm_WEB1            (fm_WEB1            ),
		.fm_OEB1            (fm_OEB1            ),
		.fm_CSB1            (fm_CSB1            ),
		.fm_A1              (fm_A1              ),
		.fm_CE2             (clk             ),
		.fm_WEB2            (fm_WEB2            ),
		.fm_OEB2            (fm_OEB2            ),
		.fm_CSB2            (fm_CSB2            ),
		.fm_A2              (fm_A2              ),
		.tm_CE1             (clk             ),
		.tm_WEB1            (tm_WEB1            ),
		.tm_OEB1            (tm_OEB1            ),
		.tm_CSB1            (tm_CSB1            ),
		.tm_A1              (tm_A1              ),
		.tm_CE2             (clk             ),
		.tm_WEB2            (tm_WEB2            ),
		.tm_OEB2            (tm_OEB2            ),
		.tm_CSB2            (tm_CSB2            ),
		.tm_A2              (tm_A2              ),
		.data_in            (data_in            ),
		.data_in_fmem       (data_in_fmem       ),
		.data_out           (data_out           ),
		.done_arrange_signal(done_arrange_signal),
		.stall_out          (stall_out),
		.shift_data         (shift_data),
		.sel_mux3           (sel_mux3)
	);

	

controller #(.bus_width(bus_width), .width(width), .size(size)) 
	i_controller 
	(
		.clk                (clk                ),
		.rst                (rst                ),
		.done_arrange_signal(done_arrange_signal),
		.fft_mode   		(fft_mode   ),
		.ce_fft             (ce_fft),
		.stall_fft          (stall 		        ),
		.sel_fft            (sel_fft            ),
		.sel_mux0           (sel_mux0           ),
		.sel_mux1           (sel_mux1           ),
		.sel_mux2           (sel_mux2           ),
		.sel_dmux0          (sel_dmux0          ),
		.sel_dmux1          (sel_dmux1          ),
		.ce_mul             (ce_mul             ),
		.mode               (mode               ),
		.position           (position           ),
		.dm_WEB1            (dm_WEB1            ),
		.dm_OEB1            (dm_OEB1            ),
		.dm_CSB1            (dm_CSB1            ),
		.dm_A1              (dm_A1              ),
		.dm_WEB2            (dm_WEB2            ),
		.dm_OEB2            (dm_OEB2            ),
		.dm_CSB2            (dm_CSB2            ),
		.dm_A2              (dm_A2              ),
		.fm_WEB1            (fm_WEB1            ),
		.fm_OEB1            (fm_OEB1            ),
		.fm_CSB1            (fm_CSB1            ),
		.fm_A1              (fm_A1              ),
		.fm_WEB2            (fm_WEB2            ),
		.fm_OEB2            (fm_OEB2            ),
		.fm_CSB2            (fm_CSB2            ),
		.fm_A2              (fm_A2              ),
		.tm_WEB1            (tm_WEB1            ),
		.tm_OEB1            (tm_OEB1            ),
		.tm_CSB1            (tm_CSB1            ),
		.tm_A1              (tm_A1              ),
		.tm_WEB2            (tm_WEB2            ),
		.tm_OEB2            (tm_OEB2            ),
		.tm_CSB2            (tm_CSB2            ),
		.tm_A2              (tm_A2              ),
		.stall_out 			(stall_out),
		.shift_data         (shift_data),
		.sel_mux3           (sel_mux3),
		.finish_fft_process (finish_fft_process)
	);




endmodule