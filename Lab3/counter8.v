

module counter8 (en, clear, clk, Q);
    input en, clear, clk;
    output [7:0] Q;
    
    wire [7:0] T;

    tflipflop U0 (clear, T[0], clk, Q[0]);
    tflipflop U1 (clear, T[1], clk, Q[1]);
    tflipflop U2 (clear, T[2], clk, Q[2]);
    tflipflop U3 (clear, T[3], clk, Q[3]);
    tflipflop U4 (clear, T[4], clk, Q[4]);
    tflipflop U5 (clear, T[5], clk, Q[5]);
    tflipflop U6 (clear, T[6], clk, Q[6]);
    tflipflop U7 (clear, T[7], clk, Q[7]);

    assign T[0] = en;
    assign T[1] = T[0] && Q[0];
    assign T[2] = T[1] && Q[1];
    assign T[3] = T[2] && Q[2];
    assign T[4] = T[3] && Q[3];
    assign T[5] = T[4] && Q[4];
    assign T[6] = T[5] && Q[5];
    assign T[7] = T[6] && Q[6];
endmodule