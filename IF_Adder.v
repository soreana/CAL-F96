module IF_Adder (
	input [31:0] current_pc,
	input clk,
	output reg [31:0] next_pc
);

	always @ (posedge clk)
	begin
			next_pc <= current_pc + 32'd4;
	end

endmodule
