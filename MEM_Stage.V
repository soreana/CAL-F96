module MEM_Stage
  (
    input clk,
    input rst,
    input MEM_R_EN_in,
		input MEM_W_EN_in,

    input [31:0] address,
    input [31:0] ST_val,

    output [31:0] MEM_R_result
  );

  reg [31:0] memory [0:63];
  integer i;

  assign MEM_R_result = memory[address];

  always @ (posedge clk or posedge rst) begin
    if(rst) begin
      for(i = 0; i<64; i=i+1) begin
        memory[i]<= i;
      end
    end else begin
      if(MEM_W_EN_in == 1'b1) begin
        memory[address] <= ST_val;
      end
    end
  end
endmodule
