analyze -sv09 mul.v
# prevent blackboxing of the multiplier
elaborate -bbox_mul 1000
reset rst
clock clk

# asm5 and asm6 conflict with each other; run with one at a time
assume -disable mul.asm6

# First example: watch the engines factor (set a time limit!)
# prove -property mul.cov

# Second example: swap the active assumption, then check
# assume -disable mul.asm5
# assume -enable mul.asm6
# check_assumptions
