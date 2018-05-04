module lab2part2 (SW, HEX0, HEX1, HEX2);
	input [11:0] SW;
	output [6:0] HEX0, HEX1, HEX2;

	bcd2leds U0 (SW[3:0], HEX0);
	bcd2leds U1 (SW[7:4], HEX1);
	bcd2leds U2 (SW[11:8], HEX2);
endmodule