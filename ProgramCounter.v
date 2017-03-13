module ProgramCounter (

	input [31:0] EntradaPC;
	input clk,
	
	//Sinais de Controle
	input Jump,
	input Branch,
	input AluZero,

	//Branch Address
	input [31:0] BranchAddress,

	//Jump Address
	input [31:0] JumpAddress,

	output reg [31:0] Proximo;
	);

	


endmodule