`timescale 1ps/1ps
module tb_pico_processorBL;
  
  
reg clk;
reg reset_btn;
reg start_stop_btn;
reg int_req_btn;
reg port_ready_btn;

wire BL_debug_pico_int_ack;
wire BL_debug_branch_taken;
wire BL_debug_cc_c;
wire BL_debug_cc_z;
//wire [5:0]  BL_debug_opcode;
wire [11:0] BL_debug_program_counter;
wire [7:0]  BL_debug_pico_port_address;
wire [7:0]	BL_debug_pico_port_data;

wire [7:0]	SEG_A;
wire [3:0]	SEG_A_SEL;

wire [7:0]	SEG_B;
wire [3:0]	SEG_B_SEL;

picoProcessorBL tb_picoProcessorBL (.clk										(clk),
												.reset_btn								(reset_btn), 
												.start_stop_btn						(start_stop_btn), 
												.int_req_btn							(int_req_btn),
												.port_ready_btn						(port_ready_btn),
												.BL_debug_branch_taken				(BL_debug_branch_taken),
												.BL_debug_cc_c							(BL_debug_cc_c),
												.BL_debug_cc_z							(BL_debug_cc_z),
//												.BL_debug_opcode						(BL_debug_opcode),
												.BL_debug_program_counter			(BL_debug_program_counter),
												.BL_debug_pico_port_data			(BL_debug_pico_port_data),
												.BL_debug_pico_port_address		(BL_debug_pico_port_address),
												.BL_debug_pico_int_ack				(BL_debug_pico_int_ack),
												.SEG_A									(SEG_A),
												.SEG_A_SEL								(SEG_A_SEL),
												.SEG_B									(SEG_B),
												.SEG_B_SEL								(SEG_B_SEL));
												
initial 
  begin
	   clk = 1'b0;
      forever #25000 clk = ~clk;     // Generate clock
  end

initial
	begin
	
	reset_btn = 1;
	start_stop_btn = 1;
	port_ready_btn = 1;
	int_req_btn = 1;
	
	#200000 reset_btn = 0;
	#40000 reset_btn = 1;
	
//	#60000 start_stop_btn = 0;
//	
//	#20000 port_ready_btn = 1;
//	#60000 port_ready_btn = 0;
	#600000 int_req_btn = 0;
   #100000 int_req_btn = 1;
	
	#900000 int_req_btn = 0;
   #100000  int_req_btn = 1;
//	
	#600000 int_req_btn = 0;
   #100000  int_req_btn = 1;
	#700000 int_req_btn = 0;
   #50000  int_req_btn = 1;
	#600000 int_req_btn = 0;
   #100000  int_req_btn = 1;
	#700000 int_req_btn = 0;
   #50000  int_req_btn = 1;
	#600000 int_req_btn = 0;
   #100000  int_req_btn = 1;
	#700000 int_req_btn = 0;
   #50000  int_req_btn = 1;
	#600000 int_req_btn = 0;
   #100000  int_req_btn = 1;
	#700000 int_req_btn = 0;
   #50000  int_req_btn = 1;
	end
  
endmodule
