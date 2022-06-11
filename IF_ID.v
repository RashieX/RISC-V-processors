`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 07:30:42 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
     input clk, reset, 
     input [7:0] PC_in, IM,
     
     output reg [7:0] PC_out, IM_out

    );
    
    always @(posedge clk, negedge reset)
      begin 
         if(reset == 0)
           begin 
               PC_out = 8'b0;
               IM_out = 8'b0;
              
            end
         else 
           begin 
             PC_out = PC_in;
             IM_out = IM;
           end 
        end
        
             
endmodule
