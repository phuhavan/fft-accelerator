//=====================================================
//
//
//=====================================================
`include "defines.h"
`include "macros.h"

`include "localmem_defines.h"

module localmemTestBench
#(
	//--- complex data width
		parameter	width 		= 24,
	//--- number of simulation cycle (# inputs)
		parameter simcycle 	= 100000
);

// task
  	task  PRINT_MODE;
  		input 	NUM_RW, MODE;
  		input 	CSB1, WEB1, OEB1, A1;
  		input 	CSB2, WEB2, OEB2, A2;
	begin
		$display("===============================================================");
		$display("WARNS --- Finish WRITING to localmem, start READING !!!");
		$display("INFOR --- Port 1: CSB1=%d, OEB1 <=%d, WEB1=%d, A1=%d", CSB1, OEB1, WEB1, A1);
		$display("INFOR --- Port 2: CSB2=%d, OEB2 <=%d, WEB2=%d, A2=%d", CSB2, OEB2, WEB2, A2);
		$display("===============================================================");		

		if (!MODE) begin
			if (WEB1) 	$display("INFOR --- WRITE %d data to PORT 1 in BURST mode", NUM_RW);
			else 		$display("INFOR --- READ %d data to PORT 1 in BURST mode", NUM_RW);
			if (WEB2) 	$display("INFOR --- WRITE %d data to PORT 2 in BURST mode", NUM_RW);
			else 		$display("INFOR --- READ %d data to PORT 2 in BURST mode", NUM_RW);
		end
		else begin
			if (WEB1) 	$display("INFOR --- WRITE %d data to PORT 1 in SEQUENCE mode", NUM_RW);
			else 		$display("INFOR --- READ %d data to PORT 1 in SEQUENCE mode", NUM_RW);
			if (WEB2) 	$display("INFOR --- WRITE %d data to PORT 2 in SEQUENCE mode", NUM_RW);
			else 		$display("INFOR --- READ %d data to PORT 2 in SEQUENCE mode", NUM_RW);
		end
  	end
  	endtask

// synopsys translate_off
	localparam						hwidth 	= width/2;

	wire							clk, rst, stall, stall_out;
	wire 	signed [31:0]			cur_cycle;

	always @(posedge clk) begin
		if (stall_out && cur_cycle > 4) begin	
			`ifdef GEN_VCD
				$display ("WARNS --- Generate VCD file !");

				`ifdef MODELSIM						// defined in <designs.h> file
					$dumpflush;
					$dumpoff;
				`elsif VCS
					$vcdplusflush;
					$vcdplusoff;
				`else
					$display ("ERROR --- Simulation tool is not supported (ModelSim or Synopsys VCS");
				`endif
			`else
				$display ("WARNS --- No VCD file is generated !");
			`endif
			$display ("INFOR --- Simulation is finished at cycle   %d", cur_cycle);
			$display ("INFOR --- CLOCK_PERIOD:                          %.3f", `CLOCK_PERIOD); 
		end
	end

	// clock generator
		vcClockGen	 #(.clockperiod(`CLOCK_PERIOD)) 
			inst_vcClockGen(.clk(clk), .n_clk(n_clk), .rst(rst), .cur_cycle(cur_cycle));
		fifo #(.depth(3))
			inst_fifo(.clk(clk), .rst(rst), .stall_in(stall), .stall_out(stall_out));

	// start generating VCD file for power estimation
		initial begin  			
			`ifdef GEN_VCD
				$dumpfile(`VCD_FILE);
				$dumpvars(0, dut_localmem);			// dump all variables inside dut_localmem4 into VCD file

				`ifdef MODELSIM
					$display ("INFOR --- Using ModelSim simulator");
				`elsif VCS
					$display ("INFOR --- Using Synopsys VCS simulator");
					$vcdpluson;
				`else
					$display ("ERROR --- Simulation tool is not supported (ModelSim or Synopsys VCS)");
				`endif				
			`endif
		end

		//================================================
			reg				[`MEM_BANK_COLS-1:0]	read_cnt, write_cnt;
			integer										i, j;

			localparam									INIT_MODE = 0, BURST_WRITE=1, BURST_READ=2, SEQ_READ=3, STALL_MODE=4;
			reg				[255:0]						MODE_STR;

			reg				[4:0]						VERIFY_STATE, NEXT_VERIFY_STATE;
			reg											MODE;

			wire 			[31:0]						CE1, CE2;
			reg 										OEB1, CSB1;
			reg											OEB2, CSB2;

			reg											WEB1, WEB2;
			reg	  			[`MEM_ADDR:0]			A1, A2;
			reg  			[`MEM_COLS-1: 0]			I1, I2;

			wire  			[`MEM_COLS-1: 0]			O1, O2;			
			wire			[`MEM_BANK_COLS-1:0]	SEQ_O1, SEQ_O2;

			//--- initialize for memory control signals
				genvar k;

				generate
					for (k=0; k<32; k=k+1) begin
						assign CE1[k] = clk;
						assign CE2[k] = clk;	
					end
				endgenerate

		//************************************************************************************************
		// VERIFICATION phases: BURST write -> BURST read -> SEQUENCE write -> SEQUENCE read
		//************************************************************************************************
			always @(posedge clk or posedge rst) begin
				if (rst) begin
					VERIFY_STATE 	<= INIT_MODE;
					MODE_STR 		<= "INIT_MODE";
				end
				else begin
					VERIFY_STATE 	<= NEXT_VERIFY_STATE;
				end
			end

			// BURST write
				always @(posedge clk) begin
					case (VERIFY_STATE)
						INIT_MODE: begin
							$display("INFOR --- DMEM: rows=%6d, cols=%6d, addr=%6d bits",  
									`MEM_ROWS, `MEM_COLS, `MEM_ADDR);
							$display("INFOR --- BANK: num_banks=%6d, rows=%6d, cols=%6d, addr=%6d bits",  
									`MEM_BANK_NUM, `MEM_BANK_ROWS, `MEM_BANK_COLS, `MEM_BANK_ADDR);

							NEXT_VERIFY_STATE = BURST_WRITE;
							MODE <= 1'b0;  MODE_STR <= "BURST_WRITE";
							WEB1 <= 1'b0; CSB1 <= 0; OEB1 <= 1'b0; A1 <= 0; I1 <= 33;			// write port 1	
							WEB2 <= 1'bx; CSB2 <= 0; OEB2 <= 1'bx;    						 		// disable port 2	
							write_cnt <= 33;
						end
						
						BURST_WRITE :	 begin	// WRITE all rows of memory  
							if (A1[`MEM_ADDR-1:`MEM_BANK_SELECT]  == `MEM_ROWS-1) begin							
								NEXT_VERIFY_STATE = BURST_READ;
								MODE <= 1'b0;  MODE_STR <= "BURST_READ";
								WEB1 <= 1'b1; 					// read port 1

								$display("INFOR --- FInished WRITE in BURST mode after %8d writes", $unsigned(A1[`MEM_ADDR:`MEM_BANK_SELECT])); 
							end
							else begin
								write_cnt <= write_cnt + 1;
								I1  <= write_cnt;
								A1 <= A1 + (1 << `MEM_BANK_SELECT);								
							end
						end

						BURST_READ: begin   // READ all rows of memory 
							if (A1[`MEM_ADDR-1:`MEM_BANK_SELECT]  == `MEM_ROWS-1) begin		
								NEXT_VERIFY_STATE = SEQ_READ;								
								MODE <= 1'b1; MODE_STR <= "SEQ_READ";
								I1 = 'x;	 A1 <=0;	

								$display("INFOR --- FInished READ in BURST mode after %8d reads", $unsigned(A2[`MEM_ADDR:`MEM_BANK_SELECT])); 
							end
							else begin
								A1 <= A1 +  (1 << `MEM_BANK_SELECT);								
							end
						end

						SEQ_READ: begin	// READ individual bank
							if (A1 == 2**`MEM_ADDR) begin												// READ all data blocks (SEQ mode)
								NEXT_VERIFY_STATE = BURST_WRITE;
								MODE <= 1'b0; MODE_STR <= "BURST_WRITE";
								WEB1 <= 1'b0; CSB1 <= 1'b0; OEB1 <= 1'b0; A1 <= 0; 

								$display("INFOR --- FInished READ in SEQ mode after %8d reads", $unsigned(A2)); 
								$finish;
							end
							else begin
								A1 <= A1 + 1;
							end							
						end
					endcase
				end

			// Design-Under-Test (DUT)
				`ifdef  SIM_DMEM
					dmem dut_localmem 
					(	
						.CE1(CE1[0]), .WEB1(WEB1), .CSB1(CSB1), .OEB1(OEB1), .A1(A1[`MEM_ADDR-1:0]), .I1(I1), .O1(O1), .SEQ_O1(SEQ_O1),
						.CE2(CE2[1]), .WEB2(WEB2), .CSB2(CSB2), .OEB2(OEB2), .A2(A2[`MEM_ADDR-1:0]), .I2(I2), .O2(O2), .SEQ_O2(SEQ_O2)
					);
				`elsif  SIM_FMEM
					fmem dut_localmem 
					(	
						.CE1(CE1[0]), .WEB1(WEB1), .CSB1(CSB1), .OEB1(OEB1), .A1(A1[`MEM_ADDR-1:0]), .I1(I1), .O1(O1), .SEQ_O1(SEQ_O1)
					);

				`else
					$display("ERROR --- LOCALMEM is undefined");
					$finish;
				`endif		

// synopsys translate_on

endmodule

