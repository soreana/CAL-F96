module Instruction_Memory (address,instruction);
input [31:0] address;
output [31:0] instruction;

reg [31:0]mem[0:99];

initial begin

mem[0] = 32'd1;
mem[1] = 32'd2;
mem[2] = 32'd3;
mem[3] = 32;
mem[4] = 30;
mem[6] = 1;
mem[7] = 10;
  //$readmemb("instruction_file.txt",mem); // readmemh for hex
end

assign instruction = mem[address];

endmodule // InstructionMemorys
