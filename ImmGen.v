`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 11:45:28 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
      input [7:0] instr,
      input immsel,
      output reg[7:0] const

    );
     
     reg [5:0] const1; //relative jump address 
     reg [2:0] shamt;   //shift amount
    always @(*)
     begin 
      if(immsel == 0) // 
        begin 
          shamt = instr[2:0];
          const = $signed(shamt);
        end
      else 
        begin 
          const1 = instr[5:0];
          const =  $signed(const1);
        end
     end
          
endmodule
