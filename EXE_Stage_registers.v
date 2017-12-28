module EXE_Stage_registers
  (
    input clk,
    input rst,

		input [31:0] PC_in,
		input [31:0] ALU_result_in,
		input [31:0] ST_val_in,
		input [4:0] Dest_in,

		input MEM_R_EN_in,
		input MEM_W_EN_in,
    input WB_EN_IN,

		output reg [31:0] PC_out,
		output reg [31:0] ALU_result,
		output reg [31:0] ST_val,
		output reg [4:0] Dest,

		output reg MEM_R_EN,
		output reg MEM_W_EN,
		output reg WB_EN
  );

  always @ (posedge clk or posedge rst ) begin
    if(rst) begin
      {PC_out,ALU_result,ST_val,Dest,MEM_R_EN,MEM_W_EN,WB_EN} <= 0;
    end else begin
      PC_out <= PC_in;
      ALU_result <= ALU_result_in;
      ST_val <= ST_val_in;
      Dest <= Dest_in;
      MEM_R_EN <= MEM_R_EN_in;
      MEM_W_EN <= MEM_W_EN_in;
      WB_EN <= WB_EN_IN;
    end
  end

endmodule
