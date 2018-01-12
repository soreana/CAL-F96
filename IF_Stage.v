module IF_Stage
	(
		input rst,
		input Br_taken,
		input [31:0] PC,
		input [31:0] Br_offset,
		output [31:0] new_PC,
		output [31:0] Instruction
	);

	Instruction_Memory im( .address(PC), .instruction(Instruction));

	assign new_PC = (rst) ? 32'd0 :
									(Br_taken == 1'b1) ? (PC + Br_offset)
									: PC + 32'd1;

endmodule
