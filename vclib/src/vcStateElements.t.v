//**************************************************************************
// Tests for State Elements
//--------------------------------------------------------------------------
//

`include "vcTest.v"

module tester;  

  reg clk = 1;
  always #5 clk = ~clk;

  `VC_TEST_SUITE_BEGIN( "vcStateElements" )

  //--------------------------------------------------------------------
  // Test vcDFF_pf
  //--------------------------------------------------------------------
  
  reg  [31:0] vcDFF_test_d_p;
  wire [31:0] vcDFF_test_q_np;

  vcDFF_pf#(32) vcDFF_test_pf
  ( 
    .clk(clk), 
    .d_p(vcDFF_test_d_p), 
    .q_np(vcDFF_test_q_np)
  );
  
  `VC_TEST_CASE_BEGIN( 0, "vcDFF_pf" )
  begin 

    #1;
    
    vcDFF_test_d_p = 1'b0; 
    #10; `VC_TEST_EQUAL( "#1", vcDFF_test_q_np, 1'b0  )

    vcDFF_test_d_p = 1'b1; 
    #0;  `VC_TEST_EQUAL( "#2", vcDFF_test_q_np, 1'b0  )
    #10; `VC_TEST_EQUAL( "#3", vcDFF_test_q_np, 1'b1  )
        
  end
  `VC_TEST_CASE_END
  
  `VC_TEST_SUITE_END( 1 )
endmodule
