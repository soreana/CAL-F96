module Forwarding_unit (
  input WB_EN,
  input [4:0] Des_to_ID,

  input [4:0] Mem_Dest,
  input MEM_w_EN,
  input MEM_WB_EN,

  input [4:0] src1,
  input [4:0] src2,
  input [4:0] Dest_to_EXE,

  output [1:0] src1_mux,
  output [1:0] src2_mux,
  output [1:0] st_mux,
  output can_forward
);

  wire src1_same_to_wb_dest;
  wire src2_same_to_wb_dest;

  wire src1_same_to_mem_dest;
  wire src2_same_to_mem_dest;

  assign src1_same_to_mem_dest = (Mem_Dest == src1 & MEM_WB_EN == 1'b1 & MEM_w_EN == 1'b0) ? 1'b1 : 1'b0;
  assign src2_same_to_mem_dest = (Mem_Dest == src2 & MEM_WB_EN == 1'b1 & MEM_w_EN == 1'b0) ? 1'b1 : 1'b0;

  assign src1_same_to_wb_dest = (src1 == Des_to_ID && WB_EN == 1'b1 ) ? 1'b1 : 1'b0;
  assign src2_same_to_wb_dest = (src2 == Des_to_ID && WB_EN == 1'b1 ) ? 1'b1 : 1'b0;

  assign can_forward = src1_same_to_mem_dest | src2_same_to_mem_dest | src1_same_to_wb_dest | src2_same_to_wb_dest;

  assign src1_mux = (src1 == 5'd0 )? 1'd0 : (src1_same_to_wb_dest == 1'b1 ) ? 2'd2 :(src1_same_to_mem_dest == 1'b1 ) ? 2'd1 : 2'd0;
  assign src2_mux = (src2 == 5'd0 )? 1'd0 : (src2_same_to_wb_dest == 1'b1 ) ? 2'd2 :(src2_same_to_mem_dest == 1'b1 ) ? 2'd1 : 2'd0;

endmodule // Forwarding_unit
