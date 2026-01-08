module mux_2x1_tb;
	logic [3:0] a_i;
	logic [3:0] sel_i;
	logic y_ter_o;
	logic y_case_o;
	logic y_ifelse_o;
	logic y_loop_o;
	logic y_aor_o;

	mux_2x1 m1 (.a_i(a_i), .sel_i(sel_i), .y_ter_o(y_ter_o), .y_case_o(y_case_o), 
	.y_ifelse_o(y_ifelse_o), .y_loop_o(y_loop_o), .y_aor_o(y_aor_o));

	initial begin
		repeat (10) begin
			a_i   = $urandom_range(4'h0, 4'hF);
			sel_i = 4'b0001 << $urandom_range(0,3);
			#5;
			$display("sel_i: %b, a_i: %b\n", sel_i, a_i);
			$display("Expected result: %b\n", a_i[$clog2(sel_i)]);
			$strobe("teritiary operator: %b\ncase statement: %b\nif else: %b\nfor loop: %b\nand-or: %b\n\n", 
			y_ter_o, y_case_o, y_ifelse_o, y_loop_o, y_aor_o);
			#5;
		end
		$finish;
	end

endmodule