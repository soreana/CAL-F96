module IF_Stage
	(
		input clk,
		input rst,
		input Br_taken,
		input [31:0] Br_offset,
		output reg [31:0] PC,
		output [31:0] Instruction
	);

	//assign Instruction = 32'b01110110010101000011001000010000; // check 7,6,5,4,3,2,1,0
	assign Instruction = 32'b11111110110111001011101010011000; // check f,e,d,c,b,a,9,8

  always @ (posedge clk or posedge rst)
  if (rst) begin
    	PC <= 32'd0;
    end
	else if (Br_taken) begin
    	PC <= Br_offset;
  end else begin
    	PC <= PC + 32'd4;
  end

endmodule
