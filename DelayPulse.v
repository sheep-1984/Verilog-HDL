//  ----------------------------------------------------------------------
//
//  Module Name :    DelayPulse
//  Designer :       Shimada
//  Create Date :    2013/03/20
//  Update Date :    2014/03/20
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    遅延パルス回路
//                   ※ clkに分周回路を通したクロックは入れないこと
//
//  ----------------------------------------------------------------------



module DelayPulse (
  input  clk,                 // Clock (50MHz)  **Please connect the 50MHz crystal oscillator.
  inout  en,                  // Enable
  input  rst,                 // Asynchronous Reset active low
  input  [25:0] delaytime,    // Delay Time (delaytime*10[ns])
  output d_pulse              // Delay Pulse
);

  reg  [25:0] p_cnt = 26'd0;
  reg  [25:0] n_cnt = 26'd0;


  always @(clk) begin
    if(~rst) begin
      p_cnt <= 26'd0;
      n_cnt <= 26'd0;
    end else begin
      p_cnt <= (en)  ? p_cnt + 1'd1 : 26'd0;
      n_cnt <= (~en) ? n_cnt + 1'd1 : 26'd0;
    end
  end


  assign  d_pulse = (p_cnt == delaytime || n_cnt == delaytime) ? 1'b1 : 1'b0;


endmodule