module counter_with_loading_tb;
	logic			 clk;
	logic			 reset;
	logic			 load_i;
	logic[3:0] load_val_i;
	logic[3:0] count_o;

	counter_with_loading c1 (.clk(clk), .reset(reset), .load_i(load_i), .load_val_i(load_val_i), .count_o(count_o));

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		bit [7:0] i;
		load_i = 0;
		reset = 0; #1;
		reset = 1;
		#3; //Avoid race condition
		reset = 0;
		repeat (5) @(posedge clk);
		#3;
		$display("Counter: %d", count_o);
		@(posedge clk);
		load_i = 1;
		load_val_i = 4'd3;
		@(posedge clk);
		$display("Counter: %d", count_o);
		load_i = 0;
		repeat (5) @(posedge clk);
		$display("Counter: %d", count_o);
		repeat (5) @(posedge clk);
		$finish;
	end
endmodule
