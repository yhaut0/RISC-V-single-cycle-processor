`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 10/06/2025 02:16:27 PM
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(
    input [6:0] opcode,
    output reg reg_write,
    output reg mem_write,
    output reg alu_src,             //R-type and I-type 
    output reg [1:0] result_src,
    output reg branch,
    output reg jump,
    output reg [1:0] alu_op,
    output reg [1:0] imm_src
    );
    
    reg [10:0] control_signals;
    
always @(*)
begin    
    reg_write   = 0;
    imm_src     = 2'b00;
    alu_src     = 0;
    mem_write   = 0;
    result_src  = 2'b00;
    branch      = 0;
    alu_op      = 2'b00;
    jump        = 0;
    
    case(opcode)  
        7'b011_0011: begin          //R-type
        reg_write   = 1;
        imm_src     = 2'bxx;
        alu_src     = 0;        
        mem_write   = 0;
        result_src  = 2'b00;
        branch      = 0;
        alu_op      = 2'b10;
        jump        = 0;
        end
        
        7'b001_0011: begin          //I-type
        reg_write   = 1;
        imm_src     = 2'b00;
        alu_src     = 1;        
        mem_write   = 0;
        result_src  = 2'b00;
        branch      = 0;
        alu_op      = 2'b10;
        jump        = 0;
        end
        
        7'b000_0011: begin          //LW
        reg_write   = 1;
        imm_src     = 2'b00;
        alu_src     = 1;        
        mem_write   = 0;
        result_src  = 2'b01;
        branch      = 0;
        alu_op      = 2'b00;
        jump        = 0;       
        end
        
        7'b010_0011: begin          //SW
        reg_write   = 0;
        imm_src     = 2'b01;
        alu_src     = 1;        
        mem_write   = 1;
        result_src  = 2'b00;
        branch      = 0;
        alu_op      = 2'b00;
        jump        = 0;
        end
        
        7'b110_0011: begin          //beq
        reg_write   = 0;
        imm_src     = 2'b10;
        alu_src     = 0;        
        mem_write   = 0;
        result_src  = 2'b00;
        branch      = 1;            // pc_src = zero & branch | jump
        alu_op      = 2'b01;
        jump        = 0;
        end
        
        7'b000_0000: begin
        reg_write   = 0;
        imm_src     = 2'b00;
        alu_src     = 0;        
        mem_write   = 0;
        result_src  = 2'b00;
        branch      = 0;
        alu_op      = 2'b00;
        jump        = 0;
        end
        
        default: begin
        reg_write   = 1'bx;
        imm_src     = 2'bxx;
        alu_src     = 1'bx;        
        mem_write   = 1'bx;
        result_src  = 2'bx;
        branch      = 1'bx;
        alu_op      = 2'bxx;
        jump        = 1'bx;
        end
       
    endcase
    
//end    

//assign {reg_write,imm_src,alu_src,mem_write,result_src,branch,alu_op,jump} = control_signals;
assign control_signals =   {reg_write,imm_src,alu_src,mem_write,result_src,branch,alu_op,jump};
   end   
endmodule
