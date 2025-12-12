`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 07/30/2025 03:50:37 PM
// Design Name: 
// Module Name: alu_ctrl
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


module alu_ctrl(
    input wire        funct7b5,
    input wire        opb5,
    input       [1:0] alu_op,
    input       [2:0] funct3,                 //instruciton[14:12]
    input       [6:0] funct7,                 //instruciton[31:25]
    output reg  [3:0] alu_control
    );
    
assign RtypeSub = funct7b5 & opb5; //TRUE for R-type substract    
    
always @(*) begin
    case (alu_op)
        2'b00: alu_control = 4'b0000; // LW, SW → ADD
        2'b01: alu_control = 4'b0001; // BEQ    → SUB
        2'b10: begin
            case (funct3) //R-type or I-type
                3'b000:
                  if (RtypeSub) alu_control = 4'b0001; //sub
                  else    alu_control = 4'b0000; //add,addi
                3'b001: alu_control = 4'b1010; // sll, slli;
                3'b010: alu_control = 4'b0101; //slt,slti
                3'b011: alu_control = 4'b0110; //sltu, sltui
                3'b100: alu_control = 4'b0100; //xor
                3'b101: 
                  if (funct7b5) alu_control = 4'b1011; //sra
                  else alu_control = 4'b1100; // srl
               
                3'b110: alu_control = 4'b0011; //or,ori
                3'b111: alu_control = 4'b0010; //and,andi
              default: alu_control = 4'bxxx; 
            endcase
            //alu_op devamı gelebilir
        end
        default: alu_control = 4'bxxxx;
    endcase
end

endmodule
