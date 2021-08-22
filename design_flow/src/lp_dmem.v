//module DM_SRAM32LP_2RW_32x1536b 
module lp_dmem
#(
	parameter   num_bank = 48
)
(
	//--- Port 1
		input 								SD1,
		input 								CE1,
		input 								WEB1,
		input 								OEB1,
		input 								CSB1,
		input 								DS1,
		input 								LS1,
		input 	[4:0] 						A1,
		input 	[32*num_bank-1:0] 		I1,
		output 	[32*num_bank-1:0] 		O1,

	//--- Port 2
		input 								SD2,
		input 								CE2,
		input 								WEB2,
		input 								OEB2,
		input 								CSB2,
		input 								DS2,
		input 								LS2,
		input 	[4:0] 						A2,
		input 	[32*num_bank-1:0] 		I2,
		output 	[32*num_bank-1:0]		O2
);

	genvar 	   	i;
	generate
		for (i=0; i<num_bank; i=i+1) begin
			SRAMLP2RW32x32  inst_SRAMLP2RW32x32  
			(
				.SD1(SD1), .CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1),  .DS1(DS1), .LS1(LS1), .A1(A1), .I1(I1[32*i + 31:32*i]), .O1(O1[32*i + 31:32*i]),
				.SD2(SD2),  .CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2),  .DS2(DS2), .LS2(LS2), .A2(A2), .I2(I2[32*i + 31:32*i]), .O2(O2[32*i + 31:32*i])
			);
		end
	endgenerate

endmodule