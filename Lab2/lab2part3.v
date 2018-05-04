module lab2part3 (SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input [7:0] SW;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	wire s1; // tens sum digit
	wire [3:0] s0; // ones sum digit

	// blank unused 7-segment displays
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	assign HEX7 = 7'b1111111;

	// display input
	bcd2leds U0 (SW[3:0], HEX4);
	bcd2leds U1 (SW[7:4], HEX6);

	// display sum
	bcd2leds U2 (s0, HEX0);
	bcd2leds U3 (s1, HEX1);

	// calculate sum
	bcdadd1 U4 (SW[3:0], SW[7:4], s0, s1);
endmodule