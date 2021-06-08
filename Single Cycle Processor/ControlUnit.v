`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:37 03/18/2021 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
    input [1:0] In1,
    output reg [1:0] ALUop,
	 output reg RsCont,
	 output reg PCCont,
	 output reg JFlag,
	 output reg Regwrite,
	 output reg AL1Cont,
	 output reg [1:0] AL2Cont
    );

always@(In1)
begin
	JFlag<=0;
	case(In1)
	2'b00: begin ALUop<=In1; RsCont<=0; PCCont<=0; JFlag<=0; Regwrite<=1; AL1Cont<=0; AL2Cont<=In1; end
	2'b01: begin ALUop<=In1; RsCont<=1; PCCont<=0; JFlag<=0; Regwrite<=1; AL1Cont<=0; AL2Cont<=In1; end
	2'b11: begin ALUop<=In1; RsCont<=1; PCCont<=0; JFlag<=1; Regwrite<=0; AL1Cont<=1; AL2Cont<=In1; end
	endcase
	
end

	
endmodule
