

module part4 (SW, LEDR, HEX0);
	input [2:0] SW;
	output [17:0] LEDR;
	output reg [6:0] HEX0;

	assign LEDR = SW;
	always @ (*) begin
		case (SW[2:0])
			3'b000 : HEX0 = 7'b0001001; // H
			3'b001 : HEX0 = 7'b0000110; // E
			3'b010 : HEX0 = 7'b1000111; // L
			3'b011 : HEX0 = 7'b1000000; // O
			default : HEX0 = 7'b1111111; // blank
		endcase
	end
Endmodule
