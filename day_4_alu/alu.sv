typedef enum bit [2:0] {ADD, SUB, SLL, LSR, AND, OR, XOR, EQL} operand_t;

module alu (
	input  logic [7:0]   a_i,  // First 8-bit input vector
	input  logic [7:0]   b_i,  // Second 8-bit input vector
	input  logic [2:0]   op_i, // Encoded operation
	output logic [7:0]   alu_o // ALU output
);
	logic [7:0] out;
	operand_t op_enum;
	//assign op_enum = operand_t'(op_i);

 	always_comb begin
	 unique0 case (op_i) // unique ensures atleast one of the cases matches
		 ADD: out = a_i + b_i; 			 			// ADD
		 SUB: out = a_i - b_i; 			 			// SUB
		 SLL: out = a_i << b_i[2:0]; 			// SLL -> shift a left by b[2:0]
		 LSR: out = a_i >> b_i[2:0]; 			// LSR -> shift a right by b[2:0]
		 AND: out = a_i & b_i; 			 			// (bitwise) AND
		 OR: out = a_i | b_i; 			 			// (bitwise) OR
		 XOR: out = a_i ^ b_i; 			 			// (bitwise) XOR
		 EQL: out = (a_i == b_i) ? 1 : 0; // EQL
	 endcase

	 assign alu_o = out;
	end
endmodule
