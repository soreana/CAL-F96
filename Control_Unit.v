module Controll_Unit (
  input rst,
  input [5:0] opcode,
  output [4:0] exec_cmd,
  output st_or_bne,
  output MEM_W_EN,
  output MEM_R_EN,
  output WB_EN,
  output is_jmp,
  output is_br,
  output br_type,
  output is_imm
);

  assign exec_cmd = (opcode[5:0] == 6'd1 ) ? 5'd0:
                    (opcode[5:0] == 6'd3 ) ? 5'd1:
                    (opcode[5:0] == 6'd5 ) ? 5'd2:
                    (opcode[5:0] == 6'd6 ) ? 5'd3:
                    (opcode[5:0] == 6'd7 ) ? 5'd4:
                    (opcode[5:0] == 6'd8 ) ? 5'd5:
                    (opcode[5:0] == 6'd9 ) ? 5'd6:
                    (opcode[5:0] == 6'd10 ) ? 5'd7:
                    (opcode[5:0] == 6'd11 ) ? 5'd8:
                    (opcode[5:0] == 6'd12 ) ? 5'd9:
                    (opcode[5:0] == 6'd32 ) ? 5'd0:
                    (opcode[5:0] == 6'd33 ) ? 5'd1 :
                    (opcode[5:0] == 6'd36 ) ? 5'd16 :
                    (opcode[5:0] == 6'd37 ) ? 5'd16 :
                    (opcode[5:0] == 6'd40 ) ? 5'd14 :
                    (opcode[5:0] == 6'd41 ) ? 5'd15 :
                    (opcode[5:0] == 6'd42 ) ? 5'd16 : 5'd0;

  assign is_imm = (opcode[5:0] == 6'd32) ? 1'b1 :
                 (opcode[5:0] == 6'd33) ? 1'b1 :
                 (opcode[5:0] == 6'd36) ? 1'b1 :
                 (opcode[5:0] == 6'd37) ? 1'b1 :
                 (opcode[5:0] == 6'd40) ? 1'b1 :
                 (opcode[5:0] == 6'd41) ? 1'b1 :
                 (opcode[5:0] == 6'd42) ? 1'b1 :
                 1'b0;

  assign MEM_R_EN = (opcode[5:0] == 6'd36) ? 1'b1 : 1'b0;
  assign MEM_W_EN = (opcode[5:0] == 6'd37) ? 1'b1 : 1'b0;
  assign WB_EN = (opcode[5:0] <= 6'd36) ? 1'b1 : 1'b0;

  assign st_or_bne = (opcode[5:0] == 6'd37 || opcode[5:0] == 6'd41 ) ? 1'b1 : 1'b0;

  assign is_jmp = (opcode[5:0] == 6'd42) ? 1'b1 : 1'b0;

  assign is_br = (opcode[5:0] == 6'd40 || opcode[5:0] == 6'd41 ) ? 1'b1 : 1'b0;

  assign br_type = (opcode[5:0] == 6'd40 ) ? 1'b1 : 1'b0;

endmodule // Controll_Unit
