//  ----------------------------------------------------------------------
//
//  Module Name :		 Clk_div_pulse
//  Designer :			 Shimada
//  Create Date :		 2014/03/15
//  Update Date :		 2014/03/15
//  Version :				 1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :	 DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :		 エッジ・トリガ型 非同期リセット プリスケーラ(分周)回路
//									 パルス波形を出力する
//
//  ----------------------------------------------------------------------



module Clk_div_pulse (
  input  clk,          // Clock (50MHz)
  input  rst,          // Asynchronous Reset active low
  input  [25:0] div,   // f(50M)/N  (N = div)
  output pclk          // Prescaler Clock
);

	reg  [25:0] cnt = 26'd0;


	always @(posedge clk or negedge rst) begin
	  if(~rst)
	  	cnt <= div;
	  else
			cnt <= (cnt < (div - 1'd1)) ? cnt + 1'd1 : 26'd0;
	end

	assign  pclk = (cnt == 26'd0) ? 1'b1 : 1'b0;


endmodule