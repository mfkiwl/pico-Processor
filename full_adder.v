`timescale 1ps/1ps
module full_adder(fa_data_a, fa_data_b, fa_result);
  
parameter d_width = 12;

input signed [d_width-1:0] fa_data_a;
input signed [d_width-1:0] fa_data_b;

output signed [d_width-1:0] fa_result;


assign fa_result    = fa_data_a + fa_data_b;

endmodule


