module sequence_detector (
	input  wire clk,
	input  wire reset,
	input  wire x_i,  // serial input
	output wire det_o // output asserted when sequence is detected
);

	parameter [11:0] pattern = 12'b1110_1101_1011;
	reg [11:0] shift_reg;
	reg [11:0] next_shift;
	reg det_wire;

	always_ff @(posedge clk or posedge reset) begin
		if(reset) begin
			shift_reg <= 12'b0;
			det_wire  <= 0;
		end else begin
			shift_reg <= {x_i, shift_reg[11:1]}; //shift right (MSB first check);
			det_wire 	<= (shift_reg == pattern) ? 1'b1 : 1'b0;				
		end
	end

	assign det_o = det_wire;
endmodule
