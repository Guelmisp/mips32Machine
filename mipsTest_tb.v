// Incluindo Modulos no Sistema//
`include "ALU.v"
`include "ALUControl.v"
`include "Control.v"
`include "ProgramCounter.v"
`include "InstrucMemory.v"
`include "Multiplex.v"
`include "Registers.v"
`include "SinaldeExtensao.v"
`include "multiplex5.v"
`include "DataMemory.v"

module executa_tb;
    reg osc;
    reg rst;
    reg [31:0] inicioPC;

    initial begin
        rst = 1; 
        inicioPC = 32'b0;
        osc = 0;
        #101
        rst = 0;
        #5000
        rst = 1;
    end
    always begin
        #100 osc = ~osc;
    end     
    wire clk;
    assign clk = osc;

    wire [31:0] PC;
    wire [31:0] Instrucao;
    wire [31:0] ALUentrada, Resultado;
    wire ALUzero;

    //Modulos a serem utulizados
    wire SignExtend;
    wire [31:0] MemData;
    wire [31:0] SaidaExtensao;
    SinaldeExtensao SE1(Instrucao[15:0], SaidaExtensao);

    wire RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump;
    
    ProgramCounter PC1(PC, clk, inicioPC,rst,Jump,Branch,ALUzero,SaidaExtensao,Instrucao[25:0],PC);

    InstrucMemory IM1(PC, Instrucao);   

    wire [1:0] ALUOp;

    Control CU(Instrucao[31:26], RegDst, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, Jump);

    wire [3:0] ALUctrl;

    ALUControl AC(ALUOp, Instrucao[5:0], ALUctrl);

    wire [4:0] WriteAddr;

    multiplex5 MU5(RegDst, Instrucao[20:16], Instrucao[15:11], WriteAddr);

    wire [31:0] Read1; wire [31:0] Read2; wire [31:0] Writedata;

    Multiplex MU32_2(Resultado, MemData, MemToReg, Writedata);

    Registers RF1(clk, RegWrite, Instrucao[25:21], Instrucao[20:16], WriteAddr, Read1, Read2, Writedata);

    Multiplex MU32(Read2, SaidaExtensao, ALUSrc, ALUentrada);

    ALU U01(ALUctrl, Read1, ALUentrada, Resultado, ALUzero);

    DataMemory DM(MemWrite, MemRead, Resultado, Read2, clk, MemData);

endmodule