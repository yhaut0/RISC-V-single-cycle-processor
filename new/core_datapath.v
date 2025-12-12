`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 08/28/2025 01:58:48 PM
// Design Name: 
// Module Name: core_datapath
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


module core_datapath(
    input clk,reset,
    input [1:0] result_src,
    input pc_src, alu_src,
    input reg_write,
    input [1:0] imm_src,
    input [3:0] alu_control,
    input [31:0] instr,
    input [31:0] read_data,
    output zero,
    output [31:0] PC,
    output [31:0] alu_result, write_data
    );
    
   wire [31:0]      PCnext,PCplus4,PCtarget;
   wire [31:0]		ImmExt;
   wire [31:0]		SrcA,SrcB;
   wire [31:0]		Result;
   
   PC PC_inst (
   .clk(clk),
   .reset(reset),
   .PCNext(PCnext),
   .PC(PC)
   );
   
   pc_plus4 pc_plus4_inst (
   .PC(PC),
   .PCPlus4(PCplus4)
   );
   
   pc_target pc_target_inst (
   .PC(PC),
   .imm_ext(ImmExt),
   .pc_target(PCtarget)
   );
   
   pc_mux pc_mux_inst (
   .pc_src(pc_src),
   .pc_plus4(PCplus4),
   .pc_target(PCtarget),
   .PCNext(PCnext)
   );
   
   register_file register_file_inst (
   .clk(clk),
   .we3(reg_write),
   .a1(instr[19:15]),
   .a2(instr[24:20]),
   .a3(instr[11:7]),
   .wd3(Result),
   .rd1(SrcA),
   .rd2(write_data)
   );
   
   extend extend_inst (
   .instr(instr[31:7]),
   .imm_src(imm_src),
   .imm_ext(ImmExt)
   );
   
   alu_mux alu_mux_inst (
   .rd2(write_data),
   .imm_ext(ImmExt),
   .alu_src(alu_src),
   .src_b(SrcB)
   );
   
   alu ALU_inst (
   .src_a(SrcA),
   .src_b(SrcB),
   .alu_control(alu_control),
   .zero(zero),
   .result_out(alu_result)
   );
   
   result_mux result_mux_inst (
   .alu_result(alu_result),
   .read_data(read_data),
   .pc_plus4(PCplus4),
   .result_src(result_src),     // [31:0] ve [1:0] ??
   .result(Result)
   );
       
endmodule
