`include "localmem_defines.h"

//======================================================
//======================================================
module tmem_block
(
	//--- Port 1
		input 										CE1,
		input 										WEB1,
		input 										OEB1,
		input 										CSB1,
		input 	[`TM_BLOCK_ADDR-1:0] 				A1,
		input 	[`TM_BLOCK_COLS-1:0] 				I1,
		output 	[`TM_BLOCK_COLS-1:0] 				O1,

	//--- Port 2
		input 										CE2,
		input 										WEB2,
		input 										OEB2,
		input 										CSB2,
		input 	[`TM_BLOCK_ADDR-1:0] 				A2,
		input 	[`TM_BLOCK_COLS-1:0] 				I2,
		output 	[`TM_BLOCK_COLS-1:0]				O2
);

localparam		bus_size	= 32;				// equal to SRAM2RW16x16 data bus 

	SRAM2RW16x16  inst_SRAM2RW16x16 
	(
		.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1),  .A1(A1), 
			.I1(I1[`TM_BLOCK_COLS-1:`TM_BLOCK_COLS-16]), .O1(O1[`TM_BLOCK_COLS-1:`TM_BLOCK_COLS-16]),
		.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2),  .A2(A2), 
			.I2(I2[`TM_BLOCK_COLS-1:`TM_BLOCK_COLS-16]), .O2(O2[`TM_BLOCK_COLS-1:`TM_BLOCK_COLS-16])
	);
	SRAM2RW16x8  inst_SRAM2RW16x8	
	(
		.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1),  .A1(A1), 
			.I1(I1[`TM_BLOCK_COLS-17:0]), .O1(O1[`TM_BLOCK_COLS-17:0]),
		.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2),  .A2(A2), 
			.I2(I2[`TM_BLOCK_COLS-17:0]), .O2(O2[`TM_BLOCK_COLS-17:0])
	);		

endmodule // tmem_block

module tmem_bank
(
	//--- Port 1
		input 								CE1,
		input 								WEB1,
		input 								OEB1,
		input 	[`TM_BLOCK_NUM-1:0]			CSB1,
		input 	[`TM_BANK_ADDR-1:0] 		A1,
		input 	[`TM_BANK_COLS-1:0] 		I1,
		output 	[`TM_BANK_COLS-1:0] 		O1,

	//--- Port 2
		input 								CE2,
		input 								WEB2,
		input 								OEB2,
		input 	[`TM_BLOCK_NUM-1:0]			CSB2,
		input 	[`TM_BANK_ADDR-1:0] 		A2,
		input 	[`TM_BANK_COLS-1:0] 		I2,
		output 	[`TM_BANK_COLS-1:0]			O2
);	

	wire		[`TM_BANK_COLS-1:0] 		wireO1, wireO2;
	
	genvar 	   	i;

	generate
		for (i=0; i<`TM_BLOCK_NUM; i=i+1) begin
			tmem_block  inst_tmem_block
			(
				.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1[i]),  .A1(A1[`TM_BLOCK_ADDR-1:0]), 
				.I1(I1[(i+1)*`TM_BLOCK_COLS-1:i*`TM_BLOCK_COLS]), .O1(wireO1[(i+1)*`TM_BLOCK_COLS-1:i*`TM_BLOCK_COLS]),
				
				.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2[i]),  .A2(A2[`TM_BLOCK_ADDR-1:0]), 
				.I2(I2[(i+1)*`TM_BLOCK_COLS-1:i*`TM_BLOCK_COLS]), .O2(wireO2[(i+1)*`TM_BLOCK_COLS-1:i*`TM_BLOCK_COLS])
			);
		end
	endgenerate

	assign O1 = wireO1;
	assign O2 = wireO2;


endmodule // tmem_bank

module tmem
(
	//--- Port 1
		input 								CE1,
		input 								WEB1,
		input 								OEB1,
		input 	[`TM_BLOCK_NUM-1:0]			CSB1,
		input 	[`TM_ADDR-1:0] 				A1,
		input 	[`TM_FFT_WIDTH-1:0] 		I1,
		output 	[`TM_FFT_WIDTH-1:0] 		O1,

	//--- Port 2
		input 					 			CE2,
		input 								WEB2,
		input 								OEB2,
		input 	[`TM_BLOCK_NUM-1:0]			CSB2,
		input 	[`TM_ADDR-1:0] 				A2,
		input 	[`TM_FFT_WIDTH-1:0] 		I2,
		output 	[`TM_FFT_WIDTH-1:0]			O2
);	
	
	wire		[`TM_FFT_WIDTH-1:0] 			wireO1, wireO2;
	
	genvar 	   	i;

	generate
		for (i=0; i<`TM_BANK_NUM; i=i+1) begin
			tmem_bank  inst_tmem_bank
			(
				.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1),  .A1(A1[`TM_BANK_ADDR-1:0]), 
				.I1(I1[(i+1)*`TM_BANK_COLS-1:i*`TM_BANK_COLS]), .O1(wireO1[(i+1)*`TM_BANK_COLS-1:i*`TM_BANK_COLS]),
				
				.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2),  .A2(A2[`TM_BANK_ADDR-1:0]), 
				.I2(I2[(i+1)*`TM_BANK_COLS-1:i*`TM_BANK_COLS]), .O2(wireO2[(i+1)*`TM_BANK_COLS-1:i*`TM_BANK_COLS])
			);
		end
	endgenerate

	assign O1 = wireO1;
	assign O2 = wireO2;


endmodule //tmem