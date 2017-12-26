module WB_stage
  (
    input clk,
    input WB_EN_IN,
    // MEM_Signals
		input MEM_R_EN,
    // memory Address
    input [31:0] ALU_result,

    input [31:0] Mem_read_value,
    input [4:0] Dest_in,

		output WB_EN,
    output [31:0] write_value,
		output [4:0] Dest
  );

endmodule
