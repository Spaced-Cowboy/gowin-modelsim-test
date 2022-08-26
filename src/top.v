`timescale 1 ns / 1 ps // 1 ns steps, 1 ns precision.

`define ROLLOVER    2700

module top
    (
    input           clk,                // External clock
	input			rst,				// External reset
    output reg      led                 // External LED
    );

	wire pllClk;
	wire lock;

	Gowin_rPLL pll
		(
		.reset(rst),
		.clkin(clk),
		.clkout(pllClk),
		.lock(lock)
		);

    reg [24:0] counter;
	always @ (posedge pllClk)
        	begin
			if (rst == 1'b1) 
				begin
					counter <= 0;
					led 	<= 0;
				end
			else
				begin
					counter <= counter +25'b1;
					if (counter == `ROLLOVER)
						begin
							counter <= 0;
							led <= ~led;
						end
				end
		end

endmodule