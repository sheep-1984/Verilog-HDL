//  ----------------------------------------------------------------------
//
//  Module Name :    Barrel Shifter
//  Designer :       Shimada
//  Create Date :    2014/02/20
//  Update Date :    2014/02/20
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    バレル・シフタ     ※『わかるVerilogHDL入門』参照
//
//  ----------------------------------------------------------------------



module BarrelShifter #(parameter width=2) (
  input  [width-1:0] in,
  input  [15:0] amount,     // シフト量 (16ビット=65535シフトまで)
  input  direction,         // シフト方向 (right:0, left:1)
  output [width-1:0] out
);

  assign  out = (direction) ? (in << amount) : (in >> amount);


endmodule