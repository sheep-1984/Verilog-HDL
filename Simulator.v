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
  reg  ***;   <- Add Input
  wire ***;   <- Add Output Pin


  /*   Clock Generate (50MHz)   */
  always begin
                    clk = 1'b1;
    #HALF_CYCLE     clk = 1'b0;
    #HALF_CYCLE;
  end


  /*   Calling of the modules   */
  Simulator Simulation (clk, rst, ***, ***);    <- Rewrite Use Module


  initial begin
    /*   Icarus Verilog   */
    $dumpfile("out.vcd");
    $dumpvars(0, clk, rst, ***, ***);   <- Rewrite Measure of Pin

    rst = 1'b1;
    #DELAY;         // Racing measures
    #100            rst = 1'b0;   // Reset ON
    #100            rst = 1'b1;   // Reset OFF
        <-   Write Simulation of input   ->
    #(10*CYCLE)    $finish;
  end


endmodule