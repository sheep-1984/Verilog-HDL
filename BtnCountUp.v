//  ----------------------------------------------------------------------
//
//  Module Name :    BtnCountUp
//  Designer :       Shimada
//  Create Date :    2013/12/15
//  Update Date :    2014/02/14
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    ボタンを押す毎にカウントアップ (10進数で0~9まで)
//
//  ----------------------------------------------------------------------



module BtnCountUp (
  input  btn,                     // Pull-up Push Button
  input  rst,                     // Asynchronous Reset active low
  output reg [3:0] cnt = 4'd0     // Count value (0~9)
);


  always @(negedge btn or negedge rst) begin
	  if (~rst)
		  cnt <= 4'd0;
	  else
		  cnt <= (cnt >= 4'd9) ? 4'd0 : cnt + 1'd1;
  end


endmodule