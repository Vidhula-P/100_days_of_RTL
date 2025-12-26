// 4-stage serial in / parallel out Shift Register
//four data bits are shifted in by four clock pulses via a single wire "x_i"
//the data becomes available simultaneously across sr_o[0] ... sr[3] after the fourth clock pulse

module shift_register (
	input  wire      clk,
	input  wire      reset,
	input  wire      x_i,  // Serial input
	output wire[3:0] sr_o  // Shift register output
);
	logic [3:0] prl_out;

	always_ff @(posedge clk or negedge reset) begin
		if (!reset)
			prl_out = 4'b0;
		else begin
			prl_out = prl_out << 1;
			prl_out[0] = x_i;
		end
	end

	assign sr_o = prl_out;

endmodule
