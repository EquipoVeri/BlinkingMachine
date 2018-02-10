module BlinkingMachine
(
	// Input Ports
	input clk,
	input reset,
	input start,
	
	// Output Ports
	output out,
	output clk_1hz
);

logic out_log;
logic clk1hz_log;
					
ClockDivider clkdiv_1hz (.clk_FPGA(clk), .reset(reset), .enable(), .clock_signal(clk1hz_log));

BlinkingMachine bmachine (.clk(clk1hz_log), .reset(reset), .start(star), .out(out_log));


assign out = out_log;
assign clk_1hz = clk1hz_log;


endmodule
