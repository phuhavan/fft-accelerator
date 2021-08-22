onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /fftTestBench/clk
add wave -noupdate -radix decimal /fftTestBench/n_rst
add wave -noupdate -radix decimal /fftTestBench/n_stall
add wave -noupdate -radix decimal /fftTestBench/n_stall_out
add wave -noupdate -radix decimal /fftTestBench/cur_cycle
add wave -noupdate -radix decimal /fftTestBench/dt_in0
add wave -noupdate -radix decimal /fftTestBench/dt_in1
add wave -noupdate -radix decimal /fftTestBench/dt_in2
add wave -noupdate -radix decimal /fftTestBench/dt_in3
add wave -noupdate -radix decimal /fftTestBench/dt_out0
add wave -noupdate -radix decimal /fftTestBench/dt_out1
add wave -noupdate -radix decimal /fftTestBench/dt_out2
add wave -noupdate -radix decimal -childformat {{{/fftTestBench/dt_out3[11]} -radix decimal} {{/fftTestBench/dt_out3[10]} -radix decimal} {{/fftTestBench/dt_out3[9]} -radix decimal} {{/fftTestBench/dt_out3[8]} -radix decimal} {{/fftTestBench/dt_out3[7]} -radix decimal} {{/fftTestBench/dt_out3[6]} -radix decimal} {{/fftTestBench/dt_out3[5]} -radix decimal} {{/fftTestBench/dt_out3[4]} -radix decimal} {{/fftTestBench/dt_out3[3]} -radix decimal} {{/fftTestBench/dt_out3[2]} -radix decimal} {{/fftTestBench/dt_out3[1]} -radix decimal} {{/fftTestBench/dt_out3[0]} -radix decimal}} -subitemconfig {{/fftTestBench/dt_out3[11]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[10]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[9]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[8]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[7]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[6]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[5]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[4]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[3]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[2]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[1]} {-height 17 -radix decimal} {/fftTestBench/dt_out3[0]} {-height 17 -radix decimal}} /fftTestBench/dt_out3
add wave -noupdate /fftTestBench/dut_fft/clk
add wave -noupdate /fftTestBench/dut_fft/n_rst
add wave -noupdate /fftTestBench/dut_fft/n_stall
add wave -noupdate /fftTestBench/dut_fft/inst_fifo/clk
add wave -noupdate /fftTestBench/dut_fft/inst_fifo/n_rst
add wave -noupdate /fftTestBench/dut_fft/inst_fifo/n_stall_in
add wave -noupdate /fftTestBench/dut_fft/inst_fifo/n_stall_out
add wave -noupdate /fftTestBench/dut_fft/inst_fifo/clk
add wave -noupdate /fftTestBench/dut_fft/inst_fifo/next
add wave -noupdate /fftTestBench/inst_vcClockGen/n_clk
add wave -noupdate /fftTestBench/inst_vcClockGen/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16500000 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 300
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
configure wave -timelineunits fs
update
WaveRestoreZoom {0 fs} {184511200 fs}
