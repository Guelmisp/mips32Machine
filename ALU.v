`timescale 1ns / 1ps

module ALU(
    input [3:0] ALUcontrol,
    input [31:0] entradaA,
    input [31:0] entradaB,
    output reg [31:0] ALUsaida,
    output wire Zero
    );
 
    assign Zero = (ALUsaida==0);
    
    always @(ALUcontrol, entradaA, entradaB)
        case(ALUcontrol)
            4'b0000: begin
                ALUsaida <= entradaA & entradaB;
                $display ("\n(AND) - > Saida ALU: %b", ALUsaida);
            end //AND
            4'b0001: begin 
                ALUsaida <= entradaA | entradaB; //OR
                $display ("\n(OR) -> Saida ALU: %b", ALUsaida);
            end
            4'b0010: begin
                ALUsaida <= entradaA + entradaB; //Add
                $display ("\n(ADD) -> Saida ALU: %b", ALUsaida);
            end
            4'b0110: begin
                ALUsaida <= entradaA - entradaB; //Sub
                $display ("\n(SUB) -> Saida ALU: %b", ALUsaida);
            end
            4'b0111: begin
                ALUsaida <= entradaA < entradaB ? 1:0; //Set on less than (slt)
                $display ("\n(SLT) -> Saida ALU: %b", ALUsaida);
            end
            4'b1100: begin
                ALUsaida <= ~(entradaA | entradaB); //NOR
                $display ("\n(NOR) -> Saida ALU: %b", ALUsaida);
            end
            default: begin
                ALUsaida <= 0;
                $display ("\nDEFAULT -> Saida ALU: %b", ALUsaida);
            end
        endcase
endmodule
