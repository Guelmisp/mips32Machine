module DataMemory (

	input MemWrite,
	input MemRead,
	input [31:0] Address,
	input [31:0] WriteData,
	input clk,
	output reg [31:0] ReadData);


	//Memoria Total
	reg [31:0] Data[4095:0];
	
	always @(posedge clk) begin
		if (MemRead == 1) begin
			ReadData = Data[Address>>2];
			$display("\nCOMANDO - LW | Valor lido = %d \n", Data[Address>>2]);
			
		end
	end

	always @(negedge clk) begin
		if (MemWrite == 1) begin
			Data[Address>>2] <= WriteData;
			$display("\nCOMANDO - SW | Memoria Anterior [%d] = %d | Novo Valor= %d\n", Address>>2, Data[Address>>2], WriteData);
			
		end
	end


endmodule 