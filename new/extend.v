`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 06:06:34 PM
// Design Name: 
// Module Name: extend
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


module extend(
    input [31:7] instr,
    input [1:0] imm_src,        //00=I, 01=S, 10=B,
    output wire [31:0] imm_ext
    );
    
    reg  [31:0] imm_ext_reg;
        
always @(*) begin
    case (imm_src)
        2'b00:                      //I-type
        imm_ext_reg = {{20{instr[31]}},instr[31:20]};
        2'b01:                      //S-type
        imm_ext_reg = {{20{instr[31]}},instr[31:25],instr[11:7]};
        2'b10:                      //B-type
        imm_ext_reg = {{20{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0};
        default:
        imm_ext_reg = 32'hDEAD_BEEF;//J-type şimdilik yok
    endcase
end    
    assign imm_ext = imm_ext_reg;
endmodule
