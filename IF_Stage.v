module IF_Stage
	(
		input clk,
		input rst,
		input Br_taken,
		input [15:0] PC_in,
		input [31:0] Br_offset,
		output [31:0] PC,
		output [31:0] Instruction
	);
