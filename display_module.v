/*------------------------------------------------------------------------------
--      File Name = display_module.v                                          --
--                                                                            --
--      Design    = 7SEG Display Module                                       --
--                                                                            --
--      Revision  = 1.0         Date: 2012.05.19                              --
------------------------------------------------------------------------------*/
`timescale 1ns/1ns
module display_module(
  	// input
	CLK,
	RSTN,
	SEG_VAL,

  	// output
  	SEG
);

//----- input --------------------------------------------
input  	CLK;			// System Clock
input  	RSTN;			// System Reset
input  	[3:0] SEG_VAL;	// Display Value

//----- output -------------------------------------------
output 	[7:0] SEG;		// Display 7SEG

//----- reg ----------------------------------------------
reg    	[7:0] SEG;		// Display 7SEG Register

//------------------
//  7SEG DISPLAY
//------------------
	always@( posedge CLK or negedge RSTN ) begin
	  	if( !RSTN )begin
	    	SEG <= 8'b00000000;
		end

		else begin
	    	case( SEG_VAL )
	      		4'h0: 	SEG <= 8'b11111100;
	      		4'h1: 	SEG <= 8'b01100000;
	      		4'h2: 	SEG <= 8'b11011010;
	      		4'h3: 	SEG <= 8'b11110010;
	      		4'h4: 	SEG <= 8'b01100110;
	      		4'h5: 	SEG <= 8'b10110110;
	      		4'h6: 	SEG <= 8'b10111110;
	      		4'h7: 	SEG <= 8'b11100000;
	      		4'h8: 	SEG <= 8'b11111110;
	      		4'h9: 	SEG <= 8'b11110110;
				4'ha:	SEG <= 8'b00000000;
				4'hb:	SEG <= 8'b00000010;
				default:SEG <= 8'b00000000;
			endcase
		end
	end

endmodule
