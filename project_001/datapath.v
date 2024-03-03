module datapath (
    input rst_n, clk,
    input [3:0] d_in,
    input [1:0] op,
    input capture,
    output [4:0] result
);

    wire [3:0] A, B, C, D;
    wire [3:0] W1, W2, W3,
    W4, W5, W6,
    W7, W8, W9,
    W10, W11, W12;
    wire [4:0] AplusB, CplusD;
    
    // 4:1 mux for A
    mux41 U1 (d_in, A, A, A, op, W1);

    // Capture mux for A
    mux21 U2 (A, W1, capture, W2);

    // rst_n mux for A
    mux21 U3 (0, W2, rst_n, W3);

    // dff for A
    dff U13 (
        .clk(clk),
        .rst_n(rst_n),
        .d(W3),
        .q(A)
    );

    // 4:1 mux for B
    mux41 U4 (B, d_in, B, B, op, W4);

    // Capture mux for B
    mux21 U5 (B, W4, capture, W5);

    // rst_n mux for B
    mux21 U6 (0, W5, rst_n, W6);

    // dff for B
    dff U14 (
        .clk(clk),
        .rst_n(rst_n),
        .d(W6),
        .q(B)
    );

    // 4:1 mux for C
    mux41 U7 (C, C, d_in, C, op, W7);

    // Capture mux for C
    mux21 U8 (C, W7, capture, W8);

    // rst_n mux for C
    mux21 U9 (0, W8, rst_n, W9);

    // dff for C
    dff U15 (
        .clk(clk),
        .rst_n(rst_n),
        .d(W9),
        .q(C)
    );

    // 4:1 mux for B
    mux41 U10 (D, D, D, d_in, op, W10);

    // Capture mux for B
    mux21 U11 (D, W10, capture, W11);

    // rst_n mux for B
    mux21 U12 (0, W11, rst_n, W12);

    //dff for D
    dff U16 (
        .clk(clk),
        .rst_n(rst_n),
        .d(W12),
        .q(D)
    );

    // 4 bit adder for A + B
    fa4bit U17 (
        .a(A),
        .b(B),
        .cin(0),
        .result(AplusB)
    );

    // 4 bit adder for C + D
    fa4bit U18 (
        .a(C),
        .b(D),
        .cin(0),
        .result(CplusD)
    );

    fs5bit U19 (
        .a(AplusB),
        .b(CplusD),
        .b_in(0),
        .result(result)
    );

endmodule