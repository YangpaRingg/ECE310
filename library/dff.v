module dff #( parameter WIDTH=4 ) (
  input clk, rst_n,
  input [WIDTH-1:0] d,
  output reg [WIDTH-1:0] q,
  output [WIDTH-1:0] q_n
);

  always @( posedge clk )
    if( !rst_n )
      q <= 0;
    else
      q <= d;

  assign q_n = ~q;

endmodule
