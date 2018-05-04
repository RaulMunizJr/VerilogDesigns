module lab2part1 (SW, HEX0);
	input [3:0] SW;
	output [6:0] HEX0;

	bcd2leds U0 (SW, HEX0);
endmodule