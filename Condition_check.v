module Condition_check (
  input rst,
  input [31:0] reg1,
  input [31:0] reg2,
  input is_br,
  input br_type,

  output my_opinion
);

  assign my_opinion = (is_br == 1'b0) ? 1'b0 :
                      (br_type == 1'b1 ) ? (reg1 == reg2)? 1'b1: 1'b0 :
                      (br_type == 1'b0 ) ? (reg1 == reg2)? 1'b0: 1'b1 :
                      1'b0;

endmodule // Condition_check
