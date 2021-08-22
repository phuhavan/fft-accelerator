//**************************************************************************
// Verilog Components: Queues
//--------------------------------------------------------------------------
//

`ifndef VC_QUEUES_V
`define VC_QUEUES_V

`define VC_QUEUE_NORMAL   0
`define VC_QUEUE_PIPE     1
`define VC_QUEUE_FLOW     2
`define VC_QUEUE_PIPEFLOW 3

`endif

//--------------------------------------------------------------------------
// Single-Element Queue Control Logic
//--------------------------------------------------------------------------
// This is the control logic for a single-elment queue. It is designed
// to be attached to a storage element with a write enable. Additionally,
// it includes the ability to statically enable pipeline and/or flowthrough
// behavior. Pipeline behavior is when the deq_rdy signal is combinationally
// wired to the enq_rdy signal allowing elements to be dequeued and enqueued
// in the same cycle when the queue is full. Flowthrough behavior is when
// the enq_val signal is cominationally wired to the deq_val signal allowing
// elements to bypass the storage element if the storage element is empty.

module vcQueueCtrl1#( parameter TYPE = 0 )
(
  input  clk, reset,
  input  enq_val,   // Enqueue data is valid            
  output enq_rdy,   // Ready for sender to do an enqueue
  output deq_val,   // Dequeue data is valid            
  input  deq_rdy,   // Receiver is ready to do a dequeue
  output wen,       // Write enable signal to wire up to storage element
  output flowthru   // Indicates if performing flowthru
);

  // Status register

  wire full;
  reg  full_next;
  vcRDFF_pf#(1) full_pf
  ( 
    .clk     (clk), 
    .reset_p (reset), 
    .d_p     (full_next), 
    .q_np    (full) 
  );
  
  // Determine if pipeline or flowthrough behavior is enabled
  
  wire pipe_en     = ( TYPE == `VC_QUEUE_PIPE ) || ( TYPE == `VC_QUEUE_PIPEFLOW );
  wire flowthru_en = ( TYPE == `VC_QUEUE_FLOW ) || ( TYPE == `VC_QUEUE_PIPEFLOW );
  
  // We enq/deq only when they are both ready and valid
  
  wire do_enq = enq_rdy && enq_val;
  wire do_deq = deq_rdy && deq_val;

  // Determine if we have pipeline or flowthrough behaviour and
  // set the write enable accordingly.
  
  wire   empty       = ~full;
  wire   do_pipe     = pipe_en     && full  && do_enq && do_deq;
  wire   do_flowthru = flowthru_en && empty && do_enq && do_deq;
  assign flowthru    = do_flowthru;
  
  assign wen = do_enq && ~do_flowthru;

  // Ready signals are calculated from full register. If pipeline 
  // behavior is enabled, then the enq_rdy signal is also calculated
  // combinationally from the deq_rdy signal. If flowthrough behavior
  // is enabled then the deq_val signal is also calculated combinationally
  // from the enq_val signal.
  
  assign enq_rdy  = ~full  || ( pipe_en     && full  && deq_rdy );
  assign deq_val  = ~empty || ( flowthru_en && empty && enq_val );

  // Control logic for the full register input

  always @(*)
   begin
    if      ( do_deq && ~do_pipe )      full_next <= 1'b0;
    else if ( do_enq && ~do_flowthru )  full_next <= 1'b1;
    else                                full_next <= full;
   end
    
endmodule

//--------------------------------------------------------------------------
// Multi-Element Queue Control Logic
//--------------------------------------------------------------------------
// This is the control logic for a multi-elment queue. It is designed
// to be attached to a RAM storage element. Additionally,
// it includes the ability to statically enable pipeline and/or flowthrough
// behavior. Pipeline behavior is when the deq_rdy signal is combinationally
// wired to the enq_rdy signal allowing elements to be dequeued and enqueued
// in the same cycle when the queue is full. Flowthrough behavior is when
// the enq_val signal is cominationally wired to the deq_val signal allowing
// elements to bypass the storage element if the storage element is empty.

module vcQueueCtrl#( parameter TYPE = 0, parameter ENTRIES = 2, parameter ADDR_SZ = 1 )
(
  input                clk, reset,
  input                enq_val,   // Enqueue data is valid            
  output               enq_rdy,   // Ready for sender to do an enqueue
  output               deq_val,   // Dequeue data is valid            
  input                deq_rdy,   // Receiver is ready to do a dequeue
  output	           wen,       // Write enable signal to wire up to RAM
  output [ADDR_SZ-1:0] waddr,     // Write address to wire up to RAM
  output [ADDR_SZ-1:0] raddr,     // Read address to wire up to RAM
  output               flowthru   // Indicates if performing flowthru
);

  // Enqueue and dequeue pointers
  
  wire [ADDR_SZ-1:0] enq_ptr;
  reg  [ADDR_SZ-1:0] enq_ptr_next;
  vcRDFF_pf#(ADDR_SZ) enq_ptr_pf
  ( 
    .clk(clk), .reset_p(reset), .d_p(enq_ptr_next), .q_np(enq_ptr) 
  );  

  wire [ADDR_SZ-1:0] deq_ptr;
  reg  [ADDR_SZ-1:0] deq_ptr_next;
  vcRDFF_pf#(ADDR_SZ) deq_ptr_pf
  ( 
    .clk(clk), .reset_p(reset), .d_p(deq_ptr_next), .q_np(deq_ptr) 
  );

  assign waddr = enq_ptr;
  assign raddr = deq_ptr;

  // Extra state to tell difference between full and empty
  
  wire full;
  reg  full_next;
  vcRDFF_pf#(1) full_pf
  ( 
    .clk(clk), .reset_p(reset), .d_p(full_next), .q_np(full) 
  );
  
  // Determine if pipeline or flowthrough behavior is enabled
  
  wire pipe_en     = ( TYPE == `VC_QUEUE_PIPE ) || ( TYPE == `VC_QUEUE_PIPEFLOW );
  wire flowthru_en = ( TYPE == `VC_QUEUE_FLOW ) || ( TYPE == `VC_QUEUE_PIPEFLOW );
  
  // We enq/deq only when they are both ready and valid
  
  wire do_enq = enq_rdy && enq_val;
  wire do_deq = deq_rdy && deq_val;

  // Determine if we have pipeline or flowthrough behaviour and
  // set the write enable accordingly.
  
  wire   empty       = ~full && (enq_ptr == deq_ptr);
  wire   do_pipe     = pipe_en     && full  && do_enq && do_deq;
  wire   do_flowthru = flowthru_en && empty && do_enq && do_deq;
  assign flowthru    = do_flowthru;

  assign wen = do_enq && ~do_flowthru;
  
  // Ready signals are calculated from full register. If pipeline 
  // behavior is enabled, then the enq_rdy signal is also calculated
  // combinationally from the deq_rdy signal. If flowthrough behavior
  // is enabled then the deq_val signal is also calculated combinationally
  // from the enq_val signal.
  
  assign enq_rdy  = ~full  || ( pipe_en     && full  && deq_rdy );
  assign deq_val  = ~empty || ( flowthru_en && empty && enq_val );

  // Control logic for the enq/deq pointers and full register

  wire [ADDR_SZ-1:0] deq_ptr_plus1 = deq_ptr + 1'b1;
  wire [ADDR_SZ-1:0] deq_ptr_inc   
                       = (deq_ptr_plus1 == ENTRIES) ? {ADDR_SZ{1'b0}} : deq_ptr_plus1;

  wire [ADDR_SZ-1:0] enq_ptr_plus1 = enq_ptr + 1'b1;
  wire [ADDR_SZ-1:0] enq_ptr_inc   
                       = (enq_ptr_plus1 == ENTRIES) ? {ADDR_SZ{1'b0}} : enq_ptr_plus1;
  
  always @(*)
   begin

    deq_ptr_next <= ( do_deq && ~do_flowthru ) ? ( deq_ptr_inc ) : deq_ptr;
    enq_ptr_next <= ( do_enq && ~do_flowthru ) ? ( enq_ptr_inc ) : enq_ptr;

    if ( do_enq && ~do_deq && ( enq_ptr_inc == deq_ptr ) )
      full_next <= 1'b1;
    else if ( do_deq && full && ~do_pipe )
      full_next <= 1'b0;
    else
      full_next <= full;
    
   end

  // Trace state
  `ifndef SYNTHESIS
  reg [ADDR_SZ:0] entries;
  always @( posedge clk )
   begin
    if ( reset ) entries <= 0;
    else if ( do_enq && ~do_deq && ~do_flowthru && ~do_pipe ) entries <= entries + 1;
    else if ( do_deq && ~do_enq && ~do_flowthru && ~do_pipe ) entries <= entries - 1;
   end
  `endif

  // Assertions
  `ifndef SYNTHESIS
  always @( posedge clk )
  begin
    if ( entries > ENTRIES )
      $display( " RTL-ERROR : %m : Actual entries (%d) > ENTRIES (%d)!", entries, ENTRIES );
    if ( (1 << ADDR_SZ) < ENTRIES )
      $display( " RTL-ERROR : %m : ENTRIES (%d) > ADDR_SZ (%d)!", ENTRIES, ADDR_SZ );
  end     
  `endif
  
endmodule

//--------------------------------------------------------------------------
// Single-Element Flowthru Queue Datapath (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueueDpath_flow1_pf #( parameter DATA_SZ = 1 )
(
  input clk,
  input wen,
  input flowthru,

  input  [DATA_SZ-1:0] enq_bits,
  output [DATA_SZ-1:0] deq_bits
 
);

  wire [DATA_SZ-1:0] rout;
  
  vcEDFF_pf#(DATA_SZ) dff
  ( 
    .clk  (clk), 
    .en_p (wen), 
    .d_p  (enq_bits), 
    .q_np (rout) 
  );

  vcMux2#(DATA_SZ) mux
  ( 
    .in0 (rout), 
    .in1 (enq_bits), 
    .sel (flowthru), 
    .out (deq_bits) 
  );

endmodule

//--------------------------------------------------------------------------
// Multi-Element Flowthru Queue Datapath (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueueDpath_flow_pf 
#( 
  parameter DATA_SZ = 1, 
  parameter ENTRIES = 2,
  parameter ADDR_SZ = 1
)
(
  input                clk,
  input                wen,
  input                flowthru,
  input  [ADDR_SZ-1:0] waddr,
  input  [ADDR_SZ-1:0] raddr,
  input  [DATA_SZ-1:0] enq_bits,
  output [DATA_SZ-1:0] deq_bits
);

  wire [DATA_SZ-1:0] rout;
  
  vcRAM_1w1r_pf#(DATA_SZ,ENTRIES,ADDR_SZ) ram
  ( 
    .clk     (clk), 
    .wen_p   (wen),
    .raddr   (raddr),   
    .rdata   (rout),
    .waddr_p (waddr), 
    .wdata_p (enq_bits)   
  );

  vcMux2#(DATA_SZ) mux
  ( 
    .in0 (rout), 
    .in1 (enq_bits), 
    .sel (flowthru), 
    .out (deq_bits) 
  );

endmodule

//--------------------------------------------------------------------------
// Single-Element Queue (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueue_1_pf #( parameter DATA_SZ = 1 )
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
); 

  wire wen, dummy;

  vcQueueCtrl1 ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .flowthru(dummy)
  );

  vcEDFF_pf#(DATA_SZ) dff( .clk(clk), .en_p(wen), .d_p(enq_bits), .q_np(deq_bits) );
  
endmodule

//--------------------------------------------------------------------------
// Single-Element Pipe Queue (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueue_pipe1_pf #( parameter DATA_SZ = 1 )
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen, dummy;

  vcQueueCtrl1#(`VC_QUEUE_PIPE) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .flowthru(dummy)
  );

  vcEDFF_pf#(DATA_SZ) dff( .clk(clk), .en_p(wen), .d_p(enq_bits), .q_np(deq_bits) );
  
