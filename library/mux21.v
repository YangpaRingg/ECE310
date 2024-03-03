module mux21 #( parameter WIDTH=4 ) (
  input [WIDTH-1:0] A, B,
  input sel,
  output [WIDTH-1:0] F
);

  assign F = sel ? B : A;

endmodule
