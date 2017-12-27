module Instruction_Memory (address,instruction);
input [31:0] address;
output [31:0] instruction;

reg [31:0]mem[0:99];

initial begin

mem[0]  = 32'b000000_00000_00001_00010_00000000000;
mem[1]  = 32'b000001_00000_00011_00100_00000000000;
mem[2]  = 32'b000010_00000_00101_00110_00000000000;
mem[3]  = 32'b000011_00010_00111_01000_00000000000;
mem[4]  = 32'b000100_00011_01001_01010_00000000000;
mem[5]  = 32'b000101_00000_01011_01100_00000000000;
mem[6]  = 32'b000110_00000_01101_01110_00000000000;
mem[7]  = 32'b000111_00000_01101_01110_00000000000;
mem[8]  = 32'b001000_00000_01101_01110_00000000000;
mem[9]  = 32'b001001_00000_01101_01110_00000000000;
mem[10] = 32'b001010_00000_01101_01110_00000000000;
mem[11] = 32'b001011_00000_01101_01110_00000000000;
mem[12] = 32'b001100_00000_01101_01110_00000000000;
mem[13] = 32'b100000_00000_01101_01110_00000000000;
mem[14] = 32'b100001_00000_01101_01110_00000000000;
mem[15] = 32'b100100_00000_01101_01110_00000000000;
mem[16] = 32'b100101_00000_01101_01110_00000000000;
mem[17] = 32'b101000_00000_01101_01110_00000000000;
mem[18] = 32'b101001_00000_01101_01110_00000000000;
mem[19] = 32'b101010_00000_01101_01110_00000000000;
  //$readmemb("instruction_file.txt",mem); // readmemh for hex
end

assign instruction = mem[address];

endmodule // InstructionMemorys
