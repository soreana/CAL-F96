module IF_Stage_Registers
	(
		input clk,
		input rst,
		input flush,
		input [31:0] PC_in,
		input [31:0] Instruction_in,
		output reg [31:0] PC,
		output reg [31:0] Instruction
	);

	always @ ( posedge clk or rst) begin
		if(rst) begin
			PC <= 32'd0;
			Instruction <= 32'd0;
		end else begin
			if(flush == 1'b1) begin
				PC <= PC_in - 32'd1;
			end else begin
				PC <= PC_in;
			end
		end
			if(flush != 1'b1) begin
				Instruction <= Instruction_in;
			end else begin
				Instruction <= 32'd0;
			end
	end
endmodule
