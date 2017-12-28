// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development
//   Kits made by Terasic.  Other use of this code, including the selling
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use
//   or functionality of this code.
//
// ============================================================================
//
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//
//
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
//
// Major Functions:	DE2 TOP LEVEL
//
// ============================================================================
//
// Revision History :
// ============================================================================
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Chen       :| 05/08/19  :|      Initial Revision
//   V1.1 :| Johnny Chen       :| 05/11/16  :|      Added FLASH Address FL_ADDR[21:20]
//   V1.2 :| Johnny Chen       :| 05/11/16  :|		Fixed ISP1362 INT/DREQ Pin Direction.
//   V1.3 :| Johnny Chen       :| 06/11/16  :|		Added the Dedicated TV Decoder Line-Locked-Clock Input
//													            for DE2 v2.X PCB.
//   V1.5 :| Eko    Yan        :| 12/01/30  :|      Update to version 11.1 sp1.
// ============================================================================

module Mips
	(
		////////////////////	Clock Input	 	////////////////////
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		////////////////////	Push Button		////////////////////
		KEY,							//	Pushbutton[3:0]
		////////////////////	DPDT Switch		////////////////////
		SW,								//	Toggle Switch[17:0]
		////////////////////	7-SEG Dispaly	////////////////////
		HEX0,							//	Seven Segment Digit 0
		HEX1,							//	Seven Segment Digit 1
		HEX2,							//	Seven Segment Digit 2
		HEX3,							//	Seven Segment Digit 3
		HEX4,							//	Seven Segment Digit 4
		HEX5,							//	Seven Segment Digit 5
		HEX6,							//	Seven Segment Digit 6
		HEX7,							//	Seven Segment Digit 7
		////////////////////////	LED		////////////////////////
		LEDG,							//	LED Green[8:0]
		LEDR,							//	LED Red[17:0]
		////////////////////////	UART	////////////////////////
		//UART_TXD,						//	UART Transmitter
		//UART_RXD,						//	UART Receiver
		////////////////////////	IRDA	////////////////////////
		//IRDA_TXD,						//	IRDA Transmitter
		//IRDA_RXD,						//	IRDA Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,						//	SDRAM Address bus 12 Bits
		DRAM_LDQM,						//	SDRAM Low-byte Data Mask
		DRAM_UDQM,						//	SDRAM High-byte Data Mask
		DRAM_WE_N,						//	SDRAM Write Enable
		DRAM_CAS_N,						//	SDRAM Column Address Strobe
		DRAM_RAS_N,						//	SDRAM Row Address Strobe
		DRAM_CS_N,						//	SDRAM Chip Select
		DRAM_BA_0,						//	SDRAM Bank Address 0
		DRAM_BA_1,						//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		FL_ADDR,						//	FLASH Address bus 22 Bits
		FL_WE_N,						//	FLASH Write Enable
		FL_RST_N,						//	FLASH Reset
		FL_OE_N,						//	FLASH Output Enable
		FL_CE_N,						//	FLASH Chip Enable
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_ADDR,						//	SRAM Address bus 18 Bits
		SRAM_UB_N,						//	SRAM High-byte Data Mask
		SRAM_LB_N,						//	SRAM Low-byte Data Mask
		SRAM_WE_N,						//	SRAM Write Enable
		SRAM_CE_N,						//	SRAM Chip Enable
		SRAM_OE_N,						//	SRAM Output Enable
		////////////////////	ISP1362 Interface	////////////////
		OTG_DATA,						//	ISP1362 Data bus 16 Bits
		OTG_ADDR,						//	ISP1362 Address 2 Bits
		OTG_CS_N,						//	ISP1362 Chip Select
		OTG_RD_N,						//	ISP1362 Write
		OTG_WR_N,						//	ISP1362 Read
		OTG_RST_N,						//	ISP1362 Reset
		OTG_FSPEED,						//	USB Full Speed,	0 = Enable, Z = Disable
		OTG_LSPEED,						//	USB Low Speed, 	0 = Enable, Z = Disable
		OTG_INT0,						//	ISP1362 Interrupt 0
		OTG_INT1,						//	ISP1362 Interrupt 1
		OTG_DREQ0,						//	ISP1362 DMA Request 0
		OTG_DREQ1,						//	ISP1362 DMA Request 1
		OTG_DACK0_N,					//	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N,					//	ISP1362 DMA Acknowledge 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		////////////////////	SD_Card Interface	////////////////
		//SD_DAT,							//	SD Card Data
		//SD_WP_N,						   //	SD Write protect
		//SD_CMD,							//	SD Card Command Signal
		//SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	   TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		//I2C_SDAT,						//	I2C Data
		//I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  						//	VGA Blue[9:0]
		////////////	Ethernet Interface	////////////////////////
		ENET_DATA,						//	DM9000A DATA bus 16Bits
		ENET_CMD,						//	DM9000A Command/Data Select, 0 = Command, 1 = Data
		ENET_CS_N,						//	DM9000A Chip Select
		ENET_WR_N,						//	DM9000A Write
		ENET_RD_N,						//	DM9000A Read
		ENET_RST_N,						//	DM9000A Reset
		ENET_INT,						//	DM9000A Interrupt
		ENET_CLK,						//	DM9000A Clock 25 MHz
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////	TV Decoder		////////////////////////
		TD_DATA,    					//	TV Decoder Data bus 8 bits
		TD_HS,							//	TV Decoder H_SYNC
		TD_VS,							//	TV Decoder V_SYNC
		TD_RESET,						//	TV Decoder Reset
		TD_CLK27,                  //	TV Decoder 27MHz CLK
		////////////////////	GPIO	////////////////////////////
		GPIO_0,							//	GPIO Connection 0
		GPIO_1							//	GPIO Connection 1
	);

