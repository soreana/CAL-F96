module ID_Stage
	(
		input clk,
		input rst,

		input [31:0] Instruction,
		input [31:0] reg1,
		input [31:0] reg2,

		// to ID stage registres
		output [4:0] src1, // why ???
		output [4:0] src2, // why ???
		output [4:0] Dest,
		output [31:0] Reg2,
		output [31:0] Val1,
		output [31:0] Val2,
		output [3:0] EXE_CMD,

		// todo
		output IF_flush,
		output Br_taken,
		output MEM_R_EN,
		output MEM_W_EN,
		output WB_EN
	);

	Controll_Unit controll_unit(.opcode(Instruction[31:26]), .exec_cmd(EXE_CMD));

	assign src1 = Instruction[20:16];
	assign src2 = Instruction[15:11];
	assign Dest = Instruction[25:21];
	assign Reg2 = reg2;
	assign Val1 = reg1 ;
	assign Val2 = reg2 ;

endmodule
