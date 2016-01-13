#************************************************************
# THIS IS A WIZARD-GENERATED FILE.                           
#
# Version 13.0.0 Build 156 04/24/2013 SJ Full Version
#
#************************************************************

# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.



# Clock constraints

create_clock -name "clk" -period 100ns [get_ports {pico_clk}]

# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Constrain the input I/O path

set_input_delay -clock clk -max 3 [all_inputs]

set_input_delay -clock clk -min 2 [all_inputs]

# Constrain the output I/O path

set_output_delay -clock clk -max 3 [all_outputs]

set_output_delay -clock clk -min 2 [all_outputs]

# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty

# tsu/th constraints

# tco constraints

# tpd constraints

