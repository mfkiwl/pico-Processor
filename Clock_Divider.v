//
// Module: Clock_Divider
// Author: Kiyoto
//
`resetall
`timescale 1ps/1ps
module Clock_Divider ( IN_CLK, OUT_CLK );
	// Input/Output Signal
	input  wire IN_CLK;
	output wire OUT_CLK;
	// Internal Signal
	wire Q_00, Q_01, Q_02, Q_03, Q_04, Q_05, Q_06, Q_07, Q_08, Q_09;
	wire Q_10, Q_11, Q_12, Q_13, Q_14, Q_15, Q_16, Q_17, Q_18, Q_19;
	wire Q_20, Q_21;
	
	// T-FF Chain
	// 10 MHz * 2^(-20) = 10 Hz
	T_FF T_FF_00 ( .T( IN_CLK ), .Q( Q_00 ) );
	T_FF T_FF_01 ( .T( Q_00 ),   .Q( Q_01 ) );
	T_FF T_FF_02 ( .T( Q_01 ),   .Q( Q_02 ) );
	T_FF T_FF_03 ( .T( Q_02 ),   .Q( Q_03 ) );
	T_FF T_FF_04 ( .T( Q_03 ),   .Q( Q_04 ) );
	T_FF T_FF_05 ( .T( Q_04 ),   .Q( Q_05 ) );
	T_FF T_FF_06 ( .T( Q_05 ),   .Q( Q_06 ) );
	T_FF T_FF_07 ( .T( Q_06 ),   .Q( Q_07 ) );
	T_FF T_FF_08 ( .T( Q_07 ),   .Q( Q_08 ) );
	T_FF T_FF_09 ( .T( Q_08 ),   .Q( Q_09 ) );
	T_FF T_FF_10 ( .T( Q_09 ),   .Q( Q_10 ) );
	T_FF T_FF_11 ( .T( Q_10 ),   .Q( Q_11 ) );
	T_FF T_FF_12 ( .T( Q_11 ),   .Q( Q_12 ) );
	T_FF T_FF_13 ( .T( Q_12 ),   .Q( Q_13 ) );
	T_FF T_FF_14 ( .T( Q_13 ),   .Q( Q_14 ) );
	T_FF T_FF_15 ( .T( Q_14 ),   .Q( Q_15 ) );
	T_FF T_FF_16 ( .T( Q_15 ),   .Q( Q_16 ) );
	T_FF T_FF_17 ( .T( Q_16 ),   .Q( Q_17 ) );
	T_FF T_FF_18 ( .T( Q_17 ),   .Q( Q_18 ) );
	T_FF T_FF_19 ( .T( Q_18 ),   .Q( Q_19 ) );
	T_FF T_FF_20 ( .T( Q_19 ),   .Q( Q_20 ) );
	T_FF T_FF_21 ( .T( Q_20 ),   .Q( Q_21 ) );
	T_FF T_FF_22 ( .T( Q_21 ),   .Q( OUT_CLK ) );
endmodule
