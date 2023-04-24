onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_pipelined_tb/ALU_result_out
add wave -noupdate /MIPS_pipelined_tb/Branch_out
add wave -noupdate /MIPS_pipelined_tb/FA
add wave -noupdate /MIPS_pipelined_tb/FB
add wave -noupdate /MIPS_pipelined_tb/Instruction_out
add wave -noupdate /MIPS_pipelined_tb/MemWrite_out
add wave -noupdate /MIPS_pipelined_tb/PC
add wave -noupdate /MIPS_pipelined_tb/RegWrite_out
add wave -noupdate /MIPS_pipelined_tb/Zero_out
add wave -noupdate /MIPS_pipelined_tb/aclk
add wave -noupdate /MIPS_pipelined_tb/cycle_cnt
add wave -noupdate /MIPS_pipelined_tb/i
add wave -noupdate /MIPS_pipelined_tb/read_data_1_out
add wave -noupdate /MIPS_pipelined_tb/read_data_2_out
add wave -noupdate /MIPS_pipelined_tb/reset
add wave -noupdate /MIPS_pipelined_tb/stall_out
add wave -noupdate /MIPS_pipelined_tb/write_data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {54968 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {57750 ps}
