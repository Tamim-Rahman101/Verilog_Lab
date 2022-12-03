module jk_ff(q, qbar, j, k, clear, clock);
input j, k, clock, clear;
output q, qbar;
wire clockbar, a, b, y, ybar, c, d;

not(clockbar, clock);
nand(a, qbar, j, clock, clear);
nand(b, clock, k, q);
nand(y, a, ybar);
nand(ybar, y, clear, b);
nand(c, y, clockbar);
nand(d, clockbar, ybar);
nand(q, c, qbar);
nand(qbar, d, clear, q);

endmodule;

module syn_4bit_counter(q, j, k, clear, clock);
input [3:0]j;
input [3:0]k;
input clock, clear;
output [3:0]q;
wire [3:0]qbar;
wire and_k3, and_k2, and_k1, and_k0;

and(j[3], q[2], q[1], q[0]);
and(j[2], qbar[3], q[1], q[0]);
and(j[1], qbar[3], qbar[2], q[0]);
and(j[0], qbar[3], qbar[2], qbar[1]);

and(and_k3, qbar[1], q[0]);
and(and_k2, qbar[3], qbar[0]);
and(and_k1, q[3], qbar[2]);
and(and_k0, q[2], qbar[1]);

or(k[3], qbar[2], and_k3);
or(k[2], qbar[1], and_k2);
or(k[1], qbar[0], and_k1);
or(k[0], q[3], and_k0);

jk_ff jk0(q[0], qbar[0], j[0], k[0], clear, clock);
jk_ff jk1(q[1], qbar[1], j[1], k[1], clear, clock);
jk_ff jk2(q[2], qbar[2], j[2], k[2], clear, clock);
jk_ff jk3(q[3], qbar[3], j[3], k[3], clear, clock);

endmodule


