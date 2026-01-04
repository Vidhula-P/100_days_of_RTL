module parallel_to_serial_tb;
	logic clk;
	logic reset;
	logic empty_o;
	logic [3:0] parallel_i;
	logic serial_o;
	logic valid_o;

	parallel_to_serial p1 (.clk(clk), .reset(reset), .empty_o(empty_o), .parallel_i(parallel_i), .serial_o(serial_o), .valid_o(valid_o) );

	initial 	clk = 0;
	always #5 clk = ~clk;

	initial begin
		reset = 0;
		#1;
		reset = 1;
		#3;
		reset = 0;
		@(posedge clk);
		parallel_i = $urandom_range(0,4'b1111);
		$display("Parallel in: %b", parallel_i);
		repeat (4) begin
			@(posedge clk);
			$display("Valid: %b, Empty: %b, Serial out: %b", valid_o, empty_o, serial_o);
		end
		repeat (5) @(posedge clk);
		$finish;
	end
endmodule
