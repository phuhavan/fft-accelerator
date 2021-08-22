module mul_complex 
#(parameter width = 24)
(
	input clk,    // Clock
	input rst,
	input 	[width-1:0]	p, q,
	output 	[width-1:0] r
);

	localparam width_div2  =  width/2;

	wire [width_div2-1:0] ap, bp, aq, bq, ar, br;

	wire [width-1:0] mul_1, mul_2, mul_3, mul_4;
	wire [width-1:0] add_1, add_2;

	reg  [width_div2-1:0] ar_reg, br_reg;

	reg  [width-1:0] mul_1_reg, mul_2_reg, mul_3_reg, mul_4_reg;

	reg [width-1:0] p_reg, q_reg;

	assign {ap,bp} = p_reg;
	assign {aq,bq} = q_reg;
	assign r = {ar_reg,br_reg};

	assign mul_1 = ap*aq;
	assign mul_2 = bp*bq;
	assign mul_3 = aq*bp;
	assign mul_4 = ap*bq;

	assign add_1 = mul_1 - mul_2;
	assign add_2 = mul_3 + mul_4;

	assign ar = {add_1[width-1], add_1[width-4:width_div2-2]};
	assign br = {add_2[width-1], add_2[width-4:width_div2-2]};

	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			p_reg <= 0;
			q_reg <= 0;
		end
		else begin
			p_reg <= p;
			q_reg <= q;
		end
	end

	// always @ (posedge clk or posedge rst) begin
	// 	if(rst)begin
	// 		mul_1_reg <= 0;
	// 		mul_2_reg <= 0;
	// 		mul_3_reg <= 0;
	// 		mul_4_reg <= 0;
	// 	end
	// 	else begin
	// 		mul_1_reg <= mul_1;
	// 		mul_2_reg <= mul_2;
	// 		mul_3_reg <= mul_3;
	// 		mul_4_reg <= mul_4;
	// 	end
	// end

	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			ar_reg <= 0;
			br_reg <= 0;
		end
		else begin 
			ar_reg <= ar;
			br_reg <= br;
		end
	end

endmodule