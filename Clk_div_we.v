//  ----------------------------------------------------------------------
//
//  Module Name :    Clk_div_lt
//  Designer :       Shimada
//  Create Date :    2013/03/04
//  Update Date :    2014/03/11
//  Version :        1.0.2
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    ダブル・エッジ・トリガ型 非同期リセット プリスケーラ(分周)回路
//                   デューティ比50%の矩形波を出力する
//
//  ----------------------------------------------------------------------



module Clk_div_we (
  input  clk,          // Clock (50MHz)
  input  rst,          // Asynchronous Reset active low
  input  [26:0] div,   // f(50M)/N  (N = div / 2)
  output pclk          // Prescaler Clock
);

  reg  [26:0] cnt = 27'd0;


  always @(clk or negedge rst) begin
    if(~rst)
      cnt <= div;
    else
      cnt <= (cnt < (div - 1'd1)) ? cnt + 1'd1 : 27'd0;
  end

  assign  pclk = (cnt < (div >> 1)) ? 1'b1 : 1'b0;


endmodule