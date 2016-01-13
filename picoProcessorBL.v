`timescale 1ps/1ps
module picoProcessorBL(clk,
							  reset_btn, 
							  start_stop_btn, 
							  int_req_btn,
							  port_ready_btn,
							  BL_debug_branch_taken,
							  BL_debug_cc_c,
							  BL_debug_cc_z,
//							  BL_debug_opcode,
							  BL_debug_program_counter,
							  BL_debug_pico_port_data,
							  BL_debug_pico_port_address,
							  BL_debug_pico_int_ack,
							  SEG_A,
							  SEG_A_SEL,
							  SEG_B,
							  SEG_B_SEL);

input clk;
input reset_btn;
input start_stop_btn;
input int_req_btn;
input port_ready_btn;

output wire BL_debug_pico_int_ack;
output wire BL_debug_branch_taken;
output wire BL_debug_cc_c;
output wire BL_debug_cc_z;
//output wire [5:0]  BL_debug_opcode;
output wire [11:0] BL_debug_program_counter;
output wire [7:0]  BL_debug_pico_port_address;
inout wire [7:0]	 BL_debug_pico_port_data;
output wire [7:0]	 SEG_A;
output wire [3:0]	 SEG_A_SEL;
output wire [7:0]	 SEG_B;
output wire [3:0]	 SEG_B_SEL;

wire [3:0]	 bcd_hundred_pico_program_counter;
wire [3:0]	 bcd_tens_pico_program_counter;
wire [3:0]	 bcd_digits_pico_program_counter;

wire [3:0]	 bcd_hundred_pico_port_data;
wire [3:0]	 bcd_tens_pico_port_data;
wire [3:0]	 bcd_digits_pico_port_data;

wire [3:0]	 bcd_hundred_pico_port_address;
wire [3:0]	 bcd_tens_pico_port_address;
wire [3:0]	 bcd_digits_pico_port_address;

wire start_stop_btn_in;
wire start_stop_btn_out;

wire int_req_btn_out;

wire clk_out;
wire clk_dv_10Mhz_out;
wire clk_dv_5Mhz_out;
wire tri_clk_dv_5Mhz_out;


wire [7:0]   			 					pico_port_address;
wire 											pico_port_read;
wire 											pico_port_write;
wire [7:0]									pico_port_data;
wire 											pico_port_ready;
wire 											debug_branch_taken;
wire 											debug_cc_c;
wire 											debug_cc_z;
//wire [5:0]						 	 		debug_opcode;
wire [11:0]							 		debug_program_counter;
wire											debug_pico_int_ack;
wire [7:0] 									SEG_A_A_VAL_OUT, SEG_A_B_VAL_OUT, SEG_A_C_VAL_OUT, SEG_A_D_VAL_OUT;
wire [7:0] 									SEG_B_A_VAL_OUT, SEG_B_B_VAL_OUT, SEG_B_C_VAL_OUT, SEG_B_D_VAL_OUT;

picoProcessor ppBL  (.pico_clk								(clk),
							.pico_reset								(reset_btn),
							.pico_port_ready						(port_ready_btn), 
							.pico_int_req							(~int_req_btn), 
							.pico_port_address					(BL_debug_pico_port_address), 
							.pico_port_read						(pico_port_read), 
							.pico_port_write						(pico_port_write), 
							.pico_int_ack							(BL_debug_pico_int_ack), 
							.pico_port_data						(BL_debug_pico_port_data),
							.debug_program_counter				(BL_debug_program_counter),
//							.debug_opcode							(BL_debug_opcode),
							.debug_cc_z								(BL_debug_cc_c),
							.debug_cc_c								(BL_debug_cc_z),
							.debug_branch_taken					(BL_debug_branch_taken));

//Clock_Divider10Mhz CD_10Mhz					(.IN_CLK(clk), 
//														 .OUT_CLK(clk_dv_10Mhz_out));

Clock_Divider5Mhz  CD_5Mhz						(.IN_CLK(clk), 
														 .OUT_CLK(clk_dv_5Mhz_out));					
					
//Chattering LPF_pico_start_stop	(.CLK(clk),
//											 .RST(reset_btn),
//											 .IN_BTN(start_stop_btn),
//											 .OUT_BTN(start_stop_btn_out));
//					
//Chattering LPF_pico_int_req		(.CLK(clk),
//											 .RST(reset_btn),
//											 .IN_BTN(int_req_btn),
//											 .OUT_BTN(int_req_btn_out));
//
//tri_state_buffer#(1) 	clock_enable	(.tri_s_data_out(tri_clk_dv_5Mhz_out), 
//													 .tri_s_data_in(clk_dv_5Mhz_out), 
//													 .tri_s_enable(start_stop_btn));					 

bcd program_counter_bcd					(.ibin(BL_debug_program_counter),
												 .bcd_hundred(bcd_hundred_pico_program_counter),//
												 .bcd_tens(bcd_tens_pico_program_counter),
												 .bcd_digits(bcd_digits_pico_program_counter));											 

bcd port_data_bcd							(.ibin(BL_debug_pico_port_data),
												 .bcd_hundred(bcd_hundred_pico_port_data),//
												 .bcd_tens(bcd_tens_pico_port_data),
												 .bcd_digits(bcd_digits_pico_port_data));

bcd port_address_bcd						(.ibin(BL_debug_pico_port_address),
												 .bcd_hundred(bcd_hundred_pico_port_address),//
												 .bcd_tens(bcd_tens_pico_port_address),
												 .bcd_digits(bcd_digits_pico_port_address));

time_display td_A							(.CLK(clk),
												 .RSTN(reset_btn),
												 .SEG_A_VAL(bcd_tens_pico_program_counter),
												 .SEG_B_VAL(bcd_digits_pico_program_counter),	
												 .SEG_C_VAL(bcd_hundred_pico_port_address),
												 .SEG_D_VAL(bcd_tens_pico_port_address),				
												 .SEG_A(SEG_A_A_VAL_OUT),
												 .SEG_B(SEG_A_B_VAL_OUT),
												 .SEG_C(SEG_A_C_VAL_OUT),
												 .SEG_D(SEG_A_D_VAL_OUT));

dynamic_display dynamic_disp_A		(.CLK(clk),
												 .RSTN(reset_btn),
												 .SEG_A_0(SEG_A_A_VAL_OUT),
												 .SEG_B_0(SEG_A_B_VAL_OUT),
												 .SEG_C_0(SEG_A_C_VAL_OUT),
												 .SEG_D_0(SEG_A_D_VAL_OUT),
												 .SEG_A(SEG_A),
												 .SEG_SEL(SEG_A_SEL));

time_display td_B							(.CLK(clk),
												 .RSTN(reset_btn),
												 .SEG_A_VAL(bcd_digits_pico_port_address),
												 .SEG_B_VAL(bcd_hundred_pico_port_data),	
												 .SEG_C_VAL(bcd_tens_pico_port_data),
												 .SEG_D_VAL(bcd_digits_pico_port_data),		
												 .SEG_A(SEG_B_A_VAL_OUT),
												 .SEG_B(SEG_B_B_VAL_OUT),
												 .SEG_C(SEG_B_C_VAL_OUT),
												 .SEG_D(SEG_B_D_VAL_OUT));

dynamic_display dynamic_disp_B		(.CLK(clk),
												 .RSTN(reset_btn),
												 .SEG_A_0(SEG_B_A_VAL_OUT),
												 .SEG_B_0(SEG_B_B_VAL_OUT),
												 .SEG_C_0(SEG_B_C_VAL_OUT),
												 .SEG_D_0(SEG_B_D_VAL_OUT),
												 .SEG_A(SEG_B),
												 .SEG_SEL(SEG_B_SEL));										 
endmodule
