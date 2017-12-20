module IF_Stage_Registers
	(
		input clk,
		input rst,
		input flush,
		input [31:0] PC_in,
		input [31:0] Instruction_in,
		output reg [31:0] PC,
		output reg [31:0] Instruction
	);

	always @ ( posedge clk ) begin
		Instruction <= Instruction_in;
		PC <= PC_in;
	end
endmodule
