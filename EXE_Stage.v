module EXE_Stage
  (
    input clk,
    input [4:0] EXE_CMD,
    input [31:0] val1,
    input [31:0] val2,

    output [31:0] ALU_result
  );

  assign ALU_result = (EXE_CMD ==  5'd0) ? val1 + val2 :
                      (EXE_CMD ==  5'd1) ? val1 - val2:
                      (EXE_CMD ==  5'd2) ? val1 & val2:
                      (EXE_CMD ==  5'd3) ? val1 | val2:
                      (EXE_CMD ==  5'd4) ? ~(val1 | val2):
                      (EXE_CMD ==  5'd5) ? val1 ^ val2:
                      (EXE_CMD ==  5'd6) ? val1 << val2:
                      (EXE_CMD ==  5'd7) ? val1 <<< val2:
                      (EXE_CMD ==  5'd8) ? val1 >> val2:
                      (EXE_CMD ==  5'd9) ? val1 >>> val2:
                      (EXE_CMD == 5'd10) ? val1 + val2:
                      (EXE_CMD == 5'd11) ? val1 + val2:
                      (EXE_CMD == 5'd12) ? val1 + val2:
                      (EXE_CMD == 5'd13) ? val1 + val2:
                      (EXE_CMD == 5'd14) ? val1 + val2:
                      (EXE_CMD == 5'd15) ? val1 + val2:
                      (EXE_CMD == 5'd16) ? ((val1 + val2) - 32'd1024) >> 2 :
                      val1 + val2 ;

endmodule
