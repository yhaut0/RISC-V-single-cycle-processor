`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 08/23/2025 03:44:46 PM
// Design Name: 
// Module Name: data_memory
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

module data_memory(
    input clk, write_enable,
    input [31:0] address, write_data,
    output wire [31:0] read_data
    );
    reg [31:0] ram[63:0];

    assign read_data = ram[address[31:2]];  //her word 4byte
    
//only for testing, wont synthesize
//addi s0, zero, 0
//lw s0, 0(s0)
//lh s1, 0(s0)
//lb s2, 0(s0)
//sw s0, 63(s0)

initial begin
    ram[32'h0000_0000]  = 32'hFACEFACE;
    ram[1]              = 32'h0000_0002;    
    ram[2]              = 32'h0000_0003;
    
    ram[63]             = 32'h0000_0063;    //Should be replaced by FACEFACE
end    
   
always @(posedge clk)
if(write_enable)   
    ram[address[31:2]] <= write_data;    
 
endmodule    