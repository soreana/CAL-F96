module IF_Stage
	(
		input clk,
		input rst,
		input Br_taken,
		input [31:0] Br_offset,
		output [31:0] PC,
		output [31:0] Instruction
	);
assign PC = (Br_taken) ? 32'd14 : 32'd5;
endmodule
