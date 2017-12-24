module Register_File(
input rst,
input clk,
input [4:0] src1_address,
input [4:0] src2_address,
input write_enable,
input [4:0] address,
input [31:0] data,
output [31:0] reg1,
output [31:0] reg2 );

// todo fix this shit
reg [31:0]regfile[0:31];

integer i;
assign reg1 = regfile[src1_address];
assign reg2 = regfile[src2_address];

always @ (negedge clk) begin
  if(rst) begin
    for(i = 0; i<8; i=i+1) begin
      regfile[i]<= i;
    end
  end else begin
    if(write_enable && address != 0) begin
      regfile[address] <= data;
		end
  end
end

endmodule // InstructionMemorys
