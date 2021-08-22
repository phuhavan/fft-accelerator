`include "localmem_defines.h"

//======================================================
module dmem_array
(
	//--- Port 1
		input 										CE1,
		input 										WEB1,
		input 										OEB1,
		input 										CSB_ARRAY1,
		input 	[`DM_ARRAY_ROW_ADDR-1:0] 		A1,
		input 	[`DM_ARRAY_COLS-1:0] 			I1,
		output 	[`DM_ARRAY_COLS-1:0] 			O1,

	//--- Port 2
		input 										CE2,
		input 										WEB2,
		input 										OEB2,
		input 										CSB_ARRAY2,
		input 	[`DM_ARRAY_ROW_ADDR-1:0] 		A2,
		input 	[`DM_ARRAY_COLS-1:0] 			I2,
		output 	[`DM_ARRAY_COLS-1:0]				O2


);

	localparam		bus_size	= 32;			// equal to SRAM2RW16x32 data bus 
	genvar 			i;

	generate 
		for (i=0; i<`DM_ARRAY_COLS/bus_size; i=i+1)
			SRAM2RW16x32  inst_SRAM2RW16x32 		
			(
				.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB_ARRAY1),  .A1(A1), 
					.I1(I1[(i+1)*bus_size-1:i*bus_size]), .O1(O1[(i+1)*bus_size-1:i*bus_size]),
				.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB_ARRAY2),  .A2(A2), 
					.I2(I2[(i+1)*bus_size-1:i*bus_size]), .O2(O2[(i+1)*bus_size-1:i*bus_size])
			);			
	endgenerate

endmodule // dmem_array

