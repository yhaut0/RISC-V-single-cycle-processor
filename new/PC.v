`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 08/14/2025 04:12:25 PM
// Design Name: 
// Module Name: PC
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

module PC(
    input [31:0] PCNext,
    input clk,
    input reset,
    output [31:0] PC
    );
    
reg[31:0] PC_reg;
    
always @(posedge clk or posedge reset)
begin
    if(reset) 
    PC_reg <= 0;
    else
    PC_reg <= PCNext;
end
    
assign PC = PC_reg;    
       
endmodule
