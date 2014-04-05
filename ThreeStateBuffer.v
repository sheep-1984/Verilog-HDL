//  ----------------------------------------------------------------------
//
//  Module Name :    Three State Buffer
//  Designer :       Shimada
//  Create Date :    2014/02/20
//  Update Date :    2014/02/20
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    スリーステート・バッファ  ※『わかるVerilogHDL入門』参照
//
//  ----------------------------------------------------------------------



module ThreeStateBuffer (
  input  in, c,
  output out
);

  assign  out = (c) ? in : 1'bz;


endmodule