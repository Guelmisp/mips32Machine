module multiplex5 (
  seletor,
  entradaA,
  entradaB,
  saida
  );
  input seletor;
  input [4:0] entradaA;
  input [4:0] entradaB;
  output reg [4:0] saida;

  always @(seletor, entradaA, entradaB)
    if (seletor == 0)
      saida <= entradaA;
    else
      saida<= entradaB;

endmodule
