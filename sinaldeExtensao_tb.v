module sinaldeExtensao_tb;
   reg [15:0] entrada;
   wire [31:0] saida;
   
   SinaldeExtensao U0 (
      .entrada (entrada),
      .saida (saida)
   );
   
   initial begin
      $display("\t\t time, \t entrada,\t saida"); 
      $monitor("\t\t %g,\t\t %b, \t %b",$time, entrada, saida); 
      
      entrada = 16'b0111111111111111;
      #50 entrada = 16'b1000000000000000;
      #50 $stop;
   end
endmodule