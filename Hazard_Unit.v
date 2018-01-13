module Hazard_Unit (
  input [4:0] src1,
  input [4:0] src2,
  input [4:0] Exe_Dest,
  input Exe_WB_en,
  input [4:0] Mem_Dest,
  input is_br,
	input br_type,
  input Mem_WB_en,
  input is_im,

  output hazard_Detected
);
  wire src1_hazard;
  wire src2_hazard;

  assign src1_hazard = (src1 == 5'd0)? 1'd0:
                       (Exe_WB_en == 1'b1 && src1 == Exe_Dest) ? 1'b1 :
                       //(Mem_WB_en == 1'b1 && src1 == Mem_Dest) ? 1'b1 :
                       (is_br == 1'b1 && src1 == Mem_Dest)? 1'b1:
                       (is_br == 1'b1 && src1 == Exe_Dest)? 1'b1:
                       1'b0;

  assign src2_hazard = (src2 == 5'd0)? 1'd0:
                       (is_br == 1'b1 && br_type == 1'b0 && src2 == Mem_Dest)? 1'b1:
                       (is_br == 1'b1 && br_type == 1'b0 && src2 == Exe_Dest)? 1'b1:
                       (is_im == 1'b1) ? 1'b0:
                       (Exe_WB_en == 1'b1 && src2 == Exe_Dest) ? 1'b1 :
                       //(Mem_WB_en == 1'b1 && src2 == Mem_Dest) ? 1'b1 :
                       1'b0;

  assign hazard_Detected = src1_hazard | src2_hazard;

endmodule // Hazard_Unit
