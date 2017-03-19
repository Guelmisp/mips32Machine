module InstrucMemory(
    input [31:0] Address,
    output reg [31:0] Instruction
    );
    
    always @ (Address) begin
        case (Address) 
            
            /*                 
            add    $2, $0, 1           # $2 = 1
            sub    $3, $0, $2          # $3 = -1
            slt    $5, $3, $0          # $5 = 1
            add    $6, $2, $5          # $6 = 2
            or     $7, $5, $6          # $7 = 3
            sub    $8, $5, $7          # $8 = -2
            and    $9, $8, $7          # $9 = 2
            sw     $9, 0($a0)          # Store $9 in DMem[0]
            lw     $9, 0($0)           # Load Final Value
            nop                        # Complete
             */
             32'h00: Instruction = 32'h20020001;
             32'h04: Instruction = 32'h00021822;
             32'h08: Instruction = 32'h0060282a;
             32'h0C: Instruction = 32'h00453020;
             32'h10: Instruction = 32'h00a63825;
             32'h14: Instruction = 32'h00a74022;
             32'h18: Instruction = 32'h01074824;
             32'h1C: Instruction = 32'hac890000;
             32'h20: Instruction = 32'h8c090020;
             32'h24: Instruction = 32'h00000000;
            
            default: Instruction = 32'hXXXXXXXX;
        endcase
    end
    
endmodule