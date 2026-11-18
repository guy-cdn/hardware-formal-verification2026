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

// The design pins a to 1, so asm_d can never be honored: no
// infinite trace survives -- the fairness assumes conflict.
asm_c: assume property (@(posedge clk) s_eventually (a));
asm_d: assume property (@(posedge clk) s_eventually (!a));

// Note: check_assumptions -conflict does not check the fairness
// constraints, so it will not find this conflict;
// check_assumptions -live does.

endmodule
