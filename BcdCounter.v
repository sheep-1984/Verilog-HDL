//  ----------------------------------------------------------------------
//
//  Module Name :    BCD Counter
//  Designer :       Shimada
//  Create Date :    2014/01/22
//  Update Date :    2014/03/12
//  Version :        1.0.2
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    ボタンを押す毎にカウントアップ(10進数)して
//                   セグメントに表示する
//
//  ----------------------------------------------------------------------



module BcdCounter (
  input  clk,                    // Clock (50MHz)
  input  en,                     // Count Enable
  input  rst,                    // Asynchronous Reset active low
  input  btn,                    // Pull Up Push Button
  output [7:0] seg,              // 7-Segment Display with decimal point
  output reg [3:0] cnt = 4'd0    // Count value (0~9)
);


  /*   Decimal Count Up (0~9)   */
  always @(negedge btn or negedge rst) begin
    if(~rst)
      cnt <= 4'd0;
    else if (en)
      cnt <= (cnt >= 4'd9) ? 4'd0 : cnt + 4'd1;
    else
      cnt <= cnt;
  end

  /*   Decimal to Hex Converter   */
  HexSegDec DisplaySeg (cnt, seg);


endmodule