// Lab 4: complexity of assumes.
// The multiplier is combinational: clk only gives the properties
// a sampling point, and rst exists for the course convention
// (formal analysis starts when rst is deasserted) -- there is no
// state to reset.

module mul(clk, rst, a, b, p);

input clk, rst;
input [15:0] a, b;
output [31:0] p;

assign p = a * b;

// asm5 leaves exactly TWO legal input pairs per cycle (out of
// 2^32): 4292870399 = 65519 * 65521, both 16-bit primes.
// (a == 1 is impossible: the cofactor doesn't fit in 16 bits.)
asm5: assume property (@(posedge clk) p == 32'd4292870399);

// The emptiest possible question: is there any legal cycle at
// all? Covering it requires factoring the constant.
cov5: cover property (@(posedge clk) 1'b1);

// asm6 is disabled in setup.tcl; the second example enables it
// (and disables asm5) from the Tcl shell.
// 4294836197 is prime, and it is <= 65535*65535 = 4294836225,
// so range reasoning cannot dismiss it: NO legal cycle exists.
// The assume is a conflict -- and check_assumptions must
// effectively prove primality to say so.
asm6: assume property (@(posedge clk) p == 32'd4294836197);

endmodule
