`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 02:20:27 PM
// Design Name: 
// Module Name: result_mux
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


module result_mux(
    input [31:0] alu_result, read_data, pc_plus4,
    input [31:0] result_src,
    output [31:0] result
    );
    
assign result   = result_src[1] ? pc_plus4 
                : (result_src[0] ? read_data : alu_result);
    
endmodule
