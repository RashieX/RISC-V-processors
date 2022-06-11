`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 10:04:14 PM
// Design Name: 
// Module Name: instructionMemory
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


module instructionMemory(
     input wire[31:0] pc,
     input reset,
     output wire[31:0] instr

    );
    
    reg[7:0] array_mem[255:0];
    
     always@(reset)
      begin 
       if(reset == 0)
         begin
       //add r0, r1, r2
       array_mem[0] = 8'b00100000;
       array_mem[1] = 8'b00010000;
       array_mem[2] = 8'b00000001;
       array_mem[3] = 8'b00000000;
       
       //sub r4, r5, r6
       array_mem[4] = 8'b00100010;
       array_mem[5] = 8'b00110000;
       array_mem[6] = 8'b10000101;
       array_mem[7] = 8'b00000000; 
       
       //and r8,r9,r10
       array_mem[8] = 8'b00100100;
       array_mem[9] = 8'b01010000;
       array_mem[10] = 8'b00001001;
       array_mem[11] = 8'b00000001;
       
       //OR r9, r8, r10
        array_mem[12] = 8'b00100101;
        array_mem[13] = 8'b01010000;
        array_mem[14] = 8'b00101000;
        array_mem[15] = 8'b00000001; 
        
        //sll r11, r6, 6
        array_mem[16] = 8'b10000000;
        array_mem[17] = 8'b00000001;
        array_mem[18] = 8'b01100110;
        array_mem[19] = 8'b00000001;   
        
        //LI r12, 4
        array_mem[20] = 8'b00000100;
        array_mem[21] = 8'b00000000;
        array_mem[22] = 8'b10000000;
        array_mem[23] = 8'b11111101;                    
     end
    end
     
     assign instr = {array_mem[pc+3], array_mem[pc+2], array_mem[pc+1], array_mem[pc]};
         
    
endmodule
