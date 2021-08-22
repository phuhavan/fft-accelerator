//**************************************************************************
// Tests for RAMs
//--------------------------------------------------------------------------
//

`include "vcTest.v"

module tester;  

  reg clk = 1;
  always #5 clk = ~clk;

  `VC_TEST_SUITE_BEGIN( "vcRAMs" )

  //--------------------------------------------------------------------
  // Test vcRAM_rst_1w1r_pf
  //--------------------------------------------------------------------
  
  reg  t0_reset = 1;
  wire t0_reset_int;

  vcDFF_pf#(1) t0_reset_reg
  ( 
    .clk   (clk), 
    .d_p   (t0_reset), 
    .q_np  (t0_reset_int) 
  );

  reg  [3:0] t0_raddr;
  wire [1:0] t0_rdata;
  reg        t0_wen;
  reg  [3:0] t0_waddr;
  reg  [1:0] t0_wdata;
  
  vcRAM_rst_1w1r_pf#(2,16,4,2'b10) t0_ram
  ( 
    .clk      (clk), 
    .reset_p  (t0_reset_int), 
    .raddr    (t0_raddr),   
    .rdata    (t0_rdata),   
    .wen_p    (t0_wen),   
    .waddr_p  (t0_waddr), 
    .wdata_p  (t0_wdata)  
  );
  
  `VC_TEST_CASE_BEGIN( 0, "vcRAM_rst_1w1r_pf" )
  begin 
    
    #1;  
    t0_reset = 1'b1;
    t0_raddr = 4'd0;
    t0_wen   = 1'b0;
    t0_waddr = 4'd0;
    t0_wdata = 2'b00;
    
    #20; 
    t0_reset = 1'b0;
    
    #10; 
    `VC_TEST_EQUAL( "Reset data correct?", t0_rdata, 2'b10  )

    #10;
    t0_wen   = 1'b1;
    t0_waddr = 4'd0;
    t0_wdata = 2'b01;

    #10;
    t0_wen   = 1'b0;
    t0_raddr = 4'd0;
    #1;
    `VC_TEST_EQUAL( "Read data correct?", t0_rdata, 2'b01  )

    #9;
    t0_wen   = 1'b1;
    t0_waddr = 4'd4;
    t0_wdata = 2'b11;

    #10;    
    t0_wen   = 1'b0;
    t0_raddr = 4'd4;
    #1;
    `VC_TEST_EQUAL( "Read data correct?", t0_rdata, 2'b11  )    
    
  end
  `VC_TEST_CASE_END
  
  `VC_TEST_SUITE_END( 1 )
endmodule
