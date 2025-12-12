`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University
// Engineer: Metli Salih UÇAR
// 
// Create Date: 07/12/2025 01:32:35 PM
// Design Name: 
// Module Name: decoder_3to8
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


module decoder_3to8(
    input [2:0] X,
    input en,
    output reg [7:0] Y //decoder'ın çıkış hatları
    );
always @ (X or en)     
begin
    if(en)  // en == 1 ise
        case(X)
        3'b000 : Y = 8'b0000_0001;   //3'bxxx durumları X, 8'bxxxx_xxxx durumları Y.
        3'b001 : Y = 8'b0000_0010;
        3'b010 : Y = 8'b0000_0100;
        3'b011 : Y = 8'b0000_1000;
        3'b100 : Y = 8'b0001_0000;
        3'b101 : Y = 8'b0010_0000;
        3'b110 : Y = 8'b0100_0000;
        3'b111 : Y = 8'b1000_0000;
        endcase
    else
        Y = 8'b0000_0000;     
end    
endmodule

