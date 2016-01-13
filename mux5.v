`timescale 1ps/1ps
module mux5(mux5_data0, 
	          mux5_data1,
	          mux5_data2,
	          mux5_data3,
	          mux5_data4,
	          mux5_sel, 
	          mux5_result);

parameter d_width = 12;
parameter sel_width = 3; //sel_width/2

	input  [12-1:0]        mux5_data0, 
	                       mux5_data1, 
	                       mux5_data2, 
	                       mux5_data3, 
	                       mux5_data4;
	                       
	input  [2:0]	mux5_sel;
	output	[12-1:0]	 	mux5_result;

	wire    [12-1:0]   mux5_result;

function [11:0] mux5_out;
	input  [12-1:0]        mux5_data0, 
	                       mux5_data1, 
	                       mux5_data2, 
	                       mux5_data3, 
	                       mux5_data4;
	input [2:0]				  mux5_sel;
	case(mux5_sel)

		3'b000 : mux5_out = mux5_data0;
		3'b001 : mux5_out = mux5_data1;
		3'b010 : mux5_out = mux5_data2;
  		3'b011 : mux5_out = mux5_data3;
		3'b100 : mux5_out = mux5_data4;

		default mux5_out = 12'b000000000000;
	endcase							  
	
endfunction

assign mux5_result = mux5_out(mux5_data0, mux5_data1, mux5_data2, mux5_data3, mux5_data4, mux5_sel);
//always@(mux5_data0, mux5_data1, mux5_data2, mux5_data3, mux5_data4, mux5_sel)
//	begin
//		case(mux5_sel)
//
//		3'b000 : mux5_result = mux5_data0;
//		3'b001 : mux5_result = mux5_data1;
//		3'b010 : mux5_result = mux5_data2;
//  		3'b011 : mux5_result = mux5_data3;
//		3'b100 : mux5_result = mux5_data4;
//
//		default mux5_result = 12'b000000000000;
//		endcase
//	end

endmodule



