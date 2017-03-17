
module InstrucMemory(
    input [31:0] Address,
    output reg [31:0] Instruction
    );
    
    always @ (Address) begin
        case (Address)
        
            /*
            * Test 1:
              Add, addi, lw, sw, beq
             */
            /*
            main:    
                    li $t0, 50                   # Initialize the array to (50, 40, 30)
                    sw $t0, 0($0)                # Store first value
                    li $t0, 40              
                    sw $t0, 4($0)                # Store Second Value
                    li $t0, 30              
                    sw $t0, 8($0)                # Store Third Value
                    li $a0, 0                    # address of array
                    li $a1, 3                    # 3 values to sum
            TestProg1:                      
                    add $t0, $0, $0            # This is the sum
                    add $t1, $0, $a0            # This is our array pointer
                    add $t2, $0, $0            # This is our index counter
            P1Loop:    beq $t2, $a1, P1Done    # Our loop
                    lw    $t3, 0($t1)                # Load Array[i]
                    add $t0, $t0, $t3            # Add it into the sum
                    add $t1, $t1, 4            # Next address
                    add $t2, $t2, 1            # Next index
                    j P1Loop                        # Jump to loop
            P1Done:    sw $t0, 0($t1)            # Store the sum at end of array
                    lw $t0, 12($0)              # Load Final Value
                    nop                            # Complete
            */
            
            32'h00: Instruction = 32'h34080032;
            32'h04: Instruction = 32'hac080000;
            32'h08: Instruction = 32'h34080028;
            32'h0C: Instruction = 32'hac080004;
            32'h10: Instruction = 32'h3408001e;
            32'h14: Instruction = 32'hac080008;
            32'h18: Instruction = 32'h34040000;
            32'h1C: Instruction = 32'h34050003;
            32'h20: Instruction = 32'h00004020;
            32'h24: Instruction = 32'h00044820;
            32'h28: Instruction = 32'h00005020;
            32'h2C: Instruction = 32'h11450005;
            32'h30: Instruction = 32'h8d2b0000;
            32'h34: Instruction = 32'h010b4020;
            32'h38: Instruction = 32'h21290004;
            32'h3C: Instruction = 32'h214a0001;
            32'h40: Instruction = 32'h0800000b;
            32'h44: Instruction = 32'had280000;
            32'h48: Instruction = 32'h8c08000c;
            32'h4C: Instruction = 32'h00000000;

            32'h60: Data = 32'h34040020;
            32'h64: Data = 32'h20020001;
            32'h68: Data = 32'h00021822;
            32'h6C: Data = 32'h0060282a;
            32'h70: Data = 32'h00453020;
            32'h74: Data = 32'h00a63825;
            32'h78: Data = 32'h00a74022;
            32'h7C: Data = 32'h01074824;
            32'h80: Data = 32'hac890000;
            32'h84: Data = 32'h8c090020;
            32'h88: Data = 32'h00000000;
            default: Instruction = 32'hXXXXXXXX;
        endcase
    end
    
endmodule
