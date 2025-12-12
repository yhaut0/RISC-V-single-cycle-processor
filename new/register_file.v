`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 07/30/2025 07:11:19 PM
// Design Name: 
// Module Name: register_file
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
//NOT:
//RISC-V'da x0 her zaman 0
module register_file(
    input              clk,
    input              we3,                        //write_enable
    input       [4:0]  a1,                         //instruction[19:15]
    input       [4:0]  a2,                         //instruction[24:20]
    input       [4:0]  a3,                         //instruction[11:7]
    input       [31:0] wd3,                        //write_data
    output reg  [31:0] rd1,rd2
    );
    
    reg [7 : 0] i = 0;    //for simulation        
    reg[31:0] registers[31:0];


initial begin
    for (i = 0; i < 32; i = i + 1) begin
        registers [i] = 0;
    end
    registers [1] = 32'd6;
    registers [2] = 32'd7;
end

always @(posedge clk)
begin      
    if(we3 && (a3 != 0)) begin
        registers[a3] <= wd3;
    end      
end    

always @(*)begin
    rd1 <= (a1 == 0) ? 32'd0 : registers[a1];     
    rd2 <= (a2 == 0) ? 32'd0 : registers[a2];
end

endmodule
