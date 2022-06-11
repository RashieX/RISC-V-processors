`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 02:43:04 AM
// Design Name: 
// Module Name: Instruction_fetch
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


module Instruction_fetch(
    input clk,
    input reset,
    input pcsrc,
    input [7:0] PC2,
    output wire [7:0] PC_out,
    output wire[7:0] Instruction_code
    );
    
    reg[7:0] PC;
    
    Instruction_memory mod(PC, reset, Instruction_code);
    
    always@(posedge clk, negedge reset)
    begin
    if(reset ==0)
    PC <= 0;
    else 
    PC <= pcsrc ? (PC2) : (PC + 1);
    end 
    
    assign PC_out = PC;
endmodule
