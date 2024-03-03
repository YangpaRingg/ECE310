module fa (
  input a, b, cin,
  output cout, sum
);

  // gate level structural
  // wire cin_a, cin_b, a_b, cin_xor_a;

  // alternate dataflow
  // wire c_xor_a;

  // dataflow
  assign cout = (cin & a) | (cin & b) | (a & b);
  assign sum = cin ^ a ^ b;

  // gate level structural
  // and u1 ( cin_a, cin, a );
  // and u2 ( cin_b, cin, b );
  // and u3 ( a_b, a, b );
  // or u4 ( cout, cin_a, cin_b, a_b );

  // xor u5 ( cin_xor_a, cin, a );
  // xor u6 ( sum, cin_xor_a, b );

  // alternate dataflow
  // assign c_xor_a = cin ^ a;
  // assign sum = c_xor_a ^ b;
  // assign cout = (cin & a) | (b & c_xor_a);

endmodule
