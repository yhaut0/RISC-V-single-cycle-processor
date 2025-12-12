`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 07/22/2025 06:07:34 PM
// Design Name: 
// Module Name: alu
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


module alu 
	(
    input [31:0] src_a,
    input [31:0] src_b,
    input [3:0] alu_control,                      
    output reg[31:0] result_out,
    output zero                         //for branch comparisons
    );
    
assign zero = (result_out == 32'd0); 

always @(*)
begin
    case(alu_control)   
        4'b0000: result_out = src_a + src_b;                    //ADD
        4'b0001: result_out = src_a - src_b;                    //SUB
        4'b0010: result_out = src_a & src_b;                    //AND
        4'b0011: result_out = src_a ^ src_b;                    //XOR
        4'b0100: result_out = src_a >> src_b[4:0];              //SRLogical    
        4'b0101: result_out = $signed(src_a) >>> src_b[4:0];    //SRArithmetic
        4'b0110: result_out = (src_a < src_b) ? 32'd1 : 32'd0;  //SLTU
        4'b0111: result_out = ($signed(src_a) < $signed(src_b)) //SLT
                            ? 32'd1 : 32'd0;
        4'b1000: result_out = src_a + {src_b[31:12],12'b0};     //AUIPC
        4'b1010: result_out = src_a << src_b[4:0];              //SLL  
        4'b1100: result_out = src_a >> src_b[4:0];              //SRL                     
        default: result_out = 32'hDEAD_BEEF;                    //safety
    endcase   
end
endmodule

