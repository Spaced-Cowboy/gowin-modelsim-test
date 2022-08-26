`include "defines.v"

module top
    (
    input           clk,                // External clock
	input			rst,				// External reset
    output reg      led                 // External LED
    );

	wire 			clk_ddrMain;		// Main DDR clock @ 400 MHz 
	wire 			clk_ddrWrite;		// 270-degree shifted clock @ 400 MHz
	wire 			clk_ddrRead;		// shiftable clock @ 400 MHz
	wire 			clk_ddrClient;		// client-interface clock @ 200 MHz
	wire 			clk_ddrMgmt;		// Internal management clock @ 100 MHz

	wire 			ddr_locked;			// All clocks locked and ready to go
	reg  	[3:0]	ddr_psda;			// Phase-shift for read-clock
	reg		[3:0]	ddr_delay;			// Delay for read-clock


	// Just so there's something to do while the clocks sync up
    parameter COUNTER_SZ  			= $clog2(`ROLLOVER);
	wire [COUNTER_SZ-1:0] increment = {{COUNTER_SZ-1{1'b0}}, 1'b1};
	reg  [COUNTER_SZ-1:0] counter;


	// Invoke the DDR clocks
	wire ddr_clocks_locked;
	ddr_clocking ddr_clocks
		(
		.clk(clk),						// Input clock from the board
		.rst(rst),						// Input reset signal 
		
		.psda(ddr_psda),				// Phase-shift values
		.fdly(ddr_delay),				// Delay on phase-shifted clock

		.clk_ddrMain(clk_ddrMain),		// Main DDR clock
		.clk_ddrWrite(clk_ddrWrite),	// DDR clock for write-ops
		.clk_ddrRead(clk_ddrRead),		// DDR clock for read-ops
		.clk_ddrClient(clk_ddrClient),	// clock for the DDR client interface
		.clk_ddrMgmt(clk_ddrMgmt),		// clock for internal DDR use
		
		.locked(ddr_clocks_locked)		// We're up and running
		);

	always @ (posedge clk)
		if (rst == 1'b1) 
			begin
				ddr_psda	<= 4'b0100;	// Set user-phase to 90 degrees
				ddr_delay	<= 4'b0;
			end

	always @ (posedge clk_ddrMain)
		if (rst) 
			begin
				counter 	<= 0;
				led 		<= 0;
			end
		else if (ddr_clocks_locked)
			begin
				counter <= counter + increment;
				if (counter == `ROLLOVER)
					begin
						counter <= 0;
						led <= ~led;
					end
			end

endmodule