module mux_2x1_tb;
	logic [7:0] a_i;
	logic [7:0] b_i;
	logic 			sel_i;
	logic [7:0] y_o;

	mux_2x1 m1 (.a_i(a_i), .b_i(b_i), .sel_i(sel_i), .y_o(y_o));
/*
// directed testing
	initial begin
		int i;
		sel_i = 0; a_i = 8'b0; b_i = 8'b1;
		for (i = 0; i< 6; i++) begin
			sel_i = ~sel_i;
			a_i 	= a_i + 8'b10; //a is always even
			b_i 	= b_i + 8'b10; //b is always odd
			//y_o must alternate between even and odd
			#5;
			$display ("sel_i: %d, a_i: %d, b_i: %d, y_o: %d", sel_i, a_i, b_i, y_o);
		end
	end
*/
// random testing
	initial begin
		sel_i = $urandom_range(0, 1);
		a_i 	= $urandom_range(0, 8'hFF);
		b_i 	= $urandom_range(0, 8'hFF);
		#5;
		$display ("sel_i: %d, a_i: %d, b_i: %d, y_o: %d", sel_i, a_i, b_i, y_o);
	end

endmodule
