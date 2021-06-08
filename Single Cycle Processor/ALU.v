`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:27 03/18/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [7:0] instr_code,
	 input [7:0] A,
    input [7:0] PC,
	 input AL1Cont,
    input [1:0] ALUOp,
    output reg [7:0] ALU_Res
    );
	 reg [7:0] A_inter;

//Choosing First Input of ALU	 
always@(A,PC)
begin
	if(AL1Cont==1)
	A_inter<=PC;
	else
	A_inter<=A;	
end

//Choosing Second Input of ALU and Performing Operations
always@*
begin
	case(ALUOp)
	2'b00: ALU_Res<=A_inter+0; 
	2'b01: ALU_Res<=A_inter<<instr_code[2:0]; 
	2'b11: ALU_Res<=A_inter+1+{instr_code[5],instr_code[5],instr_code[5:0]};
	endcase
end

endmodule
