module counter(clk, rst, count);

input clk, rst;
output reg[31:0] count;

always @(posedge clk) begin
  if (rst) begin
    count <= 32'd1;
  end else begin
    count <= count + 32'd1;
  end
end

// count equals k at cycle k, so asm3 leaves no trace longer than
// 16 cycles -- a conflict.
asm3: assume property (@(posedge clk) count < 32'd17);

// Unreachable: cycle 42 lies beyond the conflict at cycle 17.
cov3: cover property (@(posedge clk) count == 32'd42);

endmodule
