//  ----------------------------------------------------------------------
//
//  Module Name :    Simulator
//  Designer :       Shimada
//  Create Date :    2014/02/11
//  Update Date :    2014/02/14
//  Version :        1.0.0
//  HDL :            Verilog-HDL 2001
//  Tool version :   Icarus Verilog  (Version 0.9.7)
//                   GTKWave  (Version 3.3.54)
//                   XQuartz  (Version 2.7.5)
//  Description :    シミュレーション用のテンプレート
//
//  ----------------------------------------------------------------------



`timescale 1ns/1ns

module Simulator;

  parameter  CYCLE      = 20;
  parameter  HALF_CYCLE = 10;
  parameter  DELAY      = 10;

  reg  clk;
  reg  rst;
  reg  btn;
  wire btn_out;

  /*   Clock Generate (50MHz)   */
  always begin
                    clk = 1'b1;
    #HALF_CYCLE     clk = 1'b0;
    #HALF_CYCLE;
  end


  /*   Calling of the modules   */
  Chattering Simulation (clk, rst, btn, btn_out);


  initial begin
    /*   Icarus Verilog   */
    $dumpfile("out.vcd");
    $dumpvars(0, clk, rst, btn, btn_out);

    rst = 1'b1;     btn = 1'b1;
    #DELAY;         // Racing measures
    #100            rst = 1'b0;
    #100            rst = 1'b1;
    #300            btn = 1'b0;         #10         btn = 1'b1;
    #20             btn = 1'b0;         #30         btn = 1'b1;
    #30             btn = 1'b0;         #20         btn = 1'b1;
    #50             btn = 1'b0;         #10         btn = 1'b1;
    #(300000*CYCLE)    $finish;
  end


endmodule