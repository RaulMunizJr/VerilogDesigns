module lab2part4 (SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input [15:0] SW;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	wire c0, c1; // carries
	wire [3:0] s0, s1; // ones and tens digits

	// blank unused 7-segment display
	assign HEX3 = 7'b1111111;

	// display input
	bcd2leds U0 (SW[3:0], HEX4);
	bcd2leds U1 (SW[7:4], HEX5);
	bcd2leds U2 (SW[11:8], HEX6);
	bcd2leds U3 (SW[15:12], HEX7);

	// display sum
	bcd2leds U4 (s0, HEX0);
	bcd2leds U5 (s1, HEX1);
	bcd2leds U6 (c1, HEX2);

	// calculate sum
	bcdadd1fa U7 (SW[3:0], SW[11:8], 0, s0, c0);
	bcdadd1fa U8 (SW[7:4], SW[15:12], c0, s1, c1);
endmodule