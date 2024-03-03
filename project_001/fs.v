module fs (
    input a, b, b_in,
    output out, b_out
);

    assign out = (a ^ b) ^ b_in;
    assign b_out = (~a & b) | ~(a ^ b) & b_in;

endmodule