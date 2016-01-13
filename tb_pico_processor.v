`timescale 1ps/1ps
module tb_pico_processor;
  
parameter d_width = 8; 


reg 					          pico_clk;
reg 					          pico_reset;
reg 					          pico_port_ready;
reg 					          pico_int_req;

wire	 [d_width-1:0] pico_port_data;					//bidirection
wire [d_width-1:0]  pico_port_address;
wire 					          pico_port_read;
wire 					          pico_port_write;
wire 					          pico_int_ack;
wire [11:0] 					 debug_program_counter;
wire [5:0]						 debug_opcode;
wire 								 debug_cc_c;
wire								 debug_cc_z;
wire								 debug_branch_taken;

picoProcessor tb_pico_processor(.pico_clk(pico_clk), 
                               .pico_reset(pico_reset),
                               .pico_port_ready(pico_port_ready), 
                               .pico_int_req(pico_int_req), 
                               .pico_port_address(pico_port_address), 
                               .pico_port_read(pico_port_read), 
                               .pico_port_write(pico_port_write), 
                               .pico_int_ack(pico_int_ack), 
                               .pico_port_data(pico_port_data),
										 .debug_program_counter(debug_program_counter),
										 .debug_opcode(debug_opcode),
										 .debug_cc_z(debug_cc_z),
										 .debug_cc_c(debug_cc_c),
										 .debug_branch_taken(debug_branch_taken));
  
  initial 
    begin
	      pico_clk = 1'b0;
        forever #25000 pico_clk = ~pico_clk;     // Generate clock
    end

initial begin

  pico_int_req     = 0;
  #4000 pico_reset = 0;
  #4000 pico_reset = 1;
  #2000 pico_port_ready = 1;
  
  #2000 pico_port_ready = 0;
  
  #400000 pico_int_req = 1;
  #120000 pico_int_req = 0;

    #400000 pico_int_req = 1;
  #120000 pico_int_req = 0;
end

endmodule