// Monitors when input signal a_i rises or falls

module edge_detector (
	input  logic clk,
	input  logic reset,					// Asynchronous reset
	input  logic a_i,            // Serial input to the module
	output logic rising_edge_o,  // Rising edge output
	output logic falling_edge_o  // Falling edge output
);

	logic prev_a_i;
	always_ff @(posedge clk or negedge reset) begin
		if (!reset)
			prev_a_i <= 0;
		else
			prev_a_i <= a_i;	
	end
	assign rising_edge_o = ~prev_a_i & a_i;
	assign falling_edge_o = prev_a_i & ~a_i;

endmodule
