
module InstrucMemory(
    input [31:0] Address,
    output reg [31:0] Instruction
    );
    
    always @ (Address) begin
        case (Address) 
            //$t0 - $t7 (8 - 15);
            
            //addi $t0, $0, 2  
            //b001000_00000_01000_0000000000000010 R: $t0 = 2  
            32'h00: Instruction = 32'b00100000000010000000000000000010;
            
            //addi $t1, $t0, 4  
            //b001000_01000_01001_0000000000000100 R: $t0 = 6
             32'h04: Instruction = 32'b00100001000010010000000000000100;
            default: Instruction = 32'hXXXXXXXX;
        endcase
    end
    
endmodule
