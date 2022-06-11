`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 07:16:56 PM
// Design Name: 
// Module Name: processor
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


module processor(
       input clk,
       input reset
    );
    
 
    
    //Instruction Fetch 
    wire [31:0]address_out;
    IF mod1(clk, reset, address_out);
    
    //Intruction decode
    wire[4:0] read_reg1, read_reg2, write_reg;
    wire regWrite; 
    wire[31:0] write_data;
    wire[31:0] data_out1, data_out2;
    assign read_reg1 =  address_out[20:16];
    assign read_reg2 =  address_out[15:11];
    assign write_reg =  address_out[25:21];
    
    //immgen
    wire [31:0]immediateIn, immediate;
    wire immsel;
    assign immediateIn = address_out[31:0];
    
    

   //control unit 
    wire [5:0] funct, opcode;
    wire[2:0] ALU_operation;
    wire reg_Write, alusrc, memtoreg;
    assign funct = address_out[5:0];
    assign opcode = address_out[31:26];
    assign regWrite = reg_Write;
    
    
    //ALU 
    wire [31:0] in1, in2;
    wire [2:0]aluOP;
    wire [31:0] result; 
     assign in1 = data_out1;
     assign aluOP = ALU_operation;
    
    //mux1 
      wire [31:0] inp1, inp2;
      wire aluSRC;
      wire [31:0]out; 
      assign inp1 = data_out2;
      assign inp2 = immediate;
      assign aluSRC = alusrc;
      assign out = aluSRC?inp2:inp1;
      assign in2 = out;
      
     //mux2 
      wire[31:0] a1, a2;
      wire memTOreg;
      wire [31:0] b;
      assign a1 = result; 
      assign a2 = immediate; 
      assign memTOreg = memtoreg;
      assign b = memTOreg?a2:a1;
      assign write_data = b;
      
      
   
    
    //assign write_data = result;//write back 
    
    //instantiation 
   // instructionMemory mod2(address_read, address_out);
    registerfile mod3(clk, regWrite, reset, read_reg1, read_reg2, write_reg, write_data, data_out1, data_out2);
    Imm_gen mod4(immediateIn, immsel, immediate);
    control_unit mod5(opcode, funct, ALU_operation, reg_Write, immsel, alusrc, memtoreg);
    ALU mod6(in1, in2, aluOP, result);
    //mux mod7(inp1, inp2, alusrc, out);
   // mux mod8(a1, a2, memtoreg, b);
    
    
endmodule
