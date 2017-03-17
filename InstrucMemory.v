module InstrucMemory(
    input [31:0] Address,
    output reg [31:0] Instruction
    );
    
    always @ (Address) begin
        case (Address) 
        
            //addi $t0, $0, 2  
            //b001000_00000_01000_0000000000000010 R: $t0 = 2  
            32'h00: Instruction = 32'b00100000000010000000000000000010;
            
            //addi $t1, $t0, 4  
            //b001000_01000_01001_0000000000000100 R: $t1 = 6
            32'h04: Instruction = 32'b00100001000010010000000000000100;

            //add $t0, $t1, $t2
            //b000000_01000_01001_01010_00000_100000 R: $t2 = 8
            32'h08: Instruction = 32'b00000001000010010101000000100000;

            
            default: Instruction = 32'hXXXXXXXX;
        endcase
    end
    
endmodule

//Help:
//$t0 - $t7 (8 - 15);

//ADD opcode(6) rs(5) rt(5) rd(5) shamt(5) funct(6)
//ADD rd = rs + rt


//ADDI rt = rs + val
//ADDI opcode(6) rs(5) rt(5) im(16)


//AND rd = rs & rt
//AND opcode(6) rs(5) rt(5) rd(5) shamt(5) funct(6)

//OR rd = rs | rt
//OR opcode(6) rs(5) rt(5) rd(5) shamt(5) funct(6)

//BEQ

//BNE

//LW

//SW

//SLT

//SLTI

//J