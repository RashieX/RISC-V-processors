`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 10:20:00 AM
// Design Name: 
// Module Name: Forwarding_unit
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


module Forwarding_unit(
      input [2:0] sourceAddress_ID_EX, writeAddress_EX_WB,
      input regWrite_EX_WB,
      output reg out
       
    );
    
    always@(*)
    begin 
      if(regWrite_EX_WB == 0)
        out = 0;
      else if ((sourceAddress_ID_EX == writeAddress_EX_WB) && (regWrite_EX_WB == 1))
         out = 1;
      else 
        out = 0; 
    end 
endmodule
