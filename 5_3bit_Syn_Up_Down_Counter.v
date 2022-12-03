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

module syn_up_down_counter(q,clear, clock, mode);
input clear, clock, mode;
output [2:0]q;
wire [2:0]j;
wire [2:0]k;
wire [2:0]qbar;
wire modebar;
wire xnor_m_q0;
wire and_not_jk2, and_jk2, or_jk2;

not(modebar, mode);
xnor(xnor_m_q0, mode, q[0]);
and(and_not_jk2, modebar, qbar[1], qbar[0]);
and(and_jk2, mode, q[1], q[0]);
or(or_jk2, and_not_jk2, and_jk2);


jk_ff jk0(q[0], qbar[0], 1, 1, clear, clock);
jk_ff jk1(q[1], qbar[1], xnor_m_q0, xnor_m_q0, clear, clock);
jk_ff jk2(q[2], qbar[2], or_jk2, or_jk2, clear, clock);

endmodule;
