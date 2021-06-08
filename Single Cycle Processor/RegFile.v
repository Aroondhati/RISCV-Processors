`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:08 03/18/2021 
// Design Name: 
// Module Name:    RegFile 
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
	module RegFile_Code(
	input [7:0] instr_code,
	input [7:0] writedata,
	input reset,
	input clk,
	input regwrite,
	input RsCont,
	output [7:0] readdata
    ); 
	 
	 wire [2:0] rd, rs;
	 reg [7:0] RegFile [7:0];
	 
	 //Extracting Rs, Rd from Instruction Code
	 assign rs=(RsCont)?instr_code[5:3]:instr_code[2:0];
	 assign rd=instr_code[5:3];
	 
	 //Writing into register
	 always@(posedge clk)
	 begin
			if(regwrite)
			RegFile[rd]=writedata;
	 end
	 
	 //Reading Specific Register Values on Reset
	 always@(negedge reset)
	 begin
			if(~reset)
			$readmemh("Level0RegFile.mem",RegFile);
	 end
	 
	 //Reading data of Rs register
	 assign readdata=RegFile[rs];
	 
	endmodule

