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
reg [31:0]regfile[0:32];

assign reg1 = regfile[src1_address];
assign reg2 = regfile[src2_address];

always @ (posedge clk) begin
  if(rst)begin
    regfile[5'd0] = 32'd0;
    regfile[5'd1] = 32'd1;
    regfile[5'd2] = 32'd2;
    regfile[5'd3] = 32'd3;
    regfile[5'd4] = 32'd4;
    regfile[5'd5] = 32'd5;
    regfile[5'd6] = 32'd6;
  end else begin
    if(write_enable) begin
      regfile[address] <= data;
    end
  end
end

endmodule // InstructionMemorys
