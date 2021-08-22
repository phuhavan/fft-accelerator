`include "localmem_defines.h"

//======================================================
//======================================================
module fmem_bank
(
	//--- Port 1
		input 										CE1,
		input 										WEB1,
		input 										OEB1,
		input 										CSB1,
		input 	[`FM_BANK_ADDR-1:0] 				A1,
		input 	[`FM_BANK_COLS-1:0] 				I1,
		output 	[`FM_BANK_COLS-1:0] 				O1,

	//--- Port 2
		input 										CE2,
		input 										WEB2,
		input 										OEB2,
		input 										CSB2,
		input 	[`FM_BANK_ADDR-1:0] 				A2,
		input 	[`FM_BANK_COLS-1:0] 				I2,
		output 	[`FM_BANK_COLS-1:0] 				O2
);

	localparam		bus_size	= 32;				// equal to SRAM2RW16x32 data bus 
	genvar 			i;

	generate 
		for (i=0; i<`DM_BANK_COLS/bus_size; i=i+1) begin: gen_sram
			SRAM2RW16x32  inst_SRAM2RW16x32		
			(
				.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1),  .A1(A1), 
					.I1(I1[(i+1)*bus_size-1:i*bus_size]), .O1(O1[(i+1)*bus_size-1:i*bus_size]),
				.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2),  .A2(A2), 
					.I2(I2[(i+1)*bus_size-1:i*bus_size]), .O2(O2[(i+1)*bus_size-1:i*bus_size])
			);			
		end
	endgenerate

endmodule // fmem_bank


//======================================================
//======================================================
module fmem
(
	//--- Port 1
		input 								CE1,
		input 								WEB1,
		input 								OEB1,
		input 								CSB1,
		input 	[`FM_ADDR-1:0] 				A1,
		input 	[`FM_COLS-1:0] 				I1,
		output 	[`FM_COLS-1:0] 				O1,
	//--- Port 2
		input 								CE2,
		input 								WEB2,
		input 								OEB2,
		input 								CSB2,
		input 	[`FM_ADDR-1:0] 				A2,
		input 	[`FM_COLS-1:0] 				I2,
		output 	[`FM_COLS-1:0] 				O2
);

	wire		[`FM_COLS-1:0] 			wireO1, wireO2;

	genvar 	   	i;

	generate
		for (i=0; i<`FM_BANK_NUM; i=i+1) begin: gen_fmem_bank
			fmem_bank  inst_fmem_bank
			(
				.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1),  .A1(A1[`FM_ADDR-1:0]), 
					.I1(I1[(i+1)*`FM_BANK_COLS-1:i*`FM_BANK_COLS]), .O1(wireO1[(i+1)*`FM_BANK_COLS-1:i*`FM_BANK_COLS]),
				.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2),  .A2(A2[`FM_ADDR-1:0]), 
					.I2(I2[(i+1)*`FM_BANK_COLS-1:i*`FM_BANK_COLS]), .O2(wireO2[(i+1)*`FM_BANK_COLS-1:i*`FM_BANK_COLS])

			);
		end
	endgenerate


	assign	O1 			= wireO1;
	assign	O2 			= wireO2;	// Not use


endmodule