module shift_register_tb;
	logic 			clk;
	logic 			reset;
	logic 			x_i;
	logic [3:0] sr_o;

	shift_register s1 (.clk(clk), .reset(reset), .x_i(x_i), .sr_o(sr_o));

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		x_i = 0;
		reset = 1; #1;
		reset = 0; #2;
		reset = 1;			// reset released before clk rises
		// propagte 1011
		@(posedge clk); #1; x_i = 1;
		@(posedge clk); #1; x_i = 0;
		@(posedge clk); #1; x_i = 1;
		@(posedge clk); #1; x_i = 1;
		//repeat (10); @(posedge clk);
		#50;
		x_i = 0;
		$finish;
	end

endmodule
