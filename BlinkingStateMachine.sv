/******************************************************************* 
* Name:
*	BlinkingStateMAchine.sv
* Description:
* 	This module contain the state machine of the project
* Inputs:
*	clk, reset, start
* Outputs:
* 	out
* Versión:  
*	1.0
* Author: 
*	Felipe Garcia & Diego Reyna
* Fecha: 
*	10/02/2018 
*********************************************************************/
module BlinkingStateMachine
(
	// Input Ports
	input clk,
	input reset,
	input start,
	
	// Output Ports
	output out
);

enum logic [4:0] {IDLE,ON_1,ON_2,ON_3,ON_4,ON_5,ON_6,OFF_7,OFF_8,OFF_9,OFF_10,ON_11,ON_12,ON_13,ON_14,ON_15,ON_16,OFF_17,
		OFF_18,OFF_19,OFF_20,ON_21,ON_22,ON_23,ON_24,ON_25,ON_26,OFF_27,OFF_28,OFF_29,OFF_30} state;


bit out_bit;
bit startflag_bit;



/*------------------------------------------------------------------------------------------*/
/*Asignacion de estado, proceso secuencial*/
always_ff@(posedge clk, negedge reset) begin
		
	if(reset == 1'b0)begin
			state <= IDLE;
			startflag_bit <= 1'b0;
	end
	else if(start && startflag_bit == 1'b0) begin
			startflag_bit <= 1'b1;
	end
	
	else
	
	case(state)
		IDLE:
			if(startflag_bit)begin
				state <= ON_1;
			end
			else begin
				state <= IDLE;	
			end
		ON_1:
			if(startflag_bit) begin
				state <= ON_2;	
			end
		ON_2:
			if(startflag_bit)
				state <= ON_3;
		ON_3:
			if(startflag_bit)
				state <= ON_4;	
		ON_4:
			if(startflag_bit)
				state <= ON_5;						
		ON_5:
			if(startflag_bit)
				state <= ON_6;
		ON_6:
			if(startflag_bit)
				state <= OFF_7;					
		OFF_7:
			if(startflag_bit)
				state <= OFF_8;	
		OFF_8:
			if(startflag_bit)
				state <= OFF_9;
		OFF_9:
			if(startflag_bit)
				state <= OFF_10;	
		OFF_10:
			if(startflag_bit)
				state <= ON_11;					
		ON_11:
			if(startflag_bit)
				state <= ON_12;
		ON_12:
			if(startflag_bit)
				state <= ON_13;
		ON_13:
			if(startflag_bit)
				state <= ON_14;
		ON_14:
			if(startflag_bit)
				state <= ON_15;
		ON_15:
			if(startflag_bit)
				state <= ON_16;						
		ON_16:
			if(startflag_bit)
				state <= OFF_17;
		OFF_17:
			if(startflag_bit)
				state <= OFF_18;				
		OFF_18:
			if(startflag_bit)
				state <= OFF_19;	
		OFF_19:
			if(startflag_bit)
				state <= OFF_20;
		OFF_20:
			if(startflag_bit)
				state <= ON_21;
		ON_21:
			if(startflag_bit)
				state <= ON_22;						
		ON_22:
			if(startflag_bit)
				state <= ON_23;
		ON_23:
			if(startflag_bit)
				state <= ON_24;	
		ON_24:
			if(startflag_bit)
				state <= ON_25;						
		ON_25:
			if(startflag_bit)
				state <= ON_26;
		ON_26:
			if(startflag_bit)
				state <= OFF_27;					
		OFF_27:
			if(startflag_bit)
				state <= OFF_28;	
		OFF_28:
			if(startflag_bit)
				state <= OFF_29;
		OFF_29:
			if(startflag_bit)
				state <= OFF_30;	
		OFF_30:
			if(startflag_bit)begin
				state <= IDLE;
				startflag_bit <= 1'b0;
			end
			
		default:
				state <= IDLE;
		endcase
end//end always
/*------------------------------------------------------------------------------------------*/

/*Asignación de salidas,proceso combintorio*/
always_comb begin	
	 case(state)
		IDLE: 
				out_bit = 1'b0;
		ON_1: 
				out_bit = 1'b1;
		ON_2: 
				out_bit = 1'b1;
		ON_3: 
				out_bit = 1'b1;
		ON_4: 
				out_bit = 1'b1;
		ON_5: 
				out_bit = 1'b1;
		ON_6: 
				out_bit = 1'b1;
		OFF_7: 
				out_bit = 1'b0;
		OFF_8: 
				out_bit = 1'b0;
		OFF_9: 
				out_bit = 1'b0;
		OFF_10: 
				out_bit = 1'b0;
		ON_11: 
				out_bit = 1'b1;
		ON_12: 
				out_bit = 1'b1;
		ON_13: 
				out_bit = 1'b1;
		ON_14: 
				out_bit = 1'b1;
		ON_15: 
				out_bit = 1'b1;
		ON_16: 
				out_bit = 1'b1;
		OFF_17: 
				out_bit = 1'b0;
		OFF_18: 
				out_bit = 1'b0;
		OFF_19: 
				out_bit = 1'b0;
		OFF_20: 
				out_bit = 1'b0;
		ON_21: 
				out_bit = 1'b1;
		ON_22: 
				out_bit = 1'b1;
		ON_23: 
				out_bit = 1'b1;
		ON_24: 
				out_bit = 1'b1;
		ON_25: 
				out_bit = 1'b1;
		ON_26: 
				out_bit = 1'b1;
		OFF_27: 
				out_bit = 1'b0;
		OFF_28: 
				out_bit = 1'b0;
		OFF_29: 
				out_bit = 1'b0;
		OFF_30: 
				out_bit = 1'b0;

	default: 		
				out_bit = 1'b0;

	endcase
end

// Asingnación de salidas

assign out = out_bit;

endmodule
