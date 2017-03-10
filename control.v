`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2017 17:41:34
// Design Name: 
// Module Name: Control
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


module Control(
    input [5:0] Opcode,
    output reg RegDst,
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );
    
    always @ (Opcode) begin
            case (Opcode)
                //R-Type
                6'b000000: begin
                    RegDst   <= 1'b1;
                    Branch   <= 1'b0;
                    MemRead  <= 1'b0;
                    MemToReg <= 1'b0;
                    ALUOp    <= 2'b10;
                    MemWrite <= 1'b0;
                    ALUSrc   <= 1'b0;
                    RegWrite <= 1'b1;
                end
                //ADDI
                6'b001000: begin
                    RegDst   <= 1'b0;
                    Branch   <= 1'b0;
                    MemRead  <= 1'b0;
                    MemToReg <= 1'b0;
                    ALUOp    <= 2'b00;
                    MemWrite <= 1'b0;
                    ALUSrc   <= 1'b0;
                    RegWrite <= 1'b1;
                end
                ///BEQ
                6'b000100: begin
                    RegDst   <= 1'b0;
                    Branch   <= 1'b1;
                    MemRead  <= 1'b0;
                    MemToReg <= 0'b1;
                    ALUOp    <= 2'b01;
                    MemWrite <= 0'b1;
                    ALUSrc   <= 1'b0;
                    RegWrite <= 1'b0;
                end
                ///BNE
                6'b000101: begin
                    RegDst   <= 1'bX;
                    Branch   <= 1'b1;
                    MemRead  <= 1'b0;
                    MemToReg <= 1'bX;
                    ALUOp    <= 2'b10;
                    MemWrite <= 1'b0;
                    ALUSrc   <= 1'b0;
                    RegWrite <= 1'b0;
                end
                //LW
                6'b100011: begin
                    RegDst   <= 1'b1;
                    Branch   <= 1'b0;
                    MemRead  <= 1'b1;
                    MemToReg <= 1'b1;
                    ALUOp    <= 2'b00;
                    MemWrite <= 1'b0;
                    ALUSrc   <= 1'b1;
                    RegWrite <= 1'b1;
                end
                //SW
                6'b101011: begin
                    RegDst   <= 0'b1;
                    Branch   <= 0'b1;
                    MemRead  <= 1'b0;
                    MemToReg <= 1'b0;
                    ALUOp    <= 2'b00;
                    MemWrite <= 1'b1;
                    ALUSrc   <= 1'b1;
                    RegWrite <= 1'b0;
                end
                //SLTI
                6'b001010: begin
                    RegDst   <= 1'b0;
                    Branch   <= 1'b0;
                    MemRead  <= 1'b0;
                    MemToReg <= 1'b0;
                    ALUOp    <= 2'b00; //conferir
                    MemWrite <= 1'b1;
                    ALUSrc   <= 1'b1;
                    RegWrite <= 1'b1;
                end
                //J
                6'b000010: begin
                    RegDst   <= 1'bX;
                    Branch   <= 1'b0;
                    MemRead  <= 1'b0;
                    MemToReg <= 1'bX;
                    ALUOp    <= 2'bX;
                    MemWrite <= 1'b0;
                    ALUSrc   <= 1'b0;
                    RegWrite <= 1'b0;
                end
            endcase
        end
endmodule
