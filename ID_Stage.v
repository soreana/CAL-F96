module ID_Stage (
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
	output MEM_W_EN,
	output MEM_R_EN,
	output WB_EN
);

	wire is_imm;
	wire MEM_W_EN_local;
	wire MEM_R_EN_local;
	wire WB_EN_local;
	wire st_or_bne_local;
	wire is_jmp_local;
	wire is_br_local;
	wire br_type_local;
	wire my_opinion_local;


	Controll_Unit controll_unit(
		.opcode(Instruction[31:26]),
		.exec_cmd(EXE_CMD),
		.st_or_bne(st_or_bne_local),
		.MEM_W_EN(MEM_W_EN_local),
		.MEM_R_EN(MEM_R_EN_local),
		.WB_EN(WB_EN_local),

		.is_jmp(is_jmp_local),
  	.is_br(is_br_local),
  	.br_type(br_type_local),
		.is_imm(is_imm)
	);

	Condition_check condition_check(
		.reg1(reg1),
		.reg2(reg2),
		.is_br(is_br_local),
		.br_type(br_type_local),

 		.my_opinion(my_opinion_local)
	);

	assign src1 = Instruction[20:16];
	assign src2 = (st_or_bne_local == 1'b1) ? Instruction[25:21] : Instruction[15:11];
	assign Dest = Instruction[25:21];
	assign Reg2 = reg2;
	assign Val1 = reg1 ;
	assign Val2 = (is_imm) ? {{16{Instruction[15]}},Instruction[15:0]} : reg2 ;
	assign MEM_W_EN = MEM_W_EN_local;
	assign MEM_R_EN = MEM_R_EN_local;
	assign WB_EN = WB_EN_local;

	assign Br_taken = (my_opinion_local | is_jmp_local) ;

endmodule
