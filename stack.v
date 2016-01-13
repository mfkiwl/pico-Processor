`timescale 1ps/1ps
module stack(clk, 
             reset, 
             stack_push_pop, 
             stack_data_in, 
             stack_data_out, 
             stack_en);

parameter d_width  = 12; //data width
parameter s_width  = 4; //stack width
parameter sp_width = 3;//stack pointer width

input                 clk;
input                 reset;
input                 stack_push_pop; //push==1, pop==0
input                 stack_en;// enable==1, disable == 0

input  [d_width-1:0]  stack_data_in;

output [d_width-1:0]  stack_data_out;

reg    [sp_width-1:0] stack_pointer;
reg    [d_width-1:0]  stack_memory  [s_width-1:0];
reg   [d_width-1:0]  stack_data_out;

always@(stack_data_out or stack_pointer)
begin
  if(stack_pointer < 3'b101)
  begin
    stack_data_out = stack_memory[stack_pointer-1]; // 
  end
  
  else
		stack_data_out = 0;
end

always@(posedge clk or negedge reset) 
begin 
      if(reset!=1)
      begin
        stack_pointer   <= 2'b00;
        stack_memory[0] <= 4'b0000;
        stack_memory[1] <= 4'b0000;
        stack_memory[2] <= 4'b0000;
        stack_memory[3] <= 4'b0000;
      end
      
      else if(stack_en == 1'b1)
      begin
        if(stack_push_pop == 0)//PUSH
        begin
          stack_memory[stack_pointer] <= stack_data_in; 
          stack_pointer <= stack_pointer + 2'b01;      
        end
            
        else if(stack_push_pop == 1)//POP
        begin
          stack_pointer <= stack_pointer - 2'b01;
        end
        
      end 
end

endmodule


