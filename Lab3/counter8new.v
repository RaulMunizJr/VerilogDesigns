

module counter8new (en, clear, clk, Q);
    input en, clear, clk;
    output reg [7:0] Q;
    
    always @(posedge clk or negedge clear) begin
   	 if (!clear)
   		 Q <= 0;
   	 else if (en) begin
   		 Q <= Q + 1;
   	 end
    end
endmodule
