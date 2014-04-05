//  ----------------------------------------------------------------------
//
//  Module Name :    ALU (Arithmetic Logic Unit)
//  Designer :       Shimada
//  Create Date :    2014/02/20
//  Update Date :    2014/02/20
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    ALU (演算装置)     ※『わかるVerilogHDL入門』参照
//                   ex). 4ビットのOR演算の場合
//                        ALU #(4) alu_or (in0, in1, 3'b101, out);
//
//  ----------------------------------------------------------------------



module ALU #(parameter width=1) (
	input  [width-1:0] a, b,
	input  [2:0] s,
	output [width-1:0] f
);


  function [width-1:0] Operation (
    input  [width-1:0] a, b,
    input  [2:0] s
  );

    begin
      case(s)
        3'b000  :  Operation = 4'b0000;
        3'b001  :  Operation = b - a;
        3'b010  :  Operation = a - b;
        3'b011  :  Operation = a + b;
        3'b100  :  Operation = a ^ b;
        3'b101  :  Operation = a | b;
        3'b110  :  Operation = a & b;
        3'b111  :  Operation = 4'b1111;
        default :  Operation = 4'bxxxx;
      endcase
    end

    assign  out = Operation(a, b, s);


endmodule