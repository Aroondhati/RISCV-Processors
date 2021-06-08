`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:17 03/18/2021 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input [7:0] PC,
    input reset,
    output [7:0] Code
    );
	 
	 reg [7:0] Mem [5:0]; // 8 bit wide memory, 6 locations
	 
	 //Copying data from Instruction Memory
	 assign Code=Mem[PC];
	 
	 //Reading IM on Reset
	 always@(negedge(reset))
	 begin
			if(reset==0)
			$readmemh("Bigger_IM.mem",Mem);
	 end
endmodule
