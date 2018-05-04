

module lab3part3 (SW, CLOCK_50, LEDR, HEX1, HEX0);
    input [1:0] SW; // SW[1] as enable input; SW[0] as async reset
    input CLOCK_50; // DE2 50MHz clock
    output [7:0] LEDR; // counter state in binary
    output [6:0] HEX1, HEX0; // counter state in hex

    wire clk1Hz;
    wire [7:0] Q;

    assign LEDR = Q;

    clock_div V0 (CLOCK_50, 25_000_000, clk1Hz);

    counter8new U0 (SW[1], SW[0], clk1Hz, Q);

    hex2seg7 H0 (Q[3:0], HEX0);
    hex2seg7 H1 (Q[7:4], HEX1);
endmodule
