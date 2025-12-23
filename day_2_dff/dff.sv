module dff (
	input  logic clk,
	input  logic reset,

	input  logic d_i,         // D input to the flop

	output logic q_norst_o,   // Q output from non-resettable flop
	output logic q_syncrst_o, // Q output from flop using synchronous reset
	output logic q_asyncrst_o // Q output from flop using asynchrnoous reset
);

	// Without reset
	always_ff @(posedge clk)
		q_norst_o <= d_i;

	// Synchronous reset
	always_ff @(posedge clk) begin
		if (!reset)
			q_syncrst_o <= 0;
		else
			q_syncrst_o <= d_i;
	end

	// Asynchronous reset
	always_ff @(posedge clk or negedge reset) begin
		if (!reset)
			q_asyncrst_o <= 0;
		else
			q_asyncrst_o <= d_i;
	end

endmodule
