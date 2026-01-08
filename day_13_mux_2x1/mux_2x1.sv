module mux_2x1 (
	input  logic [3:0] a_i,   	   // Each bit is one input
	input  logic [3:0] sel_i,      // Mux select

	output logic       y_ter_o,    // Output using ternary operator
	output logic       y_case_o,   // Output using case
	output logic       y_ifelse_o, // Ouput using if-else
	output logic       y_loop_o,   // Output using for loop
	output logic       y_aor_o 	   // Output using and-or tree
);

	// Output using ternary operator
	assign y_ter_o = (sel_i[0]) ? a_i[0] : (
		(sel_i[1]) ? a_i[1] : (
			(sel_i[2]) ? a_i[2] : a_i[3]
		)
	);

	// Output using case
	always@(*) begin
		case (sel_i)
			4'b0001: y_case_o = a_i[0];
			4'b0010: y_case_o = a_i[1];
			4'b0100: y_case_o = a_i[2];
			4'b1000: y_case_o = a_i[3];
			default: y_case_o = a_i[3];
		endcase
	end

	// Ouput using if-else
	always@(*) begin
		if (sel_i[0])
			y_ifelse_o = a_i[0];
		else if (sel_i[1])
			y_ifelse_o = a_i[1];
		else if (sel_i[2])
			y_ifelse_o = a_i[2];
		else
			y_ifelse_o = a_i[3];
	end

	// Output using for loop
	always_comb begin
		int i; // declare inside so i is included in the sensitivity list
		y_loop_o = '0;
		for (i = 0; i<4; i++) begin
			y_loop_o = y_loop_o | (sel_i[i] & a_i[i]);
		end
	end

	// Output using and-or tree
	assign y_aor_o = (sel_i[0] & a_i[0]) | (sel_i[1] & a_i[1]) 
						| (sel_i[2] & a_i[2]) | (sel_i[3] & a_i[3]);

endmodule