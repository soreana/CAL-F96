module Instruction_Memory (address,instruction);
input [31:0] address;
output [31:0] instruction;

reg [31:0]mem[0:99];

initial begin

mem[0] = 32'b00000000000000010001000000000000;
mem[1] = 32'b00000000000000110010000000000000;
mem[2] = 32'b00000000000001010011000000000000;
mem[3] = 32'b00000000010001110100000000000000;
mem[4] = 32'b00000000011010010101000000000000;
mem[5] = 32'b00000000000010110110000000000000;
mem[6] = 32'b00000000000011010111000000000000;
  //$readmemb("instruction_file.txt",mem); // readmemh for hex
end

assign instruction = mem[address];

endmodule // InstructionMemorys
