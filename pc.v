module PC(clk, newPC, PC);

input clk;
input [7:0] newPC;
output [7:0] PC;

reg [7:0] currPC;

initial begin
currPC = 0;
end

always @(posedge clk) begin
  #10
  currPC = newPC;
end

assign PC = currPC;
endmodule
