module EXE_Stage
  (
    input clk,
    input [3:0] EXE_CMD,
    input [31:0] val1,
    input [31:0] val2,

    output [31:0] ALU_result
  );
