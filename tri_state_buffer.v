`timescale 1ps/1ps
module tri_state_buffer (tri_s_data_out, tri_s_data_in, tri_s_enable);

parameter d_width = 8;

output [d_width-1:0] tri_s_data_out;
input  [d_width-1:0] tri_s_data_in;
input  tri_s_enable;

assign tri_s_data_out = tri_s_enable ? 1'bz : tri_s_data_in;


endmodule
