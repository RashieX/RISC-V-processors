`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 06:24:00 PM
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(
     input wire[7:0] pc,
     input reset,
     output wire[7:0] instr

    );
    
    reg[7:0] array_mem[255:0];
    
     always@(reset)
      begin 
       if(reset == 0)
         begin
       //MOV R2, R4
       array_mem[0] = 8'b00011101;
       
       //SLL R2, 1
       array_mem[1] = 8'b01011001; 
       
       //MOV R4, R2
       array_mem[2] = 8'b00101011;
       
       //J L1
        array_mem[3] = 8'b11000101; 
        
        //SLL R4, 3
        array_mem[4] = 8'b01101011;   
        
        //MOV R0, R4
        array_mem[5] = 8'b0000010;                    
     end
    end
     
     assign instr = array_mem[pc];
         
    
endmodule
