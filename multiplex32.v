`timescale 1ns / 1ps
module multiplex32(
	entradaA,
	entradaB,
	seletor,
	saida
    );

input[31:0] entradaA;
input[31:0] entradaB;
input seletor;

output reg[31:0] saida;

always @(seletor, entradaA, entradaB)
	begin
		if (seletor == 0 )
			saida <= entradaA;
		else
			saida <= entradaB;
	end
endmodule
