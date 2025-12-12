`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 07/30/2025 04:39:33 PM
// Design Name: 
// Module Name: instruction_memory
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
//bu kısmı pek anlayamadım

module instruction_memory(
    input [31:0] address,           //A
    output [31:0] instruction       //RD    
    );
    
    reg [31:0] memory [0:255];      //256 komutluk ROM (32-bit)
    
    initial begin
        $display("Loading instr_mem.mem (from TB)...");
        $readmemh("instr_mem.mem",memory);
    end

assign instruction = memory[address[9:2]];    
    
endmodule
