`timescale 1ps/1ps
module extension(ext_data_in, ext_data_out);

parameter d_width = 12;

input signed  [d_width-5:0] ext_data_in;//8bit

output signed [d_width-1:0] ext_data_out;

wire  signed  [d_width-1:0] ext_data_out;

assign ext_data_out = ext_data_in;//[7:0] extend to [12:0]
endmodule