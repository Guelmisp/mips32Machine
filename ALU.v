`timescale 1ns / 1ps

module ALU(
    input [3:0] ALUcontrol,
    input signed [31:0] entradaA,
    input signed [31:0] entradaB,
    output reg [31:0] ALUsaida,
    output wire Zero
    );
    wire signed [31:0] sub;
    
    assign sub = entradaA - entradaB;
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
                $display ("\n(ADD) -> Saida ALU: %d", ALUsaida);
            end
            4'b0110: begin
                ALUsaida <= sub; //Sub
                $display ("\n(SUB) -> A= %d,B= %d, A-B: %d", entradaA, entradaB, sub);
            end
            4'b0111: begin
                if (entradaA<entradaB) begin
                    ALUsaida <= 1;
                end
                else begin
                    ALUsaida <= 0;
                end
                $display ("\n(SLT/SLTI) -> A: %d, B: %d | (A<B): %d", entradaA, entradaB, (entradaA<entradaB));
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
