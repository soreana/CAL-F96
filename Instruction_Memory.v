module Instruction_Memory (address,instruction);
input [31:0] address;
output [31:0] instruction;

reg [31:0]mem[0:99];

initial begin
  mem[0]  = 32'b101010_00000_00000_0000000000000011; // JMP $3
  mem[1]  = 32'b000001_00100_00011_00010_00000000000; // add R4 <- R3 + R2
  mem[2]  = 32'b100001_00001_00111_0000000000010000; // Subi R1 <- R7 - $16
  mem[3]  = 32'b000001_00111_00011_00000_00000010000; // add R7 <- R3, R0
  mem[4]  = 32'b101001_00101_00100_1111111111111101; // BNE R4, R5
  mem[5]  = 32'b000001_00101_00100_0000000000000000; // BNE R4, R5

  /*
  mem[0] = 32'b100000_00001_00000_00000_00000001010;//-- Addi R1 <- R0 + $10
  mem[1] = 32'b000001_00010_00000_00001_00000000000;//-- Add R2 <- R1 + R0
  mem[2] = 32'b000011_00011_00000_00001_00000000000;//-- sub R3 <- R0 + R1
  mem[3] = 32'b000101_00100_00010_00011_00000000000;//-- And R4 <- R2 + R3
  mem[4] = 32'b100001_00101_00000_00000_01000110100;//-- Subi
  mem[5] = 32'b000110_00101_00101_00011_00000000000;//-- or
  mem[6] = 32'b000111_00110_00101_00000_00000000000;//-- nor
  mem[7] = 32'b001000_00000_00101_00001_00000000000;//-- xor
  mem[8] = 32'b001000_00111_00101_00001_00000000000;//-- xor
  mem[9] = 32'b001001_00111_00100_00010_00000000000;//-- sla
  mem[10] = 32'b001010_01000_00011_00010_00000000000;//-- sll
  mem[11] = 32'b001011_01001_00110_00010_00000000000;//-- sra
  mem[12] = 32'b001100_01010_00110_00010_00000000000;//-- srl
  mem[13] = 32'b100000_00001_00000_00000_10000000000;//-- Addi
  mem[14] = 32'b100101_00010_00001_00000_00000000000;//-- st
  mem[15] = 32'b100100_01011_00001_00000_00000000000;//-- ld
  mem[16] = 32'b100101_00011_00001_00000_00000000100;//-- st
  mem[17] = 32'b100101_00100_00001_00000_00000001000;//-- st
  mem[18] = 32'b100101_00101_00001_00000_00000001100;//-- st
  mem[19] = 32'b100101_00110_00001_00000_00000010000;//-- st
  mem[20] = 32'b100101_00111_00001_00000_00000010100;//-- st
  mem[21] = 32'b100101_01000_00001_00000_00000011000;//-- st
  mem[22] = 32'b100101_01001_00001_00000_00000011100;//-- st
  mem[23] = 32'b100101_01010_00001_00000_00000100000;//-- st
  mem[24] = 32'b100101_01011_00001_00000_00000100100;//-- st
  mem[25] = 32'b100000_00001_00000_00000_00000000011;//-- Addi
  mem[26] = 32'b100000_00100_00000_00000_10000000000;//-- Addi
  mem[27] = 32'b100000_00010_00000_00000_00000000000;//-- Addi
  mem[28] = 32'b100000_00011_00000_00000_00000000001;//-- Addi
  mem[29] = 32'b100000_01001_00000_00000_00000000010;//-- Addi
  mem[30] = 32'b001010_01000_00011_01001_00000000000;//-- sll
  mem[31] = 32'b000001_01000_00100_01000_00000000000;//-- Add
  mem[32] = 32'b100100_00101_01000_00000_00000000000;//-- ld
  mem[33] = 32'b100100_00110_01000_11111_11111111100;//-- ld
  mem[34] = 32'b000011_01001_00101_00110_00000000000;//-- sub
  mem[35] = 32'b100000_01010_00000_10000_00000000000;//-- Addi
  mem[36] = 32'b100000_01011_00000_00000_00000010000;//-- Addi
  mem[37] = 32'b001010_01010_01010_01011_00000000000;//-- sll
  mem[38] = 32'b000101_01001_01001_01010_00000000000;//-- And
  mem[39] = 32'b101000_00000_01001_00000_00000000010;//-- Bez
  mem[40] = 32'b100101_00101_01000_11111_11111111100;//-- st
  */

/*
  mem[0]   = 32'b100000_00001_00001_0000000000010000;
  mem[1]   = 32'b000000_00010_00011_00010_00000000000;
  mem[2]   = 32'b100001_00011_00011_0000000000010000;
  mem[3]   = 32'b000001_00101_00011_0000000000010000;
  mem[4]   = 32'b100101_00011_00111_0000000000001001; // store  R3 in M[R7+$9]
  mem[5]   = 32'b100100_00100_00111_0000000000001000; // load  m[15] in r4
  mem[6]   = 32'b101000_00000_00000_0000000000001000; // BEZ R0, R0, $8
  mem[7]   = 32'b101000_00000_00001_0000000000001000; // BEZ R0, R1, $8
  mem[8]   = 32'b101001_00100_00111_0000000000001000; // BNE R4, R7, $8
  mem[9]   = 32'b101001_00100_00100_0000000000001000; // BNE R4, R4, $8
  mem[10]  = 32'b101010_00100_00111_0000000000001000; // JMP $16
  mem[16]  = 32'b101010_00100_00111_0000000000000001; // JMP $1
  */
  /*
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


  */
  //$readmemb("instruction_file.txt",mem); // readmemh for hex
end

assign instruction = mem[address];

endmodule // InstructionMemorys
