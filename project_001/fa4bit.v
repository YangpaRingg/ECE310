module fa4bit (
    input [3:0] a, b,
    input cin,
    output [4:0] result
);

    wire cout1, cout2, cout3;

    fa U1 (a[0], b[0], cin, cout1, result[0]);
    fa U2 (a[1], b[1], cout1, cout2, result[1]);
    fa U3 (a[2], b[2], cout2, cout3, result[2]);
    fa U4 (a[3], b[3], cout3, result[4], result[3]);

endmodule