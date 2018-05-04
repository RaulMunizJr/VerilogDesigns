

//digital clock with preset by switches
module lab4part2 (CLOCK_50, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	// When SW[17] = 1 we are in time setting mode. When it's 0, clock running mode.
	// When SW[17] = 1:
	//   * SW[15:12] for hour1, SW[11:8] for hour0. (2-digit hour)
	//   * SW[7:4] for minute1, SW[3:0] for minute0. (2-digit minute)
	//   * second1, second0 are 00. (2-digit seconds)
	input CLOCK_50; // 50MHz clock
	input [17:0] SW;

	// HEX7 HEX6 are turned off
	// HEX5 HEX4 for hour
	// HEX3 HEX2 for minute
	// HEX1 HEX0 for seconds
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

	wire clock_1Hz, clock_min, clock_hr, clock_day;

	wire [23:0] Q;

	clock_div M0 (CLOCK_50, 250000, clock_1Hz); // generate 1Hz clock

	BCD2Counter U0 (clock_1Hz, 60, SW[17], 0, Q[7:0], clock_min);
	BCD2Counter U1 (clock_min, 60, SW[17], SW[7:0], Q[15:8], clock_hr);
	BCD2Counter U2 (clock_hr, 24, SW[17], SW[15:8], Q[23:16], clock_day);

	hex2seg7 hour1 (Q[23:20], HEX5);
	hex2seg7 hour0 (Q[19:16], HEX4);
	hex2seg7 minute1 (Q[15:12], HEX3);
	hex2seg7 minute0 (Q[11:8], HEX2);
	hex2seg7 second1 (Q[7:4], HEX1);
	hex2seg7 second0 (Q[3:0], HEX0);
	assign HEX6 = 7'b1111111;
	assign HEX7 = 7'b1111111;
endmodule
