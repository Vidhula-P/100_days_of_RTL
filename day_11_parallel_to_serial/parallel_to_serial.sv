module parallel_to_serial(
	input  logic      clk,
	input  logic      reset,

	output logic      empty_o,   // Should be asserted when all of the bits are given out serially
	input  wire[3:0] parallel_i,// Parallel input vector
  
	output logic      serial_o,  // Serial bit output
	output logic      valid_o    // Serial bit is valid
);

	int counter;

	always_ff @(posedge clk or posedge reset) begin : always_block
		if (reset) begin
			empty_o  <= 0;
			serial_o <= 0;
			valid_o  <= 0;
			counter  <= 0;
		end else begin
			valid_o	 <= 1;
			serial_o <= parallel_i[counter];
			if (counter == 3) begin
				empty_o <= 1;
				valid_o <= 0;
				// counter <= 0;
			end
			else
				counter <= counter + 1;
		end
	end : always_block

endmodule
