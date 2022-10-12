`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2022 15:15:49
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
input rst,
input [31:0] IN,

output [31:0] OUT 
    );
    
    logic [31:0] resALU;
    logic [31:0]   OperA;
    logic [31:0] OperB;
    logic [4:0] A_IN1;
    logic [4:0] A_IN2;
    logic [4:0] A_IN3;
    logic[31:0] Instr;
    logic[7:0] PC;
    logic[7:0] numToPC;
    logic      WE;
    logic[4:0] alucontrol;
    logic[31:0] WD;
    logic[31:0] SE;
    logic flag;
    logic flag_and;
    logic flag_or;
    
    assign alucontrol = Instr[27:23];
    assign A_IN1 = Instr[22:18];
    assign A_IN2 =Instr[17:13];
    assign A_IN3 =Instr[4:0];
    assign SE = {{9{Instr[27]}}, Instr[27:5]};
    assign OUT = OperA;
    assign WE = Instr[28] |  Instr[29];
    assign flag_and = flag & Instr[30];
    assign flag_or = flag_and | Instr[31];
    
    
    ALU alu(
    .A(OperA),
    .B(OperB),
    .ALUControl(alucontrol),
    .Flag(),
    .Result(resALU));
    
    Regiter_file register_f(
    .clk(clk),
    .adr1( A_IN1),
    .adr2( A_IN2),
    .adr3( A_IN3),
    .we(WE),
    .rd1(OperA),
    .rd2(OperB),
    .wd3(WD));
    
    instr_memory memory(
    .A1(PC),
    .RD1(Instr)
    );
    
    always_ff @(posedge clk)begin 
    if(!rst )
        PC<=0; 
    else PC<= PC+numToPC;
    end
    
    always_comb  
    case (Instr[29:28]) 
    2'd0:WD = IN;
    2'd1:WD = SE;
    2'd2:WD = resALU;
    default:WD = 0; 
    endcase
    
    always_comb  
    case (flag_or) 
    1'd0:numToPC = 8'b1;
    1'd1:numToPC = Instr[12:5];
    endcase
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
endmodule