////////////////////////	Clock Input	 	////////////////////////
input		   	CLOCK_27;				//	27 MHz
input		   	CLOCK_50;				//	50 MHz
input			   EXT_CLOCK;				//	External Clock
////////////////////////	Push Button		////////////////////////
input	   [3:0]	KEY;					//	Pushbutton[3:0]
////////////////////////	DPDT Switch		////////////////////////
input	  [17:0]	SW;						//	Toggle Switch[17:0]
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0;					//	Seven Segment Digit 0
output	[6:0]	HEX1;					//	Seven Segment Digit 1
output	[6:0]	HEX2;					//	Seven Segment Digit 2
output	[6:0]	HEX3;					//	Seven Segment Digit 3
output	[6:0]	HEX4;					//	Seven Segment Digit 4
output	[6:0]	HEX5;					//	Seven Segment Digit 5
output	[6:0]	HEX6;					//	Seven Segment Digit 6
output	[6:0]	HEX7;					//	Seven Segment Digit 7
////////////////////////////	LED		////////////////////////////
output	[8:0]	LEDG;					//	LED Green[8:0]
output  [17:0]	LEDR;					//	LED Red[17:0]
////////////////////////////	UART	////////////////////////////
//output			UART_TXD;				//	UART Transmitter
//input			   UART_RXD;				//	UART Receiver
////////////////////////////	IRDA	////////////////////////////
//output			IRDA_TXD;				//	IRDA Transmitter
//input			   IRDA_RXD;				//	IRDA Receiver
///////////////////////		SDRAM Interface	////////////////////////
inout	  [15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output  [11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	  [7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
output [21:0]	FL_ADDR;				//	FLASH Address bus 22 Bits
output			FL_WE_N;				//	FLASH Write Enable
output			FL_RST_N;				//	FLASH Reset
output			FL_OE_N;				//	FLASH Output Enable
output			FL_CE_N;				//	FLASH Chip Enable
////////////////////////	SRAM Interface	////////////////////////
inout	 [15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output [17:0]	SRAM_ADDR;				//	SRAM Address bus 18 Bits
output			SRAM_UB_N;				//	SRAM High-byte Data Mask
output			SRAM_LB_N;				//	SRAM Low-byte Data Mask
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable
////////////////////	ISP1362 Interface	////////////////////////
inout	 [15:0]	OTG_DATA;				//	ISP1362 Data bus 16 Bits
output  [1:0]	OTG_ADDR;				//	ISP1362 Address 2 Bits
output			OTG_CS_N;				//	ISP1362 Chip Select
output			OTG_RD_N;				//	ISP1362 Write
output			OTG_WR_N;				//	ISP1362 Read
output			OTG_RST_N;				//	ISP1362 Reset
output			OTG_FSPEED;				//	USB Full Speed,	0 = Enable, Z = Disable
output			OTG_LSPEED;				//	USB Low Speed, 	0 = Enable, Z = Disable
input			   OTG_INT0;				//	ISP1362 Interrupt 0
input			   OTG_INT1;				//	ISP1362 Interrupt 1
input			   OTG_DREQ0;				//	ISP1362 DMA Request 0
input			   OTG_DREQ1;				//	ISP1362 DMA Request 1
output			OTG_DACK0_N;			//	ISP1362 DMA Acknowledge 0
output			OTG_DACK1_N;			//	ISP1362 DMA Acknowledge 1
////////////////////	LCD Module 16X2	////////////////////////////
inout	  [7:0]	LCD_DATA;				//	LCD Data bus 8 bits
output			LCD_ON;					//	LCD Power ON/OFF
output			LCD_BLON;				//	LCD Back Light ON/OFF
output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
output			LCD_EN;					//	LCD Enable
output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////	SD Card Interface	////////////////////////
//inout	 [3:0]	SD_DAT;					//	SD Card Data
//input			   SD_WP_N;				   //	SD write protect
//inout			   SD_CMD;					//	SD Card Command Signal
//output			SD_CLK;					//	SD Card Clock
////////////////////////	I2C		////////////////////////////////
//inout			   I2C_SDAT;				//	I2C Data
//output			I2C_SCLK;				//	I2C Clock
////////////////////////	PS2		////////////////////////////////
input		 	   PS2_DAT;				//	PS2 Data
input			   PS2_CLK;				//	PS2 Clock
////////////////////	USB JTAG link	////////////////////////////
input  			TDI;					// CPLD -> FPGA (data in)
input  			TCK;					// CPLD -> FPGA (clk)
input  			TCS;					// CPLD -> FPGA (CS)
output 			TDO;					// FPGA -> CPLD (data out)
////////////////////////	VGA			////////////////////////////
output			VGA_CLK;   				//	VGA Clock
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output			VGA_BLANK;				//	VGA BLANK
output			VGA_SYNC;				//	VGA SYNC
output	[9:0]	VGA_R;   				//	VGA Red[9:0]
output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
////////////////	Ethernet Interface	////////////////////////////
inout	[15:0]	ENET_DATA;				//	DM9000A DATA bus 16Bits
output			ENET_CMD;				//	DM9000A Command/Data Select, 0 = Command, 1 = Data
output			ENET_CS_N;				//	DM9000A Chip Select
output			ENET_WR_N;				//	DM9000A Write
output			ENET_RD_N;				//	DM9000A Read
output			ENET_RST_N;				//	DM9000A Reset
input			   ENET_INT;				//	DM9000A Interrupt
output			ENET_CLK;				//	DM9000A Clock 25 MHz
////////////////////	Audio CODEC		////////////////////////////
inout			   AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
input			   AUD_ADCDAT;				//	Audio CODEC ADC Data
inout			   AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
output			AUD_DACDAT;				//	Audio CODEC DAC Data
inout			   AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
output			AUD_XCK;				//	Audio CODEC Chip Clock
////////////////////	TV Devoder		////////////////////////////
input	 [7:0]	TD_DATA;    			//	TV Decoder Data bus 8 bits
input			   TD_HS;					//	TV Decoder H_SYNC
input			   TD_VS;					//	TV Decoder V_SYNC
output			TD_RESET;				//	TV Decoder Reset
input          TD_CLK27;            //	TV Decoder 27MHz CLK
////////////////////////	GPIO	////////////////////////////////
inout	[35:0]	GPIO_0;					//	GPIO Connection 0
inout	[35:0]	GPIO_1;					//	GPIO Connection 1

//IF_Stage if_(.rst(SW[0]),.clk(CLK_50),.Br_taken(1'b0),.Br_offset(32'hFFFFFFFF),.PC(32'hFFFFFFFF),.Instruction(32'hFFFFFFFF)));

wire [31:0] new_pc;
wire [31:0] instruction;
wire [31:0] pc_to_ID_wire;
wire [31:0] pc_to_EXE_wire;
wire [31:0] instruction_reg_wire;
wire [31:0] reg1_out;
wire [31:0] reg2_out;

wire [4:0] Dest_to_reg;
wire [31:0] Reg2_to_reg;
wire [31:0] val1_to_reg;
wire [31:0] val2_to_reg;
wire [3:0] exe_cmd_to_reg;

wire [4:0] Dest_to_EXE;
wire [31:0] Reg2_to_EXE;
wire [31:0] val1_to_EXE;
wire [31:0] val2_to_EXE;
wire [3:0] exe_cmd_to_EXE;
wire Br_taken_in_to_reg;
wire MEM_R_EN_in_to_reg;
wire MEM_W_EN_in_te_reg;
wire WB_EN_IN_to_reg;

wire Br_taken_to_exe;
wire MEM_R_EN_to_exe;
wire MEM_W_EN_to_exe;
wire WB_EN_to_exe;

wire [31:0] ALU_result_to_reg;
wire [31:0] pc_to_MEM;
wire [31:0] ALU_result_to_MEM;
wire [31:0] ST_val_to_MEM;
wire [4:0] Dest_to_MEM;

wire MEM_R_EN_to_MEM;
wire MEM_W_EN_to_MEM;
wire WB_EN_to_MEM;

wire [31:0] MEM_R_result_to_reg;

wire [31:0] ALU_result_to_WB;
wire [31:0] MEM_R_value_to_WB;
wire [4:0] Dest_to_WB;
wire WB_EN_to_WB;
wire MEM_R_EN_to_WB;

wire WB_EN_to_ID;
wire [31:0] write_value_to_ID;
wire [4:0] Des_to_ID;

assign flush =  1'b0;

//IF_Stage if_Stage(.rst(SW[0]),.clk(CLK_50),.Br_taken(1'b0),.Br_offset(32'hFFFFFFFF),.PC(pc),.Instruction(instruction));
IF_Stage if_stage(
	.rst(SW[0]),
	.Br_taken(SW[1]),
	.Br_offset(32'h000000FF),
	.PC(pc_to_ID_wire),
	.Instruction(instruction),
	.new_PC(new_pc)
);

IF_Stage_Registers if_stage_reg(
	.rst(SW[0]),
	.clk(CLOCK_50),
	.flush(SW[2]),
	.PC_in(new_pc),
	.Instruction_in(instruction),
	.PC(pc_to_ID_wire),
	.Instruction(instruction_reg_wire)
);

Register_File reg_file(
	.rst(SW[0]),
	.clk(CLOCK_50),
	.src1_address(instruction_reg_wire[20:16]),
	.src2_address(instruction_reg_wire[15:11]),
	.write_enable(WB_EN_to_ID),
	.address(Des_to_ID),
	.data(write_value_to_ID),
	.reg1(reg1_out),
	.reg2(reg2_out)
);

ID_Stage id_stage(
	.rst(SW[0]),
	.clk(CLOCK_50),
	.Instruction(instruction_reg_wire),
	.reg1(reg1_out),
	.reg2(reg2_out),
	.Dest(Dest_to_reg),
	.Reg2(Reg2_to_reg),
	.Val1(val1_to_reg),
	.Val2(val2_to_reg),
	.EXE_CMD(exe_cmd_to_reg)
);

ID_Stage_registers id_stage_registers(
	.rst(SW[0]),
	.clk(CLOCK_50),
	.PC_in(pc_to_ID_wire),
  .Dest_in(Dest_to_reg),
  .Reg2_in(Reg2_to_reg),
  .Val1_in(val1_to_reg),
  .Val2_in(val2_to_reg),
	.EXE_CMD_in(exe_cmd_to_reg),
	.Br_taken_in(Br_taken_in_to_reg),
	.MEM_R_EN_in(MEM_R_EN_in_to_reg),
	.MEM_W_EN_in(MEM_W_EN_in_te_reg),
  .WB_EN_IN(WB_EN_IN_to_reg),

	.PC_out(pc_to_EXE_wire),
  .Dest(Dest_to_EXE),
  .Reg2(Reg2_to_EXE),
  .Val1(val1_to_EXE),
  .Val2(val2_to_EXE),
	.EXE_CMD(exe_cmd_to_EXE),
	.Br_taken(Br_taken_to_exe),
	.MEM_R_EN(MEM_R_EN_to_exe),
	.MEM_W_EN(MEM_W_EN_to_exe),
  .WB_EN(WB_EN_to_exe)
);

EXE_Stage exe_stage(
	.clk(CLOCK_50),
	.EXE_CMD(exe_cmd_to_EXE),
	.val1(val1_to_EXE),
	.val2(val2_to_EXE),
	.ALU_result(ALU_result_to_reg)
);

EXE_Stage_registers exe_stage_registers(
	.rst(SW[0]),
	.clk(CLOCK_50),
	.PC_in(pc_to_EXE_wire),
	.ALU_result_in(ALU_result_to_reg),
	.ST_val_in(Reg2_to_EXE),
	.Dest_in(Dest_to_EXE),
	.MEM_R_EN_in(MEM_R_EN_to_exe),
	.MEM_W_EN_in(MEM_W_EN_to_exe),
	.WB_EN_IN(WB_EN_to_exe),

	.PC_out(pc_to_MEM),
	.ALU_result(ALU_result_to_MEM),
	.ST_val(ST_val_to_MEM),
	.Dest(Dest_to_MEM),

	.MEM_R_EN(MEM_R_EN_to_MEM),
	.MEM_W_EN(MEM_W_EN_to_MEM),
	.WB_EN(WB_EN_to_MEM)
);

	MEM_Stage mem_stage(
		.rst(SW[0]),
		.clk(CLOCK_50),
		.MEM_R_EN_in(MEM_R_EN_to_MEM),
		.MEM_W_EN_in(MEM_W_EN_to_MEM),
		.address(ALU_result_to_MEM),
		.ST_val(ST_val_to_MEM),

		.MEM_R_result(MEM_R_result_to_reg)
	);

	MEM_Stage_registers mem_stage_registers(
		.rst(SW[0]),
		.clk(CLOCK_50),
		.WB_EN_IN(WB_EN_to_MEM),
		.MEM_R_EN_in(MEM_R_EN_in),

		.ALU_result_in(ALU_result_to_MEM),
		.Mem_R_value_in(MEM_R_result_to_reg),
		.Dest_in(Dest_to_MEM),

    .ALU_result(ALU_result_to_WB),
    .MEM_R_value(MEM_R_value_to_WB),
		.Dest(Dest_to_WB),
		.WB_EN(WB_EN_to_WB),
		.MEM_R_EN(MEM_R_EN_to_WB)
	);

	WB_Stage wb_stage(
		.clk(CLOCK_50),
		.MEM_R_EN(MEM_R_EN_to_WB),
		.WB_EN_IN(WB_EN_to_WB),
		.ALU_result(ALU_result_to_WB),
		.Mem_read_value(MEM_R_value_to_WB),
		.Dest_in(Dest_to_WB),

		.WB_EN(WB_EN_to_ID),
		.write_value(write_value_to_ID),
		.Dest(Des_to_ID)
	);

	assign LEDG[0] = KEY[1];
	assign LEDR[0] = SW[0];
	assign LEDR[1] = SW[1];
	assign LEDR[2] = SW[2];
	assign LEDR[3] = SW[3];
	assign LEDR[4] = SW[4];

	// deguning part
	wire [5:0] op_code_d ;
	wire [5:0] rd_d;
	wire [5:0] rs1_d;
	wire [5:0] rs2_d;
	wire [15:0] immediate_d;
	wire [15:0] offset_d;

	assign op_code_d = instruction[31:26];
	assign rd_d = instruction[25:21];
	assign rs1_d = instruction[20:16];
	assign rs2_d = instruction[15:11];
	assign immediate_d = instruction[15:0];
	assign offset_d = instruction[15:0];








	To_7segments t7(
		.data(ALU_result_to_reg),
		.h0(HEX0),
		.h1(HEX1),
		.h2(HEX2),
		.h3(HEX3),
		.h4(HEX4),
		.h5(HEX5),
		.h6(HEX6),
		.h7(HEX7)
	);

//To_7segments t7( .data({reg1_out[7:0],reg2_out[7:0],pc_to_EXE_wire[7:0],pc_to_ID_wire[3:0],new_pc[3:0]}),
// .h0(HEX0), .h1(HEX1), .h2(HEX2), .h3(HEX3), .h4(HEX4), .h5(HEX5), .h6(HEX6), .h7(HEX7));

endmodule
