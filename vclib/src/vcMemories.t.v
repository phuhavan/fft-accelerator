//**************************************************************************
// Tests for Memories
//--------------------------------------------------------------------------
//

`include "vcTest.v"

//========================================================================
// vcMem_magic1port Helper Module
//========================================================================

module vcMem_magic1port_helper
(
  input  clk, reset, 
  output done
);

  wire [40:0] src_bits;
  wire        src_bits_rw   = src_bits[40];
  wire [ 7:0] src_bits_addr = src_bits[39:32];
  wire [31:0] src_bits_data = src_bits[31:0];
  wire        src_done;
  
  wire [31:0] sink_bits_data;
  wire        sink_val;
  wire        sink_rdy; 
  wire        sink_done;

  assign done = src_done & sink_done;
  
  vcDFF_pf#(1) t0_reset_reg
  ( 
    .clk   (clk), 
    .d_p   (reset), 
    .q_np  (reset_int) 
  );

  vcTestSource#(41) src
  (
    .clk   (clk), 
    .reset (reset_int),
    .bits  (src_bits),
    .val   (src_val), 
    .rdy   (src_rdy),
    .done  (src_done)
  );

  vcMem_magic1port#(6,8,32,2) mem
  (
    .clk               (clk),
    .reset             (reset_int),
    .memreq_bits_rw    (src_bits_rw),
    .memreq_bits_addr  (src_bits_addr),
    .memreq_bits_data  (src_bits_data),
    .memreq_val        (src_val),
    .memreq_rdy        (src_rdy),
    .memresp_bits_data (sink_bits_data),
    .memresp_val       (sink_val)
  );
  
  vcTestSink#(32) sink
  (
    .clk   (clk), 
    .reset (reset_int),
    .bits  (sink_bits_data), 
    .val   (sink_val), 
    .rdy   (sink_rdy),
    .done  (sink_done)
  );
  
endmodule

//========================================================================
// vcMem_magic2port Helper Module
//========================================================================

module vcMem_magic2port_helper
(
  input  clk, reset, 
  output done
);

  wire [40:0] src0_bits;
  wire        src0_bits_rw   = src0_bits[40];
  wire [ 7:0] src0_bits_addr = src0_bits[39:32];
  wire [31:0] src0_bits_data = src0_bits[31:0];
  wire        src0_done;
  
  wire [31:0] sink0_bits_data;
  wire        sink0_val;
  wire        sink0_rdy; 
  wire        sink0_done;
  
  wire [40:0] src1_bits;
  wire        src1_bits_rw   = src1_bits[40];
  wire [ 7:0] src1_bits_addr = src1_bits[39:32];
  wire [31:0] src1_bits_data = src1_bits[31:0];
  wire        src1_done;
  
  wire [31:0] sink1_bits_data;
  wire        sink1_val;
  wire        sink1_rdy; 
  wire        sink1_done;  

  assign done = src0_done & sink0_done && src1_done & sink1_done;
  
  vcDFF_pf#(1) t0_reset_reg
  ( 
    .clk   (clk), 
    .d_p   (reset), 
    .q_np  (reset_int) 
  );

  vcTestSource#(41) src0
  (
    .clk   (clk), 
    .reset (reset_int),
    .bits  (src0_bits),
    .val   (src0_val), 
    .rdy   (src0_rdy),
    .done  (src0_done)
  );

  vcTestSource#(41) src1
  (
    .clk   (clk), 
    .reset (reset_int),
    .bits  (src1_bits),
    .val   (src1_val), 
    .rdy   (src1_rdy),
    .done  (src1_done)
  );  

  vcMem_magic2port#(6,8,32,2) mem
  (
    .clk               (clk),
    .reset             (reset_int),

    .memreq0_bits_rw    (src0_bits_rw),
    .memreq0_bits_addr  (src0_bits_addr),
    .memreq0_bits_data  (src0_bits_data),
    .memreq0_val        (src0_val),
    .memreq0_rdy        (src0_rdy),
    .memresp0_bits_data (sink0_bits_data),
    .memresp0_val       (sink0_val),

    .memreq1_bits_rw    (src1_bits_rw),
    .memreq1_bits_addr  (src1_bits_addr),
    .memreq1_bits_data  (src1_bits_data),
    .memreq1_val        (src1_val),
    .memreq1_rdy        (src1_rdy),
    .memresp1_bits_data (sink1_bits_data),
    .memresp1_val       (sink1_val)
   
  );
  
  vcTestSink#(32) sink0
  (
    .clk   (clk), 
    .reset (reset_int),
    .bits  (sink0_bits_data), 
    .val   (sink0_val), 
    .rdy   (sink0_rdy),
    .done  (sink0_done)
  );

  vcTestSink#(32) sink1
  (
    .clk   (clk), 
    .reset (reset_int),
    .bits  (sink1_bits_data), 
    .val   (sink1_val), 
    .rdy   (sink1_rdy),
    .done  (sink1_done)
  );  
  
endmodule

//========================================================================
// vcMem_test1port Helper Module
//========================================================================

module vcMem_test1port_helper #( parameter RAND_DELAY = 0 )
(
  input  clk, reset, 
  output done
);

  wire [40:0] src_bits;
  wire        src_bits_rw   = src_bits[40];
  wire [ 7:0] src_bits_addr = src_bits[39:32];
  wire [31:0] src_bits_data = src_bits[31:0];
  wire        src_done;
  
  wire [31:0] sink_bits_data;
  wire        sink_val;
  wire        sink_rdy; 
  wire        sink_done;

  assign done = src_done & sink_done;
  
  vcDFF_pf#(1) t0_reset_reg
  ( 
    .clk   (clk), 
    .d_p   (reset), 
    .q_np  (reset_int) 
  );

  vcTestSource#(41) src
  (
    .clk   (clk), 
    .reset (reset_int),
    .bits  (src_bits),
    .val   (src_val), 
    .rdy   (src_rdy),
    .done  (src_done)
  );

  vcMem_test1port#(6,8,32,2,RAND_DELAY) mem
  (
    .clk               (clk),
    .reset             (reset_int),
    .memreq_bits_rw    (src_bits_rw),
    .memreq_bits_addr  (src_bits_addr),
    .memreq_bits_data  (src_bits_data),
    .memreq_val        (src_val),
    .memreq_rdy        (src_rdy),
    .memresp_bits_data (sink_bits_data),
    .memresp_val       (sink_val)
  );
  
  vcTestSink#(32) sink
  (
    .clk   (clk), 
    .reset (reset_int),
    .bits  (sink_bits_data), 
    .val   (sink_val), 
    .rdy   (sink_rdy),
    .done  (sink_done)
  );
  
endmodule

//========================================================================
// Main Tester Module
//========================================================================

module tester;  

  reg clk = 1;
  always #5 clk = ~clk;
     
  `VC_TEST_SUITE_BEGIN( "vcMemories" )

  //--------------------------------------------------------------------
  // Test vcMem_magic1port
  //--------------------------------------------------------------------

  wire t0_done;
  reg  t0_reset = 1;
  vcMem_magic1port_helper t0_dut( .clk(clk), .reset(t0_reset), .done(t0_done) );
  
  `VC_TEST_CASE_BEGIN( 0, "vcMem_magic1port" )
  begin 

    t0_dut.src.m[ 0] = 41'h1_00_aaaaaaaa; 
    t0_dut.src.m[ 1] = 41'h0_00_xxxxxxxx; t0_dut.sink.m[0] = 32'haaaaaaaa;
    t0_dut.src.m[ 2] = 41'h1_04_bbbbbbbb; 
    t0_dut.src.m[ 3] = 41'h1_08_cccccccc; 
    t0_dut.src.m[ 4] = 41'h0_04_xxxxxxxx; t0_dut.sink.m[1] = 32'hbbbbbbbb; 
    t0_dut.src.m[ 5] = 41'h0_08_xxxxxxxx; t0_dut.sink.m[2] = 32'hcccccccc;
    t0_dut.src.m[ 6] = 41'h1_00_dddddddd; 
    t0_dut.src.m[ 7] = 41'h0_00_xxxxxxxx; t0_dut.sink.m[3] = 32'hdddddddd;
    t0_dut.src.m[ 8] = 41'h1_04_eeeeeeee; 
    t0_dut.src.m[ 9] = 41'h1_08_ffffffff; 
    t0_dut.src.m[10] = 41'h0_04_xxxxxxxx; t0_dut.sink.m[4] = 32'heeeeeeee; 
    t0_dut.src.m[11] = 41'h0_08_xxxxxxxx; t0_dut.sink.m[5] = 32'hffffffff;   
    
    
    #1;   t0_reset = 1'b1;
    #20;  t0_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t0_done )

  end
  `VC_TEST_CASE_END
    
  //--------------------------------------------------------------------
  // Test vcMem_magic2port
  //--------------------------------------------------------------------

  wire t1_done;
  reg  t1_reset = 1;
  vcMem_magic2port_helper t1_dut( .clk(clk), .reset(t1_reset), .done(t1_done) );
  
  `VC_TEST_CASE_BEGIN( 1, "vcMem_magic2port" )
  begin 

    t1_dut.src0.m[ 0] = 41'h1_00_aaaaaaaa; 
    t1_dut.src0.m[ 1] = 41'h0_00_xxxxxxxx; t1_dut.sink0.m[0] = 32'haaaaaaaa;
    t1_dut.src0.m[ 2] = 41'h1_04_bbbbbbbb; 
    t1_dut.src0.m[ 3] = 41'h1_08_cccccccc; 
    t1_dut.src0.m[ 4] = 41'h0_04_xxxxxxxx; t1_dut.sink0.m[1] = 32'hbbbbbbbb; 
    t1_dut.src0.m[ 5] = 41'h0_08_xxxxxxxx; t1_dut.sink0.m[2] = 32'hcccccccc;
    t1_dut.src0.m[ 6] = 41'h1_00_dddddddd; 
    t1_dut.src0.m[ 7] = 41'h0_00_xxxxxxxx; t1_dut.sink0.m[3] = 32'hdddddddd;
    t1_dut.src0.m[ 8] = 41'h1_04_eeeeeeee; 
    t1_dut.src0.m[ 9] = 41'h1_08_ffffffff; 
    t1_dut.src0.m[10] = 41'h0_04_xxxxxxxx; t1_dut.sink0.m[4] = 32'heeeeeeee; 
    t1_dut.src0.m[11] = 41'h0_08_xxxxxxxx; t1_dut.sink0.m[5] = 32'hffffffff;   

    t1_dut.src1.m[ 0] = 41'h1_0c_a0a0a0a0; 
    t1_dut.src1.m[ 1] = 41'h0_0c_xxxxxxxx; t1_dut.sink1.m[0] = 32'ha0a0a0a0;
    t1_dut.src1.m[ 2] = 41'h1_10_b0b0b0b0; 
    t1_dut.src1.m[ 3] = 41'h1_14_c0c0c0c0; 
    t1_dut.src1.m[ 4] = 41'h0_10_xxxxxxxx; t1_dut.sink1.m[1] = 32'hb0b0b0b0; 
    t1_dut.src1.m[ 5] = 41'h0_14_xxxxxxxx; t1_dut.sink1.m[2] = 32'hc0c0c0c0;
    t1_dut.src1.m[ 6] = 41'h1_0c_d0d0d0d0; 
    t1_dut.src1.m[ 7] = 41'h0_0c_xxxxxxxx; t1_dut.sink1.m[3] = 32'hd0d0d0d0;
    t1_dut.src1.m[ 8] = 41'h1_10_e0e0e0e0; 
    t1_dut.src1.m[ 9] = 41'h1_14_f0f0f0f0; 
    t1_dut.src1.m[10] = 41'h0_10_xxxxxxxx; t1_dut.sink1.m[4] = 32'he0e0e0e0; 
    t1_dut.src1.m[11] = 41'h0_14_xxxxxxxx; t1_dut.sink1.m[5] = 32'hf0f0f0f0;       
    
    #1;   t1_reset = 1'b1;
    #20;  t1_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t1_done )

  end
  `VC_TEST_CASE_END
  
  //--------------------------------------------------------------------
  // Test vcMem_test1port (basic)
  //--------------------------------------------------------------------

  wire t2_done;
  reg  t2_reset = 1;
  vcMem_test1port_helper t2_dut( .clk(clk), .reset(t2_reset), .done(t2_done) );
  
  `VC_TEST_CASE_BEGIN( 2, "vcMem_test1port (basic)" )
  begin 

    t2_dut.src.m[ 0] = 41'h1_00_aaaaaaaa; 
    t2_dut.src.m[ 1] = 41'h0_00_xxxxxxxx; t2_dut.sink.m[0] = 32'haaaaaaaa;
    t2_dut.src.m[ 2] = 41'h1_04_bbbbbbbb; 
    t2_dut.src.m[ 3] = 41'h1_08_cccccccc; 
    t2_dut.src.m[ 4] = 41'h0_04_xxxxxxxx; t2_dut.sink.m[1] = 32'hbbbbbbbb; 
    t2_dut.src.m[ 5] = 41'h0_08_xxxxxxxx; t2_dut.sink.m[2] = 32'hcccccccc;
    t2_dut.src.m[ 6] = 41'h1_00_dddddddd; 
    t2_dut.src.m[ 7] = 41'h0_00_xxxxxxxx; t2_dut.sink.m[3] = 32'hdddddddd;
    t2_dut.src.m[ 8] = 41'h1_04_eeeeeeee; 
    t2_dut.src.m[ 9] = 41'h1_08_ffffffff; 
    t2_dut.src.m[10] = 41'h0_04_xxxxxxxx; t2_dut.sink.m[4] = 32'heeeeeeee; 
    t2_dut.src.m[11] = 41'h0_08_xxxxxxxx; t2_dut.sink.m[5] = 32'hffffffff;   
    
    
    #1;   t2_reset = 1'b1;
    #20;  t2_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t2_done )

  end
  `VC_TEST_CASE_END

  //--------------------------------------------------------------------
  // Test vcMem_test1port (with random delay)
  //--------------------------------------------------------------------

  wire t3_done;
  reg  t3_reset = 1;
  vcMem_test1port_helper#(5) t3_dut( .clk(clk), .reset(t3_reset), .done(t3_done) );
  
  `VC_TEST_CASE_BEGIN( 3, "vcMem_test1port (with random delay)" )
  begin 

    t3_dut.src.m[ 0] = 41'h1_00_aaaaaaaa; 
    t3_dut.src.m[ 1] = 41'h0_00_xxxxxxxx; t3_dut.sink.m[0] = 32'haaaaaaaa;
    t3_dut.src.m[ 2] = 41'h1_04_bbbbbbbb; 
    t3_dut.src.m[ 3] = 41'h1_08_cccccccc; 
    t3_dut.src.m[ 4] = 41'h0_04_xxxxxxxx; t3_dut.sink.m[1] = 32'hbbbbbbbb; 
    t3_dut.src.m[ 5] = 41'h0_08_xxxxxxxx; t3_dut.sink.m[2] = 32'hcccccccc;
    t3_dut.src.m[ 6] = 41'h1_00_dddddddd; 
    t3_dut.src.m[ 7] = 41'h0_00_xxxxxxxx; t3_dut.sink.m[3] = 32'hdddddddd;
    t3_dut.src.m[ 8] = 41'h1_04_eeeeeeee; 
    t3_dut.src.m[ 9] = 41'h1_08_ffffffff; 
    t3_dut.src.m[10] = 41'h0_04_xxxxxxxx; t3_dut.sink.m[4] = 32'heeeeeeee; 
    t3_dut.src.m[11] = 41'h0_08_xxxxxxxx; t3_dut.sink.m[5] = 32'hffffffff;   
    
    
    #1;   t3_reset = 1'b1;
    #20;  t3_reset = 1'b0;
    #500; `VC_TEST_CHECK( "Is sink finished?", t3_done )

  end
  `VC_TEST_CASE_END    

  `VC_TEST_SUITE_END( 4 )
endmodule
