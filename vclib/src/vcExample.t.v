//**************************************************************************
// Tests for example
//--------------------------------------------------------------------------
//

`include "vcTest.v"

module tester;  

  reg clk = 1;
  always #5 clk = ~clk;
  
  `VC_TEST_SUITE_BEGIN( "vcExample" )
   
  //--------------------------------------------------------------------
  // Test vcExample
  //--------------------------------------------------------------------
  
  reg  [31:0] t0_in0, t0_in1;  
  wire        t0_out;
  
  vcEQComparator_test dut
  (
    .in0 (t0_in0),
    .in1 (t0_in1),
    .out (t0_out)
  );

  `VC_TEST_CASE_BEGIN( 0, "vcExample" )
  begin 

    t0_in0 = 32'hdeadbeef;
    t0_in1 = 32'hdeadbeef;

    #25;
    `VC_TEST_EQUAL( "deadbeef == deadbeef", t0_out, 1'b1 )

    t0_in0 = 32'hde3456ef;
    t0_in1 = 32'hde3456ef;

    #25;
    `VC_TEST_EQUAL( "de3456ef == de3456ef", t0_out, 1'b1 )

    t0_in0 = 32'hdea1492e;
    t0_in1 = 32'h12fda567;

    #25;
    `VC_TEST_EQUAL( "dea1492e == 12fda567", t0_out, 1'b0 )

    t0_in0 = 32'hdeadbeef;
    t0_in1 = 32'hdeadbeee;

    #25;
    `VC_TEST_EQUAL( "deadbeef == deadbeee", t0_out, 1'b0 )
  
  end
  `VC_TEST_CASE_END
      
  `VC_TEST_SUITE_END( 1 )
endmodule
