`timescale 1ns / 1ps

module simulation_tb;

    //Definindo o clock na maquina
    reg osc;
    initial begin
        osc = 0;
    end
    always begin
        #10 osc = ~osc;
    end
    wire clk;
    assign clk = osc;
    
    
   //Valores do PC
   reg [31:0] EntradaPC;
   reg Jump;
   reg Branch;
   reg AluZero;
   //Branch Address
   reg [31:0] BranchAddress;
   //Jump Address
   reg [25:0] JumpAddress;
   wire [31:0] Proximo;
   
   ProgramCounter PC(
         .EntradaPC (EntradaPC),
         .clk (clk),
         .Jump(Jump),
         .Branch(Branch),
         .AluZero(AluZero),
         .BranchAddress(BranchAddress),
         .JumpAddress(JumpAddress),
         .Proximo(Proximo)
      );
      
      //Valores do Instruction Memory
      reg [31:0] Address;
      wire [31:0] Instruction;
      
      InstrucMemory IM (
         .Address(Address),
         .Instruction(Instruction)
      );
      
      initial begin
            $display("\t\t time,\t Address, \t\t Instructcao"); 
            $monitor("\t\t %g,\t\t %b, \t\t%h",$time, Address, Instruction); 
            
            //Valores Iniciais do PC.
            Address = 32'h0;
            #5 EntradaPC = Address;  Jump = 0; Branch = 0; AluZero = 0;
            #10 Address = Proximo;
            #10 $stop;
      end
      
endmodule
