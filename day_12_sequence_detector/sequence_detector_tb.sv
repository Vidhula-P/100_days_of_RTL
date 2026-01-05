module sequence_detector_tb;
	logic clk;
	logic reset;
	logic x_i;
	logic det_o;
	bit [35:0] pattern = 36'b1110_1101_1011_1110_1101_1011_1110_1101_1011;

	logic [5:0] counter;

	sequence_detector s1 (.clk(clk), .reset(reset), .x_i(x_i), .det_o(det_o));

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		$dumpfile("sequence_detector.vcd");
		$dumpvars(0,sequence_detector_tb);
		reset = 0;
		counter = 6'd36;
		x_i = 0;
		#1; reset = 1;
		#3; reset = 0;
		while (counter != 6'd0) begin
			@(negedge clk); // avoid race condition
			x_i = pattern[counter-1];
			counter = counter - 1;
		end	
		repeat (4) @(posedge clk);
		$finish;
	end

endmodule
