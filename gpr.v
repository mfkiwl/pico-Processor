`timescale 1ps/1ps
module gpr (clk, reset, gpr_address_r1, gpr_address_r2, gpr_address_rd, gpr1, 
             gpr2, gpr_write_back, gpr_write_enable);

parameter d_width  = 8;
parameter d_addr_width = 3;
parameter reg_deep = 8;
parameter op_width = 5;

input                  clk;
input						           reset;
input                  gpr_write_enable;
input   [d_addr_width-1:0]  gpr_address_r1;
input   [d_addr_width-1:0]  gpr_address_r2;
input   [d_addr_width-1:0]  gpr_address_rd;
input   [d_width-1:0]  gpr_write_back;

output  [d_width-1:0]  gpr1;
output  [d_width-1:0]  gpr2;

reg     [d_width-1:0]  register_table[reg_deep-1:0];
wire 	  [d_width-1:0]  gpr1;
wire	  [d_width-1:0]  gpr2;


//Synchonus
always@(posedge clk or negedge reset)
begin
  
    if(reset != 1)
  begin
    register_table[0] = 0;
    register_table[1] = 0;
    register_table[2] = 0;
    register_table[3] = 0;
    register_table[4] = 0;
    register_table[5] = 0;
    register_table[6] = 0;
    register_table[7] = 0;
  end
  
  else if(gpr_write_enable == 1)// Write Mode
  begin
    if(gpr_address_rd !=0)
    begin
		register_table[gpr_address_rd] <= gpr_write_back;
    end
  end
end

assign gpr1 = register_table[gpr_address_r1];
assign gpr2 = register_table[gpr_address_r2];



endmodule


