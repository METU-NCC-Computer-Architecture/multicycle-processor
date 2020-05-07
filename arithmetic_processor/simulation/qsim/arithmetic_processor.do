onerror {quit -f}
vlib work
vlog -work work arithmetic_processor.vo
vlog -work work arithmetic_processor.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CPU_vlg_vec_tst
vcd file -direction arithmetic_processor.msim.vcd
vcd add -internal CPU_vlg_vec_tst/*
vcd add -internal CPU_vlg_vec_tst/i1/*
add wave /*
run -all
