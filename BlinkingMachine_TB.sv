timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

module BlinkingMachine_TB;

 // Input Ports
bit clk = 0;
bit reset;
bit start;
	
  // Output Ports
bit out;
bit clk_1hz; 


BlinkingMachine
DUT
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.start(start),
	
	// Output Ports
	.out(out),
	.clk_1hz(clk_1hz)

);	

/*********************************************************/
initial // Clock generator
  begin
    forever #20 clk = !clk;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset = 0;
	#5 reset = 1;
end

/*********************************************************/
initial begin // enable
	#0 start = 1;
	#6 start = 1;
end


endmodule