`timescale 1ns / 1ps

module ALU(
    ALUcontrol,
    entradaA,
    emtradaB,
    AlUsaida,
    Zero
    );

input[3:0] ALUcontrol;
input[31:0] entradaA;
input[31:0] entradaB;

output reg [31:0] ALUsaida;
output Zero;

assign Zero = (ALUOut==0);

always @(ALUcontrol, entradaA, entradaB)
	case(ALUcontrol)
		4'b0000: ALUsaida <= entradaA & entradaB; //AND
		4'b0001: ALUsaida <= entradaA | entradaB; //OR
		4'b0010: ALUsaida <= entradaA + entradaB; //Add
		4'b0110: ALUsaida <= entradaA - entradaB; //Sub
		4'b0111: ALUsaida <= entradaA < entradaB ? 1:0; //Set on less than (slt)
		4'b1100: ALUsaida <= ~(entradaA | entradaB); //NOR
		default: AlUsaida <= 0;
	endcase
endmodule
