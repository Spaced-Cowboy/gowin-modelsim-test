transcript on

#
# New libraries
#
if {[file exists work]} {
	vdel -lib work -all
}
vlib work

#
# Compile the testbench and its dependencies
#
vmap work work
vlog -work work "prim_sim.v"
vlog -work work {top.v}
vlog -work work {top_tb.v}
vlog -work work {gowin_rpll/gowin_rpll.v}


#
# Start simulation
#
vsim -t 1ps -L work -voptargs="+acc"  work.top_tb

#
# Look at everything
#
log -r /*


#
#Jump to run.do
#
# This line shows only the varible name instead of the full path and which module it was in
config wave -signalnamewidth 1


## part 5: show ui 
view wave
view signals

## part 6: run 
run -all

