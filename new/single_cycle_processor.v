`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 10/06/2025 02:42:08 PM
// Design Name: 
// Module Name: single_cycle_processor
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

module single_cycle_processor(
    input           clk,reset,
    output [31:0]   write_data,data_addr,
    output          mem_write
    );
    
    wire [31:0] PC,instr,read_data,alu_result;
    
single_cycle_core core(
    .clk(clk),
    .reset(reset),
    .instr(instr),
    .read_data(read_data),
    .PC(PC),
    .mem_write(mem_write),
    .alu_result(alu_result),
    .write_data(write_data)
);    
    
instruction_memory InstructionMemory(
    .address(PC),
    .instruction(instr)
);
    
data_memory DataMemory(
    .clk(clk),
    .write_enable(mem_write),
    .address(data_addr),
    .write_data(write_data),
    .read_data(read_data)
);    

assign data_addr = alu_result;
    
endmodule
