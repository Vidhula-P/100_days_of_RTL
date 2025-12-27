// P(x) = 1 + x^2 + x^4

module lfsr (
	input  wire      clk,
	input  wire      reset,
	output wire[3:0] lfsr_o
);
	logic [3:0] lfsr_wire;

	always_ff @(posedge clk or negedge reset) begin
		if (!reset)
			lfsr_wire <= 4'hE;
		else begin
			lfsr_wire <= {lfsr_wire[2:0], (lfsr_wire[1] ^ lfsr_wire[3]) };
		end
	end

	assign lfsr_o = lfsr_wire;

endmodule
