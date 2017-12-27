module EXE_Stage
  (
    input clk,
    input [3:0] EXE_CMD,
    input [31:0] val1,
    input [31:0] val2,

    output [31:0] ALU_result
  );

  assign ALU_result = (EXE_CMD ==  4'd0) ? val1 + val2 :
                      (EXE_CMD ==  4'd1) ? val1 - val2:
                      (EXE_CMD ==  4'd2) ? val1 & val2:
                      (EXE_CMD ==  4'd3) ? val1 | val2:
                      (EXE_CMD ==  4'd4) ? ~(val1 | val2):
                      (EXE_CMD ==  4'd5) ? val1 ^ val2:
                      (EXE_CMD ==  4'd6) ? val1 << val2:
                      (EXE_CMD ==  4'd7) ? val1 <<< val2:
                      (EXE_CMD ==  4'd8) ? val1 >> val2:
                      (EXE_CMD ==  4'd9) ? val1 >>> val2:
                      (EXE_CMD == 4'd10) ? val1 + val2:
                      (EXE_CMD == 4'd11) ? val1 + val2:
                      (EXE_CMD == 4'd12) ? val1 + val2:
                      (EXE_CMD == 4'd13) ? val1 + val2:
                      (EXE_CMD == 4'd14) ? val1 + val2:
                      (EXE_CMD == 4'd15) ? val1 + val2:
                      val1 + val2 ;

endmodule
