module toy(clk, rst, en, state);

input clk, rst, en;
output reg[2:0] state;

always @(posedge clk) begin
  if (rst) begin
    state <= 3'b000;
  end else if (en) begin
    state[0] <= state == 3'b000;
    state[1] <= state[0];
    state[2] <= state[1];
  end
end

// Lab 2 quiz: for each assert -- valid, or a CEX?
// If a CEX exists, what is its min length?

a1: assert property (@(posedge clk) state[0] |=> !state[0]);

a2: assert property (@(posedge clk) state[1] |=> state[2]);

a3: assert property (@(posedge clk) en && state[1] |=> state[2]);

a4: assert property (@(posedge clk) en |=> !$stable(state));

endmodule
