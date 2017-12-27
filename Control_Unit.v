module Controll_Unit (
  input [5:0] opcode,
  output [3:0] exec_cmd
  );

  assign exec_cmd = (opcode[5:0] <= 6'd12 ) ? opcode[3:0]: 4'd15;
                    /*
                    (opcode[5:0] == 6'd32 ) ? 5'd13:
                    (opcode[5:0] == 6'd33 ) ? 5'd14 :
                    (opcode[5:0] == 6'd36 ) ? 5'd15 :
                    (opcode[5:0] == 6'd37 ) ? 5'd16 :
                    (opcode[5:0] == 6'd40 ) ? 5'd17:
                    (opcode[5:0] == 6'd41 ) ? 5'd18 :
                    (opcode[5:0] == 6'd42 ) ? 5'd19 :
                    5'd0;
                    */

endmodule // Controll_Unit
