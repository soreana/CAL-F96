module ID_Stage_registers 
	(
    input clk,
    input rst,
    // input of ID stage registers
    input [4:0] Dest_in,
    input [31:0] Reg2_in,
    input [31:0] Val2_in,
    input [31:0] Val1_in,
		input [31:0] PC_in,
		input Br_taken_in,
		input [3:0] EXE_CMD_in,
		input MEM_R_EN_in,
		input MEM_W_EN_in,
    input WB_EN_IN,

    // to Execution stage registers
		output reg [4:0] Dest,
		output reg [31:0] Reg2,
		output reg [31:0] Val2,
		output reg [31:0] Val1,
		output reg [31:0] PC_out,
		output reg Br_taken,
		output reg [3:0] EXE_CMD,
		output reg MEM_R_EN,
		output reg MEM_W_EN,
		output reg WB_EN
	);

endmodule
	