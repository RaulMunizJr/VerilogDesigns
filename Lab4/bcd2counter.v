

//4 bit 2-digit BCD counter with modN, and preset control and Q0 starting point
module BCD2Counter (clk, modN, preset, Q0, Q, Cout);
    input clk;
	input [5:0] modN; // 6bit mod number :mod-60 counter for min, sec, and mod-24 counter for hr
	input preset; // high active preset
	input [7:0] Q0; // to set initial value

	output [7:0] Q; // 2 bcds
	output reg Cout; // carry out

	reg [3:0] bcd1; // high digit
	reg [3:0] bcd0; // high digit

	assign Q = { bcd1,bcd0 }; // assemble to 2 bcd outputs

	always @(posedge clk, posedge preset) begin
    	if (preset) begin // setting mode
        	bcd1 <= Q0[7:4]; // presetting mode
        	bcd0 <= Q0[3:0];
        	Cout <= 0;
    	end else if ((10 * bcd1 + bcd0) < (modN - 1)) begin // clock mode
        	if (bcd0 < 9) begin
            	bcd0 <= bcd0 + 1; // add 1 to bcd0 only
        	end else begin // bcd0 reset to 0, try adding 1 to bcd1
            	bcd0 <= 0;
            	bcd1 <= bcd1 + 1;
        	end

        	Cout <= 0;
    	end else begin
        	bcd0 <= 0;
        	bcd1 <= 0;
        	Cout <= 1;
    	end
	end
endmodule
