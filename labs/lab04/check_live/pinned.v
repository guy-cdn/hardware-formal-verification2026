module pinned(clk, rst, a);

input clk, rst;
output reg a;

always @(posedge clk) begin
  if (rst) begin
    a <= 1'b1;
  end else begin
    a <= 1'b1;   // the design pins a to 1
  end
end

// Each assume is satisfiable on its own, and for a signal that can
// toggle the two would coexist (a = 0,1,0,1,... satisfies both).
// Here the design pins a to 1, so asm_d can never be honored: no
// infinite trace survives -- the fairness assumes conflict.
asm_c: assume property (@(posedge clk) s_eventually (a));
asm_d: assume property (@(posedge clk) s_eventually (!a));

// Note: a fairness assume never fails on a FINITE trace, so there
// is no dead end for the -conflict check to find; this conflict
// lives only at infinity. check_assumptions -live detects it.

endmodule
