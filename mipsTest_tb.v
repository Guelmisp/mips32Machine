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

module executa_tb(clk, rst, inicioPC, Saida);

	input clk;
	input rst;
	input [31:0] inicioPC;
	output [31:0] Saida;

	wire [31:0] PC;
	wire [31:0] Instrucao;
	wire [31:0] ALUentrada, Resultado;
	wire ALUzero;

	//Modulos a serem utulizados
	wire SignExtend;
	wire [31:0] MemData;
	wire [31:0] EntradaBranch;
	SinaldeExtensao SE1(Instrucao[15:0], EntradaBranch);


	wire RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump;
	
	ProgramCounter PC1(PC, clk, inicioPC,rst,Jump,Branch,ALUzero,EntradaBranch,Instrucao[25:0],PC);

	InstrucMemory IM1(PC, Instrucao);	

	wire [1:0] ALUOp;

	Control CU(Instrucao[31:26], RegDst, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, Jump);

	wire [3:0] ALUctrl;

	ALUControl AC(ALUOp, Instrucao[5:0], ALUctrl);

	wire [4:0] WriteAddr;

	multiplex5 MU5(RegDst, Instrucao[20:16], Instrucao[15:11], WriteAddr);

	wire [31:0] Read1; wire [31:0] Read2; wire [31:0] Writedata;

	Registers RF1(clk, RegWrite, Instrucao[25:21], Instrucao[20:16], WriteAddr, Read1, Read2, Writedata);

	Multiplex MU32(Read2, EntradaBranch, ALUSrc, ALUentrada);

	ALU U01(ALUctrl, Read1, ALUentrada, Resultado, ALUzero);

	DataMemory DM(MemWrite, MemRead, Resultado, Read2, clk, MemData);

endmodule

module executaTest(inicioPC, test, rst);

	input [31:0] test;
	output reg rst;
	output reg [31:0] inicioPC;

	initial begin
		rst = 0; inicioPC = 0 * 4;
		#101
		rst = 1;
		#5000
		rst = 0;

		#1 $display("Executando Teste 1 - Resultado: %d\n", test);
	end

endmodule

module m555 (CLK);
   parameter StartTime = 0, Ton = 50, Toff = 50, Tcc = Ton+Toff; // 
 
   output CLK;
   reg 	  CLK;
   
   initial begin
      #StartTime CLK = 0;
   end
   
   // The following is correct if clock starts at LOW level at StartTime //
   always begin
      #Toff CLK = ~CLK;
      #Ton CLK = ~CLK;
   end
endmodule

module mainExec;
    wire [31:0] inicioPC;
    wire [31:0] test;
    wire rst, CLK;   
    
    m555 system_clock(CLK);
	executa_tb CU(CLK, rst, inicioPC, test);
	executaTest ET(inicioPC, test, rst);

endmodule