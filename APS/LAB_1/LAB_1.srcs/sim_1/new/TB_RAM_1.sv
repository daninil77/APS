`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2022 15:24:49
// Design Name: 
// Module Name: TB_RAM_1
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


module TB_RF_1#(parameter D=32,parameter W=32)(

    );
logic clk;
logic [$log10(D):0] adr1;
logic [$log10(D):0] adr2;
logic [$log10(D):0] adr3;
logic       we;
logic [W:0] wd3;
logic [W:0] rd1;
logic [W:0] rd2;
    
    
     Register_file#( .D(32), .W(32) )DUT(
.clk(clk),
 .adr1(adr1),
 .adr2(adr2),
 .adr3(adr3),
 .we(we),
 .wd3(wd3),
 .rd1(rd1),
 .rd2(rd2)
 );   
    
      task reg_write;
      input clk;
//      <more_inputs>

//      output <>;
//      <more_outputs>

      begin
         int data;
         for (integer i=0; i<D; i++) begin
         @(posedge clk); #1
         data =$urandom();
         we = 1'b1;
         wd3 = data;
         //adr1 = i;
         //adr2 = i;
         adr3 = i;
         @(posedge clk); #1;
         we =1'b0;
         end
         
      end
   endtask
     reg_write(clk);
    
endmodule
