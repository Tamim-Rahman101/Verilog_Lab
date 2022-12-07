module ex3_to_bcd(B, E);
input [3:0]E;
output [3:0]B;

//nd 0, 1, 2 for B2
//nd 3, 4 for B3
wire [4:0]nd;
wire ntE0, ntE1, ntE2;

//B0
not(B[0], E[0]);

//B1
xor(B[1], E[0], E[1]);

//B2
not(ntE0, E[0]);
not(ntE1, E[1]);
not(ntE2, E[2]);

and(nd[0], ntE0, E[1], E[3]);
and(nd[1], E[0], E[1], E[2]);
and(nd[2], ntE1, ntE2);
or(B[2], nd[0], nd[1], nd[2]);

//B3
and(nd[3], E[0], E[1], E[3]);
and(nd[4], E[2], E[3]);
or(B[3], nd[3], nd[4]);

endmodule;


