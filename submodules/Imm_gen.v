`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2022 02:25:08 AM
// Design Name: 
// Module Name: Imm_gen
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


module Imm_gen(
      input [31:0] instr,
      input immsel,
      output reg[31:0] const

    );
     
     reg [20:0] const1;
     reg [4:0] shamt; 
    always @(*)
     begin 
      if(immsel == 0) //R-type
        begin 
          shamt = instr[10:6];
          const = $signed(shamt);
        end
      else 
        begin 
          const1 = instr[20:0];
          const =  $signed(const1);
        end
     end
          
endmodule
