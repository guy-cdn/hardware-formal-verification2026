analyze -sv09 mul.v
elaborate
reset rst
clock clk

# asm5 and asm6 conflict with each other; run with one at a time
assume -disable <embedded>::asm6

# First example: watch the engines factor (set a time limit!)
# prove -property cov5

# Second example: swap the active assumption, then check
# assume -disable <embedded>::asm5
# assume -enable <embedded>::asm6
# check_assumptions
