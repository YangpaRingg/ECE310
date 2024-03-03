module mux41 #(parameter WIDTH=4) (
    input [WIDTH-1:0] A, B, C, D,
    input [1:0] sel,
    output [WIDTH-1:0] out
);

    assign out = sel[1] ? (sel[0] ? D : C) : (sel[0] ? B : A);

endmodule