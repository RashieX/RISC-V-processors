`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2022 01:11:28 AM
// Design Name: 
// Module Name: IF
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


module IF(
    input clk,
    input reset,
    output wire[31:0] Instruction_code
    );
    
    reg[31:0] PC;
    
    instructionMemory mod(PC, reset, Instruction_code);
    
    always@(posedge clk, negedge reset)
    begin
    if(reset ==0)
    PC <= 0;
    else 
    PC <= PC + 4;
    end 
endmodule

