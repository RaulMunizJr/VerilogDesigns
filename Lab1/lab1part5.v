

module lab1part5 (SW, HEX0, HEX1, HEX2, HEX3, HEX4);
	input [17:0] SW;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;

	wire [2:0] m0, m1, m2, m3, m4;

	mux_3bit_5to1 M0 (SW[17:15], SW[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], m0);
	char_7seg H0 (m0, HEX0);

	mux_3bit_5to1 M1 (SW[17:15], SW[5:3], SW[2:0], SW[14:12], SW[11:9], SW[8:6], m1);
	char_7seg H1 (m1, HEX1);

	mux_3bit_5to1 M2 (SW[17:15], SW[8:6], SW[5:3], SW[2:0], SW[14:12], SW[11:9], m2);
	char_7seg H2 (m2, HEX2);

	mux_3bit_5to1 M3 (SW[17:15], SW[11:9], SW[8:6], SW[5:3], SW[2:0], SW[14:12], m3);
	char_7seg H3 (m3, HEX3);

	mux_3bit_5to1 M4 (SW[17:15], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[2:0], m4);
	char_7seg H4 (m4, HEX4);
endmodule
