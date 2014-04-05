//  ----------------------------------------------------------------------
//
//  Module Name :    Mltplx
//  Designer :       Shimada
//  Create Date :    2014/02/15
//  Update Date :    2014/02/15
//  Version :        0.9.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    マルチプレクサ     ※『わかるVerilogHDL入門』参照
//
//  ----------------------------------------------------------------------



/*   1bit two input multiplexer   */
module Mltplx1_2 (
	input  in0, in1, sel,
	output out
);

	assign  out = (sel) ? in1 : in0;


endmodule



/*   4bit four input multiplexer   */
module Mltplx4_4 (
  input  [3:0] in0, in1, in2, in3,
  input  [1:0] sel,
  output [3:0] out
);

  assign  out = (sel == 2'd0) ? in0 :
                (sel == 2'd1) ? in1 :
                (sel == 2'd2) ? in2 :
                (sel == 2'd3) ? in3 : 4'bx;


endmodule



/*   4bit four input multiplexer   */
module Mltplx4_4 (
  input  [3:0] in0, in1, in2, in3,
  input  [1:0] sel,
  output [3:0] out
);

  function [3:0] mux (
    input  [1:0] sl;
    input  [3:0] d0, d1, d2, d3
  );

    begin
      case (sl)
        2'd0    : mux = d0;
        2'd1    : mux = d1;
        2'd2    : mux = d2;
        2'd3    : mux = d3;
        default : mux = 4'bxxxx;
      endcase
    end
  endfunction


  assign  out = mux(sel, in0, in1, in2, in3);


endmodule