`timescale 1ns / 1ps

module TestBench ();
	reg clk;
	reg rst; // SW[0]
	reg br_taken; // SW[1]
	reg flush ; // SW[2]
	reg write_enable; // SW[3]

	Mips mips(.CLOCK_50(clk),.SW({17'b00000000000000,write_enable,flush,br_taken,rst}));

	initial begin
		rst = 1'b1;
		clk = 1'b1;
		br_taken = 1'b0;
		flush = 1'b0;
		write_enable = 1'b0;

		#100 rst = 1'b0;
		#100 rst = 1'b1;
		#100 rst = 1'b0;

		repeat (500) #20 clk = !clk;
	end

endmodule
