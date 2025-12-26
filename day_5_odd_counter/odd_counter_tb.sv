module odd_counter_tb;
	logic			 clk;
	logic			 reset;
	logic[7:0] cnt_o;

	odd_counter o1 (.clk(clk), .reset(reset), .cnt_o(cnt_o));

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		bit [7:0] i;
		reset = 1; #1;
		reset = 0;
		#3; //Avoid race condition
		reset = 1;
		for (i = 0; i<5; i++)
			@(posedge clk);
		#3;
		$display("Odd counter: %d", cnt_o);
		$finish;
	end
endmodule
