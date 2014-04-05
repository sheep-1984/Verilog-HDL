//  ----------------------------------------------------------------------
//
//  Module Name :    ShiftRegister
//  Designer :       Shimada
//  Create Date :    2014/02/14
//  Update Date :    2014/03/17
//  Version :        1.0.1
//  HDL :            Verilog-HDL 2001
//  Target Device :  DE0
//  Tool version :   Quartus II Web Edition (Version 13.1)
//  Description :    直列入力並列出力形シフトレジスタによる遅延回路
//                   widthでビット数を指定
//
//  ----------------------------------------------------------------------



module ShiftRegister #(
  parameter  width = 1
)(
  input clk,              // Clock
  input rst,              // Asynchronous Reset active low
  input  d,               // Input Data or Delay
  output [width-1:0] q    // Output Q
);


  generate
    genvar i;

    D_FF ff0  (clk, rst, d, q[0]);     // First FlipFlop

    for (i=0; i<(width-1); i=i+1) begin : dff_gene    // Generate FlipFlop (1~width-1)
      D_FF ff (clk, rst, q[i], q[i+1]);    // Later FlipFlop
    end
  endgenerate


endmodule