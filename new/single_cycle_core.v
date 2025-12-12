`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 11:38:47 AM
// Design Name: 
// Module Name: single_cycle_core
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


module single_cycle_core(
	input wire 	       clk,reset,
	input wire [31:0]  instr,
	input wire [31:0]  read_data,
	output wire [31:0] PC,
	output wire 	   mem_write,
	output wire [31:0] alu_result,write_data
    );
    
    wire        alu_src,reg_write,jump,zero,pc_src;
    wire [1:0]  result_src,imm_src;
    wire [3:0]  alu_control;
    
control_unit control(
    .opcode(instr[6:0]),        
    .funct3(instr[14:12]),
    .funct7(instr[31:25]),
    .zero(zero),
    .result_src(result_src),
    .mem_write(mem_write),
    .pc_src(pc_src),
    .alu_src(alu_src),
    .reg_write(reg_write),
    .jump(jump),
    .imm_src(imm_src),
    .alu_control(alu_control)
);
    
core_datapath Datapath(
    .clk(clk),
    .reset(reset),
    .result_src(result_src),
    .pc_src(pc_src),
    .alu_src(alu_src),
    .reg_write(reg_write),
    .imm_src(imm_src),
    .alu_control(alu_control),
    .instr(instr),
    .read_data(read_data),
    .zero(zero),
    .PC(PC),
    .alu_result(alu_result),
    .write_data(write_data)
);
    
    
    
endmodule
