module bin_to_gray #(
	parameter VEC_W = 4
)(
	input  logic [VEC_W-1:0] bin_i,
  output logic [VEC_W-1:0] gray_o
);

	assign gray_o = bin_i ^ (bin_i>>1);

endmodule
