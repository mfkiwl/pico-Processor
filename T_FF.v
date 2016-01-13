//
// Module: T_FF
// Author: Kiyoto
// 
// This code is used for "Clock Divider"
//
`resetall
`timescale 1ns/1ns
module T_FF ( T, Q );
	// Input/Output Signal
	input  wire T;
	output wire Q;
	// Internal Signal
	reg TMP;
	
	initial TMP <= 0;
	
	always @( posedge T )
		begin
			TMP <= ~TMP;
		end
	
	assign Q = TMP;
endmodule
