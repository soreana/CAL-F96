module IF_Stage
	(
		input rst,
		input Br_taken,
		input [31:0] PC,
		input [31:0] Br_offset,
		output [31:0] new_PC,
		output [31:0] Instruction
	);

	//assign Instruction = 32'b01110110010101000011001000010000; // check 7,6,5,4,3,2,1,0
	//assign Instruction = 32'b11111110110111001011101010011000; // check f,e,d,c,b,a,9,8
	Instruction_Memory im( .address(PC), .instruction(Instruction));

	assign new_PC = (rst) ? 32'd0 :
									(Br_taken == 1'b1) ? (PC + Br_offset)
									: PC + 32'd1;

	/*
  always @ (posedge clk)
		if (rst) begin
    	PC <= 32'd0;
    end
	 //	else if (Br_taken) begin
  //  	PC <= Br_offset;
  //end
  else begin
    	PC <= (Br_taken == 1'b1) ? (PC + Br_offset) : PC + 32'd1;
  end
	*/

endmodule
