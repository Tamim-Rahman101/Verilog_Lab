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

module asy_mod10_counter(q, clock, clear);
input clock, clear;
output [3:0]q;
wire [3:0]qbar;

jk_ff ff0(q[0], qbar[0], 1, 1, clear, clock);
jk_ff ff1(q[1], qbar[1], 1, 1, clear, q[0]);
jk_ff ff2(q[2], qbar[2], 1, 1, clear, q[1]);
jk_ff ff3(q[3], qbar[3], 1, 1, clear, q[2]);
nand(clear, q[1], q[3]);

endmodule;

