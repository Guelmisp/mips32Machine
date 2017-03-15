`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2017 17:41:34
// Design Name: 
// Module Name: Multiplex
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


module Multiplex(
    input [31:0] entradaA,
    input [31:0] entradaB,
    input  seletor,
    output reg [31:0] saida
    );	
    
    always @(seletor, entradaA, entradaB)
        begin
            if (seletor == 0 )
                saida <= entradaA;
            else
                saida <= entradaB;
        end

endmodule
