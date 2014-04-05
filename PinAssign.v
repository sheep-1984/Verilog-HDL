//  ----------------------------------------------------------------------
//
//  Module Name :    PinAssign
//  Designer :       Shimada
//  Create Date :    2014/01/22
//  Update Date :    2014/02/14
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    DE0専用ピンアサイン設定
//
//  ----------------------------------------------------------------------



module PinAssign (
  input  clk,
  input  [2:0] btn,
  input  [9:0] sw,
  output [9:0] led,
  output [7:0] hex0,
  output [7:0] hex1,
  output [7:0] hex2,
  output [7:0] hex3
);

  assign  led  = 10'h0;
  assign  hex0 = 8'hff;
  assign  hex1 = 8'hff;
  assign  hex2 = 8'hff;
  assign  hex3 = 8'hff;


endmodule