//  ----------------------------------------------------------------------
//
//  Module Name :    SegBlink
//  Designer :       Shimada
//  Create Date :    2014/02/26
//  Update Date :    2014/03/11
//  Version :        1.0.1
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    セグメントの点滅回路(1.25Hz)
//
//  ----------------------------------------------------------------------



module SegBlink (
  input clk,              // Clock (50MHz)
  input en,               // Enable
  input rst,              // Asynchronous Reset active low
  input  [7:0] seg_in,    // Input Segment Value
  output [7:0] seg_out    // output Segment Value
);

  wire  pclk;


  Clk_div blink_clk (clk, rst, 26'd40000000, pclk);      // 1.25Hzのクロックを生成

  assign  seg_out = (~en)  ? seg_in :                    // EnableがOFFの時は点滅しない
                    (pclk) ? seg_in : 8'b11111111;       // 入力値を点滅して返す


endmodule
