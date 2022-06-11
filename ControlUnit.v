`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 11:56:30 PM
// Design Name: 
// Module Name: ControlUnit
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


module control_unit(
   
    input[1:0] opcode,
    output reg alucntrl,
    output reg alusrc,
    output reg regWrite,
    output reg immsel,
    output reg memtoreg,
    output reg PCsrc

    );
    
     //wire funct_7 = funct7[6];
    
    always@(*)
     begin
       case(opcode)
        2'b00 : begin alucntrl = 1'bx;
                      alusrc = 1'bx;
                      regWrite = 1;
                     memtoreg = 1;
                     immsel = 0;
                     PCsrc = 0;      
                     end         //MOV operation 
        2'b01 : begin alucntrl = 1; //SLL operation
                      alusrc = 1;
                      regWrite = 1;
                      memtoreg = 0;
                      immsel = 0;
                      PCsrc = 0;
                     end 
        2'b11 : begin alucntrl = 0; //J operation 
                      alusrc = 0;
                      regWrite = 0;
                     memtoreg = 0;
                     immsel = 1;
                     PCsrc = 1;
                     end
                    
        /*6'b000010 : begin alucntrl = 3'b011; //srl operation
                     ALUsrc = 1; 
                 memtoreg = 0;
                 immsel = 0;
                   end   
        6'b100010 : begin alucntrl = 3'b100; // subract operation
                     ALUsrc = 0; 
                     memtoreg = 0;
                     immsel = 0; 
                     end
        6'b100000 : begin alucntrl = 3'b101; // add operation
                     ALUsrc = 0; 
                    memtoreg = 0;
                   immsel = 0;
                   end
        default: begin 
                  ALUsrc = 1;
                  memtoreg = 1;
                   immsel = 1;
                  end */
       endcase
      end
   
endmodule
