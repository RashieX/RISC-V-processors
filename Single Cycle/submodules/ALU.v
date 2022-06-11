`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 02:11:52 PM
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
   input wire[31:0] in1, in2,
   input wire[2:0] alu_control,
   output reg[31:0] result
   //output zero

    );
    

    
    always @(*)
       begin
        case(alu_control)
          3'b000 : result = in1 & in2; //and operation
          3'b001 : result = in1 | in2; //or operation
          3'b101 : result = in1 + in2; //addition operation
          3'b100 : result = in1 - in2; //subraction operation
          3'b010 : result = in1 << in2; //shift left operation
          3'b011 : result = in1 >> in2; //shift right operation
        endcase 
       end
       
       //zero flag condition
      // assign zero = (result == {32{1'b0}});
    
    
endmodule