//======================================================
module dmem_bank
(
	//--- Bank select
		input										CSB_BANK,

	//--- Access mode (Burst mode (0) or  Sequence Mode (1))
		input										MODE,

	//--- Port 1
		input 										CE1,
		input 										WEB1,
		input 										OEB1,
		input 	[`DM_BANK_ADDR-1:0] 				A1,
		input 	[`DM_BANK_COLS-1:0] 				I1,
		output 	[`DM_BANK_COLS-1:0]				O1,

	//--- Port 2
		input 										CE2,
		input 										WEB2,
		input 										OEB2,
		input 	[`DM_BANK_ADDR-1:0] 				A2,
		input 	[`DM_BANK_COLS-1:0] 				I2,
		output 	[`DM_BANK_COLS-1:0]				O2,

	//--- Sequence data
		output	[`DM_ARRAY_COLS-1:0]				SEQ_O1,
		output	[`DM_ARRAY_COLS-1:0]				SEQ_O2		
);


	wire 		[`DM_ARRAY_NUM-1:0]				CSB_ARRAY1, CSB_ARRAY2;
	wire            [`DM_ARRAY_SELECT-1:0]			ARRAY_SEL1, ARRAY_SEL2;
	wire		[`DM_BANK_COLS-1:0]				tempO1, tempO2;

	genvar 	   	i, j;

	//--- decode address to set CSB_ARRAY1 and CSB_ARRAY2
		assign ARRAY_SEL1 = A1[`DM_ARRAY_SELECT-1:0];
		assign ARRAY_SEL2 = A2[`DM_ARRAY_SELECT-1:0];

		generate
			for (j=0; j<`DM_ARRAY_NUM; j=j+1) begin	
				// if CSB_BANK = 1 then disable all MEM_ARRAYS		
				assign CSB_ARRAY1[j] = CSB_BANK | (($unsigned(ARRAY_SEL1) == j || !MODE) ? 1'b0 : 1'b1);
				assign CSB_ARRAY2[j] = CSB_BANK | (($unsigned(ARRAY_SEL2) == j || !MODE) ? 1'b0 : 1'b1);
			end
		endgenerate

	//--- initialize array
		generate
			for (i=0; i<`DM_ARRAY_NUM; i=i+1) begin
				dmem_array  inst_dmem_array  
				(
					.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB_ARRAY1(CSB_ARRAY1[i]),  .A1(A1[`DM_BANK_ADDR-1:`DM_ARRAY_SELECT]), 
					.I1(I1[(i+1)*`DM_ARRAY_COLS-1:i*`DM_ARRAY_COLS]), .O1(tempO1[(i+1)*`DM_ARRAY_COLS-1:i*`DM_ARRAY_COLS]),

					.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB_ARRAY2(CSB_ARRAY2[i]),  .A2(A2[`DM_BANK_ADDR-1:`DM_ARRAY_SELECT]),  
					.I2(I2[(i+1)*`DM_ARRAY_COLS-1:i*`DM_ARRAY_COLS]), .O2(tempO2[(i+1)*`DM_ARRAY_COLS-1:i*`DM_ARRAY_COLS])
				);
			end
		endgenerate

	// output mux
		assign O1 = tempO1;
		assign O2 = tempO2;

		assign SEQ_O1 = (MODE) ? tempO1 >> $unsigned(ARRAY_SEL1)*`DM_ARRAY_COLS : 0;
		assign SEQ_O2 = (MODE) ? tempO2 >> $unsigned(ARRAY_SEL2)*`DM_ARRAY_COLS : 0;

endmodule

//======================================================
module dmem
(
	//--- Access mode (Burst mode (0) or  Sequence Mode (1))
		input									MODE,

	//--- Port 1
		input 									CE1,			
		input 									WEB1,
		input 									OEB1,
		input 	[`DM_ADDR-1:0] 				A1,
		input 	[`DM_COLS-1:0] 				I1,
		output 	[`DM_COLS-1:0]				O1,

	//--- Port 2
		input 									CE2,			
		input 									WEB2,
		input 									OEB2,
		input 	[`DM_ADDR-1:0]				A2,
		input 	[`DM_COLS-1:0]		 		I2,
		output 	[`DM_COLS-1:0]				O2,

	//--- Sequence data
		output	[`DM_ARRAY_COLS-1:0]			SEQ_O1,
		output	[`DM_ARRAY_COLS-1:0]			SEQ_O2
);

	genvar 	   		 i;
	
	wire  		[`DM_BANK_NUM-1:0]   					CSB_BANK;
	wire		[`DM_BANK_SELECT-1:0]					BANK_SELECT1, BANK_SELECT2;
	reg			[`DM_BANK_SELECT-1:0]					REG_BANK_SELECT1, REG_BANK_SELECT2;
	reg														REG_MODE;

	wire		[`DM_BANK_COLS*`DM_BANK_NUM-1:0]	tempO1, tempO2;
	wire		[`DM_ARRAY_COLS*`DM_BANK_NUM-1:0]	tempSEQ_O1, tempSEQ_O2;

	//--- decode address to set CSB1_BANK and CSB2_BANK

		assign BANK_SELECT1 = A1[`DM_ADDR-1:`DM_BANK_ADDR];
		assign BANK_SELECT2 = A2[`DM_ADDR-1:`DM_BANK_ADDR];

		always @(posedge CE1)
			REG_BANK_SELECT1 <= BANK_SELECT1;

		always @(posedge CE2) begin
			REG_BANK_SELECT2 <= BANK_SELECT2;
			REG_MODE	<= MODE;
		end

		generate
			for (i=0; i<`DM_BANK_NUM; i=i+1) begin	
				assign CSB_BANK[i] = ($unsigned(BANK_SELECT1) == i || $unsigned(BANK_SELECT2) == i) ? 1'b0 : 1'b1;
			end
		endgenerate

	//--- initialize bank
		generate
			for (i=0; i<`DM_BANK_NUM; i=i+1) begin
				dmem_bank  inst_dmem_bank
				(
					.MODE(REG_MODE), .CSB_BANK(CSB_BANK[i]),

					.CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .A1(A1[`DM_BANK_ADDR-1:0]), .I1(I1), 
					.O1(tempO1[(i+1)*`DM_BANK_COLS-1:i*`DM_BANK_COLS]), .SEQ_O1(tempSEQ_O1[(i+1)*`DM_ARRAY_COLS-1:i*`DM_ARRAY_COLS]),

					.CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .A2(A2[`DM_BANK_ADDR-1:0]), .I2(I2), 
					.O2(tempO2[(i+1)*`DM_BANK_COLS-1:i*`DM_BANK_COLS]), .SEQ_O2(tempSEQ_O2[(i+1)*`DM_ARRAY_COLS-1:i*`DM_ARRAY_COLS])
				);
			end
		endgenerate

	//--- output mux
		assign O1 		= tempO1 >> ($unsigned(REG_BANK_SELECT1)*`DM_BANK_COLS);
		assign O2 		= tempO2 >> ($unsigned(REG_BANK_SELECT2)*`DM_BANK_COLS);

		assign SEQ_O1	=  (REG_MODE) ? (tempSEQ_O1 >> ($unsigned(REG_BANK_SELECT1)*`DM_ARRAY_COLS)) : 0;
		assign SEQ_O2	=  (REG_MODE) ? (tempSEQ_O2 >> ($unsigned(REG_BANK_SELECT2)*`DM_ARRAY_COLS)) : 0;

endmodule
