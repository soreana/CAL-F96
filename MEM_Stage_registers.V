module MEM_Stage_registers
  (
    input clk,
    input rst,
    input WB_EN_IN,
		input MEM_R_EN_in,

    input [31:0] ALU_result_in,
    input [31:0] Mem_R_value_in,
    input [4:0] Dest_in,


    output reg [31:0] ALU_result,
    output reg [31:0] MEM_R_value,
		output reg [4:0] Dest,
		output reg WB_EN,
		output reg MEM_R_EN
);


    always @ (posedge clk or posedge rst) begin
		  if(rst) begin
			   {Dest,ALU_result,MEM_R_value,MEM_R_EN,WB_EN} <= 0;
      end else begin
			   MEM_R_EN = MEM_R_EN_in;
         WB_EN = WB_EN_IN;
         ALU_result = ALU_result_in;
         MEM_R_value = Mem_R_value_in;
         Dest = Dest_in;
      end
    end

endmodule
