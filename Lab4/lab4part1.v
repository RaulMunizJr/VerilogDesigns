

//digital clock with preset by switches
module lab4part1 (CLOCK_50, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
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

	wire clock_1Hz;

	reg [3:0] h1, h0, m1, m0, s1, s0;

	clock_div M0 (CLOCK_50, 25000000, clock_1Hz); // generate 1Hz clock

	hex2seg7 hour1 (h1, HEX5);
	hex2seg7 hour0 (h0, HEX4);
	hex2seg7 minute1 (m1, HEX3);
	hex2seg7 minute0 (m0, HEX2);
	hex2seg7 second1 (s1, HEX1);
	hex2seg7 second0 (s0, HEX0);
	assign HEX6 = 7'b1111111;
	assign HEX7 = 7'b1111111;

	always @ (posedge clock_1Hz) begin
    	if (SW[17]) 
    	begin
        	h1 = SW[15:12];
        	h0 = SW[11:8];
        	m1 = SW[7:4];
        	m0 = SW[3:0];
        	s1 = 0;
        	s0 = 0;
    	end 
    	else
    	 begin
        	s0 = s0 + 1;
        	if (s0 == 10) begin
            	s1 = s1 + 1;
            	s0 = 0;
        	end
        	if (s1 == 6) begin
            	m0 = m0 + 1;
            	s1 = 0;
        	end
        	if (m0 == 10) begin
            	m1 = m1 + 1;
            	m0 = 0;
        	end
        	if (m1 == 6) begin
            	h0 = h0 + 1;
            	m1 = 0;
        	end
        	if (h0 == 10) begin
            	h1 = h1 + 1;
            	h0 = 0;
        	end
        	if (h1 == 2 && h0 == 4) begin
            	h1 = 0;
            	s0 = 0;
        	end
    	end
	end
endmodule
