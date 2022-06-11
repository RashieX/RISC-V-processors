`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 11:41:34 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
     
     input clk, reg_write_en, reset,
     input [2:0] RegReadAddr1,
     input [2:0] RegWriteAddr,
     input [7:0] RegWriteData,
     output [7:0] RegReadData1
     
     );
     
     //signal declaration 
     reg [7:0] RegMemory[31:0];
     integer k; 
     
     always@(*)
     begin
      //write operation 
         if(reg_write_en) 
            RegMemory[RegWriteAddr] <= RegWriteData;
            //Reset operation
         if(reset)
             begin
                 for(k = 0; k < 32; k = k + 1)
                 RegMemory[k] <= k;
             end
     end 
       

    
          assign   RegReadData1 = RegMemory[RegReadAddr1];

             
endmodule