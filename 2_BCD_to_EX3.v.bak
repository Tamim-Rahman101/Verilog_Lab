module bcd_to_ex3(e, b);
input [3:0]b;
output [3:0]e;
wire or_b0_b1, and_or;

not(e[0], b[0]);

xnor(e[1], b[0], b[1]);

or(or_b0_b1, b[0], b[1]);
xor(e[2], b[2],or_b0_b1);

and(and_or, b[2], or_b0_b1);
or(e[3], b[3], and_or);
endmodule;