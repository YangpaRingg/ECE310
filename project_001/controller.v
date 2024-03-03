module controller (
    input rst_n, clk, capture,
    output valid
);

    wire [2:0] cs, ns;
    wire [2:0] cs_n;

    // dff for next state.
    dff #(.WIDTH(3)) state (
        .clk(clk),
        .rst_n(rst_n),
        .d(ns),
        .q(cs),
        .q_n(cs_n)
    );

    // Simplified SOP for next state and output valid bit.
    assign ns[2] = cs_n[2] & cs[1] & cs[0] & rst_n & capture;
    assign ns[1] = (cs_n[2] & cs_n[1] & cs[0] & rst_n & capture) |
        (cs_n[2] & cs[1] & cs_n[0] & rst_n) |
        (cs_n[2] & cs[1] & cs[0] & rst_n & ~capture);
    assign ns[0] = (cs_n[2] & cs_n[1] & cs_n[0] & rst_n & capture) |
        (cs_n[2] & cs_n[1] & cs[0] & rst_n & ~capture) |
        (cs_n[2] & cs[1] & cs_n[0] & rst_n & capture) |
        (cs_n[2] & cs[1] & cs[0] & rst_n & ~capture);
    assign valid = cs[2] & cs_n[1] & cs_n[0];

endmodule