module ID_Stage
	(
		input clk,
		input rst,
		// FROM IF
		input [31:0] Instructoin,
		// From register file
		input [31:0] reg1,
		input [31:0] reg2,

		// to registres file
		output [4:0] src1,
		output [4:0] src2,
		// to IF stage registers
		output IF_flush,
		// to IF stage registers
		output [4:0] Dest,
		output [31:0] Reg2,
		output [31:0] Val2,
		output [31:0] Val1,
		output Br_taken,
		output [3:0] EXE_CMD,
		// MEM Signals
		output MEM_R_EN,
		output MEM_W_EN,
		// Write back signals
		output WB_EN
	);

endmodule
