`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:06 03/18/2021 
// Design Name: 
// Module Name:    Processor 
// Project Name: 
// Target Devices: 
// Tool versions: 
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
	input clock,
	input reset
    );
	 
	//Declaring wires
	wire [7:0] A,P_ALU_Res,P_I_Code,P_PC;
	wire [1:0] P_ALUOp,P_AL2Cont; 
	wire P_RsCont,P_PCCont,P_JFlag,P_Regwrite,P_AL1Cont;
	
	//Instruction Fetch
	IF IF1 (clock,reset,P_ALU_Res,P_JFlag,P_I_Code,P_PC);
	//Control Unit
	ControlUnit cu1 (P_I_Code[7:6],P_ALUOp,P_RsCont,P_PCCont,P_JFlag,P_Regwrite,P_AL1Cont,P_AL2Cont);	
	//Instruction Decode and Write Back
	RegFile_Code reg1(P_I_Code,P_ALU_Res,reset,clock,P_Regwrite,P_RsCont,A); 
	//Execution Block
	ALU alu1(P_I_Code,A,P_PC,P_AL1Cont,P_ALUOp,P_ALU_Res);	
	
endmodule
