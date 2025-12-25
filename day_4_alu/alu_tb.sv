module alu_tb;
	logic [7:0] a_i;
	logic [7:0] b_i;
	logic [2:0] op_i;
	logic [7:0] alu_o;

	operand_t op_enum;

	alu a1 (.a_i(a_i), .b_i(b_i), .op_i(op_i), .alu_o(alu_o));

	initial begin
		bit [3:0] i;
		a_i = $urandom%8;
		b_i = $urandom%8;
		for (i=0; i<8; i++) begin
			op_i = i;
			op_enum = operand_t'(op_i);
			#5;
			$display("a_i: %d, b_i: %d, op_i: %s, alu_o: %d", a_i, b_i, op_enum.name(), alu_o);
		end
	end
endmodule
