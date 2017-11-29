module To_7segments (
	input [31:0] data,
  output  [6:0] h0,
  output  [6:0] h1,
  output  [6:0] h2,
  output  [6:0] h3,
  output  [6:0] h4,
  output  [6:0] h5,
  output  [6:0] h6,
  output  [6:0] h7);

  To_7segment segment0(.data(data[ 3: 0]), .hex(h0) );
  To_7segment segment1(.data(data[ 7: 4]), .hex(h1) );
  To_7segment segment2(.data(data[11: 8]), .hex(h2) );
  To_7segment segment3(.data(data[15:12]), .hex(h3) );
  To_7segment segment4(.data(data[19:16]), .hex(h4) );
  To_7segment segment5(.data(data[23:20]), .hex(h5) );
  To_7segment segment6(.data(data[27:24]), .hex(h6) );
  To_7segment segment7(.data(data[31:28]), .hex(h7) );

endmodule // Instruction_to_7segmeninput t
