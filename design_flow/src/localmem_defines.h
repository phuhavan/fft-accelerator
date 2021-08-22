//============================================================================
// Data MEMory (DMEM)
// Full address     =  | `DM_BANK_ADDR | DM_BANK_SELECT  |
//============================================================================
	`define DM_ROWS    				16													
	`define DM_COLS    				128*3*8												// in bits = 3072, total size = 6 kBytes 
	
	`define DM_BANK_COLS    		3072
	`define DM_BANK_ROWS    		`DM_ROWS													
	`define DM_BANK_ADDR			4													// log2(DM_BANK_ROWS)
	`define DM_BANK_NUM				`DM_COLS / `DM_BANK_COLS				
	`define DM_BANK_SELECT			0													// log2(DM_BANK_NUM	

	`define DM_ADDR 				(`DM_BANK_SELECT + `DM_BANK_ADDR)			

//============================================================================
// Twiddle Factor MEMory (FMEM)
// Full address     =  | `FM_BANK_ADDR | FM_BANK_SELECT  |
//============================================================================
	`define FM_ROWS    				16													
	`define FM_COLS    				128*3*8												// in bits = 1536, total size = 6 kBytes 
	
	`define FM_BANK_COLS    		3072
	`define FM_BANK_ROWS    		`FM_ROWS													
	`define FM_BANK_ADDR			4													// log2(FM_BANK_ROWS)
	`define FM_BANK_NUM				`FM_COLS / `FM_BANK_COLS				
	`define FM_BANK_SELECT			0													// log2(FM_BANK_NUM	

	`define FM_ADDR 				(`FM_BANK_SELECT + `FM_BANK_ADDR)

//============================================================================
// Transpose MEMory (TMEM)
// Full address     =  | `TM_BANK_ADDR | TM_BANK_SELECT  |
//============================================================================	

	`define TM_ROWS 				128
	`define TM_COLS 				16*3*8 												//in bits = 384, total size = 6KBytes

	`define TM_BLOCK_ROWS 			16
	`define TM_BLOCK_COLS 			24
	`define TM_BLOCK_ADDR 			4 													// = log2(TM_BLOCK_ROWS)
	`define TM_BLOCK_NUM 			`TM_COLS/`TM_BLOCK_COLS
	`define TM_BLOCK_SELECT 		4 													// = log2(TM_BLOCK_NUM)

	`define TM_BANK_ROWS 			`TM_BLOCK_ROWS
	`define TM_BANK_COLS 			`TM_COLS
	`define TM_BANK_NUM 			`TM_ROWS/`TM_BANK_ROWS
	`define TM_BANK_SELECT 			3 													// = log2(TM_BANK_NUM)
	// `define TM_BANK_ADDR 			(`TM_BLOCK_SELECT + `TM_BLOCK_ADDR)					
	`define TM_BANK_ADDR 			`TM_BLOCK_ADDR

	// `define TM_ADDR 				(`TM_BANK_SELECT + `TM_BANK_ADDR)
	`define TM_ADDR 				`TM_BANK_ADDR

	`define TM_MUL_STREAM_NUM 		8 													// For 1 port
	`define TM_FFT_STREAM_NUM 		8													// For 1 port
	`define TM_FFT_WIDTH			`TM_MUL_STREAM_NUM*`TM_COLS



//============================================================================
// Option for testbench
// 
//============================================================================
`ifdef	SIM_DMEM
	`define MEM_ROWS    				`DM_ROWS													
	`define MEM_COLS    				`DM_COLS
	`define MEM_BANK_COLS    		`DM_BANK_COLS
	`define MEM_BANK_ROWS    		`DM_BANK_ROWS
	`define MEM_BANK_ADDR    		`DM_BANK_ADDR
	`define MEM_BANK_NUM			`DM_BANK_NUM
	`define MEM_BANK_SELECT			`DM_BANK_SELECT	
	`define MEM_ADDR 					`DM_ADDR

`elsif	SIM_FMEM
	`define MEM_ROWS    				`FM_ROWS													
	`define MEM_COLS    				`FM_COLS
	`define MEM_BANK_COLS    		`FM_BANK_COLS
	`define MEM_BANK_ROWS    		`FM_BANK_ROWS
	`define MEM_BANK_ADDR    		`FM_BANK_ADDR
	`define MEM_BANK_NUM			`FM_BANK_NUM
	`define MEM_BANK_SELECT			`FM_BANK_SELECT
	`define MEM_ADDR 					`FM_ADDR

`elsif	SIM_TMEM
	`define MEM_ROWS    				`TM_ROWS													
	`define MEM_COLS    				`TM_COLS
	`define MEM_BANK_COLS    		`TM_BANK_COLS
	`define MEM_BANK_ROWS    		`TM_BANK_ROWS
	`define MEM_BANK_ADDR    		`TM_BANK_ADDR
	`define MEM_BANK_NUM			`TM_BANK_NUM
	`define MEM_BANK_SELECT			`TM_BANK_SELECT
	`define MEM_ADDR 					`TM_ADDR

`else
	//$display("ERROR --- Undefined memory (SIM_DMEM | SIM_FMEM | SIM_TMEM)!");
`endif