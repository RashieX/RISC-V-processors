`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 04:53:29 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
   input wire[7:0] in1, in2,
   input wire alu_control,
   output reg[7:0] result
   //output zero

    );
    

    
    always @(*)
       begin
        if(alu_control == 1)
         begin 
           result =  in1 << in2;
         end
        else
          begin 
            result = in1 + in2;
          end 
       end
       
       //zero flag condition
      // assign zero = (result == {32{1'b0}});
    
    
endmodule
