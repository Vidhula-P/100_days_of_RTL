module dff_tb;
	logic clk;
	logic reset;
	logic d_i;
	logic q_norst_o;
	logic q_syncrst_o;
	logic q_asyncrst_o;

	dff d1 (.clk(clk), .reset(reset), .d_i(d_i), .q_norst_o(q_norst_o), .q_syncrst_o(q_syncrst_o), .q_asyncrst_o(q_asyncrst_o) );

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		reset = 1;
		d_i = 0;

		@(posedge clk);
		d_i = 1;
		@(posedge clk);
		@(posedge clk);
		d_i = 0;
		@(posedge clk);
		@(posedge clk);
		d_i = 1;
		//raise reset asychronous from clock
		#2;
		reset = 0;
		@(posedge clk);
		d_i = 1;
		@(posedge clk);
		d_i = 0;
		@(posedge clk);
		reset = 1;
		@(posedge clk);
		d_i = 1;
		@(posedge clk);
		@(posedge clk);
		d_i = 0;
		@(posedge clk);
		@(posedge clk);
		d_i = 1;
		@(posedge clk);
		//raise reset asychronous from clock
		#2;
		reset = 0;
		@(posedge clk);
		@(posedge clk);
		d_i = 0;
		@(posedge clk);
		@(posedge clk);
		$finish;
	end
endmodule
