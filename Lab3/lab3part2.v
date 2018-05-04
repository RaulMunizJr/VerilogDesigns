

module lab3part2 (SW, KEY, LEDR, HEX1, HEX0);
    input [1:0] SW; // SW[1] as enable input; SW[0] as async reset
    input [0:0] KEY; // clock
    output [7:0] LEDR; // counter state in binary
    output [6:0] HEX1, HEX0; // counter state in hex

    wire [7:0] Q;

    assign LEDR = Q;

    counter8new U0 (SW[1], SW[0], KEY, Q);

    hex2seg7 H0 (Q[3:0], HEX0);
    hex2seg7 H1 (Q[7:4], HEX1);
endmodule
