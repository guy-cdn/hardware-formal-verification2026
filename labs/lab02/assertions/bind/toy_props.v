module toy_props(input clk, input [2:0] state);

onehot0: assert property (@(posedge clk) $onehot0(state));

endmodule

// The 'clk' and 'state' are taken from the 'toy' module scope
bind toy toy_props props_i (.*);
