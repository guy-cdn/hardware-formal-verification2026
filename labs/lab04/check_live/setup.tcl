analyze -sv09 pinned.v
elaborate
reset rst
clock clk

check_assumptions -live
