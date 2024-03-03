module fs5bit (
    input [4:0] a, b,
    input b_in,
    output [4:0] result
);

    wire b_out1, b_out2, b_out3, b_out4, b_out5;

    fs U1 (a[0], b[0], b_in, result[0], b_out1);
    fs U2 (a[1], b[1], b_out1, result[1], b_out2);
    fs U3 (a[2], b[2], b_out2, result[2], b_out3);
    fs U4 (a[3], b[3], b_out3, result[3], b_out4);
    fs U5 (a[4], b[4], b_out4, result[4], b_out5);

endmodule