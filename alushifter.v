`timescale 1ps/1ps
module alushifter (reset, a, b, alu_carry_out, alu_zero_out, alu_carry_in, alu_fn, alu_result);
  
parameter d_width = 8;
parameter opcode_width = 4;

//input                      clk;
input                      reset;
input 			 [d_width-1:0]      a;
input 			 [d_width-1:0]      b;
input           [opcode_width-1:0] alu_fn;
input                              alu_carry_in;

output                             alu_carry_out;
output                             alu_zero_out;
output 	  		  [d_width-1:0]     alu_result;

reg                                alu_zero_out;
reg                                alu_carry_out;
reg  	  signed    [d_width-1:0]    alu_result;
reg                                sc;

always@(alu_fn or a or b or alu_carry_in)
begin

	 if(reset != 1'b1)
	 begin
		alu_carry_out = 1'b0;
		alu_zero_out  = 1'b0;
		alu_result    = 1'b0;
	 end
    
	 else
	 begin
    case(alu_fn)
      4'b0000 : begin
					 {alu_carry_out, alu_result} = a + b; //ADD
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
					 
      4'b0001 : begin
					 {alu_carry_out, alu_result} = (a + b) + alu_carry_in; //ADDC
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
					 
      4'b0010 : begin
					 {alu_carry_out, alu_result} = a - b; //SUB
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
					 
      4'b0011 : begin
					 {alu_carry_out, alu_result} = (a - b) - alu_carry_in; //SUBC
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
      //SUB and SUBC : Carry out value is borrow out and 
      //indicates that the operation overflowed to negative result
      
      4'b0100 : begin 
					 alu_result = a & b;
					 alu_carry_out = 1'b0;
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
					 
      4'b0101 : begin
					 alu_result = a | b;
					 alu_carry_out = 1'b0;
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
					 
      4'b0110 : begin
					 alu_result = a ^ b;
					 alu_carry_out = 1'b0;
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
					 
      4'b0111 : begin 
					 alu_result = ~(a & b);
					 alu_carry_out = 1'b0;
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
      //end of ALU Reg-Reg
      
      4'b1000 : begin 
					 {alu_carry_out,alu_result} = {a,a} << b[7:5];//Shift Left
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
					 
      4'b1001 : begin
					 {alu_carry_out,alu_result} = {a,a} >> b[7:5];//Shift Right
						if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
					 
      4'b1010 : begin
					 alu_result = ((a << b[7:5]) | (a >> (9-b[7:5])));//Rotate Left
					 alu_carry_out = a << b[7:5];
					 	if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end

      4'b1011 : begin 
					 alu_result = ((a >> b[7:5]) | (a << (9-b[7:5])));//Rotate Right
					 alu_carry_out = a >> b[7:5];
					 	if(alu_result == 0)
						begin
						alu_zero_out = 1'b1;
						end
    
						else
						begin
						alu_zero_out = 1'b0;
						end
					 end
					 
      default : begin
					 alu_carry_out = 1'b0;
					 alu_zero_out  = 1'b0;
					 alu_result    = 8'b00000000;
                end
    endcase
    
    $display("ALU RESULT: %b, %b, %b",alu_result,a , b);
    
end
end
endmodule
