`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2017 15:42:23
// Design Name: 
// Module Name: ProgramCounter
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

module ProgramCounter (

	input [31:0] EntradaPC,
	input clk,
	input [31:0] inicioPC,
	input rst,
	
	//Sinais de Controle
	input Jump,
	input Branch,
	input AluZero,

	//Branch Address
	input [31:0] BranchAddress,

	//Jump Address
	input [25:0] JumpAddress,

	output reg [31:0] Proximo
	);

	always @(posedge rst) begin
		Proximo = inicioPC;
	end	

	//Jump PC + 4
	wire [31:0] JumpShift;
	assign JumpShift = EntradaPC + 32'd4;

	//Branch Left Shift
	wire [31:0] BranchShift;
	assign BranchShift = BranchAddress << 2;

	//Jump Addres
	// Concatenando os bits
	wire [31:0] JumpFinal;
	assign JumpFinal = {JumpShift[31:28], JumpAddress, 2'b00};

	always @(posedge clk) begin

		if (Branch && AluZero) begin
			Proximo = EntradaPC + 32'd4 + BranchShift;
			$display("\nBranch Ativo | Proximo Addr -> %d", Proximo);
		end
		else if (Jump) begin
			Proximo = JumpAddress;
			$display("\nJump Ativo | Proximo Addr -> Proximo %d", Proximo);			
		end
		else begin
			Proximo = EntradaPC + 32'd4;
			$display("\nO PC foi incrementado.\n");
		end
	end
	


endmodule