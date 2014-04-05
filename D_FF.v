//  ----------------------------------------------------------------------
//
//  Module Name :    DFF
//  Designer :       Shimada
//  Create Date :    2013/11/15
//  Update Date :    2014/02/14
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    リセット付きＤフリップフロップ回路
//
//  ----------------------------------------------------------------------



module D_FF (
  input  clk,     // Clock (50MHz)
  input  rst,     // Asynchronous Reset active low
  input  d,       // Input Data or Delay
  output reg q    // Output Q
);


  always @(posedge clk or negedge rst) begin
    if(~rst)
      q <= 1'b0;
    else
      q <= d;
  end


endmodule