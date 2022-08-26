onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/dut/clk
add wave -noupdate /top_tb/dut/rst
add wave -noupdate /top_tb/dut/pllClk
add wave -noupdate /top_tb/led
add wave -noupdate -divider {Gowin PLL}
add wave -noupdate /top_tb/dut/pll/rpll_inst/CLKIN
add wave -noupdate /top_tb/dut/pll/rpll_inst/RESET
add wave -noupdate /top_tb/dut/pll/rpll_inst/RESET_P
add wave -noupdate /top_tb/dut/pll/rpll_inst/resetn
add wave -noupdate /top_tb/dut/pll/rpll_inst/clk_effect
add wave -noupdate /top_tb/dut/pll/rpll_inst/clkin_period
add wave -noupdate -divider output-clock
add wave -noupdate /top_tb/dut/pll/rpll_inst/clkfb_reg
add wave -noupdate /top_tb/dut/pll/rpll_inst/oclk_effect
add wave -noupdate /top_tb/dut/pll/rpll_inst/cnt_lock
add wave -noupdate /top_tb/dut/pll/rpll_inst/max_tlock
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {58982 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {58960 ns} {59028 ns}
