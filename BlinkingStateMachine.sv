module BlinkingMachine
(
	// Input Ports
	input clk,
	input reset,
	input start,
	
	// Output Ports
	output out
);

enum logic [2:0] {IDLE,ON_1,ON_2,ON_3,ON_4,ON_5,ON_6,OFF_7,OFF_8,OFF_9,OFF_10,ON_11,ON_12,ON_13,ON_14,ON_15,ON_16,OFF_17,
						OFF_18,OFF_19,OFF_20,ON_21,ON_22,ON_23,ON_24,ON_25,ON_26,ON_27} state;


logic clk1hz_log;
logic out_log;
logic startflag_log;


/*------------------------------------------------------------------------------------------*/
/*Asignacion de estado, proceso secuencial*/
always_ff@(posedge clk, negedge reset) begin

	if(reset == 1'b0)begin
			state <= IDLE;
			startflag_log <= 1'b0;
	end
	else 
		if(start == 1'b1)
			startflag_log <= 1'b1;
			
	case(state)
		
		IDLE:
			if(startflag_log)
				state <= ON_1;
			else
				state <= IDLE;					
		ON_1:
			if(starflag_log)
				state <= ON_2;	
		ON_2:
			if(Full)
				state <= FINISH;
		ON_3:
			if(Full)
				state <= FINISH;	
		ON_4:
			if(Finish)
				state <= READ_FIFO;						
		ON_5:
			if(startflag_log)
				state <= IDLE;
		ON_6:
			if(startflag_log)
				state <= ON_1;					
		OFF_7:
			if(startflag_log)
				state <= LOAD_CH1;	
		OFF_8:
			if(Full)
				state <= FINISH;
		OFF_9:
			if(Full)
				state <= FINISH;	
		OFF_10:
			if(Finish)
				state <= READ_FIFO;					
		ON_11:
			if(startflag_log)
				state <= IDLE;
		ON_12:
			if(startflag_log)
				state <= LOAD_CH1;
		ON_13:
			if(Full)
				state <= FINISH;
		ON_14:
			if(Full)
				state <= FINISH;
		ON_15:
			if(Finish)
				state <= READ_FIFO;						
		ON_16:
			if(startflag_log)
				state <= IDLE;
		OFF_17:
			if(startflag_log)
				state <= ON_1;				
		OFF_18:
			if(startflag_log)
				state <= LOAD_CH1;	
		OFF_19:
			if(Full)
				state <= FINISH;
		OFF_20:
			if(Full)
				state <= FINISH;
		ON_21:
			if(Finish)
				state <= READ_FIFO;						
		ON_22:
				state <= IDLE;
		ON_23:
			if(Full)
				state <= FINISH;	
		ON_24:
			if(Finish)
				state <= READ_FIFO;						
		ON_25:
			if(startflag_log)
				state <= IDLE;
		ON_26:
			if(startflag_log)
				state <= ON_1;					
		OFF_27:
			if(startflag_log)
				state <= LOAD_CH1;	
		OFF_28:
			if(Full)
				state <= FINISH;
		OFF_29:
			if(Full)
				state <= FINISH;	
		OFF_30:
			if(Finish)
				state <= READ_FIFO;
			
		default:
				state <= IDLE;

		endcase
end//end always
/*------------------------------------------------------------------------------------------*/

endmodule
