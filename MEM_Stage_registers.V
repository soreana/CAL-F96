module Mem_stage_reg
  (
    input clk,
    input rst,
    input WB_EN_IN,
    // MEM Signals
		input MEM_R_EN_in,
    // memory Address
    input [31:0] ALU_result_in,

    input [31:0] Mem_read_value_in,
    input [4:0] Dest_in,

    
		output reg WB_EN,
    // MEM signals
		output reg MEM_R_EN,
    // memory Address 
    input [31:0] ALU_result,

    input [31:0] Mem_read_value,
		output reg [4:0] Dest,
    );
