`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 07:34:51 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
     input clk, reset, 
     input reg_Write, alucntrl, alusrc, memtoreg, pcsrc,
     input [7:0] data1, Imm_result_in,
     input [2:0] source_address, write_address,
     input [7:0] PC_in,
     
     output reg regWrite, Alucntrl, Alusrc, Memtoreg, PCsrc, 
     output reg [7:0] data1_out, Imm_result_out,
     output reg [2:0] SourceAddress,WriteAddress,
     output reg [7:0] PC_out

    );
    
    always @(posedge clk, negedge reset)
      begin 
         if(reset == 0)
           begin 
               regWrite = 1'b0;
               Alucntrl = 1'b0;
               Alusrc = 1'b0;
               Memtoreg = 1'b0;
               PCsrc = 1'b0;
               data1_out = 32'b0;
               Imm_result_out = 32'b0;
               SourceAddress = 3'b0;
               WriteAddress = 3'b0;
               PC_out = 8'b0;
            end
         else 
           begin 
             regWrite = reg_Write;
             Alucntrl = alucntrl;
             Alusrc = alusrc;
             Memtoreg = memtoreg;
             PCsrc = pcsrc; 
             data1_out = data1;
             Imm_result_out = Imm_result_in;
             SourceAddress = source_address;
             WriteAddress = write_address;
             PC_out = PC_in;
           end 
        end
        
             
endmodule
