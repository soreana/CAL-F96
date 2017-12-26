module MEM_Stage
  (
    input clk,
    // MEM_Signals
    input MEM_R_EN_in,
		input MEM_W_EN_in,

    input [31:0] ALU_result_in,
    input [31:0] ST_val,

    // MEM_Signals
    output [31:0] Mem_read_value
  );

endmodule
