module WB_Stage
  (
    input clk,
		input MEM_R_EN,
    input WB_EN_IN,
    input [31:0] ALU_result,
    input [31:0] Mem_read_value,
    input [4:0] Dest_in,

		output WB_EN,
    output [31:0] write_value,
		output [4:0] Dest
  );

  assign write_value = (MEM_R_EN) ? Mem_read_value : ALU_result;
  assign WB_EN = WB_EN_IN;
  assign Dest = Dest_in;

endmodule
