`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 05:11:56 AM
// Design Name: 
// Module Name: Processor
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


module Processor(
      input clk, 
      input reset

    );
    
    //instruction fetch 
    wire [7:0] PC2, instructionCode, PC_out;
    wire pcsrc;
    Instruction_fetch mod1(clk, reset, pcsrc, PC2,  PC_out,  instructionCode);
    
    
    //IF_ID
    wire [7:0] PC_IF_ID, instructionCode_IF_ID, pc_out, instructionCode_IF_ID_out;
    assign PC_IF_ID = PC_out;
    assign instructionCode_IF_ID = instructionCode;
    IF_ID reg1(clk, reset, PC_IF_ID, instructionCode_IF_ID, pc_out, instructionCode_IF_ID_out);
    
    //Instruction decode
    
    wire [1:0] opcode;
    wire alucntrl, alusrc, regWrite, immsel, memtoreg, PCsrc;
    wire regWrite_final;
    wire [2:0] writeaddr, read1;
    wire [7:0] writedata, data_out;
    wire [7:0] const;
    wire [7:0] writeaddr_final, writedata_final;
    
    
    
    assign opcode = instructionCode_IF_ID_out[7:6];
    assign writeaddr = instructionCode_IF_ID_out[5:3];

    control_unit mod2(opcode, alucntrl, alusrc, regWrite, immsel, memtoreg, PCsrc );
    RegisterFile mod3(clk, regWrite_final, reset, read1, writeaddr_final, writedata_final, data_out );
    ImmGen mod4(instructionCode_IF_ID_out, immsel, const);
    
    assign read1 = alusrc ? (instructionCode_IF_ID_out[5:3]) : (instructionCode_IF_ID_out[2:0]);
    
    //ID_EX 
    wire regwrite_ID_EX, alusrc_ID_EX, alucntrl_ID_EX, memtoreg_ID_EX, pcsrc_ID_EX;
    wire [7:0] data_out_ID_EX, const_ID_EX;
    wire [2:0] sourceaddr_ID_EX, writeaddr_ID_EX;
    wire [7:0] PC_ID_EX;
    
    ID_EX reg2(clk, reset, regWrite, alusrc, alucntrl, memtoreg, PCsrc, data_out, const, read1, writeaddr, PC_IF_ID, regwrite_ID_EX, alusrc_ID_EX, alucntrl_ID_EX,
               memtoreg_ID_EX, pcsrc_ID_EX, data_out_ID_EX, const_ID_EX, sourceaddr_ID_EX, writeaddr_ID_EX, PC_ID_EX);
               
    //Executing stage
    
    wire [7:0] input1, input2, forward_input, in1, in12, ALU_result, data3;
    wire[2:0] writeaddr_EX_WB;
    wire regWrite_EX_WB, out;
    Forwarding_unit mod6(sourceaddr_ID_EX, writeaddr_EX_WB, regWrite_EX_WB, out);
    assign forward_input = writedata_final;
    assign input1 = out ? (forward_input) : in1;
    assign in1 = alusrc_ID_EX ? (data_out_ID_EX) : PC_ID_EX;
    assign input2 = const_ID_EX;
    assign data3 = out ? forward_input : data_out_ID_EX;
    ALU mod5(input1, input2, alucntrl_ID_EX, ALU_result);
    
    //EX_WB
    
    wire  memtoreg_EX_WB, pcsrc_EX_WB;
    wire [7:0] ALU_result_EX_WB, data3_EX_WB;
    EX_WB reg3(clk, reset, regwrite_ID_EX, memtoreg_ID_EX, pcsrc_ID_EX, ALU_result, data3, writeaddr_ID_EX, regWrite_EX_WB, 
               memtoreg_EX_WB, pcsrc_EX_WB, ALU_result_EX_WB, data3_EX_WB, writeaddr_EX_WB  );
     
     
     //Writeback stage
     
      assign regWrite_final = regWrite_EX_WB;
      assign writeaddr_final = writeaddr_EX_WB;
      assign writedata_final = memtoreg_EX_WB ? (data3_EX_WB) : (ALU_result_EX_WB);
      assign PC2 = writedata_final;
      assign pcsrc = pcsrc_EX_WB;
           
               
        
    
endmodule
