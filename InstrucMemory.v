
module InstrucMemory(
    input [31:0] Address,
    output reg [31:0] Instruction
    );
    
    always @ (Address) begin
        case (Address)
        
            /*
            Programa de Teste MIPS 1
               lw $t0,32($s3)
               lw $t0,32($s3)
               addi $s1, $s2 ,4;
            */
            
            32'h00:  Instruction = 32'h8e680021;
            32'h04:  Instruction = 32'h8e680020;
            32'h08:  Instruction =  32'b00100010011100100000000000000100;
            default: Instruction = 32'hXXXXXXXX;
        endcase
    end
    
endmodule
