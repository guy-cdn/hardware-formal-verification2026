// Lab 4: complexity of assumes.
// The multiplier is combinational: clk only gives the properties
// a sampling point, and rst exists for the course convention
// (formal analysis starts when rst is deasserted) -- there is no
// state to reset.

module mul(clk, rst, a, b, p);

input clk, rst;
input [63:0] a, b;
output [127:0] p;

assign p = a * b;

// asm5 leaves exactly TWO legal input pairs per cycle (out of
// 2^128): the constant is a product of two 64-bit primes,
//   18446744073709551557 * 18446744073709551533.
// (a == 1 is impossible: the cofactor doesn't fit in 64 bits.)
asm5: assume property (@(posedge clk)
        p == 128'd340282366920938460843936948965011886881);

// The emptiest possible question: is there any legal cycle at
// all? Covering it requires factoring the constant.
cov: cover property (@(posedge clk) 1'b1);

// asm6 is disabled in setup.tcl; the second example enables it
// (and disables asm5) from the Tcl shell.
// 340282366920938463426481119284349108199 is prime, and it is
// <= (2^64 - 1)^2, so range reasoning cannot dismiss it: NO
// legal cycle exists. The assume is a conflict -- and
// check_assumptions must effectively prove primality to say so.
asm6: assume property (@(posedge clk)
        p == 128'd340282366920938463426481119284349108199);

endmodule
