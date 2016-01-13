//
// Module:  ChatterIN_BTNg
// Author:  Kiyoto
//
`resetall
`timescale 1ps/1ps
module Chattering(CLK,RST,IN_BTN,OUT_BTN);

input CLK,RST;
input IN_BTN;
output OUT_BTN;
reg OUT_BTN,buffer;
reg [15:0] count;

always @(posedge CLK or negedge RST)
	if(!RST) count <= 16'b0;
	else count <= count + 16'b1;

always @(posedge CLK)
	if(count==16'b0)
	begin
		buffer <= IN_BTN;
		OUT_BTN <= buffer;
	end

endmodule

