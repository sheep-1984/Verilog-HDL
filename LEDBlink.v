//  ----------------------------------------------------------------------
//
//  Module Name :    LEDBlink
//  Designer :       Shimada
//  Create Date :    2014/02/26
//  Update Date :    2014/02/26
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    LEDの点滅回路(1Hz)
//
//  ----------------------------------------------------------------------



module LEDBlink (
  input clk,    // Clock (50MHz)
  input rst,    // Asynchronous Reset active low
  output led    // LED
);

  wire  bclk;


  Clk_div blink_gene (clk, rst, 26'd50000000, bclk);     // 1Hzのクロックを生成

  assign  led = bclk;


endmodule