`include "localmem_defines.h"

//======================================================
//======================================================
module dmem_bank
(
	//--- Port 1
		input 										CE1,
		input 										WEB1,
		input 										OEB1,
		input 										CSB1,
		input 	[`DM_BANK_ADDR-1:0] 				A1,
		input 	[`DM_BANK_COLS-1:0] 				I1,
		output 	[`DM_BANK_COLS-1:0] 				O1,

	//--- Port 2
		input 										CE2,
		input 										WEB2,
		input 										OEB2,
		input 										CSB2,
		input 	[`DM_BANK_ADDR-1:0] 				A2,
		input 	[`DM_BANK_COLS-1:0] 				I2,
		output 	[`DM_BANK_COLS-1:0]				O2
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

endmodule // dmem_bank


//======================================================
//======================================================
module dmem
(
	//--- Port 1
		input 								CE1,
		input 								WEB1,
		input 								OEB1,
		input 								CSB1,
		input 	[`DM_ADDR-1:0] 			A1,
		input 	[`DM_COLS-1:0] 			I1,
		output 	[`DM_COLS-1:0] 			O1,

	//--- Port 2
		input 								CE2,
		input 								WEB2,
		input 								OEB2,
		input 								CSB2,
		input 	[`DM_ADDR-1:0] 			A2,
		input 	[`DM_COLS-1:0] 			I2,
		output 	[`DM_COLS-1:0]			O2
);
	wire		[`DM_COLS-1:0] 			wireO1, wireO2;

	genvar 	   	i;

	generate
		for (i=0; i<`DM_BANK_NUM; i=i+1) begin: gen_dmem_bank
			dmem_bank  inst_dmem_bank
			(
				.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1),  .A1(A1[`DM_ADDR-1:0]), 
					.I1(I1[(i+1)*`DM_BANK_COLS-1:i*`DM_BANK_COLS]), .O1(wireO1[(i+1)*`DM_BANK_COLS-1:i*`DM_BANK_COLS]),
				.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2),  .A2(A2[`DM_ADDR-1:0]), 
					.I2(I2[(i+1)*`DM_BANK_COLS-1:i*`DM_BANK_COLS]), .O2(wireO2[(i+1)*`DM_BANK_COLS-1:i*`DM_BANK_COLS])
			);
		end
	endgenerate

	assign	O1 			= wireO1;
	assign	O2 			= wireO2;

endmodule