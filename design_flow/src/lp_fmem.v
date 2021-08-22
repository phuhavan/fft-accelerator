//module FM_SRAM32LP_32x384b 
module lp_fmem
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
		input 	[3:0] 						A1,
		input 	[32*num_bank-1:0] 		I1,
		output 	[32*num_bank-1:0] 		O1
);

	genvar 	   	i;
	generate
		for (i=0; i<num_bank; i=i+1) begin
			SRAMLP1RW16x32  inst_SRAMLP1RW16x32 
			(
				.SD1(SD1), .CE1(CE1), .WEB1(WEB1), .OEB1(OEB1), .CSB1(CSB1), .DS1(DS1), .LS1(LS1), .A1(A1), .I1(I1[32*i + 31:32*i]), .O1(O1[32*i + 31:32*i])
			);
		end
	endgenerate

endmodule