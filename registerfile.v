module Registers(
    clk, 
    RegWrite, 
    ReadAddr1, 
    ReadAddr2, 
    WriteAddr, 
    ReadData1, 
    ReadData2, 
    WriteData);

input clk, RegWrite;
input [4:0] ReadAddr1, ReadAddr2, WriteAddr;
input signed [31:0] WriteData;
output [31:0] ReadData1;
output [31:0] ReadData2;


reg [31:0] regs [0:31];

integer i;

//Inicializando todas as memorias disponiveis
initial
  begin
  for (i=0; i <= 31; i = i + 1)
    regs[i] = 0;
  end

//Verificando se o bit RegWrite esta ativo para escrever no registrador
always @(posedge clk) begin
  if (RegWrite == 1) begin
        $display($time," Escrevendo %m - Registrador=%d |valor=%d",WriteAddr,WriteData);
        regs[WriteAddr] = WriteData;
  end
end

assign ReadData1 = regs[ReadAddr1];
assign ReadData2 = regs[ReadAddr2];

endmodule