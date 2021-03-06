`timescale 1ps/1ps
module mux2(mux2_data0, 
	          mux2_data1,
	          mux2_sel, 
	          mux2_result);

parameter d_width = 12;
parameter sel_width = 1; //sel_width/2

	input         [d_width-1:0]  	mux2_data0, mux2_data1;
	input         [sel_width-1:0]	mux2_sel;
	output        [d_width-1:0]	 	mux2_result;

	wire           [d_width-1:0]   mux2_result;

assign mux2_result = (mux2_sel == 1'b0)? mux2_data0 : mux2_data1;
	
//always@(mux2_data0, mux2_data1, mux2_sel)
//	begin
//		case(mux2_sel)
//
//		1'b0 : mux2_result = mux2_data0;
//		1'b1 : mux2_result = mux2_data1;
//
//		default mux2_result = 12'b000000000000;
//		endcase
//	end

endmodule

