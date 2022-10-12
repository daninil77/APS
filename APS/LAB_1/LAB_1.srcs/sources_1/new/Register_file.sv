`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2022 14:55:08
// Design Name: 
// Module Name: Register_file
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


module Register_file#(parameter D=32,parameter W=32 )(
input clk,
input [$log10(D):0] adr1,
input [$log10(D):0] adr2,
input [$log10(D):0] adr3,
input       we,
input [W-1:0] wd3,
output [W-1:0] rd1,
output [W-1:0] rd2
 );
 logic [W-1:0] RF [0:D-1];
 
 assign rd1 =(adr1!=0)?RF[adr1]:32'b0;
 assign rd2 =(adr2!=0)?RF[adr2]:32'b0;

 always_ff @(posedge clk)
        if (we) RF[adr3] <= wd3;
endmodule
