`timescale 1ns / 1ps


module registerfile(
     
     input clk, reg_write_en, reset,
     input [4:0] RegReadAddr1,
     input [4:0] RegReadAddr2,
     input [4:0] RegWriteAddr,
     input [31:0] RegWriteData,
     output [31:0] RegReadData1,
     output [31:0] RegReadData2
     );
     
     //signal declaration 
     reg [31:0] RegMemory[31:0];
     integer k; 
     
     always@(posedge clk, posedge reset)
     begin
      //write operation 
         if(reg_write_en) 
            RegMemory[RegWriteAddr] <= RegWriteData;
            //Reset operation
         if(reset)
             begin
                 for(k = 0; k < 32; k = k + 1)
                 RegMemory[k] <= 1;
             end
     end 
       

    
          assign   RegReadData1 = RegMemory[RegReadAddr1];
             
          assign   RegReadData2 = RegMemory[RegReadAddr2];

             
endmodule
