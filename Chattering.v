//  ----------------------------------------------------------------------
//
//  Module Name :    Chattering
//  Designer :       Shimada
//  Create Date :    2014/01/21
//  Update Date :    2014/02/14
//  Version :        0.9.9
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    チャタリング防止回路
//                   待機時間は7[ms]
//
//  ----------------------------------------------------------------------



module Chattering (
  input  clk,     // Clock (50MHz)
  input  rst,     // Asynchronous Reset active low
  input  btn,     // Pull-up Push Button
  output btn_cp   // Chattering-proof Output
  );

  wire clk_1khz;
  reg [7:0]  btn_buff = 8'b01111111;


  Clk_div gene_1khz (clk, rst, 16'd50000, clk_1khz);     // 1[KHz]のクロックを生成

  always @(posedge clk_1khz or negedge rst) begin
    if (~rst)
      btn_buff <= 8'b11111111;
    else
      btn_buff <= (btn_buff << 1) + btn;
  end


  assign  btn_out = (btn_buff == 8'b10000000) ? 1'b0 : 	      		 // ON
	                  (btn_buff == 8'b01111111) ? 1'b1 : btn_out;  	 // OFF


endmodule