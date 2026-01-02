module bin_to_gray_tb;
	parameter VEC_W = 4;
	logic [VEC_W-1:0] bin_i;
	logic [VEC_W-1:0] gray_o;

	bin_to_gray b1 (.bin_i(bin_i), .gray_o(gray_o));


	initial begin
		#2;
		bin_i = $urandom_range(0, 4'hF);
		#5;
		$display ("Binary: %b, Gray: %b", bin_i, gray_o);
		#10;
		$finish;
	end

endmodule
