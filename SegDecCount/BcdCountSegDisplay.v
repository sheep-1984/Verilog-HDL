module BcdCountSegDisplay (
  input  clk,           // Clock
  input  en,            // Enable
  input  rst,           // Asynchronous reset active low
  input  we,            // Digit Write Enable
  input  btn,           // Pull-up Push Button
  output [7:0] seg,     // 7-Segment Display with decimal point
  output [3:0] value    // 1-Digit Delay Value
);

  wire  [7:0] seg_in;


  /*   1-Digit Delay Value Counter   */
  BcdCounter DecCounter (clk, en, we, rst, btn, seg_in, value);
  /*   7-Segment Blinking   */
  SegBlink  SegBlinking (clk, we, rst, seg_in, seg);


endmodule