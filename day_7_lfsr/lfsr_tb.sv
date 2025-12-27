module lfsr_tb;
	logic 			clk;
	logic 			reset;
	logic [3:0] lfsr_o;

	lfsr l1 (.clk(clk), .reset(reset), .lfsr_o(lfsr_o));

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		reset = 1; #1;
		reset = 0; #2;
		reset = 1;			// reset released before clk rises
		// wait
		repeat (15) @(posedge clk);
		$finish;
	end

endmodule
