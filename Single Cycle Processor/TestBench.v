`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:37:53 03/18/2021
// Design Name:   Processor
// Module Name:   F:/BITS/3 SEM 2/CS F342 Computer Architecture/Lab/8. Lab 7/ProcessorDesign/TestBench.v
// Project Name:  ProcessorDesign
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
///
////////////////////////////////////////////////////////////////////////////////

module TestBench;

	// Inputs
	reg clock;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	Processor uut (
		.clock(clock), 
		.reset(reset)
	);

	initial begin
		clock = 1;
		repeat(14)
		#10 clock=~clock;
		#10 $finish; 
	end
	
	initial begin
		reset = 1;
		#2 reset=0;
		#2 reset=1;
	end
      
endmodule

