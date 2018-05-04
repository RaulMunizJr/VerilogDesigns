
module lab5part1 (CLOCK_50, KEY, HEX0);
	input CLOCK_50;
	input [0:0] KEY;

	output [6:0] HEX0;

	wire clock_1Hz;

	reg [6:0] q, q_star;

	localparam [6:0]
    	a  = 7'b1111110,
    	ab = 7'b1111100,
    	b  = 7'b1111101,
    	bc = 7'b1111001,
    	c  = 7'b1111011,
    	cd = 7'b1110011,
    	d  = 7'b1110111,
    	de = 7'b1100111,
    	e  = 7'b1101111,
    	ef = 7'b1001111,
    	f  = 7'b1011111,
    	fa = 7'b1011110;

	clock_div M0 (CLOCK_50, 25000000, clock_1Hz);

	assign HEX0 = q;

	always @ (*) begin
    	case (q)
        	a:  q_star = ab;
        	ab: q_star = b;
        	b:  q_star = bc;
        	bc: q_star = c;
        	c:  q_star = cd;
        	cd: q_star = d;
        	d:  q_star = de;
        	de: q_star = e;
        	e:  q_star = ef;
        	ef: q_star = f;
        	f:  q_star = fa;
        	fa: q_star = a;
    	endcase
	end

	always @ (posedge clock_1Hz, negedge KEY[0]) begin
    	if (!KEY[0])
        	q <= a;
    	else
        	q <= q_star;
	end
endmodule
