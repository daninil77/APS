`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2022 15:33:54
// Design Name: 
// Module Name: instr_memory
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


module instr_memory(
  
  input   [4:0]   A1,     

  output  [31:0]   RD1     
 );
  reg [31:0] ROM [0:31];   
  initial $readmemb("instru_mem.mem", ROM);  // поместить при запуске микросхемы в
                                      // память RAM содержимое файла mem.txt
  assign RD1 = ROM[A1];   // реализация первого порта на чтение
 

    
endmodule
