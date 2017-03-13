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
input [31:0] WriteData;
output [31:0] ReadData1;
output [31:0] ReadData2;


reg [31:0] regs [0:31];

integer i;

initial     //initialize all RAM cells to 0 at startup
  begin
  for (i=0; i <= 31; i = i + 1)
    regs[i] = 0;
  end

always @(posedge clk) begin
  if (RegWrite == 1'b1)
    begin
    #10
    $display($time," writing %m regindex=%b val=%b",WriteAddr,WriteData);
    regs[WriteAddr] = WriteData;
    end
end

assign ReadData1 = regs[ReadAddr1];
assign ReadData2 = regs[ReadAddr2];

endmodule
