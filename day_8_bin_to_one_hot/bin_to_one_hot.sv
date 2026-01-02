// Convert N bit binary to 2^N bit one hot encoding
// If bin_i is B, the Bth bit of one_hot_o will (only) be set

module bin_to_one_hot #(
	parameter BIN_W       = 4,
  parameter ONE_HOT_W   = 16
)(
  input   wire[BIN_W-1:0]     bin_i,    // Binary input vector
  output  wire[ONE_HOT_W-1:0] one_hot_o // One-hot output
);

	//assert (BIN_W == $clog2(ONE_HOT_W)) else $error("Invalid widths");

	assign one_hot_o = 1'b1 << bin_i;

endmodule
