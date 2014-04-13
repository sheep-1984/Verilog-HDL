//  ----------------------------------------------------------------------
//
//  Module Name :    SegDecCount
//  Designer :       Shimada
//  Create Date :    2014/04/13
//  Update Date :    2014/04/13
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    10進数カウンタ回路 (0~9999)  widthで桁数を指定
//                   btn1で桁移動, btn2で指定した桁のカウントアップ
//
//  ----------------------------------------------------------------------



module SegDecCount #(
  parameter  width = 4        // Number of digits
)(
  input  clk,                 // Clock
  input  rst,                 // Asynchronous reset active low
  input  [1:0] btn,           // Pull-up Push Button
  output [7:0] seg0,          // 7-Segment Display with decimal point
  output [7:0] seg1,          // 7-Segment Display with decimal point
  output [7:0] seg2,          // 7-Segment Display with decimal point
  output [7:0] seg3,          // 7-Segment Display with decimal point
  output [13:0] count_value   // Count Value (0~9999)
);

  wire  [1:0] btn_cp;         // Chattering Prevention Button
  wire  [3:0] en;             // Segment Enable
  wire  [3:0] select_digit;   // Selected Digit
  wire  [3:0] digit_0;        // 1st Digit
  wire  [3:0] digit_1;        // 2nd Digit
  wire  [3:0] digit_2;        // 3rd Digit
  wire  [3:0] digit_3;        // 4th Digit


  /*   Digit Move   */
  Chattering btn0_chatter (clk, rst, btn[0], btn_cp[0]);          // Chattering Prevention
  DigitMove #(width) DigitShift (btn_cp[0], rst, en, select_digit);   // Digit Move by Button


  /*   Chattering Prevention   */
  Chattering btn1_chatter (clk, rst, btn[1], btn_cp[1]);


  /* Button Counter and 7-Segment Output */
  BcdCountSegDisplay digit0 (clk, en[0], rst, select_digit[0], btn_cp[1], seg0, digit_0);    // 1st Digit
  BcdCountSegDisplay digit1 (clk, en[1], rst, select_digit[1], btn_cp[1], seg1, digit_1);    // 2nd Digit
  BcdCountSegDisplay digit2 (clk, en[2], rst, select_digit[2], btn_cp[1], seg2, digit_2);    // 3rd Digit
  BcdCountSegDisplay digit3 (clk, en[3], rst, select_digit[3], btn_cp[1], seg3, digit_3);    // 4th Digit


  /*   Digit Adder   */
  assign  count_value = (14'd1000 * digit_3) + (14'd100 * digit_2) + (14'd10 * digit_1) + digit_0;


endmodule