

module lab5part2 (CLOCK_50, KEY, HEX0);
	input CLOCK_50;
	input [0:0] KEY;

	output [6:0] HEX0;

	wire clock_10Hz;

	reg [6:0] q, q_star;
	reg [3:0] step;

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

	clock_div M0 (CLOCK_50, 2500000, clock_10Hz);

	assign HEX0 = q;

	always @ (*) 
    begin
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

	always @ (posedge clock_10Hz, negedge KEY[0]) 
    begin
    	if (!KEY[0]) 
        begin
        	q <= a;
        	step <= 0;
    	end 
        else 
        begin
        	if (step == 9 || (step == 4 && (q == ab || q == bc || q == cd || q == de || q == ef || q == fa))) 
            begin
            	q <= q_star;
            	step <= 0;
        	end else begin
            	step <= step + 1;
        	end
    	end
	end
endmodule
