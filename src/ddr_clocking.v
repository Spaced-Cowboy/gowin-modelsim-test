`include "defines.v"

///////////////////////////////////////////////////////////////////////////////
// Phase control values
// --------------------
// 0000 0°          0001 22.5°          0010 45°            0011 67.5°
// 0100 90°         0101 112.5°         0110 135°           0111 157.5°
// 1000 180°        1001 202.5°         1010 225°           1011 247.5°
// 1100 270°        1101 292.5°         1110 315°           1111 337.5°
//
// Duty cycle values
// -----------------
// 0010 2/16        0011 3/16           0100 4/16           0101 5/16
// 0110 6/16        0111 7/16           1000 8/16           1001 9/16
// 1010 10/16       1011 11/16          1100 12/16          1101 13/16
// 1110 14/16
//
// Delay parameters
// ----------------
// 0111 0.875ns     1011 1.375ns        1101 1.625ns        1110 1.75ns
// 1111 1.875ns
//
///////////////////////////////////////////////////////////////////////////////

module ddr_clocking
    (
    input               clk,                // External clock
	input			    rst,				// External reset
    input       [3:0]   psda,               // dynamic phase control
    input       [3:0]   fdly,               // dynamic delay of CLKOUTP

    output              clk_ddrMain,        // Main DDR clock
    output              clk_ddrWrite,       // 270° phase-shifted clock
    output              clk_ddrRead,        // User-tuned clock
    output              clk_ddrClient,      // Client-interface clock
    output              clk_ddrMgmt,        // init/long-period timer

    output              locked             // Both PLLs are locked
	);

    // Duty cycle of 50%, taking into account the phase of the signal
    wire [3:0] duty = psda + 4'b1000;     

    wire lock_pll1;
    pll_ddr1 ddr1_inst
        (
        .clkin(clk),
        .reset(rst),

        .clkout(clk_ddrMain),
        .clkoutp(clk_ddrRead),
        .clkoutd(clk_ddrClient),
        
        .psda(psda),
        .dutyda(duty),
        .fdly(fdly),

		.lock(lock_pll1)
        );
    
    wire lock_pll2;
    wire dummyClock;
    pll_ddr2 ddr2_inst
        (
        .clkin(clk),
        .reset(rst),

        .clkout(dummyClock),
        .clkoutp(clk_ddrWrite),
        .clkoutd(clk_ddrMgmt),

        .lock(lock_pll2)
        );
    
    assign locked = lock_pll1 & lock_pll2;

endmodule