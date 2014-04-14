//  ----------------------------------------------------------------------
//
//  Module Name :    BcdCountSegDisplay
//  Designer :       Shimada
//  Create Date :    2014/04/13
//  Update Date :    2014/04/13
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    ボタンを押す毎にカウントアップするBCDカウンタ
//                   WriteEnableがONのとき, セグメントが点滅してカウントアップする
//
//  ----------------------------------------------------------------------



module BcdCountSegDisplay (
  input  clk,           // Clock
  input  en,            // Enable
  input  rst,           // Asynchronous reset active low
  input  we,            // Digit Write Enable
  input  btn,           // Pull-up Push Button
  output [7:0] seg,     // 7-Segment Display with decimal point
  output [3:0] value    // 1-Digit Delay Value
);

  wire  [7:0] seg_in;


  /*   1-Digit Delay Value Counter   */
  BcdCounter DecCounter (clk, en, we, rst, btn, seg_in, value);
  /*   7-Segment Blinking   */
  SegBlink  SegBlinking (clk, we, rst, seg_in, seg);


endmodule