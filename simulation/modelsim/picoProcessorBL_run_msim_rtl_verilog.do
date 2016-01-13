transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/altera/15.0/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/altera/15.0/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/altera/15.0/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/altera/15.0/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/altera/15.0/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {c:/altera/15.0/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/tri_state_buffer.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/time_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/T_FF.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/stack.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/program_counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/picoProcessor.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/mux5.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/mux3.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/mux2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/interrupt_pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/imem.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/gpr.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/extension.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/dynamic_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/dmem.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/display_module.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/condition_code.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/buffer.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/alushifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/picoProcessorBL.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/bcd.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/Clock_Divider5Mhz.v}

vlog -vlog01compat -work work +incdir+C:/Users/Jay/Desktop/picoProcessor\ Board\ Level {C:/Users/Jay/Desktop/picoProcessor Board Level/tb_pico_processorBL.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_pico_processorBL

add wave *
view structure
view signals
run -all