endmodule

//--------------------------------------------------------------------------
// Single-Element Flowthrough Queue (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueue_flow1_pf #( parameter DATA_SZ = 1 )
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen, flowthru;
  wire [DATA_SZ-1:0] rout;
  
  vcQueueCtrl1#(`VC_QUEUE_FLOW) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .flowthru(flowthru)
  );

  vcQueueDpath_flow1_pf#(DATA_SZ) dpath
  (
    .clk(clk),
    .enq_bits(enq_bits),
    .deq_bits(deq_bits),
    .wen(wen), .flowthru(flowthru)
  );

endmodule 

//--------------------------------------------------------------------------
// Single-Element Pipe/Flowthrough Queue (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueue_pipeflow1_pf #( parameter DATA_SZ = 1 )
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
);

  wire wen, flowthru;
  wire [DATA_SZ-1:0] rout;
  
  vcQueueCtrl1#(`VC_QUEUE_PIPEFLOW) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .flowthru(flowthru)
  );

  vcQueueDpath_flow1_pf#(DATA_SZ) dpath
  (
    .clk(clk),
    .enq_bits(enq_bits),
    .deq_bits(deq_bits),
    .wen(wen), .flowthru(flowthru)
  );  

endmodule

//--------------------------------------------------------------------------
// Multi-Element Queue (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueue_pf 
#( 
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2, 
  parameter ADDR_SZ = 1 
)
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
); 

  wire wen, dummy;
  wire [ADDR_SZ-1:0] waddr;
  wire [ADDR_SZ-1:0] raddr;  
  
  vcQueueCtrl#(`VC_QUEUE_NORMAL,ENTRIES,ADDR_SZ) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .waddr(waddr), .raddr(raddr), .flowthru(dummy)
  );

  vcRAM_1w1r_pf#(DATA_SZ,ENTRIES,ADDR_SZ) ram
  (
    .clk(clk), .wen_p(wen),
    .raddr(raddr),   .rdata(deq_bits),
    .waddr_p(waddr), .wdata_p(enq_bits)   
  );
  
