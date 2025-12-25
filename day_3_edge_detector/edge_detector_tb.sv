module edge_detector_tb;
	logic clk;
	logic reset;
	logic a_i;
	logic rising_edge_o;
	logic falling_edge_o;

	edge_detector e1 (.clk(clk), .reset(reset), .a_i(a_i), .rising_edge_o(rising_edge_o), .falling_edge_o(falling_edge_o));

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		bit [3:0] i;
  	// 1. Start in reset
  	reset = 0;
  	a_i   = 0;
  	// 2. Hold reset for a few clocks
  	repeat (2) @(posedge clk);
  	// 3. Release reset synchronously
  	reset = 1;
  	// 4. Now drive stimulus
		for (i = 0; i<10; i++) begin
			@(posedge clk);
			#1; //avoid race condition
			a_i = $urandom%2;
		end
		$finish;
	end
endmodule
