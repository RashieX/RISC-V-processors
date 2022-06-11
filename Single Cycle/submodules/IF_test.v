`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2022 11:31:59 PM
// Design Name: 
// Module Name: IF_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IF_test;
      reg clk;
      reg reset;
  
      
      processor uut(.clk(clk), .reset(reset));
      
      always #10 clk = ~clk;
      initial begin
      clk = 1'b0;
      reset = 1'b1;
      #2
      reset = 1'b0;
      #2
      reset = 1'b1;
      #50
      reset = 1'b1;
      #50
      
      $finish;
      end
      endmodule
