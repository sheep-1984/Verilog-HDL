//  ----------------------------------------------------------------------
//
//  Module Name :    Digit Move
//  Designer :       Shimada
//  Create Date :    2014/03/12
//  Update Date :    2014/02/12
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    桁移動ロジック回路
//
//  ----------------------------------------------------------------------



module DigitMove #(
  parameter  width = 4
)(
  input  btn,     // Pull-up Push Button
  input  rst,     // Asynchronous Reset active low
  output reg [width-1:0] selector = 0
);


  always @(posedge btn or negedge rst) begin
    if (~rst)             // Reset
      selector <= 0;
    else if (selector == 0)
      selector <= 1'b1;
    else
      selector <= selector << 1;
  end


endmodule