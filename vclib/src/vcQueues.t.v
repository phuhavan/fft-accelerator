//**************************************************************************
// Tests for Queues
//--------------------------------------------------------------------------
//

`include "vcTest.v"

//========================================================================
// Tester Helper Module
//========================================================================

module tester_helper 
#(
  parameter W = 1, 
  parameter SRC_RAND_DELAY = 0, 
  parameter SINK_RAND_DELAY = SRC_RAND_DELAY 
)
(
  input 	     clk, reset, 
  output         reset_int,
  output [W-1:0] enq_bits,
  output  	     enq_val,
  input          enq_rdy,
  input  [W-1:0] deq_bits,
  input          deq_val,
  output         deq_rdy,
  output         done
);

  vcDFF_pf#(1) t0_reset_reg( .clk(clk), .d_p(reset), .q_np(reset_int) );

  wire src_done;
  vcTestSource#(32,SRC_RAND_DELAY) src
  (
    .clk(clk), .reset(reset_int),
    .bits(enq_bits), .val(enq_val), .rdy(enq_rdy), 
    .done(src_done)
  );

  wire sink_done;
  vcTestSink#(32,SINK_RAND_DELAY) sink
  (
    .clk(clk), .reset(reset_int),
    .bits(deq_bits), .val(deq_val), .rdy(deq_rdy),
    .done(sink_done)
  );

  assign done = src_done & sink_done;
  
  initial
   begin 
    
    src.m[0] = 32'h00000000; sink.m[0] = 32'h00000000;
    src.m[1] = 32'haaaaaaaa; sink.m[1] = 32'haaaaaaaa;
    src.m[2] = 32'hbbbbbbbb; sink.m[2] = 32'hbbbbbbbb;   
    src.m[3] = 32'hcccccccc; sink.m[3] = 32'hcccccccc;
    src.m[4] = 32'hdddddddd; sink.m[4] = 32'hdddddddd;
    src.m[5] = 32'heeeeeeee; sink.m[5] = 32'heeeeeeee;
    src.m[6] = 32'hffffffff; sink.m[6] = 32'hffffffff;
    src.m[7] = 32'h00000001; sink.m[7] = 32'h00000001;
    src.m[8] = 32'h00000002; sink.m[8] = 32'h00000002;
    src.m[9] = 32'h00000003; sink.m[9] = 32'h00000003;

   end
  
endmodule

//========================================================================
// Main Tester Module
//========================================================================

module tester;  

  reg clk = 1;
  always #5 clk = ~clk;
     
  `VC_TEST_SUITE_BEGIN( "vcQueues" )
  
  //--------------------------------------------------------------------
  // Test vcQueue_1_pf
  //--------------------------------------------------------------------

  wire t0_done;
  reg  t0_reset = 1;
  wire [31:0] t0_enq_bits, t0_deq_bits;
  wire t0_reset_int, t0_enq_val, t0_enq_rdy, t0_deq_val, t0_deq_rdy;
  
  tester_helper#(32) t0_helper
  (
    .clk(clk), .reset(t0_reset), .reset_int(t0_reset_int), .done(t0_done),
    .enq_bits(t0_enq_bits), .enq_val(t0_enq_val), .enq_rdy(t0_enq_rdy),
    .deq_bits(t0_deq_bits), .deq_val(t0_deq_val), .deq_rdy(t0_deq_rdy)
  );

  vcQueue_1_pf#(32) t0_queue
  (
    .clk(clk), .reset(t0_reset_int),
    .enq_bits(t0_enq_bits), .enq_val(t0_enq_val), .enq_rdy(t0_enq_rdy),
    .deq_bits(t0_deq_bits), .deq_val(t0_deq_val), .deq_rdy(t0_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 0, "vcQueue_1_pf" )
  begin 
    #1;   t0_reset = 1'b1;
    #20;  t0_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t0_done )
  end
  `VC_TEST_CASE_END

  //--------------------------------------------------------------------
  // Test vcQueue_1_pf (with random delays)
  //--------------------------------------------------------------------

  wire t1_done;
  reg  t1_reset = 1;
  wire [31:0] t1_enq_bits, t1_deq_bits;
  wire t1_reset_int, t1_enq_val, t1_enq_rdy, t1_deq_val, t1_deq_rdy;
  
  tester_helper#(32,5) t1_helper
  (
    .clk(clk), .reset(t1_reset), .reset_int(t1_reset_int), .done(t1_done),
    .enq_bits(t1_enq_bits), .enq_val(t1_enq_val), .enq_rdy(t1_enq_rdy),
    .deq_bits(t1_deq_bits), .deq_val(t1_deq_val), .deq_rdy(t1_deq_rdy)
  );

  vcQueue_1_pf#(32) t1_queue
  (
    .clk(clk), .reset(t1_reset_int),
    .enq_bits(t1_enq_bits), .enq_val(t1_enq_val), .enq_rdy(t1_enq_rdy),
    .deq_bits(t1_deq_bits), .deq_val(t1_deq_val), .deq_rdy(t1_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 1, "vcQueue_1_pf (with random delays)" )
  begin 
    #1;   t1_reset = 1'b1;
    #20;  t1_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t1_done ) 
  end
  `VC_TEST_CASE_END

  //--------------------------------------------------------------------
  // Test vcQueue_pipe1_pf
  //--------------------------------------------------------------------

  wire t2_done;
  reg  t2_reset = 1;
  wire [31:0] t2_enq_bits, t2_deq_bits;
  wire t2_reset_int, t2_enq_val, t2_enq_rdy, t2_deq_val, t2_deq_rdy;
  
  tester_helper#(32) t2_helper
  (
    .clk(clk), .reset(t2_reset), .reset_int(t2_reset_int), .done(t2_done),
    .enq_bits(t2_enq_bits), .enq_val(t2_enq_val), .enq_rdy(t2_enq_rdy),
    .deq_bits(t2_deq_bits), .deq_val(t2_deq_val), .deq_rdy(t2_deq_rdy)
  );

  vcQueue_pipe1_pf#(32) t2_queue
  (
    .clk(clk), .reset(t2_reset_int),
    .enq_bits(t2_enq_bits), .enq_val(t2_enq_val), .enq_rdy(t2_enq_rdy),
    .deq_bits(t2_deq_bits), .deq_val(t2_deq_val), .deq_rdy(t2_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 2, "vcQueue_pipe1_pf" )
  begin 
    #1;   t2_reset = 1'b1;
    #20;  t2_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t2_done )
  end
  `VC_TEST_CASE_END

  //--------------------------------------------------------------------
  // Test vcQueue_pipe1_pf (with random delays)
  //--------------------------------------------------------------------

  wire t3_done;
  reg  t3_reset = 1;
  wire [31:0] t3_enq_bits, t3_deq_bits;
  wire t3_reset_int, t3_enq_val, t3_enq_rdy, t3_deq_val, t3_deq_rdy;
  
  tester_helper#(32,5) t3_helper
  (
    .clk(clk), .reset(t3_reset), .reset_int(t3_reset_int), .done(t3_done),
    .enq_bits(t3_enq_bits), .enq_val(t3_enq_val), .enq_rdy(t3_enq_rdy),
    .deq_bits(t3_deq_bits), .deq_val(t3_deq_val), .deq_rdy(t3_deq_rdy)
  );

  vcQueue_pipe1_pf#(32) t3_queue
  (
    .clk(clk), .reset(t3_reset_int),
    .enq_bits(t3_enq_bits), .enq_val(t3_enq_val), .enq_rdy(t3_enq_rdy),
    .deq_bits(t3_deq_bits), .deq_val(t3_deq_val), .deq_rdy(t3_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 3, "vcQueue_pipe1_pf (with random delays)" )
  begin 
    #1;   t3_reset = 1'b1;
    #20;  t3_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t3_done )
  end
  `VC_TEST_CASE_END

  //--------------------------------------------------------------------
  // Test vcQueue_flow1_pf
  //--------------------------------------------------------------------

  wire t4_done;
  reg  t4_reset = 1;
  wire [31:0] t4_enq_bits, t4_deq_bits;
  wire t4_reset_int, t4_enq_val, t4_enq_rdy, t4_deq_val, t4_deq_rdy;
  
  tester_helper#(32) t4_helper
  (
    .clk(clk), .reset(t4_reset), .reset_int(t4_reset_int), .done(t4_done),
    .enq_bits(t4_enq_bits), .enq_val(t4_enq_val), .enq_rdy(t4_enq_rdy),
    .deq_bits(t4_deq_bits), .deq_val(t4_deq_val), .deq_rdy(t4_deq_rdy)
  );

  vcQueue_flow1_pf#(32) t4_queue
  (
    .clk(clk), .reset(t4_reset_int),
    .enq_bits(t4_enq_bits), .enq_val(t4_enq_val), .enq_rdy(t4_enq_rdy),
    .deq_bits(t4_deq_bits), .deq_val(t4_deq_val), .deq_rdy(t4_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 4, "vcQueue_flow1_pf" )
  begin 
    #1;   t4_reset = 1'b1;
    #20;  t4_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t4_done )
  end
  `VC_TEST_CASE_END

  //--------------------------------------------------------------------
  // Test vcQueue_flow1_pf (with random delays)
  //--------------------------------------------------------------------

  wire t5_done;
  reg  t5_reset = 1;
  wire [31:0] t5_enq_bits, t5_deq_bits;
  wire t5_reset_int, t5_enq_val, t5_enq_rdy, t5_deq_val, t5_deq_rdy;
  
  tester_helper#(32,5) t5_helper
  (
    .clk(clk), .reset(t5_reset), .reset_int(t5_reset_int), .done(t5_done),
    .enq_bits(t5_enq_bits), .enq_val(t5_enq_val), .enq_rdy(t5_enq_rdy),
    .deq_bits(t5_deq_bits), .deq_val(t5_deq_val), .deq_rdy(t5_deq_rdy)
  );

  vcQueue_flow1_pf#(32) t5_queue
  (
    .clk(clk), .reset(t5_reset_int),
    .enq_bits(t5_enq_bits), .enq_val(t5_enq_val), .enq_rdy(t5_enq_rdy),
    .deq_bits(t5_deq_bits), .deq_val(t5_deq_val), .deq_rdy(t5_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 5, "vcQueue_flow1_pf (with random delays)" )
  begin 
    #1;   t5_reset = 1'b1;
    #20;  t5_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t5_done )
  end
  `VC_TEST_CASE_END
    
  //--------------------------------------------------------------------
  // Test vcQueue_pipeflow1_pf
  //--------------------------------------------------------------------

  wire t6_done;
  reg  t6_reset = 1;
  wire [31:0] t6_enq_bits, t6_deq_bits;
  wire t6_reset_int, t6_enq_val, t6_enq_rdy, t6_deq_val, t6_deq_rdy;
  
  tester_helper#(32) t6_helper
  (
    .clk(clk), .reset(t6_reset), .reset_int(t6_reset_int), .done(t6_done),
    .enq_bits(t6_enq_bits), .enq_val(t6_enq_val), .enq_rdy(t6_enq_rdy),
    .deq_bits(t6_deq_bits), .deq_val(t6_deq_val), .deq_rdy(t6_deq_rdy)
  );

  vcQueue_pipeflow1_pf#(32) t6_queue
  (
    .clk(clk), .reset(t6_reset_int),
    .enq_bits(t6_enq_bits), .enq_val(t6_enq_val), .enq_rdy(t6_enq_rdy),
    .deq_bits(t6_deq_bits), .deq_val(t6_deq_val), .deq_rdy(t6_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 6, "vcQueue_pipeflow1_pf" )
  begin 
    #1;   t6_reset = 1'b1;
    #20;  t6_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t6_done )
  end
  `VC_TEST_CASE_END

  //--------------------------------------------------------------------
  // Test vcQueue_pipeflow1_pf (with random delays)
  //--------------------------------------------------------------------

  wire t7_done;
  reg  t7_reset = 1;
  wire [31:0] t7_enq_bits, t7_deq_bits;
  wire t7_reset_int, t7_enq_val, t7_enq_rdy, t7_deq_val, t7_deq_rdy;
  
  tester_helper#(32,5) t7_helper
  (
    .clk(clk), .reset(t7_reset), .reset_int(t7_reset_int), .done(t7_done),
    .enq_bits(t7_enq_bits), .enq_val(t7_enq_val), .enq_rdy(t7_enq_rdy),
    .deq_bits(t7_deq_bits), .deq_val(t7_deq_val), .deq_rdy(t7_deq_rdy)
  );

  vcQueue_pipeflow1_pf#(32) t7_queue
  (
    .clk(clk), .reset(t7_reset_int),
    .enq_bits(t7_enq_bits), .enq_val(t7_enq_val), .enq_rdy(t7_enq_rdy),
    .deq_bits(t7_deq_bits), .deq_val(t7_deq_val), .deq_rdy(t7_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 7, "vcQueue_pipeflow1_pf (with random delays)" )
  begin 
    #1;   t7_reset = 1'b1;
    #20;  t7_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t7_done )
  end
  `VC_TEST_CASE_END
    
  //--------------------------------------------------------------------
  // Test vcQueue_pf (1 element with random delays)
  //--------------------------------------------------------------------

  wire t8_done;
  reg  t8_reset = 1;
  wire [31:0] t8_enq_bits, t8_deq_bits;
  wire t8_reset_int, t8_enq_val, t8_enq_rdy, t8_deq_val, t8_deq_rdy;
  
  tester_helper#(32,0,5) t8_helper
  (
    .clk(clk), .reset(t8_reset), .reset_int(t8_reset_int), .done(t8_done),
    .enq_bits(t8_enq_bits), .enq_val(t8_enq_val), .enq_rdy(t8_enq_rdy),
    .deq_bits(t8_deq_bits), .deq_val(t8_deq_val), .deq_rdy(t8_deq_rdy)
  );

  vcQueue_pf#(32,1,1) t8_queue
  (
    .clk(clk), .reset(t8_reset_int),
    .enq_bits(t8_enq_bits), .enq_val(t8_enq_val), .enq_rdy(t8_enq_rdy),
    .deq_bits(t8_deq_bits), .deq_val(t8_deq_val), .deq_rdy(t8_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 8, "vcQueue_pf (1 elements with random delays)" )
  begin 
    #1;   t8_reset = 1'b1;
    #20;  t8_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t8_done )
  end
  `VC_TEST_CASE_END
    
  //--------------------------------------------------------------------
  // Test vcQueue_pipe_pf (1 elements with random delays)
  //--------------------------------------------------------------------

  wire t9_done;
  reg  t9_reset = 1;
  wire [31:0] t9_enq_bits, t9_deq_bits;
  wire t9_reset_int, t9_enq_val, t9_enq_rdy, t9_deq_val, t9_deq_rdy;
  
  tester_helper#(32,0,5) t9_helper
  (
    .clk(clk), .reset(t9_reset), .reset_int(t9_reset_int), .done(t9_done),
    .enq_bits(t9_enq_bits), .enq_val(t9_enq_val), .enq_rdy(t9_enq_rdy),
    .deq_bits(t9_deq_bits), .deq_val(t9_deq_val), .deq_rdy(t9_deq_rdy)
  );

  vcQueue_pipe_pf#(32,1,1) t9_queue
  (
    .clk(clk), .reset(t9_reset_int),
    .enq_bits(t9_enq_bits), .enq_val(t9_enq_val), .enq_rdy(t9_enq_rdy),
    .deq_bits(t9_deq_bits), .deq_val(t9_deq_val), .deq_rdy(t9_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 9, "vcQueue_pipe_pf (1 elements with random delays)" )
  begin 
    #1;   t9_reset = 1'b1;
    #20;  t9_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t9_done )
  end
  `VC_TEST_CASE_END
    
  //--------------------------------------------------------------------
  // Test vcQueue_pipe_pf (1 elements with random delays)
  //--------------------------------------------------------------------

  wire t10_done;
  reg  t10_reset = 1;
  wire [31:0] t10_enq_bits, t10_deq_bits;
  wire t10_reset_int, t10_enq_val, t10_enq_rdy, t10_deq_val, t10_deq_rdy;
  
  tester_helper#(32,0,5) t10_helper
  (
    .clk(clk), .reset(t10_reset), .reset_int(t10_reset_int), .done(t10_done),
    .enq_bits(t10_enq_bits), .enq_val(t10_enq_val), .enq_rdy(t10_enq_rdy),
    .deq_bits(t10_deq_bits), .deq_val(t10_deq_val), .deq_rdy(t10_deq_rdy)
  );

  vcQueue_flow_pf#(32,1,1) t10_queue
  (
    .clk(clk), .reset(t10_reset_int),
    .enq_bits(t10_enq_bits), .enq_val(t10_enq_val), .enq_rdy(t10_enq_rdy),
    .deq_bits(t10_deq_bits), .deq_val(t10_deq_val), .deq_rdy(t10_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 10, "vcQueue_flow_pf (1 elements with random delays)" )
  begin 
    #1;   t10_reset = 1'b1;
    #20;  t10_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t10_done )
  end
  `VC_TEST_CASE_END
    
  //--------------------------------------------------------------------
  // Test vcQueue_pf (2 elements with random delays)
  //--------------------------------------------------------------------

  wire t11_done;
  reg  t11_reset = 1;
  wire [31:0] t11_enq_bits, t11_deq_bits;
  wire t11_reset_int, t11_enq_val, t11_enq_rdy, t11_deq_val, t11_deq_rdy;
  
  tester_helper#(32,0,5) t11_helper
  (
    .clk(clk), .reset(t11_reset), .reset_int(t11_reset_int), .done(t11_done),
    .enq_bits(t11_enq_bits), .enq_val(t11_enq_val), .enq_rdy(t11_enq_rdy),
    .deq_bits(t11_deq_bits), .deq_val(t11_deq_val), .deq_rdy(t11_deq_rdy)
  );

  vcQueue_pf#(32,2,1) t11_queue
  (
    .clk(clk), .reset(t11_reset_int),
    .enq_bits(t11_enq_bits), .enq_val(t11_enq_val), .enq_rdy(t11_enq_rdy),
    .deq_bits(t11_deq_bits), .deq_val(t11_deq_val), .deq_rdy(t11_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 11, "vcQueue_pf (2 elements with random delays)" )
  begin 
    #1;   t11_reset = 1'b1;
    #20;  t11_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t11_done )
  end
  `VC_TEST_CASE_END
    
  //--------------------------------------------------------------------
  // Test vcQueue_pipe_pf (2 elements with random delays)
  //--------------------------------------------------------------------

  wire t12_done;
  reg  t12_reset = 1;
  wire [31:0] t12_enq_bits, t12_deq_bits;
  wire t12_reset_int, t12_enq_val, t12_enq_rdy, t12_deq_val, t12_deq_rdy;
  
  tester_helper#(32,0,5) t12_helper
  (
    .clk(clk), .reset(t12_reset), .reset_int(t12_reset_int), .done(t12_done),
    .enq_bits(t12_enq_bits), .enq_val(t12_enq_val), .enq_rdy(t12_enq_rdy),
    .deq_bits(t12_deq_bits), .deq_val(t12_deq_val), .deq_rdy(t12_deq_rdy)
  );

  vcQueue_pipe_pf#(32,2,1) t12_queue
  (
    .clk(clk), .reset(t12_reset_int),
    .enq_bits(t12_enq_bits), .enq_val(t12_enq_val), .enq_rdy(t12_enq_rdy),
    .deq_bits(t12_deq_bits), .deq_val(t12_deq_val), .deq_rdy(t12_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 12, "vcQueue_pipe_pf (2 elements with random delays)" )
  begin 
    #1;   t12_reset = 1'b1;
    #20;  t12_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t12_done )
  end
  `VC_TEST_CASE_END
    
  //--------------------------------------------------------------------
  // Test vcQueue_pipe_pf (2 elements with random delays)
  //--------------------------------------------------------------------

  wire t13_done;
  reg  t13_reset = 1;
  wire [31:0] t13_enq_bits, t13_deq_bits;
  wire t13_reset_int, t13_enq_val, t13_enq_rdy, t13_deq_val, t13_deq_rdy;
  
  tester_helper#(32,0,5) t13_helper
  (
    .clk(clk), .reset(t13_reset), .reset_int(t13_reset_int), .done(t13_done),
    .enq_bits(t13_enq_bits), .enq_val(t13_enq_val), .enq_rdy(t13_enq_rdy),
    .deq_bits(t13_deq_bits), .deq_val(t13_deq_val), .deq_rdy(t13_deq_rdy)
  );

  vcQueue_flow_pf#(32,2,1) t13_queue
  (
    .clk(clk), .reset(t13_reset_int),
    .enq_bits(t13_enq_bits), .enq_val(t13_enq_val), .enq_rdy(t13_enq_rdy),
    .deq_bits(t13_deq_bits), .deq_val(t13_deq_val), .deq_rdy(t13_deq_rdy)
  );

  `VC_TEST_CASE_BEGIN( 13, "vcQueue_flow_pf (2 elements with random delays)" )
  begin 
    #1;   t13_reset = 1'b1;
    #20;  t13_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t13_done )
  end
  `VC_TEST_CASE_END
         
  `VC_TEST_SUITE_END( 14 )
endmodule