endmodule

//--------------------------------------------------------------------------
// Multi-Element Pipe Queue (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueue_pipe_pf 
#( 
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2, 
  parameter ADDR_SZ = 1 
)
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
); 

  wire wen, dummy;
  wire [ADDR_SZ-1:0] waddr;
  wire [ADDR_SZ-1:0] raddr;  
  
  vcQueueCtrl#(`VC_QUEUE_PIPE,ENTRIES,ADDR_SZ) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .waddr(waddr), .raddr(raddr), .flowthru(dummy)
  );

  vcRAM_1w1r_pf#(DATA_SZ,ENTRIES,ADDR_SZ) ram
  (
    .clk(clk), .wen_p(wen),
    .raddr(raddr),   .rdata(deq_bits),
    .waddr_p(waddr), .wdata_p(enq_bits)   
  );
  
endmodule

//--------------------------------------------------------------------------
// Multi-Element Flow Queue (DFF-pf based)
//--------------------------------------------------------------------------

module vcQueue_flow_pf 
#( 
  parameter DATA_SZ = 1,
  parameter ENTRIES = 2, 
  parameter ADDR_SZ = 1 
)
(
  input clk, reset,
  input  [DATA_SZ-1:0] enq_bits, input  enq_val, output enq_rdy,
  output [DATA_SZ-1:0] deq_bits, output deq_val, input  deq_rdy
); 

  wire wen, flowthru;
  wire [DATA_SZ-1:0] rout;
  wire [ADDR_SZ-1:0] waddr;
  wire [ADDR_SZ-1:0] raddr;  
  
  vcQueueCtrl#(`VC_QUEUE_FLOW,ENTRIES,ADDR_SZ) ctrl
  (
    .clk(clk), .reset(reset),
    .enq_val(enq_val), .enq_rdy(enq_rdy),
    .deq_val(deq_val), .deq_rdy(deq_rdy),
    .wen(wen), .waddr(waddr), .raddr(raddr), .flowthru(flowthru)
  );

  vcQueueDpath_flow_pf#(DATA_SZ,ENTRIES,ADDR_SZ) dpath
  (
     .clk(clk),
     .enq_bits(enq_bits),
     .deq_bits(deq_bits),
     .wen(wen), .waddr(waddr), .raddr(raddr), .flowthru(flowthru)
  );
  
endmodule

