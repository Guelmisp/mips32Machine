`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2017 17:41:34
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
    input [1:0] ALUop,
    input [5:0] Instruction,
    output reg [3:0] ALUcontrol
    );
    
    always @ (ALUop or Instruction or ALUcontrol)
    
            case(ALUop)
                2'b00: ALUcontrol <= 4'b0010; //addi
                2'b01: ALUcontrol <= 4'b0110; //beq (sub)
                //R-type
                default: case(Instruction)
                             6'b100000: ALUcontrol <= 4'b0010; //add
                             6'b100010: ALUcontrol <= 4'b0110; //sub
                             6'b100100: ALUcontrol <= 4'b0000; //and
                             6'b100101: ALUcontrol <= 4'b0001; //or
                             6'b101010: ALUcontrol <= 4'b0111; //slt
                             default: ALUcontrol <= 4'b0101;
                         endcase
            endcase
endmodule
