//  ----------------------------------------------------------------------
//
//  Module Name :    Adder
//  Designer :       Shimada
//  Create Date :    2014/02/15
//  Update Date :    2014/02/15
//  Version :        0.9.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    4bit加算回路     ※『わかるVerilogHDL入門』参照
//
//  ----------------------------------------------------------------------



module Adder (
	input  [3:0] in0, in1,
	output [3:0] out,
  output carry
);


  wire  [4:0] result;


  assign  result = in0 + in1;
	assign  out    = result[3:0];
  assign  carry  = result[4];


endmodule