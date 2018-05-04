

module hex2seg7 (bin, seg7);
    input [3:0] bin;
    output reg [6:0] seg7;

    always @ (*) begin
   	 case (bin)
   		 4'b0000 : seg7 = 7'b1000000; // 0
   		 4'b0001 : seg7 = 7'b1111001; // 1
   		 4'b0010 : seg7 = 7'b0100100; // 2
   		 4'b0011 : seg7 = 7'b0110000; // 3
   		 4'b0100 : seg7 = 7'b0011001; // 4
   		 4'b0101 : seg7 = 7'b0010010; // 5
   		 4'b0110 : seg7 = 7'b0000010; // 6
   		 4'b0111 : seg7 = 7'b1111000; // 7
   		 4'b1000 : seg7 = 7'b0000000; // 8
   		 4'b1001 : seg7 = 7'b0010000; // 9
   		 4'b1010 : seg7 = 7'b0001000; // A
   		 4'b1011 : seg7 = 7'b0000011; // B
   		 4'b1100 : seg7 = 7'b1000110; // C
   		 4'b1101 : seg7 = 7'b0100001; // D
   		 4'b1110 : seg7 = 7'b0000110; // E
   		 4'b1111 : seg7 = 7'b0001110; // F
   		 default : seg7 = 7'b1111111; // blank
   	 endcase
    end
endmodule
