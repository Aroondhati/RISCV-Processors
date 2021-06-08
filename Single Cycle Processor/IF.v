`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:21 03/18/2021 
// Design Name: 
// Module Name:    IF 
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
module IF(
    input clk,
    input reset,
	 input [7:0] NewJadd,
	 input JFlag,
    output [7:0] Code,
	 output reg [7:0] PC
    );
//Accessing Instruction Memory
IM IM1 (PC,reset,Code);

//PC on Reset
always @(negedge reset)
begin
	if(reset==0)
	PC<=0;
end

//PC Updation to PC+1 or PC+X
always@(posedge clk)
begin
	if(JFlag==0)
	PC<=PC+1;	
	
	if(JFlag==1)
	PC<=NewJadd;
	
end
endmodule

