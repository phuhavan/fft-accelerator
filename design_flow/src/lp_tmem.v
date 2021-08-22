//module TM_SRAM32LP_2RW_32x768b 
module lp_tmem
#(
	parameter   num_bank = 32
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
		input 	[5:0] 						A1,
		input 	[24*num_bank-1:0] 		I1,
		output 	[24*num_bank-1:0] 		O1,

	//--- Port 2
		input 								SD2,
		input 								CE2,
		input 								WEB2,
		input 								OEB2,
		input 								CSB2,
		input 								DS2,
		input 								LS2,
		input 	[5:0] 						A2,
		input 	[24*num_bank-1:0] 		I2,
		output 	[24*num_bank-1:0]		O2
)

	genvar	   i;
	generate
		for (i=0; i<num_bank; i=i+1) begin
			SRAMLP2RW64x16 	inst_SRAMLP2RW64x16
			(
				.SD1(SD1), .CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1), .DS1(DS1), .LS1(LS1), .A1(A1), .I1(I1[24*i + 15:24*i]), .O1(O1[24*i + 15:24*i]),
				.SD2(SD2), .CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2), .DS2(DS2), .LS2(LS2), .A2(A2), .I2(I2[24*i + 15:24*i]), .O2(O2[24*i + 15:24*i])
			);

			SRAMLP2RW64x8	 inst_SRAMLP2RW64x8
			(
				.SD1(SD1), .CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1), .DS1(DS1), .LS1(LS1), .A1(A1), .I1(I1[24*i + 23:24*i+16]), .O1(O1[24*i + 23:24*i+16]),
				.SD2(SD2), .CE2(CE2), .WEB2(WEB2), .OEB2(OEB2), .CSB2(CSB2), .DS2(DS2), .LS2(LS2), .A2(A2), .I2(I2[24*i + 23:24*i+16]), .O2(O2[24*i + 23:24*i+16])
			);

		end
	endgenerate

endmodule