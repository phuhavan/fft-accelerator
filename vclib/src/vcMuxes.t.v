//**************************************************************************
// Tests for Muxes
//--------------------------------------------------------------------------
//

`include "vcTest.v"

module tester;  

  reg clk = 1;
  always #5 clk = ~clk;
  
  `VC_TEST_SUITE_BEGIN( "vcMuxes" )
   
  //--------------------------------------------------------------------
  // Test vcMux2_w32
  //--------------------------------------------------------------------
  
  reg  [31:0] mux2_in0, mux2_in1;  
  reg         mux2_sel;
  wire [31:0] mux2_out;
  
  vcMux2#(32) mux2
  (
    .in0 (mux2_in0),
    .in1 (mux2_in1),
    .sel (mux2_sel),
    .out (mux2_out)
  );

  `VC_TEST_CASE_BEGIN( 0, "vcMux2_w32" )
  begin 

    mux2_in0 = 32'h0a0a0a0a;
    mux2_in1 = 32'hb0b0b0b0;

    mux2_sel = 1'd0; #25;
    `VC_TEST_EQUAL( "sel == 0", mux2_out, 32'h0a0a0a0a )
    
    mux2_sel = 1'd1; #25;
    `VC_TEST_EQUAL( "sel == 1", mux2_out, 32'hb0b0b0b0 )
  
  end
  `VC_TEST_CASE_END
  
  //--------------------------------------------------------------------
  // Test vcMux4
  //--------------------------------------------------------------------
    
  reg  [31:0] mux4_in0, mux4_in1, mux4_in2, mux4_in3;
  reg  [ 1:0] mux4_sel;
  wire [31:0] mux4_out;
  
  vcMux4#(32) mux4
  (
    .in0 (mux4_in0),
    .in1 (mux4_in1),
    .in2 (mux4_in2),
    .in3 (mux4_in3),
    .sel (mux4_sel),
    .out (mux4_out)
  );

  `VC_TEST_CASE_BEGIN( 1, "vcMux4_w32" )
  begin

    mux4_in0 = 32'h0a0a0a0a;
    mux4_in1 = 32'hb0b0b0b0;
    mux4_in2 = 32'h0c0c0c0c;
    mux4_in3 = 32'hd0d0d0d0;
    
    mux4_sel = 2'd0; #25;
    `VC_TEST_EQUAL( "sel == 0", mux4_out, 32'h0a0a0a0a )
    
    mux4_sel = 2'd1; #25;
    `VC_TEST_EQUAL( "sel == 1", mux4_out, 32'hb0b0b0b0 )

    mux4_sel = 2'd2; #25;
    `VC_TEST_EQUAL( "sel == 2", mux4_out, 32'h0c0c0c0c )

    mux4_sel = 2'd3; #25;
    `VC_TEST_EQUAL( "sel == 3", mux4_out, 32'hd0d0d0d0 )

  end
  `VC_TEST_CASE_END
    
  `VC_TEST_SUITE_END( 2 )
endmodule
