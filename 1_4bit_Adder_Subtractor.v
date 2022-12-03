module full_adder(s, cout, a, b, cin);
input a, b, cin;
output s, cout;
wire and_a_b, and_cin_a, and_cin_b;

xor(s, a, b, cin);
and(and_a_b, a, b);
and(and_cin_a, a, cin);
and(and_cin_b, b, cin);
or(cout, and_a_b, and_cin_a, and_cin_b);
endmodule;

module adder_subtractor(s, cout, a, b, m);
input [3:0]a;
input [3:0]b;
input m;
output [3:0]s;
output cout;

wire xorb0, xorb1, xorb2, xorb3;
xor(xorb0, b[0], m);
xor(xorb1, b[1], m);
xor(xorb2, b[2], m);
xor(xorb3, b[3], m);

wire cout1, cout2, cout3;
full_adder fa0(s[0], cout1, a[0], xorb0, m);
full_adder fa1(s[1], cout2, a[1], xorb1, cout1);
full_adder fa2(s[2], cout3, a[2], xorb2, cout2);
full_adder fa3(s[3], cout, a[3], xorb3, cout3);
endmodule; 

