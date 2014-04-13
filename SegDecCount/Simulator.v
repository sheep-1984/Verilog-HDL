//  ----------------------------------------------------------------------
//
//  Module Name :    Simulator
//  Designer :       Shimada
//  Create Date :    2014/02/11
//  Update Date :    2014/02/14
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Tool version :   Icarus Verilog  (Version 0.9.7)
//                   GTKWave  (Version 3.3.57)
//                   XQuartz  (Version 2.7.5)
//  Description :    シミュレーション用のテンプレート
//
//  ----------------------------------------------------------------------



`timescale 1ns/1ns

module Simulator;

  parameter  CYCLE      = 20;     // Clock Cycle
  parameter  HALF_CYCLE = 10;     // Clock half-Cycle
  parameter  DELAY      = 10;     // Racing measures

  reg  clk;
  reg  rst;
  reg  [1:0] btn;
  wire [7:0] seg0;
  wire [7:0] seg1;
  wire [7:0] seg2;
  wire [7:0] seg3;
  wire [13:0] count_value;


  /*   Clock Generate (50MHz)   */
  always begin
                    clk = 1'b1;
    #HALF_CYCLE     clk = 1'b0;
    #HALF_CYCLE;
  end


  /*   Calling of the modules   */
  SegDecCount #(4) Simulation (clk, rst, btn, seg0, seg1, seg2, seg3, count_value);


  initial begin
    /*   Icarus Verilog   */
    $dumpfile("out.vcd");
    $dumpvars(0, clk, rst, btn, seg0, seg1, seg2, seg3, count_value);

    rst = 1'b1;   btn[0] = 1'b1;   btn[1] = 1'b1;
    #DELAY;         // Racing measures
    #100            rst = 1'b0;   // Reset ON
    #100            rst = 1'b1;   // Reset OFF

    #100  btn[0] = 1'b0;     #100  btn[0] = 1'b1;     // 1st Digit = 1
    #50  btn[1] = 1'b0;     #50  btn[1] = 1'b1;

    #100  btn[0] = 1'b0;     #100  btn[0] = 1'b1;     // 2nd Digit = 0


    #100  btn[0] = 1'b0;     #100  btn[0] = 1'b1;     // 3rd Digit = 5
    #50  btn[1] = 1'b0;     #50  btn[1] = 1'b1;
    #50  btn[1] = 1'b0;     #50  btn[1] = 1'b1;
    #50  btn[1] = 1'b0;     #50  btn[1] = 1'b1;
    #50  btn[1] = 1'b0;     #50  btn[1] = 1'b1;
    #50  btn[1] = 1'b0;     #50  btn[1] = 1'b1;

    #100  btn[0] = 1'b0;     #100  btn[0] = 1'b1;     // 4th Digit = 2
    #50  btn[1] = 1'b0;     #50  btn[1] = 1'b1;
    #50  btn[1] = 1'b0;     #50  btn[1] = 1'b1;

    #100  btn[0] = 1'b0;     #100  btn[0] = 1'b1;     // Output Adder

    #(10*CYCLE)    $finish;
  end


endmodule