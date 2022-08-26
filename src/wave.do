onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/clk
add wave -noupdate /top_tb/dut/rst
add wave -noupdate /top_tb/led
add wave -noupdate -divider DDR
add wave -noupdate /top_tb/dut/clk_ddrMain
add wave -noupdate /top_tb/dut/clk_ddrRead
add wave -noupdate /top_tb/dut/clk_ddrWrite
add wave -noupdate /top_tb/dut/clk_ddrClient
add wave -noupdate /top_tb/dut/clk_ddrMgmt
add wave -noupdate /top_tb/dut/ddr_clocks_locked
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {31500000 ps} 0}
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
WaveRestoreZoom {31484972 ps} {31601303 ps}
