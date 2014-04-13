//  ----------------------------------------------------------------------
//
//  Module Name :    HexSegDec
//  Designer :       Shimada
//  Create Date :    2013/02/07
//  Update Date :    2014/02/14
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    ７セグメントデコーダー
//
//  ----------------------------------------------------------------------



module HexSegDec (
  input  en,            // Enable
  input  rst,           // Asynchronous reset active low
  input  [3:0] value,   // Decimal Value (0~9), Dot(10), E(11), OFF(12~15)
  output [7:0] seg      // 7-Segment Display with decimal point
);


  function [7:0] LedDec (
    input  [3:0] num
  );

    begin
      case (num)
        4'd0:     LedDec = 8'b11000000;   // 0
        4'd1:     LedDec = 8'b11111001;   // 1
        4'd2:     LedDec = 8'b10100100;   // 2
        4'd3:     LedDec = 8'b10110000;   // 3
        4'd4:     LedDec = 8'b10011001;   // 4
        4'd5:     LedDec = 8'b10010010;   // 5
        4'd6:     LedDec = 8'b10000010;   // 6
        4'd7:     LedDec = 8'b11111000;   // 7
        4'd8:     LedDec = 8'b10000000;   // 8
        4'd9:     LedDec = 8'b10011000;   // 9
        4'd10:    LedDec = 8'b01111111;   // .
        4'd11:    LedDec = 8'b10000110;   // E
        default:  LedDec = 8'b11111111;   // LED OFF
      endcase
    end
  endfunction

  assign  seg = (~rst) ? 8'b00000000 :                  // Reset: All LED ON
                  (en) ? LedDec(value) : 8'b11111111;   // Enable OFF: All LED OFF


endmodule