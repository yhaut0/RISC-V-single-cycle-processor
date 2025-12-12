`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 08/23/2025 02:20:09 PM
// Design Name: 
// Module Name: alu_mux
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

module alu_mux(
    input [31:0] rd2,imm_ext,
    input alu_src,
    output wire [31:0] src_b
    );
assign src_b = alu_src ? imm_ext : rd2;    
endmodule
