

module part2 (SW, LEDR, LEDG);
	input [17:0] SW;
	output [17:0] LEDR;
	output reg [7:0] LEDG;

	assign LEDR = SW;
	always @ (*) begin
		if (SW[17])
			LEDG = SW[15:8];
		else
			LEDG = SW[7:0];
	end
endmodule
