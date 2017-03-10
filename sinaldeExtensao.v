`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2017 17:41:34
// Design Name: 
// Module Name: SinaldeExtensao
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


module SinaldeExtensao(
    input [15:0] entrada,
    output wire [31:0] saida
    );
    
    assign saida[15:0] = entrada[15:0];
    assign saida[31:16] = entrada[15];

endmodule
