`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 01:38:13 AM
// Design Name: 
// Module Name: EX_WB
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


module EX_WB(
      input clk, reset, 
      input reg_Write, memtoreg, pcsrc,
      input [7:0] result_in, data2_in,
      input [2:0] write_addr_in,
     
     output reg  regWrite, Memtoreg, Pcsrc, 
     output reg [7:0] result_out, data2_out,
     output reg [2:0] write_addr_out
     

    );
    
    always @(posedge clk, negedge reset)
      begin 
         if(reset == 0)
           begin 
               regWrite = 0;
               Memtoreg = 0;
               Pcsrc = 0;
               result_out = 8'b0;
               data2_out = 8'b0;
               write_addr_out = 3'b0;  
            end
         else 
           begin 
              regWrite = reg_Write;
              Memtoreg = memtoreg;
              Pcsrc = pcsrc;
              result_out = result_in;
              data2_out = data2_in;
              write_addr_out = write_addr_in;    
           end 
        end
        
             
endmodule
