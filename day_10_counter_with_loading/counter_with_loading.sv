module counter_with_loading(
	input  logic      clk,
	input  logic      reset,
	input  logic      load_i,     // Load value is valid this cycle
	input  logic[3:0] load_val_i, // 4-bit load value

	output logic[3:0] count_o     // Counter output
);

	always_ff @(posedge clk or posedge reset) begin
		if (reset) //active high reset
			count_o <= 0;
		else begin
			if (load_i)
				count_o <= load_val_i; // if load_i is high, take that as count_o
			else
				count_o <= count_o + 4'b1; // normally, increment count_o
		end
	end

endmodule
