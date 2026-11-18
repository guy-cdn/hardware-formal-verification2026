analyze -sv09 toy.v
elaborate
reset rst
clock clk

# ast has a CEX (min length 2: req high twice, sig changing);
# use the CEX trace as the starting point for the WaveEdit demo
prove -all
