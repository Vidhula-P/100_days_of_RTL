module bin_to_one_hot_tb;
	parameter BIN_W = 4;
	parameter ONE_HOT_W = 16;

	logic [BIN_W-1:0] bin_i;
	logic [ONE_HOT_W-1:0] one_hot_o;

	bin_to_one_hot b1 (.bin_i(bin_i), .one_hot_o(one_hot_o));


	initial begin
		#2;
		bin_i = $urandom_range(0, 4'hF);
		#5;
		$display ("Binary: %b, One-hot: %b", bin_i, one_hot_o);
		#10;
		$finish;
	end

endmodule
