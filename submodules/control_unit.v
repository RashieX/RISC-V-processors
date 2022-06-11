`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2022 03:17:03 PM
// Design Name: 
// Module Name: control_unit
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
   
    input[5:0] opcode,
    input[5:0] funct,
    output reg[2:0] alucntrl,
    output regWrite,
    output reg immsel,
    output reg ALUsrc, memtoreg

    );
    
     //wire funct_7 = funct7[6];
    
    always@(*)
     begin
       case(funct)
        6'b100100 : begin alucntrl = 3'b000;
                    ALUsrc = 0; 
                    memtoreg = 0;
                    immsel = 0;      
                    end //AND operation 
        6'b100101 : begin alucntrl = 3'b001; //OR operation
                     ALUsrc = 0; 
                     memtoreg = 0;
                    immsel = 0;
                    end 
        6'b000000 : begin alucntrl = 3'b010; //sll operation
                    ALUsrc = 1; 
                    memtoreg = 0;
                    immsel = 0;
                    end
        6'b000010 : begin alucntrl = 3'b011; //srl operation
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
                  end 
       endcase
      end
         
      assign regWrite = 1; 
   
endmodule
