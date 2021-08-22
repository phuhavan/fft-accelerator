
module vcEQComparator_test
(
  input  [31:0] in0,
  input  [31:0] in1,
  output        out
);

  wire [31:0] xor_results = in0 ^ in1;

  wire L0_0 = ~| xor_results[ 3: 0];
  wire L0_1 = ~| xor_results[ 7: 4];
  wire L0_2 = ~| xor_results[11: 8];
  wire L0_3 = ~| xor_results[15:12];  
  wire L0_4 = ~| xor_results[19:16];
  wire L0_5 = ~| xor_results[23:20];
  wire L0_6 = ~| xor_results[27:24];
  wire L0_7 = ~| xor_results[31:28];  

  wire L1_0 = ~ ( L0_0 | L0_1 | L0_2 | L0_3 );
  wire L1_1 = ~ ( L0_4 | L0_5 | L0_6 | L0_7 );

  wire L2_0 = ~ ( L1_0 | L1_1 );
                  
  assign out = L2_0;

endmodule

