module ID_Stage_registers
	(
    input clk,
    input rst,
    // input of ID stage
		input [31:0] PC_in,
    input [4:0] Dest_in,
    input [31:0] Reg2_in,
    input [31:0] Val2_in,
    input [31:0] Val1_in,
		input [3:0] EXE_CMD_in,
		input Br_taken_in,
		input MEM_R_EN_in,
		input MEM_W_EN_in,
    input WB_EN_IN,

    // to Execution stage registers
		output reg [4:0] Dest,
		output reg [31:0] Reg2,
		output reg [31:0] Val2,
		output reg [31:0] Val1,
		output reg [31:0] PC_out,
		output reg [3:0] EXE_CMD,
		output reg Br_taken,
		output reg MEM_R_EN,
		output reg MEM_W_EN,
		output reg WB_EN
	);

	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			{Dest,Reg2,Val2,Val1,PC_out,EXE_CMD,Br_taken,MEM_R_EN,MEM_W_EN,WB_EN} <= 0;
		end else begin
			Dest = Dest_in;
			Reg2 = Reg2_in;
			Val2 = Val2_in;
			Val1 = Val1_in;
			PC_out = PC_in;
			Br_taken = Br_taken_in;
			EXE_CMD = EXE_CMD_in;
			MEM_R_EN = MEM_R_EN_in;
			MEM_W_EN = MEM_W_EN_in;
			WB_EN = WB_EN_IN;
		end
	end

endmodule
