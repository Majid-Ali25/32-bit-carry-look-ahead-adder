# Create library and compile files
vlib work
vlog carry_look_ahead_adder.sv
vlog carry_look_ahead_adder_tb.sv

# Start simulation
vsim carry_look_ahead_adder_tb

# Run simulation for 200ns
run 150ns
