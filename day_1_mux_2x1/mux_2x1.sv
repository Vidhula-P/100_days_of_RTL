module mux_2x1 (
	input  logic [7:0] a_i,   // First leg of the mux
	input  logic [7:0] b_i,   // Second leg of the mux
	input  logic       sel_i, // Mux select
	output logic [7:0] y_o    // Mux output
);

	always_comb begin
		if (sel_i)
			y_o = a_i;					// choose a when selection line is high
		else 									// void latch
			y_o = b_i;					// choose a when selection line is low
	end

endmodule
