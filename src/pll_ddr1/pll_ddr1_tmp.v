//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.8.07
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18
//Created Time: Fri Aug 26 13:44:52 2022

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    pll_ddr1 your_instance_name(
        .clkout(clkout_o), //output clkout
        .lock(lock_o), //output lock
        .clkoutp(clkoutp_o), //output clkoutp
        .clkoutd(clkoutd_o), //output clkoutd
        .reset(reset_i), //input reset
        .clkin(clkin_i), //input clkin
        .psda(psda_i), //input [3:0] psda
        .dutyda(dutyda_i), //input [3:0] dutyda
        .fdly(fdly_i) //input [3:0] fdly
    );

//--------Copy end-------------------
