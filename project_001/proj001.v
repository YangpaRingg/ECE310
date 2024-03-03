module proj001 (
    input rst_n, clk, 
    input [3:0] d_in, 
    input [1:0] op, 
    input capture,
    output [4:0] result, 
    output valid
);

datapath datapath (
    .rst_n(rst_n),
    .clk(clk),
    .d_in(d_in),
    .op(op),
    .capture(capture),
    .result(result)
);

controller controller (
    .rst_n(rst_n),
    .clk(clk),
    .capture(capture),
    .valid(valid)
);

endmodule