

module tflipflop (resetn, t, clk, q);
    input resetn, t, clk;
    output reg q;

    always @(posedge clk or negedge resetn) begin
   	 if (~resetn)
   		 q <= 0;
   	 else
   		 q <= t ? ~q : q;
    end
endmodule